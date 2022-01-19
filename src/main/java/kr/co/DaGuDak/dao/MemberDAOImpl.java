package kr.co.DaGuDak.dao;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.DaGuDak.model.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession SqlSession;

	@Override
	public void register(MemberVO vo) throws Exception {
		SqlSession.insert("member.insert", vo);
	}

	@Override // 회원가입 Id 확인
	public int idChk(String member_id) throws Exception {
		int result = SqlSession.selectOne("member.idChk", member_id);
		return result;
	}

	@Override // 로그아웃
	public void logout(HttpSession session) throws Exception {

	}

	@Override // 로그인 확인
	public boolean loginCheck(MemberVO vo) throws Exception {
		String name = SqlSession.selectOne("member.loginCheck", vo);

		return (name == null) ? false : true;
	}

	@Override
	public MemberVO viewMember(MemberVO vo) throws Exception {
		SqlSession.selectOne("member.viewMember", vo);
		return SqlSession.selectOne("member.viewMember", vo);
	}

	@Override
	public void updateMember(MemberVO vo) throws Exception {
		SqlSession.update("member.updateMember", vo);

	}

	@Override
	public MemberVO userInfo(String member_id) throws Exception {
		return SqlSession.selectOne("member.userInfo", member_id);

	}

	@Override
	public boolean passwordChk(MemberVO vo) throws Exception {
		int check = SqlSession.selectOne("member.passwordChk", vo);

		return (check == 0) ? false : true;
	}

	@Override
	public void chargePoint(MemberVO vo) throws Exception {
		SqlSession.update("member.chargePoint", vo);
	}

	@Override
	public void deleteMember(String member_id) throws Exception {
		SqlSession.delete("member.deleteMember", member_id);
	}

	@Override
	public void updateWin(String member_id) throws Exception {
		SqlSession.update("member.updateWin",member_id);

	}

	@Override
	public void updateGames(String member_id) throws Exception {
		SqlSession.update("member.updateGames",member_id);
		
	}

}
