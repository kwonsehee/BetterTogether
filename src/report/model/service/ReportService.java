package report.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import challenge.model.dao.ChallDao;
import challenge.model.service.ChallService;
import common.model.vo.PageInfo;
import community.model.service.BoardService;
import confirm.model.service.CerService;
import member.model.dao.MemberDao;
import member.model.service.MemberService;
import news.model.dao.NewsDao;
import news.model.service.NewsService;
import refund.model.dao.HistoryDao;
import refund.model.service.HistoryService;
import report.model.dao.ReportDao;
import report.model.vo.Report;
import studycafe.model.service.CafeService;

public class ReportService {

	//인증신고
	public int insertConfirmReport(Report r, int no) {
		Connection conn=getConnection();
		int result = new ReportDao().insertConfirmReport(conn,r, no);
		
		if(result>0) {	
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int insertChallReport(Report r, int no) {
		Connection conn=getConnection();
		int result = new ReportDao().insertChallReport(conn,r, no);
		
		if(result>0) {	
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	

	public int insertBoardReport(Report r, int no) {
		Connection conn=getConnection();
		int result = new ReportDao().insertBoardReport(conn,r, no);
		
		if(result>0) {	
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int insertCafeReport(Report r, int no) {
		Connection conn=getConnection();
		int result = new ReportDao().insertCafeReport(conn,r, no);
		
		if(result>0) {	
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 게시글 총 갯수 구하기
		public int getListCount() {
			Connection conn = getConnection();
			
			int listCount = new ReportDao().getListCount(conn);
			
			close(conn);
			
			return listCount;
		}

		// 신고페이징뷰
		public ArrayList<Report> selectList(PageInfo pi) {
			Connection conn = getConnection();

			ArrayList<Report> list = new ReportDao().selectList(conn, pi);

			close(conn);
				
			return list;
		}

		public Report selectReport(int rNo) {
			Connection conn = getConnection();

			Report r = new ReportDao().selectReport(conn, rNo);

			close(conn);

			return r;
		}

		public int getMyListCount(String userId) {
			Connection conn = getConnection();
			
			int listCount = new ReportDao().getMyListCount(conn, userId);
			
			close(conn);
			
			return listCount;
		}
		
		public int getreportedMyListCount(String userId) {
			Connection conn = getConnection();
			
			int listCount = new ReportDao().getreportedMyListCount(conn, userId);
			
			close(conn);
			
			return listCount;
		}
		

		public ArrayList<Report> selectMyList(String userId, PageInfo pi) {
			Connection conn = getConnection();

			ArrayList<Report> list = new ReportDao().selectMyList(conn, userId, pi);

			close(conn);
			 System.out.println("신고한 내역 : " + list);
				
			return list;
		}

		//신고내역 삭제
		public int deleteReport(int rNo) {
			Connection conn = getConnection();
			
			int result = new ReportDao().deleteReport(conn,rNo);
			
			if(result>0) {	
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			
			return result;
		}

		//신고처리
		public int processReport(int rNo) {
			Connection conn = getConnection();
			
			int result = new ReportDao().processReport(conn,rNo);
			
			if(result>0) {	
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			
			return result;
		}

		//신고 게시물 비활성화 시키기
		public int disabledPost(int rNo) {
			Connection conn = getConnection();
			int result = 0;
			
			//신고 게시물 가져오기
			Report r = new ReportDao().disabledGetPost(conn,rNo);
			System.out.println("신고될 게시물 : "+r);
			
			//신고게시물 비활성화시키기
			if(r.getBoard_seq()!=0) {//자유게시판 신고
				result = new BoardService().disabledPost(r.getBoard_seq());
			}else if(r.getCafe_code()!=0) {//카페 신고 
				result = new CafeService().disabledPost(r.getCafe_code());
			}else if(r.getCer_id()!=0) {// 인증 신고
				result = new CerService().disabledPost(r.getCer_id());
			}else if(r.getChall_no()!=0) {// 챌린지모집 신고
				
				result = new ChallService().disabledPost(r.getChall_no());
				if(result>0) {
					//챌린지에 참여하고 있는 유저 환급 
					// 게시물 삭제 성공한 경우
					// 참여중인 인원들 모두 환불 시키기
					int result1 = new MemberDao().refundMoney(conn,r.getChall_no());
					
					//거래 내역 디비에 환급된거 넣어주기
					int result2 = new HistoryDao().refundChall(conn,r.getChall_no());
					//삭제당한 인원들이 로그인시 확인가능하도록 news디비에 정보 넣기
					int result3 = new NewsDao().insertChall(conn,r.getChall_no());
					
					// chall_status 디비에 chall_status 1을 0으로 변경
					int result4 =new ChallDao().deleteChallStatus(conn, r.getChall_no());
					
					if(result1>0&&result2>0&&result3>0&&result4>0) {
						result = result1;
					}else {
						result = 0;
					}
				}
				
			}
			close(conn);
			
			return result;
		}

		//내가 신고 당한 내역
		public ArrayList<Report> selectreportedMyList(String userId,PageInfo pi) {
			Connection conn = getConnection();

			ArrayList<Report> list = new ReportDao().selectreportedMyList(conn, userId, pi);

			close(conn);
			 System.out.println("신고당한 내역: " + list);
				
			return list;
		}

		public int totalCount() {
			Connection conn = getConnection();
			
			int totalCount = new ReportDao().totalCount(conn);
			
			close(conn);
			
			return totalCount;
		}

		public ArrayList<Report> ReportNew() {
			Connection conn = getConnection();

			ArrayList<Report> list = new ReportDao().ReportNew(conn);

			close(conn);
				
			return list;
		}
}
