<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, notice.model.vo.Notice"%>
<%
	ArrayList<Notice> list= (ArrayList<Notice>)request.getAttribute("list");
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
 <style>
        
        #title{
            width: 100%;
        }
        #title h1 {
            font-size: 30px;
            font-family: "Do Hyeon";
            text-align: center;
            padding-top: 10px;
        }
        .article_table {
            font-family: "Do Hyeon";
            font-size: medium;
            margin-top: 20px;
            margin-left:40px;
            width: 90%;
            border-top: 2px solid #ff6064;
            border-collapse: collapse;
        }

        .article_table th,.article_table td {
            border-bottom: 1px solid #444444;
            padding: 10px;
            text-align: center;
        }

        #page_css {
            width: 100%;
            height: 20%;
            float: left;
            padding-top: 50px;
            padding-left: 350px;
        }

        .sr-only,
        .page-link {
            color: black;
            padding-left: 10px;
            font-family: "Do Hyeon";
            height: 40px;
            background-color: #fdc8c6;
        }
        .article_btn {
            font-family: "Do Hyeon";
            font-size : 20px;
            width: 130px;
            height: 50px;
            border-radius: 20px;
            border: solid 1px #fdc8c6;
            background-color: #fdc8c6;
       
        }
        /*페이징 css*/
        .pagination {
            display: inline-block;
        }

        .pagination a {
            font-family: "Do Hyeon";
            color: black;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
        }
  		#notice_area{
  			padding-left:25%;
  		}
    </style>
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>
	<section id="content" class="content_css">
        <div id="title">
            <h1>공 지 사 항</h1>
        </div>
        <section id="content-1">
            <table id="listTable" class="article_table">
                <thead>
                    <tr>
                        <th>유형(번호)</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>날짜</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="color: red;">필독</td>
                        <td>
                            <a href="articleView.html">공지합니다</a>
                        </td>
                        <td>manager</td>
                        <td>2020.12.27</td>
                        <td>999</td>
                    </tr>
                    <!-- 공지사항에 글이 존재하지 않을 수 도 있음
						list는 DAO에서 무조건 객체로 생성 되어 반환하므로 Null이 아님
						list가 비어있는지 아닌지로 판단
					 -->
					<%if(list.isEmpty()){ %>
					<tr>
						<td colspan="5">존재하는 공지사항이 없습니다.</td>
					</tr>
					<%} else{ %>
						<% for(Notice n:list){ %>
						<tr>
							<td><%= n.getnNo() %></td>
							<td><%= n.getnTitle() %></td>
							<td><%= n.getnWriter() %></td>
							<td><%= n.getnCount() %></td>
							<td><%= n.getnDate() %></td>
						</tr>
						<%} %>	
					<%} %>
                </tbody>
            </table>
        </section>

        <section id="page_css">
            <div class="pagination">
                <a href="#">&laquo;</a>
                <a href="#">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">6</a>
                <a href="#">&raquo;</a>
            </div>

        </section>

            <section id="notice_area">
           	 <form>
       
				<select id="searchCondition"name="searchCondition" style="width:60px height:40px">
					<option value="----">----</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					
				</select>
				<input type="search" name="search" class="input_box">
				<button type ="submit" class="article_btn">검색하기</button>
				<!-- 2. 공지사항 글쓰기 기능 : 관리자만 사용하는 기능(로그인 유저가 관리자일 때만 보여줌) -->
				<%if(loginUser!=null&&loginUser.getUserId().equals("admin")) {%>
				<button id="noticeInsert" type="button"class="article_btn">작성하기</button>
				<script>
					//공지사항 작성하기
					const noticeInsert = document.getElementById('noticeInsert');
					noticeInsert.addEventListener('click', function(){
					location.href='<%=request.getContextPath()%>/views/notice/noticeInsert.jsp';
					});
				</script>

				<%} %>
			 </form>
            </section>
       
		<script>
		//3. 공지사항 상세보기 기능(jQuery를 통해 작업)
		
			  $(function(){
			         $("#listTable td").mouseenter(function(){
			            $(this).parent().css({"background":"#f7dede", "cursor":"pointer"});
			         }).mouseout(function(){
			            $(this).parent().css("background", "#f9f1f1");
			         }).click(function(){
			            var num = $(this).parent().children().eq(0).text();
			          //쿼리 스트링을 이용하여 get방식으로 글 번호를 전달
						
			            location.href="<%= request.getContextPath() %>/notice/detail?nno=" +num;
			         });
			      });

		</script>
		
    </section>
</body>
</html>