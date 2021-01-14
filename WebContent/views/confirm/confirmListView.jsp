<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, confirm.model.vo.Confirm"%>
<%
	ArrayList<Confirm> list= (ArrayList<Confirm>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참여중인 챌린지</title>
<style>
        .content_css>p{
            /* border:solid 1px red;  */
            font-size: 30px;
            text-align: center;
            margin-top: 18px;
        }
       
        #ok{
            width: 150px;
            height: 50px;
            margin-left: 40%;
            margin-top: 1%;
            font-family: "Do Hyeon";
            font-size: 20px;
            border-radius: 20px;
            border: 1px solid #fdc8c6;
            background-color: #fdc8c6;
      
        }
          .line{
            float: left;
            width: 100%;
            height: 7px;
            background-color: rgba(255, 96, 100, 0.7);
        }
        .empty_chall{
        	color : red;
        	margin-top : 10%;
        	font-size : 35px;
        	font-family: "Do Hyeon";
        	text-align : center;
        }
      .ing_challenge{
            
            width: 80%;
            height: 140px;
            margin-left: 9%;
            margin-right: 9%;
            margin-top: 6%;
            border: solid 1px black;
            background-color: rgba(196, 196, 196, 0.15);

        }
        .ing_challenge1{
            float: left;
            width: 25%;
            height: 100%;
            border: solid 1px black;

        }
        .ing_challenge2{
            float: left;
            width: 35%;
            height: 100%;
            /* border: solid 1px black; */

        }
        .ing_challenge3{
            float: left;
            width: 250px;
            height: 100px;
            padding-top: 40px;
            padding-left: 50px;
            /* border: solid 1px red; */

        }
        .btn_camera{ 
            width: 55px;
            height: 55px;
            border-radius: 100%;
            border: #ff6064;
            background-color: #ff6064;
        }
        .btn_camera_end{
            width: 55px;
            height: 55px;
            border-radius: 100%;
            border:rgba(117, 117, 117, 0.5);
            background-color:rgba(117, 117, 117, 0.5);
        }
    </style>
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>
<section id="content" class="content_css">

        <section class="content_css">
            <p>참여중인 챌린지</p>
            <div class="line"></div>
     
            <%if(list.isEmpty()){ %>
            <div class="empty_chall">참여중인 챌린지가 없습니다!!</div>
            <%}else{ %>
            	<% for(Confirm c:list){ %>
          		<div class='ing_challenge'>
                <div class='ing_challenge1'>
                    <img src="img/스쿼트.png"width="200px"height="140px">
                    <!--  원래는 여기 챌린지 테이블이랑 조인해서 챌린지 테이블의 파일이 있어야한다. -->
                </div>
                <div class='ing_challenge2'>
                    <p>챌린지 이름</p><!-- 여기도 챌린지명 -->
                    <p>2021년 1월 5일 ~ 2021년 2월 5일</p><!-- 챌린지 기간 -->
                    <p>달성률 : #%</p><!-- 달성률!!! -->
                </div>
                <div class='ing_challenge3'>
                <span>인증하기</span>
                <button type="submit"class="btn_camera">
                    <a>
                    <img src="<%=request.getContextPath()%>/resources/images/camera_confirm.png"width="42px"height="33px">
                    </a>
                </button>
                <span>결과보기</span>
                <button type="submit"class="btn_camera">
                    <a>
                    <img src="<%=request.getContextPath()%>/resources/images/result.png"width="42px"height="33px">
                    </a>
                    </button>
                </div>
            </div>
				<%} %>	
            <%} %>
         
        </section>
       

       
    </section>
</body>
</html>