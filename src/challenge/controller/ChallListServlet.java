package challenge.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import challenge.model.service.ChallService;
import challenge.model.vo.Challenge;
import common.model.vo.PageInfo;

/**
 * Servlet implementation class ChallListServlet
 */
@WebServlet("/chall/list")
public class ChallListServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
	  // * currentPage : 현재 요청 페이지
	  // 기본적으로 게시판은 1페이지부터 시작함
	  int currentPage = 1;
	  
	  // 하지만 페이지 전환 시 전달 받은 현재 페이지가 있을 경우 해당 페이지를 currentPage로 적용
	  if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	  }
	  
	   
      ChallService cs = new ChallService();
      
      // 1_1. 게시글 총 갯수 구하기
   	  int listCount = cs.getListCount();
	  System.out.println("listCount :" + listCount);
	  
	  // 1_2. 페이징 처리를 위한 변수 선언 및 연산
	  int pageLimit= 10;  // 한 페이지 하단에 보여질 페이지 수 
	  int boardLimit = 10; // 한 페이지에 보여질 게시글 최대 수 
	  int maxPage; 	// 전체 페이지에서 가장 마지막 페이지
	  int startPage;  // 한 페이지 하단에 보여질 시작 페이지 
	  int endPage;    // 한 페이지 하단에 보여질 끝 페이지 
	  
	  // * maxPage : 총 페이지의 마지막 수
	  maxPage = (int)Math.ceil((double)listCount / boardLimit);
	  startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
	  // * endPage : 현재 페이지에서 보여지는 페이징 바의 마지막 숫자
	  endPage = startPage + pageLimit - 1; // 딱 떨어지는 단위 10, 20, 30..

	  if(maxPage < endPage) {
			endPage = maxPage;
	  }
	  
	  // 페이징 처리와 관련 된 변수를 클래스 형식으로 만들어 담기
	  PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
	  
      ArrayList<Challenge> list = cs.selectList(pi);
      
      System.out.println("pi : " + pi);
      System.out.println("챌린지 list : " + list);
      
      request.setAttribute("pi", pi);
      request.setAttribute("list", list);
      
      RequestDispatcher view = request.getRequestDispatcher("/views/challenge/challengeBoard.jsp");
      view.forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}