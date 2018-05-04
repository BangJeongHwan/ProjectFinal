package kh.com.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.HoneyDao;
import kh.com.a.model.HoneyBbsDto;
import kh.com.a.model.HoneyMoonDto;
import kh.com.a.model2.HoneyBbsParam;

@Repository
public class HoneyDaoImpl implements HoneyDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "Honey.";
	
	@Override
	public List<HoneyMoonDto> arealist() throws Exception{
		return sqlSession.selectList(ns+"arealist");
	}

	@Override
	public List<HoneyBbsDto> honeyBbsList(HoneyBbsParam param) throws Exception {
		return sqlSession.selectList(ns+"honeyBbsList", param);
	}

	@Override
	public int honeyBbsCount(HoneyBbsParam param) throws Exception {
		return sqlSession.selectOne(ns+"honeyBbsCount", param);
	}

	@Override
	public boolean honeybbswrite(HoneyBbsDto hmDto) throws Exception {
		int n = sqlSession.insert(ns+"honeybbswrite", hmDto); 
		return n>0?true:false;
	}

	@Override
	public HoneyBbsDto honeybbsdetail(int seq) throws Exception {
		return sqlSession.selectOne(ns+"honeybbsdetail", seq);
	}

	@Override
	public void hmBbsReadcount(int seq) throws Exception {
		sqlSession.update(ns+"hmbbsreadcount",seq);		
	}

	@Override
	public void delhmbbs(int seq) throws Exception {
		sqlSession.update(ns+"delhmbbs",seq);		
	}

	@Override
	public boolean uphmbbs(HoneyBbsDto hmDto) throws Exception {
		int n = sqlSession.update(ns+"uphmbbs",hmDto);		
		return n>0?true:false;
	}

}
