package kh.com.a.model2;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kh.com.a.model.WeddingHallDto;

public class WdParam implements Serializable {
	private WeddingHallDto hallPd;
	private List<MultipartFile> fileList;
	private List<String> fileNameList;
	
	public WdParam() {}	

	public WeddingHallDto getHallPd() {
		return hallPd;
	}
	public void setHallPd(WeddingHallDto hallPd) {
		this.hallPd = hallPd;
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
