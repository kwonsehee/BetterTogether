<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, challenge.model.vo.Challenge, common.model.vo.*"%>
    
<%
	//리스트 가져오기
	ArrayList<Challenge> cList = (ArrayList<Challenge>)request.getAttribute("cList");
	
	//페이징 바
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	//찜하기 -> 취소
	String hits_status = "";
	if(cList!=null){
		hits_status = (String)request.getAttribute("hits_status");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
<style>
	.line {
		border: 0.5px solid #937cf790;
	}
	
	#btSection {
		padding-bottom: 100px;
	}
        
	 #content-1 p{
     /*        border:solid 1px red;  */
            font-size: 24px;
            text-align: center;
            color : #757575;
   }
	
	/*게시판*/
	#likeList {
		width: 80%;
        /*  height: 400px;       */
         border-collapse: collapse;
         margin-top:20px;
         margin:auto;
          font-size:14px;
          font-family: "Nanum Gothic";
	}
	
	#like {
		width : 80%;
		margin:auto;
		margin-top:30px;
	}
	
	#likeList th, #likeList td {
		border-bottom: 1px solid #75757552;
        padding: 2px;
	}
	
	#likeList th {
		background:#fff;
	}
	
	#likeList td {
		height : 30px;
	}
	
	#th_likeNo {
		width : 10%;
	}
	
	#th_likeCate {
		width: 10%;
	}
	
	#th_likeTitle {
		width : 40%;
	}
	
	#th_likePeriod {
		width : 60%;	
	}
	
	#th_title{
		 background : rgba(240, 240, 240, 0.7);
         height: 30px;
         font-family: "Nanum Gothic";
         font-size: 14px;
         color : #757575;
	}
	
	#likeChall {
		margin-top:20px;
		padding-bottom:20px;
	}
	
	
	/*버튼*/
	.likeUpdateBtn {
		font-family: "Nanum Gothic";
        border-radius: 10px;
        border: solid 1px #9e9e9e5b;
        padding:5px 15px 5px 15px;
        background-color: #e6e4e4b6;
        font-size:10px;
        font-weight: bolder;
        margin-left:5%;
	}
	
	#backBtn {
		font-family: "Nanum Gothic";
        border-radius: 10px;
        border: solid 1px #9e9e9e5b;
        padding:5px 15px 5px 15px;
        background-color: #e6e4e4b6;
        font-size:10px;
        font-weight: bolder;
        margin-left:78%;
	}
	
	/*페이징 바*/
	#pagingArea {
			text-align:center;
	}
	
	#pagingArea button {
		width: 25px;
		margin-top: 20px;
		border: 0px;
		color: #757575;
		font-family: "Nanum Gothic";
		font-size: 12px;
	}
	
	#pagingArea button:hover {
		cursor:pointer;
	}
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp" %>

		<section id="btSection" class="like_content">
           	<section id="content-1">
            <p>찜하기한 챌린지 그룹</p>
            <div class="line"></div>
        </section>
           		<% if(loginUser != null && cList!=null) { %>
            		<div id="like">
                 		<div id="likeChall">
                 		<table id="likeList">
         			<% for(Challenge chall : cList) { %>
            		<tr>
            			<td>
	          				<input type="hidden" name="challNo" value="<%= chall.getChallNo() %>">
	          				<input type="hidden" name="challstatus" value="<%= chall.getChallStatus() %>">
	          			</td>
	           			<td>
	              			<img src="<%= request.getContextPath()%>/resources/uploadFiles/<%= chall.getChallFile()%>" style="width: 150px;height: 100px;" class="img-size">
	           			</td>
	           	 		<td>카테고리 : <%= chall.getCateName() %></td>
	           	 		<td>챌린지 제목 : <%= chall.getChallTitle() %></td>
	           			<td><button type="button" id="likeDeleteBtn" class="likeUpdateBtn">찜하기 취소</button></td>
                 			</tr>
          			<% } %> 
                 		</table>
                 		</div>
           			</div>
      			<% } else { %>
       				 <div id="like1">찜하기한 챌린지 그룹이 없습니다.</div>
       			<% } %>
    	
 
  <!-- 페이징 바 -->
        <section id="page_css">
            <div id="pagingArea">
            <!-- 처음으로(<<) 이전페이지로(<) 페이지 목록 다음 페이지로(>) 맨 끝으로(>>) -->  
              
            <!-- 처음으로(<<) -->
			
			<button onclick="location.href='<%= request.getContextPath() %>/like/list?currentPage=1'"> &lt;&lt;</button>	
 
			
			<!-- 이전으로(<) -->
			<% if(pi.getCurrentPage() == 1) {%>
			<button disabled> &lt; </button>
			<% } else {%>
	        <button onclick="location.href='<%= request.getContextPath() %>/like/list?currentPage=<%= pi.getCurrentPage() - 1%>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) {%>
			<% if(p == pi.getCurrentPage()) { %>
			<button style="background:lightgray;" disabled><%= p %></button>	
			
			<% } else {%>
			
			<button onclick="location.href='<%= request.getContextPath() %>/like/list?currentPage=<%=p %>'"> <%= p %> </button>
			<% } %>
			<% } %>
            
            <!-- 다음으로(>) -->
			<% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
			<button disabled> &gt;</button>
			
			<% } else {%>
			<button onclick="location.href='<%= request.getContextPath() %>/like/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt;</button><% } %>
             <!-- 맨 끝으로 (>>) -->
			<button onclick="location.href='<%= request.getContextPath() %>/like/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
               
            </div>
            <button id="backBtn" type="button" class="text_font joinform_btn" onclick="javascript:history.back();">뒤로가기</button>
            </section>	
            </section>
       <script>

      $(function(){
    	  //챌린지 찜하기 취소 버튼 클릭 시 찜하기한 챌린지에서 삭제하기
    	  //id는 고유의 값이기 때문에 버튼을 id로 하면 순서대로 적용은 가능하지만 중간에 내가 다른 찜하기 취소를 클릭하면 인식하지 못하고 
    	  //챌린지 리스트로 넘어가게 된다
    	  //class로 버튼 속성을 주면 순서대로 누르지 않아도 적용 가능
    	  $(".likeUpdateBtn").click(function(e){
    		  //likeList에 이벤트를 걸어놔서 버튼에도 이벤트가 걸림 stopProagation으로 막아줌
         	 e.stopPropagation(); 
    		  //td에 있는 버튼 
         	 var num = $(this).parent().parent().children().children().eq(0).val();
	         console.log("num: " + num);
         	 alert("찜하기 취소가 되었습니다");
			  location.href="<%= request.getContextPath() %>/like/hits?challNo=" +num;
          });
          
    	  
       // 챌린지 상세보기 기능 (jQuery를 통해 작업)
 
    	  $(function(){
  			$("#likeList td").mouseenter(function(){
				$(this).parent().css({"background" : "#e0dbf890", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css("background", "none");
			}).click(function(){
  				var challNo = $(this).parent().children().children().eq(0).val();
  				 var status= $(this).parent().children().children().eq(1).val();
  	         	 console.log(status);
  	    		  //찜하기 취소 버튼 클릭 시 넘어가게 하기
  	    		  if(status == 'Y'){
  	    			  alert("챌린지가 삭제되어 챌린지 상세보기를 볼 수 없습니다.");
  	    		  }else{
  	    			location.href='<%= request.getContextPath() %>/chall/join?challNo='+challNo;
  	    		  }
  			});   			
   		});
         
       
         
         
         
      }); 
       
    </script>
            
<%--    	<script>
	 //1.메인으로 돌아가기
	const goMainBtn = document.getElementById('goMainBtn');
	goMainBtn.addEventListener('click',function(){
		location.href='<%= request.getContextPath()%>';
	});
   	</script> --%>
   	
   	<%@ include file="../common/footer.jsp" %>
</body>
</html>