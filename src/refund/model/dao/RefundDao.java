package refund.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import challenge.model.dao.ChallDao; 
import refund.model.vo.Refund;

import static common.JDBCTemplate.*;
public class RefundDao {
	 private Properties prop = new Properties();
	   
	   public RefundDao() {
	      String fileName = ChallDao.class.getResource("/sql/refund/refund-query.xml").getPath();
	      try {
	         prop.loadFromXML(new FileInputStream(fileName));
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	   }

	   
	public int insertrefund(Connection conn, Refund refund) {
		PreparedStatement pstmt=null;
		int result = 0;
		
		String sql = prop.getProperty("insertrefund");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, refund.getUser_id());
			pstmt.setString(2, refund.getBank_name());
			pstmt.setString(3, refund.getAccount_number());
			pstmt.setInt(4, refund.getMoney());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("dao : "+result);
		return result;
	}


	public int insertcharging(Connection conn, Refund ch) {
		PreparedStatement pstmt=null;
		int result = 0;
		
		String sql = prop.getProperty("insertrefund2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ch.getUser_id()); 
			pstmt.setString(2, ch.getUser_id()); 
			pstmt.setString(3, ch.getUser_id()); 
			pstmt.setInt(4, ch.getMoney());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("dao : "+result);
		return result;
	}

}
