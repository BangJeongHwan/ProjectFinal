package kh.com.a.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.DressDao;
import kh.com.a.model.DressDto;
import kh.com.a.model.RecentDto;
import kh.com.a.model2.DressParam;

@Repository
public class DressDaoImpl implements DressDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	String ns = "Dress.";

	@Override
	public boolean companyUpload(DressDto dressDto) throws Exception {
		return sqlSession.insert(ns+"companyUpload", dressDto)>0?true:false;
	}

	@Override
	public List<DressDto> getDressList() throws Exception {
		return sqlSession.selectList(ns+"getDressList");
	}

	@Override
	public DressDto getDressDetail(int dsseq) throws Exception {
		return sqlSession.selectOne(ns+"getDressDetail", dsseq);
	}

	@Override
	public int getDsseq() throws Exception {
		return sqlSession.selectOne(ns+"getDsseq");
	}

	@Override
	public boolean dressDelete(int dsseq) throws Exception {
		return sqlSession.delete(ns+"dressDelete", dsseq)>0?true:false;
	}

	@Override
	public boolean dressUpdate(DressDto Ddto) throws Exception {
		return sqlSession.update(ns+"dressUpdate", Ddto)>0?true:false;
	}

	@Override
	public int getDressCount(DressParam param) throws Exception {
		int num = 0;
		num = sqlSession.selectOne(ns+"getDressCount", param);
		return num;
	}

	@Override
	public List<DressDto> getPagingDressList(DressParam param) throws Exception {
		List<DressDto> list = sqlSession.selectList(ns+"getPagingDressList", param);
		return list;
	}

	@Override
	public RecentDto getRecentProduct(int rp) throws Exception {
		return sqlSession.selectOne(ns+"getRecentProduct", rp);
	}

	

}
