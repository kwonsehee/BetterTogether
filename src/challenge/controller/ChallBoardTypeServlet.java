package challenge.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import challenge.model.service.ChallService;
import challenge.model.vo.Challenge;
import common.model.vo.PageInfo;

/**
 * Servlet implementation class ChallBoardTypeServlet
 */
@WebServlet("/chall/type")
public class ChallBoardTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChallBoardTypeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		// ================페이징 처리해야함============
		// * currentPage : 현재 요청 페이지
		// 기본적으로 게시판은 1페이지부터 시작함
		int currentPage = 1;

		// 하지만 페이지 전환 시 전달 받은 현재 페이지가 있을 경우 해당 페이지를 currentPage로 적용
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		ChallService cs = new ChallService();

		// *********(수정하기) 1. 게시글 총 갯수 구하기 3개쓰기 (시작전/진행중/종료)********** 
		//int listCount = cs.getListCount2(challBoardType);
		//System.out.println("챌린지보드타입 listCount :" + listCount);
		
		// switch case문 button 값이 1,2,3
		// 회원이 클릭한 버튼 가져오기
		int challBoardType = Integer.parseInt(request.getParameter("challBoardType"));
		// System.out.println("선택한 challBoard 버튼 종류 : " + challBoardType); // 1,2,3
		
		int listCount = 0;
		switch(challBoardType) {
			// 1. 시작전 게시글 총 갯수 구하기
			case 1 : listCount = cs.getBeforeCnt(); break;
			// 2. 진행중 게시글 총 갯수 구하기
			case 2 : listCount = cs.getStartCnt(); break;
			// 3. 종료 게시글 총 갯수 구하기 
			case 3 : listCount = cs.getEndCnt(); break;
		}

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
		
		
		// *********(수정하기) 2. 게시글 셀렉해오기 3개쓰기 (시작전/진행중/종료)********** 
		ArrayList<Challenge> list = null;
		switch(challBoardType) {
			// 1. 시작 전 
			case 1: list = cs.selectChallBeforeStart(pi); break;
			// 2. 진행 중 
			case 2: list = cs.selectChallStarting(pi); break;
			// 3. 종료  
			case 3: list = cs.selectChallEnd(pi); break;
		}
		

		System.out.println("pi : " + pi);
		System.out.println("challBoardType list : " + list);

		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("challBoardType", challBoardType);

		RequestDispatcher view = request.getRequestDispatcher("/views/challenge/challengeBoard.jsp");
		view.forward(request, response);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
