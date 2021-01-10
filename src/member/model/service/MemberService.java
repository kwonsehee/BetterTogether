package member.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

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
	

}
