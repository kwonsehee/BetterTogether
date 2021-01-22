package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdate
 */
@WebServlet("/member/update")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 한글 값 인코딩
		request.setCharacterEncoding("UTF-8");
		
		//2. 회원정보 수정에 필요한 값 추출
		String userId=request.getParameter("userId");
		String nickName=request.getParameter("nickName");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		int user_cate = Integer.parseInt(request.getParameter("cate"));
		Member m = new Member(userId, nickName,phone, email, user_cate);
		
		System.out.println("수정하고자 하는 정보 : " + m);
		
		//3. 비지니스 로직 수행(DB update)
		// 개인 정보 수정 후에 세션에 저장된 loginUser 객체의 정보도 수정되어야 하기 때문에
		// 개인 정보 수정화면에서 수정된 loginUser로 부터 정보를 받아와서 확인 가능
		Member updateMember = new MemberService().updateMember(m);
		
		//4. 응답화면 작성
		if(updateMember != null) {
			//수정 완료 & 수정 된 값으로 member select
			request.getSession().setAttribute("msg", "회원 정보 수정이 완료되었습니다.");
			request.getSession().setAttribute("loginUser", updateMember);
			//->개인정보 수정사항이 session의 loginUser에 반영되도록 다시 setAttribute
			
			//home으로 redirect
			response.sendRedirect(request.getContextPath());
		}else {
			request.setAttribute("msg", "회원 정보 수정에 실패했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("/views/common/errorPage.jsp");
			view.forward(request, response);
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
