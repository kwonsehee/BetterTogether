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

import confirm.model.service.ConfirmService;
import confirm.model.vo.Confirm;
import member.model.vo.Member;

/**
 * Servlet implementation class ConfirmListServlet
 */
@WebServlet("/confirm/joinchalllist")
public class JoinChallListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinChallListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//userId가 필요함 -> 세션에 저장 된 loginUser를 통해서 알아오자
		HttpSession session = request.getSession();
		
		//만약 로그인된 회원이 없다면 로그인 하는 화면으로 이동시켜주기
		if((Member)session.getAttribute("loginUser")==null) {
			request.getSession().setAttribute("msg", "로그인이 필요합니다.");
			//login화면으로 redirect
			response.sendRedirect(request.getContextPath()+"/views/member/MemberLogin.jsp");
		}else {
			Member loginUser = (Member)session.getAttribute("loginUser");
//			System.out.println("loginUser:  "+loginUser);
			ArrayList<Confirm>list = new ConfirmService().selectList(loginUser.getUserId());
			System.out.println("로그인 된 회원의 참여중인 챌린지"+list);
			
			request.setAttribute("list", list);
			
			RequestDispatcher view = request.getRequestDispatcher("/views/confirm/joinchallListView.jsp");
			view.forward(request, response);
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
