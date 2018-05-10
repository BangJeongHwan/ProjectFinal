package kh.com.a.controller;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kh.com.a.model.CardDto;
import kh.com.a.model.MuProductDto;
import kh.com.a.model.ReviewDto;
import kh.com.a.model.ReviewParam;
import kh.com.a.model2.ReviewVO;
import kh.com.a.model2.ReviewVO2;
import kh.com.a.service.CardService;
import kh.com.a.service.ReviewServ;
import kh.com.a.service.WeddingHallServ;
import kh.com.a.util.FUpUtil;

@Controller
public class ReviewCtrl implements Serializable {
	
	private static final Logger logger = LoggerFactory.getLogger(CardController.class);

	@Autowired
	private ReviewServ reviewServ;
	@Autowired
	WeddingHallServ weddingHallServ;

	@RequestMapping(value="rwrite.do", method={RequestMethod.GET,RequestMethod.POST})
	public String rwrite(int rpdseq,HttpServletRequest req,Model model) throws Exception{
		logger.info("ReviewCtrl rwrite " + new Date());
		
		String pname = req.getParameter("title");
		
		model.addAttribute("pname", pname);
		System.out.println("pname=" + pname);
		
		model.addAttribute("rpdseq", rpdseq);

		return "rwrite.tiles";
	}
	
	// 정환
	@RequestMapping(value="whreview.do", method={RequestMethod.GET,RequestMethod.POST})
	public String whreview(Model model, ReviewDto dto) throws Exception{
		logger.info("ReviewCtrl whreview " + new Date());
		boolean b = reviewServ.writeWdlist(dto);
		if(b) {
			weddingHallServ.upCommentCount(dto.getRpdseq());
		}
		return "redirect:/hallView.do?whseq="+dto.getRpdseq()+"&jcal=''";
	}
	
	//0430 소현
	@RequestMapping(value="wdreview.do", method={RequestMethod.GET,RequestMethod.POST})
	public String wdreview(Model model, ReviewDto dto) throws Exception{
		logger.info("ReviewCtrl wdreview " + new Date());
		boolean b = reviewServ.writeWdlist(dto);
		return "redirect:/dressDetail.do?dsseq="+dto.getRpdseq()+"&pdseq="+dto.getRpdseq()+"&usid="+dto.getMid();
	}
	
//	0508 혜영
	@RequestMapping(value="wmureview.do", method={RequestMethod.GET,RequestMethod.POST})
	public String wmureview(Model model, ReviewDto dto) throws Exception{
		logger.info("ReviewCtrl wmureview " + new Date());
		boolean b = reviewServ.writeWdlist(dto);
		
		model.addAttribute("museq", dto.getRpdseq());
		return "redirect:/muDetailView.do";
	}
	
	@RequestMapping(value="rwriteAf.do", method={RequestMethod.GET,RequestMethod.POST})
	public String rwriteAf(HttpServletRequest req, 
			MultipartHttpServletRequest mreq, Model model, ReviewDto dto) throws Exception{
	
		logger.info("DmCtrl DmwriteAf " + new Date());
	
		List<MultipartFile> mf = mreq.getFiles("files");
		
		System.out.println("mf = " + mf);//ok
		System.out.println("size--------" + mf.size());//4
		
		List<String> list = new ArrayList<>();//dto에 저장해주기 위해 
		
		if(mf.size()==1 && mf.get(0).getOriginalFilename().equals("")) {
			
		}else {
		for(int i=0; i<mf.size(); i++) {
			
			String oriname = mf.get(i).getOriginalFilename();
			
			System.out.println("oriname----------------" + oriname);//ok
			
			String fupload = req.getServletContext().getRealPath("/upload");
			logger.info("업로드경로:" + fupload);
			
			String newFile = FUpUtil.getNewFile(oriname);
			
			System.out.println("newFile----------------" + newFile + "---i---" + i);//ok
			
			list.add(i, newFile);
			
				try {
					File file = new File(fupload + "/" + newFile);
					
					FileUtils.writeByteArrayToFile(file, mf.get(i).getBytes());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					}	
				
					System.out.println("list--------" + list);
				}
		
					if(list.size()==0) {
						dto.setPic0("null");
						dto.setPic1("null");
						dto.setPic2("null");
						dto.setPic3("null");
					}else if(list.size()==1) {
						dto.setPic0(list.get(0));
						dto.setPic0("null");
						dto.setPic2("null");
						dto.setPic3("null");	
					}else if(list.size()==2) {
						dto.setPic0(list.get(0));
						dto.setPic1(list.get(1));
						dto.setPic2("null");
						dto.setPic3("null");
					}else if(list.size()==3) {
						dto.setPic0(list.get(0));
						dto.setPic1(list.get(1));
						dto.setPic2(list.get(2));
						dto.setPic3("null");
					}
				reviewServ.rwrite(dto);
			}
		
		return "DmBbs.tiles";
	}
	
	
	
	
	@RequestMapping(value="pagingrlist.do", method={RequestMethod.GET,RequestMethod.POST})
	public String pagingrlist(Model model, ReviewParam dto) throws Exception {
		
		logger.info("ReviewCtrl pagingrlist " + new Date());
		
		System.out.println(dto.toString());
		
		int s = dto.getPageNumber();
		int start = (s) * dto.getRecordCountPerPage() + 1;
		int end = (s+1) * dto.getRecordCountPerPage();
		
		dto.setStart(start);
		dto.setEnd(end);
		
		int totalRecordCount = reviewServ.rlistcount(dto);
		List<ReviewDto> rlist = reviewServ.pagingrlist(dto);
		model.addAttribute("rlist", rlist);
		
		model.addAttribute("pageNumber", s);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", dto.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		System.out.println("�뀋�뀑");
		
		model.addAttribute("s_category", dto.getS_category());
		model.addAttribute("s_keyword", dto.getS_keyword());

		return "rlist.tiles";
	}
	
	@RequestMapping(value="myrlist.do", method={RequestMethod.GET,RequestMethod.POST})
	public String myrlist(HttpServletRequest req,Model model, ReviewParam dto) throws Exception {
		
		logger.info("ReviewCtrl myrlist " + new Date());
		
		System.out.println(dto.toString());
		
		String mid = req.getParameter("mid");
		
		
		System.out.println("dto=" + dto);
		
		int s = dto.getPageNumber();
		int start = (s) * dto.getRecordCountPerPage() + 1;
		int end = (s+1) * dto.getRecordCountPerPage();
		
		dto.setStart(start);
		dto.setEnd(end);
		dto.setMid(mid);
		
		int totalRecordCount = reviewServ.mrlistcount(dto);
		List<ReviewDto> mrlist = reviewServ.myrlist(dto);
		model.addAttribute("mrlist", mrlist);
		
		model.addAttribute("pageNumber", s);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", dto.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		System.out.println("�뀋�뀑");
		
		model.addAttribute("mid", dto.getMid());
		model.addAttribute("s_category", dto.getS_category());
		model.addAttribute("s_keyword", dto.getS_keyword());

		return "mrlist.tiles";
	}
	
	@RequestMapping(value="rdetail.do", method={RequestMethod.GET,RequestMethod.POST})
	public String rdetail(int rseq,Model model) throws Exception{
		logger.info("ReviewCtrl rdetail " + new Date());
		
		ReviewDto dto = reviewServ.rdetail(rseq);
		
		model.addAttribute("dto", dto);
		
		return "rdetail.tiles";
	}
	
	
}
