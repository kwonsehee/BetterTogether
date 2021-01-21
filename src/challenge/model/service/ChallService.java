package challenge.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import challenge.model.dao.ChallDao;
import challenge.model.vo.Challenge;
import challenge.model.vo.ChallengeStatus;
import common.model.vo.PageInfo;
import common.model.vo.Search;
import member.model.vo.Member;

public class ChallService {
   
   // 전체 게시글 조회 
   public ArrayList<Challenge> selectList(PageInfo pi) {
      Connection conn = getConnection();
      
      ArrayList<Challenge> list = new ChallDao().selectList(conn, pi);
      System.out.println("서비스 : "+list);
      close(conn);
      
      return list;
   }
   
   // 챌린지 참여 상세페이지 (조회수 증가) -- 조회수 추후 수정(쿠키x)
   public Challenge selectChall(int challNo) {
	   Connection conn = getConnection();
		
		ChallDao cd = new ChallDao();
		
		// int result = cd.increaseCount(conn, challNo);
		
		Challenge ch = cd.selectChall(conn, challNo);
		
		close(conn);
		return ch;
   }
   
   // 챌린지 인증에서 사용
   // 참여했던 챌린지의 정보를 가져오기 위한 서비스
   public Challenge selectJoinChall(int challNo) {
	   Connection conn = getConnection();
		
		ChallDao cd = new ChallDao();
		
		
		Challenge ch = cd.selectChall(conn, challNo);
		
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


	
//	// 게시글 상세보기 (조회수 증가 없이) 
//	public Challenge selectChallNoCnt(int challNo) {
//		Connection conn = getConnection();
//		Challenge ch = new ChallDao().selectChall(conn, challNo);
//		
//		close(conn);
//		
//		return ch;
//	}
	
	// 챌린지 현황 인원 추가 
	public int updateChallStatus(int challNo, String userId) {
		Connection conn = getConnection();
		int result = new ChallDao().updateChallStatus(conn, challNo, userId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	// 챌린지 참여중 인원 카운트 
	public int countStatus(int challNo) {
		Connection conn = getConnection();
		int countStatus = new ChallDao().countStatus(conn,challNo);
		
		if(countStatus > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return countStatus;
	}
	

	

	//카테고리에 맞는 챌린지 리스트 뽑아오기
	public ArrayList<Challenge> selectCate(int cate, PageInfo pi) {
		Connection conn = getConnection();
	      
	      ArrayList<Challenge> list = new ChallDao().selectCateList(conn,cate,pi );
	      System.out.println("service list : "+list);
	      close(conn);
	      
	      return list;
	}

	//카테고리에 맞는 챌린지 갯수 구하기
	public int getListCount(int cate) {
		Connection conn = getConnection();
		
		int listCount = new ChallDao().getCateListCount(conn,cate);
		
		close(conn);
		
		return listCount;
	}

	// 챌린지 찜하기 insert 
	public int insertChallHits(int challNo, String userId) {
		Connection conn = getConnection();
		
		int result = new ChallDao().insertChallHits(conn, challNo, userId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	// 찜 상태 알아내기 위해 
	public String selectHits(int challNo, String userId) {
		Connection conn = getConnection();
		
		String hits_status = new ChallDao().selectHits(conn, challNo, userId);
		
		close(conn);
		
		return hits_status;
	}
	
	// 찜 상태 'Y'일 경우 지우기 
	public int deleteChallHits(int challNo, String userId) {
		Connection conn = getConnection();
		
		int result = new ChallDao().deleteChallHits(conn, challNo, userId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
	// 챌린지 상태 테이블 select
	public ArrayList<ChallengeStatus> selectListChallStatus() {
		Connection conn = getConnection();
		
		ArrayList<ChallengeStatus> list = new ChallDao().selectListChallStatus(conn);
		
		close(conn);
		
		return list;
	}

	//챌린지 이름 알아오기
	public String getTitle(int cno) {
		Connection conn = getConnection();
		
		String c_title = new ChallDao().selectCtitle(conn, cno);
		
		close(conn);
		
		return c_title;
	}
	

}