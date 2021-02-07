package refund.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;
import refund.model.service.HistoryService;
import refund.model.service.RefundService;
import refund.model.vo.Refund;

/**
 * Servlet implementation class RefundServlet
 */
@WebServlet("/member/refund")
public class RefundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RefundServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 한글 값 인코딩
		request.setCharacterEncoding("UTF-8");
				
		// userId가 필요함 -> 세션에 저장 된 loginUser를 통해서 알아오자
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		String bank = request.getParameter("bank");
		String account = request.getParameter("account");
		int money = Integer.parseInt(request.getParameter("money"));
		
		
		
		Refund refund = new Refund(userId,bank, account, money);
		String page="";
		//환급 디비에 값 입력
		int result = new RefundService().insertrefund(refund);
		
		if(result >0) {
			System.out.println(loginUser.getPoint()-money+"원 여기오니?22");
			Member updateMember = new MemberService().updatePoint(loginUser.getPoint()-money, loginUser);
			//거래내역 디비에 값 입력
			int result2= new HistoryService().insertRefund(userId, money);
			
			//로그인 세션 값 변경
			request.getSession().setAttribute("loginUser", updateMember);
			
			request.getSession().setAttribute("msg", "환급 완료 되었습니다.");
			page = "/views/myPage/refundForm.jsp";
		}else {
			request.setAttribute("msg", "환급 데이터베이스에 입력 실패하였습니다.");
			page = "/views/common/errorPage.jsp";
		}

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
