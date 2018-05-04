package kh.com.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.CardDao;
import kh.com.a.model.CDetailParam;
import kh.com.a.model.CardDetailDto;
import kh.com.a.model.CardDto;
import kh.com.a.model.CardParam;

@Repository
public class CardDaoImpl implements CardDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "Card.";

	@Override
	public List<CardDto> clist() throws Exception {
		return sqlSession.selectList(ns + "clist");
	}
	
	@Override
	public List<CardDto> pagingclist(CardParam dto) throws Exception {
		return sqlSession.selectList(ns + "pagingclist", dto);
	}
	
	@Override
	public List<CardDetailDto> cdlist(int wiseq) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns + "cdlist", wiseq);
	}
	
	@Override
	public boolean cardwrite(CardDto dto) throws Exception {
		int n = sqlSession.insert(ns + "cardwrite", dto);
		return n>0?true:false;
	}

	@Override
	public CardDetailDto carddetail(int cdseq) throws Exception {
		return sqlSession.selectOne(ns + "cdetail", cdseq);
	}

	@Override
	public void clupdate(CardDto dto) throws Exception {
		sqlSession.update(ns + "clupdate", dto);
	}


	@Override
	public boolean cdwrite(CardDetailDto dto) throws Exception {
		int n = sqlSession.insert(ns + "cdwrite", dto);
		return true;
	}

	@Override
	public CardDto ccdetail(int wiseq) throws Exception {
		return sqlSession.selectOne(ns + "ccdetail", wiseq);
	}

	@Override
	public void ccupdate(CardDto dto) throws Exception {
		sqlSession.update(ns + "ccupdate", dto);
	}

	@Override
	public boolean ccdelete(int cdseq) throws Exception {
		int n = sqlSession.delete(ns + "ccdelete", cdseq);
		return true;
	}

	@Override
	public int clistcount(CardParam dto) throws Exception {
		int num = 0;		
		num = sqlSession.selectOne(ns+"clistcount", dto);
		return num;
	}


	@Override
	public List<CardDetailDto> pagingcdlist(CDetailParam dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns + "pagingcdlist", dto);
	}

	@Override
	public int cdlistcount(CDetailParam dto) throws Exception {
		int num = 0;
		num = sqlSession.selectOne(ns + "cdlistcount", dto);
		return num;
	}

	@Override
	public List<CardDetailDto> ordercdlist(CDetailParam dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns + "pagingcdlist", dto);
	}

	@Override
	public CardDto cidckeck(String cid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns + "cidcheck", cid);
	}

	@Override
	public int getseq() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns + "getseq");
	}

	@Override
	public boolean cdupdate(CardDetailDto dto) throws Exception {
		// TODO Auto-generated method stub
		int num = sqlSession.update(ns+"cdupdate", dto);
		return true;
	}

	

	
	

}
