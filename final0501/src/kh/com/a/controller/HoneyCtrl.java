package kh.com.a.controller;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;

import kh.com.a.model.HoneyBbsDto;
import kh.com.a.model.HoneyMoonDto;
import kh.com.a.model2.HoneyBbsParam;
import kh.com.a.service.HoneyServ;
import kh.com.a.util.FUpUtil;
@Controller
public class HoneyCtrl {
	
	private static final Logger logger = LoggerFactory.getLogger(HoneyCtrl.class);
	
	@Autowired
	private HoneyServ honeyServ;
	
	@RequestMapping(value="honeymoon.do", method={RequestMethod.GET,RequestMethod.POST})
	public String honeymoon(Model model) {
		return "honeymoon.tiles";
	}
	

	@RequestMapping(value="hm_bbslist.do", method={RequestMethod.GET,RequestMethod.POST})
	public String hm_bbslist(Model model,HoneyBbsParam param,String sendarea) throws Exception {
		logger.info("[HoneyCtrl] hm_bbslist.do ");
		
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		System.out.println("snsnsnsnsnsnsnsn" + sn);
		
		if(sendarea != null) {
			System.out.println(sendarea);
			param.setS_category("area");
			param.setS_keyword(sendarea);
		}
	
		param.setStart(start);
		param.setEnd(end);
		int totalRecordCount = honeyServ.honeyBbsCount(param);
		System.out.println("--------param" + param.toString());
		List<HoneyBbsDto> bbslist = honeyServ.honeyBbsList(param);
		
		System.out.println("bbslist.size()" + bbslist.size());
		
		model.addAttribute("bbslist", bbslist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
		
		return "hm_bbslist.tiles";
	}	
	
	@RequestMapping(value="honeybbswrite.do", method={RequestMethod.GET,RequestMethod.POST})
	public String honeybbswrite(Model model) throws Exception {
		logger.info("[HoneyCtrl] honeybbswrite.do ");
		List<HoneyMoonDto> arealist = honeyServ.arealist();
		model.addAttribute("arealist", arealist);
		return "honeybbswrite.tiles";
	}
		
		@RequestMapping(value="hmBbsWriteAf.do", method={RequestMethod.GET,RequestMethod.POST})
	public String hmBbsWriteAf(Model model, HttpServletRequest req, HoneyBbsParam param) throws Exception {
			/*System.out.println("-----------------------------------"+param.getHmbDto().toString());
			System.out.println("-----------------------------------"+param.toString());
			System.out.println("-----------------------------------"+param.getFileList().get(0).toString());
			System.out.println("-----------------------------------"+param.getFileList().get(1).toString());*/
			logger.info("[HoneyCtrl] hmBbsWriteAf.do ");
			//param.getHmbDto().getFile0().substring(beginIndex, endIndex)
			// 전달받은 파일 리스트(size 고정) 중 value가 null인 것을 제외한 리스트 생성
			List<MultipartFile> upFileList = new ArrayList<>();
				for (int i = 0; i < param.getFileList().size(); i++) {
					if(param.getFileList().get(i).getSize() != 0) {
						upFileList.add(param.getFileList().get(i));
						//System.out.println("---------------------getName--------------"+param.getFileList().get(i).getName());	
						//System.out.println("---------------------getOriginalFilename--------------"+param.getFileList().get(i).getOriginalFilename());	
					}
				}
				
			
			
				// 파일 업로드
				for (int i = 0; i < upFileList.size(); i++) {
					MultipartFile fileload = upFileList.get(i);
					String oriFileName = fileload.getOriginalFilename();
					if (oriFileName != null && !oriFileName.trim().equals("")) {
						String fupload = req.getServletContext().getRealPath("/upload");	// tomcat
						String newFileName = FUpUtil.getNewFile(oriFileName);
						//System.out.println("---------------------newFileName--------------"+newFileName);
						param.getHmbDto().getFile().set(i, newFileName);
						
						// 파일 업로드
						try {
							File file = new File(fupload + "/" + newFileName);
							FileUtils.writeByteArrayToFile(file, fileload.getBytes());
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
				
				boolean b = honeyServ.honeybbswrite(param.getHmbDto());
				if(b) {
					return "redirect:/hm_bbslist.do";
				}else {
					return "redirect:/honeybbswrite.do";
				}
				
	}
		
		@RequestMapping(value = "honeyBbsDetail.do", 
				method = {RequestMethod.GET, RequestMethod.POST})
		public String honeyBbsDetail(int seq,Model model) throws Exception {
			logger.info("[HoneyCtrl] bbsdetail! ");
			honeyServ.hmBbsReadcount(seq);
			HoneyBbsDto bbs = honeyServ.honeybbsdetail(seq);
			bbs.getFile().clear();
			if(bbs.getFile0() != null) {
				bbs.getFile().add(bbs.getFile0());
				
			}if(bbs.getFile1() != null) {
				bbs.getFile().add(bbs.getFile1());
			}if(bbs.getFile2() != null) {
				bbs.getFile().add(bbs.getFile2());
			}if(bbs.getFile3() != null) {
				bbs.getFile().add(bbs.getFile3());
			}if(bbs.getFile4() != null) {
				bbs.getFile().add(bbs.getFile4());
			}
			System.out.println("------------------------------------------"+bbs.getFile().toString());
			System.out.println("------------------------------------------"+bbs.getFile().size());
			
			model.addAttribute("bbs", bbs);
			return "honeyBbsDetail.tiles";
		}
		
		
		@RequestMapping(value = "delhmbbs.do", 
		method = {RequestMethod.GET, RequestMethod.POST})
		public String delhmbbs(int seq,Model model) throws Exception {
			logger.info("[HoneyCtrl] delhmbbs! ");
			honeyServ.delhmbbs(seq);
			return "redirect:/hm_bbslist.do";
		}
		
		@RequestMapping(value = "hm_upbbs.do", 
				method = {RequestMethod.GET, RequestMethod.POST})
		public String hm_upbbs(Model model,int seq) throws Exception {
			logger.info("[HoneyCtrl] hm_upbbs! ");
			HoneyBbsDto bbs = honeyServ.honeybbsdetail(seq);
			bbs.getFile().clear();
			if(bbs.getFile0() != null) {
				bbs.getFile().add(bbs.getFile0());
			}if(bbs.getFile1() != null) {
				bbs.getFile().add(bbs.getFile1());
			}if(bbs.getFile2() != null) {
				bbs.getFile().add(bbs.getFile2());
			}if(bbs.getFile3() != null) {
				bbs.getFile().add(bbs.getFile3());
			}if(bbs.getFile4() != null) {
				bbs.getFile().add(bbs.getFile4());
			}
			model.addAttribute("bbs", bbs);
			
			List<HoneyMoonDto> arealist = honeyServ.arealist();
			model.addAttribute("arealist", arealist);
			return "hm_upbbs.tiles";
		}
		
		
		@RequestMapping(value = "updatehmAf.do", 
		method = {RequestMethod.GET, RequestMethod.POST})
		public String uphmbbs(HoneyBbsParam param , Model model, HttpServletRequest req) throws Exception {
			logger.info("[HoneyCtrl] updatehmAf! ");
			System.out.println("---------------------param.getHmbDto()--------------"+param.getHmbDto().toString());
			// 전달받은 파일 리스트(size 고정) 중 value가 null인 것을 제외한 리스트 생성
			List<MultipartFile> upFileList = new ArrayList<>();
			List<String> upFileNameList = new ArrayList<>();
			
			for (int i = 0; i < param.getFileList().size(); i++) {
				System.out.println("param.getFileList().get(i).toString()"+param.getFileList().get(i).getOriginalFilename());
				if(param.getFileList().get(i).getSize() != 0 && !param.getFileList().get(i).getOriginalFilename().equals("")) {
					upFileList.add(param.getFileList().get(i));
				}
			}
			
			System.out.println("param.getFileNameList().size()"+param.getFileNameList().size());
			
			for (int i = 0; i < param.getFileNameList().size(); i++) {
				String tmpFileName = param.getFileNameList().get(i);
				System.out.println("tmpFileName =========" + tmpFileName);
				if (tmpFileName != null && !tmpFileName.equals("")) {
					upFileNameList.add(tmpFileName);
					System.out.println("--------------------upFileNameList----------------------"+upFileNameList.get(i));
				}
			}
			System.out.println("--------------------upFileList----------------------"+upFileList.size());
			System.out.println("--------------------upFileNameList----------------------"+upFileNameList.size());
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
//								System.out.println("getIndex : " + getIndex);
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
			
			System.out.println("---------------------param.getHmbDto()--------------"+param.getHmbDto().toString());
			
			for (int i = 0; i < upFileNameList.size(); i++) {
				param.getHmbDto().getFile().set(i, upFileNameList.get(i));
			}
			boolean b = honeyServ.uphmbbs(param.getHmbDto());
			if(b) {
				return "redirect:/honeyBbsDetail.do?seq="+param.getHmbDto().getSeq();
			}else {
				return "redirect:/honeyBbsDetail.do?seq="+param.getHmbDto().getSeq();
			}
		}
	
		//TODO
		@RequestMapping(value = "findhoney.do", 
		method = {RequestMethod.GET, RequestMethod.POST})
		public String findhoney(Model model) throws Exception {
			logger.info("[HoneyCtrl] findhoney! ");
			List<HoneyMoonDto> arealist = honeyServ.arealist();
			model.addAttribute("arealist", arealist);
			return "findhoney.tiles";
		}
		
		@RequestMapping(value="compareHoney.do", method={RequestMethod.GET,RequestMethod.POST})
		public String compare(Model model, String area1, String area2) throws Exception {
			logger.info("[HoneyCtrl] compareHoney.do ");
			List<HoneyMoonDto> arealist = honeyServ.arealist();
			model.addAttribute("arealist", arealist);
			model.addAttribute("prearea1", area1);
			model.addAttribute("prearea2", area2);
			return "compareHoney.tiles";
		}
		
		@RequestMapping(value="hmStyle.do", method={RequestMethod.GET,RequestMethod.POST})
		public String hmStyle(Model model, String style) throws Exception {
			logger.info("[HoneyCtrl] hmStyle.do ");
			List<HoneyMoonDto> arealist = honeyServ.arealist();
			model.addAttribute("arealist", arealist);
			model.addAttribute("style", style);
			return "hmStyle.tiles";
		}
		
		
		@RequestMapping(value="hmareaselect.do", method={RequestMethod.GET,RequestMethod.POST})
		public String hmareaselect(Model model, String selarea) throws Exception {
			logger.info("[HoneyCtrl] hmareaselect.do ");
			model.addAttribute("selarea", selarea);
			return "hmareaselect.tiles";
		}
		
		
		
		
		
		
		
		
}
