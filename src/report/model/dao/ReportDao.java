package report.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import common.model.vo.PageInfo;
import notice.model.vo.Notice;
import report.model.vo.Report;

public class ReportDao {
	private Properties prop = new Properties();
	
	public ReportDao() {
		String fileName=Notice.class.getResource("/sql/report/report-query.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (InvalidPropertiesFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//신고 디비에 값 넣기
	public int insertConfirmReport(Connection conn, Report r, int no) {
		int result = 0;
		PreparedStatement pstmt=null;
		
		String sql="";
		
		try {
			
			if(r.getReport_file()==null) {
				sql=prop.getProperty("insertConfirmReport");
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, r.getReport_title());
				pstmt.setString(2, r.getReported_id());
				pstmt.setString(3, r.getReport_content());
				pstmt.setString(4, r.getUser_id());
				pstmt.setInt(5, no);
				
			}else {
				sql=prop.getProperty("insertConfirmReport2");
				pstmt = conn.prepareStatement(sql);
			
				pstmt.setString(1, r.getReport_title());
				pstmt.setString(2, r.getReported_id());
				pstmt.setString(3, r.getReport_file());
				pstmt.setString(4, r.getReport_content());
				pstmt.setString(5, r.getUser_id());
				pstmt.setInt(6, no);
			
			}
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}
		return result;
	}

	public int insertChallReport(Connection conn, Report r, int no) {
		int result = 0;
		PreparedStatement pstmt=null;
		
		String sql="";
		System.out.println("신고 insert 챌린지 : "+r.getReported_id());
		try {
			
			if(r.getReport_file()==null) {
				sql=prop.getProperty("insertChallReport");
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, r.getReport_title());
				pstmt.setString(2, r.getReported_id());
				pstmt.setString(3, r.getReport_content());
				pstmt.setString(4, r.getUser_id());
				pstmt.setInt(5, no);
				
			}else {
				sql=prop.getProperty("insertChallReport2");
				pstmt = conn.prepareStatement(sql);
			
				pstmt.setString(1, r.getReport_title());
				pstmt.setString(2, r.getReported_id());
				pstmt.setString(3, r.getReport_file());
				pstmt.setString(4, r.getReport_content());
				pstmt.setString(5, r.getUser_id());
				pstmt.setInt(6, no);
			
			}
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}
		return result;
	}
	
	public int insertBoardReport(Connection conn, Report r, int no) {
		int result = 0;
		PreparedStatement pstmt=null;
		
		String sql="";
		
		try {
			
			if(r.getReport_file()==null) {
				sql=prop.getProperty("insertBoardReport");
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, r.getReport_title());
				pstmt.setString(2, r.getReported_id());
				pstmt.setString(3, r.getReport_content());
				pstmt.setString(4, r.getUser_id());
				pstmt.setInt(5, no);
				
			}else {
				sql=prop.getProperty("insertBoardReport2");
				pstmt = conn.prepareStatement(sql);
			
				pstmt.setString(1, r.getReport_title());
				pstmt.setString(2, r.getReported_id());
				pstmt.setString(3, r.getReport_file());
				pstmt.setString(4, r.getReport_content());
				pstmt.setString(5, r.getUser_id());
				pstmt.setInt(6, no);
			
			}
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}
		return result;
	}
	
	public int insertCafeReport(Connection conn, Report r, int no) {
		int result = 0;
		PreparedStatement pstmt=null;
		
		String sql="";
		
		try {
			
			if(r.getReport_file()==null) {
				sql=prop.getProperty("insertCafeReport");
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, r.getReport_title());
				pstmt.setString(2, r.getReported_id());
				pstmt.setString(3, r.getReport_content());
				pstmt.setString(4, r.getUser_id());
				pstmt.setInt(5, no);
				
			}else {
				sql=prop.getProperty("insertCafeReport2");
				pstmt = conn.prepareStatement(sql);
			
				pstmt.setString(1, r.getReport_title());
				pstmt.setString(2, r.getReported_id());
				pstmt.setString(3, r.getReport_file());
				pstmt.setString(4, r.getReport_content());
				pstmt.setString(5, r.getUser_id());
				pstmt.setInt(6, no);
			
			}
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}
		return result;
	}
	
	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();

			rset = stmt.executeQuery(sql);

			if (rset.next()) {
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

	public ArrayList<Report> selectList(Connection conn, PageInfo pi) {
		ArrayList<Report> list = new ArrayList<>();
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
				list.add(new Report(rset.getInt(2),
						         rset.getString(3),
						         rset.getString(4),
						         rset.getString(5),
						         rset.getString(6),
						         rset.getDate(7),
						         rset.getDate(8),
						         rset.getString(9),
						         rset.getString(10),
						         rset.getString(11)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		 System.out.println("list : " + list);
			
		return list;
	}

	public Report selectReport(Connection conn, int rNo) {
		Report r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Report(rset.getInt("REPORT_NO"),
						rset.getString("REPORT_TITLE"),
						rset.getString("REPORTED_ID"),
						rset.getString("REPORT_FILE"),
						rset.getString("REPORT_CONTENT"),
						rset.getDate("REPORT_DATE"),
						rset.getDate("REPORT_MODIFY"),
						rset.getString("T_F"),
						rset.getString("REPORT_STATUS"),
						rset.getString("USER_ID"));
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return r;
	}

	public int getMyListCount(Connection conn, String userId) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getMyListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
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

	public ArrayList<Report> selectMyList(Connection conn, String userId, PageInfo pi) {
		ArrayList<Report> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Report(rset.getInt(2),
						         rset.getString(3),
						         rset.getString(4),
						         rset.getString(5),
						         rset.getString(6),
						         rset.getDate(7),
						         rset.getDate(8),
						         rset.getString(9),
						         rset.getString(10),
						         rset.getString(11)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		 System.out.println("list : " + list);
			
		return list;
	}
	
	//신고내역 삭제

	public int deleteReport(Connection conn, int rNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
	
			close(pstmt);
		}

		return result;
	}

	//신고처리
	public int processReport(Connection conn, int rNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("processReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
	
			close(pstmt);
		}

		return result;
	}

	//신고된 게시글 가져오기
	public Report disabledGetPost(Connection conn, int rNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Report r = null;
		
		String sql = prop.getProperty("disabledGetPost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				r = new Report(rset.getInt(1),
							   rset.getInt(2),
							   rset.getInt(3),
							   rset.getInt(4));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
	
			close(pstmt);
		}
		System.out.println("신고된 게시글 가져오니 ?"+r);
		
		return r;
	}

	//내가 신고당한 내역
	public ArrayList<Report> selectreportedMyList(Connection conn, String userId, PageInfo pi) {
		ArrayList<Report> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectreportedMyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Report(rset.getInt(2),
						         rset.getString(3),
						         rset.getString(4),
						         rset.getString(5),
						         rset.getString(6),
						         rset.getDate(7),
						         rset.getDate(8),
						         rset.getString(9),
						         rset.getString(10),
						         rset.getString(11)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		 System.out.println("신고당한 list : " + list);
			
		return list;
	}

	//내가 신고당한 갯수 카운트
	public int getreportedMyListCount(Connection conn, String userId) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getreportedMyListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
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
}
