package kh.com.a.model2;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kh.com.a.model.MakeupDto;
import kh.com.a.model.MuProductDto;

public class MuParam implements Serializable{
//	http://ojc.asia/bbs/board.php?bo_table=LecSpring&wr_id=295
//	http://cofs.tistory.com/84
		
	private MakeupDto muDto;
	private List<MuProductDto> muPdList;
	private List<MultipartFile> fileList;
	private List<String> fileNameList;
	
	public MuParam() {}

	public MakeupDto getMuDto() {
		return muDto;
	}

	public void setMuDto(MakeupDto muDto) {
		this.muDto = muDto;
	}

	public List<MuProductDto> getMuPdList() {
		return muPdList;
	}

	public void setMuPdList(List<MuProductDto> muPdList) {
		this.muPdList = muPdList;
	}

	public List<MultipartFile> getFileList() {
		return fileList;
	}

	public void setFileList(List<MultipartFile> fileList) {
		this.fileList = fileList;
	}

	public List<String> getFileNameList() {
		return fileNameList;
	}

	public void setFileNameList(List<String> fileNameList) {
		this.fileNameList = fileNameList;
	}

}
