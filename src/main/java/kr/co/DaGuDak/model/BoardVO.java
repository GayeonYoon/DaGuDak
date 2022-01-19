package kr.co.DaGuDak.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BoardVO {
	private int bno;
	private int bid;
	private int reply;
	private String title;
	private String content;
	private String writer;
	private String password;
	private Date regdate;
	private int viewcnt;
	private String file_name;
	private String file_rename;
	private long file_size;
	private MultipartFile file;
	private int cmtcount;
	
	private int curPage = 1;
	private String searchOption = "title";
	private String keyword = "";
}
