package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.ThingDAO;
import com.project.tool.Criteria;
import com.project.tool.SearchCriteria;
import com.project.vo.CategoryVO;
import com.project.vo.CtgroupVO;
import com.project.vo.ThingVO;

@Service
public class ThingServiceImpl implements ThingService {
	@Inject
	private ThingDAO dao;

	@Override
	public int regisertThing(ThingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.insertThing(vo);
	}

	@Override
	public List<ThingVO> list(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountPaging(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countPaging(cri);
	}

	@Override
	public ThingVO read(int nno) throws Exception {
		// TODO Auto-generated method stub
		return dao.listOne(nno);
	}

	@Override
	public String FileSelect(int nno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFile(nno);
	}

	@Override
	public List<ThingVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.allList();
	}

	@Override
	public int totalCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.totalCount();
	}

	@Override
	public List<CtgroupVO> groupList() throws Exception {
		// TODO Auto-generated method stub
		return dao.groupList();
	}

	@Override
	public List<CategoryVO> categoryList(int ctgroup) throws Exception {
		// TODO Auto-generated method stub
		return dao.categoryList(ctgroup);
	}

	@Override
	public int CtgroupInsert(CtgroupVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.CtgroupInsert(vo);
	}

	@Override
	public int CategoryInsert(CategoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.CategoryInsert(vo);
	}

	@Override
	public int CategoryDelete(int ctno) throws Exception {
		// TODO Auto-generated method stub
		return dao.CategoryDelete(ctno);
	}

	@Override
	public int CtgroupDelete(int ctgroup) throws Exception {
		// TODO Auto-generated method stub
		return dao.CtgroupDelete(ctgroup);
	}

	@Override
	public List<CategoryVO> categoryAllList() throws Exception {
		// TODO Auto-generated method stub
		return dao.categoryAllList();
	}

	@Override
	public List<ThingVO> thingInfo(CategoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.thingInfo(vo);
	}

	@Override
	public int modify(ThingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.modify(vo);
	}

	@Override
	public int delete(int tno) throws Exception {
		// TODO Auto-generated method stub
		return dao.delete(tno);
	}

}
