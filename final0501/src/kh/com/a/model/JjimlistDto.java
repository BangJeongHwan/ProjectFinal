package kh.com.a.model;

import java.io.Serializable;

public class JjimlistDto implements Serializable {
	
	private int seq;
	private String cname;
	private String pic;
	
	public JjimlistDto() {
		
	}
	
	public JjimlistDto(int seq, String cname, String pic) {
		super();
		this.seq = seq;
		this.cname = cname;
		this.pic = pic;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	@Override
	public String toString() {
		return "JjimlistDto [seq=" + seq + ", cname=" + cname + ", pic=" + pic + "]";
	}
	
}
