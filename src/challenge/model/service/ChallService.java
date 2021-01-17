package challenge.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import challenge.model.dao.ChallDao;
import challenge.model.vo.Challenge;
import common.model.vo.PageInfo;
import common.model.vo.Search;

public class ChallService {
   
   // 전체 게시글 조회 
   public ArrayList<Challenge> selectList(PageInfo pi) {
      Connection conn = getConnection();
      
      ArrayList<Challenge> list = new ChallDao().selectList(conn, pi);
      
      close(conn);
      
      return list;
   }
   
   // 챌린지 참여 상세페이지 (조회수 증가)
   public Challenge selectChall(int challNo) {
	   Connection conn = getConnection();
		
		ChallDao cd = new ChallDao();
		
		int result = cd.increaseCount(conn, challNo);
		
		Challenge ch = null;
		
		if(result > 0) {
			commit(conn);
			ch = cd.selectChall(conn, challNo);
		} else {
			rollback(conn);
		}
		close(conn);
		return ch;
   }
   
   // 챌린지 등록 
   public int insertChall(Challenge ch) {
      Connection conn = getConnection();
      
      int result = new ChallDao().insertChall(conn, ch);
      
      if(result > 0) {
         commit(conn);
      } else {
         rollback(conn);
      }
      
      close(conn);
      
      
      
      return result;
   }
   
    // 게시글 페이징을 위해 총 게시글 갯수 구하기 
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new ChallDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	// 검색용 리스트 카운트
	public int getSearchListCount(Search s) {
		Connection conn = getConnection();
		int listCount = new ChallDao().getSearchListCount(conn, s);

		close(conn);
		
		return listCount;
	}
	
	// 검색용 리스트 조회 
	public ArrayList<Challenge> selectSearchList(PageInfo pi, Search s) {
		Connection conn = getConnection();
		
		ArrayList<Challenge> list = new ChallDao().selectSearchList(conn, pi, s);
		
		close(conn);
		
		return list;
	}


	
	// 게시글 상세보기 (조회수 증가 없이) 
	public Challenge selectChallNoCnt(int challNo) {
		Connection conn = getConnection();
		Challenge ch = new ChallDao().selectChall(conn, challNo);
		
		close(conn);
		
		return ch;
	}

}