package qna.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import common.model.vo.PageInfo;
import common.model.vo.Search;
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

	// 질문하기
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

		// 질문 상세보기
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
								rset.getString("USER_ID"),
								rset.getString("QNA_STATUS"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}

			return q;
		}

		// 질문 갯수 
		public int getListCount(Connection conn) {
			int listCount = 0;
			Statement stmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("getListCount");
			
			try {
				stmt = conn.createStatement();
				
				rset = stmt.executeQuery(sql);
				
				if(rset.next()) {
					listCount = rset.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			
			return listCount;
		}

		// 페이징 처리된 질문 목록 조회
		public ArrayList<QnA> selectList(Connection conn, PageInfo pi) {
			ArrayList<QnA> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;
				
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new QnA(rset.getInt(2),
							         rset.getString(3),
							         rset.getString(4),
							         rset.getDate(5),
							         rset.getDate(6),
							         rset.getInt(7),
							         rset.getString(8),
							         rset.getString(9),
							         rset.getString(10)));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
		}

	public int insertFAQ(Connection conn, QnA f) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, f.getQnaTitle());
			pstmt.setString(2, f.getQnaContent());
			pstmt.setString(3, f.getUserId());
			
			result = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertAnswer(Connection conn, QnA q) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, q.getQnaTitle());
			pstmt.setString(2, q.getQnaContent());
			pstmt.setInt(3, q.getqReference());
			pstmt.setString(4, q.getUserId());
			
			result = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteQuestion(Connection conn, int qnaNo) {
		int result = 0;
		PreparedStatement pstmt=null;
		String sql =prop.getProperty("deleteQuestion");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, qnaNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateQuestion(Connection conn, QnA q) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getQnaTitle());
			pstmt.setString(2, q.getQnaContent());
			pstmt.setInt(3, q.getQnaNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public QnA selectAns(Connection conn, int qnaNo) {
		QnA a = null;
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAns");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qnaNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				a = new QnA(rset.getInt("QNA_NO"),
						rset.getString("QNA_TITLE"),
						rset.getString("QNA_CONTENT"),
						rset.getDate("QNA_DATE"),
						rset.getDate("QNA_MODIFY"),
						rset.getInt("Q_REFERENCE"),
						rset.getString("QNA_TYPE"),
						rset.getString("QNA_STATUS"),
						rset.getString("USER_ID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return a;

	}
	
	public ArrayList<QnA> selectFAQ(Connection conn, PageInfo pi) {
		ArrayList<QnA> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new QnA(rset.getInt(2),
						         rset.getString(3),
						         rset.getString(4),
						         rset.getDate(5),
						         rset.getDate(6),
						         rset.getInt(7),
						         rset.getString(8),
						         rset.getString(9),
						         rset.getString(10)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public QnA selectAnswer(Connection conn, int qnaNo) {
		QnA a = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qnaNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				a = new QnA(rset.getInt("QNA_NO"),
							rset.getString("QNA_TITLE"),
							rset.getString("QNA_CONTENT"),
							rset.getDate("QNA_DATE"),
							rset.getDate("QNA_MODIFY"),
							rset.getInt("Q_REFERENCE"),
							rset.getString("QNA_TYPE"),
							rset.getString("USER_ID"),
							rset.getString("QNA_STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return a;
	}

	public int updateAnswer(Connection conn, QnA a) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a.getQnaTitle());
			pstmt.setString(2, a.getQnaContent());
			pstmt.setInt(3, a.getQnaNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateFAQ(Connection conn, QnA f) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getQnaTitle());
			pstmt.setString(2, f.getQnaContent());
			pstmt.setInt(3, f.getQnaNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public QnA selectFAQ2(Connection conn, int qnaNo) {
		QnA f = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFAQ2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qnaNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				f = new QnA(rset.getInt("QNA_NO"),
							rset.getString("QNA_TITLE"),
							rset.getString("QNA_CONTENT"),
							rset.getDate("QNA_DATE"),
							rset.getDate("QNA_MODIFY"),
							rset.getInt("Q_REFERENCE"),
							rset.getString("QNA_TYPE"),
							rset.getString("USER_ID"),
							rset.getString("QNA_STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return f;
	}

	public int getSearchListCount(Connection conn, Search s) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getSearchQuestionListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, s.getSearch());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<QnA> selectSearchList(Connection conn, PageInfo pi, Search s) {
		ArrayList<QnA> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQuestionSearchList");

		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, s.getSearch());
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new QnA(rset.getInt(2),
						         rset.getString(3),
						         rset.getString(4),
						         rset.getDate(5),
						         rset.getDate(6),
						         rset.getInt(7),
						         rset.getString(8),
						         rset.getString(9),
						         rset.getString(10)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int deleteFAQ(Connection conn, int qnaNo) {
		int result = 0;
		PreparedStatement pstmt=null;
		String sql =prop.getProperty("deleteFAQ");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, qnaNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int totalCount(Connection conn) {
		int totalCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("totalCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				totalCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return totalCount;
	}
}
