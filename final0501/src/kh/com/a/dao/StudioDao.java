package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.RecentDto;
import kh.com.a.model.StudioDto;
import kh.com.a.model.StudioProductDto;
import kh.com.a.model2.SdParam;
import kh.com.a.model2.StudioParam;

public interface StudioDao {
	
	public int getStseq() throws Exception;
	public boolean addStudio(StudioDto sdDto) throws Exception;
	public boolean addStudioProduct(StudioProductDto sdPd) throws Exception;
	public List<StudioDto> getStudioAllList() throws Exception;
	public List<StudioDto> getPagingStudioList(StudioParam param) throws Exception;
	public int getStudioCount(StudioParam param) throws Exception;
	public StudioDto getStudioDetail(int stseq) throws Exception;
	public List<StudioProductDto> getStudioProductDetail(int stseq) throws Exception;
	public String getProductPrice(StudioProductDto sdpdDto) throws Exception;
	public List<StudioProductDto> getStudioProductListBySdseq(int stseq) throws Exception;
	public StudioDto getStudioByStseq(int stseq) throws Exception;
	
	public boolean delStudioProductByStseq(int stseq) throws Exception;
	public boolean delStudioByStseq(int stseq) throws Exception;
	public boolean modStudio(StudioDto sdDto) throws Exception;

	public RecentDto getRecentProduct(int rp) throws Exception;
}
