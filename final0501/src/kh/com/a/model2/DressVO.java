package kh.com.a.model2;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kh.com.a.model.DressDto;

public class DressVO {

	private DressDto Ddto;
	private List<MultipartFile> fileList;
	private List<String> fileNameList;
	
	public DressVO() {
	}
	public DressDto getDdto() {
		return Ddto;
	}
	public void setDdto(DressDto ddto) {
		Ddto = ddto;
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
