 package studycafe.model.vo;
 
public class Cafe {

	private int cafe_code;    // 카페코드 명
	private String cafe_oh;  //카페 오픈시간
	private String cafe_name;  //카페이름		
	private String cafe_area; //카페지역 
	private String cafe_phone; // 카페  전화번호 
	private String cafe_capacity; //카페 최대수용인원  
	private String cafe_notice;  //카페 공지글
	private String cafe_info; //카페 소개글 
	private String cafe_photo; //카페 사진 
	private String AFFILIATED_CAFE; //제휴정보(/일반게시판 , 제휴 게시판) 
	private String cafe_map; //카페 약도
	private String detail_address;  //카페 상세주소
	private String closed_day; // 카페 휴무일
	private String cafe_page; //카페 홈페이지 
	private String UserId;    // 유저 아이디
	
	
	public  Cafe() {}


	public Cafe(int cafe_code, String cafe_oh, String cafe_name, String cafe_area, String cafe_phone,
			String cafe_capacity, String cafe_notice, String cafe_info, String cafe_photo, String aFFILIATED_CAFE,
			String cafe_map, String detail_address, String closed_day, String cafe_page, String userId) {
		super();
		this.cafe_code = cafe_code;
		this.cafe_oh = cafe_oh;
		this.cafe_name = cafe_name;
		this.cafe_area = cafe_area;
		this.cafe_phone = cafe_phone;
		this.cafe_capacity = cafe_capacity;
		this.cafe_notice = cafe_notice;
		this.cafe_info = cafe_info;
		this.cafe_photo = cafe_photo;
		AFFILIATED_CAFE = aFFILIATED_CAFE;
		this.cafe_map = cafe_map;
		this.detail_address = detail_address;
		this.closed_day = closed_day;
		this.cafe_page = cafe_page;
		UserId = userId;
	}


	public Cafe(String cafe_oh, String cafe_name, String cafe_area, String cafe_phone, String cafe_capacity,
			String cafe_notice, String cafe_info, String cafe_photo, String aFFILIATED_CAFE, String cafe_map,
			String detail_address, String closed_day, String cafe_page, String userId) {
		super();
		this.cafe_oh = cafe_oh;
		this.cafe_name = cafe_name;
		this.cafe_area = cafe_area;
		this.cafe_phone = cafe_phone;
		this.cafe_capacity = cafe_capacity;
		this.cafe_notice = cafe_notice;
		this.cafe_info = cafe_info;
		this.cafe_photo = cafe_photo;
		AFFILIATED_CAFE = aFFILIATED_CAFE;
		this.cafe_map = cafe_map;
		this.detail_address = detail_address;
		this.closed_day = closed_day;
		this.cafe_page = cafe_page;
		UserId = userId;
	}


	public int getCafe_code() {
		return cafe_code;
	}


	public void setCafe_code(int cafe_code) {
		this.cafe_code = cafe_code;
	}


	public String getCafe_oh() {
		return cafe_oh;
	}


	public void setCafe_oh(String cafe_oh) {
		this.cafe_oh = cafe_oh;
	}


	public String getCafe_name() {
		return cafe_name;
	}


	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}


	public String getCafe_area() {
		return cafe_area;
	}


	public void setCafe_area(String cafe_area) {
		this.cafe_area = cafe_area;
	}


	public String getCafe_phone() {
		return cafe_phone;
	}


	public void setCafe_phone(String cafe_phone) {
		this.cafe_phone = cafe_phone;
	}


	public String getCafe_capacity() {
		return cafe_capacity;
	}


	public void setCafe_capacity(String cafe_capacity) {
		this.cafe_capacity = cafe_capacity;
	}


	public String getCafe_notice() {
		return cafe_notice;
	}


	public void setCafe_notice(String cafe_notice) {
		this.cafe_notice = cafe_notice;
	}


	public String getCafe_info() {
		return cafe_info;
	}


	public void setCafe_info(String cafe_info) {
		this.cafe_info = cafe_info;
	}


	public String getCafe_photo() {
		return cafe_photo;
	}


	public void setCafe_photo(String cafe_photo) {
		this.cafe_photo = cafe_photo;
	}


	public String getAFFILIATED_CAFE() {
		return AFFILIATED_CAFE;
	}


	public void setAFFILIATED_CAFE(String aFFILIATED_CAFE) {
		AFFILIATED_CAFE = aFFILIATED_CAFE;
	}


	public String getCafe_map() {
		return cafe_map;
	}


	public void setCafe_map(String cafe_map) {
		this.cafe_map = cafe_map;
	}


	public String getDetail_address() {
		return detail_address;
	}


	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}


	public String getClosed_day() {
		return closed_day;
	}


	public void setClosed_day(String closed_day) {
		this.closed_day = closed_day;
	}


	public String getCafe_page() {
		return cafe_page;
	}


	public void setCafe_page(String cafe_page) {
		this.cafe_page = cafe_page;
	}


	public String getUserId() {
		return UserId;
	}


	public void setUserId(String userId) {
		UserId = userId;
	}


	@Override
	public String toString() {
		return "Cafe [cafe_code=" + cafe_code + ", cafe_oh=" + cafe_oh + ", cafe_name=" + cafe_name + ", cafe_area="
				+ cafe_area + ", cafe_phone=" + cafe_phone + ", cafe_capacity=" + cafe_capacity + ", cafe_notice="
				+ cafe_notice + ", cafe_info=" + cafe_info + ", cafe_photo=" + cafe_photo + ", AFFILIATED_CAFE="
				+ AFFILIATED_CAFE + ", cafe_map=" + cafe_map + ", detail_address=" + detail_address + ", closed_day="
				+ closed_day + ", cafe_page=" + cafe_page + ", UserId=" + UserId + "]";
	}
	
	
	
	
	
}
