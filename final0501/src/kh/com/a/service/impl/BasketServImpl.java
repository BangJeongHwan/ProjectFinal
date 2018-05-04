package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.BasketDao;
import kh.com.a.model.BasketDto;
import kh.com.a.model2.BasketParam;
import kh.com.a.service.BasketServ;

@Service
public class BasketServImpl implements BasketServ {
	
	@Autowired
	BasketDao bskDao;

	@Override
	public List<BasketParam> getBasketListByMid(String mid) throws Exception {
		List<BasketParam> bskList = bskDao.getBasketListByMid(mid);
		for (int i = 0; i < bskList.size(); i++) {
			if (bskList.get(i).getOption1() != null) bskList.get(i).getOptionList().add(bskList.get(i).getOption1());
			if (bskList.get(i).getOption2() != null) bskList.get(i).getOptionList().add(bskList.get(i).getOption2());
			if (bskList.get(i).getOption3() != null) bskList.get(i).getOptionList().add(bskList.get(i).getOption3());
			if (bskList.get(i).getOption4() != null) bskList.get(i).getOptionList().add(bskList.get(i).getOption4());
			if (bskList.get(i).getOption5() != null) bskList.get(i).getOptionList().add(bskList.get(i).getOption5());
		}
		
		return bskList;
	}

	@Override
	public boolean delBskByBkseq(int[] bkseq) throws Exception {
		return bskDao.delBskByBkseq(bkseq);
	}
	
	@Override
	public boolean addMuBasket(BasketDto bsk) throws Exception {
		return bskDao.addMuBasket(bsk);
	}

//	TODO 0419
	@Override
	public List<BasketParam> getBskListByBkseq(int[] bkseq) throws Exception {
		return bskDao.getBskListByBkseq(bkseq);
	}

	@Override
	public List<Integer> getRvseqByBkseq(int[] bkseq) throws Exception {
		return bskDao.getRvseqByBkseq(bkseq);
	}

	@Override
	public boolean addCdBasket(BasketDto bsk) throws Exception {
		return bskDao.addCdBasket(bsk);
	}

	@Override
	public int getNextBkseq() throws Exception {
		return bskDao.getNextBkseq();
	}
}
