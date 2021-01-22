package challenge.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import challenge.model.service.ChallService;
import challenge.model.vo.Challenge;
import member.model.vo.Member;

/**
 * Servlet implementation class ChallPayServlet
 */
@WebServlet("/chall/pay")
public class ChallPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     int challNo = Integer.parseInt(request.getParameter("challNo"));
	     
	     // userId가 필요함 -> 세션에 저장 된 loginUser를 통해서 알아오자
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId(); 
	     
	     Challenge ch = new ChallService().selectChall(challNo);
	     
	     // 이미 참여 했는데 또 클릭 시 참여했다고 알림뜨게 !!!!!!!!! --> 로그인 유저,해당넘버의 (chall_status == 1 -> 이미참여했다고 alert뜨게!)
	     int chall_status = new ChallService().selectJoinChallStatus(challNo, userId);
			
	     String page = "";
	     
	      if(ch != null && chall_status == 0) {
	         request.setAttribute("challenge", ch);
	         page = "/views/challenge/challengePayment.jsp";
	      } else {
	         request.setAttribute("msg", "챌린지 결제 페이지를 불러오는데 실패하였습니다.");
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
