package report.model.vo;

import java.sql.Date;

public class Report {

	private int report_no;
	private String report_title;
	private String reported_id;
	private String report_file;
	private String report_content;
	private Date report_date;
	private Date report_modify;
	private String t_f;
	private String report_Status;
	private String user_id;
	
	public Report() {
		
	}
	
	public Report(int report_no, String report_title, String reported_id, String report_file, String report_content,
			Date report_date, Date report_modify, String t_f, String report_Status, String user_id) {
		super();
		this.report_no = report_no;
		this.report_title = report_title;
		this.reported_id = reported_id;
		this.report_file = report_file;
		this.report_content = report_content;
		this.report_date = report_date;
		this.report_modify = report_modify;
		this.t_f = t_f;
		this.report_Status = report_Status;
		this.user_id = user_id;
	}

	public Report(String report_title, String reported_id, String report_content, String user_id) {
		super();
		this.report_title = report_title;
		this.reported_id = reported_id;
		this.report_content = report_content;
		this.user_id = user_id;
	}

	public Report(String report_title, String reported_id, String report_file, String report_content, String user_id) {
		super();
		this.report_title = report_title;
		this.reported_id = reported_id;
		this.report_file = report_file;
		this.report_content = report_content;
		this.user_id = user_id;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public String getReport_title() {
		return report_title;
	}

	public void setReport_title(String report_title) {
		this.report_title = report_title;
	}

	public String getReported_id() {
		return reported_id;
	}

	public void setReported_id(String reported_id) {
		this.reported_id = reported_id;
	}

	public String getReport_file() {
		return report_file;
	}

	public void setReport_file(String report_file) {
		this.report_file = report_file;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
	
	
	public Date getReport_modify() {
		return report_modify;
	}

	public void setReport_modify(Date report_modify) {
		this.report_modify = report_modify;
	}

	public String getT_f() {
		return t_f;
	}

	public void setT_f(String t_f) {
		this.t_f = t_f;
	}

	public String getReport_Status() {
		return report_Status;
	}



	public void setReport_Status(String report_Status) {
		this.report_Status = report_Status;
	}



	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	@Override
	public String toString() {
		return "Report [report_no=" + report_no + ", report_title=" + report_title + ", reported_id=" + reported_id
				+ ", report_file=" + report_file + ", report_content=" + report_content + ", report_date=" + report_date
				+ ", t_f=" + t_f + ", report_Status=" + report_Status + ", user_id=" + user_id + "]";
	}

}
