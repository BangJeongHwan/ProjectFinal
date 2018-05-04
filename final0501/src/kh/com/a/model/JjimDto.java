package kh.com.a.model;

import java.io.Serializable;

public class JjimDto implements Serializable {
	
	private int pdseq;
	private String usid;
	
	public JjimDto() {
		
	}
	
	public JjimDto(int pdseq, String usid) {
		super();
		this.pdseq = pdseq;
		this.usid = usid;
	}

	public int getPdseq() {
		return pdseq;
	}
	public void setPdseq(int pdseq) {
		this.pdseq = pdseq;
	}
	public String getUsid() {
		return usid;
	}
	public void setUsid(String usid) {
		this.usid = usid;
	}

	@Override
	public String toString() {
		return "JjimDto [pdseq=" + pdseq + ", usid=" + usid + "]";
	}
}
