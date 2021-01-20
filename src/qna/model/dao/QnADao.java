package qna.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import qna.model.vo.QnA;

public class QnADao {
	private Properties prop = new Properties();
	
	public QnADao() {
		String fileName = QnADao.class.getResource("/sql/qna/qna-query.xml").getPath();
			try {
				prop.loadFromXML(new FileInputStream(fileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
	}

	public ArrayList<QnA> selectList(Connection conn) {
		ArrayList<QnA> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList"); 
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new QnA(rset.getInt("QNA_NO"),
						     	 rset.getString("QNA_TITLE"),
								 rset.getString("QNA_CONTENT"),
								 rset.getDate("QNA_DATE"),
								 rset.getDate("QNA_MODIFY"),
								 rset.getInt("Q_REFERENCE"),
								 rset.getString("QNA_TYPE"),
								 rset.getString("USER_ID")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertQuestion(Connection conn, QnA q) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, q.getQnaTitle());
			pstmt.setString(2, q.getQnaContent());
			pstmt.setString(3, q.getUserId());
			
			result = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public QnA selectQuestion(Connection conn, int qnaNo) {
		QnA q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qnaNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new QnA(rset.getInt("QNA_NO"),
							rset.getString("QNA_TITLE"),
							rset.getString("QNA_CONTENT"),
							rset.getDate("QNA_DATE"),
							rset.getDate("QNA_MODIFY"),
							rset.getInt("Q_REFERENCE"),
							rset.getString("QNA_TYPE"),
							rset.getString("USER_ID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return q;
	}

	

}
