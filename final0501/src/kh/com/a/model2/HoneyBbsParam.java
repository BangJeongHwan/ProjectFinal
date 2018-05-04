package kh.com.a.model2;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kh.com.a.model.HoneyBbsDto;

public class HoneyBbsParam {
	
	private HoneyBbsDto hmbDto;
	private List<MultipartFile> fileList;
	private List<String> fileNameList;
	
	//-------------------------------search
	private String s_category;
	private String s_keyword;
	//------------------------------paging
	private int recordCountPerPage = 10;
	private int pageNumber = 0;
	
	private int start = 1;
	private int end = 10;
	
	public HoneyBbsParam() {}

	public HoneyBbsParam( String s_category, String s_keyword, int recordCountPerPage, int pageNumber, int start, int end) {
		super();
		this.s_category = s_category;
		this.s_keyword = s_keyword;
		this.recordCountPerPage = recordCountPerPage;
		this.pageNumber = pageNumber;
		this.start = start;
		this.end = end;
	}



	public HoneyBbsDto getHmbDto() {
		return hmbDto;
	}

	public void setHmbDto(HoneyBbsDto hmbDto) {
		this.hmbDto = hmbDto;
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

	public String getS_category() {
		return s_category;
	}

	public void setS_category(String s_category) {
		this.s_category = s_category;
	}

	public String getS_keyword() {
		return s_keyword;
	}

	public void setS_keyword(String s_keyword) {
		this.s_keyword = s_keyword;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "HoneyBbsParam [hmbDto=" + hmbDto + ", fileList=" + fileList + ", s_category=" + s_category
				+ ", s_keyword=" + s_keyword + ", recordCountPerPage=" + recordCountPerPage + ", pageNumber="
				+ pageNumber + ", start=" + start + ", end=" + end + "]";
	}
	
	
	
	
	
}
