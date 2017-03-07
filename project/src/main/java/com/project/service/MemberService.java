package com.project.service;

import java.util.List;

import com.project.vo.MemberVO;

public interface MemberService {
 
  public int resister(MemberVO vo)throws Exception;
  public int signin(MemberVO vo)throws Exception;
  public MemberVO info(String id)throws Exception;
  public int confirm(MemberVO vo)throws Exception;
  public int confirm2(MemberVO vo)throws Exception;
  public int maxMember()throws Exception;
  public List<MemberVO> listAll()throws Exception;
  public int checkId(String id)throws Exception;
  public MemberVO selectuser(int mno)throws Exception;
}
