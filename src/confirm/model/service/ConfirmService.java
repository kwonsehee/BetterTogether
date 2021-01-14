package confirm.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import confirm.model.dao.ConfirmDao;
import confirm.model.vo.Confirm;

public class ConfirmService {

	//로그인된 회원이 참여중인 챌린지 리스트 가져오기 
	public ArrayList<Confirm> selectList(String userid) {
		Connection conn = getConnection();
		ArrayList<Confirm>list = new ConfirmDao().selectList(conn, userid);
		
		close(conn);
		
		return list;
	}

}
