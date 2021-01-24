package myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import challenge.model.vo.Challenge;
import common.model.vo.PageInfo;
import common.model.vo.Search;
import community.model.vo.Board;
import myPage.model.service.myPageService;

/**
 * Servlet implementation class joinedSearchListServlet
 */
@WebServlet("/joined/search")
public class joinedSearchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public joinedSearchListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//검색 기준 추출
		//String searchCondition = request.getParameter("searchCondition");
		//String search = request.getParameter("search");
		Search s = new Search(request.getParameter("searchCondition"), request.getParameter("search"));
		
		//기본적으로 게시판은 1페이지부터 시작
		int currentPage = 1;
		
		//페이지 전환 시 전달받은 currentPage 값이 있을 경우 적용
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		myPageService ms = new myPageService();
		//검색 기준의 검색 결과의 총 갯수 구하기
		int listCount = ms.getjoinedSearchListCount(s);
		
		//System.out.println("검색 기준 : " + s);
		//System.out.println("검색 기준 listCount : " + listCount);
		
		//검색 기준으로 페이징 처리
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit);
		
		ArrayList<Challenge> cList = ms.joinedSelectSearchList(pi, s);
		
		request.setAttribute("cList", cList);
		request.setAttribute("pi", pi);
		request.setAttribute("search", s);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/myPage/joinedChallenge.jsp");
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
