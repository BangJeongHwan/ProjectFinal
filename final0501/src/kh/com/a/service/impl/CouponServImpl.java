package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.CouponDao;
import kh.com.a.model.CouponDto;
import kh.com.a.model2.couponVO;
import kh.com.a.service.CouponServ;

@Service
public class CouponServImpl implements CouponServ {

	@Autowired
	private CouponDao couponDao;
	
	@Override
	public boolean addcoupon(CouponDto coupon) throws Exception {
		return couponDao.addcoupon(coupon);
	}

	@Override
	public List<CouponDto> couponlist(int sort) throws Exception {
		return couponDao.couponlist(sort);
	}

	@Override
	public List<CouponDto> couponAlllist(int sort) throws Exception {
		return couponDao.couponAlllist(sort);
	}


	@Override
	public boolean regCoupon(int seq, int sort) throws Exception {
		couponDao.regPrevCoupon(sort);
		return couponDao.regNextCoupon(seq);
	}

	@Override
	public CouponDto getShare() throws Exception {
		return couponDao.getShare();
	}

	@Override
	public List<CouponDto> getChallenge() throws Exception {
		return couponDao.getChallenge();
	}

	@Override
	public CouponDto getTime() throws Exception {
		return couponDao.getTime();
	}

	@Override
	public CouponDto getRandom() throws Exception {
		return couponDao.getRandom();
	}

	@Override
	public boolean regChall(int seq1, int seq2, int seq3, int sort) throws Exception {
			couponDao.regPrevCoupon(sort); 
			couponDao.regNextCoupon(seq1);
			couponDao.regNextCoupon(seq2);
			boolean b = couponDao.regNextCoupon(seq3);
		return b;
	}

	@Override
	public boolean acqCp(couponVO memcp) throws Exception {
		couponVO vo = couponDao.prevAcqCp(memcp);
		boolean b=false;
		if(vo==null) {
			b = couponDao.acqCp(memcp);
		}
		return b;
	}

	@Override
	public void allDel() throws Exception {
		couponDao.allDel();
		couponDao.userDel();
	}

	@Override
	public List<couponVO> myCp(String mid) throws Exception {
		return couponDao.myCp(mid);
	}

	@Override
	public couponVO getCp(int seq) throws Exception {
		couponDao.basketCp(seq);
		return couponDao.getCp(seq);
	}

	@Override
	public void rollbackCp(String mid) throws Exception {
		couponDao.rollbackCp(mid);
	}

	@Override
	public void cpBkseq(couponVO memcp) throws Exception {
		couponDao.cpBkseq(memcp);
	}

	@Override
	public void cpBkseqDel(couponVO memcp) throws Exception {
		couponDao.cpBkseqDel(memcp);
		
	}

	@Override
	public couponVO getpaycp(couponVO memcp) throws Exception {
		return couponDao.getpaycp(memcp);
	}

}
