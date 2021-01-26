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

 

/**
 * Servlet implementation class CafeListServlet
 */
@WebServlet("/cafe/list")
public class CafeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage= 1;
		 // 스터디 카페 currentPage 페이지 적용
		if(request.getParameter("currentPage") !=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		CafeService cs = new CafeService();
		
		int listCount = cs.getListCount();
		//System.out.println("listCoumt: " + listCount);
		
		int pageLimit=10;  //  
		int cafeLimit= 8;  // 한페이지에 8개 카페 보여줌  //제휴카페보부터 순차적으로
		int maxPage;
		int startPage;
		int endPage;
		
		
	  
		
		maxPage = (int)Math.ceil((double)listCount / cafeLimit);
		
		startPage = (currentPage -1) / pageLimit*pageLimit+1;
		endPage = startPage + pageLimit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, cafeLimit, maxPage, startPage, endPage);

 
		ArrayList<Cafe> list2 = cs.selectList2(pi);

		request.setAttribute("pi", pi);
		request.setAttribute("list2", list2);

		RequestDispatcher view = request.getRequestDispatcher("/views/studycafe/studycafe.jsp");
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
