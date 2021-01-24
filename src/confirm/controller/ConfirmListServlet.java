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
import confirm.model.service.CerService;
import confirm.model.vo.Cer;
import member.model.vo.Member;

/**
 * Servlet implementation class ConfirmListServlet
 */
@WebServlet("/confirm/list")
public class ConfirmListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//cer 디비사용
		String user_id="";
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		System.out.println("confirm list servlet cno : " + cno);

		int join=0;
		//로그인 세션의 회원 아이디와 넘어온 챌린지 넘버를 가지고 조회해야함 
		HttpSession session = request.getSession();
		if (session.getAttribute("loginUser") != null) {
			Member m = (Member) session.getAttribute("loginUser");
			user_id = m.getUserId();
//			//user_id가 해당 챌린지 참여중인지 확인
//			//1이면 참여중, 0이면 참여아님
//			join = new ChallService().CheckJoin(user_id, cno);
//			System.out.println("참여중인지 : "+join);
		}
	
		// 챌린지 이름 알아오기
		String c_title = new ChallService().getTitle(cno);
		
		ArrayList <Cer>list = new ArrayList<Cer>();
		
		if(request.getParameter("title")==null) {
			//챌린지모집에서 넘어왔을때는 인증 못하게 만들기
			join=1;
			list = new CerService().selectCerList(user_id,cno);
			System.out.println("챌린지 인증에서 넘어왔을 때 : "+list);
		}else {
			join=0;
			list = new CerService().selectAllCerList(cno);
			System.out.println("챌린지 모집에서 인증보기로 넘어왔을 때 : "+list);
		}
			
		System.out.println("cer list : "+list);
		
		request.setAttribute("list", list);
		request.setAttribute("title", c_title);
		request.setAttribute("cno", cno);
		request.setAttribute("join", join);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/confirm/confirmListView.jsp");
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
