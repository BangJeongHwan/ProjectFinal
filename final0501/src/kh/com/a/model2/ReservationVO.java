package kh.com.a.model2;

import java.io.Serializable;

public class ReservationVO implements Serializable {

	private int rvseq;
	private String mid;
	private String redate;
	private String retime;
	private int pdseq;
	private String status;
	private String content;
	private String mname;
	
	public ReservationVO() {
	}
	

	public ReservationVO(int rvseq, String mid, String redate, String retime, int pdseq, String status, String content,
			String mname) {
		super();
		this.rvseq = rvseq;
		this.mid = mid;
		this.redate = redate;
		this.retime = retime;
		this.pdseq = pdseq;
		this.status = status;
		this.content = content;
		this.mname = mname;
	}
	


	public String getMname() {
		return mname;
	}


	public void setMname(String mname) {
		this.mname = mname;
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
