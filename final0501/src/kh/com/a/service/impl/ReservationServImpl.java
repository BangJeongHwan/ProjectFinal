package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.ReservationDao;
import kh.com.a.model.ReservationDto;
import kh.com.a.model2.ReservCalParam;
import kh.com.a.model2.ReservDressParam;
import kh.com.a.model2.ReservParam;
import kh.com.a.model2.ReservationVO;
import kh.com.a.model2.WhParam;
import kh.com.a.service.ReservationServ;

@Service
public class ReservationServImpl implements ReservationServ {

	@Autowired
	ReservationDao reservDao;

	@Override
	public boolean dressReserv(ReservationDto rDto) {
		return reservDao.dressReserv(rDto);
	}

	@Override
	public List<ReservationDto> dressResrvList() {
		return reservDao.dressResrvList();
	}

	@Override
	public List<ReservationDto> getDSReservListByPdseqRedate(ReservationDto reserv) throws Exception {
		return reservDao.getDSReservListByPdseqRedate(reserv);
	}

	@Override
	public boolean DressReserveAdmit(int rvseq) throws Exception {
		return reservDao.DressReserveAdmit(rvseq);
	}
	
	@Override
	public boolean rejectionResrve(int rvseq) throws Exception {
		return reservDao.rejectionResrve(rvseq);
	}
	
	@Override
	public List<ReservationDto> getMuReservListByPdseqRedate(ReservationDto reserv) throws Exception {
		return reservDao.getMuReservListByPdseqRedate(reserv);
	}

	@Override
	public int getNextRvseq() throws Exception {
		return reservDao.getNextRvseq();
	}

	@Override
	public boolean addMuReservation(ReservationDto reserv) throws Exception {
		return reservDao.addMuReservation(reserv);
	}

	@Override
	public ReservationDto getReservByRvseq(int rvseq) throws Exception {
//		redate에서 시간부분을 제외함
		ReservationDto reservDto = reservDao.getReservByRvseq(rvseq);
		String split[] = reservDto.getRedate().split(" ");
		reservDto.setRedate(split[0]);
		return reservDto;
	}

	@Override
	public boolean checkMuBskByMidReserv(ReservationDto reserv) throws Exception {
		return reservDao.checkMuBskByMidReserv(reserv);
	}

	@Override
	public boolean delReservByRvseqList(List<Integer> rvseqList) throws Exception {
		return reservDao.delReservByRvseqList(rvseqList);
	}

	@Override
	public boolean updateReservStatusPay(List<Integer> rvseqList) throws Exception {
		return reservDao.updateReservStatusPay(rvseqList);
	}

	@Override
	public boolean checkReserv(ReservationDto reserv) throws Exception {
		return reservDao.checkReserv(reserv);
	}
	
	@Override
	public List<ReservationDto> ReservPagingMemList(ReservParam param) {
		return reservDao.ReservPagingMemList(param);
	}

	@Override
	public int getReservCount(String id) {
		return reservDao.getReservCount(id);
	}

	@Override
	public List<ReservationDto> dressReservPagingComList(ReservDressParam param) {
		return reservDao.dressReservPagingComList(param);
	}

	@Override
	public int getReservDressCount(String cid) {
		return reservDao.getReservDressCount(cid);
	}
	
	// 정환
	// 홀 예약
	@Override
	public void wdHallResv(ReservationDto rDto) {
		reservDao.wdHallResv(rDto);
	}

	// 홀 예약 확인
	@Override
	public List<ReservationDto> getWDResvListByPdseqRedate(ReservationDto reserv) throws Exception {
		return reservDao.getWDResvListByPdseqRedate(reserv);
	}
	
	// 웨딩홀 예약된 것들 모두 불러오기
	@Override
	public List<ReservationVO> getWdRegList(ReservationDto fcal) {
		return reservDao.getWdRegList(fcal);
	}
	// 예약된 목록
	@Override
	public List<ReservationDto> weddingReservPagingComList(WhParam param) {
		// TODO Auto-generated method stub
		return null;
	}
	///////
	@Override
	public List<ReservCalParam> getReservCalListByPdseq(int pdseq) throws Exception {
		
		List<ReservCalParam> reservList = reservDao.getReservCalListByPdseq(pdseq);
		for (int i = 0; i < reservList.size(); i++) {
			String split[] = reservList.get(i).getRedate().split(" ");
			reservList.get(i).setRedate(split[0]);
		}
		
		return reservList;
	}

	@Override
	public List<ReservCalParam> DgetReservCalListByPdseq(int pdseq) throws Exception {
		List<ReservCalParam> reservList = reservDao.DgetReservCalListByPdseq(pdseq);
		for (int i = 0; i < reservList.size(); i++) {
			String split[] = reservList.get(i).getRedate().split(" ");
			reservList.get(i).setRedate(split[0]);
		}
		
		return reservList;
	}

	
	
	
}
