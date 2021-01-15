package studycafe.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import static common.JDBCTemplate.close;

import studycafe.model.vo.Cafe;

public class CafeDao {
	private Properties prop = new Properties();
	
	public CafeDao() {
		String fileName = CafeDao.class.getResource("/sql/cafe/cafe-query.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName)); 
		} catch (IOException e) { 
			e.printStackTrace();
		}
		
	}
	
	//카페새로 등록 사용
	public int insertCafe(Connection conn, Cafe n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCafe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, n.getCafe_name());
			pstmt.setString(2, n.getCafe_oh());
			pstmt.setString(3, n.getCafe_area());
			pstmt.setString(4, n.getCafe_phone());
			pstmt.setString(5, n.getClosed_day());
			pstmt.setInt(6, n.getCafe_capacity());
			pstmt.setString(7, n.getCafe_page()); 
			pstmt.setString(8, n.getDetail_address());
			pstmt.setString(9, n.getCafe_notice());
			pstmt.setString(10, n.getCafe_info());
			pstmt.setString(11, n.getCafe_photo());  
			pstmt.setString(12, n.getCafe_map());
			pstmt.setString(13, n.getUserId());
		
			
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
		
		
		
		
		
	}
}
