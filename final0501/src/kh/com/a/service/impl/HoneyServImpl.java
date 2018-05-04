package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.HoneyDao;
import kh.com.a.model.HoneyBbsDto;
import kh.com.a.model.HoneyMoonDto;
import kh.com.a.model2.HoneyBbsParam;
import kh.com.a.service.HoneyServ;

@Service
public class HoneyServImpl implements HoneyServ {

	@Autowired
	private HoneyDao honeyDao;

	@Override
	public List<HoneyMoonDto> arealist() throws Exception{
		return honeyDao.arealist();
	}

	@Override
	public List<HoneyBbsDto> honeyBbsList(HoneyBbsParam param) throws Exception {
		return honeyDao.honeyBbsList(param);
	}

	@Override
	public int honeyBbsCount(HoneyBbsParam param) throws Exception {
		return honeyDao.honeyBbsCount(param);
	}

	@Override
	public boolean honeybbswrite(HoneyBbsDto hmDto) throws Exception {
		return honeyDao.honeybbswrite(hmDto);
	}

	@Override
	public HoneyBbsDto honeybbsdetail(int seq) throws Exception {
		return honeyDao.honeybbsdetail(seq);
	}

	@Override
	public void hmBbsReadcount(int seq) throws Exception {
		honeyDao.hmBbsReadcount(seq);
	}

	@Override
	public void delhmbbs(int seq) throws Exception {
		honeyDao.delhmbbs(seq);
	}

	@Override
	public boolean uphmbbs(HoneyBbsDto hmDto) throws Exception {
		return honeyDao.uphmbbs(hmDto);
	}
	
}
