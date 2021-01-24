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
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String reported_id=request.getParameter("reported_id");
		String writer = loginUser.getUserId();
		//인증번호 가져오기 
		String confirm_no = request.getParameter("confirm_no");
		int ceno=Integer.parseInt(confirm_no);
		System.out.println("신고서블릿 : "+title+"신고서블릿 : "+content +"신고서블릿 : "+reported_id+"신고서블릿 : "+writer+"신고서블릿 : "+ceno);
		//신고파일 처리
		if(request.getParameter("ex_file")!=null) {
			String file = request.getParameter("ex_file");
			r = new Report(title, reported_id,file, content,writer);
		}else {
			r = new Report(title, reported_id,content,writer);
		}
		System.out.println(r);
		//신고 디비에 insert하는 과정
		//인증신고 디비에 신고번호와 인증번호를 넣어줌
		int result = new ReportService().insertReport(r, ceno);
		
		if(result>0) {
		
			request.setAttribute("msg", "신고에 성공하였습니다.");
			//다시돌아갈 경로 작성
			response.sendRedirect(request.getContextPath());
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
