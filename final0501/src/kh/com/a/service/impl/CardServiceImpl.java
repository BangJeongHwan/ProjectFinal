package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.CardDao;
import kh.com.a.model.CDetailParam;
import kh.com.a.model.CardDetailDto;
import kh.com.a.model.CardDto;
import kh.com.a.model.CardParam;
import kh.com.a.service.CardService;

@Service
public class CardServiceImpl implements CardService {

	@Autowired
	private CardDao cardDao;

	@Override
	public List<CardDto> clist() throws Exception {
		// TODO Auto-generated method stub
		return cardDao.clist();
	}
	
	@Override
	public boolean cardwrite(CardDto dto) throws Exception {
		return cardDao.cardwrite(dto);
	}

	@Override
	public List<CardDto> pagingclist(CardParam dto) throws Exception {
		return cardDao.pagingclist(dto);
	}

	@Override
	public List<CardDetailDto> cdlist(int wiseq) throws Exception {
		// TODO Auto-generated method stub
		return cardDao.cdlist(wiseq);
	}

	@Override
	public CardDetailDto carddetail(int cdseq) throws Exception {
		// TODO Auto-generated method stub
		return cardDao.carddetail(cdseq);
	}

	@Override
	public void clupdate(CardDto dto) throws Exception {
		// TODO Auto-generated method stub
		 cardDao.clupdate(dto);
	}

	@Override
	public boolean cdwrite(CardDetailDto dto) throws Exception {
		// TODO Auto-generated method stub
		return cardDao.cdwrite(dto);
	}

	@Override
	public CardDto ccdetail(int wiseq) throws Exception {
		// TODO Auto-generated method stub
		return cardDao.ccdetail(wiseq);
	}

	@Override
	public void ccupdate(CardDto dto) throws Exception {
		cardDao.ccupdate(dto);
	}

	@Override
	public boolean ccdelete(int cdseq) throws Exception {
		// TODO Auto-generated method stub
		return cardDao.ccdelete(cdseq);
	}

	@Override
	public int clistcount(CardParam dto) throws Exception {
		return cardDao.clistcount(dto);
	}

	@Override
	public int cdlistcount(CDetailParam dto) throws Exception {
		// TODO Auto-generated method stub
		return cardDao.cdlistcount(dto);
	}

	@Override
	public List<CardDetailDto> pagingcdlist(CDetailParam dto) throws Exception {
		// TODO Auto-generated method stub
		return cardDao.pagingcdlist(dto);
	}

	@Override
	public List<CardDetailDto> ordercdlist(CDetailParam dto) throws Exception {
		// TODO Auto-generated method stub
		return cardDao.ordercdlist(dto);
	}

	@Override
	public CardDto cidckeck(String cid) throws Exception {
		// TODO Auto-generated method stub
		return cardDao.cidckeck(cid);
	}

	@Override
	public int getseq() throws Exception {
		// TODO Auto-generated method stub
		return cardDao.getseq();
	}

	@Override
	public boolean cdupdate(CardDetailDto dto) throws Exception {
		// TODO Auto-generated method stub
		return cardDao.cdupdate(dto);
	}

	
	
}
