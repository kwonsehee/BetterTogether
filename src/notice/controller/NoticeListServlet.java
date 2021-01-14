package notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.model.vo.PageInfo;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/notice/list")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//* currentPage : 현재 요청 페이지
		// 기본적으로 게시판은 1페이지부터 시작함
		int currentPage = 1;

		// 하지만 페이지 전환 시 전달받은 현재 페이지가 있을 경우 해당 페이지를 currentPage로 적용
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));

		}
		NoticeService ns = new NoticeService();
		// 1_1. 게시글 총 갯수 구하기
		int listCount = ns.getListCount();
//		System.out.println("listcount : " + listCount);
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit);
		

		// 공지사항에 대한 목록 요청
		ArrayList<Notice> list = new NoticeService().selectList(pi);
//		System.out.println("pi : "+pi);
//		System.out.println("list: "+list );
		
		request.setAttribute("pi", pi);
		
		request.setAttribute("list", list);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/notice/noticeListView.jsp");
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
