<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, report.model.vo.Report, common.model.vo.PageInfo"%>
<%
	ArrayList<Report> reList = (ArrayList<Report>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	System.out.println("jsp list : "+reList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 body {
            width: 1000px;
            height : 1100px;
        }
        
        #questionBtn {
            width: 130px;
            height: 30px;
            margin:10px;  
            background: #ff60657e;
            border: 0px;
            border-radius: 55px;  
            float: right;     
        }

        #questionBtn a {
            color:white;
            font-family: "Do Hyeon";
            font-size: 16px;
        }

        #con2_title h1{
            width: 1000px;  
            text-align: center;
            margin-top: 25px;
 	        
        }

        .h1_title {
           font-family: "Do Hyeon";
           font-size: 30px;
          /*  color : #757575; */
        }

        #line {
            border: 2px solid rgba(255, 96, 100, 0.7);
            margin-bottom: 10px;
        }

        /* 게시판 */
        #qnaBoard {
            width: 100%;
            height: 400px;      
            border-collapse: collapse;
            
        }

        #qnaBoard th, #qnaBoard td {
            padding: 2px;
            padding-left: 10px;
            text-align: center;
        }

        #tb_title {
            width:60%;
        }
        #tb_author {
            width:20%;
        }
        #tb_date {
            width:10%;
        }
        #tb_num {
            width: 5%;
            padding-left: 2%;
        }
        #th_title {
            background : rgba(240, 240, 240, 0.7);
            height: 30px;
            font-family: "Do Hyeon";
            font-size: 14px;
            color : #757575;
        }

        #write {
            width:55px;
            color:white;
            font-family: "Do Hyeon";
            margin-top : 20px;
            margin-left : 80%;
        }
        #write a {
            font-size: 14px;
        }

        #mywrite {
            width:100px;
            font-family: "Do Hyeon";
            background: none;
            border : 2px solid  #ff60657e;        
        }
        #mywrite a {
            font-size: 14px;
            color: #ff60657e;
        }

        #qnaBoard td:hover {
            cursor : pointer;
        }
        
        /* 페이징바 영역 */
		.pagingArea {
			text-align:center;
		}
		.pagingArea button {
			width:25px;
			margin-top:20px;
			border : 0px;
			background:#fff;
			font-family: "Do Hyeon";
			color : #757575;
		}
		
		.pagingArea button:hover {
			cursor:pointer;
		}
		
		.pagingArea {
			padding-top: 2%;
		}
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	
	 <section id="content" class="content_css">
	 
	 <!-- title -->
        <div id="con2_title">
            <h1 class="h1_title">신 고</h1>
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
						<td colspan="6">존재하는 질문이 없습니다.</td>
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
			<button onclick="location.href='<%= request.getContextPath() %>/report/list?currentPage=1'"> &lt;&lt; </button>
			
			<!-- 이전 페이지로 (<) -->
			<% if(pi.getCurrentPage() == 1){ %>
				<button disabled> &lt; </button>
			<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/report/list?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
				<% if(p == pi.getCurrentPage()){ %>
				<button style="background:lightgray;" disabled> <%= p %> </button>
				<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/report/list?currentPage=<%= p %>'"> <%= p %> </button>				
				<% } %>
			<%} %>
			<!-- 다음 페이지로(>) -->
			<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<button disabled> &gt; </button>
				<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/report/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<button onclick="location.href='<%= request.getContextPath() %>/report/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
		</div>
		
		<%-- 로그인 유저만 작성하기 버튼 보이기 --%>
				<% if(loginUser != null && loginUser.getMembertype() != 0) { %>
				<button id="questionBtn" type="button" 
				onclick="location.href='<%= request.getContextPath() %>/views/report/reportInsertForm.jsp'"><a>신고하기</a></button>
				<% } %>
        </div>
        
	</section>
	
	<script>
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