package studycafe.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import studycafe.model.service.CafeService;
import studycafe.model.vo.Cafe;

/**
 * Servlet implementation class CafeUpdateFormServlet
 */
@WebServlet("/cafe/updateForm")
public class CafeUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int cafe_code = Integer.parseInt(request.getParameter("Cafe_code"));
		
			Cafe c = new CafeService().selectCafeCnt(cafe_code);
		
			if(c != null) {
				request.setAttribute("Cafe", c);
				request.getRequestDispatcher("/views/studycafe/CafeUpdateForm.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "수정할 게시글을 불러오는데 실패했습니다.");
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
