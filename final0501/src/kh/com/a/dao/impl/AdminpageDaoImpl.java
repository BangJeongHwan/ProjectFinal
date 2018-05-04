package kh.com.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.AdminpageDao;
import kh.com.a.model.BasketDto;
import kh.com.a.model.CompanyDto;

@Repository
public class AdminpageDaoImpl implements AdminpageDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "AdminPage.";

	@Override
	public boolean getupdategrade(String cid) throws Exception {
		return sqlSession.update(ns+"getupdategrade", cid)>0?true:false;
	}

	@Override
	public boolean getdelete(String cid) throws Exception {
		return sqlSession.update(ns+"getdelete", cid)>0?true:false;
	}

	@Override
	public List<CompanyDto> getallcompany() throws Exception {
		return sqlSession.selectList(ns+"getallcompany");
	}
}
