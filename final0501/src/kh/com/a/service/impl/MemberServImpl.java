package kh.com.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.MemberDao;
import kh.com.a.model.CompanyDto;
import kh.com.a.model.MemberDto;
import kh.com.a.model2.LoginDto;
import kh.com.a.service.MemberServ;

@Service
public class MemberServImpl implements MemberServ {

	@Autowired
	private MemberDao memberDao;

	@Override
	public boolean addCompany(CompanyDto company)throws Exception {
		return memberDao.addCompany(company);
	} 
	@Override
	public boolean addMember(MemberDto member) throws Exception{
		return memberDao.addMember(member);
	}

	@Override
	public MemberDto getMemberByMid(String mid) throws Exception{
		return memberDao.getMemberByMid(mid);
	}

	@Override
	public boolean checkId(String id) throws Exception{	// 존재할 경우 true
		MemberDto member = memberDao.getMemberByMid(id);
		CompanyDto company = memberDao.getCompanyByCid(id);
		boolean rst = false;
		if (member != null) rst = true;
		if (company != null) rst = true;
		return rst;
	}

	@Override
	public MemberDto getMemberByEmail(String email) throws Exception{
		return memberDao.getMemberByEmail(email);
	}

	@Override
	public boolean checkEmail(String email) throws Exception{
		MemberDto member = memberDao.getMemberByEmail(email);
		CompanyDto company = memberDao.getCompanyByEmail(email);
		boolean rst = false;
		if (member != null) rst = true;
		if (company != null) rst = true;
		return rst;
	}

	@Override
	public boolean upCompanyGrade(String cid) throws Exception{
		return memberDao.upCompanyGrade(cid);
	}
	
	@Override
	public CompanyDto getCompanyByCid(String cid) throws Exception {
		return memberDao.getCompanyByCid(cid);
	}
	
	@Override
	public CompanyDto getCompanyByEmail(String email) throws Exception {
		return memberDao.getCompanyByEmail(email);
	}
	@Override
	public LoginDto login(LoginDto mem) throws Exception {
		LoginDto dto = memberDao.loginmem(mem);
		if(dto == null) {
			dto = memberDao.logincom(mem);
		}
		return dto;	
	}
	@Override
	public boolean checkLicense(String license) throws Exception {
		return memberDao.checkLicense(license);
	}
	@Override
	public LoginDto kakaologin(String email) throws Exception {
		LoginDto dto = memberDao.kakaologinmem(email);
		if(dto == null) {
			dto = memberDao.kakaologincom(email);
		}
		return dto;
	}
	@Override
	public boolean updateCPwd(CompanyDto company) throws Exception {
		return memberDao.updateCPwd(company);
	}
	@Override
	public boolean updateAddre(CompanyDto company) throws Exception {
		return memberDao.updateAddre(company);
	}
	@Override
	public boolean withdrawCompany(String cid) throws Exception {
		return memberDao.withdrawCompany(cid);
	}
	@Override
	public boolean updateMPwd(MemberDto member) throws Exception {
		return memberDao.updateMPwd(member);
	}
	@Override
	public boolean updateMAddre(MemberDto member) throws Exception {
		return memberDao.updateMAddre(member);
	}
	@Override
	public boolean withdrawMember(String mid) throws Exception {
		return memberDao.withdrawMember(mid);
	}
	@Override
	public MemberDto getMnamePhoneByMid(String mid) throws Exception {
		return memberDao.getMnamePhoneByMid(mid);
	}
	

	
}
