package refund.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import challenge.model.dao.ChallDao;
import challenge.model.vo.Challenge;
import common.model.vo.PageInfo;
import refund.model.dao.HistoryDao;
import refund.model.dao.RefundDao;
import refund.model.vo.History;

public class HistoryService {

	//챌린지 성공시받은 돈
	public int insertHistory(String userId, int money, String title) {
		Connection conn = getConnection();
		int result = new HistoryDao().insertHistory(conn, userId, money, title);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		System.out.println("거래내역service : "+result);
		
		return result;
	}

	//포인트 환급 받는
	public int insertRefund(String userId, int money) {
		Connection conn = getConnection();
		int result = new HistoryDao().insertRefund(conn, userId, money);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		System.out.println("거래내역service : "+result);
		
		return result;
	}

	//챌린지 결제할때
	public int insertPayment(String userId, int payment, int challNo) {
		Connection conn = getConnection();
		int result = new HistoryDao().insertPayment(conn, userId, payment, challNo);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		System.out.println("거래내역service : "+result);
		
		return result;
	}

	//history갯수가져오기
	public int getListCount(String userId) {
		Connection conn = getConnection();
		
		int result = new HistoryDao().getListCount(conn, userId);
		
		close(conn);
		
		System.out.println("거래내역service : "+result);
		
		return result;
	}

	//나의 History 페이징에 맞게 가져오기
	public ArrayList<History> selectMyHistory(String userId, PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<History> list = new HistoryDao().selectMyHistory(conn, userId, pi);
		
		System.out.println("거래내역 list 조회: " + list);
		
		close(conn);
		
		return list;
	}

	//포인트 충전 할때
	public int insertCharge(String userId, int money) {
		Connection conn = getConnection();
		int result = new HistoryDao().insertCharge(conn, userId, money);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		System.out.println("거래내역service : "+result);
		
		return result;
	}

	//챌린지삭제로 인해 환급 될 경우
	public int refundChall(int challNo) {
		Connection conn = getConnection();
		int result = new HistoryDao().refundChall(conn,challNo);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		System.out.println("거래내역service : "+result);
		
		return result;
	}

}
