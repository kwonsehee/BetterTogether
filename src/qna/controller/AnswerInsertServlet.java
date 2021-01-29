package qna.controller;

import java.io.IOException;

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
 * Servlet implementation class AnswerInsertServlet
 */
@WebServlet("/qna/answer")
public class AnswerInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerInsertServlet() {
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
		
		
		QnA a = null;
		
		
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int referenceNo = Integer.parseInt(request.getParameter("qnaNo"));
		String writer = loginUser.getUserId();
		
		a = new QnA(title, content, referenceNo, writer);
		
		int result = new QnAService().insertAnswer(a);
		
		if(result>0) {
			request.getSession().setAttribute("msg", "답변이 성공적으로 등록되었습니다.");
			response.sendRedirect(request.getContextPath()+"/qna/detail?qnaNo="+referenceNo);
		}else {
			request.setAttribute("msg", "답변 등록에 실패하였습니다.");
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
