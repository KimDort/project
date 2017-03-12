package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.tool.Criteria;
import com.project.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO{
  @Inject
    private SqlSession session;
  
  @Override
  public int insertNotice(NoticeVO vo) throws Exception {
    // TODO Auto-generated method stub
    return session.insert("com.mapper.notice.insertNotice",vo);
  }

  @Override
  public List<NoticeVO> listCriteria(Criteria cri) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList("com.mapper.notice.listPage", cri);
  }

  @Override
  public int countPaging(Criteria cri) throws Exception {
    // TODO Auto-generated method stub
    return session.selectOne("com.mapper.notice.countPaging",cri);
  }

  @Override
  public NoticeVO listOne(int nno) throws Exception {
    // TODO Auto-generated method stub
    return session.selectOne("com.mapper.notice.read",nno);
  }

  @Override
  public String selectFile(int nno) throws Exception {
    // TODO Auto-generated method stub
    return session.selectOne("com.mapper.notice.selectFile",nno);
  }

  @Override
  public List<NoticeVO> selectStrong() throws Exception {
    // TODO Auto-generated method stub
    return session.selectList("com.mapper.notice.selectStrong");
  }

  @Override
  public List<NoticeVO> mainList() throws Exception {
    // TODO Auto-generated method stub
    return session.selectList("com.mapper.notice.mainList");
  }

  @Override
  public List<NoticeVO> allList() throws Exception {
    // TODO Auto-generated method stub
    return session.selectList("com.mapper.notice.allList");
  }

  @Override
  public int displayCheck(NoticeVO vo) throws Exception {
    // TODO Auto-generated method stub
    return session.update("com.mapper.notice.display",vo);
  }

  @Override
  public int strongCheck(NoticeVO vo) throws Exception {
    // TODO Auto-generated method stub
    return session.update("com.mapper.notice.strong",vo);
  }

@Override
public int maxNum() throws Exception {
	// TODO Auto-generated method stub
	return session.selectOne("com.mapper.notice.maxNum");
}

@Override
public int modify(NoticeVO vo) throws Exception {
	// TODO Auto-generated method stub
	return session.update("com.mapper.notice.NoticeUpdate", vo);
}

@Override
public int closedCheck(NoticeVO vo) throws Exception {
	// TODO Auto-generated method stub
	return session.update("com.mapper.notice.closed",vo);
}

@Override
public int deletedCheck(NoticeVO vo) throws Exception {
	// TODO Auto-generated method stub
	return session.update("com.mapper.notice.deleted", vo);
}

@Override
public int delete(int nno) throws Exception {
	// TODO Auto-generated method stub
	return session.delete("com.mapper.notice.noticeDelete",nno);
}

}
