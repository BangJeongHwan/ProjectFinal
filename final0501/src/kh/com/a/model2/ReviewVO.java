package kh.com.a.model2;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kh.com.a.model.ReviewDto;

public class ReviewVO {
	
	private ReviewDto dto;
	private List<ReviewDto> rvList;
	private List<MultipartFile> fileList;
	private List<String> fileNameList;
	
	public ReviewVO() {}

	
	
	public List<ReviewDto> getRvList() {
		return rvList;
	}



	public void setRvList(List<ReviewDto> rvList) {
		this.rvList = rvList;
	}



	public ReviewDto getDto() {
		return dto;
	}

	public void setDto(ReviewDto dto) {
		this.dto = dto;
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

	@Override
	public String toString() {
		return "ReviewVO [dto=" + dto + ", files=" + fileList + ", fileNameList=" + fileNameList + "]";
	}
	
	

}
