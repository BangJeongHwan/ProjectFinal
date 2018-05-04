package kh.com.a.model;

public class ReviewParam {
	
	private int rseq;
	private int rpdseq;
	private String mid;
	private String pname;
	private String rdate;
	private String title;
	private String content;
	private String pic0;
	private String pic1;
	private String pic2;
	private String pic3;
	private int rlike;
	
	private String s_category;	// 제목, 내용, 작성자
	private String s_keyword;	
	
	private int recordCountPerPage = 8;
	private int pageNumber = 0;
	
	private int start = 1;
	private int end = 10;
	
	public ReviewParam() {
		// TODO Auto-generated constructor stub
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
		return "ReviewParam [rseq=" + rseq + ", rpdseq=" + rpdseq + ", mid=" + mid + ", pname=" + pname + ", rdate="
				+ rdate + ", title=" + title + ", content=" + content + ", pic0=" + pic0 + ", pic1=" + pic1 + ", pic2="
				+ pic2 + ", pic3=" + pic3 + ", rlike=" + rlike + ", s_category=" + s_category + ", s_keyword="
				+ s_keyword + ", recordCountPerPage=" + recordCountPerPage + ", pageNumber=" + pageNumber + ", start="
				+ start + ", end=" + end + "]";
	}
	
	

}
