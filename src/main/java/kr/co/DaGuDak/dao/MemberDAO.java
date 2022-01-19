package kr.co.DaGuDak.dao;

import javax.servlet.http.HttpSession;

import kr.co.DaGuDak.model.MemberVO;

public interface MemberDAO {

	// 회원가입
	public void register(MemberVO vo) throws Exception;

	// 아이디 중복체크
	public int idChk(String member_id) throws Exception;

	// 로그인체크
	public boolean loginCheck(MemberVO vo) throws Exception;

	public MemberVO viewMember(MemberVO vo) throws Exception;

	// 로그아웃
	public void logout(HttpSession session) throws Exception;

	public void updateMember(MemberVO vo) throws Exception;

	public MemberVO userInfo(String member_id) throws Exception;

	public boolean passwordChk(MemberVO vo) throws Exception;

	public void chargePoint(MemberVO vo) throws Exception;

	public void deleteMember(String member_id) throws Exception;

	public void updateWin(String member_id) throws Exception;

	public void updateGames(String member_id) throws Exception;


}
//Service에서 보내주는 파라미터들을 DAO에서 받아줍니다.
//받은 파라미터(MemberVO)는 memberMapper.xml에 id가 checkId인 곳으로 보내주고
//쿼리를 조회한 결과는 result로 return해준다.