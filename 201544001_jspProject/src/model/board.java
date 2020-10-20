package model;

import java.util.Date;

public class board {
	private int Board_no;
	private String Board_name;
	private String Board_pw;
	private String Board_type;
	private String Board_content;
	private String ID;
	private Date CreateDate;
	public int getBoard_no() {
		return Board_no;
	}
	public void setBoard_no(int board_no) {
		Board_no = board_no;
	}
	public String getBoard_name() {
		return Board_name;
	}
	public void setBoard_name(String board_name) {
		Board_name = board_name;
	}
	public String getBoard_pw() {
		return Board_pw;
	}
	public void setBoard_pw(String board_pw) {
		Board_pw = board_pw;
	}
	public String getBoard_type() {
		return Board_type;
	}
	public void setBoard_type(String board_type) {
		Board_type = board_type;
	}
	public String getBoard_content() {
		return Board_content;
	}
	public void setBoard_content(String board_content) {
		Board_content = board_content;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public Date getCreateDate() {
		return CreateDate;
	}
	public void setCreateDate(Date createDate) {
		CreateDate = createDate;
	}
	
}
