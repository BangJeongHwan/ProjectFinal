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

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.CookieGenerator;

import kh.com.a.model.CookieDto;
import kh.com.a.model.DressDto;
import kh.com.a.model.JjimDto;
import kh.com.a.model.RecentDto;
import kh.com.a.model.ReservationDto;
import kh.com.a.model.ReviewDto;
import kh.com.a.model.WHallPictureDto;
import kh.com.a.model.WeddingDto;
import kh.com.a.model.WeddingHallDto;
import kh.com.a.model2.LoginDto;
import kh.com.a.model2.ReservationVO;
import kh.com.a.model2.WHallPicSumVO;
import kh.com.a.model2.WdParam;
import kh.com.a.service.CardService;
import kh.com.a.service.DressServ;
import kh.com.a.service.MakeupServ;
import kh.com.a.service.MypageServ;
import kh.com.a.service.ReservationServ;
import kh.com.a.service.ReviewServ;
import kh.com.a.service.StudioServ;
import kh.com.a.service.WeddingHallServ;
import kh.com.a.util.CalendarUtil;
import kh.com.a.util.FUpUtil;
import kh.com.a.util.myCal;

@Controller
public class WeddingHallCtrl {
	private static final Logger logger = LoggerFactory.getLogger(MemberCtrl.class);
	
	// 웨딩
	@Autowired
	WeddingHallServ weddingHallServ;

	//스튜디오
	@Autowired
	private StudioServ studioserv;
	
	// 드레스
	@Autowired
	DressServ dressServ;
	
	//메이크업
	@Autowired
	MakeupServ muServ;
	
	// 청첩장
	@Autowired
	private CardService cardService;
	
	
	//예약 때문에
	@Autowired
	ReservationServ reservServ;
	
	// 찜
	@Autowired
	MypageServ mypageserv;
	
	// 후기
	@Autowired
	ReviewServ reviewServ;
	
	// 웨딩 업체 뷰
	@RequestMapping(value="weddingHallView.do", method={RequestMethod.GET,RequestMethod.POST})
	public String weddingHallView(Model model, HttpServletRequest req) throws Exception {
		logger.info("WeddingHallCtrl weddingHallView" + new Date());
		
		LoginDto login = (LoginDto)req.getSession().getAttribute("login");
		model.addAttribute("login", login);
		
		///////////////// 최신본 상품
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
					//.out.println("recentDto.getCid() : " + recentDto.getCid());
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
		//////////////////////
		List<WeddingDto> list = weddingHallServ.getWeddingList();
		model.addAttribute("list", list);
		
		
		
		return "weddinghall.tiles";
	}
	
	// 웨딩 업체 추가 view
	@RequestMapping(value="weddingwrite.do", method={RequestMethod.GET,RequestMethod.POST})
	public String weddingwrite(Model model) {
		logger.info("WeddingHallCtrl weddingwrite" + new Date());
		return "weddingwrite.tiles";
	}
	
