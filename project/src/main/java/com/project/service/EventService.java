package com.project.service;

import java.util.List;

import com.project.vo.EventVO;

public interface EventService {
  public int createEvent(EventVO vo)throws Exception;
  public List<EventVO> listAll()throws Exception;
  public List<EventVO> listBanner()throws Exception;
}
