package kh.com.a.model2;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kh.com.a.model.StudioDto;
import kh.com.a.model.StudioProductDto;

public class SdParam implements Serializable{
//	http://ojc.asia/bbs/board.php?bo_table=LecSpring&wr_id=295
//	http://cofs.tistory.com/84
		
	private StudioDto sdDto;
	private List<StudioProductDto> sdPdList;
	private List<MultipartFile> fileList;
	private List<String> fileNameList;
	
	public SdParam() {}

	public List<String> getFileNameList() {
		return fileNameList;
	}

	public void setFileNameList(List<String> fileNameList) {
		this.fileNameList = fileNameList;
	}

	public StudioDto getSdDto() {
		return sdDto;
	}

	public void setSdDto(StudioDto sdDto) {
		this.sdDto = sdDto;
	}

	public List<StudioProductDto> getSdPdList() {
		return sdPdList;
	}

	public void setSdPdList(List<StudioProductDto> sdPdList) {
		this.sdPdList = sdPdList;
	}

	public List<MultipartFile> getFileList() {
		return fileList;
	}

	public void setFileList(List<MultipartFile> fileList) {
		this.fileList = fileList;
	}

	
	
	

}
