package kh.com.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.StudioDao;
import kh.com.a.model.RecentDto;
import kh.com.a.model.StudioDto;
import kh.com.a.model.StudioProductDto;
import kh.com.a.model2.SdParam;
import kh.com.a.model2.StudioParam;

@Repository
public class StudioDaoImpl implements StudioDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "Studio.";

	@Override
	public int getStseq() throws Exception {
		return sqlSession.selectOne(ns+"getStseq");
	}

	@Override
	public boolean addStudio(StudioDto sdDto) throws Exception {
		return sqlSession.insert(ns+"addStudio", sdDto)>0?true:false;
	}

	@Override
	public boolean addStudioProduct(StudioProductDto sdPd) throws Exception {
		return sqlSession.insert(ns+"addStudioProduct", sdPd)>0?true:false;
	}

	// 스튜디오 리스트 가져오는 부분
	@Override
	public List<StudioDto> getStudioAllList() throws Exception {
		return sqlSession.selectList(ns+"getStudioAllList");
	}

	@Override
	public List<StudioDto> getPagingStudioList(StudioParam param) throws Exception {
		List<StudioDto> list = sqlSession.selectList(ns+"getPagingStudioList", param);
		return list;
	}

	@Override
	public int getStudioCount(StudioParam param) throws Exception {
		int num = 0;
		num = sqlSession.selectOne(ns+"getStudioCount", param);
		return num;
	}

	@Override
	public StudioDto getStudioDetail(int stseq) throws Exception {
		StudioDto sdDto = sqlSession.selectOne(ns+"getStudioDetail", stseq);
		return sdDto;
	}

	@Override
	public List<StudioProductDto> getStudioProductDetail(int stseq) throws Exception {
		List<StudioProductDto> sdpdlist = sqlSession.selectList(ns+"getStudioProductDetail", stseq);
		return sdpdlist;
	}

	@Override
	public String getProductPrice(StudioProductDto sdpdDto) throws Exception {
		String price = sqlSession.selectOne(ns+"getProductPrice", sdpdDto);
		return price;
	}

	@Override
	public List<StudioProductDto> getStudioProductListBySdseq(int stseq) throws Exception {
		List<StudioProductDto> sdpdlist = sqlSession.selectList(ns+"getStudioProductListBySdseq", stseq);
		return sdpdlist;
	}

	@Override
	public StudioDto getStudioByStseq(int stseq) throws Exception {
		StudioDto sdDto = sqlSession.selectOne(ns+"getStudioByStseq", stseq);
		return sdDto;
	}

	@Override
	public boolean delStudioProductByStseq(int stseq) throws Exception{
		return sqlSession.delete(ns+"delStudioProductByStseq", stseq)>0?true:false;
	}

	@Override
	public boolean delStudioByStseq(int stseq) throws Exception{
		return sqlSession.delete(ns+"delStudioByStseq", stseq)>0?true:false;
	}

	@Override
	public boolean modStudio(StudioDto sdDto) throws Exception {
		return sqlSession.update(ns+"modStudio", sdDto)>0?true:false;
	}
	
	@Override
	public RecentDto getRecentProduct(int rp) throws Exception {
		return sqlSession.selectOne(ns+"getRecentProduct", rp);
	}
}
