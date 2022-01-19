package kr.co.DaGuDak.service;

import javax.servlet.http.HttpSession;

import kr.co.DaGuDak.model.MemberVO;

public interface MemberService {
	public void register(MemberVO vo) throws Exception;

	public int idChk(String member_id) throws Exception;

	public void logout(HttpSession session);

	public boolean loginCheck(MemberVO vo, HttpSession session) throws Exception;

	public MemberVO viewMember(MemberVO vo) throws Exception;
  
	public void updateMember(MemberVO vo) throws Exception;

	public MemberVO userInfo(String member_id) throws Exception;
	
	public void chargePoint(String member_id, int point) throws Exception;

	public boolean passwordChk(String member_id, MemberVO vo) throws Exception;

	public int getPoint(String loginId)throws Exception;
	
	public void deleteMember(String member_id) throws Exception;

	public void updateWin(String member_id) throws Exception;

	public void updateGames(String member_id) throws Exception;

}
