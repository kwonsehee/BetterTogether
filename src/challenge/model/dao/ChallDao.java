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
         
         while(rset.next()) {
            list.add(new Challenge(rset.getInt(2),
                              rset.getString(3),
                              rset.getInt(4),
                              rset.getDate(5),
                              rset.getInt(6),
                              rset.getString(7),
                              rset.getString(8),
                              rset.getString(9),
                              rset.getString(10),
                              rset.getInt(11),
                              rset.getString(12),
                              rset.getInt(13),
                              rset.getString(14),
                              rset.getString(15),
                              rset.getInt(16),
                              rset.getString(17)));
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

         if(rset.next()) {
            ch = new Challenge(rset.getInt("CHALL_NO"),
                     rset.getString("CHALL_TITLE"),
                     rset.getInt("CHALL_PEOPLE"),
                     rset.getDate("CHALL_DATE"),
                     rset.getInt("CHALL_HITS"),
                     rset.getString("FILE_PATH"),
                     rset.getString("CHALL_CONFIRM"),
                     rset.getString("CHALL_FREQUENCY"),
                     rset.getString("CHALL_PERIOD"),
                     rset.getInt("CHALL_PAYMENT"),
                     rset.getString("CHALL_CONTENT"),
                     rset.getInt("CHALL_COUNT"),
                     rset.getString("NICKNAME"),
                     rset.getString("CATE_NAME"),
                     rset.getInt("CHALL_CNT"),
                     rset.getString("CHALL_START"));

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
         pstmt.setString(12, ch.getChallStart());
         
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
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		System.out.println("dao count : "+listCount);
		return listCount;
	}

	// 검색 리스트 카운트 
	public int getSearchListCount(Connection conn, Search s) {
		int listCount =0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		
		if(s.getSearchCondition().equals("title")) {
			sql = prop.getProperty("getSearchTitleListCount");
		} else if(s.getSearchCondition().equals("category")) {
			sql = prop.getProperty("getSearchCategoryListCount");
		} else {
			sql = prop.getProperty("getSearchWriterListCount");
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
	public ArrayList<Challenge> selectSearchList(Connection conn, PageInfo pi, Search s) {
		ArrayList<Challenge> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		
		if(s.getSearchCondition().equals("title")) {
			sql = prop.getProperty("selectSearchTitleListCount");
		} else if(s.getSearchCondition().equals("category")) {
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
			
			while(rset.next()) {
				list.add(new Challenge(rset.getInt(2),
				                        rset.getString(3),
				                        rset.getInt(4),
				                        rset.getDate(5),
				                        rset.getInt(6),
				                        rset.getString(7),
				                        rset.getString(8),
				                        rset.getString(9),
				                        rset.getString(10),
				                        rset.getInt(11),
				                        rset.getString(12),
				                        rset.getInt(13),
				                        rset.getString(14),
				                        rset.getString(15),
				                        rset.getInt(16),
				                        rset.getString(17)));
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

	// 참여중 인원 카운트 (추후 수정 예정) 
	public int countStatus(Connection conn, int challNo) {
		int countStatus = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("countStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, challNo);
			
			countStatus = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return countStatus;
	}



	//카테고리에 맞는 챌린지리스트 뽑아오기
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
	         
	         while(rset.next()) {
	             list.add(new Challenge(rset.getInt(2),
	                               rset.getString(3),
	                               rset.getInt(4),
	                               rset.getDate(5),
	                               rset.getInt(6),
	                               rset.getString(7),
	                               rset.getString(8),
	                               rset.getString(9),
	                               rset.getString(10),
	                               rset.getInt(11),
	                               rset.getString(12),
	                               rset.getInt(13),
	                               rset.getString(14),
	                               rset.getString(15),
	                               rset.getInt(16),
	                               rset.getString(17)));
	          }
	         
	        System.out.println("dao list: "+list);
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	    	 close(rset);
	         close(pstmt);
	      }
	      
	      
	      return list;
	}


	//카테고리에 맞는 게시글카운트 구하기
	public int getCateListCount(Connection conn, int cate) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getCateListCount");
		
		try {
			pstmt =conn.prepareStatement(sql);
			
			pstmt.setInt(1, cate);
			
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
			
			if(rset.next()) {
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
	         
	         while(rset.next()) {
	            list.add(new ChallengeStatus(rset.getString(1),
	                              rset.getInt(2),
	                              rset.getInt(3),
	                              rset.getDate(4),
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


}