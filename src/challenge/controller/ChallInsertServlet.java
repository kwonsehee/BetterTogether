package challenge.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import challenge.model.service.ChallService;
import challenge.model.vo.Challenge;
import common.MyFileRenamePolicy;
import member.model.vo.Member;

/**
 * Servlet implementation class ChallInsertServlet
 */
@WebServlet("/chall/insert")
public class ChallInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChallInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      //->form 전송시 enctype을 multipart/form-data로 전송하는 경우
      // 기존 방식으로 request.getParameter("name속성값")와 같이값을 추출할수 없음
      //com.orelilly.servlet의 약자로 cos.jar
      
      
  	//enctype이 multipart/form-data로 전송 되었는지 확인
		if(ServletFileUpload.isMultipartContent(request)) {
			//전송 파일 용량 제한 : 10Mbyte로 제한
			int maxSize  = 1024*1024*10;
			
			//웹 서버 컨테이너 경로 추출
			String root= request.getSession().getServletContext().getRealPath("/");
			System.out.println("root: "+ root);
		
			//파일이 실제로 저장 될 경로
			String savePath = root+"resources\\uploadFiles\\";
			
			//httpServletRequest-->MultipartRequest 변경
//			MultipartRequest multiRequest =new MultipartRequest(request, savePath,
//					maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
			//위의 MultipartRequest 객체 생성과 동시에 업로드한 파일들이 서버에 업로드된다.
			//즉, 이후 프로세스에 문제가 있던 없던 우선 서버에 업로드가 되므로
			//추후 프로세스에서 문제가 생길 경우 업로드 된 파일을 삭제할 것
			
			//사용자가 올린 파일명을 그대로 저장할 경우 같은 파일명이 있을 경우 이전 파일을 덮어쓰거나
			//한글 파일명 특수기호 띄어쓰기 등은 서버에 따라 문제가 생길 수 있어
			//파일명을 수정하여 저장하는 것이 일반적
			//defaultFileRenamePplicy는 cos.jar가 제공하는 클래스로
			//같은 파일명이 있을 경우 파일명 뒤에 카운팅된 숫자를 붙여줌
			// user.png라는 파일을 저장하려고하는데 이미 있으면 user1.png로 저장해줌
			// user1.png도 있으면 user2.png로 저장해준다.
			MultipartRequest multiRequest =new MultipartRequest(request, savePath,
					maxSize, "UTF-8", new MyFileRenamePolicy());
			//multipartRequest객체가 생성되는 순간 전달 된 매개변수에 맞게
			//(MyFileRenamePolicy에서 정의한 파일 리네임 규칙, 저장경로, 용량제한등)
			//파일이 서버에 저장됨
			
			//db의 board와 attachment에 데이터 저장
			
			//bd에 저장하기 위해 change_name과 origin_name 각각의 리스트를 만들어주는 작업
			//다중 파일을 묶어서 업로드하기에 컬렉션을 사용
			
			//전송 된 파일의 원래 이름을 저장할 리스트
			ArrayList<String> originFiles = new ArrayList<String>();
//			String originFiles="";
			//전송 된 파일의 리네임 된 이름(실제 저장 된 이름)을 저장할 리스트
			ArrayList<String> changeFiles = new ArrayList<String>();
			
			//multipartRequest로부터 파일에 관한 정보 추출
			//Enumeration은 Iterator의 자바 초기 버전
			// input type="file" 엘리먼트들의 name 속성값 ->getFileNames()
			Enumeration <String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name= files.nextElement();
				System.out.println("name : "+name);
				
				//파일이 null이 아닌 경우(input 태그에 파일이 첨부되어 넘어온 경우)
				if(multiRequest.getFilesystemName(name)!=null) {
					//getFilesystemName("name속성값")
					//- MyRenamePolicy의 rename 메소드에서 작성한 대로 rename된 파일명
					changeFiles.add(multiRequest.getFilesystemName(name));
					//getOriginalFileName("name속성값")
					//->실제 사용자가 업로드 할 때의 파일명
					originFiles.add(multiRequest.getOriginalFileName(name));
					
				}
			}
      
      
      String title = multiRequest.getParameter("title");
      String category = multiRequest.getParameter("category");
     // String picture = multiRequest.getParameter("picture");
      String confirm = multiRequest.getParameter("confirm");
      String frequency = multiRequest.getParameter("frequency");
      String period = multiRequest.getParameter("period");
      //챌린지 시작일을 String으로 받아와서 sql에 맞게 변환해주기
      String start = multiRequest.getParameter("startDate");
      Date startDate = Date.valueOf(start);
      int payment = Integer.parseInt(multiRequest.getParameter("payment"));
      int people = Integer.parseInt(multiRequest.getParameter("people"));
      String content = multiRequest.getParameter("content");
      
    
      // 인증빈도, 기간 숫자만 추출하기 
      //int freqNum = Integer.parseInt(frequency.substring(2, 3));
      //int periodNum = Integer.parseInt(period.substring(0,1));
      
      // 인증 빈도 String -> Number
      int freqNum = Integer.parseInt(frequency);
      int periodNum = Integer.parseInt(period);
      
      // 총 인증 갯수 계산 : frequency * period = confirmCnt 
      int confirmCnt = freqNum * periodNum;
      
      // 테이블의 USER_ID는 멤버(USER_INFO)의 USER_ID이므로
      // 로그인 유저로부터 userId 도출 
      String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
      
      Challenge ch = new Challenge(title, category, changeFiles.get(0), confirm, frequency, period,
    		  startDate, payment, people, content, confirmCnt, userId);
      
	  //System.out.println("잘 넘어오는지 확인 : " + ch);
      
      int result = new ChallService().insertChall(ch);
      
      if(result > 0) {
         // 챌린저 등록 완료 시 목록으로 
         response.sendRedirect(request.getContextPath() + "/chall/list");
      } else {
    	//실패시 저장 된 사진 삭제
			//에러는 일으키지 않지만 저장공간이 아깝
			for(int i=0;i<changeFiles.size();i++) {
				//서버에 저장된 이름 목록을 통해 반복문을 수행하면서
				File failedFile = new File(savePath+changeFiles.get(i));
				failedFile.delete();
			}
         request.setAttribute("msg","게시글 등록에 실패하였습니다.");
         request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
      }
      
   }
  }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}