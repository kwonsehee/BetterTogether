<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, qna.model.vo.QnA, common.model.vo.Search, common.model.vo.PageInfo"%>
<%
	ArrayList<QnA> list = (ArrayList<QnA>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	Search s = (Search)request.getAttribute("search");
	String search = "";
	if(s != null){
		search = s.getSearch();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>F A Q</title>
<style>
		#none {
			display:none;
		 }
 		/* 자주묻는질문 */
        .recruit {
            width:100%;
            border: none;
            }

        .recruit td {
            padding-left: 10px;
            border-radius: 20px;
            border-top: 2px solid #f7dede;
    		border-bottom: none;
    		border-left: none;
            } 

        .hide {
            display:none;
            
            } 

        .show {
            display:table-row; 
            height:100px;
            font-size:20px;
            background-color:#f7dede;
            font-family: "Do Hyeon";
            }

        .question td {
            cursor: pointer;
    		height: 80px;
    		font-size: 20px;
    		background-color: white;
    		border-radius: 20px;
    		font-family: "Do Hyeon";

            }

        
		/* 검색창 */
        div {
            width: 100%;
            box-sizing: border-box;
        }

        #search-area {
            width: 100%;
            height: 100px;
            position: relative;
            padding-top: 5%;
        }

        #search-form {
            height:  40%;
            padding-top: 5%;
            padding-right: 2%;
            /* position이 absolute이고
          	  위치 값을 모두 0으로 만든 뒤
            margin:auto를 하면 가로/세로 중앙 정렬 가능 */
            position: absolute;
            top: 0;
            bottom: -50px;
            left: 50%;
            right: 0;       
        }
 
        #search-text-area {
            height: 100%;
            width: 80%;
            float: left;
            
        }

        #search-btn-area {
            height: 100%;
            width: 15%;
            float: left;
            padding-left: 2%;
        }

        #search-input, #search-btn {
            width: 100%;
            height: 100%;
            box-sizing: border-box;
            border-radius: 10px;
            border: 1px solid #ff6064;
            
        }

        #search-btn{
            background: #ff6064;
            font-family: "Do Hyeon";
            font-size: 20px;
        }
        
        #content1 {
            width: 100%;
            height: 25%;
        }
        
        #content-2 {
            width: 100%;
            height: 70%;
            padding: 40px;
        }
        
        #title {
            width: 100%;
            height: 5%;
        }

        #title p {
            text-align: center;
            font-size: 30px;
        }
        
        .content {
    		width: 100%;
    		height: auto;
    		margin-top: 5px;
    		border-radius: 20px;
    		border: solid 1px #f9f1f1;
    		background-color: #f9f1f1;
    		float: left;
		}
		
		/* 버튼 css */
		.btn {
            width: 130px;
            height: 30px;
            margin:5px;  
            background: #ff60657e;
            border: 0px;
            border-radius: 55px;  
            float: left;     
            color:white;
            font-family: "Do Hyeon";
            font-size: 16px;
        }
        .btnArea {
        	margin: auto;
       	 	padding-top: 5%;
       	 	padding-left:40px;
        }
        
        /* 페이징바 영역 */
		.pagingArea {
			text-align:center;
			padding-bottom: 5PX;
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
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	
	<section class="content">
        <section id="title">
            <p>자주 묻는 질문</p>
        </section>
  
        <section id="content1">
        
        	
  			<!-- 작성 수정 삭제 버튼 -->
            <div id="search-area">
            	<div id="btnArea">
					<% if(loginUser != null && loginUser.getMembertype() == 0) { %>
						<button class="btn" type="button" onclick="location.href='<%= request.getContextPath() %>/views/faq/faqInsertForm.jsp'">FAQ 작성</button>
					<% } %>
				</div>
				
        		<!-- 검색창 -->
                <form action="<%= request.getContextPath() %>/faq/search" method="get" id="search-form">
                    <div id="search-text-area">
                        <input type="search" id="search-input" name="search" value="<%= search %>">
                    </div>
                    <div id="search-btn-area">
                        <button type="submit" id="search-btn">검색</button>
                    </div>
                </form>
            </div>
		
        </section>

        <!-- 아코디언 -->
        <section id="content-2">
             <table cellspacing="0" border="1" class="recruit" id="faqBoard">
       	 		<tbody> 
            		  <%if(list.isEmpty()){ %>
					<tr>
						<td colspan="6">존재하는 FAQ가 없습니다.</td>
					</tr>
					<%} else { %>
						<% for(QnA f : list){ %>
							<% if(f.getQnaType().equals("F")) { %>
						<tr class="question"> 
							<td id="none"><%= f.getQnaNo() %></td>
							<td><%= f.getQnaTitle() %></td>
						</tr>
						<tr class="hide"> 
                			<td><%= f.getQnaContent() %></td> 
            			</tr>
							<%} %>
						<%} %>	
					<%} %> 
        		</tbody> 
			</table>
			
        <script> 
            $(function(){
                var article = (".recruit .show"); 
                $(".recruit .question  td").click(function() { 
                    var myArticle =$(this).parents().next("tr"); 
                    if($(myArticle).hasClass('hide')) { 
                        $(article).removeClass('show').addClass('hide'); 
                        $(myArticle).removeClass('hide').addClass('show'); 
                    } 
                    else { 
                        $(myArticle).addClass('hide').removeClass('show'); 
                    } 
                }); 
            });
    	</script>
        </section>
        
      		<!-- 페이징 바 -->
			<div class="pagingArea">
			<!-- 맨 처음으로 (<<) -->
			<% if(s == null) { %>
			<button onclick="location.href='<%= request.getContextPath() %>/faq/list?currentPage=1'"> &lt;&lt; </button>
			<% } else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/faq/search?currentPage=1&search=<%= search %>'"> &lt;&lt; </button>
			<% } %>
			
			<!-- 이전 페이지로 (<) -->
			<% if(pi.getCurrentPage() == 1){ %>
				<button disabled> &lt; </button>
			<%} else if (s == null){ %>
				<button onclick="location.href='<%= request.getContextPath() %>/faq/list?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
			<% } else {%>
				<button onclick="location.href='<%= request.getContextPath() %>/faq/search?currentPage=<%= pi.getCurrentPage() - 1 %>&search=<%= search %>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
				<% if(p == pi.getCurrentPage()){ %>
				<button style="background:lightgray;" disabled> <%= p %> </button>
				<% } else if (s == null){ %>
				<button onclick="location.href='<%= request.getContextPath() %>/faq/list?currentPage=<%= p %>'"> <%= p %> </button>				
				<% } else {%>
				<button onclick="location.href='<%=request.getContextPath()%>/faq/search?currentPage=<%=p%>&search=<%=search%>'"><%=p %></button>
				<%} %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<button disabled> &gt; </button>
				<%} else if(s == null) { %>
				<button onclick="location.href='<%= request.getContextPath() %>/faq/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
			<% } else { %>
			 	<button onclick="location.href='<%= request.getContextPath() %>/faq/search?currentPage=<%= pi.getCurrentPage() + 1 %>&search=<%= search %>'"> &gt; </button>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<% if (s == null) { %>
			<button onclick="location.href='<%= request.getContextPath() %>/faq/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
			<% } else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/faq/list?currentPage=<%= pi.getMaxPage() %>&search=<%= search %>'"> &gt;&gt; </button>
			<% } %>
			</div>
			
			
			
        <script>
		// 수정 삭제 기능
		<%if(loginUser != null && loginUser.getMembertype() == 0){%>
		$(function(){
			$("#faqBoard td").mouseenter(function(){
				$(this).parent().css({"background":"lightgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css("background", "white");
			}).click(function(){
				var qnaNo = $(this).parent().children().eq(0).text();
				
				location.href='<%= request.getContextPath() %>/faq/updateForm?qnaNo=' + qnaNo;
		
				});
			});
		<% } %>
		</script>
    </section>

</body>
</html>