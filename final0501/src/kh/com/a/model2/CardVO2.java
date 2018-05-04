package kh.com.a.model2;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kh.com.a.model.CardDetailDto;


public class CardVO2 implements Serializable {
	
	private CardDetailDto dto;
	private List<MultipartFile> files;
	private List<String> fileNameList;
	
	public CardVO2() {
		// TODO Auto-generated constructor stub
	}

	public CardDetailDto getDto() {
		return dto;
	}

	public void setDto(CardDetailDto dto) {
		this.dto = dto;
	}

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public List<String> getFileNameList() {
		return fileNameList;
	}

	public void setFileNameList(List<String> fileNameList) {
		this.fileNameList = fileNameList;
	}

	@Override
	public String toString() {
		return "CardVO [dto=" + dto + ", files=" + files + ", fileNameList=" + fileNameList + "]";
	}
	
	
	
	
	
}
