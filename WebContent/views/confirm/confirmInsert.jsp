<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
         border:solid 1px yellowgreen;  
        width: 100%;
        height: 10%;
	 }
		#user_css{
            font-size: 80px;
            border: 1px solid red;
            margin-top: 10px;
            
        }
  		.challenge_box{
            width: 99%;
            height: 80%;
            border: 1px solid blue;
            float: left;
        }
        .challenge_box_2 {
            border: 1px solid black;
            width: 40%;
            height: 90%;
            margin-left: 30%;
            margin-top: 3%;
            background-color: rgba(196, 196, 196, 0.15);
            float: left;
        }
        .challenge_box_2 tr, .challenge_box_2 td, .challenge_box_2 th{
                border:solid 1px yellowgreen;  
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
    </style>
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>

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
                        <td colspan="2"><span>user1</span></td>
                  
                    </tr>
                    <tr>
                        <td><span>날짜 : 2021-01-12</span></td>
                        <td><span>챌린지제목날짜날짜</span></td>
                    </tr>
                </table>
                <div class='challenge_box'>
                    <img src="img/하루1시간공부.jpeg" style="width: 390px;height: 450px;"/>
                </div>
            </div>

        </section>

        <section id="content-4">
        <!--댓글 등록 창만들기-->
        <form method="POST" class="comment_box">
            <input type="text"class="input_box_lag">
            <button type="submit" class="comment"><span>댓글 등록</span></button>

        </form>
           
        </section>
        

       
    </section>
</body>
</html>