<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, challenge.model.vo.*, common.model.vo.* ,java.util.*, java.util.ArrayList, java.text.SimpleDateFormat, java.text.DateFormat"%>
<%
   // 내가 모집한 챌린지 조회
   ArrayList<Challenge> list = (ArrayList<Challenge>)request.getAttribute("list");
	
  // 페이징 처리 
  PageInfo pi = (PageInfo)request.getAttribute("pi");
  
  //오늘 날짜 구하기
  Date date= new Date();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  String today = sdf.format(date);
  
  System.out.println("list : " + list);
  
  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
<style>
	#btSection {
		padding-bottom: 100px;
	}
	
	 .line {
		border: 0.5px solid #937cf790;
	}
        
	 #content-1 p{
     /*        border:solid 1px red;  */
            font-size: 24px;
            text-align: center;
            color : #757575;
          
   }
	
	#table-wrap {
		margin:auto;
		margin-top : 10px;
		padding-bottom:50px;
	}

	
	/* 버튼 css */
	#updateBtn {
		font-family: "Nanum Gothic";
        border-radius: 10px;
        border: solid 1px #9e9e9e5b;
        padding:2px 25px 2px 25px;
        background-color: #e6e4e4b6;
        font-size:10px;
        font-weight: bolder;
        margin-top:20px;
	}
	
	#deleteBtn {
		font-family: "Nanum Gothic";
        border-radius: 10px;
        border: solid 1px #9e9e9e5b;
        padding:2px 25px 2px 25px;
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
	
	/**/
	.challInfo {
		font-family: "Nanum Gothic";
        border-radius: 10px;
        border: solid 1px #9e9e9e5b;
        padding:5px 15px 5px 15px;
        background-color: #e6e4e4b6;
        font-size:10px;
        font-weight: bolder;
	}
	
	/*페이징 바*/
	#pagingArea {
			text-align:center;
		}
		
	#pagingArea button {
		width:25px;
		margin-top:20px;
		border : 0px;
		color : #757575;
		font-family: "Nanum Gothic";
		font-size:12px;
		margin-top:70px;
	}
		
	#pagingArea button:hover {
		cursor:pointer;
	}
	
	/* 디자인 수정 */
	#joinTitle{
	margin-top: 50px;
           text-align: center;
           font-size: 24px;
           color : #757575;
	}
	
	.challArea {
	width: 90%;
	min-height: 400px;
	margin: auto;
	padding-left: 13%;
}

.chall_list {
	width: 220px;
	display: inline-block;
	padding: 20px;
	margin: 20px;
	text-align: left;
}

#call_img {
	border-radius: 5px;
}

/* 챌린지 info css */
.chall_info {
	margin: 7px;
	font-family: "Nanum Gothic";
	font-size: 15px;
}

#chall_No, #chall_start {
	font-size: 12px;
	color: #616161b6;
	font-weight: bolder;
}

#chall_title {
	font-size: 13px;
	color: #252525b6;
	font-weight: bold;
}

#chall_freq, #chall_period {
	font-family: "Nanum Gothic";
	width: 60px;
	height: 30px;
	border-radius: 3px;
	border: solid 1px #e6e4e4b6;
	font-size: 11px;
	color: #616161b6;
	font-weight: bold;
	background-color: #e6e4e4b6;
	margin-left: 3%;
}

#check_img {
	width: 10px;
	height: 10px;
}

#call_img {
	border-radius: 5px;
}

#updateBtn:focus, #deleteBtn:focus, #backBtn:focus{
	outline: none;
	border: solid 1px #937CF7;
	background-color: #e0dbf890;
}

.empty_chall{
        	color : #937cf790;
        	margin-top : 5%;
        	font-size : 35p;
        	font-family:"Nanum Gothic";

        	text-align : center;
        }
	
