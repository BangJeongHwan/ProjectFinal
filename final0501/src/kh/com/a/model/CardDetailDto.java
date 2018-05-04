package kh.com.a.model;
/*
CREATE TABLE CARDDETAIL(
PDSEQ NUMBER(8) PRIMARY KEY,
WISEQ NUMBER(8) NOT NULL,
CID VARCHAR2(50) NOT NULL,
CNAME VARCHAR2(50) NOT NULL,
TITLE VARCHAR2(200) NOT NULL,
CDATE DATE NOT NULL,
CATEGORY VARCHAR2(100) NOT NULL,
CBAG NUMBER(2) NOT NULL,
PRICE VARCHAR2(100) NOT NULL,
CARDSIZE VARCHAR2(200) NOT NULL,
CONTENT VARCHAR2(500) NOT NULL,
PICTURE0 VARCHAR2(50) NOT NULL,
PICTURE1 VARCHAR2(50) NOT NULL,
PICTURE2 VARCHAR2(50) NOT NULL,
PICTURE3 VARCHAR2(50) NOT NULL
);
ALTER TABLE CARDDETAIL
ADD CONSTRAINT FK_CARDDETAIL_WISEQ FOREIGN KEY(WISEQ)
REFERENCES CARD(WISEQ);

 */
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class CardDetailDto implements Serializable {
	
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
	private List<String> pic = new ArrayList<>();
	private String picture0;
	private String picture1;
	private String picture2;
	private String picture3;
	
	public CardDetailDto() {
		for(int i=0; i<4; i++) {
			pic.add("");
		}
	}

	

	public List<String> getPic() {
		return pic;
	}




	public void setPic(List<String> pic) {
		this.pic = pic;
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

	@Override
	public String toString() {
		return "CardDetailDto [cdseq=" + cdseq + ", wiseq=" + wiseq + ", cid=" + cid + ", cname=" + cname + ", title="
				+ title + ", cdate=" + cdate + ", category=" + category + ", cbag=" + cbag + ", price=" + price
				+ ", cardsize=" + cardsize + ", content=" + content + ", picture0=" + picture0 + ", picture1="
				+ picture1 + ", picture2=" + picture2 + ", picture3=" + picture3 + "]";
	}
	
	


	
	

}
