package challenge.controller;

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
import challenge.model.vo.Challenge;
import common.model.vo.PageInfo;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class CateInputServlet
 */
@WebServlet("/member/cateinput")
public class CateInputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CateInputServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		//선택한 카테고리 가져오기
		int cate = Integer.parseInt(request.getParameter("cate"));
		System.out.println("선택한 카테고리 : "+cate);

		// 로그인 유저가 있으면 관심카테고리를 변경해주고 선택한 카테고리에 관한 챌린지 리스트를 띄워줌
		if (loginUser != null) {
			if(loginUser.getUser_cate()!=cate) {
				//loginuser의 관심카테고리와 선택한 카테고리가 다를경우 멤버를 업데이트 해줘야함
				Member m = new Member(loginUser.getUserId(),cate);
				System.out.println("수정하고자 하는 정보 : " + m);
				
				Member updateMember = new MemberService().updateCateMember(m);
				
				if(updateMember!=null){
					//해당 클라이언트에 대한 세션 객체 가져오기
					session = request.getSession();
					//관심있는 카테고리 값을 변경한 updateMember를 로그인 유저로변경
					session.setAttribute("loginUser", updateMember);
					
				}else {
					
					request.setAttribute("msg", "회원 정보 수정에 실패했습니다.");
					RequestDispatcher view = request.getRequestDispatcher("/views/common/errorPage.jsp");
					view.forward(request, response);
				}
			}

		} 
		
		// 로그인 유저가 없으면 선택한 카테고리에 관한 챌린지 리스트를 띄워줌
			
			
				
		//================페이징 처리해야함============
		// * currentPage : 현재 요청 페이지
		// 기본적으로 게시판은 1페이지부터 시작함
		int currentPage = 1;
		
		// 하지만 페이지 전환 시 전달 받은 현재 페이지가 있을 경우 해당 페이지를 currentPage로 적용
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		ChallService cs = new ChallService();

		// 1_1. 게시글 총 갯수 구하기
		int listCount = cs.getListCount(cate);
		System.out.println("listCount :" + listCount);

		// 1_2. 페이징 처리를 위한 변수 선언 및 연산
		int pageLimit = 10; // 한 페이지 하단에 보여질 페이지 수
		int boardLimit = 12; // 한 페이지에 보여질 게시글 최대 수
		int maxPage; // 전체 페이지에서 가장 마지막 페이지
		int startPage; // 한 페이지 하단에 보여질 시작 페이지
		int endPage; // 한 페이지 하단에 보여질 끝 페이지

		// * maxPage : 총 페이지의 마지막 수
		maxPage = (int) Math.ceil((double) listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		// * endPage : 현재 페이지에서 보여지는 페이징 바의 마지막 숫자
		endPage = startPage + pageLimit - 1; // 딱 떨어지는 단위 10, 20, 30..

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// 페이징 처리와 관련 된 변수를 클래스 형식으로 만들어 담기
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);

		ArrayList<Challenge> list = cs.selectCate(cate, pi);	 

		System.out.println("pi : " + pi);
	    System.out.println("챌린지 list : " + list);
	    
	    
	    request.setAttribute("pi", pi);
	    request.setAttribute("list", list);
	    request.setAttribute("cate", cate);
	      
	    RequestDispatcher view = request.getRequestDispatcher("/views/challenge/challengeBoard.jsp");
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
