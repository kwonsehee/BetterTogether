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
		}
	
		// 챌린지 이름 알아오기
		String c_title = new ChallService().getTitle(cno);
		
		// * currentPage : 현재 요청 페이지
		// 기본적으로 게시판은 1페이지부터 시작함
		int currentPage = 1;

		// 하지만 페이지 전환 시 전달받은 현재 페이지가 있을 경우 해당 페이지를 currentPage로 적용
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			System.out.println("현재페이지 : "+currentPage);
		}

		CerService cs = new CerService();

		// 1_1. 게시글 총 갯수 구하기
		int listCount = 0;

		// 1_2. 페이징 처리를 위한 변수 선언 및 연산
		int pageLimit = 10;
		int boardLimit = 8;

		PageInfo pi = new PageInfo();
		
		ArrayList <Cer>list = new ArrayList<Cer>();
		
		if(request.getParameter("title")==null) {
			join=1;
			// 1_1. 게시글 총 갯수 구하기
			listCount = cs.getMyListCount(cno, user_id);
			System.out.println("listcount : " + listCount);

			pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit);
			
			list = new CerService().selectCerList(user_id,cno, pi);
			System.out.println("챌린지 인증에서 넘어왔을 때 : "+list);
		}else {
			//챌린지모집에서 넘어왔을때는 인증 못하게 만들기
			join=0;
			
			// 1_1. 게시글 총 갯수 구하기
			listCount = cs.getALlListCount(cno);
			System.out.println("listcount : " + listCount);
			
			pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit);
			System.out.println("paging"+pi);
			list = new CerService().selectAllCerList(cno, pi);
			System.out.println("챌린지 모집에서 인증보기로 넘어왔을 때 : "+list);
		}
			
		System.out.println("cer list : "+list);
		
		request.setAttribute("list", list);
		request.setAttribute("title", c_title);
		request.setAttribute("cno", cno);
		request.setAttribute("join", join);
		request.setAttribute("pi", pi);
		
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
