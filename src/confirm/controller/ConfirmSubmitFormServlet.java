package confirm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import confirm.model.service.CerService;
import confirm.model.vo.Cer;

/**
 * Servlet implementation class ConfirmSubmitFormServlet
 */
@WebServlet("/confirm/submitForm")
public class ConfirmSubmitFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmSubmitFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 값 인코딩 처리
		request.setCharacterEncoding("UTF-8");
					
		int cno = Integer.parseInt(request.getParameter("cno"));
		System.out.println("confirm servlet cno : "+cno);
		String comment = request.getParameter("comment");
		String userId = request.getParameter("userId");
		System.out.println(cno +" "+comment+" "+userId+" ");
		
		//사진값도 넣어야함
		
		//인증 데이터베이스에 값 넣기
		Cer c = new Cer();
		c.setChall_no(cno);
		c.setCer_comment(comment);
		c.setUser_id(userId);
		
		int result = new CerService().insertCer(c);
		System.out.println(c);
		if(result>0) {
			request.setAttribute("cno", cno);
			RequestDispatcher view = request.getRequestDispatcher("/confirm/list");
		    view.forward(request, response);
		} else {
	         request.setAttribute("msg", "인증 등록을 실패하였습니다.");
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
