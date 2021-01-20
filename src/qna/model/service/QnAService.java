package qna.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import qna.model.dao.QnADao;
import qna.model.vo.QnA;

public class QnAService {
		
	public ArrayList<QnA> selectList() {
		Connection conn = getConnection();
		ArrayList<QnA> list = new QnADao().selectList(conn);
		close(conn);
		
		return list;
	}

	public int insertQuestion(QnA q) {
		Connection conn = getConnection();
		
		int result = new QnADao().insertQuestion(conn, q);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}


	public QnA selectQuestion(int qnaNo) {
		Connection conn = getConnection();
		
		QnA q = new QnADao().selectQuestion(conn, qnaNo);
		
		close(conn);
		
		return q;
	}

}
