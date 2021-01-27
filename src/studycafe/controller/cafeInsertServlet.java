 package studycafe.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.MyFileRenamePolicy;
import member.model.vo.Member;
import studycafe.model.service.CafeService;
import studycafe.model.vo.Cafe;

/**
 * Servlet implementation class cafeInsertServlet
 */
@WebServlet("/cafe/insert")
public class cafeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cafeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		 
		
		if(ServletFileUpload.isMultipartContent(request)) {
		 
			int maxSize = 1024*1024*10;
			
			// 웹 서버 컨테이너 경로 추출
			String root = request.getSession().getServletContext().getRealPath("/");
		//	System.out.println("root : " + root);
			
			// 파일이 실제로 저장 될 경로
			String savePath = root + "resources\\Cafeimages\\"; 
			
			
			
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
		
		 
			
			
			
			String cafe_oh = multiRequest.getParameter("cafe_oh");
			String cafe_name = multiRequest.getParameter("cafe_name");
			String cafe_area = multiRequest.getParameter("cafe_area");
			String cafe_phone = multiRequest.getParameter("cafe_phone"); 
			String cafe_capacity = multiRequest.getParameter("cafe_capacity");
			String cafe_notice = multiRequest.getParameter("cafe_notice");
			String cafe_info = multiRequest.getParameter("cafe_info");
			String cafe_photo = multiRequest.getFilesystemName("cafe_photo");
			String AFFILIATED_CAFE= multiRequest.getParameter("AFFILIATED_CAFE");
			String cafe_map= multiRequest.getFilesystemName("cafe_map");
			String detail_address = multiRequest.getParameter("detail_address");
			String closed_day = multiRequest.getParameter("closed_day"); 
			String cafe_page = multiRequest.getParameter("cafe_page"); 
			String UserId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			
			
			Cafe n = new Cafe(cafe_oh,cafe_name,cafe_area,cafe_phone, cafe_capacity ,cafe_notice,cafe_info,cafe_photo,AFFILIATED_CAFE,cafe_map,detail_address,closed_day,cafe_page,UserId);
			
			int result = new CafeService().insertCafe(n ) ;
			
			 
		 
			
			if(result > 0) {

				response.sendRedirect(request.getContextPath() + "/cafe/list");
			} else {
				request.setAttribute("msg", "카페 등록에 실패하였습니다.");
				request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
