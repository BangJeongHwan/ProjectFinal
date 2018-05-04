package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.CDetailParam;
import kh.com.a.model.CardDetailDto;
import kh.com.a.model.CardDto;
import kh.com.a.model.CardParam;

public interface CardDao {
	public List<CardDto> clist() throws Exception; 
	public List<CardDto> pagingclist(CardParam dto) throws Exception; 
	public List<CardDetailDto> cdlist(int wiseq) throws Exception;
	public List<CardDetailDto> pagingcdlist(CDetailParam dto) throws Exception; 
	public boolean cardwrite(CardDto dto) throws Exception;
	public CardDetailDto carddetail(int cdseq) throws Exception;
	public void clupdate(CardDto dto) throws Exception;
	public boolean cdwrite(CardDetailDto dto) throws Exception;
	public CardDto ccdetail(int wiseq) throws Exception;
	public void ccupdate(CardDto dto) throws Exception;
	public boolean ccdelete(int cdseq) throws Exception;
	public int clistcount(CardParam dto) throws Exception;
	public int cdlistcount(CDetailParam dto) throws Exception;
	public List<CardDetailDto> ordercdlist(CDetailParam dto) throws Exception;
	public CardDto cidckeck(String cid) throws Exception;
	public int getseq() throws Exception;
	public boolean cdupdate(CardDetailDto dto) throws Exception;

}
