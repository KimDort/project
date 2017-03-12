package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.tool.SearchCriteria;
import com.project.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	private SqlSession session;

	@Override
	public int insert(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("com.mapper.member.create", vo);
	}

	@Override
	public int login(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.member.login", vo);
	}

	@Override
	public MemberVO userinfo(String id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.member.userinfo", id);
	}

	@Override
	public int userconfirm(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.member.confrim", vo);
	}

	@Override
	public int confirm2(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.member.confirm2", vo);
	}

	@Override
	public int maxNum() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.member.maxNum");
	}

	@Override
	public List<MemberVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.member.listAll");
	}

	@Override
	public int checkId(String id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.member.checkId", id);
	}

	@Override
	public MemberVO selectuser(int mno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.member.selectuser", mno);
	}

	@Override
	public int countPaging() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.member.countPaging");
	}

	@Override
	public List<MemberVO> listPage(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.member.listPage", cri);
	}

	@Override
	public int delete(int mno) throws Exception {
		// TODO Auto-generated method stub
		return session.delete("com.mapper.member.memberDelete", mno);
	}

	@Override
	public int checkConfirm(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.member.confirm",vo);
	}

	@Override
	public int checkMlevel(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.member.mlevel", vo);
	}

	@Override
	public int checkMdrop(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.member.mdrop",vo);
	}

	@Override
	public int checkPoint(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.member.point",vo);
	}

	@Override
	public int userModify(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.member.updateMemberUser", vo);
	}

	@Override
	public int adminModify(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.member.updateMemberAdmin", vo);
	}

}
