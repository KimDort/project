package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.NoticeDAO;
import com.project.tool.Criteria;
import com.project.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService{
  @Inject
  private NoticeDAO dao;
  
  @Override
  public int regisertNotice(NoticeVO vo) throws Exception {
    // TODO Auto-generated method stub
    return dao.insertNotice(vo);
  }

  @Override
  public List<NoticeVO> list(Criteria cri) throws Exception {
    // TODO Auto-generated method stub
    return dao.listCriteria(cri);
  }

  @Override
  public int listCountPaging(Criteria cri) throws Exception {
    // TODO Auto-generated method stub
    return dao.countPaging(cri);
  }

  @Override
  public NoticeVO read(int nno) throws Exception {
    // TODO Auto-generated method stub
    return dao.listOne(nno);
  }

  @Override
  public String FileSelect(int nno) throws Exception {
    // TODO Auto-generated method stub
    return dao.selectFile(nno);
  }

  @Override
  public List<NoticeVO> listStrong() throws Exception {
    // TODO Auto-generated method stub
    return dao.selectStrong();
  }

  @Override
  public List<NoticeVO> indexList() throws Exception {
    // TODO Auto-generated method stub
    return dao.mainList();
  }

  @Override
  public List<NoticeVO> listAll() throws Exception {
    // TODO Auto-generated method stub
    return dao.allList();
  }

  @Override
  public int checkDisplay(NoticeVO vo) throws Exception {
    // TODO Auto-generated method stub
    return dao.displayCheck(vo);
  }

  @Override
  public int checkStrong(NoticeVO vo) throws Exception {
    // TODO Auto-generated method stub
    return dao.strongCheck(vo);
  }

@Override
public int maxNum() throws Exception {
	// TODO Auto-generated method stub
	return dao.maxNum();
}

@Override
public int modify(NoticeVO vo) throws Exception {
	// TODO Auto-generated method stub
	return dao.modify(vo);
}

@Override
public int checkClosed(NoticeVO vo) throws Exception {
	// TODO Auto-generated method stub
	return dao.closedCheck(vo);
}

@Override
public int checkDeleted(NoticeVO vo) throws Exception {
	// TODO Auto-generated method stub
	return dao.deletedCheck(vo);
}

@Override
public int delete(int nno) throws Exception {
	// TODO Auto-generated method stub
	return dao.delete(nno);
}

}
