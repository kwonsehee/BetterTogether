package notice.model.dao;

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

import notice.model.vo.Notice;
import static common.JDBCTemplate.*;

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
				
				list.add(new Notice(rset.getInt("NNO"),
									rset.getString("NTITLE"),
									rset.getString("NCONTENT"),
									rset.getString("NWRITER"),
									rset.getInt("NCOUNT"),
									rset.getDate("NDATE"),
									rset.getString("STATUS")));
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
		public int insertNotice(Connection conn, Notice n) {
			int result = 0;
			PreparedStatement pstmt=null;
			
			String sql=prop.getProperty("insertNotice");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, n.getnTitle());
				pstmt.setString(2, n.getnContent());
				pstmt.setString(3, n.getnWriter());
				
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
		public int increaseCount(Connection conn, int nno) {
			int result = 0;
			PreparedStatement pstmt= null;
			String sql = prop.getProperty("increaseCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, nno);
				
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
		public Notice selectNotice(Connection conn, int nno) {
			Notice n=null;
			PreparedStatement pstmt= null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectNotice");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, nno);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					n = new Notice(rset.getInt("nno"),
									rset.getString("nTitle"),
									rset.getString("ncontent"),
									rset.getString("nwriter"),
									rset.getInt("ncount"),
									rset.getDate("ndate"),
									rset.getString("status"));	
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
		public int deleteNotice(Connection conn, int nno) {
			int result = 0;
			PreparedStatement pstmt=null;
			String sql =prop.getProperty("deleteNotice");
			
			try {
				pstmt= conn.prepareStatement(sql);
				pstmt.setInt(1, nno);
				
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
				pstmt.setString(1, n.getnTitle());
				pstmt.setString(2, n.getnContent());
				pstmt.setInt(3, n.getnNo());
				
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
