package faq.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnAService;
import qna.model.vo.QnA;

/**
 * Servlet implementation class FAQUpdateForm
 */
@WebServlet("/faq/update")
public class FAQUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		
		QnA f = new QnA();
		f.setQnaTitle(title);
		f.setQnaContent(content);
		f.setQnaNo(qnaNo);
			
		int result = new QnAService().updateFAQ(f);
		
		if(result>0) {
			request.getSession().setAttribute("msg", "FAQ이 수정 완료 되었습니다.");
			response.sendRedirect(request.getContextPath()+"/faq/list");
		}else {
			request.setAttribute("msg", "FAQ 수정에 실패했습니다.");
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
