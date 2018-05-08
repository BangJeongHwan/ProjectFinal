package kh.com.a.model2;

import java.io.Serializable;
 
public class ReservCalParam implements Serializable {

	private int rvseq;
	private String mid;
	private String redate;
	private String retime;
	private int pdseq;
	private String status;
	private String content;
	
	// 추가
	private String mname;
	
	public ReservCalParam() {}

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

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	@Override
	public String toString() {
		return "ReservCalParam [rvseq=" + rvseq + ", mid=" + mid + ", redate=" + redate + ", retime=" + retime
				+ ", pdseq=" + pdseq + ", status=" + status + ", content=" + content + ", mname=" + mname + "]";
	}
	
}
