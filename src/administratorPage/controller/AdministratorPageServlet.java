package administratorPage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import challenge.model.service.ChallService;
import community.model.service.BoardService;
import member.model.service.MemberService;
import notice.model.service.NoticeService;
import qna.model.service.QnAService;
import report.model.service.ReportService;
import studycafe.model.service.CafeService;

/**
 * Servlet implementation class AdministratorPageServlet
 */
@WebServlet("/administratorPage")
public class AdministratorPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdministratorPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			if(request.getParameter("admin") == null) {
			
			int boardCount = new BoardService().totalCount();
			int cafeCount = new CafeService().totalCount();
			int challCount = new ChallService().totalCount();
			int noticeCount = new NoticeService().totalCount();
			int qnaCount = new QnAService().totalCount();
			int reportCount = new ReportService().totalCount();
			int todayJoinCount = new MemberService().todayJoinCount();
			int challStartCnt = new ChallService().getStartCnt();
			int challBeforeCnt = new ChallService().getBeforeCnt();
			int challEndCnt = new ChallService().getEndCnt();
			
			request.setAttribute("boardCount", boardCount);
			request.setAttribute("cafeCount", cafeCount);
			request.setAttribute("challCount", challCount);
			request.setAttribute("noticeCount", noticeCount);
			request.setAttribute("qnaCount", qnaCount);
			request.setAttribute("reportCount", reportCount);
			request.setAttribute("todayJoinCount", todayJoinCount);
			request.setAttribute("challStartCnt", challStartCnt);
			request.setAttribute("challBeforeCnt", challBeforeCnt);
			request.setAttribute("challEndCnt", challEndCnt);
			
			RequestDispatcher view= request.getRequestDispatcher("/views/administrator/downloadAdminPage.jsp");
			view.forward(request, response);
			
			} else {
				
				int boardCount = new BoardService().totalCount();
				int cafeCount = new CafeService().totalCount();
				int challCount = new ChallService().totalCount();
				int noticeCount = new NoticeService().totalCount();
				int qnaCount = new QnAService().totalCount();
				int reportCount = new ReportService().totalCount();
				int todayJoinCount = new MemberService().todayJoinCount();
				int challStartCnt = new ChallService().getStartCnt();
				int challBeforeCnt = new ChallService().getBeforeCnt();
				int challEndCnt = new ChallService().getEndCnt();
				
				request.setAttribute("boardCount", boardCount);
				request.setAttribute("cafeCount", cafeCount);
				request.setAttribute("challCount", challCount);
				request.setAttribute("noticeCount", noticeCount);
				request.setAttribute("qnaCount", qnaCount);
				request.setAttribute("reportCount", reportCount);
				request.setAttribute("todayJoinCount", todayJoinCount);
				request.setAttribute("challStartCnt", challStartCnt);
				request.setAttribute("challBeforeCnt", challBeforeCnt);
				request.setAttribute("challEndCnt", challEndCnt);
				
				RequestDispatcher view= request.getRequestDispatcher("/views/administrator/adminPage.jsp");
				view.forward(request, response);

			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
