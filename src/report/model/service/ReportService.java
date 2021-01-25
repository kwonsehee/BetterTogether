package report.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import report.model.dao.ReportDao;
import report.model.vo.Report;

public class ReportService {

	//인증신고
	public int insertConfirmReport(Report r, int no) {
		Connection conn=getConnection();
		int result = new ReportDao().insertConfirmReport(conn,r, no);
		
		if(result>0) {	
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int insertChallReport(Report r, int no) {
		Connection conn=getConnection();
		int result = new ReportDao().insertChallReport(conn,r, no);
		
		if(result>0) {	
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	

	public int insertBoardReport(Report r, int no) {
		Connection conn=getConnection();
		int result = new ReportDao().insertBoardReport(conn,r, no);
		
		if(result>0) {	
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int insertCafeReport(Report r, int no) {
		Connection conn=getConnection();
		int result = new ReportDao().insertCafeReport(conn,r, no);
		
		if(result>0) {	
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
