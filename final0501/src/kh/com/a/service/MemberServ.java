package kh.com.a.service;

import kh.com.a.model.CompanyDto;
import kh.com.a.model.MemberDto;
import kh.com.a.model2.LoginDto;

public interface MemberServ {
	
	public boolean addCompany(CompanyDto company)throws Exception ;
	public CompanyDto getCompanyByCid(String cid) throws Exception;
	public CompanyDto getCompanyByEmail(String email) throws Exception;
	public boolean addMember(MemberDto member) throws Exception;
	public MemberDto getMemberByMid(String mid) throws Exception;
	public boolean checkId(String id) throws Exception;
	public MemberDto getMemberByEmail(String email) throws Exception;
	public boolean checkEmail(String email) throws Exception;
	public boolean upCompanyGrade(String cid) throws Exception;
	public LoginDto login(LoginDto mem) throws Exception;
	public boolean checkLicense(String license) throws Exception;
	public LoginDto kakaologin(String email) throws Exception;
	public boolean updateCPwd(CompanyDto company) throws Exception;
	public boolean updateAddre(CompanyDto company) throws Exception;
	public boolean withdrawCompany(String cid) throws Exception;
	public boolean updateMPwd(MemberDto member) throws Exception;
	public boolean updateMAddre(MemberDto member) throws Exception;
	public boolean withdrawMember(String mid) throws Exception;
	// 혜영
	public MemberDto getMnamePhoneByMid(String mid) throws Exception;
	
}
