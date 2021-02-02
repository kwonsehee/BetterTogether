package notice.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import common.model.vo.PageInfo;
import common.model.vo.Search;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

public class NoticeService {
	Notice n = new Notice();
	
	//1. 공지사항 리스트 조회용 서비스
	public ArrayList<Notice> selectList() {
		Connection conn = getConnection();
		ArrayList<Notice>list=new NoticeDao().selectList(conn);
		
		close(conn);
		
		return list;
	}
	
	//1_1. 페이징 처리가 된 게시글 목록 조회
		public ArrayList<Notice> selectList(PageInfo pi) {
			Connection conn = getConnection();
			
			ArrayList<Notice> list = new NoticeDao().selectList(conn, pi);
			
			close(conn);
			
			return list;
		}
	//2. 공지사항 글 작성용 서비스
		public int insertNotice(Notice n) {
			Connection conn=getConnection();
			int result = new NoticeDao().insertNotice(conn,n );
			
			if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return result;
		}

		//3. 공지사항 상세 보기 서비스
		public Notice selectNotice(int ano) {
			Connection conn = getConnection();
			
			//1. 조회수 증가
			int result = new NoticeDao().increaseCount(conn,ano);
			
			//2. 해당 게시글 조회
			if(result >0) {
				n = new NoticeDao().selectNotice(conn,ano);
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return n;
		}

		//4. 공지사항 삭제 서비스
		public int deleteNotice(int ano) {
			Connection conn = getConnection();
			
			int result = new NoticeDao().deleteNotice(conn,ano);
			
			if(result >0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			
			return result;
		}
		//5. 공지사항 게시글 1건 조회(조회수 증가 없이)
		public Notice selectNotice2(int ano) {
			Connection conn = getConnection();
			
			Notice n = new NoticeDao().selectNotice(conn, ano);
			
			close(conn);
			
			 return n;
		}

		//6. 공지사항 수정
		public int updateNotice(Notice n) {
			Connection conn = getConnection();
			
			int result = new NoticeDao().updateNotice(conn, n);
			
			if(result >0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			
			return result;
		}
	
		//검색어와 관련된 공지사항 선택
		public ArrayList<Notice> selectList(String search, String searchCondition) {
			Connection conn = getConnection();
			
			ArrayList<Notice>list = new NoticeDao().selectList(conn, search, searchCondition);
			
			close(conn);
			
			return list;
		}
		//seach 객체 생성 해서 검색어와 관련된 공지사항 선택하기
		public ArrayList<Notice> selectList(Search s) {
			Connection conn = getConnection();
			
			ArrayList<Notice>list = new NoticeDao().selectList(conn, s);
			
			close(conn);
			
			return list;
		}
		//게시글 총 갯수 구하기
		public int getListCount() {
			Connection conn = getConnection();
			
			int listCount = new NoticeDao().getListCount(conn);
			
			close(conn);
			
			return listCount;
		}

		//검색용 리스트 카운트
		public int getSearchListCount(Search s) {
			Connection conn=getConnection();
			int listCount = new NoticeDao().getSearchListCount(conn, s);
			
			close(conn);

			return listCount;
		}
		//검색용 리스트 조회
		public ArrayList<Notice> selectSearchList(PageInfo pi, Search s) {
			Connection conn=getConnection();
			ArrayList<Notice>list = new NoticeDao().selectSearchList(conn, pi, s);

			close(conn);
			
			return list;
		}

		public int totalCount() {
			Connection conn = getConnection();
			
			int totalCount = new NoticeDao().totalCount(conn);
			
			close(conn);
			
			return totalCount;
		}
		
	
}
