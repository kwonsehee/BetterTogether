package report.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReportInsertFormServlet
 */
@WebServlet("/report/insertForm")
public class ReportInsertFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportInsertFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인증, 자유게시판, 스터디카페, 챌린지신고클릭시 여기로 이동
		//한글 값 인코딩 처리
		request.setCharacterEncoding("UTF-8");
				
		//confirm, board, cafe, challenge값을 받아옴
		String category = request.getParameter("category");
		//신고당하는 사람의 id값을 받아옴
		String reported_id = request.getParameter("reported_id");
		//각 카테고리의 고유번호를 받아옴
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(category +", "+reported_id+", "+no);
		request.setAttribute("category", category);
		request.setAttribute("reported_id", reported_id);
		request.setAttribute("no", no);

		request.getRequestDispatcher("/views/report/reportInsertForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
