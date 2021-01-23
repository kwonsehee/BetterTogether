package challenge.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import challenge.model.service.ChallService;
import challenge.model.vo.Challenge;
import challenge.model.vo.ChallengeStatus;
import member.model.vo.Member;

/**
 * Servlet implementation class ChallJoinServlet
 */
@WebServlet("/chall/join")
public class ChallJoinServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
//      // 조회수(쿠키: 무한 증가 방지 처리)
//      
//      // cList라는 이름의 쿠키가 있는지 확인하는 변수
//      boolean flagcList = false;
//      // 해당 challNo가 cList 쿠키 value 안에 있는지 확인 하는 변수
//      boolean flagchallNo = false;
//      
//      // 요청으로부터 Cookie 정보들을 얻어옴
//      Cookie[] cookies = request.getCookies();
//      
//      //쿠키가 잘 넘어왔다면
//      if(cookies != null) {
//         // 넘어온 쿠키 값 배열을 처음부터 끝까지 반복하여 탐색
//         for(Cookie c : cookies) {
//            // 읽은 게시물 정보를 저장 해 두는 쿠키의 이름 cList가 있는지 확인
//            if(c.getName().equals("cList")) {
//               flagcList = true;
//               
//               // 기존 쿠키 value를 가져와서 decode함(, 등의 특수문자를 인코딩해서 넘기므로)
//               String cList = URLDecoder.decode(c.getValue(), "UTF-8");
//               //, 구분자 기준으로 나누기 
//               String[] list = cList.split(",");
//               for(String st : list) {
//                  // 해당 게시글을 읽었다는 정보가 포함되어 있으므로 읽었음을 표시
//                  if(st.equals(String.valueOf(challNo)))
//                     flagchallNo = true;
//               }
//               // 해당 게시글을 읽지 않았다면 쿠키에 해당 게시글 번호를 붙여 다시 인코딩해서 value 세팅
//               if(!flagchallNo) {
//                  c.setValue(URLEncoder.encode(cList + "," + challNo, "UTF-8"));
//                 response.addCookie(c); // 응답에 담아 보냄 
//               }
//               
//            }
//         }
//      }
//      
//      ChallService cs = new ChallService();
//      Challenge ch = null;
//      
//      // cList라는 이름의 쿠키가 없다면
//         if(!flagcList) {
//            Cookie c = new Cookie("cList", String.valueOf(challNo));
//            c.setMaxAge(1 * 24 * 60 * 60); // 하루 동안 유효 
//            response.addCookie(c);
//            // 조회수 증가 후 게시글 조회 
//            ch = cs.selectChall(challNo);
//         } else if(!flagchallNo) {
//            // cList는 있지만 challNo는 없으므로 조회수 증가 후 게시글 조회
//            ch = cs.selectChall(challNo);
//         } else {
//            // 조회수 증가 없이 게시글 조회 
//            ch = cs.selectChallNoCnt(challNo);
//         }
//      
	   
	   int challNo = Integer.parseInt(request.getParameter("challNo"));
	   
	   
	   	HttpSession session = request.getSession();
	   	Member loginUser = (Member)session.getAttribute("loginUser");
		
		
		ChallService cs = new ChallService();
		   
		// chall_status 테이블 널이면 안됨 (널이면 hits_status 보내줄수없음)
		ArrayList <ChallengeStatus> list = cs.selectListChallStatus();
		
       
        int result = 0;
        
		
		String page = "";
		if((Member)session.getAttribute("loginUser") == null) {
			// 찜 카운트 가져오기 위해 
	        Challenge ch1 = cs.selectChall(challNo);
	        
			request.setAttribute("challenge", ch1);
	         page = "/views/challenge/challengeJoin.jsp";
		} else {
			
			 	String userId = loginUser.getUserId();
			 
			 	// 찜 버튼 변화를 위해 찜상태 select 해오기
		     	String hits_status = cs.selectHits(challNo, userId); 
		     	
		     	// 찜 카운트 가져오기 위해 
		        Challenge ch2 = cs.selectChall(challNo);
			 
			 
			 // 챌린지를 참여하려고 들어왔는데 chall_status가 없다!!!! -> 즉, hits_status == "" 일때 
		       if(hits_status == "") { 
		    	   // 찜 상태 'N' (찜버튼 누르기 전 이니깐)으로 컬럼 삽입 
		    	   result = new ChallService().insertChallStatus(challNo,userId); 
		    	   hits_status = cs.selectHits(challNo, userId); // select 해오기 -> 'N'
		       } else {
		    	   hits_status = cs.selectHits(challNo, userId); // 테이블이 이미 있다면 , ('Y'든 'N'이든 select해오기) 
		       }
		       
		       // chall_status count 해오기 
		       int joinPeopleCnt = new ChallService().selectJoinCount(challNo);
		       //System.out.println("joinPPPPPLLLLCCOCO 제발 ㅠㅠㅠ: " + joinPeopleCnt);
		       
		       // chall_status 가져오기 (참여중인지 아닌지 여부)
		       int chall_status = new ChallService().selectJoinChallStatus(challNo, userId);
		       
		       
		      //String page = "";
		      if(ch2 != null && list != null && hits_status.equals("Y")) {
		    	 request.setAttribute("joinPeopleCnt", joinPeopleCnt);
		 		 request.setAttribute("list", list);
				 request.setAttribute("hits_status", hits_status);
		         request.setAttribute("challenge", ch2);
		         request.setAttribute("chall_status", chall_status);
		         page = "/views/challenge/challengeJoin.jsp";
		         
		      } else if(list == null) { 
		    	  request.setAttribute("joinPeopleCnt", joinPeopleCnt);
		    	  request.setAttribute("list", list);
		    	  request.setAttribute("challenge", ch2);
		    	  request.setAttribute("chall_status", chall_status);
		          page = "/views/challenge/challengeJoin.jsp";
		          
		      } else if(ch2 != null && list != null && hits_status.equals("N"))  {
		    	  request.setAttribute("joinPeopleCnt", joinPeopleCnt);
		    	  request.setAttribute("list", list);
		    	  request.setAttribute("hits_status", hits_status);
		          request.setAttribute("challenge", ch2);
		          request.setAttribute("chall_status", chall_status);
		          page = "/views/challenge/challengeJoin.jsp";
		      } else {
		         request.setAttribute("msg", "챌린지 참여 상세페이지를 불러오는데 실패하였습니다.");
		         page = "/views/common/errorPage.jsp";
		      }
			
		}
		
      
      request.getRequestDispatcher(page).forward(request, response);

   
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}