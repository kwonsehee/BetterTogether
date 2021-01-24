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
	      System.out.println("listCount : " + listCount);
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
		                              rset.getString(16)));
		         }
		      System.out.println("44444 : " + cList);
		      System.out.println("userId : " + userId);
		      System.out.println("staty0"+startRow);
		      System.out.println("endRow : " + endRow);
		   } catch (SQLException e) {
		      e.printStackTrace();
		   } finally {
		        close(rset);
		        close(pstmt);
		     }
		      
		      return cList;
		   }

	public int getjoinedSearchListCount(Connection conn, Search s) {
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
	}
	
	//userId로 참여했던 챌린지 그룹 넘어오게 하기
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
	}
	
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
	public ArrayList<Challenge> likeList(Connection conn, String userId) {
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
	}
}
