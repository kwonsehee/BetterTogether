package report.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import common.model.vo.PageInfo;
import report.model.dao.ReportDao;
import report.model.vo.Report;

public class ReportService {

	// 게시글 총 갯수 구하기
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new ReportDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	// 신고페이징뷰
	public ArrayList<Report> selectList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Report> list = new ReportDao().selectList(conn, pi);

		close(conn);

		return list;
	}

	public Report selectReport(int rNo) {
		Connection conn = getConnection();

		Report r = new ReportDao().selectReport(conn, rNo);

		close(conn);

		return r;
	}

}
