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
 * Servlet implementation class BoardDeleteServlet
 */
@WebServlet("/CafeDeleteServlet")
public class CafeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cafe_code = Integer.parseInt(request.getParameter("Cafe_code"));
		
		int result = new CafeService().deleteCafe(cafe_code);
		
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
