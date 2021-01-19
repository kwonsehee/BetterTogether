package community.model.service;

import static common.JDBCTemplate.*;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import common.model.vo.PageInfo;
import community.model.dao.BoardDao;
import community.model.vo.Board;
import community.model.vo.Search;

public class BoardService {

	// 게시글 페이징을 위해 총 게시글 갯수 구하기
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	// 페이징 처리가 된 게시글 목록 조회
	public ArrayList<Board> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn, pi); 
		
		close(conn);
		
		return list;
	}
	
	// 검색용 리스트 카운트
	public int getSearchListCount(Search s) {
		Connection conn = getConnection();
			
		int listCount = new BoardDao().getSearchListCount(conn, s);
			
		close(conn);
			
		return listCount;
	}
		
	// 검색용 리스트 조회
	public ArrayList<Board> selectSearchList(PageInfo pi, Search s) {
		Connection conn = getConnection();
			
		ArrayList<Board> list = new BoardDao().selectSearchList(conn, pi, s);
			 
		close(conn);
			
		return list;
	}

	// 글쓰기 
	public int insertBoard(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertBoard(conn, b);;
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
}
