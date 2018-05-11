package kh.com.a.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.a.model.CouponDto;
import kh.com.a.model2.LoginDto;
import kh.com.a.model2.couponVO;
import kh.com.a.service.CouponServ;

@Controller
public class CouponCtrl {
	
	private static final Logger logger = LoggerFactory.getLogger(CouponCtrl.class);
	
	@Autowired
	private CouponServ couponServ;
	/*public CouponCtrl() throws Exception{
			couponServ.allDel();
	}*/
	@RequestMapping(value="makecoupon.do", method={RequestMethod.GET,RequestMethod.POST})
	public String makecoupon(Model model) {
		return "makecoupon.tiles";
	}
	@RequestMapping(value="addCoupon.do", method={RequestMethod.GET,RequestMethod.POST})
	public String addCoupon(Model model, CouponDto coupon) throws Exception {
		System.out.println(coupon.toString());
		boolean b =couponServ.addcoupon(coupon);
		if(!b)System.out.println("쿠폰등록 실패");
		int sort = coupon.getSort();
		if(sort == 1) {
			return "redirect:/sharecp.do";
		}else if(sort == 2) {
			return "redirect:/challengecp.do";
		}else if(sort == 3) {
			return "redirect:/timecp.do";
		}else {
			return "redirect:/ramdomcp.do";
		}
	}
	@RequestMapping(value="couponmain.do", method={RequestMethod.GET,RequestMethod.POST})
	public String couponmain(Model model) throws Exception{
		couponServ.allDel();
		model.addAttribute("share", couponServ.getShare());
		model.addAttribute("challenge", couponServ.getChallenge());
		model.addAttribute("time", couponServ.getTime());
		model.addAttribute("random", couponServ.getRandom());

		return "couponmain.tiles";
	}
	@RequestMapping(value="sharecp.do", method={RequestMethod.GET,RequestMethod.POST})
	public String sharecp(Model model) throws Exception{
		List<CouponDto> alllist = couponServ.couponAlllist(1);
		List<CouponDto> couponlist = couponServ.couponlist(1);
		CouponDto registedCoupon = couponServ.getShare();
		model.addAttribute("alllist", alllist);
		model.addAttribute("couponlist", couponlist);
		model.addAttribute("registedCoupon", registedCoupon);
		
		return "sharecp.tiles";
	}	
	@RequestMapping(value="challengecp.do", method={RequestMethod.GET,RequestMethod.POST})
	public String challengecp(Model model) throws Exception{
		List<CouponDto> alllist = couponServ.couponAlllist(2);
		List<CouponDto> couponlist = couponServ.couponlist(2);
		List<CouponDto> registedCoupon = couponServ.getChallenge();
		
		model.addAttribute("alllist", alllist);
		model.addAttribute("couponlist", couponlist);
		model.addAttribute("registedCoupon", registedCoupon);
		
		return "challengeCp.tiles";
	}
	@RequestMapping(value="timecp.do", method={RequestMethod.GET,RequestMethod.POST})
	public String timecp(Model model) throws Exception{
		List<CouponDto> alllist = couponServ.couponAlllist(3);
		List<CouponDto> couponlist = couponServ.couponlist(3);
		CouponDto registedCoupon = couponServ.getTime();
		if(registedCoupon != null) {
			System.out.println(registedCoupon.toString());
		}
		
		
		model.addAttribute("alllist", alllist);
		model.addAttribute("couponlist", couponlist);
		model.addAttribute("registedCoupon", registedCoupon);
		
		return "timeCp.tiles";
	}
	@RequestMapping(value="ramdomcp.do", method={RequestMethod.GET,RequestMethod.POST})
	public String ramdomcp(Model model) throws Exception{
		List<CouponDto> alllist = couponServ.couponAlllist(4);
		List<CouponDto> couponlist = couponServ.couponlist(4);
		CouponDto registedCoupon = couponServ.getRandom();
		model.addAttribute("alllist", alllist);
		model.addAttribute("couponlist", couponlist);
		model.addAttribute("registedCoupon", registedCoupon);
		
		return "randomCp.tiles";
	}
	@RequestMapping(value="regcoupon.do", method={RequestMethod.GET,RequestMethod.POST})
	public String regcoupon(Model model, int seq,int sort) throws Exception {
		
		boolean b =couponServ.regCoupon(seq,sort);
		if(!b)System.out.println("쿠폰등록 실패");
		if(sort == 1) {
			return "redirect:/sharecp.do";
		}else if(sort == 3) {
			return "redirect:/timecp.do";
		}else {
			return "redirect:/ramdomcp.do";
		}
		
	}
	@RequestMapping(value="regChal.do", method={RequestMethod.GET,RequestMethod.POST})
	public String regChal(Model model, int seq1, int seq2, int seq3, int sort) throws Exception {
		System.out.println(seq1);
		System.out.println(seq2);
		System.out.println(seq3);
		System.out.println(sort);
		boolean b =couponServ.regChall(seq1, seq2, seq3, sort);
		
		if(!b)System.out.println("쿠폰등록 실패");
		
		return "redirect:/challengecp.do";
	}	
	
