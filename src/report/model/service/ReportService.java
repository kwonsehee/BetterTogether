package report.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import common.model.vo.PageInfo;
import qna.model.dao.QnADao;
import qna.model.vo.QnA;
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

	public ArrayList<Report> selectList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Report> list = new ReportDao().selectList(conn, pi);

		close(conn);

		return list;
	}

}
