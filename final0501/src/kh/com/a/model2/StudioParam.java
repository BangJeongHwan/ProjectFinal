package kh.com.a.model2;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class StudioParam implements Serializable {

	/*
	CREATE TABLE WD_STUDIO(
STSEQ NUMBER(8) PRIMARY KEY,
CID VARCHAR2(50) NOT NULL,
CNAME VARCHAR2(50) NOT NULL,
PICTURE0 VARCHAR2(50),
PICTURE1 VARCHAR2(50),
PICTURE2 VARCHAR2(50),
PICTURE3 VARCHAR2(50),
PICTURE4 VARCHAR2(50),
PICTURE5 VARCHAR2(50),
PICTURE6 VARCHAR2(50),
PICTURE7 VARCHAR2(50),
PICTURE8 VARCHAR2(50),
PICTURE9 VARCHAR2(50),
VIDEO VARCHAR2(300),
CONTENT VARCHAR2(300) NOT NULL,
OPENTIME VARCHAR2(50) NOT NULL,
CLOSETIME VARCHAR2(50) NOT NULL,
ADDRE VARCHAR2(50) NOT NULL
);

SELECT * FROM WD_STUDIO

CREATE SEQUENCE SEQ_STUDIO
START WITH 1 INCREMENT BY 1;

ALTER TABLE WD_STUDIO
ADD CONSTRAINT FK_STUDIO_CID FOREIGN KEY(CID)
REFERENCES WD_COMPANY(CID);

	*/
	
	private int stseq;
	private String cid;
	private String cname;
	private List<String> pic = new ArrayList();
	private String pic0;
	private String pic1;
	private String pic2;
	private String pic3;
	private String pic4;
	private String pic5;
	private String pic6;
	private String pic7;
	private String pic8;
	private String pic9;
	private String video;
	private String content;
	private String opentime;
	private String closetime;
	private String addre;
	
	//----------------- search
	private String s_category;		// 제목, 내용, 작성자
	private String s_keyword;		// 검색어
	
	//----------------- paging
	private int recordCountPerPage = 10;
	private int pageNumber = 0;
	
	private int start = 1;
	private int end = 10;
	
	public StudioParam() {
		for (int i = 0; i < 10; i++) {
			pic.add("");
		}
	}
	
	public StudioParam(int stseq, String cid, String cname, String pic0, String pic1, String pic2, String pic3, String pic4,
			String pic5, String pic6, String pic7, String pic8, String pic9, String video, String content,
			String opentime, String closetime, String addre) {
		super();
		this.stseq = stseq;
		this.cid = cid;
		this.cname = cname;
		this.pic0 = pic0;
		this.pic1 = pic1;
		this.pic2 = pic2;
		this.pic3 = pic3;
		this.pic4 = pic4;
		this.pic5 = pic5;
		this.pic6 = pic6;
		this.pic7 = pic7;
		this.pic8 = pic8;
		this.pic9 = pic9;
		this.video = video;
		this.content = content;
		this.opentime = opentime;
		this.closetime = closetime;
		this.addre = addre;
	}

	public StudioParam(String cid, String cname, String pic0, String pic1, String pic2, String pic3, String pic4, String pic5,
			String pic6, String pic7, String pic8, String pic9, String video, String content, String opentime, String closetime, 
			String addre) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.pic0 = pic0;
		this.pic1 = pic1;
		this.pic2 = pic2;
		this.pic3 = pic3;
		this.pic4 = pic4;
		this.pic5 = pic5;
		this.pic6 = pic6;
		this.pic7 = pic7;
		this.pic8 = pic8;
		this.pic9 = pic9;
		this.video = video;
		this.content = content;
		this.opentime = opentime;
		this.closetime = closetime;
		this.addre = addre;
	}
	
	public StudioParam(String cid, String cname, String content, String opentime, String closetime, String addre) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.content = content;
		this.opentime = opentime;
		this.closetime = closetime;
		this.addre = addre;
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

	public int getStseq() {
		return stseq;
	}
	public void setStseq(int stseq) {
		this.stseq = stseq;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	
	public List<String> getPic() {
		return pic;
	}

	public void setPic(List<String> pic) {
		this.pic = pic;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
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
	public String getPic4() {
		return pic4;
	}
	public void setPic4(String pic4) {
		this.pic4 = pic4;
	}
	public String getPic5() {
		return pic5;
	}
	public void setPic5(String pic5) {
		this.pic5 = pic5;
	}
	public String getPic6() {
		return pic6;
	}
	public void setPic6(String pic6) {
		this.pic6 = pic6;
	}
	public String getPic7() {
		return pic7;
	}
	public void setPic7(String pic7) {
		this.pic7 = pic7;
	}
	public String getPic8() {
		return pic8;
	}
	public void setPic8(String pic8) {
		this.pic8 = pic8;
	}
	public String getPic9() {
		return pic9;
	}
	public void setPic9(String pic9) {
		this.pic9 = pic9;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getOpentime() {
		return opentime;
	}
	public void setOpentime(String opentime) {
		this.opentime = opentime;
	}

	public String getClosetime() {
		return closetime;
	}

	public void setClosetime(String closetime) {
		this.closetime = closetime;
	}

	public String getAddre() {
		return addre;
	}
	public void setAddre(String addre) {
		this.addre = addre;
	}
	@Override
	public String toString() {
		return "StudioDto [stseq=" + stseq + ", cid=" + cid + ", pic0=" + pic0 + ", pic1=" + pic1 + ", pic2=" + pic2
				+ ", pic3=" + pic3 + ", pic4=" + pic4 + ", pic5=" + pic5 + ", pic6=" + pic6 + ", pic7=" + pic7
				+ ", pic8=" + pic8 + ", pic9=" + pic9 + ", video=" + video + ", content=" + content + ", opentime="
				+ opentime + ", addre=" + addre + "]";
	}
	
	
	
}
