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
  
  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 모집한 챌린지 그룹</title>
<style>
   #myJoinChallForm{
        width: 950px;
      height: 800px;
      /* border: 1px solid black; */
      margin-top: -6%;
      padding-left: 5%;
       background-color: #f9f1f1;
       border-radius: 20px;
        } 
    
    #title{
            margin-top: 70px;
            font-family: "Do Hyeon";
            font-size: 36px;
            margin-left: 300px;
        }

    .mychallContent {
        background-color: white;
        width: 900px;
        height: 125px;
        text-align: center;
        font-family: "Do Hyeon";
        font-size: 24px;
        border-radius: 20px;
        margin:7px;
    }

    #updateBtn{
        border: 1px solid #fdc8c6;
        background-color: #fdc8c6;
        border-radius: 20px;
        font-family: "Do Hyeon";
        font-size: 18px;
        margin-left: 360px;
    }

    #deleteBtn{
        border: 1px solid #fdc8c6;
        background-color: #fdc8c6;
        border-radius: 20px;
        font-family: "Do Hyeon";
        font-size: 18px;
    }
   
    #goMainBtn{
            border: 1px solid #fdc8c6;
            background-color: #fdc8c6;
            border-radius: 20px;
            font-family: "Do Hyeon";
            font-size: 18px;
            float:right;
            margin-top:-110px;
            margin-right:150px;
        }  
        
      .img-size{
         width: 150px;
         height: 100px;
      }
      
      #table-wrap{
         padding:50px;
         margin:30px;
      }
      
      .img-size:hover{
      	opacity:0.8;
      	cursor:pointer;
      }
      
      input[type="checkbox"]{
         padding-top:-20px;
      }
      
      .challInfo{
      font-family: "Do Hyeon";
      width: 80px;
      height: 30px;
      border-radius: 20px;
      border: solid 1px #fdc8c6;
      background-color: white;
      font-size: 20px;
   }
   
   #tableDIv{
      width:20px;
      height:20px;
      border: solid 1px red;
   }
   
    /*페이징 css*/
        #pagingArea {
    	  margin:auto;
  	   }
      	#pagingArea button {
            font-family: "Do Hyeon";
            font-size : 18px;
            color: black;
            text-decoration: none;
            border: solid 1px #fdc8c6;
            background-color: #fdc8c6;
            
        }
        
         #page_css {
            width: 100%;
            height: 20%;
            float: left;
            padding-top: 50px;
            padding-left: 400px;
        }
      
 
</style>
</head>
<body>
   <%@ include file="../common/common_ui.jsp" %>
      <section id="content-1">
       <h1 id="title">내가 모집한 챌린지그룹</h1>
      <table id="table-wrap">
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
                  <p><button class="challInfo">주 <%=ch.getChallFrequency() %>회</button> <button class="challInfo"><%=ch.getChallPeriod() %> 주</button></p>
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
        </table>
        </section> 
        
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
			<button style="background:white;" disabled><%= p %></button>
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
            
         </section>
        
        
         <!-- <button type="button" id="updateBtn">수정</button> -->
         <!-- <button type="button" id="deleteBtn">삭제</button> -->
        <button id="goMainBtn" type="button" class="text_font joinform_btn">메인으로</button>
        
      <script>
	    //1.메인으로 돌아가기
	   const goMainBtn = document.getElementById('goMainBtn');
	   goMainBtn.addEventListener('click',function(){
	      location.href='<%=request.getContextPath()%>';
	   });
   		
	    // 내가 모집한 챌린지 클릭시 상세보기로 가게 
	   	$(function(){
			$("#table-wrap td:nth-child(n+2):nth-child(-n+3)").click(function(){
				var challNo = $(this).parent().children().children().eq(0).val();
				console.log(this);
				location.href='<%= request.getContextPath() %>/chall/join?challNo='+challNo;
			});   			
		});
    
      </script>
            
</body>
</html>