package kh.com.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.PaymentDao;
import kh.com.a.model.CpoDto;
import kh.com.a.model.PaymentDto;
import kh.com.a.model2.PaymentViewParam;

@Repository
public class PaymentDaoImpl implements PaymentDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	String ns = "Payment.";

	@Override
	public int getNextGrnum() throws Exception {
		return sqlSession.selectOne(ns+"getNextGrnum");
	}

	@Override
	public boolean addPayment(PaymentDto payDto) throws Exception {
		return sqlSession.insert(ns+"addPayment", payDto)>0?true:false;
	}

	@Override
	public List<PaymentViewParam> getPaymentListByGrnum(int grnum) throws Exception {
		return sqlSession.selectList(ns+"getPaymentListByGrnum", grnum);
	}

	@Override
	public int getNextCposeq() throws Exception {
		return sqlSession.selectOne(ns+"getNextCposeq");
	}

	@Override
	public boolean addCpo(CpoDto cpoDto) throws Exception {
		return sqlSession.insert(ns+"addCpo", cpoDto)>0?true:false;
	}

	@Override
	public boolean addPaymentCard(PaymentDto payDto) throws Exception {
		return sqlSession.insert(ns+"addPaymentCard", payDto)>0?true:false;
	}
	
	
	
	
}
