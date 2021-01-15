package studycafe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import studycafe.model.service.CafeService;
import studycafe.model.vo.Cafe;

/**
 * Servlet implementation class cafeInsertServlet
 */
@WebServlet("/cafe/insert")
public class cafeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cafeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String cafe_name = request.getParameter("cafe_name");
		String cafe_oh = request.getParameter("cafe_oh");
		String cafe_area = request.getParameter("cafe_area");
		String cafe_phone = request.getParameter("cafe_phone");
		String closed_day = request.getParameter("closed_day");
		int cafe_capacity =  Integer.parseInt(request.getParameter("cafe_capacity"));
		String cafe_page = request.getParameter("cafe_page");
		String detail_address = request.getParameter("detail_address");
		String cafe_info = request.getParameter("cafe_info");
		String cafe_notice = request.getParameter("cafe_notice");
		String cafe_photo = request.getParameter("cafe_photo");
		String cafe_map= request.getParameter("cafe_map");
		
		
		String UserId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		 
		Cafe n = new Cafe(cafe_name,cafe_oh,cafe_area,cafe_phone,closed_day,cafe_capacity,cafe_page,detail_address,cafe_info,cafe_notice,cafe_photo,cafe_map,UserId);
		
		int result = new CafeService().insertCafe(n);
		
		if(result > 0) {
		  
		} else {
			request.setAttribute("msg", "카페 등록에 실패하였습니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
