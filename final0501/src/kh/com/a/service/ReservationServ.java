package kh.com.a.service;

import java.util.List;

import kh.com.a.model.ReservationDto;
import kh.com.a.model2.ReservCalParam;
import kh.com.a.model2.ReservDressParam;
import kh.com.a.model2.ReservParam;
import kh.com.a.model2.ReservationVO;
import kh.com.a.model2.WhParam;

public interface ReservationServ {

	public boolean dressReserv(ReservationDto rDto);
	public List<ReservationDto> dressResrvList();
	public List<ReservationDto> getDSReservListByPdseqRedate(ReservationDto reserv) throws Exception;
	public boolean DressReserveAdmit(int rvseq) throws Exception;
	public boolean rejectionResrve(int rvseq) throws Exception;
	
	public List<ReservationDto> getMuReservListByPdseqRedate(ReservationDto reserv) throws Exception;
	public int getNextRvseq() throws Exception;
	public boolean addMuReservation(ReservationDto reserv) throws Exception;
	public ReservationDto getReservByRvseq(int rvseq) throws Exception;
	public boolean checkMuBskByMidReserv(ReservationDto reserv) throws Exception;
	public boolean delReservByRvseqList(List<Integer> rvseqList) throws Exception;
	public boolean updateReservStatusPay(List<Integer> rvseqList) throws Exception;
	public boolean checkReserv(ReservationDto reserv) throws Exception;
	public List<ReservationDto> ReservPagingMemList(ReservParam param);
	public int getReservCount(String id);
	public List<ReservationDto> dressReservPagingComList(ReservDressParam param);
	public int getReservDressCount(String cid);
	
	//정환
	public void wdHallResv(ReservationDto rDto);
	public List<ReservationDto> getWDResvListByPdseqRedate(ReservationDto reserv) throws Exception;
	public List<ReservationVO> getWdRegList(ReservationDto fcal);
	public List<ReservationDto> weddingReservPagingComList(WhParam param);
	
//	혜영
	public List<ReservCalParam> getReservCalListByPdseq(int pdseq) throws Exception;
	public List<ReservCalParam> DgetReservCalListByPdseq(int pdseq) throws Exception;
	
}
