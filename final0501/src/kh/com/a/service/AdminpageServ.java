package kh.com.a.service;

import java.util.List;

import kh.com.a.model.CompanyDto;

public interface AdminpageServ {

	public boolean getupdategrade(String cid) throws Exception;
	public boolean getdelete(String cid) throws Exception;
	public List<CompanyDto> getallcompany() throws Exception;

}
