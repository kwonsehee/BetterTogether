package myPage.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import challenge.model.dao.ChallDao;
import challenge.model.vo.Challenge;
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
	
	//검색용 리스트 카운트
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
	}
	
	//userId로 참여했던 챌린지 넘어오기 하기
	public ArrayList<Challenge> joinedList(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Challenge> cList = new myPageDao().joinedList(conn, userId);
		
		close(conn);
		return cList;
	}

	//찜하기 챌린지
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

	

	
	
	

	
	
	
}
