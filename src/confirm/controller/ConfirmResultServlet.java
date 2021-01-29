package confirm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import challenge.model.service.ChallService;
import challenge.model.vo.Challenge;
import confirm.model.service.CerService;
import confirm.model.vo.Cer;
import member.model.vo.Member;

/**
 * Servlet implementation class ConfirmResultServlet
 */
@WebServlet("/confirm/result")
public class ConfirmResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		System.out.println("result servlet cno : "+cno);
		
		ChallService cs = new ChallService();
		//로그인 세션의 회원 아이디와 넘어온 챌린지 넘버를 가지고 조회해야함 
		//챌린지 정보 가져와야함
		Challenge challenge=cs.selectJoinChall(cno);
		System.out.println("challenge : "+challenge);
		//챌린지에 참여한 총인원
		int totalCnt = cs.totalCnt(cno);
		System.out.println("서블릿 토탈카운트 : "+totalCnt);
		//평균 달성률 구하기
		double avgTotal = cs.avgTotal(cno);
		//100%달성한 사람의 인원수
		int num1 = cs.percent100(cno); 
		//85%미만 달성한 사람의 인원수
		int num2 = cs.percent85(cno); 
		//85%이상 달성한 사람의 인원수 
		int num3 = totalCnt-(num1+num2);
		
		System.out.println("num1 : "+num1+"num3 : "+num3+"num2 :"+num2);

		//회원별 달성률구하기
		Cer cer = new CerService().getAchieve(cno, loginUser.getUserId());
		System.out.println("cer : "+cer);
		
		request.setAttribute("challenge", challenge);
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("avgTotal", avgTotal);
		request.setAttribute("num1", num1);
		request.setAttribute("num2", num2);
		request.setAttribute("num3", num3);
		request.setAttribute("cer", cer);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/confirm/confirmResult.jsp");
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
