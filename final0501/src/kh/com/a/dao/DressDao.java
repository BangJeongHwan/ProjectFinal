package kh.com.a.dao;

import java.util.HashMap;
import java.util.List;

import kh.com.a.model.DressDto;
import kh.com.a.model.RecentDto;
import kh.com.a.model2.DressParam;

public interface DressDao {

	public int getDsseq() throws Exception;
	
	public boolean companyUpload(DressDto dressDto) throws Exception;
	
	public List<DressDto> getDressList() throws Exception;
	
	public DressDto getDressDetail(int dsseq) throws Exception;
	
	public boolean dressDelete(int dsseq) throws Exception;
	
	public boolean dressUpdate(DressDto Ddto) throws Exception;
	
	public int getDressCount(DressParam param) throws Exception;

	public List<DressDto> getPagingDressList(DressParam param) throws Exception;

	public RecentDto getRecentProduct(int rp) throws Exception;
}
