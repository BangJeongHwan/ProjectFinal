package kh.com.a.controller;

import java.util.Date;
import java.util.List;

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
import kh.com.a.service.AdminpageServ;
import kh.com.a.service.MypageServ;
import kh.com.a.service.StudioServ;

@Controller
public class MypageCtrl {
	
@Autowired
private AdminpageServ adminserv;

@Autowired
private MypageServ mypageserv;
	
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

//최근 본 상품에 추가된후 model에 rproductlist 추가
//@ResponseBody
@RequestMapping(value="rproduct.do", method={RequestMethod.GET,RequestMethod.POST})
public String adminpage(Model model) throws Exception{
	logger.info("MypageController rproduct" + new Date());

	return "rproduct.tiles";
}

/*@RequestMapping(value="rproductAf.do", method={RequestMethod.GET,RequestMethod.POST})
public String adminpage(Model model, RproductDto rdto) throws Exception{
	logger.info("MypageController rproduct" + new Date());
	
	//rdto에 set 되어있는 rpdseq의 값에 따라 이동되는 상품뷰로 return .

	return "rproduct.tiles";
}*/


}
