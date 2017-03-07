package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.tool.Criteria;
import com.project.tool.SearchCriteria;
import com.project.vo.CategoryVO;
import com.project.vo.CtgroupVO;
import com.project.vo.ThingVO;

@Repository
public class ThingDAOImpl implements ThingDAO {
	@Inject
	private SqlSession session;

	@Override
	public int insertThing(ThingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("com.mapper.thing.insertThing", vo);
	}

	@Override
	public List<ThingVO> listCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.thing.listPage", cri);
	}

	@Override
	public int countPaging(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.thing.countPaging", cri);
	}

	@Override
	public ThingVO listOne(int nno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.thing.read", nno);
	}

	@Override
	public String selectFile(int nno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.thing.selectFile", nno);
	}

	@Override
	public List<ThingVO> allList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.thing.allList");
	}

	@Override
	public int totalCount() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.thing.totalCount");
	}

	@Override
	public List<CtgroupVO> groupList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.thing.ctgroup");
	}

	@Override
	public List<CategoryVO> categoryList(int ctgroup) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.thing.categoryselect", ctgroup);
	}

	@Override
	public int CtgroupInsert(CtgroupVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("com.mapper.thing.insertCtgroup",vo);
	}

	@Override
	public int CategoryInsert(CategoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("com.mapper.thing.insertCategory",vo);
	}

	@Override
	public int CategoryDelete(int ctno) throws Exception {
		// TODO Auto-generated method stub
		return session.delete("com.mapper.thing.deleteCategory",ctno);
	}

	@Override
	public int CtgroupDelete(int ctgroup) throws Exception {
		// TODO Auto-generated method stub
		return session.delete("com.mapper.thing.deleteCtgroup",ctgroup);
	}

	@Override
	public List<CategoryVO> categoryAllList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.thing.categoryAllList");
	}

	@Override
	public List<ThingVO> thingInfo(CategoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.thing.selectInfo",vo);
	}

	@Override
	public int modify(ThingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.thing.ThingUpdate",vo);
	}

	@Override
	public int delete(int tno) throws Exception {
		// TODO Auto-generated method stub
		return session.delete("com.mapper.thing.ThingDelete",tno);
	}
}
