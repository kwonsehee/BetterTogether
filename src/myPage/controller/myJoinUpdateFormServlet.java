package myPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import challenge.model.service.ChallService;
import challenge.model.vo.Challenge;

/**
 * Servlet implementation class myJoinUpdateServlet
 */
@WebServlet("/join/update")
public class myJoinUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myJoinUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 해당 챌린지 번호의 챌린지 정보들을 가져와서 그 챌린지 번호의 맞는 내용 가져오기
		int challNo = Integer.parseInt(request.getParameter("challNo"));

		// select된 챌린지 다시 보내주기
		Challenge ch = new ChallService().selectChall(challNo);
		System.out.println("왜아난오는거애 대체 왜 challNo: " + challNo);
		System.out.println("왜아난오는거애 대체 왜 : " + ch);

		if (ch != null) {
			request.setAttribute("challenge", ch);
			request.getRequestDispatcher("/views/myPage/challMakeUpdateForm.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "수정할 챌린지 모집 게시글을 불러오는데 실패했습니다.");
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
