package confirm.model.vo;

import java.sql.Date;

public class Cer {
/*CER_ID	NUMBER
CER_PIC	VARCHAR2(300 BYTE)
CER_COMMENT	VARCHAR2(100 BYTE)
CER_DATE	DATE
USER_ID	VARCHAR2(20 BYTE)
CHALL_NO	NUMBER
 * */
	private int cer_id;
	private String cer_pic;
	private String cer_comment;
	private Date cer_date;
	private String user_id;
	private int chall_no;
	private String chall_title;
	
	public Cer() {
		
	}

	public Cer(int cer_id, String cer_pic, String cer_comment, Date cer_date, String user_id, String chall_title) {
		super();
		this.cer_id = cer_id;
		this.cer_pic = cer_pic;
		this.cer_comment = cer_comment;
		this.cer_date = cer_date;
		this.user_id = user_id;
		this.chall_title = chall_title;
	}

	public Cer(int cer_id, String cer_pic, String cer_comment, Date cer_date, String user_id, int chall_no) {
		super();
		this.cer_id = cer_id;
		this.cer_pic = cer_pic;
		this.cer_comment = cer_comment;
		this.cer_date = cer_date;
		this.user_id = user_id;
		this.chall_no = chall_no;
	}

	public Cer(int cer_id, String cer_pic, String chall_title) {
		super();
		this.cer_id = cer_id;
		this.cer_pic = cer_pic;
		this.chall_title= chall_title;
	}

	public int getCer_id() {
		return cer_id;
	}

	public void setCer_id(int cer_id) {
		this.cer_id = cer_id;
	}

	public String getCer_pic() {
		return cer_pic;
	}

	public void setCer_pic(String cer_pic) {
		this.cer_pic = cer_pic;
	}

	public String getCer_comment() {
		return cer_comment;
	}

	public void setCer_comment(String cer_comment) {
		this.cer_comment = cer_comment;
	}

	public Date getCer_date() {
		return cer_date;
	}

	public void setCer_date(Date cer_date) {
		this.cer_date = cer_date;
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

	public String getChall_title() {
		return chall_title;
	}

	public void setChall_title(String chall_title) {
		this.chall_title = chall_title;
	}

	@Override
	public String toString() {
		return "Cer [cer_id=" + cer_id + ", cer_pic=" + cer_pic + ", cer_comment=" + cer_comment + ", cer_date="
				+ cer_date + ", user_id=" + user_id + ", chall_no=" + chall_no + "]";
	}
	
}
