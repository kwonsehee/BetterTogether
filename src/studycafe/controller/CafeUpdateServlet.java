package studycafe.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Synthesizer;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.model.vo.MyFileRenamePolicy;
import studycafe.model.service.CafeService;
import studycafe.model.vo.Cafe;

/**
 * Servlet implementation class CafeUpdateServlet
 */
@WebServlet("/cafe/update")
public class CafeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		
		
		
		
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


			int Cafe_code = Integer.parseInt(multiRequest.getParameter("Cafe_code"));
		
			Cafe cafe = new Cafe();
			
		
			
			
			String Cafe_photo = multiRequest.getParameter("Cafe_photo"); //히든값으로 이미지 값 넘겨와서 새로운 파일이없으면 기존 이미지 사용
			String Cafe_photo2 = multiRequest.getParameter("Cafe_photo2");
			String Cafe_photo3 = multiRequest.getParameter("Cafe_photo3");
			System.out.println("Cafe_photo" + " "+Cafe_photo); // 새로운 수정이미지 파일이 없으면 기존 이미지파일이 불러저 오는지 실험
			
			
			
			
			
			
			cafe.setCafe_oh(multiRequest.getParameter("cafe_oh")); 
			cafe.setCafe_name(multiRequest.getParameter("cafe_name"))  ;
			cafe.setCafe_area(multiRequest.getParameter("cafe_area")); 
			cafe.setCafe_phone(multiRequest.getParameter("cafe_phone")); 
			cafe.setCafe_capacity(multiRequest.getParameter("cafe_capacity"));
			cafe.setCafe_notice(multiRequest.getParameter("cafe_notice"));   
			cafe.setCafe_info(multiRequest.getParameter("cafe_info"));   
			
			
			if(multiRequest.getFilesystemName("cafe_photo") == null) {
				cafe.setCafe_photo(Cafe_photo);
			} else { 
				cafe.setCafe_photo(multiRequest.getFilesystemName("cafe_photo"));
			}
			
			cafe.setAFFILIATED_CAFE(multiRequest.getParameter("AFFILIATED_CAFE"));  
			cafe.setCafe_map(multiRequest.getParameter("cafe_map"));  
			cafe.setDetail_address(multiRequest.getParameter("detail_address"));  
			cafe.setClosed_day(multiRequest.getParameter("closed_day"));   
			cafe.setCafe_page(multiRequest.getParameter("cafe_page"));   
			cafe.setCafe_code(Cafe_code);
		 
			
			if(multiRequest.getFilesystemName("cafe_photo2") == null) {
				cafe.setCafe_photo2(Cafe_photo2);
			} else { 
				cafe.setCafe_photo2(multiRequest.getFilesystemName("cafe_photo2"));
			}
		
		
			if(multiRequest.getFilesystemName("cafe_photo3") == null) {
				cafe.setCafe_photo3(Cafe_photo3);
			} else { 
				cafe.setCafe_photo3(multiRequest.getFilesystemName("cafe_photo3"));
			}
		
			
	 
			 
			 
			 
			CafeService service = new CafeService();
	
			  int result = service.updateCafe(cafe);
	
			 if(result > 0) {                             
			 response.sendRedirect(request.getContextPath() + "/study/detail?cafe_code=" + Cafe_code);
			 } else {
				 request.setAttribute("msg", "게시글 수정에 실패했습니다.");
				 request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
