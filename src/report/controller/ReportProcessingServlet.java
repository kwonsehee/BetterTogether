package report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;
import news.model.service.NewsService;
import report.model.service.ReportService;

/**
 * Servlet implementation class ReportProcessingServlet
 */
@WebServlet("/report/processing")
public class ReportProcessingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportProcessingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		System.out.println("processing servlet : "+rNo);
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		
		ReportService rs = new ReportService();
		
		//알림디비에 값 입력 
		int result4= new NewsService().insertReport(rNo);
		
		//신고디비 t_f를 t로
		int result = rs.processReport(rNo);
		
		//user_info에 신고횟수 증가시키기 
		int result2 =new MemberService().processUserReported(rNo);
		
		//신고당한 게시물을 비활성화 시키기
		int result3 = rs.disabledPost(rNo);
		
		
		System.out.println(result +", "+result2 +", "+result3 +", "+result4);
		if(result >0 && result2>0&& result3>0) {
			request.getSession().setAttribute("msg", "신고처리가 성공적으로 되었습니다.");
			response.sendRedirect(request.getContextPath()+"/report/list");
		}else {//신고 잘 안됐을 경우
			request.setAttribute("msg", "신고처리에 실패하였습니다.");
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
