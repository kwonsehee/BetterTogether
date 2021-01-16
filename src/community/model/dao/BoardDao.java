package community.model.dao;

import java.sql.Connection;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import common.model.vo.PageInfo;
import community.model.vo.Board;
import community.model.vo.Search;

import static common.JDBCTemplate.close;

public class BoardDao {
	private Properties prop = new Properties();
	
	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/community/board-query.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	// 게시글 총 개수 조회
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

	// 게시물 조회
	public ArrayList<Board> selectList(Connection conn, PageInfo pi) {
		ArrayList<Board> list = new ArrayList<>();
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
				list.add(new Board(rset.getInt(2),
								   rset.getString(3),
								   rset.getString(4),
								   rset.getDate(5),
								   rset.getDate(6),
								   rset.getInt(7),
								   rset.getString(8),
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
		
		
		return list;
	}

	// 검색 리스트 카운트
	public int getSearchListCount(Connection conn, Search s) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		
		if(s.getSearchCondition().equals("writer")) {
			sql = prop.getProperty("getSearchWriterListCount");
		} else if(s.getSearchCondition().equals("title")) {
			sql = prop.getProperty("getSearchTitleListCount");
		} else {
			sql = prop.getProperty("getSearchContentListCount");
		}
		
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

	// 검색 리스트 조회
	public ArrayList<Board> selectSearchList(Connection conn, PageInfo pi, Search s) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		
		if(s.getSearchCondition().equals("writer")) {
			sql = prop.getProperty("selectSearchWriterList");
		} else if(s.getSearchCondition().equals("title")) {
			sql = prop.getProperty("selectSearchTitleList");
		} else {
			sql = prop.getProperty("selectSearchContentList");
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, s.getSearch());
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt(2),
								   rset.getString(3),
								   rset.getString(4),
								   rset.getDate(5),
								   rset.getDate(6),
								   rset.getInt(7),
								   rset.getString(8),
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
		return list;
		
	}

}
