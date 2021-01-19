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
 * Servlet implementation class PaySuccessServlet
 */
@WebServlet("/order/paySuccess")
public class PaySuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaySuccessServlet() {
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
	    
		// 챌린지 모집현황 인원 insert (참여중)
		 int result = new ChallService().insertChallStatus(challNo, userId);
		
		if(result > 0) {
			request.setAttribute("msg", "결제가 완료되었습니다.");
			request.setAttribute("challenge", ch);
	        request.getRequestDispatcher("/views/challenge/challengePaySuccess.jsp").forward(request, response);
		} else {
	         request.setAttribute("msg", "챌린지 모집 현황 등록을 실패하였습니다.");
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
