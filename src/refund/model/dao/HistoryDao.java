package refund.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import challenge.model.dao.ChallDao;
import common.model.vo.PageInfo;
import refund.model.vo.History;

public class HistoryDao {
	private Properties prop = new Properties();
	   
	   public HistoryDao() {
	      String fileName = ChallDao.class.getResource("/sql/refund/history-query.xml").getPath();
	      try {
	         prop.loadFromXML(new FileInputStream(fileName));
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	   }

	//챌린지 성공시 받은돈 넣어주기
	public int insertHistory(Connection conn,String userId, int money, String title) {
		PreparedStatement pstmt=null;
		int result = 0;
		
		String sql = prop.getProperty("insertHistory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,userId);
			pstmt.setInt(2, money);
			pstmt.setString(3,title);
			pstmt.setString(4,userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("거래내역 dao : "+result);
		return result;
	}

	public int insertRefund(Connection conn, String userId, int money) {
		PreparedStatement pstmt=null;
		int result = 0;
		
		String sql = prop.getProperty("insertRefund");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,userId);
			pstmt.setInt(2, money);
			pstmt.setString(3,userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("거래내역 dao : "+result);
		return result;
	}
	//챌린지 결제할때
	public int insertPayment(Connection conn, String userId, int payment, int challNo) {
		PreparedStatement pstmt=null;
		int result = 0;
		
		String sql = prop.getProperty("insertPayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,userId);
			pstmt.setInt(2, payment);
			pstmt.setInt(3, challNo);
			pstmt.setString(4,userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("거래내역 dao : "+result);
		return result;
	}

	//거래내역 갯수가져오기
	public int getListCount(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		int listCount = 0;
		
		String sql = prop.getProperty("getListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,userId);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		System.out.println("거래내역 dao : "+listCount);
		return listCount;
	}

	public ArrayList<History> selectMyHistory(Connection conn, String userId, PageInfo pi) {
		ArrayList<History> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyHistory");

		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();
		
			
			while (rset.next()) {
				java.util.Date date = rset.getTimestamp(2);

				list.add(new History(date, rset.getInt(3), rset.getInt(4),rset.getString(5), rset.getInt(6)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		System.out.println("거래내역 list dao : " + list);
		return list;
	}

	//포인트 충전 할때
	public int insertCharge(Connection conn, String userId, int money) {
		PreparedStatement pstmt=null;
		int result = 0;
		
		String sql = prop.getProperty("insertCharge");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,userId);
			pstmt.setInt(2, money);
			pstmt.setString(3,userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("거래내역 dao : "+result);
		return result;
	}

	//챌린지삭제로 인해 환급 될 경우
	public int refundChall(Connection conn, int challNo) {
		PreparedStatement pstmt=null;
		int result = 0;
		
		String sql = prop.getProperty("refundChall");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,challNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("거래내역 dao : "+result);
		return result;
	}

	//출금 내역 카운트
	public int getOutListCount(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		int listCount = 0;
		
		String sql = prop.getProperty("getOutListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,userId);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		System.out.println("거래내역 dao : "+listCount);
		return listCount;
	}
	//입금 내역 카운트
		public int getInListCount(Connection conn, String userId) {
			PreparedStatement pstmt=null;
			ResultSet rset = null;
			int listCount = 0;
			
			String sql = prop.getProperty("getInListCount");
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1,userId);
				
				rset = pstmt.executeQuery();
				
				if (rset.next()) {
					listCount = rset.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			
			System.out.println("거래내역 dao : "+listCount);
			return listCount;
		}

		//출금내역 리스트
		public ArrayList<History> selectMyOutHistory(Connection conn, String userId, PageInfo pi) {
			ArrayList<History> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectMyOutHistory");

			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;
				
				pstmt.setString(1, userId);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

				rset = pstmt.executeQuery();
			
				
				while (rset.next()) {
					java.util.Date date = rset.getTimestamp(2);

					list.add(new History(date, rset.getInt(3), rset.getInt(4),rset.getString(5), rset.getInt(6)));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}

			System.out.println("거래내역 list dao : " + list);
			return list;
		}

		// 입금내역 리스트
		public ArrayList<History> selectMyInHistory(Connection conn, String userId, PageInfo pi) {
			ArrayList<History> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectMyInHistory");

			try {
				pstmt = conn.prepareStatement(sql);

				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;

				pstmt.setString(1, userId);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

				rset = pstmt.executeQuery();

				while (rset.next()) {
					java.util.Date date = rset.getTimestamp(2);

					list.add(new History(date, rset.getInt(3), rset.getInt(4), rset.getString(5), rset.getInt(6)));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}

			System.out.println("거래내역 list dao : " + list);
			return list;
		}

}
