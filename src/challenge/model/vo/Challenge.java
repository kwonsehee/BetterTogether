package challenge.model.vo;

import java.sql.Date;

public class Challenge {

	/*
	 * CHALL_NO NUMBER CHALL_TITLE VARCHAR2(100 BYTE) CHALL_PEOPLE NUMBER CHALL_DATE
	 * DATE CHALL_HITS NUMBER FILE_PATH VARCHAR2(1000 BYTE) CHALL_CONFIRM
	 * VARCHAR2(1000 BYTE) CHALL_FREQUENCY VARCHAR2(100 BYTE) CHALL_PERIOD
	 * VARCHAR2(100 BYTE) CHALL_PAYMENT NUMBER CHALL_CONTENT VARCHAR2(2000 BYTE)
	 * CHALL_COUNT NUMBER USER_ID VARCHAR2(20 BYTE) CATE_ID NUMBER CHALL_CNT NUMBER
	 * CHALL_START DATE
	 */

	private int challNo; // 챌린지 번호
	private String challTitle; // 챌린지 제목
	private int challPeople; // 모집 인원수
	private Date challDate; // 작성일
	private String challFile; // 챌린지 개설 사진 (첨부파일 경로)
	private String challConfirm; // 인증 방법
	private String challFrequency; // 인증 빈도
	private String challPeriod; // 챌린지 기간
	private int challPay; // 참가비
	private String challContent; // 챌린지 소개
	private int confirmCnt; // 총 인증 갯수
	private String userId; // user_id 참조값
	// user_id가 아닌 USER_INFO 조인 결과 NICKNAME으로 선언 ..
	private String nickName; // 회원 이름
	// cateId가 아닌 CHALL_CATEGORY 조인 결과 CATE_NAME로 선언 ..
	private int cateId;// 카테고리 선택시 이동화면에 필요***********
	private String cateName; // 카테고리 이름
	private int challCnt; // 조회수
	private Date challStart; // 챌린지 시작일
	private int challStatus; // 챌린지 게시물 삭제 여부 

	public Challenge() {
	}
	
	public Challenge(int challNo, String challTitle, int challPeople, Date challDate, String challFile,
			String challConfirm, String challFrequency, String challPeriod, int challPay, String challContent,
			int confirmCnt, String userId, String nickName, int cateId, String cateName, int challCnt,
			Date challStart,int challStatus) {
		super();
		this.challNo = challNo;
		this.challTitle = challTitle;
		this.challPeople = challPeople;
		this.challDate = challDate;
		this.challFile = challFile;
		this.challConfirm = challConfirm;
		this.challFrequency = challFrequency;
		this.challPeriod = challPeriod;
		this.challPay = challPay;
		this.challContent = challContent;
		this.confirmCnt = confirmCnt;
		this.userId = userId;
		this.nickName = nickName;
		this.cateId = cateId;
		this.cateName = cateName;
		this.challCnt = challCnt;
		this.challStart = challStart;
		this.challStatus = challStatus;
	}

	public Challenge(int challNo, String challTitle, int challPeople, Date challDate, String challFile,
			String challConfirm, String challFrequency, String challPeriod, int challPay, String challContent,
			int confirmCnt, String nickName, String cateName, int challCnt, Date challStart) {
		super();
		this.challNo = challNo;
		this.challTitle = challTitle;
		this.challPeople = challPeople;
		this.challDate = challDate;
		this.challFile = challFile;
		this.challConfirm = challConfirm;
		this.challFrequency = challFrequency;
		this.challPeriod = challPeriod;
		this.challPay = challPay;
		this.challContent = challContent;
		this.confirmCnt = confirmCnt;
		this.nickName = nickName;
		this.cateName = cateName;
		this.challCnt = challCnt;
		this.challStart = challStart;
	}
	
	public Challenge(int challNo, String challTitle, int challPeople, Date challDate, String challFile,
			String challConfirm, String challFrequency, String challPeriod, int challPay, String challContent,
			int confirmCnt, String nickName, String userId, String cateName, int challCnt, Date challStart) {
		super();
		this.challNo = challNo;
		this.challTitle = challTitle;
		this.challPeople = challPeople;
		this.challDate = challDate;
		this.challFile = challFile;
		this.challConfirm = challConfirm;
		this.challFrequency = challFrequency;
		this.challPeriod = challPeriod;
		this.challPay = challPay;
		this.challContent = challContent;
		this.confirmCnt = confirmCnt;
		this.nickName = nickName;
		this.userId = userId;
		this.cateName = cateName;
		this.challCnt = challCnt;
		this.challStart = challStart;
	}

