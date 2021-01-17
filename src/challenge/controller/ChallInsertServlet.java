package challenge.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import challenge.model.service.ChallService;
import challenge.model.vo.Challenge;
import member.model.vo.Member;

/**
 * Servlet implementation class ChallInsertServlet
 */
@WebServlet("/chall/insert")
public class ChallInsertServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      
      String title = request.getParameter("title");
      String category = request.getParameter("category");
      String picture = request.getParameter("picture");
      String confirm = request.getParameter("confirm");
      String frequency = request.getParameter("frequency");
      String period = request.getParameter("period");
      String startDate = request.getParameter("startDate");
      int payment = Integer.parseInt(request.getParameter("payment"));
      int people = Integer.parseInt(request.getParameter("people"));
      String content = request.getParameter("content");
            
      // 테이블의 USER_ID는 멤버(USER_INFO)의 USER_ID이므로
      // 로그인 유저로부터 userId 도출 
      String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
      
      Challenge ch = new Challenge(title, category, picture, confirm, frequency, period,
            startDate, payment, people, content, userId);
      
		System.out.println("잘 넘어오는지 확인 : " + ch);

      
      int result = new ChallService().insertChall(ch);
      
      if(result > 0) {
         // 챌린저 등록 완료 시 목록으로 
         response.sendRedirect(request.getContextPath() + "/chall/list");
      } else {
         request.setAttribute("msg","게시글 등록에 실패하였습니다.");
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