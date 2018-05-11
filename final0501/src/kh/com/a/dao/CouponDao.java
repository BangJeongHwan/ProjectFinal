package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.CouponDto;
import kh.com.a.model2.couponVO;

public interface CouponDao {
	
	boolean addcoupon(CouponDto coupon) throws Exception;
	List<CouponDto> couponlist(int sort) throws Exception;
	List<CouponDto> couponAlllist(int sort) throws Exception;
	/*CouponDto registedCoupon(int sort) throws Exception;*/
	
	boolean regPrevCoupon(int sort) throws Exception;
	boolean regNextCoupon(int seq) throws Exception;
	
	CouponDto getShare() throws Exception;
	List<CouponDto> getChallenge() throws Exception;
	CouponDto getTime() throws Exception;
	CouponDto getRandom() throws Exception;
	boolean acqCp(couponVO memcp) throws Exception;
	couponVO prevAcqCp(couponVO memcp) throws Exception;
	void allDel() throws Exception;
	void userDel() throws Exception;
	List<couponVO> myCp(String mid) throws Exception;
	couponVO getCp(int seq) throws Exception;
	void basketCp(int seq) throws Exception;
	void rollbackCp(String mid) throws Exception;
	void cpBkseq(couponVO memcp) throws Exception;
	void cpBkseqDel(couponVO memcp) throws Exception;
	couponVO getpaycp(couponVO memcp) throws Exception;
}
