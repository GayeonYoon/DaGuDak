package kr.co.DaGuDak.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.co.DaGuDak.dao.MemberDAO;
import kr.co.DaGuDak.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO dao;

	@Override // 회원가입
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}

	@Override // Id 중복 체크
	public int idChk(String member_id) throws Exception {
		int result = dao.idChk(member_id);
		return result;
	}

	@Override // 로그아웃
	public void logout(HttpSession session) {
		session.invalidate(); // 세션 삭제

	}
	@Override
	public boolean loginCheck(MemberVO vo, HttpSession session) throws Exception {
		boolean result = dao.loginCheck(vo);
		if (result) {
			MemberVO vo2 = viewMember(vo);
			session.setAttribute("userId", vo2.getMember_id());
			session.setAttribute("userName", vo2.getName());
		}
		return result;
	}

	@Override
	public MemberVO viewMember(MemberVO vo) throws Exception {
		return dao.viewMember(vo);
	}

	@Override
	public void updateMember(MemberVO vo) throws Exception {
		dao.updateMember(vo);
	}

	@Override
	public void deleteMember(String member_id) throws Exception {
		dao.deleteMember(member_id);
	}

	@Override
	public MemberVO userInfo(String member_id) throws Exception {
		return dao.userInfo(member_id);
	}

	@Override
	public boolean passwordChk(String member_id, MemberVO vo) throws Exception {
		MemberVO vo2 = vo;
		vo2.setMember_id(member_id); 
		return dao.passwordChk(vo2);
	}

	@Override
	public void chargePoint(String member_id, int point) throws Exception {
		MemberVO vo = new MemberVO();
		vo.setMember_id(member_id);
		vo.setPoint(point);
		dao.chargePoint(vo);
	}

	@Override
	public int getPoint(String loginId) throws Exception {
		MemberVO vo = dao.userInfo(loginId);
		return vo.getPoint();
	}

	@Override
	public void updateWin(String member_id) throws Exception {
		dao.updateWin(member_id);
	}

	@Override
	public void updateGames(String member_id) throws Exception {
		dao.updateGames(member_id);
		
	}


}