package member.model.vo;

import java.sql.Date;

public class Member {
	/*
	USER_ID	VARCHAR2(20 BYTE)
	NICKNAME	VARCHAR2(20 BYTE)
	USER_PWD	VARCHAR2(20 BYTE)
	PHONE	VARCHAR2(20 BYTE)
	EMAIL	VARCHAR2(20 BYTE)
	CHALL	VARCHAR2(20 BYTE)
	JOIN_DATE	DATE
	MODIFY_DATE	DATE
	MEMBER_TYPE	NUMBER
	WRITE_ACTIVE	CHAR(1 BYTE)
	USER_CATE	NUMBER
		*/

	private String userId;
	private String userPwd;
	private String nickName;
	private String phone;
	private String email;
	private String name;
	private Date joinDate;
	private Date modifyDate;
	private int membertype;
	private String writer_active;
	private int user_cate;
	private int point;
	private int reported;
	
	public Member() {
		
	}
	// 메인 챌린저 top 10 리스트에 useungh222rId만 필요
	public Member(String userId) {
		super();
		this.userId = userId;
	}
	public Member(String userId, int user_cate) {
		super();
		this.userId = userId;
		this.user_cate = user_cate;
	}

	public Member(String userId, Date joinDate) {
		super();
		this.userId = userId;
		this.joinDate = joinDate;
	}
	public Member(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}
	
	
	public Member(String userId, String userPwd, String nickName, String phone, String email, int user_cate, String name) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.nickName = nickName;
		this.phone = phone;
		this.email = email;
		this.user_cate=user_cate;
		this.name=name;
	}
	
	public Member(String userId, String userPwd, String nickName, String phone, String email, Date joinDate,
			Date modifyDate, int membertype, int user_cate, int point) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.nickName = nickName;
		this.phone = phone;
		this.email = email;
		this.joinDate = joinDate;
		this.modifyDate = modifyDate;
		this.membertype = membertype;
		this.user_cate=user_cate;
		this.point = point;
	}
	
	public Member(String userId, String userPwd, String nickName, String phone, String email, Date joinDate,
			Date modifyDate, int membertype, String writer_active) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.nickName = nickName;
		this.phone = phone;
		this.email = email;
		this.joinDate = joinDate;
		this.modifyDate = modifyDate;
		this.membertype = membertype;
		this.writer_active = writer_active;
	}
	
	public Member(String userId, String nickName, String phone, String email, int user_cate) {
		super();
		this.userId = userId;
		this.nickName = nickName;
		this.phone = phone;
		this.email = email;
		this.user_cate = user_cate;
	}
	
	
	public Member(String userId, String userPwd, String nickName, String phone, String email, Date joinDate,
			Date modifyDate, int membertype, String writer_active, int user_cate) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.nickName = nickName;
		this.phone = phone;
		this.email = email;
		this.joinDate = joinDate;
		this.modifyDate = modifyDate;
		this.membertype = membertype;
		this.writer_active = writer_active;
		this.user_cate = user_cate;
	}
	
	public Member(String userId, String userPwd, String nickName, String phone, String email, Date joinDate,
			Date modifyDate, int membertype, String writer_active, int user_cate, int point) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.nickName = nickName;
		this.phone = phone;
		this.email = email;
		this.joinDate = joinDate;
		this.modifyDate = modifyDate;
		this.membertype = membertype;
		this.writer_active = writer_active;
		this.user_cate = user_cate;
		this.point = point;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public int getMembertype() {
		return membertype;
	}
	public void setMembertype(int membertype) {
		this.membertype = membertype;
	}

	public String getWriter_active() {
		return writer_active;
	}
	public void setWriter_active(String writer_active) {
		this.writer_active = writer_active;
	}
	public int getUser_cate() {
		return user_cate;
	}
	public void setUser_cate(int user_cate) {
		this.user_cate = user_cate;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getReported() {
		return reported;
	}

	public void setReported(int reported) {
		this.reported = reported;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userPwd=" + userPwd + ", nickName=" + nickName + ", phone=" + phone
				+ ", email=" + email + ", name=" + name + ", joinDate=" + joinDate + ", modifyDate=" + modifyDate
				+ ", membertype=" + membertype + ", writer_active=" + writer_active + ", user_cate=" + user_cate
				+ ", point=" + point + ", reported=" + reported + "]";
	}

	
	

}
