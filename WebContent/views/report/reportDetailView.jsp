<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="report.model.vo.Report"%>
<%
	Report r = (Report)request.getAttribute("r");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신 고</title>
<style>
		/* 버튼들  */
        #btnArea {
            width: 320px;
            height: 50px;
            line-height: 50px;
            text-align: center;
            margin-top: -40px;
        }
        .btn {
            width: 85px;
            height: 30px; 
            margin: 5px;
            background: #ff60657e;
            border: none;
            border-radius: 55px;       
            color:white;
            font-family: "Do Hyeon";
            font-size: 16px;
            float: right;
        }


        /* 타이틀,라인 */
        .h1_title {
           text-align: center;
           width: 100%;  
          
        }
        .line {
            border: 3px solid rgba(255, 96, 100, 0.7);
        }

        /* 게시물 부분 */
        #report_div {
            width: 100%;
           /*  height: 1200px; */
            margin:auto;
        }

        #report_title {
            width: 100%;
            height:50px;
            border-bottom: 1px solid #75757552;
            margin:auto;
            text-align: justify;
        }
        #btitle{
            font-size: 20px;
            line-height: 50px;
            padding-left: 10px;
            color:#757575;
        }
 
        #report_con {
            width: 100%;
           /*  height:1150px; */
            border-bottom: 1px solid #75757552;
            margin:auto;
        }
        #report_con p{
            padding-left: 10px;
            font-size: 20px;
        }

</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	<!-- content -->
	<section id="con1">

		<!-- 타이틀 -->
		<div id="con_title">
			<h1 class="h1_title">신 고</h1>
		</div>
		
		<div class="line"></div>

		<!-- 게시물 내용 -->
		<div id="report_div">
			<div id="report_title">
				<span id="btitle"><%= r.getReportTitle() %></span>
			</div>
			<div id="report_con">
				<p><%= r.getReportContent() %></p>
			</div>
		</div>
		
	<!-- 버튼 -->
	</section>
	<div id="btnArea"></div>
	<%if(loginUser.getMembertype() != 0) { %>
	<button type="button" id="deleteBtn" class="btn">삭제하기</button>
	<button type="button" id="listBtn" class="btn">목록으로</button>
	<% } else { %>
	<button type="button" id="cancleBtn" class="btn">신고철회</button>
	<button type="button" id="reportBtn" class="btn">신고처리</button>
	<button type="button" id="listBtn" class="btn">목록으로</button>
	<%} %>
	
	<!-- form 태그를 POST 방식으로 제출
					nno를 화면에 드러내지 않고 form을 submit하면서 넘길 수 있음 -->
	<form id="reportForm" method="post">
		<input type="hidden" name="" value="<%= r.getReportedId() %>">
	</form>

	<script>				
			//삭제하기 버튼 이벤트
			const deleteBtn = document.getElementById('deleteBtn');
			deleteBtn.addEventListener('click',function(){
				$("#reportForm").attr("action","<%=request.getContextPath()%>/report/delete");
				$("#reportForm").submit();
			});
	</script>
	<script>
			//신고처리 이벤트
			const answerBtn = document.getElementById('answerBtn');
			answerBtn.addEventListener('click',function(){
				$("#reportForm").attr("action","<%=request.getContextPath()%>/report/processing");
				$("#reportForm").submit();
			});
	</script>
	<script>
			//목록으로 버튼 이벤트
			const listBtn = document.getElementById('listBtn');
			listBtn.addEventListener('click',function(){
				location.href='<%=request.getContextPath()%>/report/list';
				});
	</script>
</body>
</html>