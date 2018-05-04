package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.AdminpageDao;
import kh.com.a.model.CompanyDto;
import kh.com.a.service.AdminpageServ;

@Service
public class AdminpageServImpl implements AdminpageServ {
	
	@Autowired
	AdminpageDao adminpage;

	@Override
	public boolean getupdategrade(String cid) throws Exception {
		return adminpage.getupdategrade(cid);
	}

	@Override
	public boolean getdelete(String cid) throws Exception {
		return adminpage.getdelete(cid);
	}

	@Override
	public List<CompanyDto> getallcompany() throws Exception {
		return adminpage.getallcompany();
	}
}
