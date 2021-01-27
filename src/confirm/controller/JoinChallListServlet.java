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
import common.model.vo.PageInfo;
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
			String userId=loginUser.getUserId();
			
//			System.out.println("loginUser:  "+loginUser);
			
			// * currentPage : 현재 요청 페이지
			// 기본적으로 게시판은 1페이지부터 시작함
			int currentPage = 1;

			// 하지만 페이지 전환 시 전달받은 현재 페이지가 있을 경우 해당 페이지를 currentPage로 적용
			if (request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			ChallService cs = new ChallService();
			
			// 1_1. 게시글 총 갯수 구하기
			int listCount = cs.getMyListCount(userId);
			 System.out.println("listcount : " + listCount);

			// 1_2. 페이징 처리를 위한 변수 선언 및 연산
			int pageLimit = 10;
			int boardLimit = 3;

			PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit);
			System.out.println("page boardLimit : " + pi);

			
			ArrayList<Confirm>list = new ConfirmService().selectList(loginUser.getUserId(), pi);
			System.out.println("로그인 된 회원의 참여중인 챌린지"+list);
			
			request.setAttribute("pi", pi);
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
