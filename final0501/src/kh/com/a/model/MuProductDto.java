/*
DROP TABLE WD_MU_PRODUCT CASCADE CONSTRAINTS;
CREATE TABLE WD_MU_PRODUCT(
	MUPDSEQ NUMBER(8) PRIMARY KEY,			-- 5000 번대, 결제, 장바구니, 예약(?)
	MUSEQ NUMBER(8) NOT NULL,
	TITLE VARCHAR2(50) NOT NULL,
	PRICE NUMBER(8) NOT NULL
);
ALTER TABLE WD_MU_PRODUCT ADD CONSTRAINT FK_MUPD_MUSEQ FOREIGN KEY(MUSEQ) REFERENCES WD_MAKEUP(MUSEQ);
DROP SEQUENCE SEQ_MUPDSEQ;
CREATE SEQUENCE SEQ_MUPDSEQ START WITH 5000 MAXVALUE 5999 INCREMENT BY 1;
 */
package kh.com.a.model;

import java.io.Serializable;

public class MuProductDto implements Serializable {
	
	private int mupdseq;
	private int museq;
	private String title;
	private int price;
	
	public MuProductDto() {}

	public MuProductDto(int mupdseq, int museq, String title, int price) {
		super();
		this.mupdseq = mupdseq;
		this.museq = museq;
		this.title = title;
		this.price = price;
	}

	public int getMupdseq() {
		return mupdseq;
	}

	public void setMupdseq(int mupdseq) {
		this.mupdseq = mupdseq;
	}

	public int getMuseq() {
		return museq;
	}

	public void setMuseq(int museq) {
		this.museq = museq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "MuProductDto [mupdseq=" + mupdseq + ", museq=" + museq + ", title=" + title + ", price=" + price + "]";
	}

}
