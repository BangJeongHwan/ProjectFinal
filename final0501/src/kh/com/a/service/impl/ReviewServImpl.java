package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.ReviewDao;
import kh.com.a.model.ReviewDto;
import kh.com.a.model.ReviewParam;
import kh.com.a.service.ReviewServ;

@Service
public class ReviewServImpl implements ReviewServ {

	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public boolean rwrite(ReviewDto dto) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.rwrite(dto);
	}

	@Override
	public int getRseq() throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.getRseq();
	}

	@Override
	public int rlistcount(ReviewParam dto) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.rlistcount(dto);
	}

	@Override
	public List<ReviewDto> pagingrlist(ReviewParam dto) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.pagingrlist(dto);
	}

	@Override
	public List<ReviewDto> myrlist(ReviewParam dto) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.myrlist(dto);
	}

	@Override
	public int mrlistcount(ReviewParam dto) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.mrlistcount(dto);
	}

	@Override
	public ReviewDto rdetail(int rseq) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.rdetail(rseq);
	}
	
	@Override
	public List<ReviewDto> WDlist(int rpdseq) throws Exception {
		return reviewDao.WDlist(rpdseq);
	}

	@Override
	public boolean writeWdlist(ReviewDto dto) throws Exception {
		return reviewDao.writeWdlist(dto);
	}
	
	
}
