package kh.com.a.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.a.model.CompanyDto;
import kh.com.a.model.CookieDto;
import kh.com.a.model.MemberDto;
import kh.com.a.model2.LoginDto;
import kh.com.a.service.MemberServ;
import kh.com.a.util.AES256Util;

@Controller
public class MemberCtrl {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberCtrl.class);
	
	@Autowired
	private MemberServ memberServ;
	
	@RequestMapping(value="index.do", method={RequestMethod.GET,RequestMethod.POST})
	public String index(Model model) {
		return "index.tiles";
	}

	@RequestMapping(value="login.do", method={RequestMethod.GET,RequestMethod.POST})
	public String login(Model model) throws Exception{
		logger.info("KhBbsController login" + new Date());
		return "login.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="kakaoLogin.do", method={RequestMethod.GET,RequestMethod.POST})
	public String kakaoLogin(Model model, String email,HttpServletRequest req) throws Exception{
		logger.info("KhBbsController kakaoLogin");
		
		LoginDto login = memberServ.kakaologin(email);
		if(login == null) {
			return "false";
		}else {
			req.getSession().setAttribute("login", login);
			return "true";				// 로그인 성공
		}
			
	}
//	로그인
	@ResponseBody
	@RequestMapping(value="loginAf.do", 
			method={RequestMethod.GET, RequestMethod.POST})
	public String loginAf(HttpServletRequest req, LoginDto loginDto, Model model)throws Exception {
		logger.info("KhMemberController loginAf " + new Date());
		String str = "ijklmnopabcdefgh";
		AES256Util aes = new AES256Util(str);
		
		String pwd = loginDto.getPwd();
		pwd = aes.encrypt(pwd); 
		loginDto.setPwd(pwd);
		LoginDto login = memberServ.login(loginDto);
		if(login == null || login.getId().equals("")) {
			req.getSession().invalidate();	
			return "false";
		}else {
			req.getSession().setAttribute("login", login);			
			return "true";				// 로그인 성공
		}	
	}
	
//	로그아웃
	@RequestMapping(value="logout.do", method={RequestMethod.GET,RequestMethod.POST})
	public String logout(Model model, HttpServletRequest req, HttpServletResponse res) throws Exception{
		req.getSession().invalidate();
		
		Cookie[] cookies = req.getCookies() ;
		CookieDto cdto = new CookieDto();
	     
	    if(cookies != null){
	        for(int i=0; i < cookies.length; i++){
	             
	            // 쿠키의 유효시간을 0으로 설정하여 만료시킨다
	            cookies[i].setMaxAge(0) ;
	            
	            cookies[i].setPath("/");
	             
	            // 응답 헤더에 추가한다
	            res.addCookie(cookies[i]) ;
	        }
	    }
	    cdto.setB(1);
	    cdto.setCheck(1);
	    cdto.setCrp1(null);
	    cdto.setCrp2(null);
	    cdto.setCrp3(null);
	    cdto.setCrp4(null);
	    cdto.setCrp5(null);
	    cdto.setCrp6(null);
		
		return "redirect:/index.do";
	}
		
	@RequestMapping(value="SelectRegi.do", method={RequestMethod.GET,RequestMethod.POST})
	public String SelectRegi(Model model) throws Exception{
		logger.info("KhBbsController SelectRegi" + new Date());
		return "SelectRegi.tiles";
	}
	
	//기업마이페이지
	@RequestMapping(value="commypage.do", method={RequestMethod.GET,RequestMethod.POST})
	public String mypage(HttpServletRequest req, Model model) throws Exception{
		logger.info("KhBbsController commypage" + new Date());
		
		String id = ((LoginDto)req.getSession().getAttribute("login")).getId();
		
		model.addAttribute("id", id);
		return "commypage.tiles";
	}
		
	//개인마이페이지
	@RequestMapping(value="memmypage.do", method={RequestMethod.GET,RequestMethod.POST})
	public String memmypage(HttpServletRequest req, Model model) throws Exception{
		logger.info("KhBbsController memmypage" + new Date());
		
		String id = ((LoginDto)req.getSession().getAttribute("login")).getId();
		
		model.addAttribute("id", id);
		return "memmypage.tiles";
	}
	
	//checkPwd
	@ResponseBody
	@RequestMapping(value="checkPwd.do", 
			method={RequestMethod.GET, RequestMethod.POST})
	public String checkPwd(HttpServletRequest req, LoginDto loginDto, Model model)throws Exception {
		logger.info("KhMemberController checkPwd " + new Date());
		String str = "ijklmnopabcdefgh";
		AES256Util aes = new AES256Util(str);
		
		String pwd = loginDto.getPwd();
		pwd = aes.encrypt(pwd); 
		loginDto.setPwd(pwd);
		LoginDto login = memberServ.login(loginDto);
		
		if(login == null || login.getId().equals("")) {
			return "false";
		}else {		
			return "true";				// 로그인 성공
		}	
	}
		
	//기업정보수정페이지 mypageUpdate
	@RequestMapping(value="mypageUpdate.do", 
			method={RequestMethod.GET, RequestMethod.POST})
	public String mypageUpdate(HttpServletRequest req, Model model) throws Exception{
		logger.info("KhBbsController mypageUpdate" + new Date());
		String str = "ijklmnopabcdefgh";
		AES256Util aes = new AES256Util(str);
		
		String id = ((LoginDto)req.getSession().getAttribute("login")).getId();
		
		CompanyDto company = memberServ.getCompanyByCid(id);
		String pwd = company.getPwd();
		pwd = aes.decrypt(pwd);
		company.setPwd(pwd);

		model.addAttribute("company", company);
		return "mypageUpdate.tiles";
	}
		
	//개인정보수정페이지 mypageUpdate
	@RequestMapping(value="memMypageUpdate.do", 
			method={RequestMethod.GET, RequestMethod.POST})
	public String memMypageUpdate(HttpServletRequest req, Model model) throws Exception{
		logger.info("KhBbsController memMypageUpdate" + new Date());
		String str = "ijklmnopabcdefgh";
		AES256Util aes = new AES256Util(str);
		
		String id = ((LoginDto)req.getSession().getAttribute("login")).getId();
		
		MemberDto member = memberServ.getMemberByMid(id);
		String pwd = member.getPwd();
		pwd = aes.decrypt(pwd);
		member.setPwd(pwd);
		
		model.addAttribute("member", member);
		return "memMypageUpdate.tiles";
	}
	
	//기업 비밀번호 update
	@ResponseBody
	@RequestMapping(value="updateCPwd.do", 
			method={RequestMethod.GET, RequestMethod.POST})
	public String updateCPwd(CompanyDto company, Model model) throws Exception{
		logger.info("KhMemberController updateCPwd " + new Date());
		String str = "ijklmnopabcdefgh";
		AES256Util aes = new AES256Util(str);
		
		String pwd = company.getPwd();
		pwd = aes.encrypt(pwd);
		company.setPwd(pwd);
		
		boolean b = memberServ.updateCPwd(company);
		
		if(b) {
			return "true";
		}else {
			return "false";
		}
	
	}
	
	//기업 주소 update
	@ResponseBody
	@RequestMapping(value="updateAddre.do", 
			method={RequestMethod.GET, RequestMethod.POST})
	public String updateAddre(CompanyDto company, Model model) throws Exception{
		logger.info("KhMemberController updateAddre " + new Date());
		
		boolean b = memberServ.updateAddre(company);
		
		if(b) {
			return "true";
		}else {
			return "false";
		}
	}
		
	// 기업 탈퇴요청
	@ResponseBody
	@RequestMapping(value="withdrawCompany.do", 
			method={RequestMethod.GET, RequestMethod.POST})
	public String withdrawCompany(String cid, Model model) throws Exception{
		logger.info("KhMemberController withdrawCompany " + new Date());
		
		boolean b = memberServ.withdrawCompany(cid);
		
		if(b) {
			return "true";
		}else {
			return "false";
		}
	}
	
	// 개인 비밀번호 update
	@ResponseBody
	@RequestMapping(value="updateMPwd.do", 
			method={RequestMethod.GET, RequestMethod.POST})
	public String updateMPwd(MemberDto member, Model model) throws Exception{
		logger.info("KhMemberController updateCPwd " + new Date());
		String str = "ijklmnopabcdefgh";
		AES256Util aes = new AES256Util(str);
		
		String pwd = member.getPwd();
		pwd = aes.encrypt(pwd);
		member.setPwd(pwd);
		
		boolean b = memberServ.updateMPwd(member);
		
		if(b) {
			return "true";
		}else {
			return "false";
		}
	
	}
		
	// 개인 주소 update
	@ResponseBody
	@RequestMapping(value="updateMAddre.do", 
			method={RequestMethod.GET, RequestMethod.POST})
	public String updateMAddre(MemberDto member, Model model) throws Exception{
		logger.info("KhMemberController updateAddre " + new Date());
		
		boolean b = memberServ.updateMAddre(member);
		
		if(b) {
			return "true";
		}else {
			return "false";
		}
	}
	// 개인 탈퇴
	@ResponseBody
	@RequestMapping(value="withdrawMember.do", 
			method={RequestMethod.GET, RequestMethod.POST})
	public String withdrawMember(String mid, Model model) throws Exception{
		logger.info("KhMemberController withdrawCompany " + new Date());
		
		boolean b = memberServ.withdrawMember(mid);
		
		if(b) {
			return "true";
		}else {
			return "false";
		}
	}
	////////////////////////
	
	@RequestMapping(value="viewCompanyJoin.do", method={RequestMethod.GET,RequestMethod.POST})
	public String viewCompanyJoin(Model model) throws Exception{
		logger.info("KhBbsController viewCompanyJoin" + new Date());
		return "companyJoin.tiles";
	}
	
	@RequestMapping(value="companyJoin.do", method={RequestMethod.GET,RequestMethod.POST})
	public String companyJoin(Model model, CompanyDto company) throws Exception{
		logger.info("KhBbsController companyJoin" + new Date());
		
		// 확인용
		System.out.println("license -------------> "+ company.getLicense());
		System.out.println(company.toString());
		
		String str = "ijklmnopabcdefgh";
		AES256Util aes = new AES256Util(str);
		String pwd = company.getPwd();
		pwd = aes.encrypt(pwd);
		company.setPwd(pwd);
		boolean b = memberServ.addCompany(company);
		if(b) {
			System.out.println("가입을 축하합니다.");
			return "redirect:/index.do";
		}else {
			System.out.println("가입에 실패했습니다.");
			return "redirect:/viewCompanyJoin.do";
		}
		
	}

//	회원가입창을 띄워준다.
	@RequestMapping(value="viewMemberJoin.do", method={RequestMethod.GET,RequestMethod.POST})
	public String viewMemberJoin(Model model) throws Exception{
		logger.info("[MemberCtrl] viewMemberJoin" + new Date());
		return "memberJoin.tiles";
	}
	
//	회원가입
	@RequestMapping(value="memberJoin.do", method={RequestMethod.GET,RequestMethod.POST})
	public String memberJoin(Model model, MemberDto member) throws Exception {
		logger.info("[MemberCtrl] memberJoin" + new Date());
		
		
		String str = "ijklmnopabcdefgh";
		AES256Util aes = new AES256Util(str);
		System.out.println(member.toString());
		String pwd = member.getPwd();
		pwd = aes.encrypt(pwd);
		member.setPwd(pwd);
		if (memberServ.addMember(member)) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
		
		return "redirect:/index.do";
	}
	
//	ajax : 회원가입시 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="checkId.do", method={RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> checkId(String id) throws Exception {
		logger.info("[MemberCtrl] checkId" + new Date());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", "id");
		
		if (memberServ.checkId(id)) {
			map.put("message", "true");
		} else {
			map.put("message", "false");
		}
		return map;
	}
	
