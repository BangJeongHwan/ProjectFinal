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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.com.a.model.DressDto;
import kh.com.a.model.JjimDto;
import kh.com.a.model.ReviewDto;
import kh.com.a.model2.DressParam;
import kh.com.a.model2.DressVO;
import kh.com.a.model2.LoginDto;
import kh.com.a.service.DressServ;
import kh.com.a.service.MypageServ;
import kh.com.a.service.ReviewServ;
import kh.com.a.util.FUpUtil;

@Controller
public class DressCtrl {
	
	@Autowired
	DressServ dressServ;
	@Autowired
	private MypageServ mypageserv;
	@Autowired
	ReviewServ reviewServ;
	
	private static final Logger logger = LoggerFactory.getLogger(DressCtrl.class);
	
	@RequestMapping(value="dressMain.do", method={RequestMethod.GET,RequestMethod.POST})
	public String dressMain(Model model, DressParam param) throws Exception{
		logger.info("DressCtrl dressMain" + new Date());
		
		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		
		//데이터의 갯수
		int totalRecordCount = dressServ.getDressCount(param);
		List<DressDto> dlist = dressServ.getPagingDressList(param);
		model.addAttribute("dDto", dlist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
		
		return "dressMain.tiles";
	}
	
	@RequestMapping(value="dressWrite.do", method={RequestMethod.GET,RequestMethod.POST})
	public String dressWrite(Model model) throws Exception{
		logger.info("DressCtrl dressWrite" + new Date());
		return "dressWrite.tiles";
	}
	
	@RequestMapping(value="dressupload.do", method={RequestMethod.GET,RequestMethod.POST})
	public String companyUpload(Model model, DressVO dv, HttpServletRequest req) throws Exception{
		logger.info("DressCtrl companyUpload" + new Date());
		
		List<MultipartFile> upFileList = new ArrayList<>();
		for (int i = 0; i < dv.getFileList().size(); i++) {
			if (dv.getFileList().get(i).getSize() != 0) {
				upFileList.add(dv.getFileList().get(i));
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
				dv.getDdto().getPic().set(i, newFileName);
				System.out.println("[DressCtrl] companyUpload newFileName : " + dv.getDdto().getPic().get(i));
				
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
		int dsseq = dressServ.getDsseq();
		dv.getDdto().setDsseq(dsseq);
		dressServ.companyUpload(dv.getDdto());
		
		return "redirect:/dressMain.do";	
	}
	
	@RequestMapping(value="dressDetail.do", method={RequestMethod.GET,RequestMethod.POST})
	public String dressDetail(Model model, int dsseq, String dflag, JjimDto jdto) throws Exception{
		logger.info("DressCtrl dressDetail" + new Date());
		
		int rpdseq = dsseq;
		
		DressDto Ddto = dressServ.getDressDetail(dsseq);
		List<ReviewDto> dlist = null;
		dlist = reviewServ.WDlist(rpdseq);
		
		if(dflag != null) {
			model.addAttribute("dflag", dflag);
		}
		
		JjimDto jjdto = mypageserv.getJjim(jdto);
		
		if(jjdto != null) {
			model.addAttribute("jjdto", true);
		}else {
			model.addAttribute("jjdto", false);
		}
		
		model.addAttribute("Ddto", Ddto);
		model.addAttribute("dlist", dlist);
		return "dressDetail.tiles";
	}
	
	@RequestMapping(value="dressDelete.do", method={RequestMethod.GET,RequestMethod.POST})
	public String dressDelete(Model model, int dsseq)throws Exception {
		logger.info("DressCtrl dressDelete" + new Date());
		
		dressServ.dressDelete(dsseq);
		return "redirect:/dressMain.do";
	}
	
	@RequestMapping(value="dressUpdate.do", method={RequestMethod.GET,RequestMethod.POST})
	public String dressUpdate(Model model, int dsseq)throws Exception {
		logger.info("DressCtrl dressUpdate" + new Date());
		
		DressDto Ddto = dressServ.getDressDetail(dsseq);
		model.addAttribute("Ddto", Ddto);
		
		return "dressUpdate.tiles";
	}
	
	@RequestMapping(value="dressUpdateAf.do", method={RequestMethod.GET,RequestMethod.POST})
	public String dressUpdateAf(Model model, DressVO dv, HttpServletRequest req, JjimDto jdto) throws Exception {
		logger.info("DressCtrl dressUpdateAf" + new Date());
		int dsseq = dv.getDdto().getDsseq();
		
		// 전달받은 파일 리스트(size 고정) 중 value가 null인 것을 제외한 리스트 생성
		List<MultipartFile> upFileList = new ArrayList<>();
		List<String> upFileNameList = new ArrayList<>();
		for (int i = 0; i < dv.getFileList().size(); i++) {
			if (dv.getFileList().get(i).getSize() != 0) {
				upFileList.add(dv.getFileList().get(i));
			}
		}
		for (int i = 0; i < dv.getFileNameList().size(); i++) {
			String tmpFileName = dv.getFileNameList().get(i);
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
//						System.out.println("getIndex : " + getIndex);
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

		System.out.println("-> upFileNameList : " + dv.getDdto().getPic().toString());
		for (int i = 0; i < upFileNameList.size(); i++) {
			dv.getDdto().getPic().set(i, upFileNameList.get(i));
		}
		System.out.println("-> mu.getMuDto().getPic() : " + dv.getDdto().getPic().toString());
		
		// Ddto 수정
		dressServ.dressUpdate(dv.getDdto());
		
		model.addAttribute("dsseq", dsseq);
		
		return "redirect:/dressDetail.do?dsseq="+dsseq+"&pdseq="+jdto.getPdseq()+"&usid="+jdto.getUsid();
	}
	
	
}
