package kh.com.a.service;

import java.util.List;

import kh.com.a.model.CompanyDto;
import kh.com.a.model.CpoDto;
import kh.com.a.model.JjimDto;
import kh.com.a.model.JjimlistDto;
import kh.com.a.model.ReviewDto;
import kh.com.a.model.ReviewParam;
import kh.com.a.model2.PaymentViewParam;

public interface MypageServ {

	public JjimDto getJjim(JjimDto jdto) throws Exception;
	public boolean addJjim(JjimDto jdto) throws Exception;
	public boolean delJjim(JjimDto jdto) throws Exception;
	
	public List<JjimDto> getJjimlist() throws Exception;
	public JjimlistDto getJjimStudio(int seq) throws Exception;
	public JjimlistDto getJjimDress(int seq) throws Exception;
	public JjimlistDto getJjimMakeup(int seq) throws Exception;
	
	public List<ReviewDto> pagingmrlist(ReviewParam dto) throws Exception;
	public int mrcount(ReviewParam dto) throws Exception;
}
