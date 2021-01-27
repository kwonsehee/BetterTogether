package myPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import challenge.model.vo.Challenge;
import challenge.model.vo.ChallengeStatus;
import member.model.vo.Member;
import myPage.model.service.myPageService;

/**
 * Servlet implementation class likeChallDeleteServlet
 */
@WebServlet("/like/hits")
public class likeChallDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public likeChallDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int challNo = Integer.parseInt(request.getParameter("challNo"));
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		int result = 0;
		int updateHitsCount = 0;
		
		//chall_status에 테이블에 해당번호와 유저 아이디 컬럼이 있는지 확인
		ChallengeStatus cs = new myPageService().likeSelectStatus(challNo, userId);
		
		//찜상태 확인하기
		String hits_status = new myPageService().likeSelectHits(challNo, userId);
		
		//찜한 상태 확인하기
		 if (cs != null && hits_status.equals("Y")) { 
			 result = new myPageService().likeDeleteHits(challNo, userId);
		 }
		 
		
		if(result > 0) {
			request.setAttribute("ChallengeStatus", cs);
			response.sendRedirect(request.getContextPath() + "/like/list");
		} else {
			request.setAttribute("msg", "챌린지 찜하기 취소를 실패하였습니다");
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
