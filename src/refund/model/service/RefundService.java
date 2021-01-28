package refund.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import refund.model.dao.RefundDao;
import refund.model.vo.Refund;

public class RefundService {

	
	 //환불계좌 입력
	public int insertrefund(Refund refund) {
		Connection conn = getConnection();
		int result = new RefundDao().insertrefund(conn, refund);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		System.out.println("service : "+result);
		return result;
	}

	//충전
	public int insertcharging(Refund ch) {
		Connection conn = getConnection();
		int result = new RefundDao().insertcharging(conn, ch);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		System.out.println("service : "+result);
		return result;
	}

}
