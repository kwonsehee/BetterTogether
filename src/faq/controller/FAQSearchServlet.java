package faq.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.model.vo.PageInfo;
import common.model.vo.Search;
import qna.model.service.QnAService;
import qna.model.vo.QnA;

/**
 * Servlet implementation class FAQSearchServlet
 */
@WebServlet("/faq/search")
public class FAQSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//common 코드 사용하기
				Search s = new Search(request.getParameter("search"));
				
				
				//------------------------페이징 처리----------------------------------
				
				// 기본적으로 게시판은 1페이지부터 시작
				int currentPage = 1;

				// 페이지 전환 시 전달 받은 currentPage 값이 있을 경우 적용
				if (request.getParameter("currentPage") != null) {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));

				}
				
				QnAService qs = new QnAService();
				int listCount = qs.getSearchListCount(s);
				
				
				
				//검색 기준으로 페이징 처리
				int pageLimit = 10;
				int boardLimit = 10;
				
				PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit);
				
				
				ArrayList<QnA>list = new QnAService().selectSearchList(pi, s);
				
				// 검색 결과 list를 가지고 기존에 가지고 있던 noticeListView.jsp로 forward
				request.setAttribute("list", list);
				request.setAttribute("search", s);
				request.setAttribute("pi", pi);
				
				request.getRequestDispatcher("/views/faq/faqListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
