package kh.com.a.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.CookieGenerator;

import kh.com.a.model.CDetailParam;
import kh.com.a.model.CardDetailDto;
import kh.com.a.model.CardDto;
import kh.com.a.model.CardParam;
import kh.com.a.model.CookieDto;
import kh.com.a.model.JjimDto;
import kh.com.a.model.RecentDto;
import kh.com.a.model.ReviewDto;
import kh.com.a.model.ReviewParam;
import kh.com.a.model.StudioDto;
import kh.com.a.model2.CardVO;
import kh.com.a.model2.CardVO2;
import kh.com.a.model2.LoginDto;
import kh.com.a.service.CardService;
import kh.com.a.service.DressServ;
import kh.com.a.service.MakeupServ;
import kh.com.a.service.MypageServ;
import kh.com.a.service.ReviewServ;
import kh.com.a.service.StudioServ;
import kh.com.a.service.WeddingHallServ;
import kh.com.a.util.FUpUtil;

@Controller
public class CardController {
	
	private static final Logger logger = LoggerFactory.getLogger(CardController.class);
	
	@Autowired
	private CardService cardService;
	
	@Autowired
	private ReviewServ reviewServ;
	
	@Autowired
	private MypageServ mypageserv;
	
	@Autowired
	DressServ dressServ;
	
	@Autowired
	MakeupServ muServ;
	@Autowired
	WeddingHallServ weddingHallServ;
	@Autowired
	private StudioServ studioserv;
	
	@RequestMapping(value="cardlist.do", method={RequestMethod.GET,RequestMethod.POST})
	public String cardlist(Model model) throws Exception{
		logger.info("CardController clist " + new Date());
		
		List<CardDto> clist = cardService.clist();
		System.out.println("clist : " + clist.toString());
		model.addAttribute("clist", clist);

		return "cardlist.tiles";
		
	}
	
