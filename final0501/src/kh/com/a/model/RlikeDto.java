package kh.com.a.model;
/*
  create table rlike(
	MID VARCHAR2(50) NOT NULL,
	RSEQ NUMBER(8) NOT NULL
);

ALTER TABLE RLIKE
ADD CONSTRAINT FK_RLIKE_RSEQ FOREIGN KEY(RSEQ)
REFERENCES WREVIEW(RSEQ);
 
 */
public class RlikeDto {
	
	private int rseq;
	private String mid;
	
	public RlikeDto() {
		// TODO Auto-generated constructor stub
	}

	public int getRseq() {
		return rseq;
	}

	public void setRseq(int rseq) {
		this.rseq = rseq;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}
	
	
	

}
