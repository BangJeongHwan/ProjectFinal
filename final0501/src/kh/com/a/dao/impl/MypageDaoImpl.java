package kh.com.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.AdminpageDao;
import kh.com.a.dao.MypageDao;
import kh.com.a.model.BasketDto;
import kh.com.a.model.CompanyDto;
import kh.com.a.model.JjimDto;
import kh.com.a.model.JjimlistDto;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "Jjim.";

	@Override
	public JjimDto getJjim(JjimDto jdto) throws Exception {
		return sqlSession.selectOne(ns+"getjjim", jdto);
	}

	@Override
	public boolean addJjim(JjimDto jdto) throws Exception {
		return sqlSession.insert(ns+"addjjim", jdto)>0?true:false;
	}

	@Override
	public boolean delJjim(JjimDto jdto) throws Exception {
		return sqlSession.delete(ns+"deljjim", jdto)>0?true:false;
	}

	@Override
	public List<JjimDto> getJjimlist() throws Exception {
		return sqlSession.selectList(ns+"getJjimlist");
	}

	@Override
	public JjimlistDto getJjimStudio(int seq) throws Exception {
		return sqlSession.selectOne(ns+"getJjimStudio",seq);
	}
}
