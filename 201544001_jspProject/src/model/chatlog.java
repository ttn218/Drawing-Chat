package model;

import java.util.Date;

public class chatlog {
	private int Log_no;
	private int Chat_no;
	private String Content;
	private Date date;
	public int getLog_no() {
		return Log_no;
	}
	public void setLog_no(int log_no) {
		Log_no = log_no;
	}
	public int getChat_no() {
		return Chat_no;
	}
	public void setChat_no(int chat_no) {
		Chat_no = chat_no;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
