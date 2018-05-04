package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.PaymentDao;
import kh.com.a.model.CpoDto;
import kh.com.a.model.PaymentDto;
import kh.com.a.model2.PaymentViewParam;
import kh.com.a.service.PaymentServ;

@Service
public class PaymentServImpl implements PaymentServ {
	
	@Autowired
	private PaymentDao payDao;

	@Override
	public int getNextGrnum() throws Exception {
		return payDao.getNextGrnum();
	}

	@Override
	public boolean addPayment(PaymentDto payDto) throws Exception {
		return payDao.addPayment(payDto);
	}

	@Override
	public List<PaymentViewParam> getPaymentListByGrnum(int grnum) throws Exception {
		return payDao.getPaymentListByGrnum(grnum);
	}

	@Override
	public int getNextCposeq() throws Exception {
		return payDao.getNextCposeq();
	}

	@Override
	public boolean addCpo(CpoDto cpoDto) throws Exception {
		return payDao.addCpo(cpoDto);
	}

	@Override
	public boolean addPaymentCard(PaymentDto payDto) throws Exception {
		return payDao.addPaymentCard(payDto);
	}

}
