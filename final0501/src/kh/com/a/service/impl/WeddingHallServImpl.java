package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.WeddingHallDao;
import kh.com.a.model.WHallPictureDto;
import kh.com.a.model.WeddingDto;
import kh.com.a.model.WeddingHallDto;
import kh.com.a.model2.WHallPicSumVO;
import kh.com.a.service.WeddingHallServ;

@Service
public class WeddingHallServImpl implements WeddingHallServ {

	@Autowired
	WeddingHallDao weddingHallDao;
	
	// 기업 추가
	@Override
	public boolean addWedding(WeddingDto wd) {
		return weddingHallDao.addWedding(wd);
	}

	// 기업 list 출력
	@Override
	public List<WeddingDto> getWeddingList() {
		return weddingHallDao.getWeddingList();
	}
	
	// 기업 한개 출력
	@Override
	public WeddingDto getWedding(int whseq) {
		return weddingHallDao.getWedding(whseq);
	}

	
	// 기업에 대한 hall list
	@Override
	public List<WeddingHallDto> getHallList(int whseq) {
		return weddingHallDao.getHallList(whseq);
	}
	
	// 홀 이름 체크
	@Override
	public boolean checkHallName(String hallname) {
		return weddingHallDao.checkHallName(hallname);
	}
	
	// hall 추가
	@Override
	public boolean addHall(WeddingHallDto wdPd) {
		return weddingHallDao.addHall(wdPd);
	}

	// 홋 사진 넣기
	@Override
	public void addHallPicture(int whseq, String hallname, List<String> FileNameList) {
		weddingHallDao.addHallPicture(whseq, hallname, FileNameList);
	}
	
	// 홀이름과 사진수
	@Override
	public List<WHallPicSumVO> getHallSumList(int whseq) {
		return weddingHallDao.getHallSumList(whseq);
	}

	// 모든 홀 사진 출력
	@Override
	public List<WHallPictureDto> getAllHallPicList(int whseq) {
		return weddingHallDao.getAllHallPicList(whseq);
	}

	// 해당되는 홀 사진만 출력
	@Override
	public List<WHallPictureDto> getHallPicList(String hallname, int whseq) {
		return weddingHallDao.getHallPicList(hallname, whseq);
	}

	
}
