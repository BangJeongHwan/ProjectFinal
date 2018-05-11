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
import kh.com.a.model2.couponVO;
import kh.com.a.service.AdminpageServ;
import kh.com.a.service.CardService;
import kh.com.a.service.CouponServ;
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
@Autowired
CouponServ couponServ; 
	
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
		System.out.println("�젙�긽�쟻�쑝濡� �벑湲� �닔�젙�씠 �셿猷뚮릺�뿀�뒿�땲�떎.");
		model.addAttribute("flag", "Gsuccess");
		return "redirect:/adminpage.do";
	}
	else {
		System.out.println("湲곗뾽 �벑湲� �닔�젙�뿉 �떎�뙣�븯���뒿�땲�떎. �떎�떆 �떆�룄�빐二쇱떗�떆�삤.");
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
		System.out.println("�젙�긽�쟻�쑝濡� �뾽泥� �깉�눜 泥섎━媛� �셿猷뚮릺�뿀�뒿�땲�떎.");
		model.addAttribute("delflag", "Delsuccess");
		return "redirect:/adminpage.do";
	}
	else {
		System.out.println("�뾽泥� �깉�눜 泥섎━�뿉 �떎�뙣�븯���뒿�땲�떎. �떎�떆 �떆�룄�빐二쇱떗�떆�삤.");
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
			System.out.println("�젙�긽�쟻�쑝濡� 李쒕ぉ濡앹뿉�꽌 �궘�젣�릺�뿀�뒿�땲�떎.");
			return false;
		}
	}else {
		boolean boo = mypageserv.addJjim(jdto);
		if(boo) {
			System.out.println("�젙�긽�쟻�쑝濡� 李쒕ぉ濡앹뿉 異붽��릺�뿀�뒿�땲�떎.");
			return true;
		}
	}
	
	return true;
}

/*@RequestMapping(value="rproductAf.do", method={RequestMethod.GET,RequestMethod.POST})
public String adminpage(Model model, RproductDto rdto) throws Exception{
	logger.info("MypageController rproduct" + new Date());
	
	//rdto�뿉 set �릺�뼱�엳�뒗 rpdseq�쓽 媛믪뿉 �뵲�씪 �씠�룞�릺�뒗 �긽�뭹酉곕줈 return .

	return "rproduct.tiles";
}*/

//0509 �닔鍮�
@RequestMapping(value="jjimlist.do", method={RequestMethod.GET,RequestMethod.POST})
public String jjimlist(Model model) throws Exception{
	logger.info("MypageController rproduct" + new Date());
	
	List<JjimlistDto> jjimlist = new ArrayList<>(); // jjim �뀒�씠釉붿갭議고븳 由ъ뒪�듃瑜� seq�뵲�씪 援щ퀎�븯�뿬 �떎�떆  �떞�쓣 由ъ뒪�듃
	List<JjimDto> jjim = mypageserv.getJjimlist(); //jjim�뀒�씠釉붿쓣 李몄“
	
	JjimlistDto jdto = null;
	
	
	for(int i = 0; i < jjim.size(); i++)
	{
		int seq = jjim.get(i).getPdseq();
			
		if(seq >= 1000 && seq < 2000) {
			//�썾�뵫�� (seq, pic, cname 媛��졇���빞�븿 *** sql�뿉�꽌 as �궗�슜�븯�뿬 �긽�뭹 seq瑜� seq濡� 諛붽퓭二쇱뼱�빞 �븯怨� as�궗�슜�븯�뿬 �궗吏꾩뺄�읆 �븯�굹瑜� pic�쑝濡� 蹂�寃쏀빐�꽌 媛��졇���빞�븿)
		}else if(seq >= 2000 && seq < 3000) {
			//泥�泥⑹옣
		}else if(seq >= 3000 && seq < 4000) {
			jdto = mypageserv.getJjimStudio(seq);
			jjimlist.add(jdto);
		}else if(seq >= 4000 && seq < 5000) {
			//�뱶�젅�뒪
		}else if(seq >= 5000 && seq < 6000) {
			//硫붿씠�겕�뾽
		}
	}
	
	model.addAttribute("jjimlist", jjimlist);
		
	return "jjimlist.tiles";
	
}
	
//�삙�쁺
@RequestMapping(value="comPayView.do", method={RequestMethod.GET,RequestMethod.POST})
public String comPayView(Model model, HttpServletRequest req) throws Exception {
	logger.info("[PayCtrl] comPayView " + new Date());
	// WH, DS??? �뿬湲곗꽌�뒗 �븘�슂�뾾�굹?? 寃곗젣�뿉�꽌留�??
	
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
		//String regiData = "[{title:'�씠踰ㅽ듃001', start:'2018-04-01T20:00:00'}, {title:'�씠踰ㅽ듃2', start:'2018-04-15T22:00:00'}]";
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
			String redateStr = redateSplit[0] + "�뀈 " + redateSplit[1] + "�썡 " + redateSplit[2] + "�씪";
			// modal �궡遺� 異쒕젰�맆 �궡�슜
			String str = "";
			str += pay.getReservDto().getRetime() + "<br>";
			str += payList.get(i).getMemDto().getMname() + " 怨좉컼�떂<br>";
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

@RequestMapping(value="mecp.do", method={RequestMethod.GET,RequestMethod.POST})
public String mecp(Model model, HttpServletRequest req) throws Exception {
		logger.info("CouponCtrl mecp.do ");
		
		LoginDto login = (LoginDto)req.getSession().getAttribute("login");
		List<couponVO> list = couponServ.mecp(login.getId());//쿠폰 리스트
		if(!list.isEmpty()) {
			for (int i = 0; i < list.size(); i++) {
				String remit = list.get(i).getRemit().substring(0, 10);
				list.get(i).setRemit(remit);
			}
		}
		model.addAttribute("list", list);
		System.out.println("리스트반환");
	return "mecp.tiles";
}

}
