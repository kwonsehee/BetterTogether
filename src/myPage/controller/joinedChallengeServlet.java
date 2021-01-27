package myPage.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import challenge.model.vo.Challenge;
import common.model.vo.PageInfo;
import member.model.vo.Member;
import myPage.model.service.myPageService;

/**
 * Servlet implementation class joinedChallListServlet
 */
@WebServlet("/joined/list")
public class joinedChallengeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public joinedChallengeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// *currentPage : 현재 요청 페이지
				//기본적으로 게시판은 1페이지부터 시작함
				int currentPage =1;
				
				
				//하지만 페이지 전환 시 전달 받은 현재 페이지가 있을 경우 해당 페이지를 currentPage로 적용
				//1page에서 5page이를 클릭 했을 때 5page로 넘어가게
				if(request.getParameter("currentPage")!=null) {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}
				
				myPageService ms = new myPageService();
				
				String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();

				//1_1.게시글 총 갯수 구하기
				//게시글이 작성 될 때마다 새로운 글이 젤 위에 있기 때문에 게시글 총 갯수를 알아와야함
				int listCount = ms.joinedgetListCount(userId);
				System.out.println("listCount : " + listCount);
				
				//1_2.페이징 처리를 위한 변수 선언 및 연산
				int pageLimit = 10;		//한 페이지 하단에 보여질 페이지 수
				int boardLimit = 10;	//한 페이지에 보여질 게시글 최대 수
				int maxPage;			//전체 페이지에서 가장 마지막 페이지
				int startPage;			//한 페이지 하단에 보여질 시작 페이지
				int endPage;			//한 페이지 하단에 보여질 끝 페이지
				
				// *maxPage : 총 페이지의 마지막 수
				//글 갯수가 105개면 페이지의 수는 10페이지가 아니라 자투리 5개까지 한 페이지로 생각해서 11페이지가 필요
				//전체 게시글 수 / 한 페이지에 보여질 개수 결과를 올림 처리
				maxPage = (int)Math.ceil((double)listCount / boardLimit); //ceil : 숫자 올림 처리
				
				//*startPage : 현재 페이지에 보여지는 페이징 바의 시작 숫자
				//나의 현재 페이지(currentPage)에서 pageLimit만큼을 나누고 다시 곱한 뒤 1을 더한다
				//(요청페이지) 1 / (pageBar 총 개수) 10 * 10 + 1 -> 1
				// 5 / 10 * 10 + -> 1
				// 11 / 10 * 10 + 1 -> 11
				// 15 / 10 * 10 + 1 -> 11
				// 21 / 10 * 10 + 1 -> 21
				//한가지 예외 상황 (10, 20, 30 ...)은 딱 떨어지는 숫자의 경우로 몫이 하나 더 늘어남
				// 25 / 10 * 10 + 1 -> 21
				//예외 상황 방지를 위해 currentPage -1을 함
				startPage = (currentPage -1) / pageLimit * pageLimit + 1;
				
				//*endPage : 현재 페이지에서 보여지는 페이징  바의 마지막 숫자
				endPage = startPage + pageLimit - 1;
				
				//하지만 마지막 페이지 수가 총 페이지 수보다 클 경우는 있을 수 없으므로
				//(maxPage가 11인데 endPage가 20일 수 없음)
				//endPage가 maxPage보다 클 경우
				if(maxPage < endPage) {
					//endPage를 maxPage가 되도록
					endPage = maxPage;
				}
				
				//페이징 처리와 관련된 변수를 클래스 형식으로 만들어 담기
				PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit,
											maxPage, startPage, endPage);
				
				
				
				
				Challenge chall = new Challenge();
				chall.setUserId(userId);
				/*chall.setChallNo(challNo);
				chall.setChallTitle(challTitle);
				chall.setChallPeriod(challPeriod);
				chall.setCateName(cateName);*/
				
				ArrayList<Challenge> cList = ms.joinedSelectList(pi, userId);
				//cList = ms.joinedList(userId);
				
				//System.out.println("pi : " + pi);
				//System.out.println("list : " + list);
				
				request.setAttribute("pi", pi);
				request.setAttribute("cList", cList);
				
				System.out.println("cList : " + cList);
				
				RequestDispatcher view = request.getRequestDispatcher("/views/myPage/joinedChallenge.jsp");
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