	@RequestMapping(value="pagingclist.do", method={RequestMethod.GET,RequestMethod.POST})
	public String pagingclist(CardParam dto,Model model, HttpServletRequest req) throws Exception{
		logger.info("CardController clist " + new Date());
		
		System.out.println(dto.toString());
		
		
		
		//paging
		int s = dto.getPageNumber();
		int start = (s) * dto.getRecordCountPerPage() + 1;
		int end = (s+1) * dto.getRecordCountPerPage();
		
		dto.setStart(start);
		dto.setEnd(end);
		
		Cookie[] cookies = req.getCookies();
		
		CookieDto cdto = new CookieDto();
		int check = cdto.getCheck();
		
		if(cookies!=null && cookies.length > 0){
			
			System.out.println("쿠키 크기 & 길이가 null 과 0 이 아니다!");
			
			List<RecentDto> recentlist = new ArrayList<>();
			RecentDto recentDto = null;
			for(int i=0;i<cookies.length;i++)
			{
				
				System.out.println("----------------------");
				System.out.println("i의 값은? : " + i);
				System.out.println("쿠키의 이름은? : " +cookies[i].getName());
				System.out.println("쿠키의 값은? : " +cookies[i].getValue());
				System.out.println("----------------------");
				
				if(cookies[i].getName().equals("rp0"))
				{
					int rp = Integer.parseInt(URLDecoder.decode(cookies[i].getValue(), "UTF-8"));
					if(check == 1) {
						cdto.setCrp1(Integer.toString(rp));
					}
					
					System.out.println("cookies["+i+"].getValue() : " +cookies[i].getValue());
					System.out.println("첫번째 rp : " +rp);
					
					//이 부분을 if문을 사용 -> 넘어온 seq를 비교하여 각각 다른 db테이블에 접근하여 데이터를 가져와 recentDto에 넣어주어야 한다.
					//rp는 seq 값이며 rp 값을 비교하여 각 해당하는 업체의 테이블에 접근! cid, cname, seq, pic1을 가지고 와서 recentDto에 넣어준다.
					//sql에서 각 기업에 해당하는 seq를 as를 통해 seq로 변경시켜주어야 한다.
					if(rp>=1000 && rp<2000) {
					//웨딩홀
						recentDto = weddingHallServ.getRecentProduct(rp);
					}else if(rp>=2000 && rp<3000) {
					//청첩장
						recentDto = cardService.getRecentProduct(rp);
					}else if(rp>=3000 && rp<4000) {
					//스튜디오
						recentDto = studioserv.getRecentProduct(rp);
					}else if(rp>=4000 && rp<5000) {
					//드레스
						recentDto = dressServ.getRecentProduct(rp);
					}else if(rp>=5000 && rp<6000) {
					//메이크업
						recentDto = muServ.getRecentProduct(rp);
					}
					
					System.out.println("!!! cookie rp0 !!!");
					//System.out.println("recentDto.getCid() : " + recentDto.getCid());
					//System.out.println("recentDto.getCname() : " + recentDto.getCname());
					
					recentlist.add(recentDto);
				}
				else if(cookies[i].getName().equals("rp1")) 
				{
					int rp = Integer.parseInt(URLDecoder.decode(cookies[i].getValue(), "UTF-8"));
					if(check == 1) {
						cdto.setCrp2(Integer.toString(rp));
					}
					
					System.out.println("cookies["+i+"].getValue() : " +cookies[i].getValue());
					System.out.println("두번째 rp  : " +rp);
					
						if(rp>=1000 && rp<2000) {
						//웨딩홀
							recentDto = weddingHallServ.getRecentProduct(rp);
						}else if(rp>=2000 && rp<3000) {
						//청첩장
							recentDto = cardService.getRecentProduct(rp);
						}else if(rp>=3000 && rp<4000) {
						//스튜디오
							recentDto = studioserv.getRecentProduct(rp);
						}else if(rp>=4000 && rp<5000) {
						//드레스	
							recentDto = dressServ.getRecentProduct(rp);
						}else if(rp>=5000 && rp<6000) {
						//메이크업
							recentDto = muServ.getRecentProduct(rp);
						}
					
					System.out.println("!!! cookie rp1 !!!");
					//System.out.println("recentDto.getCid() : " + recentDto.getCid());
					//System.out.println("recentDto.getCname() : " + recentDto.getCname());
					
					recentlist.add(recentDto);

				}
				else if(cookies[i].getName().equals("rp2")) 
				{
					int rp = Integer.parseInt(URLDecoder.decode(cookies[i].getValue(), "UTF-8"));
					if(check == 1) {
						cdto.setCrp3(Integer.toString(rp));
					}
					
					System.out.println("cookies["+i+"].getValue() : " +cookies[i].getValue());
					System.out.println("세번쨰 rp : " +rp);
					
						if(rp>=1000 && rp<2000) {
						//웨딩홀
							recentDto = weddingHallServ.getRecentProduct(rp);
						}else if(rp>=2000 && rp<3000) {
						//청첩장
							recentDto = cardService.getRecentProduct(rp);
						}else if(rp>=3000 && rp<4000) {
						//스튜디오
							recentDto = studioserv.getRecentProduct(rp);
						}else if(rp>=4000 && rp<5000) {
						//드레스	
							recentDto = dressServ.getRecentProduct(rp);
						}else if(rp>=5000 && rp<6000) {
						//메이크업
							recentDto = muServ.getRecentProduct(rp);
						}
					
					System.out.println("!!! cookie rp2 !!!");
					//System.out.println("recentDto.getCid() : " + recentDto.getCid());
					//System.out.println("recentDto.getCname() : " + recentDto.getCname());
					
					recentlist.add(recentDto);

				}
				else if(cookies[i].getName().equals("rp3")) 
				{
					int rp = Integer.parseInt(URLDecoder.decode(cookies[i].getValue(), "UTF-8"));
					if(check == 1) {
						cdto.setCrp4(Integer.toString(rp));
					}
					
					System.out.println("cookies["+i+"].getValue() : " +cookies[i].getValue());
					System.out.println("네번째 rp : " +rp);
					
						if(rp>=1000 && rp<2000) {
						//웨딩홀
							recentDto = weddingHallServ.getRecentProduct(rp);
						}else if(rp>=2000 && rp<3000) {
						//청첩장
							recentDto = cardService.getRecentProduct(rp);
						}else if(rp>=3000 && rp<4000) {
						//스튜디오
							recentDto = studioserv.getRecentProduct(rp);
						}else if(rp>=4000 && rp<5000) {
						//드레스	
							recentDto = dressServ.getRecentProduct(rp);
						}else if(rp>=5000 && rp<6000) {
						//메이크업
							recentDto = muServ.getRecentProduct(rp);
						}
					
					System.out.println("!!! cookie rp3 !!!");
					//System.out.println("recentDto.getCid() : " + recentDto.getCid());
					//System.out.println("recentDto.getCname() : " + recentDto.getCname());
					
					recentlist.add(recentDto);

				}
				else if(cookies[i].getName().equals("rp4")) 
				{
					int rp = Integer.parseInt(URLDecoder.decode(cookies[i].getValue(), "UTF-8"));
					if(check == 1) {
						cdto.setCrp5(Integer.toString(rp));
					}
					
					System.out.println("cookies["+i+"].getValue() : " +cookies[i].getValue());
					System.out.println("다섯번째 rp : " +rp);
					
						if(rp>=1000 && rp<2000) {
						//웨딩홀
							recentDto = weddingHallServ.getRecentProduct(rp);
						}else if(rp>=2000 && rp<3000) {
						//청첩장
							recentDto = cardService.getRecentProduct(rp);
						}else if(rp>=3000 && rp<4000) {
						//스튜디오
							recentDto = studioserv.getRecentProduct(rp);
						}else if(rp>=4000 && rp<5000) {
						//드레스	
							recentDto = dressServ.getRecentProduct(rp);
						}else if(rp>=5000 && rp<6000) {
						//메이크업
							recentDto = muServ.getRecentProduct(rp);
						}
					
					System.out.println("!!! cookie rp4 !!!");
					//System.out.println("recentDto.getCid() : " + recentDto.getCid());
					//System.out.println("recentDto.getCname() : " + recentDto.getCname());
					
					recentlist.add(recentDto);

				}
				else if(cookies[i].getName().equals("JSESSIONID"))
				{
					System.out.println("JSESSIONID 통과");
				}
			}
			model.addAttribute("recentlist",recentlist);
		}
		
		int totalRecordCount = cardService.clistcount(dto);
		List<CardDto> clist = cardService.pagingclist(dto);
		model.addAttribute("clist", clist);
		
		model.addAttribute("pageNumber", s);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", dto.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		System.out.println("占쏙옙占쏙옙");
		
		model.addAttribute("s_category", dto.getS_category());
		model.addAttribute("s_keyword", dto.getS_keyword());

		return "cardlist.tiles";
		
	}
	
	@RequestMapping(value="cadmin.do", method={RequestMethod.GET,RequestMethod.POST})
	public String cadmin(CardParam dto,Model model) throws Exception{
		logger.info("CardController cadmin " + new Date());
		
		List<CardDto> clist = cardService.clist();
		System.out.println("clist : " + clist.toString());
		model.addAttribute("clist", clist);

		return "cadmin.tiles";
		
	}
	
