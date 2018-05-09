package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.StudioDao;
import kh.com.a.model.RecentDto;
import kh.com.a.model.StudioDto;
import kh.com.a.model.StudioProductDto;
import kh.com.a.model2.StudioParam;
import kh.com.a.service.StudioServ;

@Service
public class StudioServImpl implements StudioServ {

	@Autowired
	private StudioDao studiodao;

	@Override
	public int getStseq() throws Exception {
		return studiodao.getStseq();
	}

	@Override
	public boolean addStudio(StudioDto sdDto) throws Exception {
		System.out.println("------------service StudioDto sdDto 업체번호: " + sdDto.getStseq());
		System.out.println("------------service StudioDto sdDto 업체이름 : " + sdDto.getCid());
		System.out.println("------------service StudioDto sdDto 업체오픈 : " + sdDto.getOpentime());
		System.out.println("------------service StudioDto sdDto 업체클로우즈 : " + sdDto.getClosetime());
		System.out.println("------------service StudioDto sdDto 업체사진1 : " + sdDto.getPic().get(0));
		System.out.println("------------service StudioDto sdDto 업체사진2 : " + sdDto.getPic().get(1));
		System.out.println("------------service StudioDto sdDto 업체비디오 : " + sdDto.getVideo());
		System.out.println("------------service StudioDto sdDto 업체내용 : " + sdDto.getContent());
		System.out.println("------------service StudioDto sdDto 업체내용 : " + sdDto.getAddre());
		return studiodao.addStudio(sdDto);
	}

	@Override
	public boolean addStudioProduct(StudioProductDto sdPd) throws Exception {
		System.out.println("------------service StudioDto sdDto 업체 상품 내용: " + sdPd.getContent());
		System.out.println("------------service StudioDto sdDto 업체 상품 가격 : " + sdPd.getPrice());
		System.out.println("------------service StudioDto sdDto 업체 상품 제목 : " + sdPd.getTitle());
		System.out.println("------------service StudioDto sdDto 업체 상품 제목 : " + sdPd.getSdpdseq());
		System.out.println("------------service StudioDto sdDto 업체 상품 제목 : " + sdPd.getSdseq());
		
		return studiodao.addStudioProduct(sdPd);
	}

	@Override
	public List<StudioDto> getStudioAllList() throws Exception {
		return studiodao.getStudioAllList();
	}

	@Override
	public List<StudioDto> getPagingStudioList(StudioParam param) throws Exception {
		return studiodao.getPagingStudioList(param);
	}

	@Override
	public int getStudioCount(StudioParam param) throws Exception {
		return studiodao.getStudioCount(param);
	}

	@Override
	public StudioDto getStudioDetail(int stseq) throws Exception {
		return studiodao.getStudioDetail(stseq);
	}

	@Override
	public List<StudioProductDto> getStudioProductDetail(int stseq) throws Exception {
		return studiodao.getStudioProductDetail(stseq);
	}

	@Override
	public String getProductPrice(StudioProductDto sdpdDto) throws Exception {
		return studiodao.getProductPrice(sdpdDto);
	}

	@Override
	public List<StudioProductDto> getStudioProductListBySdseq(int stseq) throws Exception {
		return studiodao.getStudioProductListBySdseq(stseq);
	}

	@Override
	public StudioDto getStudioByStseq(int stseq) throws Exception {
		return studiodao.getStudioByStseq(stseq);
	}

	@Override
	public boolean delStudioProductByStseq(int stseq) throws Exception {
		return studiodao.delStudioProductByStseq(stseq);
	}

	@Override
	public boolean delStudioByStseq(int stseq) throws Exception {
		return studiodao.delStudioByStseq(stseq);
	}

	@Override
	public boolean modStudio(StudioDto sdDto) throws Exception {
		return studiodao.modStudio(sdDto);
	}
	
	@Override
	public RecentDto getRecentProduct(int rp) throws Exception {
		return studiodao.getRecentProduct(rp); 
	}
}
