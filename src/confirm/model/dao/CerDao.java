package confirm.model.dao;

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

import common.model.vo.PageInfo;
import confirm.model.vo.Cer;
import notice.model.vo.Notice;

public class CerDao {
private Properties prop = new Properties();
	
	public CerDao() {
		String fileName=Notice.class.getResource("/sql/confirm/cer-query.xml").getPath();
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

	//user_id가 선택한 챌린지를 인증한 것을 cer디비에서 가져오기
	public ArrayList<Cer> selectList(Connection conn, String user_id, int cno, PageInfo pi) {
		ArrayList<Cer>list = new ArrayList<Cer>();
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCerList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setString(1, user_id);
			pstmt.setInt(2, cno);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);

			rset = pstmt.executeQuery();
		
			while(rset.next()) {
				list.add(new Cer(rset.getInt("CER_ID"),
								 rset.getString("CER_PIC"),
								 rset.getString("CHALL_TITLE"),
								 rset.getInt("CHALL_NO"),
								 rset.getString("CHALL_CONFIRM")));
				
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

	//인증디비에 insert
	public int insertCer(Connection conn, Cer c) {
		PreparedStatement pstmt=null;
		int result = 0;
		
		String sql = prop.getProperty("insertCer");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, c.getCer_pic());
			pstmt.setString(2, c.getCer_comment());
			pstmt.setString(3, c.getUser_id());
			pstmt.setInt(4, c.getChall_no());
			
			result = pstmt.executeUpdate();
		
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	//챌린지의 모든 인증은 가져오는 dao
	public ArrayList<Cer> selectAllList(Connection conn, int cno, PageInfo pi) {
		ArrayList<Cer>list = new ArrayList<Cer>();
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllCerList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, cno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();
		
			while(rset.next()) {
				list.add(new Cer(rset.getInt("CER_ID"),
								 rset.getString("CER_PIC"),
								 rset.getString("CHALL_TITLE"),
								 rset.getInt("CHALL_NO"),
								 rset.getString("CHALL_CONFIRM")));
				
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

	//디테일 뷰에 보여줄 인증하나 가져오기
	public Cer selectCer(Connection conn, int ceno) {
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		Cer c=null;
		
		String sql = prop.getProperty("selectCer");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, ceno);
			
			rset = pstmt.executeQuery();
		
			while(rset.next()) {
				c = new Cer(rset.getInt("CER_ID"),
						rset.getString("CER_PIC"),
							rset.getString("CER_COMMENT"),
							rset.getDate("CER_DATE"),
							rset.getString("USER_ID"),
							rset.getString("CHALL_TITLE"),
							rset.getInt("CHALL_NO"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return c;
	}

	//챌린지별 회원별 인증 갯수 카운트
	public int selectMyJoinCount(Connection conn, int cno, String user_id) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getMyListCount");
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			pstmt.setString(2, user_id);

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
		
		System.out.println("챌린지 인증에서 넘어올때 service  " + listCount);
		return listCount;
	}
	
	//챌린지별 회원별 인증 갯수 카운트
	public int selectAllCount(Connection conn, int cno) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getAllListCount");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
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
		

		System.out.println("챌린지모집에서 넘어올때 service  : " + listCount);
		return listCount;
	}

	//신고 게시물 비활성화 시키기
	public int disabledPost(Connection conn, int cer_id) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		
		String sql = prop.getProperty("disabledPost");
		
		try {
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cer_id);
			
			result = pstmt.executeUpdate();

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		

		return result;
	}

	//인증 삭제하기
	public int deleteCer(Connection conn, int no) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		
		String sql = prop.getProperty("deleteCer");
		
		try {
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			
			result = pstmt.executeUpdate();

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		

		return result;

	}

	//회원별 달성률구하기
	public Cer getAchieve(Connection conn, int cno, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Cer c = new Cer();
		String sql = prop.getProperty("getAchieve");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			pstmt.setInt(2, cno);
			
			rset = pstmt.executeQuery();

			if (rset.next()) {
				c = new Cer(rset.getInt(1),
							rset.getDouble("달성률"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		

		return c;
	}
}
