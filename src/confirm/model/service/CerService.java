package confirm.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import common.model.vo.PageInfo;
import confirm.model.dao.CerDao;
import confirm.model.vo.Cer;

public class CerService {

	//챌린지 아이디와 유저 아이디에 맞는 인증 가져오기-> 각 챌린지 인증 리스트뷰에 뿌릴 인증가져오기
	

	public ArrayList<Cer> selectCerList(String user_id, int cno, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Cer>list = new CerDao().selectList(conn, user_id, cno, pi);
		
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
	public ArrayList<Cer> selectAllCerList(int cno, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Cer>list = new CerDao().selectAllList(conn, cno, pi);
		
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

	//인증 갯수 카운트(챌린지별 전체)
	public int getMyListCount(int cno, String user_id) {
		Connection conn = getConnection();

		int myjoinCnt = new CerDao().selectMyJoinCount(conn, cno, user_id);

		close(conn);
		System.out.println("챌린지 인증에서 넘어올때 service  " + myjoinCnt);
		return myjoinCnt;
	}

	//인증 갯수 카운트(챌린지별 회원별)
	public int getALlListCount(int cno) {
		Connection conn = getConnection();

		int myjoinCnt = new CerDao().selectAllCount(conn, cno);

		close(conn);
		
		System.out.println("챌린지모집에서 넘어올때 service  : " + myjoinCnt);
		return myjoinCnt;
	}

	//신고받은 게시물 비활성화 시키기
	public int disabledPost(int cer_id) {
		Connection conn = getConnection();

		int result = new CerDao().disabledPost(conn, cer_id);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		
		return result;
	}

	//인증 삭제하기
	public int deleteCer(int no) {
		Connection conn = getConnection();

		int result = new CerDao().deleteCer(conn, no);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		
		return result;
	}

	//회원별 달성률구하기
	public Cer getAchieve(int cno, String userId) {
		Connection conn = getConnection();

		Cer c = new CerDao().getAchieve(conn, cno, userId);

		close(conn);
		
		return c;
	}
}
