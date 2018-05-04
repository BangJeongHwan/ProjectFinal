package kh.com.a.model;

/*
 * DROP TABLE WREVIEW
 * CASCADE CONSTRAINTS;
 * 
CREATE TABLE WREVIEW(
	RSEQ NUMBER(8) PRIMARY KEY,
	RPDSEQ NUMBER(8) NOT NULL,
	MID VARCHAR2(50) NOT NULL,
	PNAME VARCHAR2(50) NOT NULL,
	RDATE DATE NOT NULL,
	TITLE VARCHAR2(50) NOT NULL,
	CONTENT VARCHAR2(200) NOT NULL,
	PIC0 VARCHAR2(50),
	PIC1 VARCHAR2(50),
	PIC2 VARCHAR2(50),
	PIC3 VARCHAR2(50),
	RLIKE NUMBER(8) NOT NULL
);

CREATE SEQUENCE SEQ_RSEQ 
START WITH 1 INCREMENT BY 1; 
 * 
 */

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;


import java.util.ArrayList;
import java.util.List;

public class ReviewDto {

	private int rseq;
	private int rpdseq;
	private String mid;
	private String pname;
	private String rdate;
	private String title;
	private String content;
	private List<String> pic = new ArrayList();
	private String pic0;
	private String pic1;
	private String pic2;
	private String pic3;
	private int rlike;
	
	public ReviewDto() {
		for(int i=0; i<4; i++) {
			pic.add("");
		}
	}
	

	public ReviewDto(String mid, String pname, String rdate, String title, String content, int rlike) {
		super();
		this.mid = mid;
		this.pname = pname;
		this.rdate = rdate;
		this.title = title;
		this.content = content;
		this.rlike = rlike;
	}

	//소현review폼 만든거
	public ReviewDto(int rseq, int rpdseq, String mid, String pname, String rdate, String title, String content,
			int rlike) {
		super();
		this.rseq = rseq;
		this.rpdseq = rpdseq;
		this.mid = mid;
		this.pname = pname;
		this.rdate = rdate;
		this.title = title;
		this.content = content;
		this.rlike = rlike;
	}

	public int getRseq() {
		return rseq;
	}


	public void setRseq(int rseq) {
		this.rseq = rseq;
	}


	public int getRpdseq() {
		return rpdseq;
	}


	public void setRpdseq(int rpdseq) {
		this.rpdseq = rpdseq;
	}


	public String getMid() {
		return mid;
	}


	public void setMid(String mid) {
		this.mid = mid;
	}


	public String getPname() {
		return pname;
	}


	public void setPname(String pname) {
		this.pname = pname;
	}


	public String getRdate() {
		return rdate;
	}


	public void setRdate(String rdate) {
		this.rdate = rdate;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public List<String> getPic() {
		return pic;
	}


	public void setPic(List<String> pic) {
		this.pic = pic;
	}


	public String getPic0() {
		return pic0;
	}


	public void setPic0(String pic0) {
		this.pic0 = pic0;
	}


	public String getPic1() {
		return pic1;
	}


	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}


	public String getPic2() {
		return pic2;
	}


	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}


	public String getPic3() {
		return pic3;
	}


	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}


	public int getRlike() {
		return rlike;
	}


	public void setRlike(int rlike) {
		this.rlike = rlike;
	}


	@Override
	public String toString() {
		return "ReviewDto [rseq=" + rseq + ", rpdseq=" + rpdseq + ", mname=" + mid + ", pname=" + pname + ", rdate="
				+ rdate + ", content=" + content + ", pic=" + pic + ", pic0=" + pic0 + ", pic1=" + pic1 + ", pic2="
				+ pic2 + ", pic3=" + pic3 + ", rlike=" + rlike + "]";
	}




	
	
	
}
