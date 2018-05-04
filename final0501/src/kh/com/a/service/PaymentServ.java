package kh.com.a.service;

import java.util.List;

import kh.com.a.model.CpoDto;
import kh.com.a.model.PaymentDto;
import kh.com.a.model2.PaymentViewParam;

public interface PaymentServ {

	public int getNextGrnum() throws Exception;
	public boolean addPayment(PaymentDto payDto) throws Exception;
	public List<PaymentViewParam> getPaymentListByGrnum(int grnum) throws Exception;
	public int getNextCposeq() throws Exception;
	public boolean addCpo(CpoDto cpoDto) throws Exception;
	public boolean addPaymentCard(PaymentDto payDto) throws Exception;
//	혜영
	public List<Integer> getGrnumListByMid(String mid) throws Exception;
	public List<PaymentViewParam> getPaymentListByMid(String mid) throws Exception;
	public CpoDto getCpoBycposeq(int cposeq) throws Exception;
	public List<PaymentViewParam> getPaymentListByCid(String cid, String auth) throws Exception;
	

}
