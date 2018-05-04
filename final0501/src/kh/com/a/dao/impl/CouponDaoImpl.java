package kh.com.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kh.com.a.dao.CouponDao;
import kh.com.a.model.CouponDto;
import kh.com.a.model2.couponVO;
@Repository
public class CouponDaoImpl implements CouponDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "Coupon.";
	
	@Override
	public boolean addcoupon(CouponDto coupon) throws Exception {
		return sqlSession.insert(ns+"addcoupon", coupon)>0?true:false;
	}

	@Override
	public List<CouponDto> couponlist(int sort) throws Exception {
		return sqlSession.selectList(ns+"couponlist", sort);
	}

	@Override
	public List<CouponDto> couponAlllist(int sort) throws Exception {
		return sqlSession.selectList(ns+"couponAlllist", sort);
	}

/*	@Override
	public CouponDto registedCoupon(int sort) throws Exception {
		return sqlSession.selectOne(ns+"registedCoupon", sort);
	}*/

	@Override
	public boolean regPrevCoupon(int sort) throws Exception {
		return sqlSession.update(ns+"regPrevCoupon", sort)>0?true:false;
	}
	
	@Override
	public boolean regNextCoupon(int seq) throws Exception {
		return sqlSession.update(ns+"regNextCoupon", seq)>0?true:false;
	}

	@Override
	public CouponDto getShare() throws Exception {
		return sqlSession.selectOne(ns+"getShare");
	}

	@Override
	public List<CouponDto> getChallenge() throws Exception {
		return sqlSession.selectList(ns+"getChallenge");
	}

	@Override
	public CouponDto getTime() throws Exception {
		return sqlSession.selectOne(ns+"getTime");
	}

	@Override
	public CouponDto getRandom() throws Exception {
		return sqlSession.selectOne(ns+"getRandom");
	}

	@Override
	public boolean acqCp(couponVO memcp) throws Exception {
		return sqlSession.insert(ns+"acqCp", memcp)>0?true:false;
	}

	@Override
	public couponVO prevAcqCp(couponVO memcp) throws Exception {
		return sqlSession.selectOne(ns+"prevAcqCp",memcp);
	}

	@Override
	public void allDel() throws Exception {
		sqlSession.update("allDel");
	}

	@Override
	public void userDel() throws Exception {
		sqlSession.update("userDel");
	}
	
	

}