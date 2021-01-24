package report.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.model.vo.PageInfo;
import qna.model.service.QnAService;
import qna.model.vo.QnA;
import report.model.service.ReportService;
import report.model.vo.Report;

/**
 * Servlet implementation class ReportListServlet
 */
@WebServlet("/report/list")
public class ReportListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportListServlet() {
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

				// 하지만 페이지 전환 시 전달받은 현재 페이지가 있을 경우 해당 페이지를 currentPage로 적용
				if (request.getParameter("currentPage") != null) {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}
				
				ReportService rs = new ReportService();
				
				// 1_1. 게시글 총 갯수 구하기
				int listCount = rs.getListCount();
				// System.out.println("listcount : " + listCount);

				// 1_2. 페이징 처리를 위한 변수 선언 및 연산
				int pageLimit = 10;
				int boardLimit = 10;

				PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit);
				
				// 리스트 객체 생성하기
				ArrayList<Report> list = new ReportService().selectList(pi);
				
				// System.out.println("PI : " + pi);
				// System.out.println("list : " + list);
				
				request.setAttribute("pi", pi);
				request.setAttribute("list", list);
				
				RequestDispatcher view = request.getRequestDispatcher("/views/report/reportListView.jsp");
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
