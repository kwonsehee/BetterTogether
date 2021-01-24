package myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import challenge.model.vo.Challenge;
import member.model.vo.Member;
import myPage.model.service.myPageService;

/**
 * Servlet implementation class likeChallengeServlet
 */
@WebServlet("/like/list")
public class likeChallengeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public likeChallengeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("1111");
		
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String startDate = request.getParameter("startDate");
		String period = request.getParameter("period");
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		
		Challenge chall = new Challenge(category, title, startDate, period, userId);
		
		ArrayList<Challenge> cList = new myPageService().likeList(userId);
		request.setAttribute("cList", cList);
		System.out.println("2222 : " + cList);
		request.getRequestDispatcher("/views/myPage/likeChallenge.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
