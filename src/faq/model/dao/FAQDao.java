package faq.model.dao;

import java.io.FileInputStream;
import static common.JDBCTemplate.close;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import faq.model.vo.FAQ;
import qna.model.dao.QnADao;
import qna.model.vo.QnA;

public class FAQDao {
private Properties prop = new Properties();
	
	public FAQDao() {
		String fileName = QnADao.class.getResource("/sql/faq/faq-query.xml").getPath();
			try {
				prop.loadFromXML(new FileInputStream(fileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
	}

	public ArrayList<FAQ> selectFAQ(Connection conn) {
		ArrayList<FAQ> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFAQ");
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new FAQ(rset.getInt("FAQ_NO"),
				         rset.getString("FAQ_TITLE"),
				         rset.getString("FAQ_CONTENT"),
				         rset.getDate("FAQ_DATE"),
				         rset.getDate("FAQ_MODIFY"),
				         rset.getString("FAQ_STATUS"),
				         rset.getString("USER_ID")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public int insertFAQ(Connection conn, FAQ f) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, f.getFaqTitle());
			pstmt.setString(2, f.getFaqContent());
			pstmt.setString(3, f.getUserId());
			
			result = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
