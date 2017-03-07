package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
		return session.selectOne("com.mapper.member.checkId",id);
	}

	@Override
	public MemberVO selectuser(int mno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.member.selectuser",mno);
	}
	
	

}
