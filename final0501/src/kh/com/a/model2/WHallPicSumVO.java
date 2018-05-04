package kh.com.a.model2;

import java.io.Serializable;
public class WHallPicSumVO implements Serializable {
	
	private String hallname;
	private String sumpic;
	
	public WHallPicSumVO() {}
	
	public WHallPicSumVO(String hallname, String sumpic) {
		super();
		this.hallname = hallname;
		this.sumpic = sumpic;
	}
	public String getHallname() {
		return hallname;
	}
	public void setHallname(String hallname) {
		this.hallname = hallname;
	}
	public String getSumpic() {
		return sumpic;
	}
	public void setSumpic(String sumpic) {
		this.sumpic = sumpic;
	}
	@Override
	public String toString() {
		return "WHallPictureSumVO [hallname=" + hallname + ", sumpic=" + sumpic + "]";
	}	
}
