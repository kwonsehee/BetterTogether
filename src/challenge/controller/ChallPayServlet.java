package challenge.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import challenge.model.service.ChallService;
import challenge.model.vo.Challenge;

/**
 * Servlet implementation class ChallPayServlet
 */
@WebServlet("/chall/pay")
public class ChallPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     int challNo = Integer.parseInt(request.getParameter("challNo"));
	     
	     Challenge ch = new ChallService().selectChall(challNo);
			
	     String page = "";
	     
	      if(ch != null) {
	         request.setAttribute("challenge", ch);
	         page = "/views/challenge/challengePayment.jsp";
	         
	      } else {
	         request.setAttribute("msg", "챌린지 참여 상세페이지를 불러오는데 실패하였습니다.");
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
