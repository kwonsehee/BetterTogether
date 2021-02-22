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
import member.model.service.MemberService;
import member.model.vo.Member;
import refund.model.service.HistoryService;

/**
 * Servlet implementation class PayInsertServlet
 */
@WebServlet("/pay/insert")
public class PayInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayInsertServlet() {
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
		
		int result = 0;
		// 1. chall_status 테이블에 해당 번호, 유저아이디 컬럼이 있는지 확인 부터 하기 
		ChallengeStatus cs = new ChallService().selectChallStatus(challNo, userId);
		
		// 결제 후 금액 (포인트 결제시) 
		// payment == 2 일 경우 남은 point로 user_info 업데이트 해주기
		int point = 0;
		Challenge ch = null;
		int result2=0;
		if(payment == 2) {
			point = Integer.parseInt(request.getParameter("point"));
			Member updateMember = new MemberService().updatePoint(point, loginUser);
			
			//거래내역 디비에 값 입력
			result2 = new HistoryService().insertPayment(userId, point,challNo);
			
			//로그인 세션 값 변경
			request.getSession().setAttribute("loginUser", updateMember);
			
			// success시에 같이 넘겨주기 위해 
			ch = new ChallService().selectChall(challNo);
		}
		
		if(cs == null) {
			result = new ChallService().insertChallStatus(challNo,userId);
			// 챌린지 모집현황 인원 insert (참여중)
			result = new ChallService().updateChallStatus(challNo, userId);
		} else {
			// 챌린지 모집현황 인원 insert (참여중)
			result = new ChallService().updateChallStatus(challNo, userId);
		}
		
		
		
		// 2. 결제 테이블에 insert (카카오페이 & 포인트결제)
		if(payment ==1 || payment==2) {
			// 1) 해당 챌린지번호의 결제금액 알아오기 
			int totalPay = new ChallService().selectTotalPay(challNo);
			// 2) PAYMENT 테이블에 INSERT
			result = new ChallService().insertChallPay(totalPay,challNo,userId,payment);
		}
		
		
		
		
		if (payment == 2) {

			if (result > 0&&result2>0) {
				// result가 잘 되었다
				request.setAttribute("msg", "success");
				request.setAttribute("payment", payment);
				request.setAttribute("loginUser", userId);
				request.setAttribute("challenge", ch);
			} else {
				request.setAttribute("msg", "fail");
				request.setAttribute("payment", payment);
				request.setAttribute("loginUser", userId);
				request.setAttribute("challenge", ch);
			}
			//response.sendRedirect(request.getContextPath() + "/chall/join?challNo="+challNo);
			request.getRequestDispatcher("/views/challenge/challengePointPay.jsp").forward(request, response);
			
		} else {
			if (result > 0) {
				// result가 잘 되었다
				response.sendRedirect(request.getContextPath() + "/chall/join?challNo="+challNo);
			} else {
				request.setAttribute("msg", "챌린지 모집 현황 등록을 실패하였습니다.");
			    request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			}
		
		
		}
		
		
		
		
		
	/*	if(result > 0 && (payment==1 || payment==2)) {
			response.sendRedirect(request.getContextPath() + "/chall/join?challNo="+challNo);
		} else { 
			request.setAttribute("msg", "챌린지 모집 현황 등록을 실패하였습니다.");
		    request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
		*/
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
