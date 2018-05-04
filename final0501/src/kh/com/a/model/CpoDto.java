/*
CREATE TABLE WD_CPO(
CPOSEQ NUMBER(8) PRIMARY KEY,
FONT VARCHAR2(20) NOT NULL,
CONTENT VARCHAR2(1000) NOT NULL,		--인사말
WFNAME VARCHAR2(10) NOT NULL,		--신부 아버지 이름
WMNAME VARCHAR2(10) NOT NULL,		--신부 어머니 이름
WC VARCHAR2(10) NOT NULL,			--관계
WNAME VARCHAR2(10) NOT NULL,		--신부이름
MFNAME VARCHAR2(10) NOT NULL,		--신랑 아버지 이름
MMNAME VARCHAR2(10) NOT NULL,		--신부 어머니 이름
MC VARCHAR2(10) NOT NULL,		--관계
MNAME VARCHAR2(10) NOT NULL,		--신랑이름
CPDATE VARCHAR2(100) NOT NULL,				--예식일시
CPADD VARCHAR2(200) NOT NULL,		--예식장 주소 (예식장+ 층/홀/실)
CPTEL VARCHAR2(50) NOT NULL
);
CREATE SEQUENCE SEQ_CPOSEQ START WITH 1 INCREMENT BY 1;
 */

package kh.com.a.model;

import java.io.Serializable;

public class CpoDto implements Serializable {
	
	private int cposeq;
	private String font;
	private String content;
	private String wfname;
	private String wmname;
	private String wc;
	private String wname;
	private String mfname;
	private String mmname;
	private String mc;
	private String mname;
	private String cpdate;
	private String cpadd;
	private String cptel;
	
	public CpoDto() {}

	public int getCposeq() {
		return cposeq;
	}

	public void setCposeq(int cposeq) {
		this.cposeq = cposeq;
	}

	public String getFont() {
		return font;
	}

	public void setFont(String font) {
		this.font = font;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWfname() {
		return wfname;
	}

	public void setWfname(String wfname) {
		this.wfname = wfname;
	}

	public String getWmname() {
		return wmname;
	}

	public void setWmname(String wmname) {
		this.wmname = wmname;
	}

	public String getWc() {
		return wc;
	}

	public void setWc(String wc) {
		this.wc = wc;
	}

	public String getWname() {
		return wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
	}

	public String getMfname() {
		return mfname;
	}

	public void setMfname(String mfname) {
		this.mfname = mfname;
	}

	public String getMmname() {
		return mmname;
	}

	public void setMmname(String mmname) {
		this.mmname = mmname;
	}

	public String getMc() {
		return mc;
	}

	public void setMc(String mc) {
		this.mc = mc;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getCpdate() {
		return cpdate;
	}

	public void setCpdate(String cpdate) {
		this.cpdate = cpdate;
	}

	public String getCpadd() {
		return cpadd;
	}

	public void setCpadd(String cpadd) {
		this.cpadd = cpadd;
	}

	public String getCptel() {
		return cptel;
	}

	public void setCptel(String cptel) {
		this.cptel = cptel;
	}

	@Override
	public String toString() {
		return "CpoDto [cposeq=" + cposeq + ", font=" + font + ", content=" + content + ", wfname=" + wfname
				+ ", wmname=" + wmname + ", wc=" + wc + ", wname=" + wname + ", mfname=" + mfname + ", mmname=" + mmname
				+ ", mc=" + mc + ", mname=" + mname + ", cpdate=" + cpdate + ", cpadd=" + cpadd + ", cptel=" + cptel
				+ "]";
	}

}








