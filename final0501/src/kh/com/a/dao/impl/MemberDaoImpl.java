package kh.com.a.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.MemberDao;
import kh.com.a.model.CompanyDto;
import kh.com.a.model.MemberDto;
import kh.com.a.model2.LoginDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "Member.";

	@Override
	public boolean addCompany(CompanyDto company) throws Exception{
		int n = sqlSession.insert(ns+"addCompany", company);
		return n>0?true:false;
	}
	
	@Override
	public boolean addMember(MemberDto member) throws Exception{
		return sqlSession.insert(ns+"addMember", member)>0?true:false;
	}

	@Override
	public MemberDto getMemberByMid(String mid) throws Exception{
		return sqlSession.selectOne(ns+"getMemberByMid", mid);
	}

	@Override
	public MemberDto getMemberByEmail(String email) throws Exception{
		return sqlSession.selectOne(ns+"getMemberByEmail", email);
	}

	@Override
	public boolean upCompanyGrade(String cid) throws Exception{
		return sqlSession.update(ns+"upCompanyGrade", cid)>0?true:false;
	}

	@Override
	public CompanyDto getCompanyByCid(String cid) throws Exception {
		return sqlSession.selectOne(ns+"getCompanyByCid", cid);
	}

	@Override
	public CompanyDto getCompanyByEmail(String email) throws Exception {
		return sqlSession.selectOne(ns+"getCompanyByEmail", email);
	}

	@Override
	public LoginDto loginmem(LoginDto loginDto) throws Exception {
		return sqlSession.selectOne(ns+"loginmem", loginDto);
	}

	@Override
	public LoginDto logincom(LoginDto loginDto) throws Exception {
		return sqlSession.selectOne(ns+"logincom", loginDto);
	}

	@Override
	public boolean checkLicense(String license)throws Exception {
		CompanyDto dto = sqlSession.selectOne(ns+"checkLicense", license);
		return dto!=null?true:false;
	}
	@Override
	public LoginDto kakaologinmem(String email) throws Exception {
		return sqlSession.selectOne(ns+"kakaoLoginMem", email);
	}

	@Override
	public LoginDto kakaologincom(String email) throws Exception {
		return sqlSession.selectOne(ns+"kakaoLoginCom", email);
	}
	
	@Override
	public boolean updateCPwd(CompanyDto company) throws Exception {
		return sqlSession.update(ns+"updateCPwd", company)>0?true:false;
	}

	@Override
	public boolean updateAddre(CompanyDto company) throws Exception {
		return sqlSession.update(ns+"updateAddre", company)>0?true:false;
	}

	@Override
	public boolean withdrawCompany(String cid) throws Exception {
		return sqlSession.update(ns+"withdrawCompany",cid)>0?true:false;
	}

	@Override
	public boolean updateMPwd(MemberDto member) throws Exception {
		return sqlSession.update(ns+"updateMPwd", member)>0?true:false;
	}

	@Override
	public boolean updateMAddre(MemberDto member) throws Exception {
		return sqlSession.update(ns+"updateMAddre", member)>0?true:false;
	}

	@Override
	public boolean withdrawMember(String mid) throws Exception {
		return sqlSession.update(ns+"withdrawMember", mid)>0?true:false;
	}

	@Override
	public MemberDto getMnamePhoneByMid(String mid) throws Exception {
		return sqlSession.selectOne(ns+"getMnamePhoneByMid", mid);
	}
}
