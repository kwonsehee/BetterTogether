<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.Notice"%>
<%
	Notice n=(Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
 <style>
     
        #board h1 {
            font-family: "Do Hyeon";
            font-size: 35px;
            text-align: center;
            margin-top: 50px;
        }

        .line {
            background: rgba(255, 96, 100, 0.7);
            border: 3px solid rgba(255, 96, 100, 0.7);
        }

        /* 게시물 부분 */
        #board_div {
            width: 100%;
            height: 1200px;
            margin: auto;
        }

        #board_title {
            width: 100%;
            height: 50px;
            border-bottom: 1px solid #75757552;
            margin: auto;
            text-align: justify;
        }

        #board_title span {
            font-size: 20px;
            line-height: 50px;
            padding-left: 10px;
            color: #757575;
        }
        #board_con {
            width: 100%;
            height: 500px;
            border-bottom: 1px solid #75757552;
            margin: auto;
        }
        /* 뒤로가기 버튼 */
        .board_btn {
            width: 130px;
            font-family: "Do Hyeon";
            font-size: 20px;
            background: none;
            border-radius : 20px;
            border: 2px solid #ff60657e;
            float: right;
        }

        .board_btn a {
            font-size: 15px;
            color: #ff60657e;
        }
        
        
    </style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	
	 <!-- content -->
     <section id="board" class="content_css">
        <!-- 타이틀 -->
           
            <h1>공지사항</h1>

            <div class="line"></div>

            <!-- 게시물 내용 -->
            <div id="board_div">
                <div id="board_title">
                    <table style="width: 100%;">
                        <tr>
                            <td><span>게시물 제목 : <%=n.getaTitle() %></span></td>
                            <td><span>작성자 : <%=n.getUser_id() %></span></td>
                            <td><span>작성날짜 : <%=n.getaDate() %></span></td>
                        </tr>
                    </table>
                </div>
                    <div id="board_con"><span><%=n.getaContent() %></span></div>
                    <div class="btnArea">
					<button type="button" id="listBtn" class="board_btn">목록으로</button>
					<!--관리자 멤버타입은 3임!!!!!!! -->
					<%if(loginUser !=null&&loginUser.getMembertype()==3){  %>
					<button type="button" id="updateBtn" class="board_btn">수정하기</button>
					<button type="button" id="deleteBtn" class="board_btn">삭제하기</button>
					
					<!-- form 태그를 POST 방식으로 제출
					nno를 화면에 드러내지 않고 form을 submit하면서 넘길 수 있음 -->
					<form id="nnoForm"method="post">
						<input type="hidden" name="ano"value="<%=n.getaNo() %>">
					</form>
					<script>
					//수정하기 버튼 이벤트
					const updateBtn = document.getElementById('updateBtn');
					updateBtn.addEventListener('click',function(){
						$("#nnoForm").attr("action","<%=request.getContextPath()%>/notice/updateForm");
						$("#nnoForm").submit();
					});
					
					//삭제하기 버튼 이벤트
					//*******삭제하기 위해서는 article_type 추가 필요함!!!!!!!!
					const deleteBtn = document.getElementById('deleteBtn');
					deleteBtn.addEventListener('click',function(){
						$("#nnoForm").attr("action","<%=request.getContextPath()%>/notice/deleteForm");
						$("#nnoForm").submit();
					});
					
					</script>
					<%} %>
				</div>
              </div>
                
    </section>
	<script>
	//목록으로 버튼 이벤트
	const listBtn = document.getElementById('listBtn');
	listBtn.addEventListener('click',function(){
		location.href='<%=request.getContextPath()%>/notice/list';
	});
	</script>
</body>
</html>