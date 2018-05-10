package kh.com.a.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import kh.com.a.model.ReservationDto;
import kh.com.a.model.ReviewDto;
import kh.com.a.model.WHallPictureDto;
import kh.com.a.model.WeddingDto;
import kh.com.a.model.WeddingHallDto;
import kh.com.a.model2.LoginDto;
import kh.com.a.model2.ReservationVO;
import kh.com.a.model2.WHallPicSumVO;
import kh.com.a.model2.WdParam;
import kh.com.a.service.ReservationServ;
import kh.com.a.service.ReviewServ;
import kh.com.a.service.WeddingHallServ;
import kh.com.a.util.CalendarUtil;
import kh.com.a.util.FUpUtil;
import kh.com.a.util.myCal;

@Controller
public class WeddingHallCtrl {
	private static final Logger logger = LoggerFactory.getLogger(MemberCtrl.class);
	
	@Autowired
	WeddingHallServ weddingHallServ;

	//예약 때문에
	@Autowired
	ReservationServ reservServ;
	
	// 후기
	@Autowired
	ReviewServ reviewServ;
	
	// 웨딩 업체 뷰
	@RequestMapping(value="weddingHallView.do", method={RequestMethod.GET,RequestMethod.POST})
	public String weddingHallView(Model model, HttpServletRequest req) {
		logger.info("WeddingHallCtrl weddingHallView" + new Date());
		
		LoginDto login = (LoginDto)req.getSession().getAttribute("login");
		model.addAttribute("login", login);
		
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
	public String hallDetailView(Model model, int whseq, myCal jcal,HttpServletRequest req) throws Exception {
		logger.info("WeddingHallCtrl hallView" + new Date());
		
		LoginDto login = (LoginDto)req.getSession().getAttribute("login");
		
		// UPreadcount
		weddingHallServ.upReadCount(whseq);
		
		WeddingDto wd = weddingHallServ.getWedding(whseq);
		List<WeddingHallDto> hallList = weddingHallServ.getHallList(whseq);
		List<WHallPicSumVO> hallSumList = weddingHallServ.getHallSumList(whseq);
		List<WHallPictureDto> piclist = weddingHallServ.getAllHallPicList(whseq);
		
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
	public Map<String, Object> checkhallname(String hallname) throws Exception {
		logger.info("WeddingHallCtrl checkhallname" + new Date());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (weddingHallServ.checkHallName(hallname)) {
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
			
		
		model.addAttribute("whseq", hallPd.getWhseq());
		return "redirect:/hallView.do";
	}
	
	
	// 홀 삭제
	@RequestMapping(value="Halldel.do", method={RequestMethod.GET,RequestMethod.POST})
	public String Halldel(Model model, int pdseq, int whseq, String hallname) {
		logger.info("WeddingHallCtrl Halldel" + new Date());
		
		weddingHallServ.Halldel(pdseq);
		weddingHallServ.Hallpicdel(whseq, hallname);
		
		model.addAttribute("whseq",whseq);
		return "redirect:/hallView.do";
	}
	
	
}
