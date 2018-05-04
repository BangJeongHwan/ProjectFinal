package kh.com.a.model;

import java.io.Serializable;

/*
DROP TABLE WD_RESERVATION CASCADE CONSTRAINTS;

CREATE TABLE WD_RESERVATION(
RVSEQ NUMBER(8) PRIMARY KEY,
MID VARCHAR2(50) NOT NULL,
REDATE DATE NOT NULL,
RETIME VARCHAR2(50) NOT NULL,
PDSEQ NUMBER(8) NOT NULL,
STATUS VARCHAR2(100) NOT NULL,
CONTENT VARCHAR2(100)
);

ALTER TABLE WD_RESERVATION ADD CONSTRAINT FK_MID FOREIGN KEY(MID) REFERENCES WD_MEMBER(MID);

CREATE SEQUENCE RV_SEQ
START WITH 1 INCREMENT BY 1;

DROP SEQUENCE RV_SEQ;
 */

public class ReservationDto implements Serializable {

	private int rvseq;
	private String mid;
	private String redate;
	private String retime;
	private int pdseq;
	private String status;
	private String content;
	
	public ReservationDto() {
	}

	public ReservationDto(int rvseq, String mid, String redate, String retime, int pdseq, String status,
			String content) {
		super();
		this.rvseq = rvseq;
		this.mid = mid;
		this.redate = redate;
		this.retime = retime;
		this.pdseq = pdseq;
		this.status = status;
		this.content = content;
	}

	public int getRvseq() {
		return rvseq;
	}

	public void setRvseq(int rvseq) {
		this.rvseq = rvseq;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
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

	public int getPdseq() {
		return pdseq;
	}

	public void setPdseq(int pdseq) {
		this.pdseq = pdseq;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "ReservationDto [rvseq=" + rvseq + ", mid=" + mid + ", redate=" + redate + ", retime=" + retime
				+ ", pdseq=" + pdseq + ", status=" + status + ", content=" + content + "]";
	}
	
}
