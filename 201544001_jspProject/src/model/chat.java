package model;

import java.util.Date;

public class chat {
	private int Chat_no;
	private String Chat_name;
	private String Chat_pw;
	private String Chat_type;
	private Date CreateDate;
	
	public int getChat_no() {
		return Chat_no;
	}
	public void setChat_no(int chat_no) {
		Chat_no = chat_no;
	}
	public String getChat_name() {
		return Chat_name;
	}
	public void setChat_name(String chat_name) {
		Chat_name = chat_name;
	}
	public String getChat_pw() {
		return Chat_pw;
	}
	public void setChat_pw(String chat_pw) {
		Chat_pw = chat_pw;
	}
	public String getChat_type() {
		return Chat_type;
	}
	public void setChat_type(String chat_type) {
		Chat_type = chat_type;
	}
	public Date getCreateDate() {
		return CreateDate;
	}
	public void setCreateDate(Date createDate) {
		CreateDate = createDate;
	}
}
