package com.project.service;

import java.util.List;

import com.project.vo.CtgroupVO;

public interface CtgroupService {
	public List<CtgroupVO> AllList()throws Exception;
	public CtgroupVO OneList(int ctgroup)throws Exception;
}
