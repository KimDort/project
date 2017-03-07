package com.project.dao;

import java.util.List;

import com.project.vo.CtgroupVO;

public interface CtgroupDAO {
	public List<CtgroupVO> AllList()throws Exception;
	public CtgroupVO OneList(int ctgroup)throws Exception;
}
