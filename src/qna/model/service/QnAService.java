package qna.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import common.model.vo.PageInfo;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import qna.model.dao.QnADao;
import qna.model.vo.QnA;

public class QnAService {

	// 질문하기
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

	// 질문 상세보기
	public QnA selectQuestion(int qnaNo) {
		Connection conn = getConnection();
		
		QnA q = new QnADao().selectQuestion(conn, qnaNo);
		
		close(conn);
		
		return q;
	}

	// 게시글 페이징을 위해 총 게시글 갯수 구하기
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new QnADao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	// 페이징 처리가 된 질문 목록 조회
	public ArrayList<QnA> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<QnA> list = new QnADao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}

	// 질문 수정
	public int updateQuestion(QnA q) {
		Connection conn = getConnection();
		
		int result = new QnADao().updateQuestion(conn, q);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	// 질문 한 개 선택하기
	public QnA selectQuestion2(int qnaNo) {
		Connection conn = getConnection();
		
		QnA q = new QnADao().selectQnA(conn, qnaNo);
		
		close(conn);
		
		return q;
	}

	public int deleteQuestion(int qnaNo) {
		Connection conn = getConnection();
		
		int result = new QnADao().deleteQuestion(conn, qnaNo);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}


}
