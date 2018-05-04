package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.MakeupDao;
import kh.com.a.model.MakeupDto;
import kh.com.a.model.MuProductDto;
import kh.com.a.model2.MuPagingParam;
import kh.com.a.service.MakeupServ;

@Service
public class MakeupServImpl implements MakeupServ {
	
	@Autowired
	private MakeupDao muDao;

	@Override
	public boolean addMakeup(MakeupDto muDto) throws Exception {
		return muDao.addMakeup(muDto);
	}

	@Override
	public int getMuseq() throws Exception {
		return muDao.getMuseq();
	}

	@Override
	public boolean addMuProduct(MuProductDto muPd) throws Exception {
		return muDao.addMuProduct(muPd);
	}

	@Override
	public List<MakeupDto> getMakeupAllList() throws Exception {
		return muDao.getMakeupAllList();
	}

	@Override
	public MakeupDto getMakeupByMuseq(int museq) throws Exception {
		MakeupDto muDto = muDao.getMakeupByMuseq(museq);
		muDto.getPic().set(0, muDto.getPic1());
		muDto.getPic().set(1, muDto.getPic2());
		muDto.getPic().set(2, muDto.getPic3());
		muDto.getPic().set(3, muDto.getPic4());
		muDto.getPic().set(4, muDto.getPic5());
		muDto.getPic().set(5, muDto.getPic6());
		muDto.getPic().set(6, muDto.getPic7());
		muDto.getPic().set(7, muDto.getPic8());
		muDto.getPic().set(8, muDto.getPic9());
		muDto.getPic().set(9, muDto.getPic0());
		return muDto;
	}

	@Override
	public List<MuProductDto> getMuProductListByMuseq(int museq) throws Exception {
		return muDao.getMuProductListByMuseq(museq);
	}

	@Override
	public boolean delMuByMuseq(int museq) throws Exception {
		boolean flag = false;
		if (muDao.delMuProductByMuseq(museq)) {
			flag = muDao.delMakeupByMuseq(museq);
		}
		return flag;
	}

	@Override
	public boolean modMakeup(MakeupDto muDto) throws Exception {
		return muDao.modMakeup(muDto);
	}

	@Override
	public boolean delMuProductByMuseq(int museq) throws Exception {
		return muDao.delMuProductByMuseq(museq);
	}

	@Override
	public int getMakeupAllCnt(MuPagingParam param) throws Exception {
		return muDao.getMakeupAllCnt(param);
	}

	@Override
	public List<MakeupDto> getMakeupMainList(MuPagingParam param) throws Exception {
		return muDao.getMakeupMainList(param);
	}

	@Override
	public boolean upReadcnt(int museq) throws Exception {
		return muDao.upReadcnt(museq);
	}

}
