package kh.com.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.MakeupDao;
import kh.com.a.model.MakeupDto;
import kh.com.a.model.MuProductDto;
import kh.com.a.model2.MuPagingParam;

@Repository
public class MakeupDaoImpl implements MakeupDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "Makeup.";

	@Override
	public boolean addMakeup(MakeupDto muDto) throws Exception {
		return sqlSession.insert(ns+"addMakeup", muDto)>0?true:false;
	}

	@Override
	public int getMuseq() throws Exception {
		return sqlSession.selectOne(ns+"getMuseq");
	}

	@Override
	public boolean addMuProduct(MuProductDto muPd) throws Exception {
		return sqlSession.insert(ns+"addMuProduct", muPd)>0?true:false;
	}

	@Override
	public List<MakeupDto> getMakeupAllList() throws Exception {
		return sqlSession.selectList(ns+"getMakeupAllList");
	}

	@Override
	public MakeupDto getMakeupByMuseq(int museq) throws Exception {
		return sqlSession.selectOne(ns+"getMakeupByMuseq", museq);
	}

	@Override
	public List<MuProductDto> getMuProductListByMuseq(int museq) throws Exception {
		return sqlSession.selectList(ns+"getMuProductListByMuseq", museq);
	}

	@Override
	public boolean delMuProductByMuseq(int museq) throws Exception {
		return sqlSession.delete(ns+"delMuProductByMuseq", museq)>0?true:false;
	}

	@Override
	public boolean delMakeupByMuseq(int museq) throws Exception {
		return sqlSession.delete(ns+"delMakeupByMuseq", museq)>0?true:false;
	}

	@Override
	public boolean modMakeup(MakeupDto muDto) throws Exception {
		return sqlSession.update(ns+"modMakeup", muDto)>0?true:false;
	}

	@Override
	public int getMakeupAllCnt(MuPagingParam param) throws Exception {
		return sqlSession.selectOne(ns+"getMakeupAllCnt", param);
	}

	@Override
	public List<MakeupDto> getMakeupMainList(MuPagingParam param) throws Exception {
		System.out.println("-category : " + param.getS_category());
		System.out.println("-keyword : " + param.getS_keyword());
		return sqlSession.selectList(ns+"getMakeupMainList", param);
	}

	@Override
	public boolean upReadcnt(int museq) throws Exception {
		return sqlSession.update(ns+"upReadcnt", museq)>0?true:false;
	}

}
