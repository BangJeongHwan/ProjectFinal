package kh.com.a.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.multipart.MultipartFile;

import kh.com.a.model.JjimDto;
import kh.com.a.model.MakeupDto;
import kh.com.a.model.MuProductDto;
import kh.com.a.model.ReviewDto;
import kh.com.a.model2.LoginDto;
import kh.com.a.model2.MuPagingParam;
import kh.com.a.model2.MuParam;
import kh.com.a.model2.ReservCalParam;
import kh.com.a.service.MakeupServ;
import kh.com.a.service.MypageServ;
import kh.com.a.service.ReservationServ;
import kh.com.a.service.ReviewServ;
import kh.com.a.util.FUpUtil;

@Controller
public class MakeupCtrl {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberCtrl.class);
	
	@Autowired
	private MakeupServ muServ;
	@Autowired
	private MypageServ mypageserv;
	@Autowired
	ReservationServ reservServ;
	@Autowired
	ReviewServ reviewServ;
	
	@RequestMapping(value="muMainView.do", method={RequestMethod.GET,RequestMethod.POST})
	public String muMainView(Model model, MuPagingParam param) throws Exception {
		logger.info("[MakeupCtrl] muMainView " + new Date());
		
		if (param.getOrderCondition() == null) {
			param.setOrderCondition("museq");
		}
		System.out.println(param.toString());
		
		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		
		int totalRecordCount = muServ.getMakeupAllCnt(param);
		List<MakeupDto> muList = muServ.getMakeupMainList(param);
		model.addAttribute("muList", muList);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("orderCondition", param.getOrderCondition());
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
		
		return "muMain.tiles";
	}

