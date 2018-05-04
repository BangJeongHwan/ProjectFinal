package kh.com.a.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.BasketDao;
import kh.com.a.model.BasketDto;
import kh.com.a.model2.BasketParam;

@Repository
public class BasketDaoImpl implements BasketDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "Basket.";

	@Override
	public boolean addMuBasket(BasketDto bsk) throws Exception {
		return sqlSession.insert(ns+"addMuBasket", bsk)>0?true:false;
	}
	
	@Override
	public List<BasketParam> getBasketListByMid(String mid) throws Exception {
		return sqlSession.selectList(ns+"getBasketListByMid", mid);
	}

	@Override
	public boolean delBskByBkseq(int[] bkseq) throws Exception {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("bkseq", bkseq);
		return sqlSession.delete(ns+"delBskByBkseq", hm)>0?true:false;
	}

//////////////////////	TODO 0419
	
	@Override
	public List<BasketParam> getBskListByBkseq(int[] bkseq) throws Exception {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("bkseq", bkseq);
		return sqlSession.selectList(ns+"getBskListByBkseq", hm);
	}

	@Override
	public List<Integer> getRvseqByBkseq(int[] bkseq) throws Exception {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("bkseq", bkseq);
		return sqlSession.selectList(ns+"getRvseqByBkseq", hm);
	}

	@Override
	public boolean addCdBasket(BasketDto bsk) throws Exception {
		return sqlSession.insert(ns+"addCdBasket", bsk)>0?true:false;
	}

	@Override
	public int getNextBkseq() throws Exception {
		return sqlSession.selectOne(ns+"getNextBkseq");
	}

}
