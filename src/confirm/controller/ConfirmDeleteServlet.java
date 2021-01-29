package confirm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import confirm.model.service.CerService;

/**
 * Servlet implementation class ConfirmDeleteServlet
 */
@WebServlet("/confirm/delete")
public class ConfirmDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("삭제할 인증의 번호"+no);
		int cno = Integer.parseInt(request.getParameter("cno"));
		System.out.println("삭제할 인증의 cno number : "+cno);
		
		int result = new CerService().deleteCer(no);
		
		
		if(result>0) {
			request.getSession().setAttribute("msg", "인증 삭제가 성공적으로 되었습니다.");
			response.sendRedirect(request.getContextPath()+"/confirm/list?cno="+cno);	
					
		}else {
			request.setAttribute("msg", "인증 삭제에 실패하였습니다.");
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
