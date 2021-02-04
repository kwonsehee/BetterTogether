package news.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import myPage.model.dao.myPageDao;
import news.model.vo.News;

public class NewsDao {
	private Properties prop = new Properties();
	
	public NewsDao() {
		String fileName = myPageDao.class.getResource("/sql/news/news-query.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//챌린지 삭제또는 신고로 챌린지가 없어졌을때 로그인시 회원들에게 알려줄려고
	public int insertChall(Connection conn, int challNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertChall");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, challNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	//신고처리시 신고당하는 유저가 로그인시 신고당한 사실을 알려주기 위해 
	public int insertReport(Connection conn, int rNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rNo);
			pstmt.setInt(2, rNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	//알림디비에서 새로 알려줄 알림이 있는지 확인
	public ArrayList<News> getNews(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<News>news = new ArrayList<News>();
		String sql = prop.getProperty("getNews");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				news.add(new News(rset.getInt("NEWS_NO"),
								  rset.getInt("NEWS_CATE"),
								  rset.getInt("POST_NO"),
								  rset.getString("NEWS_TITLE")));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return news;
	}

	//알림디비에서 새로 알려줄 알림을 셀렉한 뒤 N으로 변경 
	public int updateNews(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateNews");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	//질문을 한 유저가 로그인시 확인가능하도록 news디비에 정보 넣기
	public int insertQnAnswer(Connection conn, int referenceNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertQnAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, referenceNo);
			pstmt.setInt(2, referenceNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
