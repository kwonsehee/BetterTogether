package member.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import member.model.vo.Member;

import static common.JDBCTemplate.close;

public class MemberDao {
	private Properties prop = new Properties();

	public MemberDao() {
		// MemberDao 객체 생성시마다 member-query.xml 파일에서 쿼리들을 읽어오는 코드
		String fileName = MemberDao.class.getResource("/sql/member/member-query.xml").getPath();

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

	public Member loginMember(Connection conn, Member m) {
		Member loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("loginMember");

		// 1. 미리sql문 전달 세팅을 미리하는 거
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());

			rset = pstmt.executeQuery();

			if (rset.next()) {
				loginUser = new Member(rset.getString("USER_ID"),
						rset.getString("USER_PWD"), rset.getString("NICKNAME"),
						rset.getString("PHONE"), rset.getString("EMAIL"),
						rset.getDate("JOIN_DATE"),rset.getDate("MODIFY_DATE"),
						rset.getInt("MEMBER_TYPE"),
						rset.getString("WRITE_ACTIVE"),
						rset.getInt("USER_CATE"), rset.getInt("POINT"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return loginUser;
	}

	// 2. 회원 가입 처리용 dao
	public int insertMember(Connection conn, Member mem) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem.getUserId());
			pstmt.setString(2, mem.getUserPwd());
			pstmt.setString(3, mem.getNickName());
			pstmt.setString(4, mem.getPhone());
			pstmt.setString(5, mem.getEmail());
			pstmt.setInt(6, mem.getUser_cate());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);

		}

		return result;
	}

	// 3. 회원 정보 수정 처리용 dao
	public int updateMember(Connection conn, Member mem) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mem.getNickName());
			pstmt.setString(2, mem.getPhone());
			pstmt.setString(3, mem.getEmail());
			pstmt.setInt(4, mem.getUser_cate());
			pstmt.setString(5, mem.getUserId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 4. userId로 회원한명 조회용 dao
	public Member selectMember(Connection conn, String userId) {
		Member loginUser = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		// 1. 미리sql문 전달 세팅을 미리하는 거
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();

			if (rset.next()) {
				loginUser = new Member(rset.getString("USER_ID"),
						rset.getString("USER_PWD"), rset.getString("NICKNAME"),
						rset.getString("PHONE"), rset.getString("EMAIL"),
						rset.getDate("JOIN_DATE"),rset.getDate("MODIFY_DATE"),
						rset.getInt("MEMBER_TYPE"), rset.getInt("USER_CATE"),
						rset.getInt("POINT"));
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return loginUser;
	}
	//5. 비밀번호 변경용 dao
		public int updatePwd(Connection conn, String userId, String userPwd, String newPwd) {
			PreparedStatement pstmt = null;
			int result=0;
			
			String sql=prop.getProperty("updatePwd");
			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, newPwd);
				pstmt.setString(2, userId);
				pstmt.setString(3, userPwd);

				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

			
			return result;
		}

		//6. 탈퇴용 메소드
		public int deleteMember(Connection conn, String userId) {
			PreparedStatement pstmt = null;
			int result=0;
			
			String sql=prop.getProperty("deleteMember");
			
			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, userId);
				
				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}

		//관심있는 카테고리 변경 메소드
		public int updateCateMember(Connection conn, Member m) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("updateCateMember");

			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, m.getUser_cate());
				pstmt.setString(2, m.getUserId());

				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

			
			return result;
		}

		//환급 후 포인트 변경 
		public int updatePoint(Connection conn, int point, Member m) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("updatePoint");

			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, point);
				pstmt.setString(2, m.getUserId());

				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

			
			return result;
		}
		
		//아이디 중복 체크
		public int idCheck(Connection conn, String userId) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int result=0;
			
			String sql=prop.getProperty("idCheck");
			
			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, userId);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					result = rset.getInt(1);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return result;
		}
		
		//신고당한 횟수 카운트 올리기
		public int processUserReported(Connection conn, int rNo) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("processUserReported");

			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, rNo);

				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

			
			return result;
		}

		public int payback(Connection conn, String userId, int money) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("payback");

			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, money);
				pstmt.setString(2, userId);

				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

			
			return result;
		}

		//챌린지 삭제시 금액 환불
		public int refundMoney(Connection conn, int challNo) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("refundMoney");

			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, challNo);
				pstmt.setInt(2, challNo);

				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

			
			return result;
		}

		public int todayJoinCount(Connection conn) {
			int todayJoinCount = 0;
			Statement stmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("todayJoinCount");
			
			try {
				stmt = conn.createStatement();
				
				rset = stmt.executeQuery(sql);
				
				if(rset.next()) {
					todayJoinCount = rset.getInt(1);
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			return todayJoinCount;
		}
}
