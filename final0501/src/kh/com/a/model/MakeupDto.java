/*
DROP TABLE WD_MAKEUP CASCADE CONSTRAINTS;
CREATE TABLE WD_MAKEUP(
	MUSEQ NUMBER(8) PRIMARY KEY,			-- 5000번대, 찜
	CID VARCHAR2(50) NOT NULL,
	CNAME VARCHAR2(50) NOT NULL,
	PIC1 VARCHAR2(100),
	PIC2 VARCHAR2(100),
	PIC3 VARCHAR2(100),
	PIC4 VARCHAR2(100),
	PIC5 VARCHAR2(100),
	PIC6 VARCHAR2(100),
	PIC7 VARCHAR2(100),
	PIC8 VARCHAR2(100),
	PIC9 VARCHAR2(100),
	PIC0 VARCHAR2(100),
	CONTENT VARCHAR2(500) NOT NULL,
	ADDRESS VARCHAR2(200) NOT NULL,
	OPENTIME VARCHAR2(500) NOT NULL,		-- 오픈시간
	CLOSETIME VARCHAR2(500) NOT NULL,		-- 마감시간(마지막 예약시간)
	READCNT NUMBER(8)
);
ALTER TABLE WD_MAKEUP ADD CONSTRAINT FK_MU_CID FOREIGN KEY(CID) REFERENCES WD_COMPANY(CID);
DROP SEQUENCE SEQ_MUSEQ;
CREATE SEQUENCE SEQ_MUSEQ START WITH 5000 MAXVALUE 5999 INCREMENT BY 1;
 */
package kh.com.a.model;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class MakeupDto implements Serializable {
	private int museq;
	private String cid;
	private String cname;
	private List<String> pic = new ArrayList();		// add 용 오류날 경우 아예 dto 새로 만들 것.
	private String pic1;
	private String pic2;
	private String pic3;
	private String pic4;
	private String pic5;
	private String pic6;
	private String pic7;
	private String pic8;
	private String pic9;
	private String pic0;
	private String content;
	private String address;
	private String opentime;
	private String closetime;
	private int readcnt;
	
	public MakeupDto() {
		for (int i = 0; i < 10; i++) {
			pic.add("");
		}
	}

	public MakeupDto(String cid, String cname, String content, String address, String opentime, String closetime) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.content = content;
		this.address = address;
		this.opentime = opentime;
		this.closetime = closetime;
	}

	public int getMuseq() {
		return museq;
	}

	public void setMuseq(int museq) {
		this.museq = museq;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public List<String> getPic() {
		return pic;
	}

	public void setPic(List<String> pic) {
		this.pic = pic;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public String getPic0() {
		return pic0;
	}

	public void setPic0(String pic0) {
		this.pic0 = pic0;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	@Override
	public String toString() {
		return "MakeupDto [museq=" + museq + ", cid=" + cid + ", cname=" + cname + ", pic=" + pic + ", pic1=" + pic1
				+ ", pic2=" + pic2 + ", pic3=" + pic3 + ", pic4=" + pic4 + ", pic5=" + pic5 + ", pic6=" + pic6
				+ ", pic7=" + pic7 + ", pic8=" + pic8 + ", pic9=" + pic9 + ", pic0=" + pic0 + ", content=" + content
				+ ", address=" + address + ", opentime=" + opentime + ", closetime=" + closetime + ", readcnt="
				+ readcnt + "]";
	}
		
}
















