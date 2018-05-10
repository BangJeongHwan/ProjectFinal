package kh.com.a.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.WeddingHallDao;
import kh.com.a.model.ReservationDto;
import kh.com.a.model.WHallPictureDto;
import kh.com.a.model.WeddingDto;
import kh.com.a.model.WeddingHallDto;
import kh.com.a.model2.WHallPicSumVO;

@Repository
public class WeddingHallDaoImpl implements WeddingHallDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "WeddingHall.";
	
	// 기업 추가
	@Override
	public boolean addWedding(WeddingDto wd) {
		int n = sqlSession.insert(ns+"addWedding", wd);
		return n>0?true:false;
	}
	
	// 기업 list 출력
	@Override
	public List<WeddingDto> getWeddingList() {
		List<WeddingDto> list = sqlSession.selectList(ns+"getWeddingList");
		return list;
	}

	// 기업 한개 출력
	@Override
	public WeddingDto getWedding(int whseq) {
		WeddingDto wd = sqlSession.selectOne(ns+"getWedding", whseq);
		return wd;
	}

	
	// 기업에 대한 hall list
	@Override
	public List<WeddingHallDto> getHallList(int whseq) {
		List<WeddingHallDto> list = sqlSession.selectList(ns+"getHallList", whseq);
		return list;
	}// 기업 삭제
	@Override
	public void Weddingdel(int whseq) {
		sqlSession.delete(ns+"Weddingdel", whseq);
		// 홀 삭제를 추가적으로 해줘야될 수도 있음
	}
	
	// 체크된 list
	@Override
	public List<WeddingDto> selWeddingList(String type, String data) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(type.equals("People")) {
			map.put("type", type);
			String pdata[] = data.split("~");
			map.put("minpeople", pdata[0]);
			map.put("maxpeople", pdata[1]);		
		}else {
			map.put("type", type);
			if(data.equals("전체")) {
				data = "";
			}
			map.put("data", data);
		}
		return sqlSession.selectList(ns+"selWeddingList",map);
	}
	
	
	//////////////////////////////////////////////////
	
	// 홀 이름 체크
	@Override
	public boolean checkHallName(String hallname) {
		WeddingHallDto wdPd = sqlSession.selectOne(ns+"checkHallName", hallname);
		return wdPd!=null?true:false;
	}

	// hall 추가
	@Override
	public boolean addHall(WeddingHallDto wdPd) {
		int n = sqlSession.insert(ns+"addHall", wdPd);
		return n>0?true:false;
	}
	
	// 홋 사진 넣기
	@Override
	public void addHallPicture(int whseq, String hallname, List<String> FileNameList) {
		WHallPictureDto hallpic;
		for(int i=0;i<FileNameList.size();i++) {
			hallpic = new WHallPictureDto(0, whseq, hallname, FileNameList.get(i));
			//System.out.println(hallpic.toString());
			sqlSession.insert(ns+"addHallPicture", hallpic);
		}
	}
	// hall 수정
	@Override
	public boolean modHall(WeddingHallDto wdPd) {
		int n = sqlSession.update(ns+"modHall", wdPd);
		return n>0?true:false;
	}
	
	// 홀 사진 수정
	@Override
	public void modHallPicture(int whseq, String hallname, List<WHallPictureDto> orpicList) {
		
		WHallPictureDto hallpic;
		for(int i=0;i<orpicList.size();i++) {
			hallpic = new WHallPictureDto(orpicList.get(i).getPicseq(), whseq, hallname, orpicList.get(i).getPicture());
			//System.out.println(FileNameList.get(i));
			sqlSession.update(ns+"modHallPicture", hallpic);
		}
	}
	
	// 홀이름과 사진수
	@Override
	public List<WHallPicSumVO> getHallSumList(int whseq) {
		return sqlSession.selectList(ns+"getHallSumList", whseq);
	}
	
	// 모든 홀 사진 출력
	public List<WHallPictureDto> getAllHallPicList(int whseq){
		return sqlSession.selectList(ns+"getAllHallPicList", whseq);
	}
	
	// 사진 총계 출력
	@Override
	public int picTotal(int whseq) {
		WHallPictureDto dto = sqlSession.selectOne(ns+"picTotal",whseq);
		int pictotal = 0;
		if(dto != null) {
			pictotal = dto.getPictotal();
		}
		return pictotal;
	}
	
	// 해당되는 홀 사진만 출력
	@Override
	public List<WHallPictureDto> getHallPicList(String hallname,int whseq) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("hallname", hallname);
		map.put("whseq", whseq);
		
		return sqlSession.selectList(ns+"getHallPicList", map);
	}

	

	// 홀 1개의 정보
	@Override
	public WeddingHallDto hallInfo(String hallname, int whseq) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("hallname", hallname);
		map.put("whseq", whseq);
		return sqlSession.selectOne(ns+"hallInfo", map);
	}

	// 홀 삭제
	@Override
	public void Halldel(int pdseq) {
		sqlSession.delete(ns+"Halldel", pdseq);		
	}

	// 홀 사진 삭제
	@Override
	public void Hallpicdel(int whseq, String hallname) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("hallname", hallname);
		map.put("whseq", whseq);
		
		sqlSession.delete(ns+"Hallpicdel", map);	
	}

	// 조회수
	@Override
	public void upReadCount(int whseq) {
		sqlSession.insert(ns+"Upreadcount", whseq);
	}

	// 댓글수
	@Override
	public void upCommentCount(int whseq) {
		sqlSession.insert(ns+"upCommentCount", whseq);
	}



	
	
}
