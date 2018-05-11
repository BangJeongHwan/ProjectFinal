package kh.com.a.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.ReservationDao;
import kh.com.a.model.ReservationDto;
import kh.com.a.model2.ReservCalParam;
import kh.com.a.model2.ReservDressParam;
import kh.com.a.model2.ReservParam;
import kh.com.a.model2.ReservationVO;
import kh.com.a.model2.WhParam;

@Repository
public class ReservationDaoImpl implements ReservationDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	String ns = "Reservation.";

	@Override
	public boolean dressReserv(ReservationDto rDto) {
		return sqlSession.insert(ns+"dressReserv", rDto)>0?true:false;
	}

	@Override
	public List<ReservationDto> dressResrvList() {
		return sqlSession.selectList(ns+"dressResrvList");
	}

	@Override
	public List<ReservationDto> getDSReservListByPdseqRedate(ReservationDto reserv) throws Exception {
		return sqlSession.selectList(ns+"getDSReservListByPdseqRedate", reserv);
	}

	@Override
	public boolean DressReserveAdmit(int rvseq) throws Exception {
		return sqlSession.update(ns+"DressReserveAdmit", rvseq)>0?true:false;
	}
	
	@Override
	public boolean rejectionResrve(int rvseq) throws Exception {
		return sqlSession.update(ns+"rejectionResrve", rvseq)>0?true:false;
	}
	
	@Override
	public List<ReservationDto> getMuReservListByPdseqRedate(ReservationDto reserv) throws Exception {
		return sqlSession.selectList(ns+"getMuReservListByPdseqRedate", reserv);
	}

	@Override
	public int getNextRvseq() throws Exception {
		return sqlSession.selectOne(ns+"getNextRvseq");
	}

	@Override
	public boolean addMuReservation(ReservationDto reserv) throws Exception {
		return sqlSession.insert(ns+"addMuReservation", reserv)>0?true:false;
	}

	@Override
	public ReservationDto getReservByRvseq(int rvseq) throws Exception {
		return sqlSession.selectOne(ns+"getReservByRvseq", rvseq);
	}

	@Override
	public boolean checkMuBskByMidReserv(ReservationDto reserv) throws Exception {
		int cnt = sqlSession.selectOne(ns+"checkMuBskByMidReserv", reserv);
		return cnt>0?true:false;
	}

//	TODO 0423
	@Override
	public boolean delReservByRvseqList(List<Integer> rvseqList) throws Exception {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("rvseqList", rvseqList);
		return sqlSession.delete(ns+"delReservByRvseqList", hm)>0?true:false;
	}

	@Override
	public boolean updateReservStatusPay(List<Integer> rvseqList) throws Exception {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("rvseqList", rvseqList);
		return sqlSession.update(ns+"updateReservStatusPay", hm)>0?true:false;
	}

	@Override
	public boolean checkReserv(ReservationDto reserv) throws Exception {
		int cnt = sqlSession.selectOne(ns+"checkReserv", reserv);
		// 1개 이상 존재하면 결제 불가 (false)
		return cnt>0?false:true;
	}
	
	@Override
	public List<ReservationDto> ReservPagingMemList(ReservParam param) {
		return sqlSession.selectList(ns+"ReservPagingMemList", param);
	}

	@Override
	public int getReservCount(String id) {
		int n = 0;
		n = sqlSession.selectOne(ns+"getReservCount", id);
		return n;
	}

	@Override
	public List<ReservationDto> dressReservPagingComList(ReservDressParam param) {
		return sqlSession.selectList(ns+"dressReservPagingComList", param);
	}

	@Override
	public int getReservDressCount(String cid) {
		int n = 0;
		n = sqlSession.selectOne(ns+"getReservDressCount", cid);
		return n;
	}
	
	// 정환 추가
	// 홀 일정 추가
	@Override
	public void wdHallResv(ReservationDto rDto) {
		sqlSession.insert(ns+"wdHallResv", rDto);
	}

	@Override
	public List<ReservationDto> getWDResvListByPdseqRedate(ReservationDto reserv) throws Exception {
		return sqlSession.selectList(ns+"getWDResvListByPdseqRedate", reserv);
	}
	
	// 웨딩홀 예약된 것들 모두 불러오기
	@Override
	public List<ReservationVO> getWdRegList(ReservationDto fcal) {
		return sqlSession.selectList(ns+"getWdRegList", fcal);
	}
	
	// 예약 리스트(업체)
	@Override
	public List<ReservationDto> weddingReservPagingComList(WhParam param) {
		return sqlSession.selectList(ns+"weddingReservPagingComList", param);
	}
	////////////////////////////////////////////////

	@Override
	public List<ReservCalParam> getReservCalListByPdseq(int pdseq) throws Exception {
		return sqlSession.selectList(ns+"getReservCalListByPdseq", pdseq);
	}

	@Override
	public List<ReservCalParam> DgetReservCalListByPdseq(int pdseq) throws Exception {
		return sqlSession.selectList(ns+"DgetReservCalListByPdseq", pdseq);
	}

	
	
}
