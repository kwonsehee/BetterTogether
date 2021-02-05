<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, challenge.model.vo.Challenge, common.model.vo.*"%>
<%
	ArrayList<Challenge> cList = (ArrayList<Challenge>)request.getAttribute("cList");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
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
	#joinList {
		width: 80%;
        /*  height: 400px;       */
         border-collapse: collapse;
         margin-top:20px;
         margin:auto;
	}
	
	#join {
		width:80%;
		margin:auto;
	}
	
	#joinList th, #joinList td {
		border-bottom: 1px solid #75757552;
		padding: 2px;
	} 
	
	#joinList th {
		background:#fff;
	}
	
	#joinList td {
		height : 30px;
	}
	
	#th_beforeNo {
		width: 10%;
	}
	
	#th_beforeCate {
		width : 30%;
	}
	
	#th_beforeTitle {
		width:40%;
	}
	
	#th_beforePeriod {
		width:60%
	}
	
	#th_title{
		 background : rgba(240, 240, 240, 0.7);
         height: 30px;
         font-family: "Nanum Gothic";
         font-size: 14px;
         color : #757575;
	}
	
	#joinChall {
		margin-top:20px;
		padding-bottom:20px;
	}
	
	/*버튼*/
	
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
	<section id="btSection" class="joining_content">
		<section id="content-1">
            <p>시작 전 챌린지 그룹</p>
            <div class="line"></div>
        </section>
          <% if(loginUser!=null && cList!=null) { %>
            <div id="join">
                 <div id="joinChall">
                 <table id="joinList">
                   <!--  <tr id="th_title">
                    	<th id="th_beforeNo">챌린지 번호</th>
                    	<th id="th_beforeCate">카테고리</th>
                       <th id="th_beforeTitle">챌린지 명</th>
                       <th id="th_beforePeriod">챌린지 기간</th>
                    
                    </tr> -->
         <% for(Challenge chall : cList) { %>
            <tr>
				 <td>
	          	<input type="hidden" name="challNo" value="<%= chall.getChallNo() %>">
	          </td>
	           <td>
	              <img src="<%= request.getContextPath()%>/resources/uploadFiles/<%= chall.getChallFile()%>" style="width: 150px;height: 100px;" class="img-size">
	           </td>
	           	 <td>카테고리 : <%= chall.getCateName() %></td>
	           	 <td>챌린지 제목 : <%= chall.getChallTitle() %></td>
	           <td>
	           	챌린지 기간 : <%=chall.getChallStart() %>~<%= chall.getEndDate() %>
	           </td>
            </tr>
          <% } %> 
                 </table>
                 </div>
           </div>
      <% } else { %>
        <div id="joined1">시작전인 챌린지그룹이 없습니다.</div>
       <% } %>
       
        <!-- 페이징 바 -->
        <section id="page_css">
            <div id="pagingArea">
            <!-- 처음으로(<<) 이전페이지로(<) 페이지 목록 다음 페이지로(>) 맨 끝으로(>>) -->  
              
            <!-- 처음으로(<<) -->
			
			<button onclick="location.href='<%= request.getContextPath() %>/joining/list?currentPage=1'"> &lt;&lt;</button>	
 
			
			<!-- 이전으로(<) -->
			<% if(pi.getCurrentPage() == 1) {%>
			<button disabled> &lt; </button>
			<% } else {%>
	        <button onclick="location.href='<%= request.getContextPath() %>/joining/list?currentPage=<%= pi.getCurrentPage() - 1%>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) {%>
			<% if(p == pi.getCurrentPage()) { %>
			<button style="background:lightgray;" disabled><%= p %></button>	
			
			<% } else {%>
			
			<button onclick="location.href='<%= request.getContextPath() %>/joining/list?currentPage=<%=p %>'"> <%= p %> </button>
			<% } %>
			<% } %>
            
            <!-- 다음으로(>) -->
			<% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
			<button disabled> &gt;</button>
			
			<% } else {%>
			<button onclick="location.href='<%= request.getContextPath() %>/joining/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt;</button><% } %>
             <!-- 맨 끝으로 (>>) -->
			<button onclick="location.href='<%= request.getContextPath() %>/joining/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
               
            </div>
            	 <button id="backBtn" type="button" class="text_font joinform_btn" onclick="javascript:history.back();">뒤로가기</button>
    		</section>
        </section>
    	 <script>
       // 챌린지 상세보기 기능 (jQuery를 통해 작업) 
      $(function(){
         $("#joinList td").mouseenter(function(){
            $(this).parent().css("background","#937cf755");
         }).mouseout(function(){
            $(this).parent().css("background", "none");
         }).click(function(){
            var num = $(this).parent().children().eq(0).text();
            var status = $(this).parent().children().eq(1).text();
           
            	 // 쿼리 스트링을 이용하여 get방식으로 글 번호를 전달 
                location.href="<%= request.getContextPath() %>/chall/join?challNo=" +num;
            
            
         });
      });
       
    </script>

   	<script>
	 //1.메인으로 돌아가기
	const goMainBtn = document.getElementById('goMainBtn');
	goMainBtn.addEventListener('click',function(){
		location.href='<%=request.getContextPath()%>';
	});
   	</script>
   	
   	<%@ include file="../common/footer.jsp" %>
</body>
</html>