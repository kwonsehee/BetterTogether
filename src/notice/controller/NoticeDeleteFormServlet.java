package notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeDeleteFormServlet
 */
@WebServlet("/notice/deleteForm")
public class NoticeDeleteFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ano = Integer.parseInt(request.getParameter("ano"));
		System.out.println("삭제할 ano"+ano);
		int result = new NoticeService().deleteNotice(ano);
		
		if(result>0) {
			//공지사항 등록을 마친 뒤 공지사항 목록 화면을 응답하고자 할 때
			//noticeListView.jsp로 forwarding 처리하면x
			//새로 갱신 된 공지사항 목록을 불러오면 Servlet을 실행해야함
			///notice/list호출
			request.getSession().setAttribute("msg", "공지사항이 성공적으로 삭제되었습니다.");
			response.sendRedirect(request.getContextPath()+"/notice/list");
		
		}else {
			request.setAttribute("msg", "공지사항 글 삭제에 실패하였습니다.");
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
