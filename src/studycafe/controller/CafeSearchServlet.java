package studycafe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studycafe.model.service.CafeService;
import studycafe.model.vo.Cafe;
import studycafe.model.vo.PageInfo;
import studycafe.model.vo.Search;

/**
 * Servlet implementation class CafeSearchServlet
 */
@WebServlet("/cafe/search")
public class CafeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			//String searchConition = request.getParameter("searchConition");
			//String search = request.getParameter("search");
			Search s = new Search(request.getParameter("searchCondition"), request.getParameter("search"));
			
			int currentPage = 1;
		 
			if(request.getParameter("currentPage") !=null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
				
			}
			CafeService cs = new CafeService();
			int listCount = cs.getSearchListCount(s);
			
			 
		 	int pageLimit = 10;
			int cafeLimit = 8;
			
			PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, cafeLimit);
			
			ArrayList<Cafe> list = cs.selectSearchList(pi, s); 
			ArrayList<Cafe>	list2= cs.selectSearchList2(pi,s);
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list); 
			request.setAttribute("list2", list2);
			request.setAttribute("search", s); 
			
			RequestDispatcher view = request.getRequestDispatcher("/views/studycafe/studycafe.jsp");
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
