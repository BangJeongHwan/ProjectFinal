package kh.com.a.service;

import java.util.List;

import kh.com.a.model.ReviewDto;
import kh.com.a.model.ReviewParam;
import kh.com.a.model.RlikeDto;

public interface ReviewServ {

	public int getRseq() throws Exception;
	public boolean rwrite(ReviewDto dto) throws Exception;
	public int rlistcount(ReviewParam dto) throws Exception;
	public List<ReviewDto> pagingrlist(ReviewParam dto) throws Exception;
	public List<ReviewDto> myrlist(ReviewParam dto) throws Exception;
	public int mrlistcount(ReviewParam dto) throws Exception;
	public ReviewDto rdetail(int rseq) throws Exception;
	public boolean rupdate(ReviewDto dto) throws Exception;
	public boolean rlike(int rseq) throws Exception;
	public boolean drlike(int rseq) throws Exception;
	public RlikeDto getrlike(RlikeDto dto) throws Exception;
	public boolean addrlike(RlikeDto dto) throws Exception;
	public boolean delrlike(RlikeDto dto) throws Exception;
	
	//�냼�쁽
	public List<ReviewDto> WDlist(int rpdseq) throws Exception;
	public boolean writeWdlist(ReviewDto dto) throws Exception;
}
