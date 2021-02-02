package news.model.vo;

import java.sql.Date;

public class News {
	private int news_no;
	private String user_id;
	private int news_cate;
	private int post_no;
	private String news_status;
	private Date news_date;
	
	public News() {}

	public News(int news_no, int news_cate, int post_no) {
		super();
		this.news_no = news_no;
		this.news_cate = news_cate;
		this.post_no = post_no;
	}

	public int getNews_no() {
		return news_no;
	}

	public void setNews_no(int news_no) {
		this.news_no = news_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getNews_cate() {
		return news_cate;
	}

	public void setNews_cate(int news_cate) {
		this.news_cate = news_cate;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public String getNews_status() {
		return news_status;
	}

	public void setNews_status(String news_status) {
		this.news_status = news_status;
	}

	public Date getNews_date() {
		return news_date;
	}

	public void setNews_date(Date news_date) {
		this.news_date = news_date;
	}

	@Override
	public String toString() {
		return "News [news_no=" + news_no + ", user_id=" + user_id + ", news_cate=" + news_cate + ", post_no=" + post_no
				+ ", news_status=" + news_status + ", news_date=" + news_date + "]";
	}
	
}
