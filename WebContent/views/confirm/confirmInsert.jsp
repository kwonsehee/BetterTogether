<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date, java.text.SimpleDateFormat, java.util.Calendar"%>
<%

Calendar calendar = Calendar.getInstance();
/* String []days = {"일","월","화","수","목","금","토"};
System.out.println("오늘은  "+days[calendar.get(Calendar.DAY_OF_WEEK)-1]+"요일");
 */int day1 = calendar.get(Calendar.DAY_OF_WEEK)-1;
System.out.println(day1);
SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd");
Date currentTime = new Date ();
String day = mSimpleDateFormat.format ( currentTime );
Member m = (Member)session.getAttribute("loginUser");
String nickName = m.getNickName();
String title = (String)request.getParameter("title");
System.out.println("insert와서 "+title);
int cno = Integer.parseInt(request.getParameter("cno"));
System.out.println(cno);

String confirm = (String)request.getParameter("confirm");
System.out.println("insert와서confirm :  "+confirm);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증하기작성</title>
    <style>
    #btSection {
	padding-bottom: 100px;
}
      #content-1{
       /*   border:solid 1px red;   */
        width: 100%;
        height: 10%;
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

    }
    	#content-4{
       /*   border:solid 4px pink;   */
        width: 100%;
        height: 10%;
	 }

  		.challenge_box{
            
            width: 400px;
            height: 450px;
             border: 1px solid blue; 
            float: left;
            margin-left:25%;
        }
        .challenge_box_2 {
            border: 1px solid black;
            width: 60%;
            height: 90%;
            margin-left: 20%;
            margin-top: 3%;
            
            float: left;
        }
       
        #content-3 span{
            font-size: 25px;
            margin-left: 20%;
            margin-top:10%;
        }
  
        .comment{
            
            border-radius: 15px;
            margin: 10px;
            border: solid 1px #9e9e9e5b;
           background-color: #e6e4e4b6;
            
           float:left;
            font-family: "Nanum Gothic";
            
           font-weight: bolder;
        }
       /*  .comment_box{
            margin-left: 29%;
            padding-top: 5px;

        } */
         /* 뒤로가기 버튼 */
        .back_btn {
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
       float:left;
        width:390px; 
		height:35px; 
    	resize:none;
    
        }
    </style>
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>
	
  <form action="<%= request.getContextPath() %>/confirm/submitForm" method="post" enctype="multipart/form-data">
        <section id="btSection" class="content_css">

        <section id="content-1">
            <p>인증하기</p>
            <div class="line"></div>
        </section> 
  
        <section id="content-2">
         
            <div class='challenge_box_2'>
            <p style="text-align:center;"><span name="nickName"><%=nickName %>님</span>&nbsp;&nbsp;&nbsp;<%=day %> &nbsp;&nbsp;<%=title %></p>
            <p style="text-align:center;"><input type="file" name="pic"style="font-size:14px;"required></p>
             <div class='challenge_box'>
                <!-- 사진추가하기 -->
                  	 <img id ="thumbnail" >
            </div>
            <input type="hidden"name="cno"value="<%=cno %>">
			<input type="hidden"name="userId"value="<%=m.getUserId() %>">
              <textarea id="commont_content" name="comment" style="margin-left:25%;" ></textarea>
                
            <!-- 요일에 맞지 않으면 버튼 비활성화 -->
             <%if(confirm.equals("상관없음")||confirm.equals("평일")&&(day1<=5)||confirm.equals("주말")&&(day1>5)){ %>
             <button type="submit" class="comment">인증하기</button>
             <%} else if(confirm.equals("평일")&&(day1>5)){%>
              <button type="button" class="comment" onClick="alert('해당 챌린지의 인증은 평일만 가능합니다.')">인증하기</button>
             <%} else if(confirm.equals("주말")&&(day1<=5)){%>
              <button type="button" class="comment" onClick="alert('해당 챌린지의 인증은 주말만 가능합니다.')">인증하기</button>
         
             <%} %>
            </div>
		
        </section>

        <section id="content-4">
        <!--댓글 등록 창만들기-->
        <button type="button" id="backBtn" class="back_btn"onclick="javascript:history.back();"style="margin-left: 28%;margin-top: 30px;">목록으로</button>
		
        <!-- <div class="comment_box"> -->
        
          <!--   <input type="text"class="input_box_lag" name="comment"> -->
         
       		
		<!-- </div>      -->
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
 <%@ include file="../common/footer.jsp"%>
</body>
</html>