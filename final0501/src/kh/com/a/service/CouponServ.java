package kh.com.a.service;

import java.util.List;

import kh.com.a.model.CouponDto;
import kh.com.a.model2.couponVO;

public interface CouponServ {
	public boolean addcoupon(CouponDto coupon) throws Exception;
	public List<CouponDto> couponlist(int sort) throws Exception;
	public List<CouponDto> couponAlllist(int sort) throws Exception;
	//public CouponDto registedCoupon(int sort) throws Exception;
	public boolean regCoupon(int seq, int sort) throws Exception;
	public CouponDto getShare() throws Exception;
	public List<CouponDto> getChallenge() throws Exception;
	public CouponDto getTime() throws Exception;
	public CouponDto getRandom() throws Exception;
	public boolean regChall(int seq1, int seq2, int seq3, int sort) throws Exception;
	public boolean acqCp(couponVO memcp) throws Exception;
	public void allDel() throws Exception;
	public List<couponVO> myCp(String mid) throws Exception;
	public couponVO getCp(int seq) throws Exception;
	void rollbackCp(String mid) throws Exception;
	public void cpBkseq(couponVO memcp) throws Exception;
	void cpBkseqDel(couponVO memcp) throws Exception;
	couponVO getpaycp(couponVO memcp) throws Exception;
}
