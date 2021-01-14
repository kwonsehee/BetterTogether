package confirm.model.vo;

import java.sql.Date;

public class Confirm {

	private String user_id;
	private int chall_nol;
	private int chall_status;
	private Date join_call_date;
	
	public Confirm() {
		
	}

	public Confirm(String user_id, int chall_nol, int chall_status, Date join_call_date) {
		super();
		this.user_id = user_id;
		this.chall_nol = chall_nol;
		this.chall_status = chall_status;
		this.join_call_date = join_call_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getChall_nol() {
		return chall_nol;
	}

	public void setChall_nol(int chall_nol) {
		this.chall_nol = chall_nol;
	}

	public int getChall_status() {
		return chall_status;
	}

	public void setChall_status(int chall_status) {
		this.chall_status = chall_status;
	}

	public Date getJoin_call_date() {
		return join_call_date;
	}

	public void setJoin_call_date(Date join_call_date) {
		this.join_call_date = join_call_date;
	}

	@Override
	public String toString() {
		return "Confirm [user_id=" + user_id + ", chall_nol=" + chall_nol + ", chall_status=" + chall_status
				+ ", join_call_date=" + join_call_date + "]";
	}
	
}
