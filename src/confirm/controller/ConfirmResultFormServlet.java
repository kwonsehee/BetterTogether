package confirm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import challenge.model.service.ChallService;
import challenge.model.vo.Challenge;

/**
 * Servlet implementation class ConfirmResultServlet
 */
@WebServlet("/confirm/resultForm")
public class ConfirmResultFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmResultFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		System.out.println("result servlet cno : "+cno);
		
		//로그인 세션의 회원 아이디와 넘어온 챌린지 넘버를 가지고 조회해야함 
		//챌린지 정보 가져와야함
		Challenge challenge=new ChallService().selectJoinChall(cno);
		
		request.setAttribute("challenge", challenge);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/confirm/confirmResult.jsp");
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
