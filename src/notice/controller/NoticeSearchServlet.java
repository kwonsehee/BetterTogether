package notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.model.vo.PageInfo;
import common.model.vo.Search;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeSearchServlet
 */
@WebServlet("/notice/search")
public class NoticeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String searchCondition = request.getParameter("searchCondition");
//		String search = request.getParameter("search");
//		ArrayList<Notice>list = new NoticeService().selectList(search, searchCondition);

		//common 코드 사용하기
		Search s = new Search(request.getParameter("searchCondition"),request.getParameter("search"));
		
		
		//------------------------페이징 처리----------------------------------
		
		// 기본적으로 게시판은 1페이지부터 시작
		int currentPage = 1;

		// 페이지 전환 시 전달 받은 currentPage 값이 있을 경우 적용
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));

		}
		
		NoticeService ns = new NoticeService();
		int listCount = ns.getSearchListCount(s);
		System.out.println("검색 카운트: "+listCount);
		
		
		//검색 기준으로 페이징 처리
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit);
		
		
		ArrayList<Notice>list = new NoticeService().selectSearchList(pi, s);
		
		System.out.println("검색결과 : "+list);
		System.out.println("페이지 정보: "+pi);
		
		// 검색 결과 list를 가지고 기존에 가지고 있던 noticeListView.jsp로 forward
		request.setAttribute("list", list);
		request.setAttribute("search", s);
		request.setAttribute("pi", pi);
		
		request.getRequestDispatcher("/views/notice/noticeListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