	@RequestMapping(value="ccdetail.do", method={RequestMethod.GET,RequestMethod.POST})
	public String ccdetail(int wiseq,Model model) throws Exception{
		logger.info("CardController ccdetail " + new Date());
		
		CardDto ccd = cardService.ccdetail(wiseq);
		List<CardDetailDto> cdlist = cardService.cdlist(wiseq);
		System.out.println("cdlist : " + cdlist.toString());
		model.addAttribute("ccd", ccd);
		model.addAttribute("clist", cdlist);

		return "ccdetail.tiles";
		
	}
	
	@RequestMapping(value="cccdetail.do", method={RequestMethod.GET,RequestMethod.POST})
	public String cccdetail(int cdseq,Model model) throws Exception{
		logger.info("CardController cccdetail " + new Date());

		
		CardDetailDto dto = cardService.carddetail(cdseq);
		System.out.println("carddetail = " + dto);
		
		model.addAttribute("dto", dto);
		
		return "cccdetail.tiles";
		
	}
	
	@RequestMapping(value="ccupdate.do", method={RequestMethod.GET,RequestMethod.POST})
	public String ccupdate(int wiseq,Model model) throws Exception{
		logger.info("CardController ccupdate " + new Date());
		
		CardDto ccd = cardService.ccdetail(wiseq);
		
		model.addAttribute("ccd", ccd);

		return "ccupdate.tiles";
	}
	
	@RequestMapping(value="ccupdateAf.do", method={RequestMethod.GET,RequestMethod.POST})
	public String ccupdateAf(CardDto dto, Model model, String filename,
			HttpServletRequest req, @RequestParam(value="pname", required=false)MultipartFile pname) throws Exception{

		logger.info("CardController ccupdateAf"+ new Date());
		
		System.out.println("filename:" + filename + "pname:" + pname);
		
		dto.setPicture(pname.getOriginalFilename());
		String fupload = req.getServletContext().getRealPath("/upload");

		logger.info(": ------------->"+ fupload);
			
		if(dto.getPicture()!=null && !dto.getPicture().equals("")){	
			String f=dto.getPicture();
			String newFile=FUpUtil.getNewFile(f);

			dto.setPicture(newFile);
			try {
				File file=new File(fupload+"/"+newFile);
				
				FileUtils.writeByteArrayToFile(file, pname.getBytes());
				cardService.ccupdate(dto);
			}
			catch (IOException e) {				
			}

		}else{
			if((filename!=null && !filename.equals("")) ){
				dto.setPicture(filename);
				cardService.ccupdate(dto);				
			}else{
				System.out.println("占쏙옙占쏙옙占쏙옙占쏙옙");
			}	
	}
		
		return "redirect:/cadmin.do";
	}
	

	@RequestMapping(value="cdupdate.do", method={RequestMethod.GET,RequestMethod.POST})
	public String cdupdate(int cdseq,Model model) throws Exception{
		logger.info("CardController ccupdate " + new Date());
		
		CardDetailDto cdd = cardService.carddetail(cdseq);
		
		model.addAttribute("cdd", cdd);

		return "cdupdate.tiles";
	}
	
	@RequestMapping(value="cdupdateAf.do", method={RequestMethod.GET,RequestMethod.POST})
	public String cdupdateAf(HttpServletRequest req, @RequestParam(value="filenames") List<String> filenames,
			MultipartHttpServletRequest mreq, Model model, CardDetailDto dto) throws Exception{
		logger.info("CardController cdupdateAf " + new Date());
		
		int cdseq = Integer.parseInt(req.getParameter("cdseq"));

		
		List<MultipartFile> mf = mreq.getFiles("files");
		List<String> mflist = new ArrayList<>();

		System.out.println("mf = " + mf);//ok
		System.out.println("size--------" + mf.size());//4
		
		List<String> list = new ArrayList<>();//dto占쏙옙 占쏙옙占쏙옙占쏙옙占쌍깍옙 占쏙옙占쏙옙 
		
		List<String> fnlist = new ArrayList<>();
		int getIndex = 0;
		
		System.out.println("filenames---------------" + filenames);

		if(mf.size()<4){
			int i=0;
			
			for(i=0;i<filenames.size();i++) {
				String filename = filenames.get(i);
				System.out.println("filename-------------" + filename);
				if(!filename.equals("") && filename!=null) {
				list.add(filename);
				}
			}
			
			getIndex = i-1;
		}
	

		System.out.println("getIndex---------" + getIndex);
		System.out.println("list---------" + list);
		
		for(int i=0; i<mf.size(); i++) {
		if(!mf.get(i).getOriginalFilename().equals("")&&mf.get(i).getOriginalFilename()!=null) {
			
				String oriname = mf.get(i).getOriginalFilename();
				
				System.out.println("oriname----------------" + oriname);//ok
				
				String fupload = req.getServletContext().getRealPath("/upload");
				logger.info("占쏙옙占싸듸옙占쏙옙:" + fupload);
				
				String newFile = FUpUtil.getNewFile(oriname);
				
				System.out.println("newFile----------------" + newFile + "---i---" + i);//ok

//				 else if(list.size()>0)
				if(list.size()==0) {
					list.add(getIndex, newFile);
				}else{
				for(int h=getIndex;h<4;h++) {
						list.add(h, newFile);
						if(list.get(h).equals(newFile)) {
							break;
						}
					}
				}
				
				System.out.println("list-------------" + list);
				
					try {
						File file = new File(fupload + "/" + newFile);
						
						FileUtils.writeByteArrayToFile(file, mf.get(i).getBytes());
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						}	
					
						dto.setPicture0(list.get(0));
						dto.setPicture1(list.get(1));
								
							if(list.size()==2) {
								dto.setPicture2("null");
								dto.setPicture3("null");
							}else if(list.size()==3) {
								dto.setPicture2(list.get(2));
								dto.setPicture3("null");
							}else if(list.size()==4) {
								dto.setPicture2(list.get(2));
								dto.setPicture3(list.get(3));
							}
							cardService.cdupdate(dto);
				
		}else {
		
			dto.setPicture0(list.get(0));
			dto.setPicture1(list.get(1));
					
				if(list.size()==2) {
					dto.setPicture2("null");
					dto.setPicture3("null");
				}else if(list.size()==3) {
					dto.setPicture3(list.get(2));
					dto.setPicture0("null");
				}else if(list.size()==4) {
					dto.setPicture2(list.get(2));
					dto.setPicture3(list.get(3));
				}
				cardService.cdupdate(dto);
			}
		}
				return  "redirect:/cccdetail.do?cdseq=" + cdseq;
	}
	
