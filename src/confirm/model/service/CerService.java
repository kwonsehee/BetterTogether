package confirm.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import confirm.model.dao.CerDao;
import confirm.model.vo.Cer;

public class CerService {

	//챌린지 아이디와 유저 아이디에 맞는 인증 가져오기-> 각 챌린지 인증 리스트뷰에 뿌릴 인증가져오기
	

	public ArrayList<Cer> selectCerList(String user_id, int cno) {
		Connection conn = getConnection();
		ArrayList<Cer>list = new CerDao().selectList(conn, user_id, cno);
		
		close(conn);
		
		return list;
	}
}
