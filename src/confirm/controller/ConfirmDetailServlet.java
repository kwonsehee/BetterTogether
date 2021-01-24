package confirm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import confirm.model.service.CerService;
import confirm.model.vo.Cer;

/**
 * Servlet implementation class ConfirmDetailServlet
 */
@WebServlet("/confirm/detail")
public class ConfirmDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//챌린지 모집에서 인증보기 버튼 클릭시 이동
		int ceno = Integer.parseInt(request.getParameter("ceno"));
		
		//인증에 관한 정보 가져오기
		Cer c=new CerService().selectCer(ceno);
		System.out.println(c);
		
		String page = "";
		if(c !=null) {
			request.setAttribute("cer", c);
			page = "/views/confirm/confirmDetailView.jsp";
		}else {
			request.setAttribute("msg", "인증 상세페이지를 불러오는데 실패하였습니다.");
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
