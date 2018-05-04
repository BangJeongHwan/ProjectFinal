package kh.com.a.model;

import java.io.Serializable;

public class CDetailParam implements Serializable {

	private int cdseq;
	private int wiseq;
	private String cid;
	private String cname;
	private String title;
	private String cdate;
	private String category;
	private int cbag;
	private int price;
	private String cardsize;
	private String content;
	private String picture0;
	private String picture1;
	private String picture2;
	private String picture3;
	
	private String s_category;	// 제목, 내용, 작성자
	private String s_keyword;	// 검색어
	private String order;
	
	// ------------- paging
	private int recordCountPerPage = 8;
	private int pageNumber = 0;
	
	private int start = 1;
	private int end = 10;
	
	public CDetailParam() {
		// TODO Auto-generated constructor stub
	}

	
	public int getCdseq() {
		return cdseq;
	}


	public void setCdseq(int cdseq) {
		this.cdseq = cdseq;
	}


	public int getWiseq() {
		return wiseq;
	}

	public void setWiseq(int wiseq) {
		this.wiseq = wiseq;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getCbag() {
		return cbag;
	}

	public void setCbag(int cbag) {
		this.cbag = cbag;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCardsize() {
		return cardsize;
	}

	public void setCardsize(String cardsize) {
		this.cardsize = cardsize;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
	
	

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	@Override
	public String toString() {
		return "CDetailParam [cdseq=" + cdseq + ", wiseq=" + wiseq + ", cid=" + cid + ", cname=" + cname + ", title="
				+ title + ", cdate=" + cdate + ", category=" + category + ", cbag=" + cbag + ", price=" + price
				+ ", cardsize=" + cardsize + ", content=" + content + ", picture0=" + picture0 + ", picture1="
				+ picture1 + ", picture2=" + picture2 + ", picture3=" + picture3 + ", s_category=" + s_category
				+ ", s_keyword=" + s_keyword + ", order=" + order + ", recordCountPerPage=" + recordCountPerPage
				+ ", pageNumber=" + pageNumber + ", start=" + start + ", end=" + end + "]";
	}

	

	
	
	
	
}
