package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.CpoDto;
import kh.com.a.model.PaymentDto;
import kh.com.a.model2.PaymentViewParam;

public interface PaymentDao {
	
	public int getNextGrnum() throws Exception;
	public boolean addPayment(PaymentDto payDto) throws Exception;
	public List<PaymentViewParam> getPaymentListByGrnum(int grnum) throws Exception;
	public int getNextCposeq() throws Exception;
	public boolean addCpo(CpoDto cpoDto) throws Exception;
	public boolean addPaymentCard(PaymentDto payDto) throws Exception;

}