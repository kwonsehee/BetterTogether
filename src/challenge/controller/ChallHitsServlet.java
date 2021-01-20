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
 * Servlet implementation class ChallHitsServlet
 */
@WebServlet("/chall/hits")
public class ChallHitsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallHitsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // 찜하는 챌린지 번호 받기  
		int challNo = Integer.parseInt(request.getParameter("challNo"));
	     
		// userId가 필요함 -> 세션에 저장 된 loginUser를 통해서 알아오자
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId(); 
		
		// hits_status 가져오기 (찜 상태 알아내기위해!!) 
		String hits_status = new ChallService().selectHits(challNo, userId); 
		int result = 0;
		
		// 만약 'Y' --> delete!! 
		if(hits_status.equals("Y")) {
			result = new ChallService().deleteChallHits(challNo, userId);
		} else { // 만약 'N' --> 다시 insert 
			// 챌린지 모집현황 찜하기 insert 
			result = new ChallService().insertChallHits(challNo, userId);
		}
		
		// select된 챌린지 다시 보내주기 
		Challenge ch = new ChallService().selectChall(challNo);
		
		
		if(result > 0) {
			//request.setAttribute("hits_status", hits_status);
			request.setAttribute("challenge", ch);
			//request.getRequestDispatcher("/views/challenge/challengeJoin.jsp").forward(request, response);
			//request.setAttribute("msg","챌린지 찜하기 완료");
			response.sendRedirect(request.getContextPath() + "/chall/list");
		} else {
			request.setAttribute("msg", "챌린지 찜하기를 실패하였습니다.");
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
