package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.AdminpageDao;
import kh.com.a.dao.MypageDao;
import kh.com.a.model.CompanyDto;
import kh.com.a.model.JjimDto;
import kh.com.a.model.JjimlistDto;
import kh.com.a.model.ReviewDto;
import kh.com.a.model.ReviewParam;
import kh.com.a.service.AdminpageServ;
import kh.com.a.service.MypageServ;

@Service
public class MypageDaoServImpl implements MypageServ {
	
	@Autowired
	MypageDao mypage;

	@Override
	public JjimDto getJjim(JjimDto jdto) throws Exception {
		return mypage.getJjim(jdto);
	}

	@Override
	public boolean addJjim(JjimDto jdto) throws Exception {
		return mypage.addJjim(jdto);
	}

	@Override
	public boolean delJjim(JjimDto jdto) throws Exception {
		return mypage.delJjim(jdto);
	}
	
	@Override
	public List<JjimDto> getJjimlist() throws Exception {
		return mypage.getJjimlist();
	}

	@Override
	public JjimlistDto getJjimStudio(int seq) throws Exception {
		return mypage.getJjimStudio(seq); 
	}

	@Override
	public JjimlistDto getJjimDress(int seq) throws Exception {
		return mypage.getJjimDress(seq);
	}

	@Override
	public JjimlistDto getJjimMakeup(int seq) throws Exception {
		return mypage.getJjimMakeup(seq);
	}
	
	@Override
	public List<ReviewDto> pagingmrlist(ReviewParam dto) throws Exception {
		// TODO Auto-generated method stub
		return mypage.pagingmrlist(dto);
	}

	@Override
	public int mrcount(ReviewParam dto) throws Exception {
		// TODO Auto-generated method stub
		return mypage.mrcount(dto);
	}
	
}
