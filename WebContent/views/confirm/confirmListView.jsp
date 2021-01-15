<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증하기 리스트</title>
   <style>
     /* content 부분 */
     	#content-1{
            
            width: 100%;
            height: 10%;
            float: left;
        }

        #content-1 p{
            border:solid 1px red; 
            font-size: 30px;
            text-align: center;
            margin-top: 18px;
        }

        #content-2{
            border:solid 1px blue; 
            width: 100%;
            height: 90%;
            float: left;


        }
        
        .confirm{ 
            width: 80%;
            height: 70%;
            margin-top: 5%;
            margin-left: 10%;
            text-align: center;
            border: 1px solid black; 
            padding-top: 10%;
            /* background: white; */
        }
        .confirm img{
            width : 180px;
            height : 150px;
            border: 1px solid black;
        }
        .plus_btn{ 
            width : 180px;
            height : 150px;
            border: 0px;
            color: white;
            font-size: 60px;
            background-color: rgba(196, 196, 196, 0.5);

        }

        .line{
            float: left;
            width: 100%;
            height: 7px;
            background-color: rgba(255, 96, 100, 0.7);
        }
    </style>
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>
<section id="content" class="content_css">

        <section id="content-1">
            <p>인증하기</p>
            <div class="line"></div>
        </section> 

        <section id="content-2">
            <div class='confirm'>
                <table class="confirm_table"style="width : 100%; height: 80%;">
                    <tr>
                        <td><img src="img/confirm.jpeg"></td>
                        <td><img src="img/confirm.jpeg"></td>
                        <td><img src="img/confirm.jpeg"></td>
                        <td><img src="img/confirm.jpeg"></td>
                    </tr>
                    <tr>
                        <td><img src="img/confirm.jpeg"></td>
                        <td><img src="img/confirm.jpeg"></td>
                        <td><img src="img/confirm.jpeg"></td>
                        
                        <td ><input type="submit" value="+" class="plus_btn" id="plusBtn"></td>
                        
                    </tr>
                </table>
            </div>
        </section>

       
    </section>
	<script>
    //+버튼 클릭 이벤트
         const plusBtn = document.getElementById('plusBtn');
         plusBtn.addEventListener('click',function(){
            location.href='<%=request.getContextPath()%>/views/confirm/confirmInsert.jsp';});
	</script>
</body>
</html>