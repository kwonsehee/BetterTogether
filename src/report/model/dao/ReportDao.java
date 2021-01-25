package report.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

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
}
