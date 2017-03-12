package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.CookDAO;
import com.project.tool.Criteria;
import com.project.vo.CookVO;

@Service
public class CookServiceImpl implements CookService{
  @Inject
  private CookDAO dao;
  
  @Override
  public int regisertCook(CookVO vo) throws Exception {
    // TODO Auto-generated method stub
    return dao.insertCook(vo);
  }

  @Override
  public List<CookVO> list(Criteria cri) throws Exception {
    // TODO Auto-generated method stub
    return dao.listCriteria(cri);
  }

  @Override
  public int listCountPaging(Criteria cri) throws Exception {
    // TODO Auto-generated method stub
    return dao.countPaging(cri);
  }

  @Override
  public CookVO read(int cno) throws Exception {
    // TODO Auto-generated method stub
    return dao.listOne(cno);
  }

  @Override
  public String FileSelect(int cno) throws Exception {
    // TODO Auto-generated method stub
    return dao.selectFile(cno);
  }

  @Override
  public List<CookVO> listStrong() throws Exception {
    // TODO Auto-generated method stub
    return dao.selectStrong();
  }

  @Override
  public List<CookVO> indexList() throws Exception {
    // TODO Auto-generated method stub
    return dao.mainList();
  }

  @Override
  public List<CookVO> listAll() throws Exception {
    // TODO Auto-generated method stub
    return dao.allList();
  }

  @Override
  public int checkDisplay(CookVO vo) throws Exception {
    // TODO Auto-generated method stub
    return dao.displayCheck(vo);
  }

  @Override
  public int checkStrong(CookVO vo) throws Exception {
    // TODO Auto-generated method stub
    return dao.strongCheck(vo);
  }

@Override
public int maxNum() throws Exception {
	// TODO Auto-generated method stub
	return dao.maxNum();
}

@Override
public int delete(int cno) throws Exception {
	// TODO Auto-generated method stub
	return dao.delete(cno);
}

@Override
public int modify(CookVO vo) throws Exception {
	// TODO Auto-generated method stub
	return dao.modify(vo);
}

@Override
public int checkClosed(CookVO vo) throws Exception {
	// TODO Auto-generated method stub
	return dao.closedCheck(vo);
}

@Override
public int checkDeleted(CookVO vo) throws Exception {
	// TODO Auto-generated method stub
	return dao.deletedCheck(vo);
}

@Override
public int checkSale(CookVO vo) throws Exception {
	// TODO Auto-generated method stub
	return dao.saleCheck(vo);
}

@Override
public List<CookVO> selectSale() throws Exception {
	// TODO Auto-generated method stub
	return dao.selectSale();
}

}
