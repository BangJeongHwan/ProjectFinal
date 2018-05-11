package kh.com.a.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.a.model.BasketDto;
import kh.com.a.model.JjimDto;
import kh.com.a.model.MemberDto;
import kh.com.a.model.ReservationDto;
import kh.com.a.model2.BasketParam;
import kh.com.a.model2.LoginDto;
import kh.com.a.model2.PaymentParam;
import kh.com.a.model2.PaymentViewParam;
import kh.com.a.model2.ReservDressParam;
import kh.com.a.model2.ReservParam;
import kh.com.a.model2.ReservationVO;
import kh.com.a.model2.WhParam;
import kh.com.a.service.BasketServ;
import kh.com.a.service.CardService;
import kh.com.a.service.CouponServ;
import kh.com.a.service.MakeupServ;
import kh.com.a.service.MemberServ;
import kh.com.a.service.MypageServ;
import kh.com.a.service.PaymentServ;
import kh.com.a.service.ReservationServ;
import kh.com.a.service.StudioServ;
import kh.com.a.util.CalendarUtil;
import kh.com.a.util.myCal;

@Controller
public class PayCtrl {

	@Autowired
	ReservationServ reservServ;
	
	@Autowired
	BasketServ bskServ;
	
	@Autowired
	MemberServ memServ;
	
	@Autowired
	PaymentServ payServ;
	@Autowired
	MakeupServ muServ;
	@Autowired
	StudioServ studioserv;
	@Autowired
	CardService cdServ;
	@Autowired
	MypageServ mypageserv;
	@Autowired
	CouponServ couponServ;
	
	private static final Logger logger = LoggerFactory.getLogger(PayCtrl.class);
	
	@RequestMapping(value="reservationDress.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String dressReservationInsert(Model model, ReservationDto rDto, HttpServletRequest req, JjimDto jdto) throws Exception {
		logger.info("PayCtrl dressReservation " + new Date());
		
		MemberDto m = memServ.getMemberByMid(rDto.getMid());
		
		LoginDto login = (LoginDto)req.getSession().getAttribute("login");
		System.out.println("   login auth : " + login.getAuth());
		
		if(login.getAuth().equals("member")) {
			boolean b = reservServ.dressReserv(rDto);
			model.addAttribute("dflag", "DsSucc");
		}else {
			model.addAttribute("dflag", "DsFail");
		}
		
		return "redirect:/dressDetail.do?dsseq="+rDto.getPdseq()+"&pdseq="+jdto.getPdseq()+"&usid="+jdto.getUsid();
	}
	
