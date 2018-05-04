package kh.com.a.model2;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class MuPagingParam implements Serializable {

//	MakeupDto 동일
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
	
//	페이징관련
//	검색조건 추가
	private String s_category;		// 검색조건 : 회사명, 내용
	private String s_keyword;		// 검색어
	
//	페이징
//	TODO 0425
	private int recordCountPerPage = 10;	// 한 페이지에 들어갈 게시글 수
	private int pageNumber = 0;				// 현재 보고 있는 페이지
	private int start = 1;					// 한번에 보여줄 시작 블록 number(1~10 / 11~20)
	private int end = 10;
	
//	정렬
	private String orderCondition;	// 최신순, 조회순, (구매순)
	
	public MuPagingParam() {
		for (int i = 0; i < 10; i++) {
			pic.add("");
		}
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

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
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
	

	public String getOrderCondition() {
		return orderCondition;
	}

	public void setOrderCondition(String orderCondition) {
		this.orderCondition = orderCondition;
	}

	@Override
	public String toString() {
		return "MuPagingParam [museq=" + museq + ", s_category=" + s_category + ", s_keyword=" + s_keyword
				+ ", recordCountPerPage=" + recordCountPerPage + ", pageNumber=" + pageNumber + ", start=" + start
				+ ", end=" + end + ", orderCondition=" + orderCondition + "]";
	}
	
}













