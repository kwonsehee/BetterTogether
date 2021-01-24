package faq.model.vo;

import java.sql.Date;

public class FAQ {
	/*
	FAQ_NO
	FAQ_TITLE
	FAQ_CONTENT
	FAQ_DATE
	FAQ_MODIFY
	FAQ_STATUS
	USER_ID
	*/
	
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private Date faqDate;
	private Date faqModify;
	private String faqStatus;
	private String userId;
	
	public FAQ() {}

	public FAQ(int faqNo, String faqTitle, String faqContent, Date faqDate, Date faqModify, String faqStatus,
			String userId) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqDate = faqDate;
		this.faqModify = faqModify;
		this.faqStatus = faqStatus;
		this.userId = userId;
	}

	public FAQ(String faqTitle, String faqContent, String userId) {
		super();
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.userId = userId;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public Date getFaqDate() {
		return faqDate;
	}

	public void setFaqDate(Date faqDate) {
		this.faqDate = faqDate;
	}

	public Date getFaqModify() {
		return faqModify;
	}

	public void setFaqModify(Date faqModify) {
		this.faqModify = faqModify;
	}

	public String getFaqStatus() {
		return faqStatus;
	}

	public void setFaqStatus(String faqStatus) {
		this.faqStatus = faqStatus;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "FAQ [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", faqDate=" + faqDate
				+ ", faqModify=" + faqModify + ", faqStatus=" + faqStatus + ", userId=" + userId + "]";
	}
	
}
