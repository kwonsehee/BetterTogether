package report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import report.model.service.ReportService;
import report.model.vo.Report;

/**
 * Servlet implementation class ReportInsertServlet
 */
@WebServlet("/report/insert")
public class ReportInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		Report r = null;
		//한글 값 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		String category=request.getParameter("category");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String reported_id=request.getParameter("reported_id");
		String writer = loginUser.getUserId();
		//각 카테고리의 번호 가져오기 
		int no = Integer.parseInt(request.getParameter("no"));
		
		System.out.println("category : "+category+"신고서블릿 : "+title+"신고서블릿 : "+content +"신고서블릿 : "+reported_id+"신고서블릿 : "+writer+"신고서블릿 : "+no);
		//신고파일 처리
		if(request.getParameter("ex_file")!=null) {
			String file = request.getParameter("ex_file");
			r = new Report(title, reported_id,file, content,writer);
		}else {
			r = new Report(title, reported_id,content,writer);
		}
		System.out.println(r);
		
		//신고 디비에 insert하는 과정
		//카테고리별 신고 디비에 신고번호와 카테고리번호를 넣어줌
		int result = 0;
		
		switch(category){
		case "인증" :
			result = new ReportService().insertConfirmReport(r, no);
			break;
		case "챌린지" :
			result = new ReportService().insertChallReport(r, no);
			break;
		case "자유게시판" :
			result = new ReportService().insertBoardReport(r, no);
			break;
			
		case "카페" :
			result = new ReportService().insertCafeReport(r, no);
			break;
			
		}
		
		if(result>0) {

			request.setAttribute("msg", "success");
			request.getRequestDispatcher("/views/myPage/myReport.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "신고에 실패하였습니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
