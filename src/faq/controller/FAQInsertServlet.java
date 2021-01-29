package faq.controller;

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
 * Servlet implementation class FAQInsertServlet
 */
@WebServlet("/faq/insert")
public class FAQInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQInsertServlet() {
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
		
		QnA f = null;

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = loginUser.getUserId();

		f = new QnA(title, content, writer);

		int result = new QnAService().insertFAQ(f);

		if (result > 0) {
			request.getSession().setAttribute("msg", "FAQ가 성공적으로 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/faq/list");
		} else {
			request.setAttribute("msg", "FAQ 등록에 실패하였습니다.");
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
