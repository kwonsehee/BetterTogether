package confirm.model.dao;

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

import confirm.model.vo.Confirm;
import notice.model.vo.Notice;

import static common.JDBCTemplate.*;

public class ConfirmDao {
	private Properties prop = new Properties();
	
	public ConfirmDao() {
		String fileName=Notice.class.getResource("/sql/confirm/confirm-query.xml").getPath();
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
	
	//로그인된 회원의 참여중인 챌린지 정보 가져오기
	public ArrayList<Confirm> selectList(Connection conn, String userid) {
		ArrayList<Confirm>list = new ArrayList<Confirm>();
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		
		
		//찜하기한 챌린지를 제외하고 다 가져오기
		String sql = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rset = pstmt.executeQuery();
		
			while(rset.next()) {
				list.add(new Confirm(rset.getString("USER_ID"),
									 rset.getInt("CHALL_NO"),
									 rset.getInt("CHALL_STATUS"),
									 rset.getDate("JOIN_CALL_DATE"),
									 rset.getString("CHALL_TITLE"),
									 rset.getString("FILE_PATH"),
									 rset.getString("CHALL_START")));
				
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

}
