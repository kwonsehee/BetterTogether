<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, qna.model.vo.QnA, common.model.vo.PageInfo"%>
 <% 
	ArrayList<QnA> qnaList = (ArrayList<QnA>)request.getAttribute("list");
 	PageInfo pi = (PageInfo)request.getAttribute("pi");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
<%-- <link rel="stylesheet" href='<%=request.getContextPath()%>/resources/css/qnaStyle.css'>--%>
<style>

        #questionBtn {
            font-family: "Nanum Gothic";
			border-radius: 10px;
    		border: solid 1px #9e9e9e5b;
    		padding: 5px 15px 5px 15px;
    		background-color: #e6e4e4b6;
    		font-size: 10px;
    		font-weight: bolder;
    		float: right;
    		margin-top: 5%;
    		margin-bottom: 1%;
        }

        #con2_title h1{
   
            text-align: center;
            font-family: "Nanum Gothic";
    		color: #757575;
    		font-size:24px;
   
        }

		#btSection{
			padding-bottom:40px;
		}
		
        #line {
           border: 0.5px solid #937cf790;
           width: 80%;
           margin: auto;
        }

        /* 게시판 */
        #qnaBoard {
            width: 100%;
           /*  height: 400px;      */ 
            border-collapse: collapse;
            
        }

        #qnaBoard th, #qnaBoard td {
            border-bottom: 1px solid #75757552;
            padding: 2px;
            padding-left: 10px;
            text-align: center;
            color : #757575;
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
            background: white;
           /* background : rgba(240, 240, 240, 0.7);*/
            height: 30px;
            font-family: "Nanum Gothic";
            font-size: 14px;
            color : #757575;
        }

        #write {
            width:55px;
            color:white;
            font-family: "Nanum Gothic";
            margin-top : 20px;
            margin-left : 80%;
        }
        #write a {
            font-size: 14px;
        }

        #mywrite {
            width:100px;
            font-family: "Nanum Gothic";
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
        
        #qnaBoard #title {
        	
    		text-align: center;
        }
        
        /* 페이징바 영역 */
		.pagingArea {
			text-align:center;
			padding-left: 6%;
    		margin: auto;
		}
		.pagingArea button {
			width:25px;
			margin-top:20px;
			border : 0px;
			color : #757575;
			font-family: "Nanum Gothic";
			font-size:12px;
		}
		
		.pagingArea button:hover {
			cursor:pointer;
		}
		
		#board_div{	
			width:80%;
			margin:auto;
		}
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	
	 <section id="btSection" class="qnaSection">
	 
	 <!-- title -->
        <div id="con2_title">
            <h1 class="h1_title">Q & A</h1>
        </div>
        
        <div id="line"></div>
        
        <!-- qnaBoard -->
        <div id="board_div">
            <table id="qnaBoard">
                <thead>
                    <tr id="th_title">
                        <th id="tb_num">번호</th>
                        <th id="tb_title">제목</th>
                        <th id="tb_author">작성자</th>
                        <th id="tb_date">날짜</th>
                    </tr>
                </thead>
                <tbody>
                    <%if(qnaList.isEmpty()){ %>
					<tr>
						<td colspan="6">존재하는 질문이 없습니다.</td>
					</tr>
					<%} else { %>
						<% for(QnA q : qnaList){ %>
							<% if(q.getQnaType().equals("Q")) { %>
						<tr>
							<td><%= q.getQnaNo() %></td>
							<td><%= q.getQnaTitle() %></td>
							<td><%= q.getUserId()%></td>
							<td><%= q.getQnaDate()%></td>
						</tr>
							<%} %>
						<%} %>	
					<%} %>
                </tbody>
            </table>
            
            
		<%-- 로그인 유저만 작성하기 버튼 보이기 --%>
				<% if(loginUser != null) { %>
				<button id="questionBtn" type="button" 
				onclick="location.href='<%= request.getContextPath() %>/views/qna/qnaInsertForm.jsp'">질문하기</button>
				<% } %>

            <!-- 페이징 바 -->
			<div class="pagingArea">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%= request.getContextPath() %>/qna/list?currentPage=1'"> &lt;&lt; </button>
			
			<!-- 이전 페이지로 (<) -->
			<% if(pi.getCurrentPage() == 1){ %>
				<button disabled> &lt; </button>
			<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/qna/list?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
				<% if(p == pi.getCurrentPage()){ %>
				<button style="background:lightgray;" disabled> <%= p %> </button>
				<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/qna/list?currentPage=<%= p %>'"> <%= p %> </button>				
				<% } %>
			<%} %>
			<!-- 다음 페이지로(>) -->
			<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<button disabled> &gt; </button>
				<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/qna/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<button onclick="location.href='<%= request.getContextPath() %>/qna/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
			</div>
		
      	</div>
        
	</section>
	
	<script> 
		// 게시판 상세보기 기능
		$(function(){
			$("#qnaBoard td").mouseenter(function(){
				$(this).parent().css({"background":"#937cf790", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css("background", " none");
			}).click(function(){
				var qnaNo = $(this).parent().children().eq(0).text();
				
				<% if(qnaList.isEmpty()) { %>
					$("#qnaBoard td").off(click);
				<% } %>
				
				// 로그인 한 사람만 게시글 상세 페이지 접근 가능하도록
				<% if(loginUser != null) { %>
					location.href='<%= request.getContextPath() %>/qna/detail?qnaNo=' + qnaNo;
				<% } else { %>
					alert('로그인 해야만 게시글 보기가 가능합니다.');
				<% } %>
			});
		});
	</script>
	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>