	@ResponseBody
	@RequestMapping(value="acqCp.do", method={RequestMethod.GET,RequestMethod.POST})
	public String acqCp(Model model, couponVO memcp) throws Exception {
			logger.info("CouponCtrl acqCp.do ");
			
		if(couponServ.acqCp(memcp)) {
			return "true";
		}else {
			return "false";
		}
	}	
	
	@RequestMapping(value="myCp.do", method={RequestMethod.GET,RequestMethod.POST})
	public String myCp(Model model, int num, String command, int bkseq, HttpServletRequest req) throws Exception {
			logger.info("CouponCtrl myCp.do ");
			
			
			
			LoginDto login = (LoginDto)req.getSession().getAttribute("login");
			List<couponVO> list = couponServ.myCp(login.getId());//쿠폰 리스트
			if(!list.isEmpty()) {
				for (int i = 0; i < list.size(); i++) {
					String remit = list.get(i).getRemit().substring(0, 10);
					list.get(i).setRemit(remit);
				}
			}
			model.addAttribute("list", list);
			model.addAttribute("num", num);
			model.addAttribute("command", command);
			model.addAttribute("bkseq", bkseq);
			
		return "myCp.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="getCp.do", method={RequestMethod.GET,RequestMethod.POST})
	public couponVO getCp(Model model, int seq) throws Exception {
		couponVO mcp = 	couponServ.getCp(seq);
			
		return mcp;
	}
	
	@ResponseBody
	@RequestMapping(value="cpbkseq.do", method={RequestMethod.GET,RequestMethod.POST})
	public String cpbkseq(Model model, couponVO memcp, HttpServletRequest req) throws Exception {
			logger.info("CouponCtrl cpbkseq.do ");
			
			
			LoginDto login = (LoginDto)req.getSession().getAttribute("login");
			String mid = login.getId();
			memcp.setMid(mid);
			couponServ.cpBkseq(memcp);
		return "Success";
	}
	
	@ResponseBody
	@RequestMapping(value="cpbkseqdel.do", method={RequestMethod.GET,RequestMethod.POST})
	public String cpbkseqdel(Model model, couponVO memcp, HttpServletRequest req) throws Exception {
			logger.info("CouponCtrl cpbkseq.do ");
			
			
			LoginDto login = (LoginDto)req.getSession().getAttribute("login");
			String mid = login.getId();
			memcp.setMid(mid);
			couponServ.cpBkseqDel(memcp);
		return "Success";
	}
	
	@ResponseBody
	@RequestMapping(value="getpaycp.do", method={RequestMethod.GET,RequestMethod.POST})
	public couponVO getpaycp(Model model, couponVO memcp, HttpServletRequest req) throws Exception {
			logger.info("CouponCtrl getpaycp.do ");
			
			
			LoginDto login = (LoginDto)req.getSession().getAttribute("login");
			String mid = login.getId();
			memcp.setMid(mid);
			couponVO cpdto = couponServ.getpaycp(memcp);
		return cpdto;
	}
	
	@RequestMapping(value="test.do", method={RequestMethod.GET,RequestMethod.POST})
	public String test(Model model, int seq) throws Exception {
			logger.info("CouponCtrl test.do ");
			
		return "test.tiles";
	}
}
