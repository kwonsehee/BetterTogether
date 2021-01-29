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
 * Servlet implementation class QnAUpdateServlet
 */
@WebServlet("/qna/update")
public class QnAUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAUpdateServlet() {
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
		
		QnA q = new QnA();
		q.setQnaTitle(title);
		q.setQnaContent(content);
		q.setQnaNo(qnaNo);
			
		int result = new QnAService().updateQuestion(q);
		
		if(result>0) {
			//수정된 결과로 조회된 해당 게시글 상세페이지
			//디테일 서블릿쪽으로 이동
			request.getSession().setAttribute("msg", "질문이 수정 완료 되었습니다.");
			response.sendRedirect(request.getContextPath()+"/qna/detail?qnaNo=" + qnaNo);
		}else {
			request.setAttribute("msg", "질문 수정에 실패했습니다.");
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
