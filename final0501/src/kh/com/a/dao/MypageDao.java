package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.JjimDto;

public interface MypageDao {

	public JjimDto getJjim(JjimDto jdto) throws Exception;
	public boolean addJjim(JjimDto jdto) throws Exception;
	public boolean delJjim(JjimDto jdto) throws Exception;
}
