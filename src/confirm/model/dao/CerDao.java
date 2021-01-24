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

import confirm.model.vo.Cer;
import confirm.model.vo.Confirm;
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
	public ArrayList<Cer> selectList(Connection conn, String user_id, int cno) {
		ArrayList<Cer>list = new ArrayList<Cer>();
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCerList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, cno);
			
			rset = pstmt.executeQuery();
		
			while(rset.next()) {
				list.add(new Cer(rset.getInt("CER_ID"),
								 rset.getString("CER_PIC"),
								 rset.getString("CHALL_TITLE")));
				
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
	public ArrayList<Cer> selectAllList(Connection conn, int cno) {
		ArrayList<Cer>list = new ArrayList<Cer>();
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllCerList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
		
			while(rset.next()) {
				list.add(new Cer(rset.getInt("CER_ID"),
								 rset.getString("CER_PIC"),
								 rset.getString("CHALL_TITLE")));
				
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
							rset.getString("CHALL_TITLE"));
				
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
}
