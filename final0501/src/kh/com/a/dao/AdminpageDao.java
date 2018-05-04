package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.CompanyDto;

public interface AdminpageDao {

	public boolean getupdategrade(String cid) throws Exception;
	public boolean getdelete(String cid) throws Exception;
	public List<CompanyDto> getallcompany() throws Exception;
	
}
