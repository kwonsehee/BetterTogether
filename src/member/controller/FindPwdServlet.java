package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class FindPwdServlet
 */
@WebServlet("/member/findPwd")
public class FindPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		//2. request에 담겨 있는 값을 꺼내서 변수에 저장 및 객체 생성
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String userId=request.getParameter("userId");
		
		Member m=new Member();
		m.setName(name);
		m.setEmail(email);
		m.setUserId(userId);
		
		System.out.println("비밀번호찾기 m  :"+m);
		
		String pwd= new MemberService().getPwd(m);
		System.out.println("비밀번호찾기 idlist:"+pwd);
		
		if(pwd !=null) {
			request.setAttribute("msg", "success");
			request.setAttribute("pwd", pwd);
			request.setAttribute("email", email);
			request.setAttribute("name", name);
		}
		else {
			request.setAttribute("msg", "fail");
		}
		RequestDispatcher view = request.getRequestDispatcher("/views/member/findPwd.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
