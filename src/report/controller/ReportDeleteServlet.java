package report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import report.model.service.ReportService;

/**
 * Servlet implementation class ReportDeleteServlet
 */
@WebServlet("/report/delete")
public class ReportDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		System.out.println("delete servlet : "+rNo);
		String list ="";
		if(request.getParameter("list")!=null) {
			list = request.getParameter("list");
		}
		int result = new ReportService().deleteReport(rNo);

		if(result>0) {
			//공지사항 등록을 마친 뒤 공지사항 목록 화면을 응답하고자 할 때
			//noticeListView.jsp로 forwarding 처리하면x
			//새로 갱신 된 공지사항 목록을 불러오면 Servlet을 실행해야함
			///notice/list호출
			if(list==null) {
				request.getSession().setAttribute("msg", "신고가 성공적으로 삭제되었습니다.");
				response.sendRedirect(request.getContextPath()+"/report/mylist");
			}else {
				request.getSession().setAttribute("msg", "신고철회가 성공적으로 되었습니다.");
				response.sendRedirect(request.getContextPath()+"/report/list");	
			}
			
		
		}else {
			if(list==null) {
				request.setAttribute("msg", "신고 삭제에 실패하였습니다.");
				
			}else {
				request.setAttribute("msg", "신고철회에 실패하였습니다.");
				
			}
			request.getRequestDispatcher("/views/common/errorPage.jsp");
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
