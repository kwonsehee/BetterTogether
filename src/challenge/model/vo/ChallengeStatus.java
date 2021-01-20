package challenge.model.vo;

import java.sql.Date;

public class ChallengeStatus {
//	USER_ID	VARCHAR2(20 BYTE)
//	CHALL_NO	NUMBER
//	CHALL_STATUS	NUMBER
//	JOIN_CALL_DATE	DATE
//	C_HITS	VARCHAR2(10 BYTE)
	
	
	private String userId;
	private int challNo;
	private int challStatus;
	private Date joinChall;
	private String cHits;
	
	public ChallengeStatus() {}
	
	public ChallengeStatus(String userId, int challNo, int challStatus, Date joinChall, String cHits) {
		super();
		this.userId = userId;
		this.challNo = challNo;
		this.challStatus = challStatus;
		this.joinChall = joinChall;
		this.cHits = cHits;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getChallNo() {
		return challNo;
	}

	public void setChallNo(int challNo) {
		this.challNo = challNo;
	}

	public int getChallStatus() {
		return challStatus;
	}

	public void setChallStatus(int challStatus) {
		this.challStatus = challStatus;
	}

	public Date getJoinChall() {
		return joinChall;
	}

	public void setJoinChall(Date joinChall) {
		this.joinChall = joinChall;
	}

	public String getcHits() {
		return cHits;
	}

	public void setcHits(String cHits) {
		this.cHits = cHits;
	}

	@Override
	public String toString() {
		return "ChallengeStatus [userId=" + userId + ", challNo=" + challNo + ", challStatus=" + challStatus
				+ ", joinChall=" + joinChall + ", cHits=" + cHits + "]";
	}
	
	

}
