package qna.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import common.model.vo.PageInfo;
import common.model.vo.Search;
import qna.model.dao.QnADao;
import qna.model.vo.QnA;

public class QnAService {
		
	

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
			
			QnA q = new QnADao().selectQuestion(conn, qnaNo);
			
			close(conn);
			
			return q;
		}

		// 질문삭제
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

		public int insertAnswer(QnA a) {
			Connection conn = getConnection();
			
			int result = new QnADao().insertAnswer(conn, a);
			
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
			close(conn);
			
			return result;
		}

		
		//답변을 가져오는 서비스
		public QnA selectAns(int qnaNo) {
			Connection conn = getConnection();
			
			QnA a = new QnADao().selectAns(conn, qnaNo);
			
			close(conn);
			
			return a;
		}

		// faq 추가
		public int insertFAQ(QnA f) {
			Connection conn = getConnection();
			
			int result = new QnADao().insertFAQ(conn, f);

			if (result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
			close(conn);
			return result;
		}
		
		// 자주하는 질문 뽑아오기
			public ArrayList<QnA> selectFAQ(PageInfo pi) {
				Connection conn = getConnection();
				
				ArrayList<QnA> list = new QnADao().selectFAQ(conn, pi);
				
				close(conn);
				
				return list;
			}


			public QnA selectAnswer(int qnaNo) {
				Connection conn = getConnection();
				
				QnA a = new QnADao().selectAnswer(conn, qnaNo);
				
				close(conn);
				
				return a;
			}


			public int updateAnswer(QnA a) {
				Connection conn = getConnection();
				
				int result = new QnADao().updateAnswer(conn, a);
				
				if(result > 0) {
					commit(conn);
				}else {
					rollback(conn);
				}
				close(conn);
				
				return result;
			}


			public int updateFAQ(QnA f) {
				Connection conn = getConnection();
				
				int result = new QnADao().updateFAQ(conn, f);
				
				if(result > 0) {
					commit(conn);
				}else {
					rollback(conn);
				}
				close(conn);
				
				return result;
			}


			public QnA selectFAQ2(int qnaNo) {
				Connection conn = getConnection();
				
				QnA f = new QnADao().selectFAQ2(conn, qnaNo);
				
				close(conn);
				
				return f;
			}


			public int getSearchListCount(Search s) {
				Connection conn = getConnection();
				
				int listCount = new QnADao().getSearchListCount(conn, s);
				
				close(conn);
				
				return listCount;
			}


			public ArrayList<QnA> selectSearchList(PageInfo pi, Search s) {
				Connection conn = getConnection();
				
				ArrayList<QnA> list = new QnADao().selectSearchList(conn, pi, s);
				
				close(conn);
				
				return list;
			}


			public int deleteFAQ(int qnaNo) {
				Connection conn = getConnection();
				
				int result = new QnADao().deleteFAQ(conn, qnaNo);
				
				if(result >0) {
					commit(conn);
				}else {
					rollback(conn);
				}
				close(conn);
				
				return result;
			}


			public int totalCount() {
				Connection conn = getConnection();
				
				int totalCount = new QnADao().totalCount(conn);
				
				close(conn);
				
				return totalCount;
			}


			public ArrayList<QnA> QNANew() {
				Connection conn = getConnection();
				
				ArrayList<QnA> list = new QnADao().QNANew(conn);
				
				close(conn);
				
				return list;
			}
}
