package faq.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import faq.model.dao.FAQDao;
import faq.model.vo.FAQ;
import qna.model.dao.QnADao;
import qna.model.vo.QnA;

import static common.JDBCTemplate.*;

public class FAQService {

	// faq 추가
	public int insertFAQ(FAQ f) {
		Connection conn = getConnection();
		
		int result = new FAQDao().insertFAQ(conn, f);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	// 자주하는 질문 뽑아오기
		public ArrayList<FAQ> selectFAQ() {
			Connection conn = getConnection();
			
			ArrayList<FAQ> list = new FAQDao().selectFAQ(conn);
			
			close(conn);
			
			return list;
		}

}
