package report.controller;

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
import news.model.service.NewsService;
import report.model.service.ReportService;
import report.model.vo.Report;

/**
 * Servlet implementation class ReportInsertServlet
 */
@WebServlet("/report/insert")
public class ReportInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Report r = null;
		//한글 값 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			 
			int maxSize = 1024*1024*10;
			
			// 웹 서버 컨테이너 경로 추출
			String root = request.getSession().getServletContext().getRealPath("/");
			System.out.println("root : " + root);
			
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
				System.out.println("name : " + name);
				
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
			
			String category = multiRequest.getParameter("category");
			String title= multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String reported_id = multiRequest.getParameter("reported_id");
			String writer = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
					
			//각 카테고리의 번호 가져오기 
			int no = Integer.parseInt(multiRequest.getParameter("no"));

			if(multiRequest.getFilesystemName("ex_file")!=null) {
				String file = multiRequest.getFilesystemName("ex_file");
				r = new Report(title, reported_id,file, content,writer);
			}else {
				r = new Report(title, reported_id,content,writer);
			}
			
			System.out.println("r은 : " + r);
			//신고 디비에 insert하는 과정
			//카테고리별 신고 디비에 신고번호와 카테고리번호를 넣어줌
			int result = 0;
			
			switch(category){
			case "인증" :
				result = new ReportService().insertConfirmReport(r, no);
				break;
			case "챌린지" :
				result = new ReportService().insertChallReport(r, no);
				break;
			case "자유게시판" :
				result = new ReportService().insertBoardReport(r, no);
				break;
				
			case "카페" :
				result = new ReportService().insertCafeReport(r, no);
				break;
				
			}
			if(result>0) {
				
				request.setAttribute("msg", "success");
				//request.getRequestDispatcher("/views/myPage/myReport.jsp").forward(request, response);
				response.sendRedirect(request.getContextPath()+"/report/mylist");
			}else {
				request.setAttribute("msg", "신고에 실패하였습니다.");
				request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			}
		}
		
		//System.out.println("category : "+category+"신고서블릿 : "+title+"신고서블릿 : "+content +"신고서블릿 : "+reported_id+"신고서블릿 : "+writer+"신고서블릿 : "+no);
		//신고파일 처리
		//System.out.println(r);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
