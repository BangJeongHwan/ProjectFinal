package kh.com.a.util;

import java.io.Serializable;
import java.util.Calendar;

public class myCal implements Serializable {
	private int year = -100;
	private int month = -100;
	private int day = -100;
	private int lastDay=0;
	private int dayOfWeek=0;	
	
	private int hour = 0;
	private int min = 0;
	
	private String dateStr = "";
	
	Calendar cal = Calendar.getInstance();
	
	public myCal() {}
	
	public void calculate() {
		if(month == 0) {
			year--;
			month = 12;
		}else if(month == 13) {
			year++;
			month = 1;
		}else if(month < 0) {
			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH) + 1;
			if(day < 0) {
				day = cal.get(Calendar.DATE);
			}
		}
		cal.set(year, month-1, 1);
		dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);	
		
		dateStr = CalendarUtil.yymmdd(year, month-1, day);
	}

	
	
	public myCal(int year, int month, int day, int lastDay, int hour, int min, int dayOfWeek, String dateStr) {
		super();
		this.year = year;
		this.month = month;
		this.day = day;
		this.lastDay = lastDay;
		this.hour = hour;
		this.min = min;
		this.dayOfWeek = dayOfWeek;
		this.dateStr = dateStr;
	}
	
	

	public String getDateStr() {
		return dateStr;
	}

	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getLastDay() {
		return lastDay;
	}

	public void setLastDay(int lastDay) {
		this.lastDay = lastDay;
	}

	public int getDayOfWeek() {
		return dayOfWeek;
	}

	public void setDayOfWeek(int dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}

	public int getHour() {
		return hour;
	}

	public void setHour(int hour) {
		this.hour = hour;
	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public Calendar getCal() {
		return cal;
	}

	public void setCal(Calendar cal) {
		this.cal = cal;
	}

	@Override
	public String toString() {
		return "myCal [year=" + year + ", month=" + month + ", day=" + day + ", lastDay=" + lastDay + ", dayOfWeek="
				+ dayOfWeek + ", hour=" + hour + ", min=" + min + ", cal=" + cal + "]";
	}
	
	
}