//	ajax : 회원가입시 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value="checkEmail.do", method={RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> checkEmail(String email) throws Exception {
		logger.info("[MemberCtrl] checkEmail" + new Date());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", "email");
		if (memberServ.checkEmail(email)) {
			map.put("message", "true");
		} else {
			map.put("message", "false");
		}
		return map;
	}
	
//	관리자(admin) 기능 : 기업의 등급을 올려준다.
	@ResponseBody
	@RequestMapping(value="upCompanyGrade.do", method={RequestMethod.GET,RequestMethod.POST})
	public void upCompanyGrade(String cid) throws Exception {
		logger.info("[MemberCtrl] upCompanyGrade" + new Date());
		memberServ.upCompanyGrade(cid);
	}

//	ajax : 기업의 등급이 1이면 CompanyDto를 반환한다.
	@ResponseBody
	@RequestMapping(value="checkCompanyGrade.do", method={RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> checkCompanyGrade(String cid) throws Exception {
		logger.info("[MemberCtrl] checkCompanyGrade" + new Date());
		
		Map<String, Object> map = new HashMap<String, Object>();
		CompanyDto company = memberServ.getCompanyByCid(cid);
		if (company == null) {
			map.put("message", "null");
		} else if (company.getGrade() == 1) {		// 기업 등급이 1일 때만 게시글 작성 가능
			map.put("message", company);
		} else {
			map.put("message", "false");
		}
	
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="checkLicense.do", method={RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> checkLicense(String license) throws Exception {
		logger.info("[MemberCtrl] checkLicense" + new Date());
		
		Map<String, Object> map = new HashMap<String, Object>();
		boolean b = memberServ.checkLicense(license);
		if(b){
			map.put("message", "true");
		}else {
			map.put("message", "false");
		}
		return map;
	}
	
	//해당 기능에 대한 뷰로 이동
	@RequestMapping(value="company.do", method={RequestMethod.GET,RequestMethod.POST})
	public String detail(Model model) throws Exception{
		logger.info("KhMemberController company" + new Date());
		return "company.tiles";
	}
	
	
	
}
