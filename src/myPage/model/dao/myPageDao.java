
package myPage.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;


import static common.JDBCTemplate.*;

import challenge.model.vo.Challenge;
import challenge.model.vo.ChallengeStatus;
import common.model.vo.PageInfo;
import common.model.vo.Search;
import notice.model.dao.NoticeDao;

public class myPageDao {
	private Properties prop = new Properties();
	
	public myPageDao() {
		String fileName = myPageDao.class.getResource("/sql/myPage/myPage-query.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//참여했던 챌린지 게시글 총 개수 조회
	public int joinedgetListCount(Connection conn, String userId) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getListCount");
		try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, userId);
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) {
	            // 게시글의 첫번째 숫자는 1 ....105로 늘어나게 하기
	           // sql에서 count를 select하는 명령문을 실행했을 때 
	           // 결과적으로 조회되는 컬럼의 갯수는 1임 (count = n개)
	            listCount = rset.getInt(1);
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      System.out.println("joinedCount : " + listCount);
	      return listCount;
	   }
	
	//페이징 처리된 joinedList 조회
	public ArrayList<Challenge> joinedSelectList(Connection conn, PageInfo pi, String userId) {
		ArrayList<Challenge> cList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("joinedSelectList");
		try {
		      pstmt = conn.prepareStatement(sql);
		      
		      int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		      int endRow = startRow + pi.getBoardLimit() - 1;
		      
		      pstmt.setInt(1, startRow);
		      pstmt.setInt(2, endRow);
		      pstmt.setString(3, userId);
		      
		      rset = pstmt.executeQuery();
		      
		      while(rset.next()) {
		            cList.add(new Challenge(rset.getInt(2),
		                              rset.getString(3),
		                             rset.getInt(4),
		                              rset.getDate(5),
		                              rset.getString(6),
		                              rset.getString(7),
		                              rset.getString(8),
		                              rset.getString(9),
		                              rset.getInt(10),
		                              rset.getString(11),
		                              rset.getInt(12),
		                              rset.getString(13),
		                              rset.getString(14),
		                              rset.getInt(15),
		                              rset.getDate(16)));
		         }
		      System.out.println("joined : " + cList);

		   } catch (SQLException e) {
		      e.printStackTrace();
		   } finally {
		        close(rset);
		        close(pstmt);
		     }
		      
		      return cList;
		   }
	
