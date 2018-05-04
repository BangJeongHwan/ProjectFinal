package kh.com.a.model2;

import java.io.Serializable;

public class StudioPicDto implements Serializable {
	
	private String pic;
	
	public StudioPicDto() {
		
	}
	
	public StudioPicDto(String pic) {
		super();
		this.pic = pic;
	}
	
	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	@Override
	public String toString() {
		return "StudioPicDto [pic=" + pic + "]";
	}
	
	

}