//	TODO 0508
	@RequestMapping(value="muDetailView.do", method={RequestMethod.GET,RequestMethod.POST})
	public String muDetailView(Model model, int museq, String flag, HttpServletRequest req) throws Exception {
		logger.info("[MakeupCtrl] muDetailView " + new Date());
		
		String usid = ((LoginDto)req.getSession().getAttribute("login")).getId();
		JjimDto jdto = new JjimDto(museq, usid);
		
		muServ.upReadcnt(museq);
		MakeupDto muDto = muServ.getMakeupByMuseq(museq);
		List<MuProductDto> mupdList = muServ.getMuProductListByMuseq(museq);
		
		String splitOpen[] = muDto.getOpentime().split(":");
		int openHour = Integer.parseInt(splitOpen[0]);
		int openMin = Integer.parseInt(splitOpen[1]);
		String splitClose[] = muDto.getClosetime().split(":");
		int closeHour = Integer.parseInt(splitClose[0]);
		int closeMin = Integer.parseInt(splitClose[1]);
		
		if (flag != null) {
			model.addAttribute("flag", flag);
		}
		
		jdto = mypageserv.getJjim(jdto);
		
		if(jdto != null) {
			model.addAttribute("jjdto", true);
		}else {
			model.addAttribute("jjdto", false);
		}
		
		///////////////// 예약일정
		List<ReservCalParam> reservCalList = reservServ.getReservCalListByPdseq(muDto.getMuseq());
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
		
		////////////////후기
		List<ReviewDto> dlist = reviewServ.WDlist(museq);
		model.addAttribute("dlist", dlist);
		////////////////
		
		model.addAttribute("muDto", muDto);
		model.addAttribute("mupdList", mupdList);
		model.addAttribute("openHour", openHour);
		model.addAttribute("openMin", openMin);
		model.addAttribute("closeHour", closeHour);
		model.addAttribute("closeMin", closeMin);
		
		return "muDetail.tiles";
	}
	
	@RequestMapping(value="addMuView.do", method={RequestMethod.GET,RequestMethod.POST})
	public String addMuView(Model model) {
		logger.info("[MakeupCtrl] addMuView " + new Date());
		return "addMu.tiles";
	}
	
	@RequestMapping(value="addMu.do", method={RequestMethod.GET,RequestMethod.POST})
	public String addMu(Model model, MuParam mu, HttpServletRequest req) throws Exception {
		logger.info("[MakeupCtrl] addMu " + new Date());
				
		// 전달받은 파일 리스트(size 고정) 중 value가 null인 것을 제외한 리스트 생성
		List<MultipartFile> upFileList = new ArrayList<>();
		for (int i = 0; i < mu.getFileList().size(); i++) {
			if (mu.getFileList().get(i).getSize() != 0) {
				upFileList.add(mu.getFileList().get(i));
			}
		}
		
		// 파일 업로드
		for (int i = 0; i < upFileList.size(); i++) {
			MultipartFile fileload = upFileList.get(i);
			String oriFileName = fileload.getOriginalFilename();
			if (oriFileName != null && !oriFileName.trim().equals("")) {
				String fupload = req.getServletContext().getRealPath("/upload");	// tomcat
				String newFileName = FUpUtil.getNewFile(oriFileName);
				mu.getMuDto().getPic().set(i, newFileName);
				System.out.println("[MakeupCtrl] addMu newFileName : " + mu.getMuDto().getPic().get(i));
				
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
		int museq = muServ.getMuseq();
		mu.getMuDto().setMuseq(museq);
		muServ.addMakeup(mu.getMuDto());
		
		// muPdList 삽입
		for (int i = 0; i < mu.getMuPdList().size(); i++) {
			MuProductDto muPd = mu.getMuPdList().get(i);
			muPd.setMuseq(museq);
			muServ.addMuProduct(muPd);
		}
		
		return "redirect:/muMainView.do";
	}
	
//	삭제
	@RequestMapping(value="muDel.do", method={RequestMethod.GET,RequestMethod.POST})
	public String muDel(Model model, int museq) throws Exception {
		logger.info("[MakeupCtrl] muDel " + new Date());
		muServ.delMuByMuseq(museq);
		return "redirect:/muMainView.do";
	}
	
//	수정 View
	@RequestMapping(value="muModView.do", method={RequestMethod.GET,RequestMethod.POST})
	public String muModView(Model model, int museq) throws Exception {
		logger.info("[MakeupCtrl] muModView " + new Date());

		MakeupDto muDto = muServ.getMakeupByMuseq(museq);
		List<MuProductDto> mupdList = muServ.getMuProductListByMuseq(museq);
		
		String splitOpen[] = muDto.getOpentime().split(":");
		int openHour = Integer.parseInt(splitOpen[0]);
		int openMin = Integer.parseInt(splitOpen[1]);
		String splitClose[] = muDto.getClosetime().split(":");
		int closeHour = Integer.parseInt(splitClose[0]);
		int closeMin = Integer.parseInt(splitClose[1]);

		model.addAttribute("muDto", muDto);
		model.addAttribute("mupdList", mupdList);
		model.addAttribute("openHour", openHour);
		model.addAttribute("openMin", openMin);
		model.addAttribute("closeHour", closeHour);
		model.addAttribute("closeMin", closeMin);
		
		return "muMod.tiles";
	}
	
	@RequestMapping(value="modMu.do", method={RequestMethod.GET,RequestMethod.POST})
	public String modMu(Model model, MuParam mu, HttpServletRequest req) throws Exception {
		logger.info("[MakeupCtrl] modMu " + new Date());
		int museq = mu.getMuDto().getMuseq();
		
		// 전달받은 파일 리스트(size 고정) 중 value가 null인 것을 제외한 리스트 생성
		List<MultipartFile> upFileList = new ArrayList<>();
		List<String> upFileNameList = new ArrayList<>();
		for (int i = 0; i < mu.getFileList().size(); i++) {
			if (mu.getFileList().get(i).getSize() != 0) {
				upFileList.add(mu.getFileList().get(i));
			}
		}
		for (int i = 0; i < mu.getFileNameList().size(); i++) {
			String tmpFileName = mu.getFileNameList().get(i);
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

		System.out.println("-> upFileNameList : " + upFileNameList.toString());
		for (int i = 0; i < upFileNameList.size(); i++) {
			mu.getMuDto().getPic().set(i, upFileNameList.get(i));
		}
		System.out.println("-> mu.getMuDto().getPic() : " + mu.getMuDto().getPic().toString());
		
		// muDto 수정
		muServ.modMakeup(mu.getMuDto());
		
		// 옵션 수가 줄었으면 찾아서 삭제해야함 update말고 걍 다 지운다음에 전부 다시 add하는 게 나을듯
		// muPdList 삭제 후 추가
		muServ.delMuProductByMuseq(museq);
		for (int i = 0; i < mu.getMuPdList().size(); i++) {
			MuProductDto muPd = mu.getMuPdList().get(i);
			muPd.setMuseq(museq);
			muServ.addMuProduct(muPd);
		}
		
		model.addAttribute("museq", museq);
		return "redirect:/muDetailView.do";
	}
	

}















