package com.project.service;

import java.util.List;

import com.project.tool.Criteria;
import com.project.vo.NoticeVO;

public interface NoticeService {
  public int regisertNotice(NoticeVO vo)throws Exception;
  public List<NoticeVO> list(Criteria cri)throws Exception;
  public int listCountPaging(Criteria cri)throws Exception;
  public NoticeVO read(int nno)throws Exception;
  public String FileSelect(int nno)throws Exception;
  public List<NoticeVO> listStrong()throws Exception;
  public List<NoticeVO> indexList()throws Exception;
  public List<NoticeVO> listAll()throws Exception;
  public int checkDisplay(NoticeVO vo)throws Exception;
  public int checkStrong(NoticeVO vo)throws Exception;
  public int maxNum()throws Exception;
}
