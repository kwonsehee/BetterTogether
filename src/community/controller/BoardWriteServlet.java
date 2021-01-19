package community.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import community.model.service.BoardService;
import community.model.vo.Board;
import member.model.vo.Member;

/**
 * Servlet implementation class BoardWriteServlet
 */
@WebServlet("/board/write")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String nickName = ((Member)request.getSession().getAttribute("loginUser")).getNickName();
		
		Board b = new Board(title, content, userId, nickName);
		
		int result = new BoardService().insertBoard(b);
		
		if(result > 0) {
			// 게시글 등록 완료 시 목록으로
			response.sendRedirect(request.getContextPath() + "/board/main");
		} else {
			// 게시글 등록 실패 시 errorPage.jsp 포워딩
			request.setAttribute("msg", "게시글 등록에 실패하였습니다.");
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
