package kh.com.a.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.JSONArray;
import org.json.JSONObject;
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

import kh.com.a.model.JjimDto;
import kh.com.a.model.RecentDto;
import kh.com.a.model.ReviewDto;
import kh.com.a.model.StudioDto;
import kh.com.a.model.StudioProductDto;
import kh.com.a.model.CookieDto;
import kh.com.a.model2.LoginDto;
import kh.com.a.model2.ReservCalParam;
import kh.com.a.model2.SdParam;
import kh.com.a.model2.StudioParam;
import kh.com.a.model2.StudioPicDto;
import kh.com.a.service.DressServ;
import kh.com.a.service.MypageServ;
import kh.com.a.service.ReservationServ;
import kh.com.a.service.ReviewServ;
import kh.com.a.service.StudioServ;
import kh.com.a.util.FUpUtil;

@Controller
public class StudioCtrl {
	
	@Autowired
	private StudioServ studioserv;
	@Autowired
	private MypageServ mypageserv;
	@Autowired
	ReservationServ reservServ;
	@Autowired
	ReviewServ reviewServ;
	@Autowired
	DressServ dressServ;
	
	private static final Logger logger = LoggerFactory.getLogger(StudioCtrl.class);
	
	//해당 기능에 대한 뷰로 이동
	@RequestMapping(value="studiomain.do", method={RequestMethod.GET,RequestMethod.POST})
	public String detail(Model model, StudioParam sdDto, HttpServletRequest req) throws Exception{
		logger.info("KhMemberController company" + new Date());
		
		
		// paging 처리
		int sn = sdDto.getPageNumber();
		int start = (sn) * sdDto.getRecordCountPerPage() + 1;
		int end = (sn+1) * sdDto.getRecordCountPerPage();
		
		sdDto.setStart(start);
		sdDto.setEnd(end);
		
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
					}else if(rp>=2000 && rp<3000) {
					//청첩장
					}else if(rp>=3000 && rp<4000) {
					//스튜디오
						recentDto = studioserv.getRecentProduct(rp);
					}else if(rp>=4000 && rp<5000) {
					//드레스
						recentDto = dressServ.getRecentProduct(rp);
					}else if(rp>=5000 && rp<6000) {
					//메이크업
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
					System.out.println("두번째 rp  : " +rp);
					
						if(rp>=1000 && rp<2000) {
						//웨딩홀
						}else if(rp>=2000 && rp<3000) {
						//청첩장
						}else if(rp>=3000 && rp<4000) {
						//스튜디오
							recentDto = studioserv.getRecentProduct(rp);
						}else if(rp>=4000 && rp<5000) {
						//드레스	
							recentDto = dressServ.getRecentProduct(rp);
						}else if(rp>=5000 && rp<6000) {
						//메이크업
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
					System.out.println("세번쨰 rp : " +rp);
					
						if(rp>=1000 && rp<2000) {
						//웨딩홀
						}else if(rp>=2000 && rp<3000) {
						//청첩장
						}else if(rp>=3000 && rp<4000) {
						//스튜디오
							recentDto = studioserv.getRecentProduct(rp);
						}else if(rp>=4000 && rp<5000) {
						//드레스	
							recentDto = dressServ.getRecentProduct(rp);
						}else if(rp>=5000 && rp<6000) {
						//메이크업
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
					System.out.println("네번째 rp : " +rp);
					
						if(rp>=1000 && rp<2000) {
						//웨딩홀
						}else if(rp>=2000 && rp<3000) {
						//청첩장
						}else if(rp>=3000 && rp<4000) {
						//스튜디오
							recentDto = studioserv.getRecentProduct(rp);
						}else if(rp>=4000 && rp<5000) {
						//드레스	
							recentDto = dressServ.getRecentProduct(rp);
						}else if(rp>=5000 && rp<6000) {
						//메이크업
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
					System.out.println("다섯번째 rp : " +rp);
					
						if(rp>=1000 && rp<2000) {
						//웨딩홀
						}else if(rp>=2000 && rp<3000) {
						//청첩장
						}else if(rp>=3000 && rp<4000) {
						//스튜디오
							recentDto = studioserv.getRecentProduct(rp);
						}else if(rp>=4000 && rp<5000) {
						//드레스	
							recentDto = dressServ.getRecentProduct(rp);
						}else if(rp>=5000 && rp<6000) {
						//메이크업
						}
					
					System.out.println("!!! cookie rp4 !!!");
					System.out.println("recentDto.getCid() : " + recentDto.getCid());
					System.out.println("recentDto.getCname() : " + recentDto.getCname());
					
					recentlist.add(recentDto);

				}
				else if(cookies[i].getName().equals("JSESSIONID"))
				{
					System.out.println("JSESSIONID 통과");
				}
			}
			model.addAttribute("recentlist",recentlist);
		}
		
		int totalRecordCount = studioserv.getStudioCount(sdDto);
		List<StudioDto> sdDtolist = studioserv.getPagingStudioList(sdDto);
		model.addAttribute("sdDtolist", sdDtolist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", sdDto.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("s_category", sdDto.getS_category());
		model.addAttribute("s_keyword", sdDto.getS_keyword());
		
		check++;
		cdto.setCheck(check);
		
		return "company.tiles";
	}
	
	@RequestMapping(value="studioWrite.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String studioWrite(Model model) {
		logger.info("Welcome StudioCtrl studioWrite! "+ new Date());
		
		model.addAttribute("doc_title", "업체 등록");
		
		return "studioWrite.tiles";
	}
	
	@RequestMapping(value="addStudio.do", method={RequestMethod.GET,RequestMethod.POST})
	public String addStudio(Model model, SdParam sd, HttpServletRequest req, @RequestParam(value="videoload", required=false)MultipartFile videoload) throws Exception {
		logger.info("[StudioCtrl] addStudio " + new Date());
		
		/*System.out.println("muDto cid : " + mu.getMuDto().getCid());
		System.out.println("muDto cname : " + mu.getMuDto().getCname());
		System.out.println("muPdList[0] : " + mu.getMuPdList().get(0).getTitle() + " / " + mu.getMuPdList().get(0).getPrice());
		System.out.println("muPdList size : " + mu.getMuPdList().size());
		System.out.println("fileList[0] : " + mu.getFileList().get(0).getOriginalFilename());
		System.out.println("fileList[1] : " + mu.getFileList().get(1).getOriginalFilename());
		System.out.println("fileList size : " + mu.getFileList().size());*/
		
		// 영상 업로드
		//filename 취득하는 부분
				sd.getSdDto().setVideo(videoload.getOriginalFilename()); //에러나는부분 nullpoint
				
				//업로드 경로
				String fupload1 = req.getServletContext().getRealPath("/upload");
				logger.info("업로드경로:" + fupload1);
				
				//폴더
				//String fupload="d:\\tmp;"
				
				String f = sd.getSdDto().getVideo();
				String newFile = FUpUtil.getNewFile(f);
				
				sd.getSdDto().setVideo(newFile);
				try {
				File file = new File(fupload1 + "/" + newFile);
				
					//실제 업로드 부분
					FileUtils.writeByteArrayToFile(file, videoload.getBytes());
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		// -- 영상 업로드 끝.
		
		// 전달받은 파일 리스트(size 고정) 중 value가 null인 것을 제외한 리스트 생성
		List<MultipartFile> upFileList = new ArrayList<>();
		for (int i = 0; i < sd.getFileList().size(); i++) {
			if (sd.getFileList().get(i).getSize() != 0) {
				upFileList.add(sd.getFileList().get(i));
			}
		}
		
		// 파일 업로드
		for (int i = 0; i < upFileList.size(); i++) {
			MultipartFile fileload = upFileList.get(i);
			String oriFileName = fileload.getOriginalFilename();
			if (oriFileName != null && !oriFileName.trim().equals("")) {
				String fupload = req.getServletContext().getRealPath("/upload");	// tomcat
				String newFileName = FUpUtil.getNewFile(oriFileName);
				// TODO
				System.out.println("-----------------------------------------newFileName : " + newFileName);
				System.out.println("-----------------------------------------sd.getSdDto().getPic().size() : " + sd.getSdDto());
				sd.getSdDto().getPic().set(i, newFileName);
				System.out.println("[StudioCtrl] addStudio newFileName : " + sd.getSdDto().getPic().get(i));
				
				// 파일 업로드
				try {
					File file = new File(fupload + "/" + newFileName);
					FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		// muDto 삽입
//		System.out.println("    " + mu.getMuDto().toString());
		int stseq = studioserv.getStseq();
		sd.getSdDto().setStseq(stseq);
		studioserv.addStudio(sd.getSdDto());
		
		// muPdList 삽입
		for (int i = 0; i < sd.getSdPdList().size(); i++) {
			StudioProductDto sdPd = sd.getSdPdList().get(i);
			sdPd.setSdseq(stseq);
			studioserv.addStudioProduct(sdPd);
		}
		
		return "redirect:/studiomain.do";
	}
	
	@RequestMapping(value="studioDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String studioDetail(Model model, int stseq, String flag, JjimDto jdto, HttpSession session,
			HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("Welcome StudioCtrl studioDetail! "+ new Date());
		
		model.addAttribute("doc_title", "업체 디테일");
		
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
			
			StudioDto sttDto = studioserv.getStudioDetail(stseq);
			
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
				cookie.addCookie(res, URLEncoder.encode(Integer.toString(sttDto.getStseq()), "UTF-8"));
				Crp1 = Integer.toString(sttDto.getStseq());
				cdto.setCrp1(Integer.toString(sttDto.getStseq()));
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
						cookie1.addCookie(res, URLEncoder.encode(Integer.toString(sttDto.getStseq()), "UTF-8"));
						Crp2 = Integer.toString(sttDto.getStseq());
						cdto.setCrp2(Integer.toString(sttDto.getStseq()));
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
						cookie2.addCookie(res, URLEncoder.encode(Integer.toString(sttDto.getStseq()), "UTF-8"));
						Crp3 = Integer.toString(sttDto.getStseq());
						cdto.setCrp3(Integer.toString(sttDto.getStseq()));
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
						cookie3.addCookie(res, URLEncoder.encode(Integer.toString(sttDto.getStseq()), "UTF-8"));
						Crp4 = Integer.toString(sttDto.getStseq());
						cdto.setCrp4(Integer.toString(sttDto.getStseq()));
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
						cookie4.addCookie(res, URLEncoder.encode(Integer.toString(sttDto.getStseq()), "UTF-8"));
						Crp5 = Integer.toString(sttDto.getStseq());
						cdto.setCrp5(Integer.toString(sttDto.getStseq()));
						System.out.println("쿠키 rp0 생성 완료!");
					}
					else if(cookies[i].getName().equals("rp4") && Crp1 != null && Crp2 != null&& Crp3 != null 
							&& Crp4 != null && Crp5 != null)
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
						cookie4.addCookie(res, URLEncoder.encode(Integer.toString(sttDto.getStseq()), "UTF-8"));
						Crp6 = Integer.toString(sttDto.getStseq());
						cdto.setCrp6(Integer.toString(sttDto.getStseq()));
						
						
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

		int rpdseq = stseq;
		
		List<ReviewDto> dlist = null;
		dlist = reviewServ.WDlist(rpdseq);
		model.addAttribute("dlist", dlist);
		
		System.out.println("jdto.getUsid() : " + jdto.getUsid());
		System.out.println("jdto.getPdseq() : " + jdto.getPdseq());
		
		StudioDto sdDto = studioserv.getStudioDetail(stseq);
		List<StudioProductDto> sdpdlist = studioserv.getStudioProductDetail(stseq);
		model.addAttribute("sdDto", sdDto);
		model.addAttribute("sdpdlist", sdpdlist);
		
		String splitOpen[] = sdDto.getOpentime().split(":");
		int openHour = Integer.parseInt(splitOpen[0]);
		int openMin = Integer.parseInt(splitOpen[1]);
		String splitClose[] = sdDto.getClosetime().split(":");
		int closeHour = Integer.parseInt(splitClose[0]);
		int closeMin = Integer.parseInt(splitClose[1]);
		
		///////////////// 예약일정
		List<ReservCalParam> reservCalList = reservServ.getReservCalListByPdseq(sdDto.getStseq());
		// json parsing
		JSONArray regiData = new JSONArray();
		for (int i = 0; i < reservCalList.size(); i++) {
			ReservCalParam rcParm = reservCalList.get(i);
			String title = rcParm.getMname();
			
			String redate = rcParm.getRedate();	// yyyy-mm-dd
			String timeSplit[] = rcParm.getRetime().split("~");
			if (timeSplit[0].length() < 5) timeSplit[0] = "0" + timeSplit[0];
			String start = redate + "T" + timeSplit[0];
			String end = redate + "T" + timeSplit[1];
			System.out.println("   " + start);
			
			JSONObject jo = new JSONObject();
			jo.put("title", title);
			jo.put("start", start);
			jo.put("end", end);
			jo.put("color", "#121212");
			//jo.put("url", "javascript:func()");
			regiData.put(jo);
		}
		
		System.out.println("reservSize : " + reservCalList.size());
		System.out.println("regiDataSize : " + regiData.length());
		
		model.addAttribute("regiData", regiData);
		
		JjimDto jjdto = mypageserv.getJjim(jdto);
		
		if(jjdto != null) {
			model.addAttribute("jjdto", true);
		}else {
			model.addAttribute("jjdto", false);
		}
		
		if (flag != null) {
			model.addAttribute("flag", flag);
		}
		
		model.addAttribute("openHour", openHour);
		model.addAttribute("openMin", openMin);
		model.addAttribute("closeHour", closeHour);
		model.addAttribute("closeMin", closeMin);
		
		return "studioDetail.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="productPrice.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String productPrice(Model model, StudioProductDto sdpdDto) throws Exception {
		logger.info("Welcome StudioCtrl productPrice! "+ new Date());
		
		String price = studioserv.getProductPrice(sdpdDto);
		
		return price;
	}
	
//	수정 View
	@RequestMapping(value="sdModView.do", method={RequestMethod.GET,RequestMethod.POST})
	public String muModView(Model model, int stseq) throws Exception {
		logger.info("[StudioCtrl] sdModView " + new Date());

		StudioDto sdDto = studioserv.getStudioByStseq(stseq);
		List<StudioProductDto> sdpdlist = studioserv.getStudioProductListBySdseq(stseq);
		
		String splitOpen[] = sdDto.getOpentime().split(":");
		int openHour = Integer.parseInt(splitOpen[0]);
		int openMin = Integer.parseInt(splitOpen[1]);
		String splitClose[] = sdDto.getClosetime().split(":");
		int closeHour = Integer.parseInt(splitClose[0]);
		int closeMin = Integer.parseInt(splitClose[1]);

		model.addAttribute("sdDto", sdDto);
		model.addAttribute("sdpdlist", sdpdlist);
		model.addAttribute("openHour", openHour);
		model.addAttribute("openMin", openMin);
		model.addAttribute("closeHour", closeHour);
		model.addAttribute("closeMin", closeMin);
		
		return "sdMod.tiles";
	}
	
	// 파일 수정
	@RequestMapping(value="modSd.do", method={RequestMethod.GET,RequestMethod.POST})
	public String modSd(Model model, SdParam sd, HttpServletRequest req, JjimDto jdto) throws Exception {
		logger.info("[StudioCtrl] modSd " + new Date());
		int stseq = sd.getSdDto().getStseq();
		
		// 전달받은 파일 리스트(size 고정) 중 value가 null인 것을 제외한 리스트 생성
		List<MultipartFile> upFileList = new ArrayList<>();
		List<String> upFileNameList = new ArrayList<>();
		for (int i = 0; i < sd.getFileList().size(); i++) {
			if (sd.getFileList().get(i).getSize() != 0) {
				upFileList.add(sd.getFileList().get(i));
			}
		}
		for (int i = 0; i < sd.getFileNameList().size(); i++) {
			String tmpFileName = sd.getFileNameList().get(i);
			if (tmpFileName != null && !tmpFileName.equals("")) {
				upFileNameList.add(tmpFileName);
			}
		}
		System.out.println("upFileList size : " + upFileList.size());
		System.out.println("upFileNameList : " + upFileNameList.toString());
		
		// 파일 업로드
		for (int i = 0; i < upFileList.size(); i++) {
			MultipartFile fileload = upFileList.get(i);
			String oriFileName = fileload.getOriginalFilename();
			if (oriFileName != null && !oriFileName.trim().equals("")) {
				String fupload = req.getServletContext().getRealPath("/upload");	// tomcat
				String newFileName = FUpUtil.getNewFile(oriFileName);

				System.out.println("oriFileName : " + oriFileName);
				System.out.println("newFileName : " + newFileName);
				// TODO
				int getIndex = 0;
				for (int j = 0; j < upFileNameList.size(); j++) {
					if (oriFileName.equals(upFileNameList.get(j))) {
						getIndex = j;
						break;
					}
				}
//				System.out.println("getIndex : " + getIndex);
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

		System.out.println("-> upFileNameList : " + sd.getSdDto().getPic().toString());
		for (int i = 0; i < upFileNameList.size(); i++) {
			sd.getSdDto().getPic().set(i, upFileNameList.get(i));
		}
		System.out.println("-> sd.getSdDto().getPic() : " + sd.getSdDto().getPic().toString());
		
		// muDto 수정
		studioserv.modStudio(sd.getSdDto());
		
		// 옵션 수가 줄었으면 찾아서 삭제해야함 update말고 걍 다 지운다음에 전부 다시 add하는 게 나을듯
		// muPdList 삭제 후 추가
		studioserv.delStudioProductByStseq(stseq);
		
		for (int i = 0; i < sd.getSdPdList().size(); i++) {
			StudioProductDto sdPd = sd.getSdPdList().get(i);
			sdPd.setSdseq(stseq);
			studioserv.addStudioProduct(sdPd);
		}
		
		model.addAttribute("stseq", stseq);
		return "redirect:/studiomain.do?stseq="+stseq+"&pdseq="+jdto.getPdseq()+"&usid="+jdto.getUsid();
	}
	
//	삭제
	@RequestMapping(value="sdDel.do", method={RequestMethod.GET,RequestMethod.POST})
	public String muDel(Model model, int stseq) throws Exception {
		logger.info("[StudioCtrl] sdDel " + new Date());
		studioserv.delStudioByStseq(stseq);
		return "redirect:/studiomain.do";
	}

}
