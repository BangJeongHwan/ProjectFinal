package kh.com.a.service;

import java.util.List;

import kh.com.a.model.CompanyDto;
import kh.com.a.model.JjimDto;

public interface MypageServ {

	public JjimDto getJjim(JjimDto jdto) throws Exception;
	public boolean addJjim(JjimDto jdto) throws Exception;
	public boolean delJjim(JjimDto jdto) throws Exception;

}
