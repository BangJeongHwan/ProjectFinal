package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.DressDao;
import kh.com.a.model.DressDto;
import kh.com.a.model.RecentDto;
import kh.com.a.model2.DressParam;
import kh.com.a.service.DressServ;

@Service
public class DressServImpl implements DressServ {

	@Autowired
	DressDao dressDao;

	@Override
	public boolean companyUpload(DressDto dressDto) throws Exception {
		return dressDao.companyUpload(dressDto);
	}

	@Override
	public List<DressDto> getDressList() throws Exception {
		return dressDao.getDressList();
	}

	@Override
	public DressDto getDressDetail(int dsseq) throws Exception {
		DressDto Ddto = dressDao.getDressDetail(dsseq);
		Ddto.getPic().set(0, Ddto.getPicture0());
		Ddto.getPic().set(1, Ddto.getPicture1());
		Ddto.getPic().set(2, Ddto.getPicture2());
		Ddto.getPic().set(3, Ddto.getPicture3());
		Ddto.getPic().set(4, Ddto.getPicture4());
		Ddto.getPic().set(5, Ddto.getPicture5());
		Ddto.getPic().set(6, Ddto.getPicture6());
		Ddto.getPic().set(7, Ddto.getPicture7());
		Ddto.getPic().set(8, Ddto.getPicture8());
		Ddto.getPic().set(9, Ddto.getPicture9());
		
		return Ddto;
	}

	@Override
	public int getDsseq() throws Exception {
		return dressDao.getDsseq();
	}

	@Override
	public boolean dressDelete(int dsseq) throws Exception {
		return dressDao.dressDelete(dsseq);
	}

	@Override
	public boolean dressUpdate(DressDto Ddto) throws Exception {
		return dressDao.dressUpdate(Ddto);
	}

	@Override
	public int getDressCount(DressParam param) throws Exception {
		return dressDao.getDressCount(param);
	}

	@Override
	public List<DressDto> getPagingDressList(DressParam param) throws Exception {
		return dressDao.getPagingDressList(param);
	}

	@Override
	public RecentDto getRecentProduct(int rp) throws Exception {
		return dressDao.getRecentProduct(rp); 
	}

	
}
