package kh.com.a.service;

import java.util.List;

import kh.com.a.model.HoneyBbsDto;
import kh.com.a.model.HoneyMoonDto;
import kh.com.a.model2.HoneyBbsParam;

public interface HoneyServ {
	List<HoneyMoonDto> arealist() throws Exception;
	public List<HoneyBbsDto> honeyBbsList(HoneyBbsParam param) throws Exception;
	public int honeyBbsCount(HoneyBbsParam param) throws Exception;
	public boolean honeybbswrite(HoneyBbsDto hmDto) throws Exception;
	public HoneyBbsDto honeybbsdetail(int seq) throws Exception;
	public void hmBbsReadcount(int seq) throws Exception;
	public void delhmbbs(int seq) throws Exception;
	public boolean uphmbbs(HoneyBbsDto hmDto) throws Exception;
}
