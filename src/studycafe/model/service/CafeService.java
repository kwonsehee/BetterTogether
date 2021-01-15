package studycafe.model.service;

import java.sql.Connection;
import static common.JDBCTemplate.*;

import studycafe.model.dao.CafeDao;
import studycafe.model.vo.Cafe; 

public class CafeService {

	public int insertCafe(Cafe n) {
		Connection conn = getConnection();
		int result = new CafeDao().insertCafe(conn,n);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		
		
		return result ;
	}

}
