<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="confirm.model.vo.Cer"%>
<%
//챌린지 모집에서 인증보기 버튼 클릭시 이동
Cer c=(Cer)request.getAttribute("cer");
Member m = (Member)session.getAttribute("loginUser");

String userId=m.getUserId();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증하기 상세보기</title>
    <style>
    #btSection {
	padding-bottom: 100px;
}

      #content-1{
      /*    border:solid 1px red;   */
        width: 100%;
        height: 10%;
        float:left;
    }

    #content-1 p{
        /*  border:solid 1px black;   */
        font-size: 30px;
        text-align: center;
        padding-top: 35px;
    }
    #content-2{
        /*  border:solid 1px blue;   */
        width: 100%;
        height: 80%;
         float:left;

    }
    	#content-4{
        /*  border:solid 4px pink;   */
        width: 100%;
        height: 10%;
         float:left;
	 }
	
  		.challenge_box{
            
            width: 400px;
            height: 450px;
         /*    border: 1px solid blue; */
            float: left;
            margin-left:18%;
        }
        .challenge_box_2 {
           /*  border: 1px solid black; */
            width: 45%;
            height: 90%;
         
            margin-left: 28%;
            margin-top: 3%;
         /*  border: 1px solid blue; */
            float: left;
        }
        .challenge_box_2 p{
        padding-top:5px;
        		font-size : 16px;
                /* border:solid 4px yellowgreen;   */
        }
        #content-3 span{
            font-size: 25px;
            margin-left: 20%;
            margin-top:10%;
        }
  
        .comment{
           font-family: "Nanum Gothic";
         border-radius: 15px;
           border: solid 1px #9e9e9e5b;
           padding:5px 15px 5px 15px;
           background-color: #e6e4e4b6;
           font-size:10px;
           font-weight: bolder;
          margin-top : 5%;
            margin-right : 8%;
          float: right;
        }
        /* .comment_box{
            margin-left: 29%;
            padding-top: 5px;

        } */
         /* 뒤로가기 버튼 */
         .back_btn{
        font-family: "Nanum Gothic";
         border-radius: 15px;
           border: solid 1px #9e9e9e5b;
           padding:5px 15px 5px 15px;
           background-color: #e6e4e4b6;
           font-size:10px;
           font-weight: bolder;
          margin-top : 5%;
            margin-right : 20%;
          float: left;
        }
           .line{
            float: left;
            width: 100%;
            height: 1px;
            
            background-color:#937cf790;
             border: 0.5px solid #937cf790;
             
        } 
        #commont_content{
         border:0;
         outline:0;
         margin-top:5px;
        display:block;
        width:390px; 
		height:35px; 
    	resize:none;
        }
    </style>
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>
  <form action="<%= request.getContextPath() %>/report/insertForm" id="reportForm"method="post">
  
    <section id="btSection" class="content_css">

        <section id="content-1">
            <p>챌린지 인증사진</p>
            <div class="line"></div>
        </section> 
  
        <section id="content-2">
         
            <div class='challenge_box_2'>
            
              <p style="text-align:center;"> <%=c.getUser_id() %>&nbsp;&nbsp;&nbsp;<%=c.getCer_date() %> &nbsp;&nbsp;<%=c.getChall_title() %></p>
                
                <div class='challenge_box'>

                  <img src="<%= request.getContextPath()%>/resources/uploadFiles/<%= c.getCer_pic()%>" style="width: 390px;height: 400px;">
                  <textarea id="commont_content" readonly><%=c.getCer_comment() %></textarea>
	   
                </div>
                
                
            </div>
		
        </section>
		
			<input type="hidden" name="no" value="<%= c.getCer_id() %>">
			<input type="hidden" name="reported_id" value="<%= c.getUser_id() %>"> 
			<input type="hidden" name="cno" value="<%= c.getChall_no() %>"> 
			<input type="hidden" name="category" value="인증">  
		
	
        <section id="content-4">
        <!--댓글 등록 창만들기-->
         <button type="button"class="back_btn"  onclick="javascript:history.back();"style="margin-left: 28%;margin-top: 30px;">뒤로가기</button>
        
		<% if(userId.equals(c.getUser_id())){ %>  
		 <button type="button" id="deleteCer"class="comment"style="margin-right: 28%;margin-top: 30px;">삭제하기</button>
        <%}else{ %>  
         <button type="submit" id="reportBtn"class="comment"style="margin-right: 28%;margin-top: 30px;">신고하기</button>
         <%} %>
        </section>
        
    </section>
    </form>
    
    <script>
	const deleteCer = document.getElementById('deleteCer');
	deleteCer.addEventListener('click',function(){
		$("#reportForm").attr("action", "<%= request.getContextPath()%>/confirm/delete");
		$("#reportForm").submit();
	});
	
     
	</script>
	 <%@ include file="../common/footer.jsp"%>
</body>
</html>