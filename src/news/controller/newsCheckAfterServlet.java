package news.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import news.model.service.NewsService;
import news.model.vo.News;

/**
 * Servlet implementation class newsInsertServlet
 */
@WebServlet("/news/checkAfter")
public class newsCheckAfterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newsCheckAfterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		//news디비에서 보여준 값은 n으로 변경하기
		int result = new NewsService().updateNews(userId);
		
		
		if(result >0) {
			//알림디비에서 새로 알려줄 알림이 있는지 확인
			ArrayList<News> news = new NewsService().getNews(userId);
			System.out.println("news : "+news);
			session.setAttribute("news", news);
			
			//다시 홈으로 가기
			request.setAttribute("result", "success");
		}else {
			request.setAttribute("result", "fail");
			
		}
		RequestDispatcher view = request.getRequestDispatcher("/views/common/alertNews.jsp");
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
