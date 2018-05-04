package kh.com.a.service.impl;

import java.util.ArrayList;
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
	

	@Override
	public List<Integer> getGrnumListByMid(String mid) throws Exception {
		return payDao.getGrnumListByMid(mid);
	}

	@Override
	public List<PaymentViewParam> getPaymentListByMid(String mid) throws Exception {
		List<PaymentViewParam> payList = payDao.getPaymentListByMid(mid);
		for (int i = 0; i < payList.size(); i++) {
			if (payList.get(i).getOption1() != null) payList.get(i).getOptionList().add(payList.get(i).getOption1());
			if (payList.get(i).getOption2() != null) payList.get(i).getOptionList().add(payList.get(i).getOption2());
			if (payList.get(i).getOption3() != null) payList.get(i).getOptionList().add(payList.get(i).getOption3());
			if (payList.get(i).getOption4() != null) payList.get(i).getOptionList().add(payList.get(i).getOption4());
			if (payList.get(i).getOption5() != null) payList.get(i).getOptionList().add(payList.get(i).getOption5());
		}
		return payList;
	}

	@Override
	public CpoDto getCpoBycposeq(int cposeq) throws Exception {
		return payDao.getCpoBycposeq(cposeq);
	}
	
	@Override
	public List<PaymentViewParam> getPaymentListByCid(String cid, String auth) throws Exception {
		List<PaymentViewParam> payList = new ArrayList<PaymentViewParam>();
		if (auth.equals("WI")) {
			payList = payDao.getWiPaymentListByCid(cid);
		} else if (auth.equals("MU")) {
			payList = payDao.getMuPaymentListByCid(cid);
		} else {	// "ST"
			payList = payDao.getStPaymentListByCid(cid);
		}
		for (int i = 0; i < payList.size(); i++) {
			if (payList.get(i).getOption1() != null) payList.get(i).getOptionList().add(payList.get(i).getOption1());
			if (payList.get(i).getOption2() != null) payList.get(i).getOptionList().add(payList.get(i).getOption2());
			if (payList.get(i).getOption3() != null) payList.get(i).getOptionList().add(payList.get(i).getOption3());
			if (payList.get(i).getOption4() != null) payList.get(i).getOptionList().add(payList.get(i).getOption4());
			if (payList.get(i).getOption5() != null) payList.get(i).getOptionList().add(payList.get(i).getOption5());
		}
		
		return payList;
	}

}
