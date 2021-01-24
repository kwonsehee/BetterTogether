package challenge.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChallWarningServlet
 */
@WebServlet("/chall/warning")
public class ChallWarningServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallWarningServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 챌린지 번호
		int no = Integer.parseInt(request.getParameter("no"));
		// 신고대상
		String reported_id = request.getParameter("reported_id");
		// 챌린지 (제목)
		String category = request.getParameter("category");
		
		request.setAttribute("no", no);
		request.setAttribute("reported_id", reported_id);
		request.setAttribute("category", category);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/challenge/reportInsertForm.jsp");
		view.forward(request, response);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
