package kh.com.a.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.a.model.CompanyDto;
import kh.com.a.model.JjimDto;
import kh.com.a.model.JjimlistDto;
import kh.com.a.model.ReservationDto;
import kh.com.a.model2.LoginDto;
import kh.com.a.model2.PaymentViewParam;
import kh.com.a.service.AdminpageServ;
import kh.com.a.service.CardService;
import kh.com.a.service.MakeupServ;
import kh.com.a.service.MemberServ;
import kh.com.a.service.MypageServ;
import kh.com.a.service.PaymentServ;
import kh.com.a.service.ReservationServ;
import kh.com.a.service.StudioServ;

@Controller
public class MypageCtrl {
	
@Autowired
private AdminpageServ adminserv;

@Autowired
private MypageServ mypageserv;

@Autowired
PaymentServ payServ;
@Autowired
CardService cdServ;
@Autowired
ReservationServ reservServ;
@Autowired
MakeupServ muServ;
@Autowired
StudioServ studioserv;
@Autowired
MemberServ memServ;
	
private static final Logger logger = LoggerFactory.getLogger(MemberCtrl.class);
	
@RequestMapping(value="adminpage.do", method={RequestMethod.GET,RequestMethod.POST})
public String adminpage(Model model, String flag, String delflag) throws Exception{
	logger.info("MypageController adminpage" + new Date());
	
	List<CompanyDto> companylist = adminserv.getallcompany();
	model.addAttribute("companylist", companylist);
	if (flag != null) {
		model.addAttribute("flag", flag);
	}
	if (delflag != null) {
		model.addAttribute("delflag", delflag);
	}
	return "adminpage.tiles";
}

@RequestMapping(value="companyenrollment.do", method={RequestMethod.GET,RequestMethod.POST})
public String companyenrollment(Model model, String cid) throws Exception{
	logger.info("MypageController companyenrollment" + new Date());
	
	boolean boo = adminserv.getupdategrade(cid);
	String flag = null;
	if(boo) {
		System.out.println("정상적으로 등급 수정이 완료되었습니다.");
		model.addAttribute("flag", "Gsuccess");
		return "redirect:/adminpage.do";
	}
	else {
		System.out.println("기업 등급 수정에 실패하였습니다. 다시 시도해주십시오.");
		model.addAttribute("flag", "Gfail");
		return "redirect:/adminpage.do";
	}
}

@RequestMapping(value="companydelete.do", method={RequestMethod.GET,RequestMethod.POST})
public String companydelete(Model model, String cid) throws Exception{
	logger.info("MypageController companyenrollment" + new Date());
	
	System.out.println("cid = " + cid);
	
	boolean boo = adminserv.getdelete(cid);
	
	System.out.println("boo : " + boo);
	
	String delflag = null;
	if(boo) {
		System.out.println("정상적으로 업체 탈퇴 처리가 완료되었습니다.");
		model.addAttribute("delflag", "Delsuccess");
		return "redirect:/adminpage.do";
	}
	else {
		System.out.println("업체 탈퇴 처리에 실패하였습니다. 다시 시도해주십시오.");
		model.addAttribute("delflag", "Delfail");
		return "redirect:/adminpage.do";
	}
}

@ResponseBody
@RequestMapping(value="like.do", method={RequestMethod.GET,RequestMethod.POST})
public boolean like(Model model, JjimDto jdto) throws Exception{
	logger.info("MypageController like" + new Date());
	
	JjimDto jjj = mypageserv.getJjim(jdto);
	
	if(jjj != null) {
		boolean boo = mypageserv.delJjim(jdto);
		if(boo) {
			System.out.println("정상적으로 찜목록에서 삭제되었습니다.");
			return false;
		}
	}else {
		boolean boo = mypageserv.addJjim(jdto);
		if(boo) {
			System.out.println("정상적으로 찜목록에 추가되었습니다.");
			return true;
		}
	}
	
	return true;
}

/*@RequestMapping(value="rproductAf.do", method={RequestMethod.GET,RequestMethod.POST})
public String adminpage(Model model, RproductDto rdto) throws Exception{
	logger.info("MypageController rproduct" + new Date());
	
	//rdto에 set 되어있는 rpdseq의 값에 따라 이동되는 상품뷰로 return .

	return "rproduct.tiles";
}*/

//0509 수빈
@RequestMapping(value="jjimlist.do", method={RequestMethod.GET,RequestMethod.POST})
public String jjimlist(Model model) throws Exception{
	logger.info("MypageController rproduct" + new Date());
	
	List<JjimlistDto> jjimlist = new ArrayList<>(); // jjim 테이블참조한 리스트를 seq따라 구별하여 다시  담을 리스트
	List<JjimDto> jjim = mypageserv.getJjimlist(); //jjim테이블을 참조
	
	JjimlistDto jdto = null;
	
	
	for(int i = 0; i < jjim.size(); i++)
	{
		int seq = jjim.get(i).getPdseq();
			
		if(seq >= 1000 && seq < 2000) {
			//웨딩홀 (seq, pic, cname 가져와야함 *** sql에서 as 사용하여 상품 seq를 seq로 바꿔주어야 하고 as사용하여 사진컬럼 하나를 pic으로 변경해서 가져와야함)
		}else if(seq >= 2000 && seq < 3000) {
			//청첩장
		}else if(seq >= 3000 && seq < 4000) {
			jdto = mypageserv.getJjimStudio(seq);
			jjimlist.add(jdto);
		}else if(seq >= 4000 && seq < 5000) {
			//드레스
		}else if(seq >= 5000 && seq < 6000) {
			//메이크업
		}
	}
	
	model.addAttribute("jjimlist", jjimlist);
		
	return "jjimlist.tiles";
	
}
	
//혜영
@RequestMapping(value="comPayView.do", method={RequestMethod.GET,RequestMethod.POST})
public String comPayView(Model model, HttpServletRequest req) throws Exception {
	logger.info("[PayCtrl] comPayView " + new Date());
	// WH, DS??? 여기서는 필요없나?? 결제에서만??
	
	String cid = ((LoginDto)req.getSession().getAttribute("login")).getId();
	String auth = ((LoginDto)req.getSession().getAttribute("login")).getAuth();
	if (!auth.equals("WI") && !auth.equals("MU") && !auth.equals("ST")) return "redirect:/index.do";
	
	List<PaymentViewParam> payList = new ArrayList<PaymentViewParam>();
	payList = payServ.getPaymentListByCid(cid, auth);
	if (auth.equals("WI")) {
		for (int i = 0; i < payList.size(); i++) {
			payList.get(i).setPdDto(cdServ.carddetail(payList.get(i).getPdseq()));
			payList.get(i).setCpoDto(payServ.getCpoBycposeq(payList.get(i).getCposeq()));
		}
		
		model.addAttribute("payList", payList);
		return "wiPayList.tiles";
	} else {		// MU, ST
		//String regiData = "[{title:'이벤트001', start:'2018-04-01T20:00:00'}, {title:'이벤트2', start:'2018-04-15T22:00:00'}]";
		//System.out.println("regiData : " + regiData);
		for (int i = 0; i < payList.size(); i++) {
			int pdseq = payList.get(i).getPdseq();
			ReservationDto reservDto = reservServ.getReservByRvseq(payList.get(i).getRvseq());
			payList.get(i).setReservDto(reservDto);
			if (pdseq >= 5000 && pdseq < 6000) {
				payList.get(i).setPdDto(muServ.getMakeupByMuseq(pdseq));
			} else if (pdseq >= 3000 && pdseq < 4000) {
				payList.get(i).setPdDto(studioserv.getStudioByStseq(pdseq));
			}
			payList.get(i).setMemDto(memServ.getMnamePhoneByMid(payList.get(i).getMid()));
		}
		
		// json parsing
		JSONArray regiData = new JSONArray();
		for (int i = 0; i < payList.size(); i++) {
			PaymentViewParam pay = payList.get(i);
			String title = pay.getMemDto().getMname() + "/" + pay.getOption1();
			
			String redate = pay.getReservDto().getRedate();	// yyyy-mm-dd
			String timeSplit[] = pay.getReservDto().getRetime().split("~");
			if (timeSplit[0].length() < 5) timeSplit[0] = "0" + timeSplit[0];
			String start = redate + "T" + timeSplit[0];
			String end = redate + "T" + timeSplit[1];
			
			String redateSplit[] = redate.split("-");
			String redateStr = redateSplit[0] + "년 " + redateSplit[1] + "월 " + redateSplit[2] + "일";
			// modal 내부 출력될 내용
			String str = "";
			str += pay.getReservDto().getRetime() + "<br>";
			str += payList.get(i).getMemDto().getMname() + " 고객님<br>";
			str += payList.get(i).getOption1() + "<br>";
			str += payList.get(i).getMemDto().getPhone();
			
			JSONObject jo = new JSONObject();
			jo.put("title", title);
			jo.put("start", start);
			jo.put("end", end);
			jo.put("color", "#121212");
			jo.put("url", "javascript:func('" + str +"', '" + redateStr +"')");
			regiData.put(jo);
		}
		
		model.addAttribute("regiData", regiData);
		model.addAttribute("payList", payList);
		return "regiPayList.tiles";			
	}
	
}

}
