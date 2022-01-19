package kr.co.DaGuDak.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.DaGuDak.dao.BoardDAO;
import kr.co.DaGuDak.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO boardDao;

	@Override
	public void create(BoardVO vo, HttpServletRequest request) throws Exception {
		String title = vo.getTitle();
		String content = vo.getContent();
		String writer = vo.getWriter();

		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		writer = writer.replace("<", "&lt;");
		writer = writer.replace(">", "&gt;");

		title = title.replace("  ", "&nbsp;&nbsp;");
		writer = writer.replace("  ", "&nbsp;&nbsp;");

		content = content.replace("\n", "<br>");
		
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(writer);
		
		if(vo.getFile().isEmpty() == false)
			insertFile(vo, request);
		
		boardDao.create(vo);
	}

	@Override
	public BoardVO read(int bid, int bno) throws Exception {
		if(bid != 2)
			return boardDao.read(bid, bno);
		else {
			BoardVO vo = new BoardVO();
			vo = this.newsList().get(bno-1);
			return vo;
		}
	}

	@Override
	public boolean update(BoardVO vo, HttpServletRequest request) throws Exception {
		String title = vo.getTitle();
		String content = vo.getContent();
		String writer = vo.getWriter();

		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		writer = writer.replace("<", "&lt;");
		writer = writer.replace(">", "&gt;");

		title = title.replace("  ", "&nbsp;&nbsp;");
		writer = writer.replace("  ", "&nbsp;&nbsp;");

		content = content.replace("\n", "<br>");
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(writer);
		
		if(vo.getFile().isEmpty() == false)
			insertFile(vo, request);
		
		return boardDao.update(vo);
	}

	@Override
	public boolean delete(BoardVO vo) throws Exception {
		return boardDao.delete(vo);
	}

	@Override
	public void increaseViewCnt(int bid, int bno, HttpSession session) throws Exception {
		long update_time = 0;
		if (session.getAttribute("update_time_" + bno) != null) {
			update_time = (long) session.getAttribute("update_time_" + bno);
		}

		long current_time = System.currentTimeMillis();

		if (current_time - update_time > 5 * 1000) {
			boardDao.increaseViewcnt(bid, bno);
			session.setAttribute("update_time_" + bno, current_time);
		}

	}

	@Override
	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword, int bid) throws Exception {
		if(bid ==2 )
			return this.newsList();
		else if(bid != 2)
			return boardDao.listAll(start, end, searchOption, keyword, bid);
		else
			return null;
	}

	@Override
	public int countArticle(int bid, String searchOption, String keyword) throws Exception {
		return boardDao.countArticle(bid, searchOption, keyword);
	}
	
	@Override
	public void insertFile(BoardVO vo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		
		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest)request;

		String root_path = mpRequest.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources\\upload\\";
		String file_name;
		String fileExtension;
		String file_rename;
		long file_size;

		Iterator<String> iterator = mpRequest.getFileNames();

		MultipartFile multipartFile = null;

		File file = new File(root_path + attach_path);
		if (file.exists() == false) {
			file.mkdirs();
		}
					
		while (iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				file_name = multipartFile.getOriginalFilename();
				fileExtension = file_name.substring(file_name.lastIndexOf("."));
				file_rename = UUID.randomUUID().toString().replaceAll("-", "") + fileExtension;
				file_size = multipartFile.getSize();
				vo.setFile_name(file_name);
				vo.setFile_rename(file_rename);
				vo.setFile_size(file_size);
				file = new File(root_path + attach_path + file_rename);
				multipartFile.transferTo(file);
				vo.setFile(multipartFile);
			}
		}
	}

	public List<BoardVO> newsList() throws Exception {
		String clientId = "HogT66eRHJjDf33HyC3i"; // 애플리케이션 클라이언트 아이디값"
		String clientSecret = "OaVcxI1jSW"; // 애플리케이션 클라이언트 시크릿값"

		String text = null;
		try {
			text = URLEncoder.encode("경마", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}

		String apiURL = "https://openapi.naver.com/v1/search/news?query=" + text 
				+ "&display=10&sort=sim"; // display : 검색 결과 개수 제한, 기본값 10//sort : sim (유사도순), date (날짜순, 기본값)
		// String apiURL = "https://openapi.naver.com/v1/search/news.xml?query="+ text;
		// // xml 결과
		
		Map<String, String> requestHeaders = new HashMap<String, String>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = this.getNews(apiURL, requestHeaders);
		JSONParser parser = new JSONParser();
		JSONObject jsonObj = null;

		try {
			jsonObj = (JSONObject) parser.parse(responseBody);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		List<BoardVO> newsList = new ArrayList<BoardVO>();
		
		
		JSONArray jsonArr = (JSONArray)jsonObj.get("items"); //개별 검색 결과
		Iterator<Object> iter = jsonArr.iterator();
		
		int i = 1;
		while(iter.hasNext()) {
			BoardVO vo = new BoardVO();
			JSONObject item = (JSONObject) iter.next();
			vo.setTitle((String)item.get("title"));
			String url = (String)item.get("originallink");
			vo.setContent((String)item.get("description")+"<br><br><br>출처 바로가기: <a href='" + url + "'>" + url + "</a>");
			String pubDate = (String) item.get("pubDate");
			Date date = new Date(pubDate);
			vo.setRegdate(date);
			vo.setBid(2);
			vo.setBno(i++);
			vo.setWriter("외부 사이트");
			newsList.add(vo);
		}

		return newsList;
	}
	
	private String getNews(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}
			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();
			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}
			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}
}
