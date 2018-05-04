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

import kh.com.a.model.CDetailParam;
import kh.com.a.model.CardDetailDto;
import kh.com.a.model.CardDto;
import kh.com.a.model.CardParam;
import kh.com.a.model2.CardVO;
import kh.com.a.model2.CardVO2;
import kh.com.a.service.CardService;
import kh.com.a.util.FUpUtil;

@Controller
public class CardController {
	
	private static final Logger logger = LoggerFactory.getLogger(CardController.class);
	
	@Autowired
	private CardService cardService;
	
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
	public String cdupdateAf(Model model, CardVO2 vo, HttpServletRequest req) throws Exception{
		logger.info("CardController cdupdateAf " + new Date());
		int seq = vo.getDto().getCdseq();
		
		List<MultipartFile> upFileList = new ArrayList<>();
		List<String> upFileNameList = new ArrayList<>();
		for (int i = 0; i < vo.getFiles().size(); i++) {
			if (vo.getFiles().get(i).getSize() != 0) {
				upFileList.add(vo.getFiles().get(i));
			}
		}
		for (int i = 0; i < vo.getFileNameList().size(); i++) {
			String tmpFileName = vo.getFileNameList().get(i);
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

		System.out.println("-> upFileNameList : " + vo.getDto().getPic().toString());
		for (int i = 0; i < upFileNameList.size(); i++) {
			vo.getDto().getPic().set(i, upFileNameList.get(i));
		}
		System.out.println("-> mu.getMuDto().getPic() : " + vo.getDto().getPic().toString());
		
		// Ddto 수정
		cardService.cdupdate(vo.getDto());
		
		model.addAttribute("seq", seq);
		
		return "redirect:/cadmin.do";
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
	public String carddetail(int cdseq,Model model) throws Exception{
		
		logger.info("CardController carddetail " + new Date());
		
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

	
	@RequestMapping(value="cardorder.do", method={RequestMethod.GET,RequestMethod.POST})
	public String cardorder(HttpServletRequest req,Model model) throws Exception{
		
		logger.info("CardController cardorder " + new Date());
		
		return "cardorder.tiles";
		
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
