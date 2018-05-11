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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kh.com.a.model.CDetailParam;
import kh.com.a.model.CardDetailDto;
import kh.com.a.model.CardDto;
import kh.com.a.model.CardParam;
import kh.com.a.model.ReviewDto;
import kh.com.a.model.ReviewParam;
import kh.com.a.model2.CardVO;
import kh.com.a.model2.CardVO2;
import kh.com.a.service.CardService;
import kh.com.a.service.ReviewServ;
import kh.com.a.util.FUpUtil;

@Controller
public class CardController {
	
	private static final Logger logger = LoggerFactory.getLogger(CardController.class);
	
	@Autowired
	private CardService cardService;
	
	@Autowired
	private ReviewServ reviewServ;
	
	@RequestMapping(value="cardlist.do", method={RequestMethod.GET,RequestMethod.POST})
	public String cardlist(Model model) throws Exception{
		logger.info("CardController clist " + new Date());
		
		List<CardDto> clist = cardService.clist();
		System.out.println("clist : " + clist.toString());
		model.addAttribute("clist", clist);

		return "cardlist.tiles";
		
	}
	
	@RequestMapping(value="pagingclist.do", method={RequestMethod.GET,RequestMethod.POST})
	public String pagingclist(CardParam dto,Model model) throws Exception{
		logger.info("CardController clist " + new Date());
		
		System.out.println(dto.toString());
		
		//paging
		int s = dto.getPageNumber();
		int start = (s) * dto.getRecordCountPerPage() + 1;
		int end = (s+1) * dto.getRecordCountPerPage();
		
		dto.setStart(start);
		dto.setEnd(end);
		
		int totalRecordCount = cardService.clistcount(dto);
		List<CardDto> clist = cardService.pagingclist(dto);
		model.addAttribute("clist", clist);
		
		model.addAttribute("pageNumber", s);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", dto.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		System.out.println("ㅇㅋ");
		
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
				System.out.println("수정실패");
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
		
		List<String> list = new ArrayList<>();//dto에 저장해주기 위해 
		
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
				logger.info("업로드경로:" + fupload);
				
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
	public String carddetail(int cdseq,Model model, ReviewParam param) throws Exception{
		
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
		logger.info("업로드경로:" + fupload);
		System.out.println("업로드경로:" + fupload);
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
