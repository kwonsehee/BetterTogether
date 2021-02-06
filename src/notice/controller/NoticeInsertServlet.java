package notice.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import member.model.vo.Member;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeInsertServlet
 */
@WebServlet("/notice/insert")
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(); 
		
		if(ServletFileUpload.isMultipartContent(request)) {
		 
			int maxSize = 1024*1024*10;
			
			// 웹 서버 컨테이너 경로 추출
			String root = request.getSession().getServletContext().getRealPath("/");
			// System.out.println("root : " + root);
			
			// 파일이 실제로 저장 될 경로
			String savePath = root + "resources/uploadFiles/"; 
			
			
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, 
					maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> originFiles = new ArrayList<String>();
			// 전송 된 파일의 리네임 된 이름(실제 저장 된 이름)을 저장할 리스트
			ArrayList<String> changeFiles = new ArrayList<String>();
		
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				// System.out.println("name : " + name);
				
				// 파일이 null이 아닌 경우 (input 태그에 파일이 첨부되어서 넘어온 경우)
				if(multiRequest.getFilesystemName(name) != null) {
					// getFilesystemName("name속성값")
					// -> MyRenamePolicy의 rename 메소드에서 작성 한대로 rename 된 파일명
					changeFiles.add(multiRequest.getFilesystemName(name));
					// getOriginalFileName("name속성값")
					// -> 실제 사용자가 업로드 할 때의 파일명
					originFiles.add(multiRequest.getOriginalFileName(name));
				}
			}
			
			Notice n = null;
			Notice n2 = null;
			
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String writer = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			
			
			if(multiRequest.getParameter("mustread") != null) {
				int mustread = Integer.parseInt(multiRequest.getParameter("mustread"));
				
				if(multiRequest.getParameter("afile")!=null) {
					String file = multiRequest.getParameter("afile");
					n2 = new Notice(title, file,content,writer, mustread);
				}else {
					n2 = new Notice(title, content,writer, mustread);
				}
				int result2 = new NoticeService().insertNoticeMust(n2);
				
				// System.out.println("필독 : " + result2);
				if(result2>0) {
					//공지사항 등록을 마친 뒤 공지사항 목록 화면을 응답하고자 할 때
					//noticeListView.jsp로 forwarding 처리하면x
					//새로 갱신 된 공지사항 목록을 불러오면 Servlet을 실행해야함
					///notice/list호출
					request.getSession().setAttribute("msg", "공지사항이 성공적으로 등록되었습니다.");
					response.sendRedirect(request.getContextPath()+"/notice/list");
				}else {
					request.setAttribute("msg", "공지사항 등록에 실패하였습니다.");
					request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
				}
			} else {
				if(multiRequest.getParameter("afile")!=null) {
					String file = multiRequest.getParameter("afile");
					n = new Notice(title, file,content,writer);
				}else {
					n = new Notice(title, content,writer);
				}
				
				int result = new NoticeService().insertNotice(n);
				
				// System.out.println("필독 xx" + result);
				if(result>0) {
					//공지사항 등록을 마친 뒤 공지사항 목록 화면을 응답하고자 할 때
					//noticeListView.jsp로 forwarding 처리하면x
					//새로 갱신 된 공지사항 목록을 불러오면 Servlet을 실행해야함
					///notice/list호출
					request.getSession().setAttribute("msg", "공지사항이 성공적으로 등록되었습니다.");
					response.sendRedirect(request.getContextPath()+"/notice/list");
				}else {
					request.setAttribute("msg", "공지사항 등록에 실패하였습니다.");
					request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
				}
			}
			
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
