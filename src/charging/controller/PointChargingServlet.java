package charging.controller;

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

/**
 * Servlet implementation class PointChargingServlet
 */
@WebServlet("/point/charging")
public class PointChargingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PointChargingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
	 
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		 
		int money = Integer.parseInt(request.getParameter("money")); 
	
		System.out.println("충전할 금액 : "  + money);
		
//		Refund ch  = new Refund(userId,money);

//		
//		int result = new RefundService().insertcharging(ch);
		System.out.println(loginUser.getPoint()+money+"원 여기오니?22"); 

		Member updateMember = new MemberService().updatePoint(loginUser.getPoint()+money, loginUser);
		
		//거래내역 디비에 값 입력 
		int result = new HistoryService().insertCharge(userId, money);
				
	
		if(result >0) {	
			//로그인 세션 값 변경
			request.getSession().setAttribute("loginUser", updateMember);
			
			request.setAttribute("msg", "충전성공");
			
		}else {
			request.setAttribute("msg", "충전실패");
			
		}

		RequestDispatcher view = request.getRequestDispatcher("/views/myPage/pointAPIPay.jsp");
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
