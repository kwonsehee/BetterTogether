package studycafe.model.service;
 
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import common.model.vo.PageInfo;
import common.model.vo.Search;
import studycafe.model.dao.CafeDao;
import studycafe.model.vo.Cafe;

 

public class CafeService {

		
		public int getListCount() { 
			Connection conn = getConnection();
			
			int listCount = new CafeDao().getListCount(conn);
			
			close(conn);
			return listCount;
		}
	 
	
	public ArrayList<Cafe> selectList2(PageInfo pi) {
Connection conn = getConnection();
		
		ArrayList<Cafe> list= new CafeDao().selectList2(conn,pi);
		
		close(conn);
		
		return list;
	}

	
	public ArrayList<Cafe> selectList(PageInfo pi) { 
		Connection conn = getConnection();
		
		ArrayList<Cafe> list= new CafeDao().selectList(conn,pi);
		
		close(conn);
		
		return list;
	}
	
	
		public int insertCafe(Cafe n ) {
			Connection conn = getConnection();
			
			CafeDao cd = new CafeDao();
			
			
			int result = cd.insertCafe(conn,n );
			 
			
			if(result  > 0 ) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			
			 
			
			return result;
		}



		
		public int getSearchListCount(Search s) { 
			Connection conn = getConnection();
			
			int listCount = new CafeDao().getSearchListCount(conn,s);
			
			close(conn);
			return listCount;
		}



		
		public ArrayList<Cafe> selectSearchList(PageInfo pi, Search s) {
			Connection conn = getConnection();
			
			ArrayList<Cafe> list = new CafeDao().selectSearchList(conn,pi,s);
			
			return list;
		}

		public ArrayList<Cafe> selectSearchList2(PageInfo pi, Search s) {
			Connection conn = getConnection();
			
			ArrayList<Cafe> list = new CafeDao().selectSearchList2(conn,pi,s);
			
			return list;
		}

	
		
		 
		public Cafe selectStudyCafe(int cafe_code) {
			Connection conn = getConnection();
			
			 
			Cafe c = new CafeDao().selectStudyCafe(conn,cafe_code);
			
		 
			 
			
			close(conn);
			
			return c;
		}

		public int deleteCafe(int cafe_code) {
			Connection conn = getConnection();

			int result = new CafeDao().deleteCafe(conn, cafe_code);

			if (result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}

			close(conn);

			return result;
		}


		public int updateCafe(Cafe cafe) {
			Connection conn = getConnection();
			
			int result = new CafeDao().updateCafe(conn, cafe);
			
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
			close(conn);

			return result;
		}


		public Cafe selectCafeCnt(int cafe_code) {
			Connection conn = getConnection();
			Cafe b = new CafeDao().selectStudyCafe(conn, cafe_code);
			close(conn);
			return b;
		}


	


	
}
