package myPage.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import challenge.model.dao.ChallDao;
import challenge.model.vo.Challenge;
import challenge.model.vo.ChallengeStatus;
import common.model.vo.PageInfo;
import common.model.vo.Search;
import myPage.model.dao.myPageDao;

public class myPageService {
	
	/*//참여했던 챌린지그룹 조회
	public ArrayList<Challenge> joinedSelectList(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Challenge> cList = new myPageDao().joinedSelectList(conn, userId);
		
		close(conn);
		return cList;
	}*/

/*	//찜하기한 챌린지그룹 조회
	public ArrayList<Challenge> likeSelectList(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Challenge> cList = new myPageDao().likeSelectList(conn, userId);
		
		close(conn);
		return cList;
	}

	public ArrayList<Challenge> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}*/
	
	//참여했던 챌린지 페이징 처리를 위한 총 게시글 갯수 구하기
	public int joinedgetListCount(String userId) {
		Connection conn = getConnection();
		int listCount = new myPageDao().joinedgetListCount(conn, userId);
		close(conn);
		return listCount;
	}
	
	//참여했던 챌린지 페이징처리가 된 게시글 목록 조회
	public ArrayList<Challenge> joinedSelectList(PageInfo pi, String userId) {
		Connection conn = getConnection();
		
		ArrayList<Challenge> cList = new myPageDao().joinedSelectList(conn, pi, userId);
		System.out.println("33333" +cList);
		close(conn);
		return cList;
	}
	
	//찜하기 갯수
	public int likegetListCount(String userId) {
		Connection conn = getConnection();
		int listCount = new myPageDao().likegetListCount(conn, userId);
		close(conn);
		return listCount;
	}
	
	//찜하기 리스트 페이징처리가 된 게시글 목록 조회
	public ArrayList<Challenge> likeSelectList(PageInfo pi, String userId) {
		Connection conn = getConnection();
		ArrayList<Challenge> cList = new myPageDao().likeSelectList(conn, pi, userId);
		close(conn);
		return cList;
	}
	
	//참여중인 챌린지 그룹 갯수
	public int joininggetListCount(String userId) {
		Connection conn = getConnection();
		int listCount = new myPageDao().joininggetListCount(conn, userId);
		close(conn);
		return listCount;
	}
	
	//참여중인챌린지 리스트 페이징처리가된 상태로 게시글 목록 조회
	public ArrayList<Challenge> joiningSelectList(PageInfo pi, String userId) {
		Connection conn = getConnection();
		ArrayList<Challenge> cList = new myPageDao().joiningSelectList(conn, pi, userId);
		close(conn);
		return cList;
	}
	
	//해당 챌린지와 유저가 있는지 확인
	public ChallengeStatus likeSelectStatus(int challNo, String userId) {
		Connection conn = getConnection();
		
		ChallengeStatus cs = new myPageDao().likeSelectStatus(conn, challNo, userId);
		
		close(conn);
		
		return cs;
	}
	
	//찜상태 알아오기
	public String likeSelectHits(int challNo, String userId) {
		Connection conn = getConnection();
		
		String hits_status = new myPageDao().likeSelectHits(conn, challNo, userId);
		
		close(conn);
		System.out.println("찜하기 취소Service : " + hits_status);
		
		return hits_status;
	}
	
	//찜하기 취소 하고 싶을 때 'Y'를 'N'으로 바꿔주기
	public int likeDeleteHits(int challNo, String userId) {
		Connection conn = getConnection();
		
		int result = new myPageDao().likeDeleteHits(conn, challNo, userId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	

	
	
	
	
	/*//3개월 버튼 게시글 총 갯수 구하기
	public int joinedDateSelectListCount(String userId, int threemonths) {
		Connection conn = getConnection();
		int listCount = new myPageDao().joinedDateSelectListCount(conn, userId, threemonths);
		close(conn);
		return listCount;
	}
	
	//3개월 버튼 페이징 처리 된 후 게시글 목록 조회
	public ArrayList<Challenge> joinedDateSelectList(PageInfo pi, String userId, int threemonths) {
		Connection conn = getConnection();
		ArrayList<Challenge> cList = new myPageDao().joinedDateSelectList(conn, pi, userId, threemonths);
		return cList;
	}
	*/

	
	
	

	
	
	
	
	
	
	/*//검색용 리스트 카운트
	public int getjoinedSearchListCount(Search s) {
		Connection conn = getConnection();
		
		int listCount = new myPageDao().getjoinedSearchListCount(conn, s);
		
		close(conn);
		
		return listCount;
	}
	
	//검색용 리스트 조회
	public ArrayList<Challenge> joinedSelectSearchList(PageInfo pi, Search s) {
		Connection conn = getConnection();
		
		ArrayList<Challenge> cList = new myPageDao().joinedSelectSearchList(conn, pi, s);
		
		close(conn);
		
		return cList;
	}*/
	
	/*//userId로 참여했던 챌린지 넘어오기 하기
	public ArrayList<Challenge> joinedList(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Challenge> cList = new myPageDao().joinedList(conn, userId);
		
		close(conn);
		return cList;
	}*/

	/*//찜하기 챌린지
	public ArrayList<Challenge> likeList(String userId) {
		Connection conn = getConnection();
		ArrayList<Challenge> cList = new myPageDao().likeList(conn, userId);
		
		close(conn);
		return cList;
	}
	
	//참여중인챌린지
	public ArrayList<Challenge> joiningList(String userId) {
		Connection conn = getConnection();
		ArrayList<Challenge> cList = new myPageDao().joiningList(conn, userId);
		
		close(conn);
		return cList;
	}

	*/

	
	
	

	
	
	
}