	// 챌린지 개설
	public Challenge(String challTitle, String cateName, String challFile, String challConfirm, String challFrequency,
			String challPeriod, Date challStart, int challPay, int challPeople, String challContent, int confirmCnt,
			String userId) {
		super();
		this.challTitle = challTitle;
		this.cateName = cateName;
		this.challFile = challFile;
		this.challConfirm = challConfirm;
		this.challFrequency = challFrequency;
		this.challPeriod = challPeriod;
		this.challStart = challStart;
		this.challPay = challPay;
		this.challPeople = challPeople;
		this.challContent = challContent;
		this.confirmCnt = confirmCnt;
		this.userId = userId;
	}
	
	// 커뮤니티 슬라이드 인기 챌린지 조회용
	public Challenge(int challNo, String challTitle, String challFile, String challFrequency,String challPeriod, Date challStart) {
		super();
		this.challNo = challNo;
		this.challTitle = challTitle;
		this.challFile = challFile;
		this.challFrequency = challFrequency;
		this.challPeriod = challPeriod;
		this.challStart = challStart;
	}

	// 카테고리 선택시 이동하는 화면에 필요
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

	public String getChallTitle() {
		return challTitle;
	}

	public void setChallTitle(String challTitle) {
		this.challTitle = challTitle;
	}

	public int getChallPeople() {
		return challPeople;
	}

	public void setChallPeople(int challPeople) {
		this.challPeople = challPeople;
	}

	public Date getChallDate() {
		return challDate;
	}

	public void setChallDate(Date challDate) {
		this.challDate = challDate;
	}


	public String getChallFile() {
		return challFile;
	}

	public void setChallFile(String challFile) {
		this.challFile = challFile;
	}

	public String getChallConfirm() {
		return challConfirm;
	}

	public void setChallConfirm(String challConfirm) {
		this.challConfirm = challConfirm;
	}

	public String getChallFrequency() {
		return challFrequency;
	}

	public void setChallFrequency(String challFrequency) {
		this.challFrequency = challFrequency;
	}

	public String getChallPeriod() {
		return challPeriod;
	}

	public void setChallPeriod(String challPeriod) {
		this.challPeriod = challPeriod;
	}

	public int getChallPay() {
		return challPay;
	}

	public void setChallPay(int challPay) {
		this.challPay = challPay;
	}

	public String getChallContent() {
		return challContent;
	}

	public void setChallContent(String challContent) {
		this.challContent = challContent;
	}

	public int getConfirmCnt() {
		return confirmCnt;
	}

	public void setConfirmCnt(int confirmCnt) {
		this.confirmCnt = confirmCnt;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public int getChallCnt() {
		return challCnt;
	}

	public void setChallCnt(int challCnt) {
		this.challCnt = challCnt;
	}

	public Date getChallStart() {
		return challStart;
	}

	public void setChallStart(Date challStart) {
		this.challStart = challStart;
	}

	public int getCateId() {
		return cateId;
	}

	public void setCateId(int cateId) {
		this.cateId = cateId;
	}
	
	public int getChallStatus() {
		return challStatus;
	}

	public void setChallStatus(int challStatus) {
		this.challStatus = challStatus;
	}

	@Override
	public String toString() {
		return "Challenge [challNo=" + challNo + ", challTitle=" + challTitle + ", challPeople=" + challPeople
				+ ", challDate=" + challDate + ", challFile=" + challFile + ", challConfirm=" + challConfirm
				+ ", challFrequency=" + challFrequency + ", challPeriod=" + challPeriod + ", challPay=" + challPay
				+ ", challContent=" + challContent + ", confirmCnt=" + confirmCnt + ", userId=" + userId + ", nickName="
				+ nickName + ", cateId=" + cateId + ", cateName=" + cateName + ", challCnt=" + challCnt
				+ ", challStart=" + challStart + ", challStatus=" + challStatus + "]";
	}

	


}