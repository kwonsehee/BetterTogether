package studycafe.model.dao;

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
	

	public int insertCafe(Connection conn, Cafe n ) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCafe");
		
		try {
			 
				 
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, n.getCafe_oh());
			pstmt.setString(2, n.getCafe_name());
			pstmt.setString(3, n.getCafe_area());
			pstmt.setString(4, n.getCafe_phone());
			pstmt.setString(5,  n.getCafe_capacity());
			pstmt.setString(6, n.getCafe_notice());
			pstmt.setString(7, n.getCafe_info());
			pstmt.setString(8, n.getCafe_photo()); 
			pstmt.setString(9, n.getAFFILIATED_CAFE());
			pstmt.setString(10, n.getCafe_map());
			pstmt.setString(11, n.getDetail_address());
			pstmt.setString(12, n.getClosed_day()); 
			pstmt.setString(13, n.getCafe_page());   
			pstmt.setString(14, n.getUserId());
		
			
			
			
			result = pstmt.executeUpdate();
		 
			
		} catch (SQLException e) {
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

	
	 
	 

	public ArrayList<Cafe> selectList(Connection conn,  PageInfo pi) { 
		ArrayList<Cafe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		
	 
		
		return list;
	}

	public ArrayList<Cafe> selectList2(Connection conn, PageInfo pi) {
		ArrayList<Cafe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList2");
		
		 try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow=(pi.getCurrentPage()-1)*pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Cafe(rset.getInt(2),
								rset.getString(3),
								rset.getString(4),
								rset.getString(5),
								rset.getString(6),
								rset.getString(7),
								rset.getString(8),
								rset.getString(9),
								rset.getString(10),  
								rset.getString(11),
								rset.getString(12),
								rset.getString(13), 
								rset.getString(14),
								rset.getString(15), 
								rset.getString(16)));
			}
			 
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	

	public int getSearchListCount(Connection conn, Search s) { 
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql =""; 
		 
		if(s.getSearchCondition().equals("area")) {
			sql = prop.getProperty("getSearchcafe_areaListCount");
		}else if(s.getSearchCondition().equals("title")) {
			sql = prop.getProperty("getSearchcafe_nameListCount");
		}
		
		
		
		
		try {
			pstmt = conn.prepareStatement(sql); 
			
			
			pstmt.setString(1,  s.getSearch());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally {
			
			close(rset);
			close(pstmt);
		}
		
		
		return listCount;
	}

	public ArrayList<Cafe> selectSearchList(Connection conn, PageInfo pi, Search s) {
		ArrayList<Cafe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql="";
		
	 
		
		return list;
	}

	public ArrayList<Cafe> selectSearchList2(Connection conn, PageInfo pi, Search s) {
		ArrayList<Cafe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql="";
		
		if(s.getSearchCondition().equals("area")) {
			sql = prop.getProperty("selectSearchcafe_areaList2");
		}else if(s.getSearchCondition().equals("title")) {
			sql = prop.getProperty("selectSearchcafe_nameList2");
		}
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) *pi.getBoardLimit()+1;
			int endRow = startRow+pi.getBoardLimit() -1;
			
			pstmt.setString(1, s.getSearch());
			pstmt.setInt(2,  startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				list.add(new Cafe(rset.getInt(2),
								rset.getString(3),
								rset.getString(4),
								rset.getString(5),
								rset.getString(6),
								rset.getString(7),
								rset.getString(8),
								rset.getString(9),
								rset.getString(10),  
								rset.getString(11),
								rset.getString(12),
								rset.getString(13),
								rset.getString(14),
								rset.getString(15),
								rset.getString(16)));
			}
			
			
			
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public Cafe selectStudyCafe(Connection conn, int cafe_code) {
		Cafe c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStudyCafe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cafe_code);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Cafe(rset.getInt("cafe_code"),
						rset.getString("cafe_oh"),
						rset.getString("cafe_name"),
						rset.getString("cafe_area"),
						rset.getString("cafe_phone"),
						rset.getString("cafe_capacity"),
						rset.getString("cafe_notice"),
						rset.getString("cafe_info"),
						rset.getString("cafe_photo"),
						rset.getString("AFFILIATED_CAFE"),
						rset.getString("cafe_map"),
						rset.getString("detail_address"),
						rset.getString("closed_days"),
						rset.getString("cafe_page"), 
						rset.getString("USER_ID"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return c;
	}
	//카페삭제
	public int deleteCafe(Connection conn, int cafe_code) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteCafe");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cafe_code);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}


	public int updateCafe(Connection conn, Cafe cafe) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateCafe");

		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, cafe.getCafe_oh());
			pstmt.setString(2, cafe.getCafe_name());
			pstmt.setString(3, cafe.getCafe_area());
			pstmt.setString(4, cafe.getCafe_phone());
			pstmt.setString(5,  cafe.getCafe_capacity());
			pstmt.setString(6, cafe.getCafe_notice());
			pstmt.setString(7, cafe.getCafe_info());
			pstmt.setString(8, cafe.getCafe_photo());  
			pstmt.setString(9, cafe.getCafe_map());
			pstmt.setString(10, cafe.getDetail_address());
			pstmt.setString(11, cafe.getClosed_day()); 
			pstmt.setString(12, cafe.getCafe_page());   
			pstmt.setInt(13, cafe.getCafe_code());
			
			
			 
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}


	 
	  
	
}
