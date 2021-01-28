package community.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import community.model.service.ReviewService;
import community.model.vo.Review;
import member.model.vo.Member;

/**
 * Servlet implementation class ReviewInsertServlet
 */
@WebServlet("/review/insert")
public class ReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String nickname = ((Member)request.getSession().getAttribute("loginUser")).getNickName();
		String content = request.getParameter("content");
		String star = request.getParameter("star");
		int challNo = Integer.parseInt(request.getParameter("challNo"));
		
//		System.out.println("userId : " + userId);
//		System.out.println("nickname : " + nickname);
//		System.out.println("content : " + content);
//		System.out.println("star : " + star);
//		System.out.println("challNo : " + challNo);
		
		Review r = new Review();
		r.setUserId(userId);
		r.setNickName(nickname);
		r.setrContent(content);
		r.setrGrade(Integer.parseInt(star));
		r.setChallNo(challNo);
		
		System.out.println("r : " + r);
		ArrayList<Review> rList = new ReviewService().insertReview(r);
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
