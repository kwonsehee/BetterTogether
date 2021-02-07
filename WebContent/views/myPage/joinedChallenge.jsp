<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, challenge.model.vo.Challenge, common.model.vo.*"%>
<%
   ArrayList<Challenge> cList = (ArrayList<Challenge>)request.getAttribute("cList");
   
      
      PageInfo pi = (PageInfo)request.getAttribute("pi");

   	int month = Integer.parseInt((String.valueOf(request.getAttribute("month"))));
      
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
	
	/*버튼 영역*/
	#threeMonsBtn {
		font-family: "Nanum Gothic";
        border-radius: 10px;
        border: solid 1px #9e9e9e5b;
        padding:5px 15px 5px 15px;
        background-color: #e6e4e4b6;
        font-size:10px;
        font-weight: bolder;
        margin-left:43%;
        margin-top: 20px;
	}
	
	#sixMonsBtn {
		font-family: "Nanum Gothic";
        border-radius: 10px;
        border: solid 1px #9e9e9e5b;
        padding:5px 15px 5px 15px;
        background-color: #e6e4e4b6;
        font-size:10px;
        font-weight: bolder;
	}
	
	#oneyearBtn {
		font-family: "Nanum Gothic";
        border-radius: 10px;
        border: solid 1px #9e9e9e5b;
        padding:5px 15px 5px 15px;
        background-color: #e6e4e4b6;
        font-size:10px;
        font-weight: bolder;
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
	
	/*게시판*/
	#joinedList {
		 width: 80%;
         /*  height: 400px;       */
          border-collapse: collapse;
          margin:auto;
          margin-top:30px;
          font-size:14px;
          font-family: "Nanum Gothic";
	}
	
	#joined {
		width:80%;
		margin:auto;
		
	}
	
	#joinedList th, #joinedList td {
		 border-bottom: 1px solid #75757552;
         padding: 2px;
	}
	
	#joinedList th {
		background:#fff;
	}
	
	#joinedList td {
		height : 30px;
	}
	
	#th_joinedNo {
		width : 10%;
	}
	
	#th_joinedCate {
		width : 30%
	}
	
	#th_joinedTitle {
		width : 40%;
	}
	
	#th_joinedPeriod {
		width : 60%;
	}
	
	#th_title{
		 background : rgba(240, 240, 240, 0.7);
         height: 30px;
         font-family: "Nanum Gothic";
         font-size: 14px;
         color : #757575;
	}
	
	
	 /* 페이징바 영역 */
	#pagingArea {
	text-align: center;
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
		cursor: pointer;
	}
</style>
</head>
<body>
   <%@ include file="../common/common_ui.jsp"%>  
   
   <section id="btSection" class="joined_content">
      <%if(month>0){ %>
      <section id="content-1">
            <p><%= month %>개월전 참여했던 챌린지 그룹</p>
            <div class="line"></div>
        </section>     	 
      <%}else{ %>
         <section id="content-1">
            <p>참여했던 챌린지 그룹</p>
            <div class="line"></div>
        </section>
      <%} %>
      <% if(loginUser!=null && cList!=null) { %>
  
 	 <form action="<%= request.getContextPath() %>/joined/list" method="post">
        	<span id="btnType_area">
				<button id="threeMonsBtn" type="submit" name="month" value="3">3개월 전</button>
				<button id="sixMonsBtn" type="submit" name="month" value="6">6개월 전</button>
				<button id="oneyearBtn" type="submit" name="month" value="12">12개월 전</button>
			</span>
        </form>
        
      
            <div id="joined">
                 <div id="joinedChall">
                 <table id="joinedList">
         <% for(Challenge chall : cList) { %>
         <tr>
        <td id="chall_no">
                  <input type="hidden" value="<%= chall.getChallNo() %>">
             </td>
               <td>
                  <img src="<%= request.getContextPath()%>/resources/uploadFiles/<%= chall.getChallFile()%>" 
                  style="width: 150px;height: 100px;" class="img-size">
               </td>
               	 <td>카테고리 : <%= chall.getCateName() %></td>
               	 <td>챌린지 제목 : <%= chall.getChallTitle() %></td>
               <td>
               	챌린지 기간 : <%=chall.getChallStart() %>~<%= chall.getEndDate() %>
               </td>
          <% } %> 
          </tr>
                 </table>
                 </div>
           </div>
      <% } else { %>
        <div id="joined1">참여했던 챌린지그룹이 없습니다.</div>
       <% } %>
      
   <!-- 페이징 바 -->
        <section id="page_css">
            <div id="pagingArea">
            <!-- 처음으로(<<) 이전페이지로(<) 페이지 목록 다음 페이지로(>) 맨 끝으로(>>) -->  
              
            <!-- 처음으로(<<) -->
			<% if(month>0){%>
			<button onclick="location.href='<%= request.getContextPath() %>/joined/list?month=<%=month%>&currentPage=1'"> &lt;&lt;</button>	
			<%}else{ %>      
			<button onclick="location.href='<%= request.getContextPath() %>/joined/list?currentPage=1'"> &lt;&lt;</button>	
 			<% } %>
			
			<!-- 이전으로(<) -->
			<% if(pi.getCurrentPage() == 1) {%>
			<button disabled> &lt; </button>
			<% } else {%>
				<% if(month>0){%>
				    <button onclick="location.href='<%= request.getContextPath() %>/joined/list?month=<%=month%>&currentPage=<%= pi.getCurrentPage() - 1%>'"> &lt; </button>
		
				<%}else{ %>
				    <button onclick="location.href='<%= request.getContextPath() %>/joined/list?currentPage=<%= pi.getCurrentPage() - 1%>'"> &lt; </button>
				<%} %>
	    	<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) {%>
			<% if(p == pi.getCurrentPage()) { %>
			<button style="background:lightgray;" disabled><%= p %></button>	
			
			<% } else {%>
				<% if(month>0){%>
				    <button onclick="location.href='<%= request.getContextPath() %>/joined/list?month=<%=month%>&currentPage=<%=p %>'"> <%= p %> </button>
				<%}else{ %>
					<button onclick="location.href='<%= request.getContextPath() %>/joined/list?currentPage=<%=p %>'"> <%= p %> </button>	
				<% } %>
			<% } %>
            <% } %>
            <!-- 다음으로(>) -->
			<% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
			<button disabled> &gt;</button>
			
			<% } else {%>
				<% if(month>0){%>
				    <button onclick="location.href='<%= request.getContextPath() %>/joined/list?month=<%=month%>&currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt;</button>
				<%}else{ %>
					<button onclick="location.href='<%= request.getContextPath() %>/joined/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt;</button>
				<% } %>
			<% } %>
             <!-- 맨 끝으로 (>>) -->
 
			<% if(month>0){%>
				<button onclick="location.href='<%= request.getContextPath() %>/joined/list?month=<%=month%>&currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
			<%}else{ %>            
				<button onclick="location.href='<%= request.getContextPath() %>/joined/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
             <% } %>  
            </div>
                <button id="backBtn" type="button" class="text_font joinform_btn" onclick="javascript:history.back();">뒤로가기</button>
            
      
   
        </section>

    </section>
    
     <script>
       // 챌린지 상세보기 기능 (jQuery를 통해 작업) 
     $(function(){
			$("#joinedList td").mouseenter(function(){
				$(this).parent().css({"background" : "#e0dbf890", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css("background", "none");
			}).click(function(){
				var challNo = $(this).parent().children().children().eq(0).val();
				location.href='<%= request.getContextPath() %>/confirm/result?cno='+challNo;
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