	@RequestMapping(value="cdetaillist.do", method={RequestMethod.GET,RequestMethod.POST})
	public String cdetaillist(int wiseq,Model model) throws Exception{
		logger.info("CardController cdetaillist " + new Date());
		System.out.println("wiseq = " + wiseq);
		
		List<CardDetailDto> cdlist = cardService.cdlist(wiseq);
		System.out.println("cdlist : " + cdlist.toString());
		model.addAttribute("cdlist", cdlist);

		return "cdlist.tiles";
		
	}
	
	@RequestMapping(value="carddetail.do", method={RequestMethod.GET,RequestMethod.POST})
	public String carddetail(int cdseq,String mid,String flag,Model model, ReviewParam param,JjimDto jdto,
			HttpServletRequest req, HttpServletResponse res,HttpSession session) throws Exception{
		
		logger.info("CardController carddetail " + new Date());
		
		logger.info("CardController pagingrlist " + new Date());
		
		int s = param.getPageNumber();
		int start = (s) * param.getRecordCountPerPage() + 1;
		int end = (s+1) * param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		param.setRpdseq(cdseq);
	
		int totalRecordCount = reviewServ.rlistcount(param);
		List<ReviewDto> rlist = reviewServ.pagingrlist(param);
		model.addAttribute("rlist", rlist);
		
		model.addAttribute("pageNumber", s);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("rpdseq", param.getRpdseq());
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
		
		CardDetailDto dto = cardService.carddetail(cdseq);
		System.out.println("carddetail = " + dto);
		
		JjimDto jjdto = mypageserv.getJjim(jdto);
		
		if(jjdto != null) {
			model.addAttribute("jjdto", true);
		}else {
			model.addAttribute("jjdto", false);
		}
		
		if (flag != null) {
			model.addAttribute("flag", flag);
		}
		
		LoginDto mem = (LoginDto)session.getAttribute("login");
		
		CookieDto cdto = new CookieDto();		
		int  bcheck = cdto.getB();
		
		String Crp1 = cdto.getCrp1();
		
		System.out.println("********************* Crp1 : " + Crp1);
		
		String Crp2 = cdto.getCrp2();
		
		System.out.println("********************* Crp1 : " + Crp2);
		
		String Crp3 = cdto.getCrp3();
		
		System.out.println("********************* Crp1 : " + Crp3);
		
		String Crp4 = cdto.getCrp4();
		
		System.out.println("********************* Crp1 : " + Crp4);
		
		String Crp5 = cdto.getCrp5();
		
		System.out.println("********************* Crp1 : " + Crp5);
		
		String Crp6 = cdto.getCrp6();
		
		System.out.println("********************* Crp1 : " + Crp6);

		if(mem != null && mem.getId() != "guest" && mem.getAuth() != "admin")
		{
			Cookie[] cookies = req.getCookies();
			
			CardDetailDto sttDto = cardService.carddetail(cdseq);
			
			for(int i = 0; i < cookies.length; i++){
				if(cookies[i].getName().equals("rp0")){
					bcheck++;
					cdto.setB(bcheck);
				}
			}
			
			if(bcheck == 1){
				CookieGenerator cookie = new CookieGenerator();
				cookie.setCookieName("rp0");
				cookie.setCookieMaxAge(24*60*60);
				//cookie.addCookie(res, URLEncoder.encode(sttDto.getCid(), "UTF-8"));
				cookie.addCookie(res, URLEncoder.encode(Integer.toString(sttDto.getCdseq()), "UTF-8"));
				Crp1 = Integer.toString(sttDto.getCdseq());
				cdto.setCrp1(Integer.toString(sttDto.getCdseq()));
				System.out.println("荑좏궎 rp0 �깮�꽦 �셿猷�!");
			}else{
				for(int i = 0; i < cookies.length; i++)
				{
					if(cookies[i].getName().equals("rp0") && Crp2 == null)
					{
						System.out.println("Crp1 = " +Crp1);
						CookieGenerator cookie = new CookieGenerator();
						cookie.setCookieName("rp1");
						cookie.setCookieMaxAge(24*60*60);
						cookie.addCookie(res, URLEncoder.encode(Crp1, "UTF-8"));
						System.out.println("荑좏궎 rp1 �깮�꽦 �셿猷�!");
						
						CookieGenerator cookie1 = new CookieGenerator();
						cookie1.setCookieName("rp0");
						cookie1.setCookieMaxAge(24*60*60);
						cookie1.addCookie(res, URLEncoder.encode(Integer.toString(sttDto.getCdseq()), "UTF-8"));
						Crp2 = Integer.toString(sttDto.getCdseq());
						cdto.setCrp2(Integer.toString(sttDto.getCdseq()));
						System.out.println("荑좏궎 rp0 �깮�꽦 �셿猷�!");
					}
					else if(cookies[i].getName().equals("rp1") && Crp3 == null)
					{
						System.out.println("*****************");
						System.out.println("Crp1 = " +Crp1+"  "+"Crp2 = "+Crp2);
						System.out.println("*****************");
						
						CookieGenerator cookie = new CookieGenerator();
						cookie.setCookieName("rp2");
						cookie.setCookieMaxAge(24*60*60);
						cookie.addCookie(res, URLEncoder.encode(Crp1, "UTF-8"));
						System.out.println("荑좏궎 rp2 �깮�꽦 �셿猷�!");
						
						CookieGenerator cookie1 = new CookieGenerator();
						cookie1.setCookieName("rp1");
						cookie1.setCookieMaxAge(24*60*60);
						cookie1.addCookie(res, URLEncoder.encode(Crp2, "UTF-8"));
						System.out.println("荑좏궎 rp1 �깮�꽦 �셿猷�!");
						
						CookieGenerator cookie2 = new CookieGenerator();
						cookie2.setCookieName("rp0");
						cookie2.setCookieMaxAge(24*60*60);
						cookie2.addCookie(res, URLEncoder.encode(Integer.toString(sttDto.getCdseq()), "UTF-8"));
						Crp3 = Integer.toString(sttDto.getCdseq());
						cdto.setCrp3(Integer.toString(sttDto.getCdseq()));
						System.out.println("荑좏궎 rp0 �깮�꽦 �셿猷�!");
					}
					else if(cookies[i].getName().equals("rp2") && Crp4 == null)
					{
						System.out.println("*****************");
						System.out.println("Crp1 = " +Crp1+"  "+"Crp2 = "+Crp2+"  "+"Crp3 = "+Crp3);
						System.out.println("*****************");
						CookieGenerator cookie = new CookieGenerator();
						cookie.setCookieName("rp3");
						cookie.setCookieMaxAge(24*60*60);
						cookie.addCookie(res, URLEncoder.encode(Crp1, "UTF-8"));
						System.out.println("荑좏궎 rp3 �깮�꽦 �셿猷�!");
						
						CookieGenerator cookie1 = new CookieGenerator();
						cookie1.setCookieName("rp2");
						cookie1.setCookieMaxAge(24*60*60);
						cookie1.addCookie(res, URLEncoder.encode(Crp2, "UTF-8"));
						System.out.println("荑좏궎 rp2 �깮�꽦 �셿猷�!");
						
						CookieGenerator cookie2 = new CookieGenerator();
						cookie2.setCookieName("rp1");
						cookie2.setCookieMaxAge(24*60*60);
						cookie2.addCookie(res, URLEncoder.encode(Crp3, "UTF-8"));
						System.out.println("荑좏궎 rp1 �깮�꽦 �셿猷�!");
						
						CookieGenerator cookie3 = new CookieGenerator();
						cookie3.setCookieName("rp0");
						cookie3.setCookieMaxAge(24*60*60);
						cookie3.addCookie(res, URLEncoder.encode(Integer.toString(sttDto.getCdseq()), "UTF-8"));
						Crp4 = Integer.toString(sttDto.getCdseq());
						cdto.setCrp4(Integer.toString(sttDto.getCdseq()));
						System.out.println("荑좏궎 rp0 �깮�꽦 �셿猷�!");
					}
					else if(cookies[i].getName().equals("rp3") && Crp5 == null)
					{
						CookieGenerator cookie = new CookieGenerator();
						cookie.setCookieName("rp4");
						cookie.setCookieMaxAge(24*60*60);
						cookie.addCookie(res, URLEncoder.encode(Crp1, "UTF-8"));
						System.out.println("荑좏궎 rp4 �깮�꽦 �셿猷�!");
					
						CookieGenerator cookie1 = new CookieGenerator();
						cookie1.setCookieName("rp3");
						cookie1.setCookieMaxAge(24*60*60);
						cookie1.addCookie(res, URLEncoder.encode(Crp2, "UTF-8"));
						System.out.println("荑좏궎 rp3 �깮�꽦 �셿猷�!");
						
						CookieGenerator cookie2 = new CookieGenerator();
						cookie2.setCookieName("rp2");
						cookie2.setCookieMaxAge(24*60*60);
						cookie2.addCookie(res, URLEncoder.encode(Crp3, "UTF-8"));
						System.out.println("荑좏궎 rp2 �깮�꽦 �셿猷�!");
						
						CookieGenerator cookie3 = new CookieGenerator();
						cookie3.setCookieName("rp1");
						cookie3.setCookieMaxAge(24*60*60);
						cookie3.addCookie(res, URLEncoder.encode(Crp4, "UTF-8"));
						System.out.println("荑좏궎 rp1 �깮�꽦 �셿猷�!");
						
						CookieGenerator cookie4 = new CookieGenerator();
						cookie4.setCookieName("rp0");
						cookie4.setCookieMaxAge(24*60*60);
						cookie4.addCookie(res, URLEncoder.encode(Integer.toString(sttDto.getCdseq()), "UTF-8"));
						Crp5 = Integer.toString(sttDto.getCdseq());
						cdto.setCrp5(Integer.toString(sttDto.getCdseq()));
						System.out.println("荑좏궎 rp0 �깮�꽦 �셿猷�!");
					}
					else if(cookies[i].getName().equals("rp4") && Crp1 != null && Crp2 != null&& Crp3 != null 
							&& Crp4 != null && Crp5 != null)
					{
						CookieGenerator cookie = new CookieGenerator();
						cookie.setCookieName("rp4");
						cookie.setCookieMaxAge(24*60*60);
						cookie.addCookie(res, URLEncoder.encode(Crp2, "UTF-8"));
						System.out.println("荑좏궎 rp4 �깮�꽦 �셿猷�!");
					
						CookieGenerator cookie1 = new CookieGenerator();
						cookie1.setCookieName("rp3");
						cookie1.setCookieMaxAge(24*60*60);
						cookie1.addCookie(res, URLEncoder.encode(Crp3, "UTF-8"));
						System.out.println("荑좏궎 rp3 �깮�꽦 �셿猷�!");
						
						CookieGenerator cookie2 = new CookieGenerator();
						cookie2.setCookieName("rp2");
						cookie2.setCookieMaxAge(24*60*60);
						cookie2.addCookie(res, URLEncoder.encode(Crp4, "UTF-8"));
						System.out.println("荑좏궎 rp2 �깮�꽦 �셿猷�!");
						
						CookieGenerator cookie3 = new CookieGenerator();
						cookie3.setCookieName("rp1");
						cookie3.setCookieMaxAge(24*60*60);
						cookie3.addCookie(res, URLEncoder.encode(Crp5, "UTF-8"));
						System.out.println("荑좏궎 rp1 �깮�꽦 �셿猷�!");
						
						CookieGenerator cookie4 = new CookieGenerator();
						cookie4.setCookieName("rp0");
						cookie4.setCookieMaxAge(24*60*60);
						cookie4.addCookie(res, URLEncoder.encode(Integer.toString(sttDto.getCdseq()), "UTF-8"));
						Crp6 = Integer.toString(sttDto.getCdseq());
						cdto.setCrp6(Integer.toString(sttDto.getCdseq()));
						
						
						cdto.setCrp2((cdto.getCrp3()));						
						cdto.setCrp3((cdto.getCrp4()));						
						cdto.setCrp4((cdto.getCrp5()));					
						cdto.setCrp5((cdto.getCrp6()));
						
						System.out.println("荑좏궎 rp0 �깮�꽦 �셿猷�!");
					}else{
						System.out.println("----------�넻怨�-----------  : "+ i);
					}
				}
			}
		}
		model.addAttribute("dto", dto);
		
		return "carddetail.tiles";
	}


