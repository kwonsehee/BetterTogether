<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, report.model.vo.Report, common.model.vo.PageInfo"%>
<%
ArrayList<Report> reList = (ArrayList<Report>)request.getAttribute("list");
PageInfo pi = (PageInfo)request.getAttribute("pi");
System.out.println("jsp list : "+reList);%>

<%if(session.getAttribute("msg") != null){ %>
<script>
	alert('<%=session.getAttribute("msg") %>');
	
</script>
<%
	session.removeAttribute("msg");
 	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 신고한 글</title>
<style>
	#report_form{
        width: 950px;
      height: 1000px;
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
            margin-left: 350px;
        }
        
     #report {
            background-color: white;
            width: 850px;
            height: 800px;
            text-align: center;
            font-family: "Do Hyeon";
            font-size: 24px;
            border-radius: 20px;
        }
       #goMainBtn{
            border: 1px solid #fdc8c6;
            background-color: #fdc8c6;
            border-radius: 20px;
            font-family: "Do Hyeon";
            font-size: 18px;
            margin-left : 400px;
            margin-top : 100px;
        }  
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp" %>

	<section id="report_form">
		
          
		<h1 id="title">내가 신고한 글</h1>
        </div>
        <div id="line"></div>
        
        <!-- qnaBoard -->
        <div id="board_div">
            <table id="qnaBoard">
                <thead>
                    <tr id="th_title">
                        <th id="tb_num">번호</th>
                        <th id="tb_title">제목</th>
                        <th id="tb_author">신고 날짜</th>
                        <th id="tb_date">처리여부</th>
                    </tr>
                </thead>
                <tbody>
                    <%if(reList.isEmpty()){ %>
					<tr>
						<td colspan="6">내가 신고한 내역이 없습니다.</td>
					</tr>
					<%} else { %>
						<% for(Report r : reList){ %>
						<% if(r.getReport_Status().equals("N")) { %>
						<tr>
							<td><%= r.getReport_no() %></td>
							<td><%= r.getReport_title() %></td>
							<td><%= r.getReport_date() %></td>
							<td><%= r.getT_f() %></td>
						</tr>
							<%} %>
						<%} %>	
					<%} %>
                </tbody>
            </table>
            
            

            <!-- 페이징 바 -->
			<div class="pagingArea">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%= request.getContextPath() %>/report/mylist?currentPage=1'"> &lt;&lt; </button>
			
			<!-- 이전 페이지로 (<) -->
			<% if(pi.getCurrentPage() == 1){ %>
				<button disabled> &lt; </button>
			<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/report/mylist?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
				<% if(p == pi.getCurrentPage()){ %>
				<button style="background:lightgray;" disabled> <%= p %> </button>
				<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/report/mylist?currentPage=<%= p %>'"> <%= p %> </button>				
				<% } %>
			<%} %>
			<!-- 다음 페이지로(>) -->
			<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<button disabled> &gt; </button>
				<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/report/mylist?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<button onclick="location.href='<%= request.getContextPath() %>/report/mylist?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
			</div>
			
				
        </div>
        
    <button id="goMainBtn" type="button" class="text_font joinform_btn">메인으로</button>
    </section>
    
    
    <script>
		 //1.메인으로 돌아가기
		const goMainBtn = document.getElementById('goMainBtn');
		goMainBtn.addEventListener('click',function(){
			location.href="<%= request.getContextPath()%>";
		});
		
		// 게시판 상세보기 기능
		$(function(){
			$("#qnaBoard td").mouseenter(function(){
				$(this).parent().css({"background":"lightgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css("background", "#f9f1f1");
			}).click(function(){
				var rNo = $(this).parent().children().eq(0).text();
				
				// 로그인 한 사람만 게시글 상세 페이지 접근 가능하도록
				<% if(loginUser != null) { %>
					location.href='<%= request.getContextPath() %>/report/detail?rNo=' + rNo;
				<% } else { %>
					alert('로그인 해야만 게시글 보기가 가능합니다.');
				<% } %>
			});
		});
    </script>
</body>
</html>