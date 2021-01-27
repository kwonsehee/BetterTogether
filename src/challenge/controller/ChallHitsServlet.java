package challenge.controller;

import java.io.IOException;
import java.util.ArrayList;

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
		
		// 변수 선언
		int result = 0;
		int updateHitsCount = 0;

		
		// 1. chall_status 테이블에 해당 번호, 유저아이디 컬럼이 있는지 확인 부터 하기 
		ChallengeStatus cs = new ChallService().selectChallStatus(challNo, userId);
		
		// hits_status 가져오기 (찜 상태 알아내기위해!!) 
		String hits_status = new ChallService().selectHits(challNo, userId); 
		
		// chall_status 가져오기 (참여중인지 아닌지 여부)
		int chall_status = new ChallService().selectJoinChallStatus(challNo, userId);
		
		
		// 찜하기 경우의 수로 나누기  ( 1. 참여 :0 찜 : Y / 2. 참여:0 찜: N / 3. 참여:1 찜: N / 4. 참여:1 찜: Y 
		 if (cs != null && hits_status.equals("Y") && chall_status == 0) { 
			// 참여중은 아닌데 찜만 한 경우 
			result = new ChallService().deleteChallHits(challNo, userId);
		} else if (cs != null && chall_status == 1 && hits_status.equals("Y")) {
			// 참여중이면서 찜하기가 'Y' -- > 찜하기 취소하고 싶음 (삭제말고 ! 업데이트로) --> C_hits를 'N'으로 업데이트함 (where userid = ?, challno = ?, challstatus=1)
			result = new ChallService().updateHitsStatus1(challNo, userId); // 'N'으로
		} else if (cs != null && chall_status == 0 && hits_status.equals("N")) {
			result = new ChallService().updateHitsStatus(challNo, userId); // 'Y'로
		} else { // cs != null + hits_status -> 'N'
			// 참여중인데 찜하기가 'N' -- > 'Y'로 바꿔주기
			// result = new ChallService().insertChallHits(challNo, userId);
			result = new ChallService().updateHitsStatus(challNo, userId); // 'Y'로
		}
		
		
		// select된 챌린지 다시 보내주기 
		Challenge ch = new ChallService().selectChall(challNo);
		
		
		if(result > 0) {
			request.setAttribute("challenge", ch); 
			response.sendRedirect(request.getContextPath() + "/chall/join?challNo="+ch.getChallNo());
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
