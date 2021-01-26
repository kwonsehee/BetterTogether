package studycafe.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studycafe.model.service.CafeService;
import studycafe.model.vo.Cafe;

/**
 * Servlet implementation class CafeDetailServlet
 */
@WebServlet("/study/detail")
public class CafeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cafe_code = Integer.parseInt(request.getParameter("cafe_code"));
		
		Cafe cafe = new CafeService().selectStudyCafe(cafe_code);
		
	 
		
		String page = "";
		if(cafe != null) {
			request.setAttribute("Cafe", cafe);
			page = "/views/studycafe/cafeDetailView.jsp";
		} else {
			request.setAttribute("msg", "카페상세검색에 실패했습니다.");
			page = "/views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}
		
		
	 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
