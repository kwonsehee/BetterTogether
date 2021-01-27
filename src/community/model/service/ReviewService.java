package community.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import challenge.model.vo.Challenge;
import common.model.vo.PageInfo;
import community.model.dao.ReviewDao;
import community.model.vo.Review;

public class ReviewService {
	// loginUser가 참여했던 챌린지 조회
		public ArrayList<Challenge> selectJoinedList(String userId) {
			Connection conn = getConnection();
			ReviewDao rd = new ReviewDao();
			
			ArrayList<Challenge> cList = rd.selectJoinedList(conn,userId);
			
			close(conn);
			
			return cList;
		}

	
	// 댓글 추가 + 새로 갱신 된 댓글 리스트 조회
	public ArrayList<Review> insertReview(Review r) {
		Connection conn = getConnection();
		ReviewDao rd = new ReviewDao();
		int result = rd.insertReview(conn, r);
		
		ArrayList<Review> rList = null;
		
		if(result > 0) {
			commit(conn);
			rList = rd.selectReviewList(conn, r.getrId());
		} else {
			rollback(conn);
		}
		
		return rList;
	}

	// 리뷰 전체 리스트 조회
	public ArrayList<Review> selectReviewList(PageInfo pi) {
		Connection conn = getConnection();
		ReviewDao rd = new ReviewDao();
		ArrayList<Review> rList = null;
		
		rList = rd.selectTotalReviewList(conn, pi);
		
		close(conn);
		
		//System.out.println("service rList : " + rList);
		
		return rList;
	}

	// 게시글 총 갯수 구하기
	public int getListCount() {
		Connection conn = getConnection();

		int listCount = new ReviewDao().getListCount(conn);

		close(conn);

		return listCount;
		
	}

	
}
