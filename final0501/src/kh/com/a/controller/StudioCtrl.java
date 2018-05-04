package kh.com.a.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.com.a.model.JjimDto;
import kh.com.a.model.StudioDto;
import kh.com.a.model.StudioProductDto;
import kh.com.a.model2.SdParam;
import kh.com.a.model2.StudioParam;
import kh.com.a.model2.StudioPicDto;
import kh.com.a.service.MypageServ;
import kh.com.a.service.StudioServ;
import kh.com.a.util.FUpUtil;

@Controller
public class StudioCtrl {
	
	@Autowired
	private StudioServ studioserv;
	@Autowired
	private MypageServ mypageserv;
	
	private static final Logger logger = LoggerFactory.getLogger(StudioCtrl.class);
	
	//해당 기능에 대한 뷰로 이동
	@RequestMapping(value="studiomain.do", method={RequestMethod.GET,RequestMethod.POST})
	public String detail(Model model, StudioParam sdDto) throws Exception{
		logger.info("KhMemberController company" + new Date());
		
		// paging 처리
		int sn = sdDto.getPageNumber();
		int start = (sn) * sdDto.getRecordCountPerPage() + 1;
		int end = (sn+1) * sdDto.getRecordCountPerPage();
		
		sdDto.setStart(start);
		sdDto.setEnd(end);
		
		int totalRecordCount = studioserv.getStudioCount(sdDto);
		List<StudioDto> sdDtolist = studioserv.getPagingStudioList(sdDto);
		model.addAttribute("sdDtolist", sdDtolist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", sdDto.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("s_category", sdDto.getS_category());
		model.addAttribute("s_keyword", sdDto.getS_keyword());
		
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
	public String studioDetail(Model model, int stseq, String flag, JjimDto jdto) throws Exception {
		logger.info("Welcome StudioCtrl studioDetail! "+ new Date());
		
		model.addAttribute("doc_title", "업체 디테일");
		
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
	public String modSd(Model model, SdParam sd, HttpServletRequest req) throws Exception {
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
		return "redirect:/studiomain.do";
	}
	
//	삭제
	@RequestMapping(value="sdDel.do", method={RequestMethod.GET,RequestMethod.POST})
	public String muDel(Model model, int stseq) throws Exception {
		logger.info("[StudioCtrl] sdDel " + new Date());
		studioserv.delStudioByStseq(stseq);
		return "redirect:/studiomain.do";
	}

}
