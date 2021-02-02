<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="qna.model.vo.QnA"%>
<%
	QnA q = (QnA)request.getAttribute("q");
	QnA a=null;
	if((QnA)request.getAttribute("a")!=null){
		a = (QnA)request.getAttribute("a");		
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        
        .aline {
       		border: 1px solid gray;
       		background : gray;
        }

        /* 게시물 부분 */
        #question_div {
            width: 100%;
           /*  height: 1200px; */
            margin:auto;
           
        }

        #qna_Title {
            width: 100%;
            height:50px;
            border-bottom: 1px solid #75757552;
            margin:auto;
            text-align: justify;
           	padding-top:2%;
           	padding-left:2%;
        }
        #btitle{
            font-size: 20px;
            line-height: 50px;
            padding-left: 10px;
            color:#757575;
        }
 
        #qna_Con {
            width: 100%;
            height: 200px;
            border-bottom: 1px solid #75757552;
            margin:auto;
            padding-top: 3%;
            padding-left:2%;
        }
        #report_con p{
            padding-left: 10px;
            font-size: 20px;
        }

		#con2_title { 
		text-align: center;
		}
		
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	<!-- content -->
	<section id="con1">


		<!-- 타이틀 -->
		<div id="con2_title">
			<h1>Q n A</h1>
		</div>
		
		<div class="line"></div>

		<!-- 게시물 내용 -->
		<div id="question_div">
			<div id="qna_Title">
				<span><%=q.getQnaTitle()%></span>
			</div>
			<div id="qna_Con">
				<span><%=q.getQnaContent()%></span>
			</div>
		</div>
		
		<div class="aline"></div>
		
	<!-- 답변내용 -->
	<%if(a != null){%>
		<div id="answer_div">
			<div id="qna_Con">
				<span><a style="color: gray">Answer</a><br><br> <%=a.getQnaContent()%></span>
			</div>
		</div>
	<%} %>
	<!-- 버튼 -->
	</section>
		<div id="btnArea"></div>
		<%if(loginUser.getMembertype() != 0 && loginUser.getUserId().equals(q.getUserId())) { %>
			<button type="button" id="deleteBtn" class="btn">삭제하기</button>
			<button type="button" id="updateBtn" class="btn">수정하기</button>
			<button type="button" id="listBtn" class="btn">목록으로</button>
			
		<% } else if(loginUser.getMembertype() == 0) { %>
			<%if(a != null) { %>
			<button type="button" id="ansUpdateBtn" class="btn">수정하기</button>
			<% } %>
			<button type="button" id="answerBtn" class="btn">답변하기</button>
			<button type="button" id="listBtn" class="btn">목록으로</button>
		<%} %>
					<!-- form 태그를 POST 방식으로 제출
					nno를 화면에 드러내지 않고 form을 submit하면서 넘길 수 있음 -->
					<form id="qnaNoForm" method="post">
					<input type="hidden" name="qnaNo" value="<%=q.getQnaNo()%>">
					</form>
					
					
			</div>
			<script>
			//수정하기 버튼 이벤트
			const updateBtn = document.getElementById('updateBtn');
			updateBtn.addEventListener('click',function(){
				$("#qnaNoForm").attr("action","<%=request.getContextPath()%>/qna/updateForm");
				$("#qnaNoForm").submit();
			});
					
			//삭제하기 버튼 이벤트
			const deleteBtn = document.getElementById('deleteBtn');
			deleteBtn.addEventListener('click',function(){
				$("#qnaNoForm").attr("action","<%=request.getContextPath()%>/qna/delete");
				$("#qnaNoForm").submit();
			});
			</script>
			<script>
			//답변 수정 이벤트
			const ansUpdateBtn = document.getElementById('ansUpdateBtn');
			ansUpdateBtn.addEventListener('click',function(){
				$("#qnaNoForm").attr("action","<%=request.getContextPath()%>/qna/ansUpdateForm");
				$("#qnaNoForm").submit();
			});
			</script>
			<script>
			//답변 버튼 이벤트
			const answerBtn = document.getElementById('answerBtn');
			answerBtn.addEventListener('click',function(){
				$("#qnaNoForm").attr("action","<%=request.getContextPath()%>/views/qna/answerForm.jsp");
				$("#qnaNoForm").submit();
			});
			</script>
			<script>
			//목록으로 버튼 이벤트
			const listBtn = document.getElementById('listBtn');
			listBtn.addEventListener('click',function(){
				location.href='<%=request.getContextPath()%>/qna/list';
				});
			</script>
</body>
</html>