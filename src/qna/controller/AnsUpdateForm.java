package qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnAService;
import qna.model.vo.QnA;

/**
 * Servlet implementation class ansUpdateForm
 */
@WebServlet("/qna/ansUpdateForm")
public class AnsUpdateForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnsUpdateForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
 
		QnA a = new QnAService().selectAnswer(qnaNo);
		QnA q = new QnAService().selectQuestion(qnaNo);
		
		String page = "";

		if (a != null) {
			request.setAttribute("a", a);
			request.setAttribute("q", q);
			page = "/views/qna/ansUpdateForm.jsp";
		} else {
			request.setAttribute("msg", "질문 수정페이지 이동에 실패하였습니다.");
			page = "/views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
