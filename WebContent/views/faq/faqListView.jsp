<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, faq.model.vo.FAQ"%>
<%
	ArrayList<FAQ> list = (ArrayList<FAQ>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>F A Q</title>
<style>
 		/* 자주묻는질문 */
        input[id*="answer"] {
            display: none;

        }

        input[id*="answer"] + label {
            font-family: "Do Hyeon";
            display: block;
            padding: 20px;
            padding-left: 60px;
            border-top: 1px solid  #f7dede;
            border-bottom: 0;
            color: black;
            font-size: 18px;
            background: white;
            cursor: pointer;
            border-radius: 20px;
            
        }

       /*
        input[id*="answer"] + label em {
            position: absolute;
            top: 50%;
            right: 10px;
            width: 30px;
            height: 30px;
            margin-top: -15px;
            display: inline-block;
            background: url('/resources/images/공부.') 0 0 no-repeat;
        }
       */

        input[id*="answer"] + label + div {
            max-height: 0;
            transition: all .35s;
            overflow: hidden;
            background:  #f7dede;
            font-size: 11px;
            border-radius: 20px;
        }

        input[id*="answer"] + label + div  p {
            display: inline-block;
            padding: 15px;
            padding-left: 80px;
            font-family: "Do Hyeon";
            font-size: 16px;
        }

        input[id*="answer"]:checked + label + div {
            max-height: 100px;
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
		#btn {
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
        #btnArea {
        	margin: auto;
       	 	padding-top: 5%;
       	 	padding-left:40px;;
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
						<button id="btn" type="button" onclick="location.href='<%= request.getContextPath() %>/views/faq/faqInsertForm.jsp'">FAQ 작성</button>
						<button id="btn" type="button" onclick="location.href='<%= request.getContextPath() %>'">수정</button>
						<button id="btn" type="button" onclick="location.href='<%= request.getContextPath() %>'">삭제</button>
					<% } %>
				</div>
				
        		<!-- 검색창 -->
                <form action="<%= request.getContextPath() %>/faq/search" method="get" id="search-form">
                    <div id="search-text-area">
                        <input type="search" id="search-input" name="search">
                    </div>
                    <div id="search-btn-area">
                        <button type="submit" id="search-btn">검색</button>
                    </div>
                </form>
            </div>
        </section>

        <!-- 아코디언 -->
        <section id="content-2">
            <div class="accordion">
            	<% for(int i = 0; i < list.size(); i++) { %>
                <input type="checkbox" id="answer<%= i %>">
                <label for="answer<%= i %>"><%=list.get(i).getFaqTitle() %></label>
                <div><p><%= list.get(i).getFaqContent() %></p></div>
                <%} %>
            </div>
        </section>
    </section>

</body>
</html>