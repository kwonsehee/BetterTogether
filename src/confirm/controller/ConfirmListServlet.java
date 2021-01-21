package confirm.controller;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import challenge.model.service.ChallService;
import confirm.model.service.CerService;
import confirm.model.vo.Cer;
import member.model.vo.Member;

/**
 * Servlet implementation class ConfirmListServlet
 */
@WebServlet("/confirm/list")
public class ConfirmListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	//cer 디비사용
	//로그인 세션의 회원 아이디와 넘어온 챌린지 넘버를 가지고 조회해야함 
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		String user_id = m.getUserId();
		int cno = Integer.parseInt(request.getParameter("cno"));
		System.out.println("confirm list servlet cno : "+cno);
		
		//챌린지 이름 알아오기
		String c_title = new ChallService().getTitle(cno);
		ArrayList <Cer>list = new CerService().selectCerList(user_id,cno);
		
		System.out.println("cer list : "+list);
		
		request.setAttribute("list", list);
		request.setAttribute("title", c_title);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/confirm/confirmListView.jsp");
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