	// 웨딩 업체 추가
	@RequestMapping(value="weddingwriteAf.do",method={RequestMethod.GET, RequestMethod.POST})
	public String weddingwriteAf(WeddingDto wd, 
							HttpServletRequest req,
							Model model,
							@RequestParam(value="fileload", required=false)
							MultipartFile fileload) {
		logger.info("WeddingHallCtrl weddingwriteAf" + new Date());
		
		
		// 파일 이름을 취득
		wd.setPicture(fileload.getOriginalFilename());
		System.out.println(wd.getPicture());
		
		//업로드 경로
		// tomcat
		String fupload = req.getServletContext().getRealPath("/upload");
		System.out.println("파일 업로드 경로 : " + fupload);
		
		// 폴더
		//String fupload = "d:\\tmp"
		
		String f = wd.getPicture();
		String newFile = FUpUtil.getNewFile(f);
		
		wd.setPicture(newFile);
		try {
			File file = new File(fupload + "/" + newFile);
			// 실제 업로드 부분
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			// DB에 저장
			weddingHallServ.addWedding(wd);
					
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/weddingHallView.do";
	}

	// 웨딩 업체 추가 view
	@RequestMapping(value="Weddingdel.do", method={RequestMethod.GET,RequestMethod.POST})
	public String Weddingdel(Model model, int whseq) {
		logger.info("WeddingHallCtrl Weddingdel" + new Date());
		
		weddingHallServ.Weddingdel(whseq);

		return "redirect:/weddingHallView.do";
	}
	
	// 홀 별 변경
	@ResponseBody
	@RequestMapping(value="resetList.do", method={RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> resetList(Model model, String type, String data) throws Exception {
		logger.info("WeddingHallCtrl resetList " + new Date());
		
		List<WeddingDto> list = weddingHallServ.selWeddingList(type, data);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}
		
	
	//////////////////////////////////////////////////////////////////////////////
	// 웨딩 홀 디테일 뷰
	@RequestMapping(value="hallView.do", method={RequestMethod.GET,RequestMethod.POST})
	public String hallDetailView(Model model, int whseq, myCal jcal,HttpServletRequest req, HttpServletResponse res, JjimDto jdto) throws Exception {
		logger.info("WeddingHallCtrl hallView" + new Date());
		
		LoginDto login = (LoginDto)req.getSession().getAttribute("login");
		
		// UPreadcount
		weddingHallServ.upReadCount(whseq);
		
		WeddingDto wd = weddingHallServ.getWedding(whseq);
		List<WeddingHallDto> hallList = weddingHallServ.getHallList(whseq);
		List<WHallPicSumVO> hallSumList = weddingHallServ.getHallSumList(whseq);
		List<WHallPictureDto> piclist = weddingHallServ.getAllHallPicList(whseq);
		
		//////////////// 쿠키
		CookieDto cdto = new CookieDto();		
		int  bcheck = cdto.getB();
		
		String Crp1 = cdto.getCrp1();
		String Crp2 = cdto.getCrp2();
		String Crp3 = cdto.getCrp3();
		String Crp4 = cdto.getCrp4();
		String Crp5 = cdto.getCrp5();
		String Crp6 = cdto.getCrp6();
		
		if(login != null && login.getId() != "guest" && login.getAuth() != "admin")
		{
			Cookie[] cookies = req.getCookies();
			
			WeddingDto Wdto = weddingHallServ.getWedding(whseq);
			
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
				cookie.addCookie(res, URLEncoder.encode(Integer.toString(Wdto.getWhseq()), "UTF-8"));
				Crp1 = Integer.toString(Wdto.getWhseq());
				cdto.setCrp1(Integer.toString(Wdto.getWhseq()));
				System.out.println("쿠키 rp0 생성 완료!");
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
						System.out.println("쿠키 rp1 생성 완료!");
						
						CookieGenerator cookie1 = new CookieGenerator();
						cookie1.setCookieName("rp0");
						cookie1.setCookieMaxAge(24*60*60);
						cookie1.addCookie(res, URLEncoder.encode(Integer.toString(Wdto.getWhseq()), "UTF-8"));
						Crp2 = Integer.toString(Wdto.getWhseq());
						cdto.setCrp2(Integer.toString(Wdto.getWhseq()));
						System.out.println("쿠키 rp0 생성 완료!");
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
						System.out.println("쿠키 rp2 생성 완료!");
						
						CookieGenerator cookie1 = new CookieGenerator();
						cookie1.setCookieName("rp1");
						cookie1.setCookieMaxAge(24*60*60);
						cookie1.addCookie(res, URLEncoder.encode(Crp2, "UTF-8"));
						System.out.println("쿠키 rp1 생성 완료!");
						
						CookieGenerator cookie2 = new CookieGenerator();
						cookie2.setCookieName("rp0");
						cookie2.setCookieMaxAge(24*60*60);
						cookie2.addCookie(res, URLEncoder.encode(Integer.toString(Wdto.getWhseq()), "UTF-8"));
						Crp3 = Integer.toString(Wdto.getWhseq());
						cdto.setCrp3(Integer.toString(Wdto.getWhseq()));
						System.out.println("쿠키 rp0 생성 완료!");
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
						System.out.println("쿠키 rp3 생성 완료!");
						
						CookieGenerator cookie1 = new CookieGenerator();
						cookie1.setCookieName("rp2");
						cookie1.setCookieMaxAge(24*60*60);
						cookie1.addCookie(res, URLEncoder.encode(Crp2, "UTF-8"));
						System.out.println("쿠키 rp2 생성 완료!");
						
						CookieGenerator cookie2 = new CookieGenerator();
						cookie2.setCookieName("rp1");
						cookie2.setCookieMaxAge(24*60*60);
						cookie2.addCookie(res, URLEncoder.encode(Crp3, "UTF-8"));
						System.out.println("쿠키 rp1 생성 완료!");
						
						CookieGenerator cookie3 = new CookieGenerator();
						cookie3.setCookieName("rp0");
						cookie3.setCookieMaxAge(24*60*60);
						cookie3.addCookie(res, URLEncoder.encode(Integer.toString(Wdto.getWhseq()), "UTF-8"));
						Crp4 = Integer.toString(Wdto.getWhseq());
						cdto.setCrp4(Integer.toString(Wdto.getWhseq()));
						System.out.println("쿠키 rp0 생성 완료!");
					}
					else if(cookies[i].getName().equals("rp3") && Crp5 == null)
					{
						CookieGenerator cookie = new CookieGenerator();
						cookie.setCookieName("rp4");
						cookie.setCookieMaxAge(24*60*60);
						cookie.addCookie(res, URLEncoder.encode(Crp1, "UTF-8"));
						System.out.println("쿠키 rp4 생성 완료!");
					
						CookieGenerator cookie1 = new CookieGenerator();
						cookie1.setCookieName("rp3");
						cookie1.setCookieMaxAge(24*60*60);
						cookie1.addCookie(res, URLEncoder.encode(Crp2, "UTF-8"));
						System.out.println("쿠키 rp3 생성 완료!");
						
						CookieGenerator cookie2 = new CookieGenerator();
						cookie2.setCookieName("rp2");
						cookie2.setCookieMaxAge(24*60*60);
						cookie2.addCookie(res, URLEncoder.encode(Crp3, "UTF-8"));
						System.out.println("쿠키 rp2 생성 완료!");
						
						CookieGenerator cookie3 = new CookieGenerator();
						cookie3.setCookieName("rp1");
						cookie3.setCookieMaxAge(24*60*60);
						cookie3.addCookie(res, URLEncoder.encode(Crp4, "UTF-8"));
						System.out.println("쿠키 rp1 생성 완료!");
						
						CookieGenerator cookie4 = new CookieGenerator();
						cookie4.setCookieName("rp0");
						cookie4.setCookieMaxAge(24*60*60);
						cookie4.addCookie(res, URLEncoder.encode(Integer.toString(Wdto.getWhseq()), "UTF-8"));
						Crp5 = Integer.toString(Wdto.getWhseq());
						cdto.setCrp5(Integer.toString(Wdto.getWhseq()));
						System.out.println("쿠키 rp0 생성 완료!");
					}
					else if(cookies[i].getName().equals("rp4"))
					{
						CookieGenerator cookie = new CookieGenerator();
						cookie.setCookieName("rp4");
						cookie.setCookieMaxAge(24*60*60);
						cookie.addCookie(res, URLEncoder.encode(Crp2, "UTF-8"));
						System.out.println("쿠키 rp4 생성 완료!");
					
						CookieGenerator cookie1 = new CookieGenerator();
						cookie1.setCookieName("rp3");
						cookie1.setCookieMaxAge(24*60*60);
						cookie1.addCookie(res, URLEncoder.encode(Crp3, "UTF-8"));
						System.out.println("쿠키 rp3 생성 완료!");
						
						CookieGenerator cookie2 = new CookieGenerator();
						cookie2.setCookieName("rp2");
						cookie2.setCookieMaxAge(24*60*60);
						cookie2.addCookie(res, URLEncoder.encode(Crp4, "UTF-8"));
						System.out.println("쿠키 rp2 생성 완료!");
						
						CookieGenerator cookie3 = new CookieGenerator();
						cookie3.setCookieName("rp1");
						cookie3.setCookieMaxAge(24*60*60);
						cookie3.addCookie(res, URLEncoder.encode(Crp5, "UTF-8"));
						System.out.println("쿠키 rp1 생성 완료!");
						
						CookieGenerator cookie4 = new CookieGenerator();
						cookie4.setCookieName("rp0");
						cookie4.setCookieMaxAge(24*60*60);
						cookie4.addCookie(res, URLEncoder.encode(Integer.toString(Wdto.getWhseq()), "UTF-8"));
						Crp6 = Integer.toString(Wdto.getWhseq());
						cdto.setCrp6(Integer.toString(Wdto.getWhseq()));
										
						cdto.setCrp2((cdto.getCrp3()));
						cdto.setCrp3((cdto.getCrp4()));						
						cdto.setCrp4((cdto.getCrp5()));						
						cdto.setCrp5((cdto.getCrp6()));
						
						System.out.println("쿠키 rp0 생성 완료!");
					}else{
						System.out.println("----------통과-----------  : "+ i);
					}
				}
			}
		}
		///////////////////
		
		//////////////// 찜
		JjimDto jjdto = mypageserv.getJjim(jdto);
		
		if(jjdto != null) {
			model.addAttribute("jjdto", true);
		}else {
			model.addAttribute("jjdto", false);
		}
		/////////////////
		
		////////////////후기
		List<ReviewDto> dlist = reviewServ.WDlist(whseq);
		model.addAttribute("dlist", dlist);
		////////////////
		
		String pic1 ="";
		System.out.println(piclist.size());
		if(piclist.size()!=0) {
			pic1 = piclist.get(0).getPicture();
			model.addAttribute("pic1", pic1);	// 첫번째 사진
		}
		
		
		model.addAttribute("login", login);	// 로그인 정보
		model.addAttribute("wd", wd);	// 웨딩 업체 1개
		model.addAttribute("hallList", hallList);	// 홀 list
		model.addAttribute("hallSumList", hallSumList); // 홀이름과 사진수
		model.addAttribute("piclist", piclist);	// 업체에 해당하는 사진 모두 출력(초기값)
		
		// 예약 캘린더
		jcal.calculate();
		model.addAttribute("jcal", jcal);
		
		return "hallView.tiles";
	}
	
	
	// 홀 추가
	@RequestMapping(value="Hallwrite.do", method={RequestMethod.GET,RequestMethod.POST})
	public String Hallwrite(Model model, int whseq) {
		logger.info("WeddingHallCtrl Hallwrite" + new Date());
		
		WeddingDto wd = weddingHallServ.getWedding(whseq);
		model.addAttribute("wd", wd);
		return "hallwrite.tiles";
	}
	
