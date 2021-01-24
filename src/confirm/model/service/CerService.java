package confirm.model.service;

import static common.JDBCTemplate.*;
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

	//인증디비에 insert 
	public int insertCer(Cer c) {
		Connection conn = getConnection();
		int result = new CerDao().insertCer(conn, c);
	
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
	
		return result;
	}

	//챌린지의 모든 인증을 가져오는 서비스
	public ArrayList<Cer> selectAllCerList(int cno) {
		Connection conn = getConnection();
		ArrayList<Cer>list = new CerDao().selectAllList(conn, cno);
		
		close(conn);
		
		return list;
	}

	//디테일뷰에 보여줄 인증 하나 가져오기 
	public Cer selectCer(int ceno) {
		Connection conn = getConnection();
		Cer c = new CerDao().selectCer(conn, ceno);
		
		close(conn);
		
		return c;
	}
}
