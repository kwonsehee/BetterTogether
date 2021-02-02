package myPage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import challenge.model.service.ChallService;
import member.model.service.MemberService;
import news.model.service.NewsService;

/**
 * Servlet implementation class myJoinDeleteServlet
 */
@WebServlet("/join/delete")
public class myJoinDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myJoinDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int challNo = Integer.parseInt(request.getParameter("challNo"));
		
		int result = new ChallService().deleteChall(challNo);
		
		if(result > 0) {
			// 게시물 삭제 성공한 경우
			// 참여중인 인원들 모두 환불 시키기
			int result1 = new MemberService().refundMoney(challNo);
			
			//삭제당한 인원들이 로그인시 확인가능하도록 news디비에 정보 넣기
			int result2 = new NewsService().insertChall(challNo);
			
			// chall_status 디비에 chall_status 1을 0으로 변경
			int result3 = new ChallService().deleteChallStatus(challNo);
			System.out.println("result1 : "+result+"result2 : "+result2+"result3 : "+result3);
			
			
			request.getSession().setAttribute("msg", "게시물 삭제 되었습니다!");
			response.sendRedirect(request.getContextPath() + "/challMake/list");
		} else {
			request.setAttribute("msg", "게시물 삭제에 실패했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("/views/common/errorPage.jsp");
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
