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
	public int insertReport(Report r, int confirm_no) {
		Connection conn=getConnection();
		int result = new ReportDao().insertReport(conn,r, confirm_no);
		
		if(result>0) {	
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
