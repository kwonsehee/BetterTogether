<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date, java.text.SimpleDateFormat"%>
<%
SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd");
Date currentTime = new Date ();
String day = mSimpleDateFormat.format ( currentTime );
Member m = (Member)session.getAttribute("loginUser");
String nickName = m.getNickName();
String title = (String)request.getParameter("title");
System.out.println("insert와서 "+title);
int cno = Integer.parseInt(request.getParameter("cno"));
System.out.println(cno);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증하기작성</title>
    <style>
      #content-1{
         border:solid 1px red;  
        width: 100%;
        height: 10%;
    }

    #content-1 p{
         border:solid 1px black;  
        font-size: 30px;
        text-align: center;
        padding-top: 35px;
    }
    #content-2{
         border:solid 1px blue;  
        width: 100%;
        height: 80%;

    }
    	#content-4{
         border:solid 4px pink;  
        width: 100%;
        height: 10%;
	 }
		#user_css{
            font-size: 80px;
            border: 1px solid red;
            margin-top: 10px;
            
        }
  		.challenge_box{
            
            width: 400px;
            height: 450px;
            border: 1px solid blue;
            float: left;
            margin-left:18%;
        }
        .challenge_box_2 {
            border: 1px solid black;
            width: 60%;
            height: 90%;
            margin-left: 20%;
            margin-top: 3%;
            background-color: rgba(196, 196, 196, 0.15);
            float: left;
        }
        .challenge_box_2 tr, .challenge_box_2 td, .challenge_box_2 th{
        		font-size : 10px;
                border:solid 4px yellowgreen;  
        }
        #content-3 span{
            font-size: 25px;
            margin-left: 20%;
            margin-top:10%;
        }
  
        .comment{
            width: 109px;
            height: 31px;
            border-radius: 20px;
            margin: 10px;
            border : 1px solid #8f8c8c;
            background-color: #8f8c8c;
            color : white;
        }
        .comment_box{
            margin-left: 29%;
            padding-top: 5px;

        }
         /* 뒤로가기 버튼 */
        .back_btn {
            width: 130px;
            font-family: "Do Hyeon";
            font-size: 20px;
            background: none;
            border-radius : 20px;
            border: 2px solid #ff60657e;
            float: right;
            margin-top : 2%;
            margin-right : 10%;
        }
    </style>
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>
  <form action="<%= request.getContextPath() %>/confirm/submitForm" method="post" enctype="multipart/form-data">
         
    <section id="content" class="content_css">

        <section id="content-1">
            <p>인증하기</p>
        </section> 
  
        <section id="content-2">
         
            <div class='challenge_box_2'>
            
                <table style="border: 1px solid black;"width="100%;">
                    <tr >
                        <td rowspan="3">
                            <i class="material-icons" id="user_css">person_outline</i>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><span name="nickName"><%=nickName %>님</span></td>
                  
                    </tr>
                    <tr>
                        <td><span>날짜 : <%=day %></span></td>
                        <td><span>챌린지제목 : <%=title %></span></td>
                    </tr>
                </table>
                <input type="file" name="pic"style="text-align : center;"required>
                <div class='challenge_box'>
                <!-- 사진추가하기 -->
                  	 <img id ="thumbnail" >
                </div>
            </div>
		<input type="hidden"name="cno"value=<%=cno %>>
		<input type="hidden"name="userId"value=<%=m.getUserId() %>>
        </section>

        <section id="content-4">
        <!--댓글 등록 창만들기-->
        <div class="comment_box">
        
            <input type="text"class="input_box_lag" name="comment">
            <button type="submit" class="comment"><span>인증하기</span></button>
       		<button type="button" id="backBtn" class="back_btn"onclick="javascript:history.back();">목록으로</button>
		
		</div>     
        </section>
        
    </section>
    </form>
    
   <script>
			$(function(){
				//input type="file"태그에 파일이 첨부될때 동작하는 이벤트
				$("[type=file]").change(function(){
					loadImg(this);
				});
			});
			function loadImg(element){
				//element를 판별해서 알맞은 위치에 preview표현하기
				/* console.log(element.name); */
				
				//input type="file" 엘리먼트에 첨부파일 속성, 첨부파일이 잘 존재하는지 확인
				if(element.files && element.files[0]){
					//파일을 읽어들일 FileReader 객체 생성
					var reader = new FileReader();
					
					//파일 읽기가 다 완료 되었을 때 실행되는 메소드
					reader.onload =function(e){
						var selector;
						var size;
				
						selector = "#thumbnail";
						size = {width: "400px", height: "450px", border:"1px solid black"};
						$(selector).attr("src",e.target.result).css(size);
						console.log(e);
						console.log(e.target);
						console.log(e.target.result);
					}
					//파일 읽기 하는 메소드
					reader.readAsDataURL(element.files[0]);

					
				}
			}
			</script>

</body>
</html>