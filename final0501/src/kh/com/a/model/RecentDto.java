package kh.com.a.model;

import java.io.Serializable;

public class RecentDto implements Serializable {
	
	private String cid;
	private String cname;
	private String seq;
	private String pic;
	
	public RecentDto() {
		
	}

	public RecentDto(String cid, String cname, String seq) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.seq = seq;
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

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}
	
	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	@Override
	public String toString() {
		return "RecentDto [cid=" + cid + ", cname=" + cname + ", seq=" + seq + "]";
	}
	
	

}
