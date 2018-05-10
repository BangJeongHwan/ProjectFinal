package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.WeddingHallDao;
import kh.com.a.model.ReservationDto;
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
	
	// 기업 삭제
	@Override
	public void Weddingdel(int whseq) {
		List<WeddingHallDto> hallList = weddingHallDao.getHallList(whseq);
		if(hallList !=null) {
			for(int i=0;i<hallList.size();i++) {
				WeddingHallDto dto = hallList.get(i);
				String hallname = dto.getHallname();
				int pdseq = dto.getPdseq();
				
				weddingHallDao.Hallpicdel(whseq, hallname);
				weddingHallDao.Halldel(pdseq);
			}
		}		
		weddingHallDao.Weddingdel(whseq);		
	}
	
	// 체크된 list
	@Override
	public List<WeddingDto> selWeddingList(String type, String data) {
		return weddingHallDao.selWeddingList(type, data);
	}
	
	//////////////////////////////////////////////////////////
	
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
	
	// hall 수정
	@Override
	public boolean modHall(WeddingHallDto wdPd) {
		return weddingHallDao.modHall(wdPd);
	}
	// 홋 사진 수정
	@Override
	public void modHallPicture(int whseq, String hallname, List<WHallPictureDto> orpicList) {
		weddingHallDao.modHallPicture(whseq, hallname, orpicList);
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
	
	
	// 업체의 사진 총계 출력
	@Override
	public int picTotal(int whseq) {
		return weddingHallDao.picTotal(whseq);
	}

	// 해당되는 홀 사진만 출력
	@Override
	public List<WHallPictureDto> getHallPicList(String hallname, int whseq) {
		return weddingHallDao.getHallPicList(hallname, whseq);
	}

	// 홀 1개의 정보
	@Override
	public WeddingHallDto hallInfo(String hallname, int whseq) {
		return weddingHallDao.hallInfo(hallname, whseq);
	}

	// 홀 삭제
	@Override
	public void Halldel(int pdseq) {
		weddingHallDao.Halldel(pdseq);
	}

	// 홀 사진 삭제
	@Override
	public void Hallpicdel(int whseq, String hallname) {
		weddingHallDao.Hallpicdel(whseq, hallname);
	}

	// 조회수 up
	@Override
	public void upReadCount(int whseq) {
		weddingHallDao.upReadCount(whseq);
	}

	// 댓글 수up
	@Override
	public void upCommentCount(int whseq) {
		weddingHallDao.upCommentCount(whseq);
	}

	

	
}
