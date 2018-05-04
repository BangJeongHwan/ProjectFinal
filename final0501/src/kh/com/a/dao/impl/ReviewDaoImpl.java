package kh.com.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.ReviewDao;
import kh.com.a.model.ReviewDto;
import kh.com.a.model.ReviewParam;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "Review.";


	@Override
	public boolean rwrite(ReviewDto dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(ns + "rwrite", dto)>0?true:false;
	}


	@Override
	public int getRseq() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns + "getRseq");
	}


	@Override
	public int rlistcount(ReviewParam dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns + "rlistcount" , dto);
	}


	@Override
	public List<ReviewDto> pagingrlist(ReviewParam dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns + "pagingrlist", dto);
	}


	@Override
	public List<ReviewDto> myrlist(ReviewParam dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns +"myrlist", dto);
	}


	@Override
	public int mrlistcount(ReviewParam dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns + "mrlistcount", dto);
	}


	@Override
	public ReviewDto rdetail(int rseq) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns +"rdetail", rseq);
	}
	
	@Override
	public List<ReviewDto> WDlist(int rpdseq) throws Exception {
		return sqlSession.selectList(ns+"wdlist", rpdseq);
	}


	@Override
	public boolean writeWdlist(ReviewDto dto) throws Exception {
		return sqlSession.insert(ns+"writeWdlist", dto)>0?true:false;
	}
	
	
}
