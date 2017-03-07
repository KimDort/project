package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.project.dao.MemberDAO;
import com.project.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
  @Inject
  private MemberDAO dao;

  @Override
  public int resister(MemberVO vo) throws Exception {
    // TODO Auto-generated method stub
   return dao.insert(vo);
  }

  @Override
  public int signin(MemberVO vo) throws Exception {
    // TODO Auto-generated method stub
    return dao.login(vo);
  }

  @Override
  public MemberVO info(String id) throws Exception {
    // TODO Auto-generated method stub
    return dao.userinfo(id);
  }

  @Override
  public int confirm(MemberVO vo) throws Exception {
    // TODO Auto-generated method stub
    return dao.userconfirm(vo);
  }

@Override
public int confirm2(MemberVO vo) throws Exception {
	// TODO Auto-generated method stub
	return dao.confirm2(vo);
}

@Override
public int maxMember() throws Exception {
	// TODO Auto-generated method stub
	return dao.maxNum();
}

@Override
public List<MemberVO> listAll() throws Exception {
	// TODO Auto-generated method stub
	return dao.listAll();
}

@Override
public int checkId(String id) throws Exception {
	// TODO Auto-generated method stub
	return dao.checkId(id);
}

@Override
public MemberVO selectuser(int mno) throws Exception {
	// TODO Auto-generated method stub
	return dao.selectuser(mno);
}

}
