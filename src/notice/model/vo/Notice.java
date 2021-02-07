package notice.model.vo;

import java.sql.Date;

public class Notice {
	/* ARTICLE_NO	NUMBER
		ARTICLE_TITLE	VARCHAR2(100 BYTE)
		ARTICLE_FILE	VARCHAR2(100 BYTE)
		ARTICLE_CONTNENT	VARCHAR2(100 BYTE)
		ARTICLE_DATE	DATE
		ARTICLE_MODIFY	DATE
		USER_ID	VARCHAR2(20 BYTE)
		ARTICLE_CNT	NUMBER
		ARTICLE_TYPE	NUMBER
	*/
	
	private int aNo;
	private String aTitle;
	private String aFile;
	private String aContent;
	private Date aDate;
	private Date aModify_date;	
	private String user_id;
	private int aCnt;
	private int aType;

	
	public Notice() {
		
	}

	
	public Notice(String aTitle, String aContent, String user_id, int aType) {
		super();
		this.aTitle = aTitle;
		this.aContent = aContent;
		this.user_id = user_id;
		this.aType = aType;
	}


	public Notice(String aTitle, String aContent, String user_id) {
		super();
		this.aTitle = aTitle;
		this.aContent = aContent;
		this.user_id = user_id;
	}


	public Notice(String aTitle, String aFile, String aContent, String user_id, int aType) {
		super();
		this.aTitle = aTitle;
		this.aFile = aFile;
		this.aContent = aContent;
		this.user_id = user_id;
		this.aType = aType;
	}
	
	public Notice(String aTitle, String aFile, String aContent, String user_id) {
		super();
		this.aTitle = aTitle;
		this.aFile = aFile;
		this.aContent = aContent;
		this.user_id = user_id;
	}


	public Notice(int aNo, String aTitle, String aContent, Date aDate, Date aModify_date, String user_id, int aCnt) {
		super();
		this.aNo = aNo;
		this.aTitle = aTitle;
		this.aContent = aContent;
		this.aDate = aDate;
		this.aModify_date = aModify_date;
		this.user_id = user_id;
		this.aCnt = aCnt;
	}


	public Notice(int aNo, String aTitle, String aContent, Date aDate, Date aModify_date, String user_id, int aCnt,
			int aType) {
		super();
		this.aNo = aNo;
		this.aTitle = aTitle;
		this.aContent = aContent;
		this.aDate = aDate;
		this.aModify_date = aModify_date;
		this.user_id = user_id;
		this.aCnt = aCnt;
		this.aType = aType;
	}


	public int getaNo() {
		return aNo;
	}


	public void setaNo(int aNo) {
		this.aNo = aNo;
	}


	public String getaTitle() {
		return aTitle;
	}


	public void setaTitle(String aTitle) {
		this.aTitle = aTitle;
	}


	public String getaFile() {
		return aFile;
	}


	public void setaFile(String aFile) {
		this.aFile = aFile;
	}


	public String getaContent() {
		return aContent;
	}


	public void setaContent(String aContent) {
		this.aContent = aContent;
	}


	public Date getaDate() {
		return aDate;
	}


	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}


	public Date getaModify_date() {
		return aModify_date;
	}


	public void setaModify_date(Date aModify_date) {
		this.aModify_date = aModify_date;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public int getaCnt() {
		return aCnt;
	}


	public void setaCnt(int aCnt) {
		this.aCnt = aCnt;
	}


	public int getaType() {
		return aType;
	}


	public void setaType(int aType) {
		this.aType = aType;
	}

	
}