</style>
</head>
<body>
   <%@ include file="../common/common_ui.jsp" %>
      <section id="btSection">
            <p id="joinTitle">내가 모집한 챌린지 그룹</p>
            <div class="line"></div>
            <% if(list.isEmpty()){ %>
            <h1 class="empty_chall">내가 모집한 챌린지가 없습니다.</h1>
            <% } else { %>
            <div class="challArea">
            <% for(Challenge ch : list) {%>
            <div class="chall_list">
            	<input type="hidden" value="<%=ch.getChallNo() %>">	
            	<img src="<%= request.getContextPath()%>/resources/uploadFiles/<%= ch.getChallFile()%>" id="call_img" style="width: 200px;height: 150px;" class="img-size">
            	<p id="chall_No" class="chall_info"><img
						src="<%=request.getContextPath()%>/resources/images/challCheck.png"
						id="check_img"> 공식 챌린지
					<p id="chall_title" class="chall_info"><%=ch.getChallTitle() %></p>	
					<button id="chall_freq" disabled>주 <%=ch.getChallFrequency() %>회</button>
					<button id="chall_period" disabled><%=ch.getChallPeriod() %>주 동안</button><br>
					<% 
	               	 Date from = ch.getChallStart();
	           		 SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
	           		 String startDate = transFormat.format(from);
	               	%>
	               	<% int compare = today.compareTo(startDate);%>
	               	<!-- 시작전 챌린지만 보이게 -->
	               	<%if(!(compare < 0)) {%>
	               	 <button id="updateBtn" disabled>수정</button>
	                <button id="deleteBtn" disabled>삭제</button>
	               	<% } else {%>
	                <button id="updateBtn" onclick="location.href='<%= request.getContextPath() %>/join/update?challNo=<%=ch.getChallNo()%>'">수정</button>
	                <button id="deleteBtn" onclick="location.href='<%= request.getContextPath() %>/join/delete?challNo=<%=ch.getChallNo()%>'">삭제</button>
	                <% } %>
            </div>
            <%} %>
           <%} %>
         	</div>
            
            
            
      <%-- <table id="table-wrap">
      <%if(list.isEmpty()) {%>
      <tr><td colspan="4">내가 모집한 챌린지가 없습니다.</td>
      <% } else {%>
      <% for(Challenge ch : list) {%>
            <tr>
               <td>
                  <input type="hidden" name="challNo" value="<%= ch.getChallNo() %>">
               </td>
               <td>
                  <img src="<%= request.getContextPath()%>/resources/uploadFiles/<%= ch.getChallFile()%>" style="width: 150px;height: 100px;" class="img-size">
               </td>
               <td>
                  <span><%=ch.getChallTitle() %></span>
                  <p><button class="challInfo">주 <%=ch.getChallFrequency() %></button> <button class="challInfo"><%=ch.getChallPeriod() %> 주</button></p>
               </td>
               <td>
               <% 
               	 Date from = ch.getChallStart();
           		 SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
           		 String startDate = transFormat.format(from);
               %>
               <% int compare = today.compareTo(startDate);%>
               <!-- 시작전 챌린지만 보이게 -->
               <%if(!(compare < 0)) {%>
               <% } else {%>
                <button id="updateBtn" onclick="location.href='<%= request.getContextPath() %>/join/update?challNo=<%=ch.getChallNo()%>'">수정</button>
                <button id="deleteBtn" onclick="location.href='<%= request.getContextPath() %>/join/delete?challNo=<%=ch.getChallNo()%>'">삭제</button>
                <% } %>
               </td>
            </tr>
          <% } %>
          <% } %>
        </table> --%>
        <!-- 페이징 바 -->
        <section id="page_css">
            <div id="pagingArea">
            <!-- 처음으로(<<) 이전페이지로(<) 페이지 목록 다음 페이지로(>) 맨 끝으로(>>) -->  
              
            <!-- 처음으로(<<) -->
			<button onclick="location.href='<%= request.getContextPath() %>/challMake/list?currentPage=1'"> &lt;&lt;</button>	
			
			<!-- 이전으로(<) -->
			<% if(pi.getCurrentPage() == 1) {%>
			<button disabled> &lt; </button>
			<% } else {%>
	        <button onclick="location.href='<%= request.getContextPath() %>/challMake/list?currentPage=<%= pi.getCurrentPage() - 1%>'"> &lt; </button>
			<% } %>
			
			<!-- 7개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) {%>
			<% if(p == pi.getCurrentPage()) { %>
			<button style="background:lightgray;" disabled><%= p %></button>
			<% } else {%>
			<button onclick="location.href='<%= request.getContextPath() %>/challMake/list?currentPage=<%=p %>'"> <%= p %> </button>
			<% } %>
			<%} %>
            
            <!-- 다음으로(>) -->
			<% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
			<button disabled> &gt;</button>
			<% } else {%>
			<button onclick="location.href='<%= request.getContextPath() %>/challMake/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt;</button>
			<% } %>
              
             <!-- 맨 끝으로 (>>) -->
			<button onclick="location.href='<%= request.getContextPath() %>/challMake/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
            </div>
            <button id="backBtn" type="button" class="text_font joinform_btn" onclick="javascript:history.back();">뒤로가기</button>
            
         </section>
        
        </section> 
        
        
         <!-- <button type="button" id="updateBtn">수정</button> -->
         <!-- <button type="button" id="deleteBtn">삭제</button> -->
        
      <script>
	    //1.메인으로 돌아가기
   		
	    // 내가 모집한 챌린지 클릭시 상세보기로 가게 (이미지 클릭)
	    $(function(){
			$(".chall_list > img").click(function(){
				var challNo = $(this).parent().children().eq(0).val();
				location.href='<%= request.getContextPath() %>/chall/join?challNo='+challNo;
			});   			
 		});
	    
	   	<%-- $(function(){
			$("#table-wrap td:nth-child(n+2):nth-child(-n+3)").click(function(){
				var challNo = $(this).parent().children().children().eq(0).val();
				console.log(this);
				location.href='<%= request.getContextPath() %>/chall/join?challNo='+challNo;
			});   			
		}); --%>
    
      </script>
       <%@ include file="../common/footer.jsp" %>     
</body>
</html>