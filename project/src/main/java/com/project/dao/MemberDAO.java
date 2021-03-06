package com.project.dao;

import java.util.List;

import com.project.tool.SearchCriteria;
import com.project.vo.MemberVO;

public interface MemberDAO {
	public int insert(MemberVO vo) throws Exception;

	public int login(MemberVO vo) throws Exception;

	public MemberVO userinfo(String id) throws Exception;

	public int userconfirm(MemberVO vo) throws Exception;

	public int confirm2(MemberVO vo) throws Exception;

	public int maxNum() throws Exception;

	public List<MemberVO> listAll() throws Exception;

	public int checkId(String id) throws Exception;

	public MemberVO selectuser(int mno) throws Exception;

	public int countPaging() throws Exception;

	public List<MemberVO> listPage(SearchCriteria cri) throws Exception;

	public int delete(int mno) throws Exception;

	public int checkConfirm(MemberVO vo) throws Exception;

	public int checkMlevel(MemberVO vo) throws Exception;

	public int checkMdrop(MemberVO vo) throws Exception;

	public int checkPoint(MemberVO vo) throws Exception;

	public int userModify(MemberVO vo) throws Exception;

	public int adminModify(MemberVO vo) throws Exception;
}