	@RequestMapping(value="cardwrite.do", method={RequestMethod.GET,RequestMethod.POST})
	public String cardwrite(Model model) {
		logger.info("CardController cardwrite " + new Date());
		return "cardwrite.tiles";
	}
	
	@RequestMapping(value="cardwriteAf.do", method={RequestMethod.GET,RequestMethod.POST})
	public String cardwriteAf(CardDto dto, Model model,
			HttpServletRequest req, @RequestParam(value="pname", required=false)MultipartFile pname) throws Exception{
		
		logger.info("CardController cardwriteAf " + new Date());
		
		dto.setPicture(pname.getOriginalFilename());
		System.out.println("file=" + pname);
		
		
		String fupload = req.getServletContext().getRealPath("/upload");
		logger.info("占쏙옙占싸듸옙占쏙옙:" + fupload);
		System.out.println("占쏙옙占싸듸옙占쏙옙:" + fupload);
		String f = dto.getPicture();
		
		String newFile = FUpUtil.getNewFile(f);
		
		dto.setPicture(newFile);

		try {
		File file = new File(fupload + "/" + newFile);

		FileUtils.writeByteArrayToFile(file, pname.getBytes());
		
		cardService.cardwrite(dto);
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/cadmin.do";
	}
	
	@RequestMapping(value="cdwrite.do", method={RequestMethod.GET,RequestMethod.POST})
	public String cdwrite(int wiseq,Model model) throws Exception{
		logger.info("CardController cdwrite " + new Date());
		CardDto ccd = cardService.ccdetail(wiseq);
		model.addAttribute("ccd", ccd);
		return "cdwrite.tiles";
	}
	
	@RequestMapping(value="cdwriteAf.do", method={RequestMethod.GET,RequestMethod.POST})
	public String cdwriteAf(Model model, CardDetailDto dto, HttpServletRequest req,
			@ModelAttribute("uploadForm") CardVO uploadForm) throws Exception {
		logger.info("CardController cdwriteAf " + new Date());
		
		String category = req.getParameter("category");
		int cbag = Integer.parseInt(req.getParameter("cbag"));
		String cardsize = req.getParameter("cardsize");
		String cid=req.getParameter("cid");
		
		dto.setCategory(category);
		dto.setCbag(cbag);
		dto.setCardsize(cardsize);
		dto.setCid(cid);
		
		
		System.out.println("dto: " + dto);
		List<MultipartFile> files = uploadForm.getFiles();
		
		List<String> fileNames = new ArrayList<String>();
		
		if(files!= null && files.size()>0) {
			for(MultipartFile multipartFile : files) {
				String fileName = multipartFile.getOriginalFilename();
				
				String path = uploadForm.getUpDir() + "/"+ fileName;

				System.out.println("path = " + path);
				File f = new File(path);

				multipartFile.transferTo(f);

				fileNames.add(fileName);
			}
		}
		
		dto.setPicture0(fileNames.get(0));
		dto.setPicture1(fileNames.get(1));
		dto.setPicture2(fileNames.get(2));
		dto.setPicture3(fileNames.get(3));

		cardService.cdwrite(dto);
		
		model.addAttribute("files", fileNames);
		return "redirect:/cadmin.do";
	}
	
	@RequestMapping(value="ccdelete.do", method={RequestMethod.GET,RequestMethod.POST})
	public String ccdelete(int cdseq, Model model) throws Exception{
		logger.info("CardController ccdelete " + new Date());
		
		boolean isS = cardService.ccdelete(cdseq);
		
		if(isS) {
			return "redirect:/cadmin.do";
		}else {
			return "redirect:/cadmin.do";
		}
	}
	
	@RequestMapping(value="pagingcdlist.do", method={RequestMethod.GET,RequestMethod.POST})
	public String pagingcdlist(int wiseq,HttpServletRequest req,CDetailParam dto,Model model) throws Exception{
		logger.info("CardController pagingcdlist " + new Date());
		
		
		String order = req.getParameter("order");
		System.out.println("wiseq=" + wiseq);
		
		System.out.println("order----------" + order );
		//paging
		int s = dto.getPageNumber();
		int start = (s) * dto.getRecordCountPerPage() + 1;
		int end = (s+1) * dto.getRecordCountPerPage();
		/*
		Cookie[] cookies = req.getCookies();
		
		CookieDto cdto = new CookieDto();
		int check = cdto.getCheck();
		
		if(cookies!=null && cookies.length > 0){
			
			System.out.println("荑좏궎 �겕湲� & 湲몄씠媛� null 怨� 0 �씠 �븘�땲�떎!");
			
			List<RecentDto> recentlist = new ArrayList<>();
			RecentDto recentDto = null;
			for(int i=0;i<cookies.length;i++)
			{
				
				System.out.println("----------------------");
				System.out.println("i�쓽 媛믪�? : " + i);
				System.out.println("荑좏궎�쓽 �씠由꾩�? : " +cookies[i].getName());
				System.out.println("荑좏궎�쓽 媛믪�? : " +cookies[i].getValue());
				System.out.println("----------------------");
				
				if(cookies[i].getName().equals("rp0"))
				{
					int rp = Integer.parseInt(URLDecoder.decode(cookies[i].getValue(), "UTF-8"));
					if(check == 1) {
						cdto.setCrp1(Integer.toString(rp));
					}
					
					System.out.println("cookies["+i+"].getValue() : " +cookies[i].getValue());
					System.out.println("泥ル쾲吏� rp : " +rp);
					
					//�씠 遺�遺꾩쓣 if臾몄쓣 �궗�슜 -> �꽆�뼱�삩 seq瑜� 鍮꾧탳�븯�뿬 媛곴컖 �떎瑜� db�뀒�씠釉붿뿉 �젒洹쇳븯�뿬 �뜲�씠�꽣瑜� 媛��졇�� recentDto�뿉 �꽔�뼱二쇱뼱�빞 �븳�떎.
					//rp�뒗 seq 媛믪씠硫� rp 媛믪쓣 鍮꾧탳�븯�뿬 媛� �빐�떦�븯�뒗 �뾽泥댁쓽 �뀒�씠釉붿뿉 �젒洹�! cid, cname, seq, pic1�쓣 媛�吏�怨� ���꽌 recentDto�뿉 �꽔�뼱以��떎.
					//sql�뿉�꽌 媛� 湲곗뾽�뿉 �빐�떦�븯�뒗 seq瑜� as瑜� �넻�빐 seq濡� 蹂�寃쎌떆耳쒖＜�뼱�빞 �븳�떎.
					if(rp>=1000 && rp<2000) {
					//�썾�뵫��
					}else if(rp>=2000 && rp<3000) {
					//泥�泥⑹옣
					}else if(rp>=3000 && rp<4000) {
					//�뒪�뒠�뵒�삤
						recentDto = studioserv.getRecentProduct(rp);
					}else if(rp>=4000 && rp<5000) {
					//�뱶�젅�뒪
						recentDto = dressServ.getRecentProduct(rp);
					}else if(rp>=5000 && rp<6000) {
					//硫붿씠�겕�뾽
						recentDto = muServ.getRecentProduct(rp);
					}
					
					System.out.println("!!! cookie rp0 !!!");
					System.out.println("recentDto.getCid() : " + recentDto.getCid());
					System.out.println("recentDto.getCname() : " + recentDto.getCname());
					
					recentlist.add(recentDto);
				}
				else if(cookies[i].getName().equals("rp1")) 
				{
					int rp = Integer.parseInt(URLDecoder.decode(cookies[i].getValue(), "UTF-8"));
					if(check == 1) {
						cdto.setCrp2(Integer.toString(rp));
					}
					
					System.out.println("cookies["+i+"].getValue() : " +cookies[i].getValue());
					System.out.println("�몢踰덉㎏ rp  : " +rp);
					
						if(rp>=1000 && rp<2000) {
						//�썾�뵫��
						}else if(rp>=2000 && rp<3000) {
						//泥�泥⑹옣
						}else if(rp>=3000 && rp<4000) {
						//�뒪�뒠�뵒�삤
							recentDto = studioserv.getRecentProduct(rp);
						}else if(rp>=4000 && rp<5000) {
						//�뱶�젅�뒪	
							recentDto = dressServ.getRecentProduct(rp);
						}else if(rp>=5000 && rp<6000) {
						//硫붿씠�겕�뾽
							recentDto = muServ.getRecentProduct(rp);
						}
					
					System.out.println("!!! cookie rp1 !!!");
					System.out.println("recentDto.getCid() : " + recentDto.getCid());
					System.out.println("recentDto.getCname() : " + recentDto.getCname());
					
					recentlist.add(recentDto);

				}
				else if(cookies[i].getName().equals("rp2")) 
				{
					int rp = Integer.parseInt(URLDecoder.decode(cookies[i].getValue(), "UTF-8"));
					if(check == 1) {
						cdto.setCrp3(Integer.toString(rp));
					}
					
					System.out.println("cookies["+i+"].getValue() : " +cookies[i].getValue());
					System.out.println("�꽭踰덉�� rp : " +rp);
					
						if(rp>=1000 && rp<2000) {
						//�썾�뵫��
						}else if(rp>=2000 && rp<3000) {
						//泥�泥⑹옣
						}else if(rp>=3000 && rp<4000) {
						//�뒪�뒠�뵒�삤
							recentDto = studioserv.getRecentProduct(rp);
						}else if(rp>=4000 && rp<5000) {
						//�뱶�젅�뒪	
							recentDto = dressServ.getRecentProduct(rp);
						}else if(rp>=5000 && rp<6000) {
						//硫붿씠�겕�뾽
							recentDto = muServ.getRecentProduct(rp);
						}
					
					System.out.println("!!! cookie rp2 !!!");
					System.out.println("recentDto.getCid() : " + recentDto.getCid());
					System.out.println("recentDto.getCname() : " + recentDto.getCname());
					
					recentlist.add(recentDto);

				}
				else if(cookies[i].getName().equals("rp3")) 
				{
					int rp = Integer.parseInt(URLDecoder.decode(cookies[i].getValue(), "UTF-8"));
					if(check == 1) {
						cdto.setCrp4(Integer.toString(rp));
					}
					
					System.out.println("cookies["+i+"].getValue() : " +cookies[i].getValue());
					System.out.println("�꽕踰덉㎏ rp : " +rp);
					
						if(rp>=1000 && rp<2000) {
						//�썾�뵫��
						}else if(rp>=2000 && rp<3000) {
						//泥�泥⑹옣
							recentDto = cardService.getRecentProduct(rp);
						}else if(rp>=3000 && rp<4000) {
						//�뒪�뒠�뵒�삤
							recentDto = studioserv.getRecentProduct(rp);
						}else if(rp>=4000 && rp<5000) {
						//�뱶�젅�뒪	
							recentDto = dressServ.getRecentProduct(rp);
						}else if(rp>=5000 && rp<6000) {
						//硫붿씠�겕�뾽
							recentDto = muServ.getRecentProduct(rp);
						}
					
					System.out.println("!!! cookie rp3 !!!");
					System.out.println("recentDto.getCid() : " + recentDto.getCid());
					System.out.println("recentDto.getCname() : " + recentDto.getCname());
					
					recentlist.add(recentDto);

				}
				else if(cookies[i].getName().equals("rp4")) 
				{
					int rp = Integer.parseInt(URLDecoder.decode(cookies[i].getValue(), "UTF-8"));
					if(check == 1) {
						cdto.setCrp5(Integer.toString(rp));
					}
					
					System.out.println("cookies["+i+"].getValue() : " +cookies[i].getValue());
					System.out.println("�떎�꽢踰덉㎏ rp : " +rp);
					
						if(rp>=1000 && rp<2000) {
						//�썾�뵫��
						}else if(rp>=2000 && rp<3000) {
						//泥�泥⑹옣
							recentDto = cardService.getRecentProduct(rp);
						}else if(rp>=3000 && rp<4000) {
						//�뒪�뒠�뵒�삤
							recentDto = studioserv.getRecentProduct(rp);
						}else if(rp>=4000 && rp<5000) {
						//�뱶�젅�뒪	
							recentDto = dressServ.getRecentProduct(rp);
						}else if(rp>=5000 && rp<6000) {
						//硫붿씠�겕�뾽
							recentDto = muServ.getRecentProduct(rp);
						}
					
					System.out.println("!!! cookie rp4 !!!");
					System.out.println("recentDto.getCid() : " + recentDto.getCid());
					System.out.println("recentDto.getCname() : " + recentDto.getCname());
					
					recentlist.add(recentDto);

				}
				else if(cookies[i].getName().equals("JSESSIONID"))
				{
					System.out.println("JSESSIONID �넻怨�");
				}
			}
			model.addAttribute("recentlist",recentlist);
		}*/
		
		dto.setStart(start);
		dto.setEnd(end);
		
		System.out.println(dto.toString());
		
		int totalRecordCount = cardService.cdlistcount(dto);
		System.out.println("totalRecordCount----------" +totalRecordCount);
		CardDto ccd = cardService.ccdetail(wiseq);
		model.addAttribute("ccd", ccd);
		List<CardDetailDto> cdlist = cardService.pagingcdlist(dto);
		System.out.println("cdlist==========" + cdlist);
		model.addAttribute("cdlist", cdlist);
		
		model.addAttribute("pageNumber", s);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", dto.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("order", dto.getOrder());
		model.addAttribute("wiseq", dto.getWiseq());
		model.addAttribute("category", dto.getCategory());
		model.addAttribute("cbag", dto.getCbag());
		model.addAttribute("cardsize", dto.getCardsize());
		model.addAttribute("s_category", dto.getS_category());
		model.addAttribute("s_keyword", dto.getS_keyword());

		return "cdlist.tiles";
		
	}

	
	
	@ResponseBody
	@RequestMapping(value="caridcheck.do", method={RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> caridcheck(String cid) throws Exception{
		logger.info("CardController caridcheck " + new Date());
		
		Map<String, Object> map = new HashMap<String, Object>();
		CardDto card = cardService.cidckeck(cid);
		if(card ==null) {
			map.put("message", "null");
		} else if(card.getCid()== cid) {
			map.put("message", cid);
		} else {
			map.put("message", "false");
		}
		return map;
	}

}
