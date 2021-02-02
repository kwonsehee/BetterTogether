package qna.model.vo;

import java.sql.Date;

public class QnA {
	/*
	QNA_NO
	QNA_TITLE
	QNA_CONTENT
	QNA_DATE
	QNA_MODIFY
	FAQ
	Q_REFERENCE
	QNA_TYPE
	USER_ID
	*/
	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private Date qnaModify;
	private String faq;
	private	int qReference;
	private String qnaType;
	private String userId;
	private String qnaStatus;
	
	public QnA() {}

	public QnA(int qnaNo, String qnaTitle, String qnaContent, Date qnaDate, Date qnaModify, String faq, int qReference
			, String userId, String qnaType) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaDate = qnaDate;
		this.qnaModify = qnaModify;
		this.faq = faq;
		this.qReference = qReference;
		this.userId = userId;
		this.qnaType = qnaType;
	}
	
	

	public QnA(int qnaNo, String qnaTitle, String qnaContent, Date qnaDate, Date qnaModify, int qReference,
			String qnaType,String userId, String qnaStatus) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaDate = qnaDate;
		this.qnaModify = qnaModify;
		this.qReference = qReference;
		this.qnaType = qnaType;
		this.userId = userId;
		this.qnaStatus = qnaStatus;
	}

	public QnA(String qnaTitle, String qnaContent, String userId) {
		super();
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.userId = userId;
	}
	

	public QnA(String qnaTitle, String qnaContent, int qReference, String userId) {
		super();
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qReference = qReference;
		this.userId = userId;
	}


	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}

	public Date getQnaModify() {
		return qnaModify;
	}

	public void setQnaModify(Date qnaModify) {
		this.qnaModify = qnaModify;
	}

	public String getFaq() {
		return faq;
	}

	public void setFaq(String faq) {
		this.faq = faq;
	}

	public int getqReference() {
		return qReference;
	}

	public void setqReference(int qReference) {
		this.qReference = qReference;
	}

	public String getQnaType() {
		return qnaType;
	}

	public void setQnaType(String qnaType) {
		this.qnaType = qnaType;
	}

	public String getQnaStatus() {
		return qnaStatus;
	}
	
	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "QnA [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", qnaDate=" + qnaDate
				+ ", qnaModify=" + qnaModify + ", faq=" + faq + ", qReference=" + qReference + ", qnaType=" + qnaType
				+ ", userId=" + userId + ", qnaStatus=" + qnaStatus + "]";
	}

}
