package qna.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import qna.model.service.QnAService;
import qna.model.vo.QnA;

/**
 * Servlet implementation class QnAInsert
 */
@WebServlet("/qna/insert")
public class QnAInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		QnA q = null;
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = loginUser.getUserId();
		
		q = new QnA(title, content, writer);
		
		int result = new QnAService().insertQuestion(q);
		
		if(result>0) {
			request.getSession().setAttribute("msg", "질문이 성공적으로 등록되었습니다.");
			response.sendRedirect(request.getContextPath()+"/qna/list");
		}else {
			request.setAttribute("msg", "질문 등록에 실패하였습니다.");
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
