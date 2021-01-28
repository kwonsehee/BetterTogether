
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
import confirm.model.dao.CerDao;
import member.model.vo.Member;

public class ChallService {

	// 전체 게시글 조회
	public ArrayList<Challenge> selectList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Challenge> list = new ChallDao().selectList(conn, pi);
		System.out.println("서비스 : " + list);
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


	// 게시글 페이징을 위해 총 게시글 갯수 구하기
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

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	// 카테고리에 맞는 챌린지 리스트 뽑아오기
	public ArrayList<Challenge> selectCate(int cate, PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Challenge> list = new ChallDao().selectCateList(conn, cate, pi);
		System.out.println("service list : " + list);
		close(conn);

		return list;
	}

	// 카테고리에 맞는 챌린지 갯수 구하기
	public int getListCount(int cate) {
		Connection conn = getConnection();

		int listCount = new ChallDao().getCateListCount(conn, cate);

		close(conn);

		return listCount;
	}

	// challBoardType에 맞는 챌린지 갯수 구하기
	public int getListCount2(int challBoardType) {
		Connection conn = getConnection();

		int listCount = new ChallDao().getChallTypeListCount(conn, challBoardType);

		close(conn);

		return listCount;
	}
	
	// challBoardType 1/2/3 select해오기 
	public ArrayList<Challenge> selectChallBoardType(int challBoardType, PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Challenge> list = new ChallDao().selectChallBoardType(conn, challBoardType, pi);
		close(conn);
		
		return list;
	}
	

	// 챌린지 찜하기 insert
	public int insertChallHits(int challNo, String userId) {
		Connection conn = getConnection();

		int result = new ChallDao().insertChallHits(conn, challNo, userId);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
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

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

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
	


	// 챌린지 참여중 인원 카운트 --> 삭제
	public int updateJoinCount(int challNo) {
		Connection conn = getConnection();
		int joinPeopleCnt = new ChallDao().updateJoinCount(conn, challNo);

		if (joinPeopleCnt > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return joinPeopleCnt;
	}

	// 참여중 인원 카운트 해오기 (chall_status테이블에서)
	public int selectJoinCount(int challNo) {
		Connection conn = getConnection();

		int joinPeopleCnt = new ChallDao().selectJoinCount(conn, challNo);

		close(conn);

		return joinPeopleCnt;
	}

	// 챌린지 현황 테이블 확인부터 (해당 챌린지, 유저가 있는지)
	public ChallengeStatus selectChallStatus(int challNo, String userId) {
		Connection conn = getConnection();

		ChallengeStatus cs = new ChallDao().selectChallStatus(conn, challNo, userId);

		close(conn);

		return cs;
	}

	// 찜하기 & 참여하기 했을 때 챌린지 현황이 없다면 챌린지 현황 테이블 insert 해주기
	public int insertChallStatus(int challNo, String userId) {
		Connection conn = getConnection();

		int result = new ChallDao().insertChallStatus(conn, challNo, userId);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		return result;
	}

	// 찜 상태 업데이트 --> 'Y'
	public int updateHitsStatus(int challNo, String userId) {
		Connection conn = getConnection();

		int result = new ChallDao().updateHitsStatus(conn, challNo, userId);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	// 찜 'Y'이면서 참여중인 사람
	public int selectJoinChallStatus(int challNo, String userId) {
		Connection conn = getConnection();

		int chall_status = new ChallDao().selectJoinChallStatus(conn, challNo, userId);

		close(conn);

		return chall_status;
	}

	// 참여중인데 찜 취소하고싶을때 'N'으로 업뎃
	public int updateHitsStatus1(int challNo, String userId) {

		Connection conn = getConnection();

		int result = new ChallDao().updateHitsStatus1(conn, challNo, userId);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}
  	// challNo에 맞는 참가비 select해오기
	public int selectTotalPay(int challNo) {
		Connection conn = getConnection();
		
		int totalPay = new ChallDao().selectTotalPay(conn, challNo);
		
		close(conn);
		
		return totalPay;
	}
	
	// 결제테이블의 insert
	public int insertChallPay(int totalPay, int challNo, String userId, int payment) {
		Connection conn = getConnection();
		
		int result = new ChallDao().insertChallPay(conn, totalPay,challNo,userId,payment);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


	//챌린지 인증에서 회원이 참여했던 챌린지 갯수가져오기
	public int getMyListCount(String userId) {
		Connection conn = getConnection();

		int myjoinCnt = new ChallDao().selectMyJoinCount(conn, userId);

		close(conn);

		return myjoinCnt;
	}

	// 찜 갯수 카운트
	public int selectHitsCount(int challNo) {
		Connection conn = getConnection();
		int hits = new ChallDao().selectHitsCount(conn, challNo);
		
		close(conn);
		
		return hits;

	}
	
	// 내가 모집한 챌린지 조회
	public ArrayList<Challenge> selectMyJoinList(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Challenge> list = new ChallDao().selectMyJoinList(conn, userId);
		
		//System.out.println("내가 모집한 챌린지 조회: " + list);
		
		close(conn);
		
		return list;
	}

	// 챌린지 게시물 수정
	public int updateChall(Challenge ch) {
		Connection conn = getConnection();
		
		int result = new ChallDao().updateChall(conn, ch);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 챌린지 게시물 삭제 (챌린지 'N' -> 'Y' 업데이트) 
	public int deleteChall(int challNo) {
		Connection conn = getConnection();
		
		int result = new ChallDao().deleteChall(conn, challNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
/*	// 게시물 삭제 여부 상태 가져오기 
	public String getChallStatus(int challNo) {
		Connection conn = getConnection();

		String challStatus = new ChallDao().getChallStatus(conn, challNo);
		
		close(conn);

		return challStatus;
	}*/
	

//	//user_id가 cno에 참여중인지 확인
//	public int CheckJoin(String user_id, int cno) {
//		Connection conn = getConnection();
//		
//		int result = new ChallDao().CheckJoin(conn, user_id, cno);
//		
//		close(conn);
//		
//		return result;
//	}
//	
	//신고받은 게시물 비활성화 시키기
	public int disabledPost(int cer_id) {
		Connection conn = getConnection();

		int result = new ChallDao().disabledPost(conn, cer_id);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		
		return result;
	}
	

}