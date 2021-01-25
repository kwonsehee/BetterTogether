package report.model.vo;

import java.sql.Date;

public class Report {
	/*
	REPORT_NO
	REPORT_TITLE
	REPORTED_ID
	REPORT_FILE
	REPORT_CONTENT
	REPORT_DATE
	REPORT_MODIFY
	T_F
	USER_ID
	*/
	
	private int reportNo;
	private String reportTitle;
	private String reportedId;
	private String reportFile;
	private String reportContent;
	private Date reportDate;
	private Date reportModify;
	private String T_F;
	private String reportStatus;
	private String userId;
	
	public Report() {}

	public Report(int reportNo, String reportTitle, String reportedId, String reportFile, String reportContent,
			Date reportDate, Date reportModify, String t_F, String reportStatus,String userId) {
		super();
		this.reportNo = reportNo;
		this.reportTitle = reportTitle;
		this.reportedId = reportedId;
		this.reportFile = reportFile;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportModify = reportModify;
		this.T_F = t_F;
		this.reportStatus = reportStatus;
		this.userId = userId;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getReportTitle() {
		return reportTitle;
	}

	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}

	public String getReportedId() {
		return reportedId;
	}

	public void setReportedId(String reportedId) {
		this.reportedId = reportedId;
	}

	public String getReportFile() {
		return reportFile;
	}

	public void setReportFile(String reportFile) {
		this.reportFile = reportFile;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public Date getReportModify() {
		return reportModify;
	}

	public void setReportModify(Date reportModify) {
		this.reportModify = reportModify;
	}

	public String getT_F() {
		return T_F;
	}

	public void setT_F(String t_F) {
		T_F = t_F;
	}

	public String getUserId() {
		return userId;
	}
	
	

	public String getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportTitle=" + reportTitle + ", reportedId=" + reportedId
				+ ", reportFile=" + reportFile + ", reportContent=" + reportContent + ", reportDate=" + reportDate
				+ ", reportModify=" + reportModify + ", T_F=" + T_F + ", reportStatus=" + reportStatus + ", userId="
				+ userId + "]";
	}

}
