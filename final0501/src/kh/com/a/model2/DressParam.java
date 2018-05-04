package kh.com.a.model2;

import java.io.Serializable;

public class DressParam implements Serializable {

	private int dsseq;
	private String cid;
	private String dname;
	private String picture0;
	private String picture1;
	private String picture2;
	private String picture3;
	private String picture4;
	private String picture5;
	private String picture6;
	private String picture7;
	private String picture8;
	private String picture9;
	private String content;
	private String opentime;
	private String addre;
	private String redate;
	private String retime;
	
	//----------------- search
	private String s_category;		// 제목, 내용, 작성자
	private String s_keyword;		// 검색어
	
	//----------------- paging
	private int recordCountPerPage = 10;
	private int pageNumber = 0;
	
	private int start = 1;
	private int end = 10;
	public int getDsseq() {
		return dsseq;
	}
	public void setDsseq(int dsseq) {
		this.dsseq = dsseq;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getPicture0() {
		return picture0;
	}
	public void setPicture0(String picture0) {
		this.picture0 = picture0;
	}
	public String getPicture1() {
		return picture1;
	}
	public void setPicture1(String picture1) {
		this.picture1 = picture1;
	}
	public String getPicture2() {
		return picture2;
	}
	public void setPicture2(String picture2) {
		this.picture2 = picture2;
	}
	public String getPicture3() {
		return picture3;
	}
	public void setPicture3(String picture3) {
		this.picture3 = picture3;
	}
	public String getPicture4() {
		return picture4;
	}
	public void setPicture4(String picture4) {
		this.picture4 = picture4;
	}
	public String getPicture5() {
		return picture5;
	}
	public void setPicture5(String picture5) {
		this.picture5 = picture5;
	}
	public String getPicture6() {
		return picture6;
	}
	public void setPicture6(String picture6) {
		this.picture6 = picture6;
	}
	public String getPicture7() {
		return picture7;
	}
	public void setPicture7(String picture7) {
		this.picture7 = picture7;
	}
	public String getPicture8() {
		return picture8;
	}
	public void setPicture8(String picture8) {
		this.picture8 = picture8;
	}
	public String getPicture9() {
		return picture9;
	}
	public void setPicture9(String picture9) {
		this.picture9 = picture9;
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
	public String getAddre() {
		return addre;
	}
	public void setAddre(String addre) {
		this.addre = addre;
	}
	public String getRedate() {
		return redate;
	}
	public void setRedate(String redate) {
		this.redate = redate;
	}
	public String getRetime() {
		return retime;
	}
	public void setRetime(String retime) {
		this.retime = retime;
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
		return "DressParam [dsseq=" + dsseq + ", cid=" + cid + ", dname=" + dname + ", picture0=" + picture0
				+ ", picture1=" + picture1 + ", picture2=" + picture2 + ", picture3=" + picture3 + ", picture4="
				+ picture4 + ", picture5=" + picture5 + ", picture6=" + picture6 + ", picture7=" + picture7
				+ ", picture8=" + picture8 + ", picture9=" + picture9 + ", content=" + content + ", opentime="
				+ opentime + ", addre=" + addre + ", redate=" + redate + ", retime=" + retime + ", s_category="
				+ s_category + ", s_keyword=" + s_keyword + ", recordCountPerPage=" + recordCountPerPage
				+ ", pageNumber=" + pageNumber + ", start=" + start + ", end=" + end + "]";
	}
	
	
}