	//찜하기 갯수
	public int likegetListCount(Connection conn, String userId) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("likegetListCount");
		try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, userId);
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) {
	            // 게시글의 첫번째 숫자는 1 ....105로 늘어나게 하기
	           // sql에서 count를 select하는 명령문을 실행했을 때 
	           // 결과적으로 조회되는 컬럼의 갯수는 1임 (count = n개)
	            listCount = rset.getInt(1);
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      System.out.println("likeCount : " + listCount);
	      return listCount;
	   }
	
	//찜하기 게시글 페이징처리 된 상태로 가져오기
	public ArrayList<Challenge> likeSelectList(Connection conn, PageInfo pi, String userId) {
		ArrayList<Challenge> cList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("likeSelectList");
		
		try {
		      pstmt = conn.prepareStatement(sql);
		      
		      int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		      int endRow = startRow + pi.getBoardLimit() - 1;
		      
		      pstmt.setString(1, userId);
		      pstmt.setInt(2, startRow);
		      pstmt.setInt(3, endRow);
		      
		      rset = pstmt.executeQuery();
		      
		      while(rset.next()) {
		            cList.add(new Challenge(rset.getInt(2),
		                              rset.getString(3),
		                             rset.getInt(4),
		                              rset.getDate(5),
		                              rset.getString(6),
		                              rset.getString(7),
		                              rset.getString(8),
		                              rset.getString(9),
		                              rset.getInt(10),
		                              rset.getString(11),
		                              rset.getInt(12),
		                              rset.getString(13),
		                              rset.getString(14),
		                              rset.getInt(15),
		                              rset.getDate(16)));
		         }
		      System.out.println("like : " + cList);
		   } catch (SQLException e) {
		      e.printStackTrace();
		   } finally {
		        close(rset);
		        close(pstmt);
		     }
		      
		      return cList;
		   }
	
	//참여중인 챌린지그룹 갯수
	public int joininggetListCount(Connection conn, String userId) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("joininggetListCount");
		try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, userId);
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) {
	            // 게시글의 첫번째 숫자는 1 ....105로 늘어나게 하기
	           // sql에서 count를 select하는 명령문을 실행했을 때 
	           // 결과적으로 조회되는 컬럼의 갯수는 1임 (count = n개)
	            listCount = rset.getInt(1);
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      System.out.println("joiningCount : " + listCount);
	      return listCount;
	   }
	
	//참여중인 챌린지 목록 가져오기
	public ArrayList<Challenge> joiningSelectList(Connection conn, PageInfo pi, String userId) {
		ArrayList<Challenge> cList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("joiningSelectList");
		
		try {
		      pstmt = conn.prepareStatement(sql);
		      
		      int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		      int endRow = startRow + pi.getBoardLimit() - 1;
		      
		      pstmt.setString(1, userId);
		      pstmt.setInt(2, startRow);
		      pstmt.setInt(3, endRow);
		      
		      rset = pstmt.executeQuery();
		      
		      while(rset.next()) {
		            cList.add(new Challenge(rset.getInt(2),
		                              rset.getString(3),
		                             rset.getInt(4),
		                              rset.getDate(5),
		                              rset.getString(6),
		                              rset.getString(7),
		                              rset.getString(8),
		                              rset.getString(9),
		                              rset.getInt(10),
		                              rset.getString(11),
		                              rset.getInt(12),
		                              rset.getString(13),
		                              rset.getString(14),
		                              rset.getInt(15),
		                              rset.getDate(16)));
		         }
		      System.out.println("joining : " + cList);
		   } catch (SQLException e) {
		      e.printStackTrace();
		   } finally {
		        close(rset);
		        close(pstmt);
		     }
		      
		      return cList;
		   }
	
	//챌린지 현황에 해당챌린지와 유저가 있는지 확인
	public ChallengeStatus likeSelectStatus(Connection conn, int challNo, String userId) {
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
	
	//찜상태 확인
	public String likeSelectHits(Connection conn, int challNo, String userId) {
		String hits_status = "";
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("likeSelectHits");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, challNo);
			
			rset = pstmt.executeQuery();
			
			System.out.println("찜하기 취소 Dao: " + hits_status);
			
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

	public int likeDeleteHits(Connection conn, int challNo, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("likeDeleteHits");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, challNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} close(pstmt);
		return result;
	}
	
	
	/*//3개월 버튼 게시글 리스트 총 갯수
	public int joinedDateSelectListCount(Connection conn, String userId, int threemonths) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("joinedDateSelectListCount");
		try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, userId);
	         pstmt.setInt(2, threemonths);
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) {
	            // 게시글의 첫번째 숫자는 1 ....105로 늘어나게 하기
	           // sql에서 count를 select하는 명령문을 실행했을 때 
	           // 결과적으로 조회되는 컬럼의 갯수는 1임 (count = n개)
	            listCount = rset.getInt(1);
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      System.out.println("dateListCount : " + listCount);
	      return listCount;
	   }
	
	//3개월 버튼 클릭 시 페이징 처리된 상태에서 게시글 목록 조회
	public ArrayList<Challenge> joinedDateSelectList(Connection conn, PageInfo pi, String userId, int threemonths) {
		ArrayList<Challenge> cList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("joinedDateSelectList");
		
		return null;
	}*/
}
	
	
	
	
	
	
	
	
	
	/*public int getjoinedSearchListCount(Connection conn, Search s) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		
		if (s.getSearchCondition().equals("writer")) {
	         sql = prop.getProperty("getjoinedSearchWriterListCount");
	      } else if (s.getSearchCondition().equals("title")) {
	         sql = prop.getProperty("getjoinedSearchTitleListCount");         
	      } else {
	         sql = prop.getProperty("getjoinedSearchContentListCount");
	      }
	         
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, s.getSearch());
	         
	         rset = pstmt.executeQuery(); // 쿼리 select
	         
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
	
	//
	public ArrayList<Challenge> joinedSelectSearchList(Connection conn, PageInfo pi, Search s) {
		ArrayList<Challenge> cList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		
		if(s.getSearchCondition().equals("title")) {
			sql = prop.getProperty("joinedselectSearchTitleListCount");
		} else if(s.getSearchCondition().equals("category")) {
			sql = prop.getProperty("joinedselectSearchCategoryListCount");
		} else {
			sql = prop.getProperty("joinedselectSearchWriterListCount");
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
				cList.add(new Challenge(rset.getInt(2),
				                        rset.getString(3),
				                        rset.getInt(4),
				                        rset.getDate(5),
				                        rset.getString(6),
				                        rset.getString(7),
				                        rset.getString(8),
				                        rset.getString(9),
				                        rset.getInt(10),
				                        rset.getString(11),
				                        rset.getInt(12),
				                        rset.getString(13),
				                        rset.getString(14),
				                        rset.getInt(15),
				                        rset.getString(16)));
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return cList;
	}*/
	
	/*//userId로 참여했던 챌린지 그룹 넘어오게 하기
	public ArrayList<Challenge> joinedList(Connection conn, String userId) {
		System.out.println("5555");
		ArrayList<Challenge> cList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("joinedList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				cList.add(new Challenge(rset.getInt("CHALL_NO"),
										rset.getString("CHALL_TITLE"),
									    rset.getString("CHALL_PERIOD")));
			}
	         System.out.println("4444" + cList);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return cList;
	}*/
	
	/*//찜하기 리스트
		public ArrayList<Challenge> likeSelectList(Connection conn, String userId) {
			System.out.println("5555");
			ArrayList<Challenge> cList = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("likeSelectList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				
				rset=pstmt.executeQuery();
				while(rset.next()) {
					cList.add(new Challenge(rset.getInt("CHALL_NO"),
											rset.getString("CHALL_TITLE"),
										    rset.getString("CHALL_PERIOD")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return cList;
		}*/
		
	//찜하기 챌린지 리스트
	/*public ArrayList<Challenge> likeList(Connection conn, String userId) {
		System.out.println("5555");
		ArrayList<Challenge> cList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("likeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				cList.add(new Challenge(rset.getInt("CHALL_NO"),
										rset.getString("CHALL_TITLE"),
									    rset.getString("CHALL_PERIOD")));
			}
	         System.out.println("4444" + cList);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return cList;
	}
	
	//참여중인 챌린지
	public ArrayList<Challenge> joiningList(Connection conn, String userId) {
		System.out.println("5555");
		ArrayList<Challenge> cList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("joiningList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				cList.add(new Challenge(rset.getInt("CHALL_NO"),
										rset.getString("CHALL_TITLE"),
									    rset.getString("CHALL_PERIOD")));
			}
	         System.out.println("4444" + cList);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return cList;
	}*/
