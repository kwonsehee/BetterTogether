package confirm.model.vo;

import java.sql.Date;

public class Confirm {

	private String user_id;
	private int chall_no;
	private int chall_status;
	private Date join_call_date;
	//챌린지 정보를 가지고 오기 위한 데이터
	private String chall_title;
	private String file_path;
	private String chall_start;
	
	
	public Confirm() {
		
	}

	public Confirm(String user_id, int chall_no, int chall_status, Date join_call_date) {
		super();
		this.user_id = user_id;
		this.chall_no = chall_no;
		this.chall_status = chall_status;
		this.join_call_date = join_call_date;
	}

	public Confirm(String user_id, int chall_no, int chall_status, Date join_call_date, String chall_title,
			String file_path, String chall_start) {
		super();
		this.user_id = user_id;
		this.chall_no = chall_no;
		this.chall_status = chall_status;
		this.join_call_date = join_call_date;
		this.chall_title = chall_title;
		this.file_path = file_path;
		this.chall_start = chall_start;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getChall_no() {
		return chall_no;
	}

	public void setChall_no(int chall_no) {
		this.chall_no = chall_no;
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

	public String getChall_title() {
		return chall_title;
	}

	public void setChall_title(String chall_title) {
		this.chall_title = chall_title;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getChall_start() {
		return chall_start;
	}

	public void setChall_start(String chall_start) {
		this.chall_start = chall_start;
	}

	@Override
	public String toString() {
		return "Confirm [user_id=" + user_id + ", chall_no=" + chall_no + ", chall_status=" + chall_status
				+ ", join_call_date=" + join_call_date + ", chall_title=" + chall_title + ", file_path=" + file_path
				+ ", chall_start=" + chall_start + "]";
	}

	
}
