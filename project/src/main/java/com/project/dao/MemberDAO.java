package com.project.dao;

import java.util.List;

import com.project.vo.MemberVO;

public interface MemberDAO {
  public int insert(MemberVO vo)throws Exception;
  public int login(MemberVO vo)throws Exception;
  public MemberVO userinfo(String id)throws Exception;
  public int userconfirm(MemberVO vo)throws Exception;
  public int confirm2(MemberVO vo)throws Exception;
  public int maxNum()throws Exception;
  public List<MemberVO> listAll()throws Exception;
  public int checkId(String id)throws Exception;
  public MemberVO selectuser(int mno)throws Exception;
}