	// 홀 이름 체크
	@ResponseBody
	@RequestMapping(value="checkhallname.do", method={RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> checkhallname(String hallname, int whseq) throws Exception {
		logger.info("WeddingHallCtrl checkhallname" + new Date());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (weddingHallServ.checkHallName(whseq,hallname)) {
			map.put("message", "true");
		} else {
			map.put("message", "false");
		}
		return map;
	}
	
	
	// 홀 추가 저장
	@RequestMapping(value="hallwriteAf.do", method={RequestMethod.GET,RequestMethod.POST})
	public String hallwriteAf(Model model, WdParam wd, HttpServletRequest req) {
		logger.info("WeddingHallCtrl hallwriteAf" + new Date());
		
		// 전달받은 파일 리스트(size 고정) 중 value가 null인 것을 제외한 리스트 생성
		List<MultipartFile> upFileList = new ArrayList<>();
		for (int i = 0; i < wd.getFileList().size(); i++) {
			if (wd.getFileList().get(i).getSize() != 0) {
				upFileList.add(wd.getFileList().get(i));
			}
		}
		
		
		// 파일 이름만 저장할 공간
		List<String> FileNameList = new ArrayList<String>();
		
		// 파일 업로드
		for (int i = 0; i < upFileList.size(); i++) {
			MultipartFile fileload = upFileList.get(i);
			String oriFileName = fileload.getOriginalFilename();
			if (oriFileName != null && !oriFileName.trim().equals("")) {
				String fupload = req.getServletContext().getRealPath("/upload");	// tomcat
				String newFileName = FUpUtil.getNewFile(oriFileName);
				// TODO
				FileNameList.add(newFileName);
				//System.out.println("--------> newFileName : " + FileNameList.get(i));
				
				// 파일 업로드
				try {
					File file = new File(fupload + "/" + newFileName);
					FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		// 나머지 세부 정보 기입
		WeddingHallDto hallPd = wd.getHallPd();
		System.out.println(hallPd.toString());
		boolean b = weddingHallServ.addHall(hallPd);
		if(b) {
			System.out.println("hall 추가성공");
		}else {
			System.out.println("hall 추가실패");
		}
		
		// 홀 사진 넣기
		weddingHallServ.addHallPicture(hallPd.getWhseq(), hallPd.getHallname(), FileNameList);
		
		String usid = ((LoginDto)req.getSession().getAttribute("login")).getId();
		
		model.addAttribute("usid", usid);
		model.addAttribute("whseq", hallPd.getWhseq());
		return "redirect:/hallView.do";
	}
	
	// 홀 name에 따라 사진 정보 불러오기
	@ResponseBody
	@RequestMapping(value="hallPicList.do", method={RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> hallPicList(Model model,String hallname, int whseq) throws Exception {
		logger.info("WeddingHallCtrl hallPicList " + new Date());
		
		List<WHallPictureDto> list = new ArrayList<WHallPictureDto>();
		if(hallname.equals("all")) {
			list = weddingHallServ.getAllHallPicList(whseq);
		}else {
			list = weddingHallServ.getHallPicList(hallname, whseq);
		}
		
		String picArr[] = new String[list.size()];
		
		for(int i=0;i<picArr.length;i++) {
			picArr[i] = list.get(i).getPicture();
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("picArr", picArr);
		
		return map;
	}
	
	// 예약 창
	@RequestMapping(value="resv.do", method={RequestMethod.GET,RequestMethod.POST})
	public String resv(Model model,String year,String month, String day, int whseq,HttpServletRequest req) throws Exception {
		logger.info("WeddingHallCtrl resv " + new Date());
		
		WeddingDto wd = weddingHallServ.getWedding(whseq);	// 웨딩홀 1개 업체
		LoginDto login = (LoginDto)req.getSession().getAttribute("login");	// 로그인 정보
		
		List<WeddingHallDto> hallList = weddingHallServ.getHallList(whseq);	// 홀 리스트
		
		String rdate = year+"/"+month+"/"+day;
		
		
		model.addAttribute("wd", wd);
		model.addAttribute("login", login);
		model.addAttribute("hallList", hallList);
		model.addAttribute("rdate", rdate);
		
		
		return "resv.tiles";
	}
	
	// 홀 정보
	@ResponseBody
	@RequestMapping(value="hallInfo.do", method={RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> hallInfo(Model model,String hallname, int whseq) throws Exception {
		logger.info("WeddingHallCtrl hallInfo " + new Date());
		
		WeddingHallDto hall = weddingHallServ.hallInfo(hallname, whseq);
		Map<String, Object> map = new HashMap<String, Object>();
		if(hall==null) {
			System.out.println("홀 정보가 없습니다.");
			map.put("hall", "홀없음");
		}else {
			map.put("hall", hall);
		}
		
		return map;
	}
	
	
	// 홀 수정 창
	@RequestMapping(value="Hallmod.do", method={RequestMethod.GET,RequestMethod.POST})
	public String Hallmod(Model model, int whseq) throws Exception {
		logger.info("WeddingHallCtrl Hallmod " + new Date());
		
		WeddingDto wd = weddingHallServ.getWedding(whseq);
		List<WeddingHallDto> hallList = weddingHallServ.getHallList(whseq);
		List<WHallPictureDto> hallpicList = weddingHallServ.getHallPicList(hallList.get(0).getHallname(), whseq);
		
		String hallpicArr[] = new String[hallpicList.size()];
		for(int i=0;i<hallpicList.size();i++) {
			hallpicArr[i] = hallpicList.get(i).getPicture();
			System.out.println(hallpicArr[i]);
		}
		
		model.addAttribute("wd", wd);	// 업체 정보
		model.addAttribute("hallList",hallList);	// 업체 홀 list
		model.addAttribute("hallpicArr", hallpicArr);
		
		return "hallmod.tiles";
	}
	
	// 홀 별 변경
	@ResponseBody
	@RequestMapping(value="Hallmodselect.do", method={RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> Hallmodselect(Model model,String hallname, int whseq) throws Exception {
		logger.info("WeddingHallCtrl Hallmodselect " + new Date());
		
		
		WeddingHallDto hall = weddingHallServ.hallInfo(hallname, whseq);
		List<WHallPictureDto> hallpicList = weddingHallServ.getHallPicList(hallname, whseq);
		
		String hallpicArr[] = new String[hallpicList.size()];
		for(int i=0;i<hallpicList.size();i++) {
			hallpicArr[i] = hallpicList.get(i).getPicture();
			
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hall", hall);
		map.put("hallpicArr", hallpicArr);
		return map;
	}
	
	// 홀 수정 저장
	@RequestMapping(value="hallmodAf.do", method={RequestMethod.GET,RequestMethod.POST})
	public String hallmodAf(Model model, WdParam wd, HttpServletRequest req) {
		logger.info("WeddingHallCtrl hallmodAf" + new Date());
		
		// 전달받은 파일 리스트(size 고정) 중 value가 null인 것을 제외한 리스트 생성
		List<MultipartFile> upFileList = new ArrayList<>();
		List<String> upFileNameList = new ArrayList<>();
		
		for (int i = 0; i < wd.getFileList().size(); i++) {
			if (wd.getFileList().get(i).getSize() != 0) {
				upFileList.add(wd.getFileList().get(i));
			}
		}
		System.out.println("upFileList.size = " + upFileList.size());
		for (int i = 0; i < wd.getFileNameList().size(); i++) {
			String tmpFileName = wd.getFileNameList().get(i);
			if (tmpFileName != null && !tmpFileName.equals("")) {
				upFileNameList.add(tmpFileName);
			}
		}
		System.out.println("upFileNameList.size = " + upFileNameList.size());
		
		
		// 파일 이름만 저장할 공간
		List<WHallPictureDto> orpicList = weddingHallServ.getHallPicList(wd.getHallPd().getHallname(), wd.getHallPd().getWhseq());
		
		System.out.println("=======================");
		// 파일 업로드
		
		for (int i = 0; i < upFileList.size(); i++) {
			MultipartFile fileload = upFileList.get(i);
			String oriFileName = fileload.getOriginalFilename();
			if (oriFileName != null && !oriFileName.trim().equals("")) {
				String fupload = req.getServletContext().getRealPath("/upload");	// tomcat
				String newFileName = FUpUtil.getNewFile(oriFileName);
				
				//System.out.println("oriFileName : " + oriFileName);
				//System.out.println("newFileName : " + newFileName);
				// TODO
				int getIndex = 0;
				for (int j = 0; j < upFileNameList.size(); j++) {
					if (oriFileName.equals(upFileNameList.get(j))) {
						getIndex = j;
						break;
					}
				}
				System.out.println(upFileNameList.get(getIndex));
				upFileNameList.set(getIndex, newFileName);
				
				// 파일 업로드
				try {
					File file = new File(fupload + "/" + newFileName);
					FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		// 나머지 세부 정보 기입
		WeddingHallDto hallPd = wd.getHallPd();
		System.out.println(hallPd.toString());
		
		boolean b = weddingHallServ.modHall(hallPd);
		if(b) {
			System.out.println("hall 수정성공");
		}else {
			System.out.println("hall 수정실패");
		}
		
		
		System.out.println("=======================");
		// 파일 이름만 저장할 공간
		List<String> FileNameList = new ArrayList<String>();
		
		System.out.println("upFileNameList.size() = " + upFileNameList.size());
		
		if(orpicList.size()>=upFileNameList.size()) {
			for (int i = 0; i < upFileNameList.size(); i++) {
				orpicList.get(i).setPicture(upFileNameList.get(i));
				weddingHallServ.modHallPicture(hallPd.getWhseq(), hallPd.getHallname(), orpicList);
			}
		}else {
			for (int i = 0; i < upFileNameList.size(); i++) {
				if(i<orpicList.size()) {
					// 홀 사진 수정
					orpicList.get(i).setPicture(upFileNameList.get(i));
					weddingHallServ.modHallPicture(hallPd.getWhseq(), hallPd.getHallname(), orpicList);
				}else {
					// 나머지는 추가
					FileNameList.add(upFileNameList.get(i));
				}
			}
			weddingHallServ.addHallPicture(hallPd.getWhseq(), hallPd.getHallname(), FileNameList);
		}
		String usid = ((LoginDto)req.getSession().getAttribute("login")).getId();
		
		model.addAttribute("usid", usid);
		model.addAttribute("whseq", hallPd.getWhseq());
		return "redirect:/hallView.do";
	}
	
	
	// 홀 삭제
	@RequestMapping(value="Halldel.do", method={RequestMethod.GET,RequestMethod.POST})
	public String Halldel(Model model, int pdseq, int whseq, String hallname, HttpServletRequest req) {
		logger.info("WeddingHallCtrl Halldel" + new Date());
		
		weddingHallServ.Halldel(pdseq);
		weddingHallServ.Hallpicdel(whseq, hallname);
		
		String usid = ((LoginDto)req.getSession().getAttribute("login")).getId();
		model.addAttribute("usid", usid);
		model.addAttribute("whseq",whseq);
		return "redirect:/hallView.do";
	}
	
	
}
