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
import challenge.model.vo.ChallengeStatus;
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
		  
		// 1: 카카오페이인지, 2: 회원보유포인트인지 판단 
		int payment = Integer.parseInt(request.getParameter("payment"));
		//String payment = request.getParameter("payment");
		  
		 // int result = 0;
		// Challenge ch = new ChallService().selectChall(challNo);
		 
//		// 1. chall_status 테이블에 해당 번호, 유저아이디 컬럼이 있는지 확인 부터 하기 
//		ChallengeStatus cs = new ChallService().selectChallStatus(challNo, userId);
//		
//		if(cs == null) {
//			result = new ChallService().insertChallStatus(challNo,userId);
//			// 챌린지 모집현황 인원 insert (참여중)
//			result = new ChallService().updateChallStatus(challNo, userId);
//		} else {
//			// 챌린지 모집현황 인원 insert (참여중)
//			result = new ChallService().updateChallStatus(challNo, userId);
//		}
//		
//		// 2. 결제 테이블에 insert (카카오페이)
//		if(payment ==1) {
//			// 1) 해당 챌린지번호의 결제금액 알아오기 
//			int totalPay = new ChallService().selectTotalPay(challNo);
//			// 2) PAYMENT 테이블에 INSERT
//			result = new ChallService().insertChallPay(totalPay,challNo,userId,payment);
//		}
		
		//System.out.println("result 결제~ : " + result);
		
		Challenge ch = new ChallService().selectChall(challNo);
		
		// result > 0
		if(payment == 1) {
			//request.setAttribute("msg", "결제가 완료되었습니다.");
			request.setAttribute("challenge", ch);
			request.setAttribute("payment", payment);
			//request.setAttribute("challNo", challNo);
	        request.getRequestDispatcher("/views/challenge/challengeAPIPay.jsp").forward(request, response);
		} else if(payment==2) {
			// 회원 포인트 결제 화면으로 
			request.setAttribute("challenge", ch);
			request.setAttribute("payment", payment);
			//request.setAttribute("challNo", challNo);
	        request.getRequestDispatcher("/views/challenge/challengePointPay.jsp").forward(request, response);
		} else {
	         request.setAttribute("msg", "결제 화면 이동 실패하였습니다.");
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
