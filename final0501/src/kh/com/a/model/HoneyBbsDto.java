package kh.com.a.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

/*
DROP TABLE WD_HONEYBBS
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_HMSEQ;

CREATE TABLE WD_HONEYBBS(
	SEQ NUMBER(8) PRIMARY KEY,
	ID VARCHAR2(50) NOT NULL,
	TITLE VARCHAR2(200) NOT NULL,
	CONTENT0 VARCHAR2(4000) NOT NULL,
    CONTENT1 VARCHAR2(2000),
    CONTENT2 VARCHAR2(2000),
    CONTENT3 VARCHAR2(2000),
    CONTENT4 VARCHAR2(2000),
	AREA VARCHAR2(50) NOT NULL,
	FILE0 VARCHAR2(100),
	FILE1 VARCHAR2(100),
	FILE2 VARCHAR2(100),
	FILE3 VARCHAR2(100),
	FILE4 VARCHAR2(100),
	WDATE DATE NOT NULL,
	DEL NUMBER(1) NOT NULL,
	READCOUNT NUMBER(8) NOT NULL
);

CREATE SEQUENCE SEQ_HMSEQ
START WITH 1 INCREMENT BY 1;

ALTER TABLE WD_HONEYBBS
ADD CONSTRAINT FK_HMBBS_ID FOREIGN KEY(ID)
REFERENCES WD_MEMBER(MID);

*/


public class HoneyBbsDto implements Serializable {

	private int seq;
	private String id;
	private String title;
	private String content0;
	private String content1;
	private String content2;
	private String content3;
	private String content4;
	private String area;
	private String file0;
	private String file1;
	private String file2;
	private String file3;
	private String file4;
	private List<String> file = new ArrayList<>();
	private String wdate;
	private int del;
	private int readcount;
	
	
	public HoneyBbsDto() {
		for (int i = 0; i < 5; i++) {
			file.add("");
			}
	}
	
	public HoneyBbsDto(int seq, String id, String title, String area) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.area = area;
	}



	public HoneyBbsDto(int seq, String id, String title, String content0, String content1, String content2,
			String content3, String content4, String area, String file0, String file1, String file2, String file3,
			String file4, List<String> file, String wdate, int del, int readcount) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content0 = content0;
		this.content1 = content1;
		this.content2 = content2;
		this.content3 = content3;
		this.content4 = content4;
		this.area = area;
		this.file0 = file0;
		this.file1 = file1;
		this.file2 = file2;
		this.file3 = file3;
		this.file4 = file4;
		this.wdate = wdate;
		this.readcount = readcount;
	}



	public int getSeq() {
		return seq;
	}



	public void setSeq(int seq) {
		this.seq = seq;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContent0() {
		return content0;
	}



	public void setContent0(String content0) {
		this.content0 = content0;
	}



	public String getContent1() {
		return content1;
	}



	public void setContent1(String content1) {
		this.content1 = content1;
	}



	public String getContent2() {
		return content2;
	}



	public void setContent2(String content2) {
		this.content2 = content2;
	}



	public String getContent3() {
		return content3;
	}



	public void setContent3(String content3) {
		this.content3 = content3;
	}



	public String getContent4() {
		return content4;
	}



	public void setContent4(String content4) {
		this.content4 = content4;
	}



	public String getArea() {
		return area;
	}



	public void setArea(String area) {
		this.area = area;
	}



	public String getFile0() {
		return file0;
	}



	public void setFile0(String file0) {
		this.file0 = file0;
	}



	public String getFile1() {
		return file1;
	}



	public void setFile1(String file1) {
		this.file1 = file1;
	}



	public String getFile2() {
		return file2;
	}



	public void setFile2(String file2) {
		this.file2 = file2;
	}



	public String getFile3() {
		return file3;
	}



	public void setFile3(String file3) {
		this.file3 = file3;
	}



	public String getFile4() {
		return file4;
	}



	public void setFile4(String file4) {
		this.file4 = file4;
	}



	public List<String> getFile() {
		return file;
	}



	public void setFile(List<String> file) {
		this.file = file;
	}



	public String getWdate() {
		return wdate;
	}



	public void setWdate(String wdate) {
		this.wdate = wdate;
	}



	public int getDel() {
		return del;
	}



	public void setDel(int del) {
		this.del = del;
	}



	public int getReadcount() {
		return readcount;
	}



	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}



	@Override
	public String toString() {
		return "HoneyBbsDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content0=" + content0 + ", content1="
				+ content1 + ", content2=" + content2 + ", content3=" + content3 + ", content4=" + content4 + ", area="
				+ area + ", file0=" + file0 + ", file1=" + file1 + ", file2=" + file2 + ", file3=" + file3 + ", file4="
				+ file4 + ", file=" + file + ", wdate=" + wdate + ", del=" + del + ", readcount=" + readcount + "]";
	}


	
	
}





