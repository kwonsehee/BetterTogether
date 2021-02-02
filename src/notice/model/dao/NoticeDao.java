package notice.model.dao;

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
import common.model.vo.Search;
import notice.model.vo.Notice;

public class NoticeDao {
	private Properties prop = new Properties();
	
	public NoticeDao() {
		String fileName=Notice.class.getResource("/sql/notice/notice-query.xml").getPath();
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
	
	//1. 공지사항 조회용 dao 메소드
	public ArrayList<Notice> selectList(Connection conn) {
		ArrayList<Notice>list = new ArrayList<>();
		PreparedStatement pstmt=null;
		ResultSet rset =null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Notice(rset.getInt("ARTICLE_NO"),
									rset.getString("ARTICLE_TITLE"),
									rset.getString("ARTICLE_CONTNENT"),
									rset.getDate("ARTICLE_DATE"),
									rset.getDate("ARTICLE_MODIFY"),
									rset.getString("USER_ID"),
									rset.getInt("ARTICLE_CNT"),
									rset.getInt("ARTICLE_TYPE")));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}
	//1_1. 페이징 처리가 된 공지사항 조회용 dao 메소드
	public ArrayList<Notice> selectList(Connection conn, PageInfo pi) {
		ArrayList<Notice>list = new ArrayList<>();
		PreparedStatement pstmt=null;
		ResultSet rset =null;
		
		String sql = prop.getProperty("selectList2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow+pi.getBoardLimit()-1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Notice(rset.getInt("ARTICLE_NO"),
									rset.getString("ARTICLE_TITLE"),
									rset.getString("ARTICLE_CONTNENT"),
									rset.getDate("ARTICLE_DATE"),
									rset.getDate("ARTICLE_MODIFY"),
									rset.getString("NICKNAME"),
									rset.getInt("ARTICLE_CNT"),
									rset.getInt("ARTICLE_TYPE")));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}
	
	//2. 공지사항 글 작성용 dao
	//************파일도 디비에 넣으려 할때 생각해야함!!!***********
		public int insertNotice(Connection conn, Notice n) {
			int result = 0;
			PreparedStatement pstmt=null;
			
			String sql="";
		
			try {
				
				if(n.getaFile()==null) {
					sql=prop.getProperty("insertNotice");
					pstmt = conn.prepareStatement(sql);
				
					pstmt.setString(1, n.getaTitle());
					pstmt.setString(2, n.getaContent());
					pstmt.setString(3, n.getUser_id());
				}else {
					sql=prop.getProperty("insertNotice2");
					pstmt = conn.prepareStatement(sql);
				
					pstmt.setString(1, n.getaTitle());
					pstmt.setString(2, n.getaContent());
					pstmt.setString(3, n.getUser_id());
					pstmt.setString(4, n.getaFile());
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

		//3. 조회수 증가용 메소드
		public int increaseCount(Connection conn, int ano) {
			int result = 0;
			PreparedStatement pstmt= null;
			String sql = prop.getProperty("increaseCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, ano);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				
				close(pstmt);
			}
			return result;
		}

		//4. 공지사항 게시글 1개 상세보기
		public Notice selectNotice(Connection conn, int ano) {
			Notice n=null;
			PreparedStatement pstmt= null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectNotice");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, ano);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					n = new Notice(rset.getInt("ARTICLE_NO"),
							rset.getString("ARTICLE_TITLE"),
							rset.getString("ARTICLE_CONTNENT"),
							rset.getDate("ARTICLE_DATE"),
							rset.getDate("ARTICLE_MODIFY"),
							rset.getString("USER_ID"),
							rset.getInt("ARTICLE_CNT"),
							rset.getInt("ARTICLE_TYPE"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return n;
		}

		//5. 공지사항 삭제 
		public int deleteNotice(Connection conn, int ano) {
			int result = 0;
			PreparedStatement pstmt=null;
			String sql =prop.getProperty("deleteNotice");
			
			try {
				pstmt= conn.prepareStatement(sql);
				pstmt.setInt(1, ano);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
		}
		//6. 공지사항 수정
		public int updateNotice(Connection conn, Notice n) {
			int result = 0;
			PreparedStatement pstmt =null;
			String sql = prop.getProperty("updateNotice");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, n.getaTitle());
				pstmt.setString(2, n.getaContent());
				pstmt.setInt(3, n.getaNo());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			
			return result;
		}

		//공지사항 검색
		public ArrayList<Notice> selectList(Connection conn, String search, String searchCondition) {
			ArrayList<Notice>list =new ArrayList<>();
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = "";
			
			if(searchCondition.equals("title")) {
				sql = prop.getProperty("selectSearchTitleList");
			}else{
				sql = prop.getProperty("selectSearchContentList");
			}
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, search);
				rset = pstmt.executeQuery();
				
				while(rset.next()){
					list.add(new Notice(rset.getInt("ARTICLE_NO"),
							rset.getString("ARTICLE_TITLE"),
							rset.getString("ARTICLE_CONTNENT"),
							rset.getDate("ARTICLE_DATE"),
							rset.getDate("ARTICLE_MODIFY"),
							rset.getString("USER_ID"),
							rset.getInt("ARTICLE_CNT"),
							rset.getInt("ARTICLE_TYPE")));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			
			return list;
		}
		
		//Search 객체 생성후 공지사항 검색
		public ArrayList<Notice> selectList(Connection conn, Search s) {
			ArrayList<Notice> list = new ArrayList<>();

			PreparedStatement pstmt = null;
			ResultSet rset = null;

			String sql = "";

			if (s.getSearchCondition().equals("title")) {
				sql = prop.getProperty("selectSearchTitleList");
			} else {
				sql = prop.getProperty("selectSearchContentList");
			}

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, s.getSearch());
				rset = pstmt.executeQuery();

				while (rset.next()) {
					list.add(new Notice(rset.getInt("ARTICLE_NO"), rset.getString("ARTICLE_TITLE"),
							rset.getString("ARTICLE_CONTNENT"), rset.getDate("ARTICLE_DATE"),
							rset.getDate("ARTICLE_MODIFY"), rset.getString("USER_ID"), rset.getInt("ARTICLE_CNT"),
							rset.getInt("ARTICLE_TYPE")));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}

			return list;
		}

		// 페이징 처리를 위한 게시글 총 개수 조회
		public int getListCount(Connection conn) {
			int listCount = 0;
			Statement stmt = null;
			ResultSet rset =null;
			
			
			String sql = prop.getProperty("getListCount");
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(sql);
				
				if(rset.next()) {
					listCount = rset.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(stmt);
			}
			
			
			return listCount;
		}
//-----------검색부분-------------
		//페이징 처리를 위한 검색 리스트 카운트
		public int getSearchListCount(Connection conn, Search s) {
			int listCount = 0;
			PreparedStatement pstmt=null;
			ResultSet rset = null;
			
			String sql = "";
			
			if(s.getSearchCondition().equals("writer")) {
				sql = prop.getProperty("getSearchWriterListCount");
			}else if(s.getSearchCondition().equals("title")) {
				sql = prop.getProperty("getSearchTitleListCount");
			}else {
				sql = prop.getProperty("getSearchContentListCount");
			}

			try {
				pstmt =conn.prepareStatement(sql);
				pstmt.setString(1, s.getSearch());
				rset=pstmt.executeQuery();
				if(rset.next()) {
					listCount = rset.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return listCount;
		}
		//페이징 처리를 위한 검색용 리스트 조회
		public ArrayList<Notice> selectSearchList(Connection conn, PageInfo pi, Search s) {
			ArrayList<Notice>list = new ArrayList<>();
			PreparedStatement pstmt= null;
			ResultSet rset = null;
			String sql = "";
			
			if(s.getSearchCondition().equals("writer")) {
				sql = prop.getProperty("selectSearchWriterList2");
			}else if(s.getSearchCondition().equals("title")) {
				sql = prop.getProperty("selectSearchTitleList2");
			}else{
				sql = prop.getProperty("selectSearchContentList2");
			}
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
				int endRow = startRow +pi.getBoardLimit()-1;
				
				pstmt.setString(1,s.getSearch());
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				
				rset = pstmt.executeQuery();
				
				while (rset.next()) {
					list.add(new Notice(rset.getInt("ARTICLE_NO"), rset.getString("ARTICLE_TITLE"),
							rset.getString("ARTICLE_CONTNENT"), rset.getDate("ARTICLE_DATE"),
							rset.getDate("ARTICLE_MODIFY"), rset.getString("USER_ID"), rset.getInt("ARTICLE_CNT"),
							rset.getInt("ARTICLE_TYPE")));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}

			return list;
		}

		public int totalCount(Connection conn) {
			int totalCount = 0;
			Statement stmt = null;
			ResultSet rset =null;
			
			String sql = prop.getProperty("totalCount");
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(sql);
				
				if(rset.next()) {
					totalCount = rset.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(stmt);
			}
			
			
			return totalCount;
		}

}
