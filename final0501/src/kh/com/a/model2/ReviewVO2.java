package kh.com.a.model2;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO2 {

	private List<MultipartFile> files;
	private String upDir;
	
	public ReviewVO2() {
		// TODO Auto-generated constructor stub
	}

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public String getUpDir() {
		return upDir;
	}

	public void setUpDir(String upDir) {
		this.upDir = upDir;
	}

	@Override
	public String toString() {
		return "ReviewVO2 [files=" + files + ", upDir=" + upDir + "]";
	}
	
	
	
	
}
