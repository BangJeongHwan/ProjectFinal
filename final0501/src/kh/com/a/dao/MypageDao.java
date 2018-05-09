package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.JjimDto;
import kh.com.a.model.JjimlistDto;

public interface MypageDao {

	public JjimDto getJjim(JjimDto jdto) throws Exception;
	public boolean addJjim(JjimDto jdto) throws Exception;
	public boolean delJjim(JjimDto jdto) throws Exception;
	
	public List<JjimDto> getJjimlist() throws Exception;
	public JjimlistDto getJjimStudio(int seq) throws Exception;
}
