package administratorPage.controller;

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
import community.model.service.BoardService;
import community.model.vo.Board;
import member.model.service.MemberService;
import notice.model.service.NoticeService;
import qna.model.service.QnAService;
import qna.model.vo.QnA;
import report.model.service.ReportService;
import report.model.vo.Report;
import studycafe.model.service.CafeService;
import studycafe.model.vo.Cafe;

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
			request.setCharacterEncoding("UTF-8");
		
			if(request.getParameter("admin") == null) {
				
				ArrayList<Challenge> challNew = new ChallService().challNew();
				ArrayList<Cafe> cafeNew = new CafeService().cafeNew();
				ArrayList<Report> reportNew = new ReportService().ReportNew();
				ArrayList<QnA> QNANew = new QnAService().QNANew();
				ArrayList<Board> boardNew = new BoardService().boardNew();
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
			
				request.setAttribute("challNew", challNew);
				request.setAttribute("cafeNew", cafeNew);
				request.setAttribute("reportNew", reportNew);
				request.setAttribute("QNANew", QNANew);
				request.setAttribute("boardNew", boardNew);
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
				
				ArrayList<Challenge> challNew = new ChallService().challNew();
				ArrayList<Cafe> cafeNew = new CafeService().cafeNew();
				ArrayList<Report> reportNew = new ReportService().ReportNew();
				ArrayList<QnA> QNANew = new QnAService().QNANew();
				ArrayList<Board> boardNew = new BoardService().boardNew();
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
				int totalCnt = new MemberService().totalMem();
				
				request.setAttribute("totalCnt", totalCnt);
				request.setAttribute("challNew", challNew);
				request.setAttribute("cafeNew", cafeNew);
				request.setAttribute("reportNew", reportNew);
				request.setAttribute("QNANew", QNANew);
				request.setAttribute("boardNew", boardNew);
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
