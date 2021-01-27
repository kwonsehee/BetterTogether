package challenge.model.dao;

import static common.JDBCTemplate.close; // close 임포트

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import challenge.model.vo.Challenge;
import challenge.model.vo.ChallengeStatus;
import common.model.vo.PageInfo;
import common.model.vo.Search;
import member.model.vo.Member;

public class ChallDao {

	private Properties prop = new Properties();

	public ChallDao() {
		String fileName = ChallDao.class.getResource("/sql/challenge/challenge-query.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 챌린지 게시물 조회
	public ArrayList<Challenge> selectList(Connection conn, PageInfo pi) {
		ArrayList<Challenge> list = new ArrayList<>();
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

			while (rset.next()) {
				list.add(new Challenge(rset.getInt(2), rset.getString(3), rset.getInt(4), rset.getDate(5),
						rset.getString(6), rset.getString(7), rset.getString(8), rset.getString(9), rset.getInt(10),
						rset.getString(11), rset.getInt(12), rset.getString(13), rset.getString(14), rset.getInt(15),
						rset.getDate(16)));
			}
			System.out.println(list);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	// 챌린지참여 상세보기 1개
	public Challenge selectChall(Connection conn, int challNo) {
		Challenge ch = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectChall");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, challNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				ch = new Challenge(rset.getInt("CHALL_NO"), rset.getString("CHALL_TITLE"), rset.getInt("CHALL_PEOPLE"),
						rset.getDate("CHALL_DATE"), rset.getString("FILE_PATH"),
						rset.getString("CHALL_CONFIRM"), rset.getString("CHALL_FREQUENCY"),
						rset.getString("CHALL_PERIOD"), rset.getInt("CHALL_PAYMENT"), rset.getString("CHALL_CONTENT"),
						rset.getInt("CHALL_COUNT"), rset.getString("NICKNAME"), rset.getString("USER_ID"),rset.getString("CATE_NAME"),
						rset.getInt("CHALL_CNT"), rset.getDate("CHALL_START"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return ch;
	}

	// 챌린지 등록
	public int insertChall(Connection conn, Challenge ch) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertChall");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, ch.getChallTitle());
			pstmt.setInt(2, ch.getChallPeople());
			pstmt.setString(3, ch.getChallFile());
			pstmt.setString(4, ch.getChallConfirm());
			pstmt.setString(5, ch.getChallFrequency());
			pstmt.setString(6, ch.getChallPeriod());
			pstmt.setInt(7, ch.getChallPay());
			pstmt.setString(8, ch.getChallContent());
			pstmt.setInt(9, ch.getConfirmCnt());
			pstmt.setString(10, ch.getUserId());
			pstmt.setInt(11, Integer.parseInt(ch.getCateName()));
			pstmt.setDate(12, ch.getChallStart());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
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

			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		System.out.println("dao count : " + listCount);
		return listCount;
	}

	// 검색 리스트 카운트
	public int getSearchListCount(Connection conn, Search s) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";

		if (s.getSearchCondition().equals("title")) {
			sql = prop.getProperty("getSearchTitleListCount");
		} else if (s.getSearchCondition().equals("category")) {
			sql = prop.getProperty("getSearchCategoryListCount");
		} else {
			sql = prop.getProperty("getSearchWriterListCount");
		}

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, s.getSearch());

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

		return listCount;
	}

	// 검색 리스트 조회
	public ArrayList<Challenge> selectSearchList(Connection conn, PageInfo pi, Search s) {
		ArrayList<Challenge> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";

		if (s.getSearchCondition().equals("title")) {
			sql = prop.getProperty("selectSearchTitleListCount");
		} else if (s.getSearchCondition().equals("category")) {
			sql = prop.getProperty("selectSearchCategoryListCount");
		} else {
			sql = prop.getProperty("selectSearchWriterListCount");
		}

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setString(1, s.getSearch());
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Challenge(rset.getInt(2), rset.getString(3), rset.getInt(4), rset.getDate(5),
						rset.getString(6), rset.getString(7), rset.getString(8), rset.getString(9), rset.getInt(10),
						rset.getString(11), rset.getInt(12), rset.getString(13), rset.getString(14), rset.getInt(15),
						rset.getDate(16)));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

//	// 조회수 증가
//	public int increaseCount(Connection conn, int challNo) {
//		int result = 0;
//		PreparedStatement pstmt = null;
//		String sql = prop.getProperty("increaseCount");
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			
//			pstmt.setInt(1, challNo);
//			
//			result = pstmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		
//		return result;
//	}

	// 챌린지 인원 현황 (참여중)
	public int updateChallStatus(Connection conn, int challNo, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateChallStatus");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);
			pstmt.setInt(2, challNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 카테고리에 맞는 챌린지리스트 뽑아오기
	public ArrayList<Challenge> selectCateList(Connection conn, int cate, PageInfo pi) {
		ArrayList<Challenge> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCateList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, cate);

			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Challenge(rset.getInt(2), rset.getString(3), rset.getInt(4), rset.getDate(5),
						rset.getString(6), rset.getString(7), rset.getString(8), rset.getString(9), rset.getInt(10),
						rset.getString(11), rset.getInt(12), rset.getString(13), rset.getString(14), rset.getInt(15),
						rset.getDate(16)));
			}

			System.out.println("dao list: " + list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	// 카테고리에 맞는 게시글카운트 구하기
	public int getCateListCount(Connection conn, int cate) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getCateListCount");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, cate);

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

		return listCount;
	}

	// 챌린지 찜하기 insert
	public int insertChallHits(Connection conn, int challNo, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertChallHits");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);
			pstmt.setInt(2, challNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 찜상태 select 해오기!!
	public String selectHits(Connection conn, int challNo, String userId) {
		String hits_status = "";
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectHits");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);
			pstmt.setInt(2, challNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				hits_status = rset.getString(1);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return hits_status;
	}

	// 찜 상태 'Y'일 경우 지우기
	public int deleteChallHits(Connection conn, int challNo, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteChallHits");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);
			pstmt.setInt(2, challNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 챌린지 상태 테이블 select
	public ArrayList<ChallengeStatus> selectListChallStatus(Connection conn) {
		ArrayList<ChallengeStatus> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListChallStatus");

		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new ChallengeStatus(rset.getString(1), rset.getInt(2), rset.getInt(3), rset.getDate(4),
						rset.getString(5)));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	

	

	// 참여중 인원 카운트 ---> 삭제에에에 
	public int updateJoinCount(Connection conn, int challNo) {
		int joinPeopleCnt = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("joinPeopleCnt1");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, challNo);
			
			joinPeopleCnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return joinPeopleCnt;
	}
	
	// 참여중 인원 카운트 해오기 
	public int selectJoinCount(Connection conn, int challNo) {
		int joinPeopleCnt = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("joinPeopleCnt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, challNo);
			
			rset = pstmt.executeQuery();
					
			while(rset.next()) {
				joinPeopleCnt = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
			close(rset);
		}
		
		System.out.println("joinPeopleCnt : " + joinPeopleCnt);
		
		return joinPeopleCnt;
	}
	
	
	// 챌린지 현황 테이블 확인부터 (해당 챌린지, 유저가 있는지)
	public ChallengeStatus selectChallStatus(Connection conn, int challNo, String userId) {
		ChallengeStatus cs = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectChallStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, challNo);
			pstmt.setString(2, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				cs = new ChallengeStatus(rset.getString(1),
										 rset.getInt(2),
										 rset.getInt(3),
										 rset.getDate(4),
										 rset.getString(5));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return cs;
	}
	
	// 찜하기 & 참여하기 했을 때 챌린지 현황이 없다면 챌린지 현황 테이블 insert 해주기 
	public int insertChallStatus(Connection conn, int challNo, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertChallStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, challNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 찜 상태 업데이트 --> 'Y' 
	public int updateHitsStatus(Connection conn, int challNo, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateHitsStatus");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);
			pstmt.setInt(2, challNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
		
	}
	
	// 찜 'Y'이면서 참여중인 사람 
	public int selectJoinChallStatus(Connection conn, int challNo, String userId) {
		int chall_status = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectJoinChallStatus");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);
			pstmt.setInt(2, challNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				chall_status = rset.getInt(1);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return chall_status;
	}
	
	// 참여중인데 찜 취소하고싶을때 'N'으로 업뎃 
	public int updateHitsStatus1(Connection conn, int challNo, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateHitsStatus1");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);
			pstmt.setInt(2, challNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	// challBoardType에 맞는 챌린지 갯수 구하기
	public int getChallTypeListCount(Connection conn, int challBoardType) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getChallTypeListCount");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, Integer.toString(challBoardType));

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

		return listCount;
	}

	// challBoardType 1/2/3 select해오기 
	public ArrayList<Challenge> selectChallBoardType(Connection conn, int challBoardType, PageInfo pi) {
		ArrayList<Challenge> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectChallBoardType");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setString(1, Integer.toString(challBoardType));

			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Challenge(rset.getInt(2), rset.getString(3), rset.getInt(4), rset.getDate(5),
						rset.getString(6), rset.getString(7), rset.getString(8), rset.getString(9), rset.getInt(10),
						rset.getString(11), rset.getInt(12), rset.getString(13), rset.getString(14), rset.getInt(15),
						rset.getDate(16)));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
	
	// challNo에 맞는 참가비 select해오기
	public int selectTotalPay(Connection conn, int challNo) {
		int totalPay = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTotalPay");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, challNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				totalPay = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return totalPay;
	}
	
	// 결제 완료 후 insert 해주기
	public int insertChallPay(Connection conn, int totalPay, int challNo, String userId, int payment) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertChallPay");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, totalPay);
			pstmt.setInt(2, payment);
			pstmt.setString(3, userId);
			pstmt.setInt(4, challNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//챌린지 이름 알아오기
	public String selectCtitle(Connection conn, int cno) {
		String c_title = "";
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectTitle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			

			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c_title = rset.getString(1);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return c_title;
	}
//	//user_id가 cno에 참여중인지 확인
//	public int CheckJoin(Connection conn, String user_id, int cno) {
//		ResultSet rset = null;
//		PreparedStatement pstmt = null;
//		int result = 0;
//		
//		String sql = prop.getProperty("checkJoin");
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			
//
//			
//			pstmt.setString(1, user_id);
//			pstmt.setInt(2, cno);
//			
//			rset = pstmt.executeQuery();
//			
//			if(rset.next()) {
//				result = rset.getInt(1);
//				
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//			close(rset);
//		}
//		
//		return result;
//	}
	
	// 찜 갯수 카운트 
	public int selectHitsCount(Connection conn, int challNo) {
		int hits = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("hitsCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, challNo);
			
			rset = pstmt.executeQuery();
					
			while(rset.next()) {
				hits = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
			close(rset);
		}
		
		
		return hits;
	}

	public int selectMyJoinCount(Connection conn, String userId) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getMyListCount");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);

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

		return listCount;
	}


}