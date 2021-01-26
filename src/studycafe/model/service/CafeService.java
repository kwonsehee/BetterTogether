package studycafe.model.service;
 
import java.sql.Connection;
import java.util.ArrayList;
 
import studycafe.model.dao.CafeDao;
import studycafe.model.vo.Cafe;
import studycafe.model.vo.PageInfo;
import studycafe.model.vo.Search;

import static common.JDBCTemplate.*;

 

public class CafeService {

		// ī�� �Խñ� ����¡ 
		public int getListCount() { 
			Connection conn = getConnection();
			
			int listCount = new CafeDao().getListCount(conn);
			
			close(conn);
			return listCount;
		}
	 
	//����¡ ó���� ����ī�� �Խñ� ��� ��ȸ
	public ArrayList<Cafe> selectList2(PageInfo pi) {
Connection conn = getConnection();
		
		ArrayList<Cafe> list= new CafeDao().selectList2(conn,pi);
		
		close(conn);
		
		return list;
	}

	//����¡ ó���� �Ϲ�ī�� �Խñ� ��� ��ȸ
	public ArrayList<Cafe> selectList(PageInfo pi) { 
		Connection conn = getConnection();
		
		ArrayList<Cafe> list= new CafeDao().selectList(conn,pi);
		
		close(conn);
		
		return list;
	}
	
	//ī�� �߰�
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



		//�˻��� ����Ʈ ī��� 
		public int getSearchListCount(Search s) { 
			Connection conn = getConnection();
			
			int listCount = new CafeDao().getSearchListCount(conn,s);
			
			close(conn);
			return listCount;
		}



		//�˻��� ����Ʈ ��ȸ
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

	
		//�Խñ� ��ȸ��
		 
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



	


	
}
