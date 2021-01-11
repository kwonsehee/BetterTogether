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
	
}
