package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.MakeupDto;
import kh.com.a.model.MuProductDto;
import kh.com.a.model2.MuPagingParam;

public interface MakeupDao {
	
	public int getMuseq() throws Exception;
	public boolean addMakeup(MakeupDto muDto) throws Exception;
	public boolean addMuProduct(MuProductDto muPd) throws Exception;
	public List<MakeupDto> getMakeupAllList() throws Exception;
	public MakeupDto getMakeupByMuseq(int museq) throws Exception;
	public List<MuProductDto> getMuProductListByMuseq(int museq) throws Exception;
	public boolean delMuProductByMuseq(int museq) throws Exception;
	public boolean delMakeupByMuseq(int museq) throws Exception;
	public boolean modMakeup(MakeupDto muDto) throws Exception;
	public int getMakeupAllCnt(MuPagingParam param) throws Exception;
	public List<MakeupDto> getMakeupMainList(MuPagingParam param) throws Exception;
	public boolean upReadcnt(int museq) throws Exception;

}
