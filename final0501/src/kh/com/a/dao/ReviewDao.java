package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.ReviewDto;
import kh.com.a.model.ReviewParam;

public interface ReviewDao {

	public int getRseq() throws Exception;
	public boolean rwrite(ReviewDto dto) throws Exception;
	public int rlistcount(ReviewParam dto) throws Exception;
	public List<ReviewDto> pagingrlist(ReviewParam dto) throws Exception;
	public List<ReviewDto> myrlist(ReviewParam dto) throws Exception;
	public int mrlistcount(ReviewParam dto) throws Exception;
	public ReviewDto rdetail(int rseq) throws Exception;
	
	//소현
	public List<ReviewDto> WDlist(int rpdseq) throws Exception;
	public boolean writeWdlist(ReviewDto dto) throws Exception;
}
