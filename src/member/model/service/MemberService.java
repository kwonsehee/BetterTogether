package member.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import community.model.dao.BoardDao;
import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {

	//1. 로그인용 서비스 메소드
	public Member loginMember(Member m) {
		// JDBCTemplate 작성하여 DB Connection 가져오기
		Connection conn=getConnection();
		
		Member loginUser  = new MemberDao().loginMember(conn,m);
		
		close(conn);
		
		return loginUser;
	}

	//2. 회원가입용 서비스 메소드
	public int insertMember(Member mem) {
		// JDBCTemplate 작성하여 DB Connection 가져오기
		Connection conn=getConnection();
		
		int result = new MemberDao().insertMember(conn,mem);
		
		if(result>0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	//3. 회원정보 수정용 서비스 메소드
	public Member updateMember(Member m) {
		// JDBCTemplate 작성하여 DB Connection 가져오기
		Connection conn=getConnection();
		
		Member updateMember = null;
		//1. 수정하려는 정보가 담긴 member 객체를 가지고 updateMember 수행
		int result = new MemberDao().updateMember(conn,m);
		
		//2. 수정이 잘 되었다면 수정 된 정보의 member객체 select 후 리턴
		if(result >0) {
			updateMember = new MemberDao().selectMember(conn, m.getUserId());
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return updateMember;
	}
	//4. 비밀번호 변경용 서비스
		public Member updatePwd(String userId, String userPwd, String newPwd) {
			Connection conn = getConnection();
			Member updateMember = null;
			
			int result = new MemberDao().updatePwd(conn, userId, userPwd, newPwd);
			
			
			// 2. 수정이 잘 되었다면 수정 된 정보의 member객체 select 후 리턴
			if (result > 0) {
				updateMember = new MemberDao().selectMember(conn, userId);
				commit(conn);
			} else {
				rollback(conn);
			}
			close(conn);
			
			return updateMember;
		}

		//5. 회원 탈퇴 서비스 메소드
		public int deleteMember(String userId) {
			Connection conn=getConnection();
			
			int result = new MemberDao().deleteMember(conn, userId);
			
			// 2. 수정이 잘 되었다면 수정 된 정보의 member객체 select 후 리턴
			if (result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			close(conn);
					
			
			return result;
		}

		//카테고리 변경 메소드 
		public Member updateCateMember(Member m) {
			Connection conn=getConnection();

			Member updateMember = null;
			int result  = new MemberDao().updateCateMember(conn,m);
			
			//2. 수정이 잘 되었다면 수정 된 정보의 member객체 select 후 리턴
			if(result >0) {
				updateMember = new MemberDao().selectMember(conn, m.getUserId());
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			
			return updateMember;
		}

		//환불 후 포인트 변경 

		public Member updatePoint(int point, Member m) {
			Connection conn=getConnection();

			Member updateMember = null;
			
			//point 변경
			int result  = new MemberDao().updatePoint(conn, point, m);
			
			//2. 수정이 잘 되었다면 수정 된 정보의 member객체 select 후 리턴
			if(result >0) {
				updateMember = new MemberDao().selectMember(conn, m.getUserId());
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			
			return updateMember;
		}

		//중복아이디체크
		public int idCheck(String userId) {
			Connection conn=getConnection();	
			
			int result = new MemberDao().idCheck(conn, userId);
			
			
			close(conn);
					
			
			return result;
		
		}

		public int processUserReported(int rNo) {
			Connection conn=getConnection();
			
			int result = new MemberDao().processUserReported(conn, rNo);
			
			// 2. 수정이 잘 되었다면 수정 된 정보의 member객체 select 후 리턴
			if (result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			close(conn);
					
			
			return result;
		}

		//챌린지 결과보기에서 상금받기 버튼 클릭시 유저point 증가
		public int payback(String userId, int money) {
			Connection conn=getConnection();
			
			//point 변경
			int result  = new MemberDao().payback(conn, userId, money);
			
			//2. 수정이 잘 되었다면 수정 된 정보의 member객체 select 후 리턴
			if(result >0) {
			
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			
			return result;
		}

		//userId에 맞는 유저를 select
		public Member selectMember(String userId) {
			Connection conn=getConnection();

			Member updateMember = new MemberDao().selectMember(conn,userId);
			
			close(conn);
			
			return updateMember;
		}

		//챌린지 삭제시 금액 환불해주기 
		public int refundMoney(int challNo) {
			Connection conn=getConnection();
			
			//point 변경
			int result  = new MemberDao().refundMoney(conn,challNo);
			
		
			if(result >0) {
			
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			
			return result;
		}

		public int totalCount() {
			// TODO Auto-generated method stub
			return 0;
		}

		public int todayJoinCount() {
			Connection conn = getConnection();

			int todayJoinCount = new MemberDao().todayJoinCount(conn);

			close(conn);

			return todayJoinCount;
		}

		//아이디 찾기 
		public ArrayList<Member> getId(Member m) {
			Connection conn = getConnection();

			ArrayList<Member> getId = new MemberDao().getId(conn, m);

			close(conn);
			System.out.println("service 아이디찾기 :"+getId);
			return getId;
		}

		//비밀번호 찾기
		public String getPwd(Member m) {
			Connection conn = getConnection();

			String pwd = new MemberDao().getPwd(conn, m);

			close(conn);
			System.out.println("service 비밀번호찾기 :"+pwd);
			return pwd;
		}

		



}
