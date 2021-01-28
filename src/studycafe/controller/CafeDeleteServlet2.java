package studycafe.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studycafe.model.service.CafeService;
import studycafe.model.vo.Cafe;

/**
 * Servlet implementation class CafeDeleteServlet2
 */
@WebServlet("/CafeDeleteServlet2")
public class CafeDeleteServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeDeleteServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cafe_name = request.getParameter("cafe_name");
		String cafe_phone = request.getParameter("cafe_phone");
		
		
		System.out.println(cafe_phone);
		 
		//결체 취소시 삭제
		int result = new CafeService().deleteCafe2(cafe_name,cafe_phone);
		
		
	
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/cafe/list");
		} else {
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			request.setAttribute("msg", "게시글 삭제에 실패했습니다.");
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
