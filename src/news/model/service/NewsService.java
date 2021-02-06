package news.model.service;

import static common.JDBCTemplate.*;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import news.model.dao.NewsDao;
import news.model.vo.News;

public class NewsService {

	//챌린지 삭제또는 신고로 챌린지가 없어졌을때 로그인시 회원들에게 알려줄려고
	public int insertChall(int challNo) {
		Connection conn = getConnection();
		int result = new NewsDao().insertChall(conn, challNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	//신고처리시 신고당하는 유저가 로그인시 신고당한 사실을 알려주기 위해 -이전
	//신고처리시 신고한 유저에게 신고처리했다고 알려주기 위해
	public int insertReport(int rNo) {
		Connection conn = getConnection();
		int result = new NewsDao().insertReport(conn,rNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	//알림디비에서 새로 알려줄 알림이 있는지 확인
	public ArrayList<News> getNews(String userId) {
		Connection conn = getConnection();
		ArrayList<News> news = new NewsDao().getNews(conn,userId);
	
		
		close(conn);
		return news;
	}

	//알림디비에서 새로 알려줄 값 보여주고 난뒤 상태값을 n으로 변경
	public int updateNews(String userId) {
		Connection conn = getConnection();
		
		int result = new NewsDao().updateNews(conn,userId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	//질문을 한 유저가 로그인시 확인가능하도록 news디비에 정보 넣기
	public int insertQnAnswer(int referenceNo) {
		Connection conn = getConnection();
		
		int result = new NewsDao().insertQnAnswer(conn,referenceNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
