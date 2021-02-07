package refund.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import challenge.model.service.ChallService;
import member.model.service.MemberService;
import member.model.vo.Member;
import refund.model.service.HistoryService;

/**
 * Servlet implementation class RefundUserServlet
 */
@WebServlet("/refund/payback")
public class RefundUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RefundUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		String challTitle = (String)request.getParameter("challTitle");
		int challNo = Integer.parseInt(request.getParameter("challNo"));
		int money = Integer.parseInt(request.getParameter("money"));
		System.out.println("user id and money : "+userId + money);
		
		
		int result= new MemberService().payback(userId, money);
		//거래내역 디비에 넣어주기
		int result2= new HistoryService().insertHistory(userId, money, challTitle);
		
		//chall_status에 chall_status의 값을 2로 변경 
		int result3= new ChallService().endChallStatus(userId, challNo);
		
		String page="";
		if(result >0&&result2>0&&result3>0) {
			Member updateMember = new MemberService().selectMember(userId);
				
			//로그인 세션 값 변경
			request.getSession().setAttribute("loginUser", updateMember);
			
			request.getSession().setAttribute("msg", money+"원 상금을 받았습니다. 마이페이지를 확인해주세요.");
			page = "/myPage/history";
		}else {
			request.setAttribute("msg", "상금받기에 실패하였습니다.");
			page = "/views/common/errorPage.jsp";
		}

		RequestDispatcher view = request.getRequestDispatcher(page);
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
