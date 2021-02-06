package refund.model.vo;

import java.util.Date;

public class History {
	private int history_no;	
	private String user_id;
	private Date his_date;
	private int his_money;
	private int pm;//출금인지 입금인지
	private String comment;
	private int point;//거래후 잔액
	
	public History() {
		
	}

	public History(int history_no, String user_id, Date his_date, int his_money, int pm) {
		super();
		this.history_no = history_no;
		this.user_id = user_id;
		this.his_date = his_date;
		this.his_money = his_money;
		this.pm = pm;
	}
	

	public History(Date date, int his_money, int pm, String comment, int point) {
		super();
		this.his_date = date;
		this.his_money = his_money;
		this.pm = pm;
		this.comment = comment;
		this.point= point;
	}

	public int getHistory_no() {
		return history_no;
	}

	public void setHistory_no(int history_no) {
		this.history_no = history_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	
	public Date getHis_date() {
		return his_date;
	}

	public void setHis_date(Date his_date) {
		this.his_date = his_date;
	}

	public int getHis_money() {
		return his_money;
	}

	public void setHis_money(int his_money) {
		this.his_money = his_money;
	}

	public int getPm() {
		return pm;
	}

	public void setPm(int pm) {
		this.pm = pm;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "History [history_no=" + history_no + ", user_id=" + user_id + ", his_date=" + his_date + ", his_money="
				+ his_money + ", pm=" + pm + ", comment=" + comment + ", point=" + point + "]";
	}

	
	
	
	
}