	@ResponseBody
	@RequestMapping(value="getDSReservListByPdseqRedate.do", method= {RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> getDSReservListByPdseqRedate(ReservationDto reserv) throws Exception {
		logger.info("PayCtrl getDSReservListByPdseqRedate " + new Date());
		
		System.out.println("	" + reserv.getRedate() + " / " + reserv.getPdseq());
		
		List<ReservationDto> reservListDS = reservServ.getDSReservListByPdseqRedate(reserv);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reservListDS", reservListDS);
		
		return map;
	}
	
	@RequestMapping(value="DressReserveAdmit.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String DressReserveAdmit(Model model, int rvseq, HttpServletRequest req) throws Exception{
		logger.info("PayCtrl DressReserveAdmit " + new Date());
		
		boolean b = reservServ.DressReserveAdmit(rvseq);
	
		return "redirect:/reservationDressList.do";
		
	}
	
	@RequestMapping(value="DressReserveReject.do", method= {RequestMethod.GET, RequestMethod.POST})
	   public String rejectionResrve(Model model, int rvseq, HttpServletRequest req) throws Exception{
	      logger.info("PayCtrl DressReserveAdmit " + new Date());
	      
	      boolean b = reservServ.rejectionResrve(rvseq);
	   
	      return "redirect:/reservationDressList.do";
	   }
	
//	개인의 장바구니 화면을 띄운다.
	/*@RequestMapping(value="basketListView.do", method={RequestMethod.GET,RequestMethod.POST})
	public String basketListView(Model model, HttpServletRequest req, String flagPdseq, String flag) throws Exception {
		logger.info("[PayCtrl] basketListView " + new Date());
				
		LoginDto login = (LoginDto)req.getSession().getAttribute("login");
		System.out.println("   login auth : " + login.getAuth());
		if (!login.getAuth().equals("member")) {
			return "redirect:/index.do";
		}
		
		String mid = login.getId();
		List<BasketParam> bskList = bskServ.getBasketListByMid(mid);
		for (int i = 0; i < bskList.size(); i++) {
			int pdseq = bskList.get(i).getPdseq();
			if (pdseq >= 5000 && pdseq < 6000) {
				ReservationDto reservDto = reservServ.getReservByRvseq(bskList.get(i).getRvseq());
				bskList.get(i).setReservDto(reservDto);
				bskList.get(i).setPdDto(muServ.getMakeupByMuseq(pdseq));
			} else if (pdseq >= 3000 && pdseq < 4000) {
				ReservationDto reservDto = reservServ.getReservByRvseq(bskList.get(i).getRvseq());
				bskList.get(i).setReservDto(reservDto);
				bskList.get(i).setPdDto(studioserv.getStudioByStseq(pdseq));
			} else {
				bskList.get(i).setPdDto(cdServ.carddetail(pdseq));
			}
			
		}
		
		if (flagPdseq != null) model.addAttribute("flagPdseq", flagPdseq);
		if (flag != null) model.addAttribute("flag", flag);
		
		model.addAttribute("bskList", bskList);
		return "basketList.tiles";
	}*/

	@RequestMapping(value="basketListView.do", method={RequestMethod.GET,RequestMethod.POST})
	public String basketListView(Model model, HttpServletRequest req, String flagPdseq, String flag) throws Exception {
		logger.info("[PayCtrl] basketListView " + new Date());
			
		
		LoginDto login = (LoginDto)req.getSession().getAttribute("login");
		couponServ.rollbackCp(login.getId());
		System.out.println("   login auth : " + login.getAuth());
		if (!login.getAuth().equals("member")) {
			return "redirect:/index.do";
		}
		
		boolean cFlag = false; // 게시물이 있는지 없는지?
		boolean sFlag = false; 
		boolean mFlag = false; 
		
		String mid = login.getId();
		List<BasketParam> bskList = bskServ.getBasketListByMid(mid);
		System.out.println(" bskList.size()" +  bskList.size());
		for (int i = 0; i < bskList.size(); i++) {
			int pdseq = bskList.get(i).getPdseq();
			if (pdseq >= 5000 && pdseq < 6000) {
				ReservationDto reservDto = reservServ.getReservByRvseq(bskList.get(i).getRvseq());
				bskList.get(i).setReservDto(reservDto);
				bskList.get(i).setPdDto(muServ.getMakeupByMuseq(pdseq));
				
				System.out.println(bskList.get(i).toString());
				mFlag = true;
			}else if (pdseq >= 3000 && pdseq < 4000) {
				ReservationDto reservDto = reservServ.getReservByRvseq(bskList.get(i).getRvseq());
				bskList.get(i).setReservDto(reservDto);
				bskList.get(i).setPdDto(studioserv.getStudioByStseq(pdseq));
				
				sFlag = true;
			}else if (pdseq >= 2000 && pdseq < 3000) {
				bskList.get(i).setPdDto(cdServ.carddetail(pdseq));
				
				cFlag = true;
			}
			
		}
		
		
		model.addAttribute("mFlag",mFlag);
		model.addAttribute("sFlag",sFlag);
		model.addAttribute("cFlag",cFlag);
		
		if (flagPdseq != null) model.addAttribute("flagPdseq", flagPdseq);
		if (flag != null) model.addAttribute("flag", flag);
		
		model.addAttribute("bskList", bskList);
		return "basketList.tiles";
	}
	
	
//	선택된 장바구니 리스트를 삭제한다.
	@RequestMapping(value="bskDel.do", method={RequestMethod.GET,RequestMethod.POST})
	public String bskDel(Model model, int[] bkseq, String flagPdseq, String flag) throws Exception {
		logger.info("[PayCtrl] bskDel " + new Date());
		
		System.out.println("bkseq size : " + bkseq.length);
		for (int i = 0; i < bkseq.length; i++) {
			System.out.println("bkseq[" + i + "] : " + bkseq[i]);
		}
		
		List<Integer> rvseqList = bskServ.getRvseqByBkseq(bkseq);
		// 장바구니와 예약내역을 삭제
		bskServ.delBskByBkseq(bkseq);
		if (rvseqList.size() > 0) {
			reservServ.delReservByRvseqList(rvseqList);
		}
		
		if (flagPdseq != null) model.addAttribute("flagPdseq", flagPdseq);
		if (flag != null) model.addAttribute("flag", flag);
		
		return "redirect:/basketListView.do";
	}
	
//	mu : 해당 날짜의 예약(결제완료) 리스트를 불러온다.
	@ResponseBody
	@RequestMapping(value="getMuReservListByPdseqRedate.do", method={RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> getMuReservListByPdseqRedate(ReservationDto reserv) throws Exception {
		logger.info("[PayCtrl] getMuReservListByPdseqRedate" + new Date());
		
//		System.out.println("redate : " + redate + " / " + "pdseq : " + pdseq);
		System.out.println("	" + reserv.getRedate() + " / " + reserv.getPdseq());
		
		List<ReservationDto> reservList = reservServ.getMuReservListByPdseqRedate(reserv);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reservList", reservList);
		
		return map;
	}
	
//	mu : 장바구니 담기
	@RequestMapping(value="muBasket.do", method={RequestMethod.GET,RequestMethod.POST})
	public String muBasket(Model model, ReservationDto reserv, BasketDto bsk, HttpServletRequest req, String cmd) throws Exception {
		logger.info("[PayCtrl] muBasket " + new Date());
		
		String mid = ((LoginDto)req.getSession().getAttribute("login")).getId();
		reserv.setMid(mid);
		bsk.setMid(mid);
		
		int bkseq = bskServ.getNextBkseq();
		bsk.setBkseq(bkseq);
		
		int rvseq = reservServ.getNextRvseq();
		reserv.setRvseq(rvseq);
		bsk.setRvseq(rvseq);

		reserv.setStatus("장바구니");
		
//		pdseq, redate, retime이 일치하는 상품이 장바구니에 이미 있는지 확인
//		true : 상품이 존재함(추가로 담지 않음) / false : 상품이 존재하지 않음(장바구니에 추가)
		if (reservServ.checkMuBskByMidReserv(reserv)) {
			model.addAttribute("flag", "bskFail");
		} else {
			if (reservServ.addMuReservation(reserv)) {
				if(bskServ.addMuBasket(bsk)) {
					model.addAttribute("flag", "bsk");
				}
			}
		}
		
		if (cmd != null && cmd.equals("pay")) {
			// 바로 결제
			model.addAttribute("bkseq", bkseq);
			return "redirect:/bskPayView.do";
		} else {
			// 장바구니로 이동
			if(bsk.getPdseq() >= 3000 && bsk.getPdseq() < 4000)
			{
				model.addAttribute("stseq", bsk.getPdseq());
				return "redirect:/studioDetail.do";
			}
			else {
				model.addAttribute("museq", bsk.getPdseq());
				return "redirect:/muDetailView.do";	
			}
		}
		
	}
	

//	장바구니에서 결제하기를 눌렀을 때 실행되는 메소드. 결제 view를 띄워준다.
	@RequestMapping(value="bskPayView.do", method={RequestMethod.GET,RequestMethod.POST})
	public String bskPayView(Model model, int[] bkseq, HttpServletRequest req) throws Exception {
		logger.info("[PayCtrl] bskPayView" + new Date());

		List<BasketParam> bskList = bskServ.getBskListByBkseq(bkseq);
		
		for (int i = 0; i < bskList.size(); i++) {
			int pdseq = bskList.get(i).getPdseq();
			if (pdseq >= 5000 && pdseq < 6000) {
				ReservationDto reservDto = reservServ.getReservByRvseq(bskList.get(i).getRvseq());
				if (!reservServ.checkReserv(reservDto)) {	// 예약이 가능한지 확인
					// 이미 예약이 된 경우 해당 장바구니 목록을 삭제하고 사용자에게 알려준다.
					model.addAttribute("flagPdseq", pdseq);
					model.addAttribute("flag", "noReserv");
					model.addAttribute("bkseq", bskList.get(i).getBkseq());
					return "redirect:/bskDel.do";
				}
				bskList.get(i).setReservDto(reservDto);
				bskList.get(i).setPdDto(muServ.getMakeupByMuseq(pdseq));
			} else if (pdseq >= 3000 && pdseq < 4000) {
				ReservationDto reservDto = reservServ.getReservByRvseq(bskList.get(i).getRvseq());
				if (!reservServ.checkReserv(reservDto)) {
					model.addAttribute("flagPdseq", pdseq);
					model.addAttribute("flag", "noReserv");
					model.addAttribute("bkseq", bskList.get(i).getBkseq());
					return "redirect:/bskDel.do";
				}
				bskList.get(i).setReservDto(reservDto);
				bskList.get(i).setPdDto(studioserv.getStudioByStseq(pdseq));
			}  else {
				bskList.get(i).setPdDto(cdServ.carddetail(pdseq));
			}
		}
		
		model.addAttribute("login", req.getAttribute("login"));
		model.addAttribute("bskList", bskList);
		return "bfPay.tiles";
	}
	
//	afPayView.do : 결제 내역을 db에 저장하고 결제된 장바구니내역을 삭제한다.
	@RequestMapping(value="afPayView.do", method={RequestMethod.GET,RequestMethod.POST})
	public String afPayView(Model model, PaymentParam payParam, HttpServletRequest req) throws Exception {
		logger.info("[PayCtrl] afPayView" + new Date());
		
		if (payParam.getSelectedIndex().size() <= 0) {
			return "redirect:/index.do";
		}
		int paySize = payParam.getSelectedIndex().size();

		// 테스트용 출력문
		/*System.out.println("- totalPrice : " + payParam.getTotalPrice());
		for (int i = 0; i < paySize; i++) {
			int index = payParam.getSelectedIndex().get(i);
			System.out.println("- index : " + index);
			System.out.println("- : " + payParam.getPayList().get(index).toString());
		}*/
		// 테스트용2 청첩장 정보
		
		/*for (int i = 0; i < paySize; i++) {
			int index = payParam.getSelectedIndex().get(i);
			int pdseq = payParam.getPayList().get(index).getPdseq();
			if (pdseq >= 2000 && pdseq < 3000) {
				System.out.println(payParam.getCpoList().get(index).toString());
			}
		}*/
		
		// payList의 payseq에 bkseq가 임시적으로 담겨있다.
		int[] bkseq = new int[paySize];
		for (int i = 0; i < paySize; i++) {
			int index = payParam.getSelectedIndex().get(i);
			bkseq[i] = payParam.getPayList().get(index).getPayseq();
		}

		// bsk삭제 전 bkseq배열을 통해 rvseqList를 구한다.
		// 예약목록의 status를 '결제완료'로 변경
		List<Integer> rvseqList = bskServ.getRvseqByBkseq(bkseq);
		if (rvseqList.size() != 0) {
			reservServ.updateReservStatusPay(rvseqList);
		}

		// 결제된 항목을 장바구니에서 삭제
		bskServ.delBskByBkseq(bkseq);
				
		// 결제내역을 db에 저장
		String mid = ((LoginDto)req.getSession().getAttribute("login")).getId();
		int grnum = payServ.getNextGrnum();
		for (int i = 0; i < paySize; i++) {
			int index = payParam.getSelectedIndex().get(i);
			payParam.getPayList().get(index).setMid(mid);
			payParam.getPayList().get(index).setGrnum(grnum);
			
			int pdseq = payParam.getPayList().get(index).getPdseq();
			if (pdseq >= 2000 && pdseq < 3000) {
				// cpo 저장
				int cposeq = payServ.getNextCposeq();
				payParam.getCpoList().get(index).setCposeq(cposeq);
				payServ.addCpo(payParam.getCpoList().get(index));
				
				// paymentDto에 cposeq setting
				payParam.getPayList().get(index).setCposeq(cposeq);
				payServ.addPaymentCard(payParam.getPayList().get(index));
			} else {
				payServ.addPayment(payParam.getPayList().get(index));
			}
		}
		
		// 결제완료 페이지를 띄우기 위한 코드
		List<PaymentViewParam> payList = payServ.getPaymentListByGrnum(grnum);
		for (int i = 0; i < payList.size(); i++) {
			int pdseq = payList.get(i).getPdseq();
			if (pdseq >= 5000 && pdseq < 6000) {
				ReservationDto reservDto = reservServ.getReservByRvseq(payList.get(i).getRvseq());
				payList.get(i).setReservDto(reservDto);
				payList.get(i).setPdDto(muServ.getMakeupByMuseq(pdseq));
			} else if (pdseq >= 3000 && pdseq < 4000) {
				ReservationDto reservDto = reservServ.getReservByRvseq(payList.get(i).getRvseq());
				payList.get(i).setReservDto(reservDto);
				payList.get(i).setPdDto(studioserv.getStudioByStseq(pdseq));
			} else {
				payList.get(i).setPdDto(cdServ.carddetail(pdseq));
			}
		}
				
		model.addAttribute("payList", payList);
		
		return "afPay.tiles";

	}
	
//	cd: 장바구니 담기
	@RequestMapping(value="cdBasket.do", method={RequestMethod.GET,RequestMethod.POST})
	public String cdBasket(Model model, HttpServletRequest req, int ori_price, int card_bag,
									int card_amount, int pdseq, String cmd) throws Exception {
		logger.info("[PayCtrl] cdBasket " + new Date());
		
		BasketDto bsk = new BasketDto();
		int bkseq = bskServ.getNextBkseq();

		String mid = ((LoginDto)req.getSession().getAttribute("login")).getId();
		String option2 = "";
		if (card_bag == 30000) {
			option2 = "컬러봉투(스카이블루)";
		} else if (card_bag == 20000) {
			option2 = "컬러봉투(핑크베이지)";
		} else {
			option2 = "일반봉투";
		}
		// total_price 계산
		int total_price = card_bag;
		total_price += ori_price * card_amount;
		
		bsk.setBkseq(bkseq);
		bsk.setMid(mid);
		bsk.setPdseq(pdseq);
		bsk.setOption1(card_amount + "매");
		bsk.setOption2(option2);
		bsk.setTotal_price(total_price);
		
		bskServ.addCdBasket(bsk);
		
		if (cmd != null && cmd.equals("pay")) {
			// 바로 결제
			model.addAttribute("bkseq", bkseq);
			return "redirect:/bskPayView.do";
		}

		return "redirect:/basketListView.do";
	}
	
//	pdseq에 해당하는 페이지로 이동
	@RequestMapping(value="viewPdseqPage.do", method={RequestMethod.GET,RequestMethod.POST})
	public String viewPdseqPage(Model model, int pdseq, HttpServletRequest req) throws Exception {
		
		if (pdseq >= 2000 && pdseq < 3000) {
			return "redirect:/carddetail.do?cdseq=" + pdseq;
		} else if (pdseq >= 3000 && pdseq < 4000) {
			return "redirect:/studioDetail.do?stseq=" + pdseq;
		} else {
			return "redirect:/muDetailView.do?museq=" + pdseq;
		}
		
	}

	//0424
		@RequestMapping(value="memReservList.do", method= {RequestMethod.GET, RequestMethod.POST})
		public String memReservList(Model model, HttpServletRequest req, ReservParam param) throws Exception{
			logger.info("PayCtrl memReservList " + new Date());
			
			// paging 처리
			int sn = param.getPageNumber();
			System.out.println(sn);
			int start = (sn) * param.getRecordCountPerPage()+1;
			System.out.println(start);
			int end = (sn+1) * param.getRecordCountPerPage();
			System.out.println(end);
			
			param.setStart(start);
			param.setEnd(end);
			
			//데이터의 갯수
			String id = ((LoginDto)req.getSession().getAttribute("login")).getId();
			param.setMid(id);
			
			int totalRecordCount = reservServ.getReservCount(id);
			List<ReservationDto> rlist = reservServ.ReservPagingMemList(param);

			model.addAttribute("rDtoList", rlist);
			model.addAttribute("pageNumber", sn);
			model.addAttribute("pageCountPerScreen", 10);
			model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
			model.addAttribute("totalRecordCount", totalRecordCount);

			// TODO 0427 혜영
			List<Integer> grnumList = payServ.getGrnumListByMid(id);
			List<PaymentViewParam> payList = payServ.getPaymentListByMid(id);
			for (int i = 0; i < payList.size(); i++) {
				int pdseq = payList.get(i).getPdseq();
				if (pdseq >= 5000 && pdseq < 6000) {
					ReservationDto reservDto = reservServ.getReservByRvseq(payList.get(i).getRvseq());
					payList.get(i).setReservDto(reservDto);
					payList.get(i).setPdDto(muServ.getMakeupByMuseq(pdseq));
				} else if (pdseq >= 3000 && pdseq < 4000) {
					ReservationDto reservDto = reservServ.getReservByRvseq(payList.get(i).getRvseq());
					payList.get(i).setReservDto(reservDto);
					payList.get(i).setPdDto(studioserv.getStudioByStseq(pdseq));
				} else {
					payList.get(i).setPdDto(cdServ.carddetail(pdseq));
				}
			}
			model.addAttribute("grnumList", grnumList);
			model.addAttribute("payList", payList);
			
			return "memReservList.tiles";
		}
		// 정환
		@RequestMapping(value="reservationWhList.do", method= {RequestMethod.GET, RequestMethod.POST})
		public String reservationWhList(Model model, WhParam param, HttpServletRequest req) throws Exception{
			logger.info("PayCtrl reservationWhList " + new Date());
			
			// paging 처리
			int sn = param.getPageNumber();
			System.out.println(sn);
			int start = (sn) * param.getRecordCountPerPage()+1;
			System.out.println(start);
			int end = (sn+1) * param.getRecordCountPerPage();
			System.out.println(end);
			
			param.setStart(start);
			param.setEnd(end);
			
			//데이터의 갯수
			String cid = ((LoginDto)req.getSession().getAttribute("login")).getId();
			param.setCid(cid);
			
			int totalRecordCount = reservServ.getReservDressCount(cid);
			List<ReservationDto> rlist = reservServ.weddingReservPagingComList(param);
			
			model.addAttribute("rDtoList", rlist);
			model.addAttribute("pageNumber", sn);
			model.addAttribute("pageCountPerScreen", 10);
			model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
			model.addAttribute("totalRecordCount", totalRecordCount);
			
			return "reservationWhList.tiles";
		}
		
		// 소현
		@RequestMapping(value="reservationDressList.do", method= {RequestMethod.GET, RequestMethod.POST})
		public String dressResrvList(Model model, ReservDressParam param, HttpServletRequest req) throws Exception{
			logger.info("PayCtrl dressResrvList " + new Date());
			
			// paging 처리
			int sn = param.getPageNumber();
			System.out.println(sn);
			int start = (sn) * param.getRecordCountPerPage()+1;
			System.out.println(start);
			int end = (sn+1) * param.getRecordCountPerPage();
			System.out.println(end);
			
			param.setStart(start);
			param.setEnd(end);
			
			//데이터의 갯수
			String cid = ((LoginDto)req.getSession().getAttribute("login")).getId();
			param.setCid(cid);
			
			int totalRecordCount = reservServ.getReservDressCount(cid);
			List<ReservationDto> rlist = reservServ.dressReservPagingComList(param);
			
			model.addAttribute("rDtoList", rlist);
			model.addAttribute("pageNumber", sn);
			model.addAttribute("pageCountPerScreen", 10);
			model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
			model.addAttribute("totalRecordCount", totalRecordCount);
			
			return "reservationDressList.tiles";
		}
		
		// weddingHall 예약(정환)
		@RequestMapping(value="reservationWd.do", method= {RequestMethod.GET, RequestMethod.POST})
		public String reservationWd(Model model, ReservationDto rDto) throws Exception {
			logger.info("PayCtrl reservationWd " + new Date());
			System.out.println(rDto.toString());
			reservServ.wdHallResv(rDto);		
			
			model.addAttribute("whseq", rDto.getPdseq());
			return "redirect:/hallView.do";
		}
		
		//예약 현황 확인
		@ResponseBody
		@RequestMapping(value="getWDResvListByPdseqRedate.do", method= {RequestMethod.GET, RequestMethod.POST})
		public Map<String, Object> getWDResvListByPdseqRedate(ReservationDto resv) throws Exception {
			logger.info("PayCtrl getDSReservListByPdseqRedate " + new Date());
			
			System.out.println("	" + resv.getRedate() + " / " + resv.getPdseq());
			
			List<ReservationDto> WdResvList = reservServ.getWDResvListByPdseqRedate(resv);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("WdResvList", WdResvList);
			
			return map;
		}
		
		// 캘린더 정보
		@ResponseBody
		@RequestMapping(value="calenderDate.do", method={RequestMethod.GET,RequestMethod.POST})
		public Map<String, Object> calenderDate(Model model, myCal jcal, int pdseq) throws Exception {
			logger.info("WeddingHallCtrl calenderDate " + new Date());
			
			jcal.calculate();
			String yymm = CalendarUtil.yymm(jcal.getYear(), jcal.getMonth());	// yy/mm
			
			ReservationDto fcal = new ReservationDto();
			fcal.setPdseq(pdseq);
			fcal.setRedate(yymm);
			
			
			
			// 해당월의 값
			List<ReservationVO> flist = reservServ.getWdRegList(fcal);
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("jcal", jcal);
			map.put("flist", flist);
			
			return map;
		}
}

















