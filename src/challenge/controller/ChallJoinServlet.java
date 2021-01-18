package challenge.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import challenge.model.service.ChallService;
import challenge.model.vo.Challenge;

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
      int challNo = Integer.parseInt(request.getParameter("challNo"));
      
      // 조회수(쿠키: 무한 증가 방지 처리)
      
      // cList라는 이름의 쿠키가 있는지 확인하는 변수
      boolean flagcList = false;
      // 해당 challNo가 cList 쿠키 value 안에 있는지 확인 하는 변수
      boolean flagchallNo = false;
      
      // 요청으로부터 Cookie 정보들을 얻어옴
      Cookie[] cookies = request.getCookies();
      
      //쿠키가 잘 넘어왔다면
      if(cookies != null) {
    	  // 넘어온 쿠키 값 배열을 처음부터 끝까지 반복하여 탐색
    	  for(Cookie c : cookies) {
    		  // 읽은 게시물 정보를 저장 해 두는 쿠키의 이름 cList가 있는지 확인
    		  if(c.getName().equals("cList")) {
    			  flagcList = true;
    			  
    			  // 기존 쿠키 value를 가져와서 decode함(, 등의 특수문자를 인코딩해서 넘기므로)
    			  String cList = URLDecoder.decode(c.getValue(), "UTF-8");
    			  //, 구분자 기준으로 나누기 
    			  String[] list = cList.split(",");
    			  for(String st : list) {
    				  // 해당 게시글을 읽었다는 정보가 포함되어 있으므로 읽었음을 표시
    				  if(st.equals(String.valueOf(challNo)))
    					  flagchallNo = true;
    			  }
    			  // 해당 게시글을 읽지 않았다면 쿠키에 해당 게시글 번호를 붙여 다시 인코딩해서 value 세팅
    			  if(!flagchallNo) {
    				  c.setValue(URLEncoder.encode(cList + "," + challNo, "UTF-8"));
					  response.addCookie(c); // 응답에 담아 보냄 
    			  }
    			  
    		  }
    	  }
      }
      
      ChallService cs = new ChallService();
      Challenge ch = null;
      
      // cList라는 이름의 쿠키가 없다면
   		if(!flagcList) {
   			Cookie c = new Cookie("cList", String.valueOf(challNo));
   			c.setMaxAge(1 * 24 * 60 * 60); // 하루 동안 유효 
   			response.addCookie(c);
   			// 조회수 증가 후 게시글 조회 
   			ch = cs.selectChall(challNo);
   		} else if(!flagchallNo) {
   			// cList는 있지만 challNo는 없으므로 조회수 증가 후 게시글 조회
   			ch = cs.selectChall(challNo);
   		} else {
   			// 조회수 증가 없이 게시글 조회 
   			ch = cs.selectChallNoCnt(challNo);
   		}
      
      
      System.out.println("chall 참여상세 : " + ch);
      
      String page = "";
      if(ch != null) {
         request.setAttribute("challenge", ch);
         page = "/views/challenge/challengeJoin.jsp";
         
      } else {
         request.setAttribute("msg", "챌린지 참여 상세페이지를 불러오는데 실패하였습니다.");
         page = "/views/common/errorPage.jsp";
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