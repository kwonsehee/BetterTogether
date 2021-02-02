<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="member.model.vo.Member, news.model.vo.News, java.util.ArrayList"%>
<%
   //session 객체에 담긴 loginUser 정보를 변수에 담아두기
   Member loginUser = (Member)session.getAttribute("loginUser");
	//새로운 소식이 있는지 확인
	ArrayList<News> news = new ArrayList<News>();
	if(session.getAttribute("news")!=null){
	news = (ArrayList<News>)session.getAttribute("news");
	System.out.println("commonUi의 news 갯수"+news.size());
	}	
%>
<!DOCTYPE html>
<html>

<head>
 <meta charset="UTF-8">
 <title>Better Together</title>
 <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
   integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
   crossorigin="anonymous"></script>
    <!-- 글씨체  -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">   
    <!-- font-family: 'Nanum Gothic', sans-serif; -->
    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <!-- w3schools 사이드바-->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
    <!-- 스타일  -->
	<link rel="stylesheet" href='<%=request.getContextPath()%>/resources/css/menu_style.css'>
 
</head>
<body>
   <header id="btHeader">
            <nav id="btNavi-wrapper">
                <div class="bt_container">
                    <ul class="bt_navi">
                        <!-- 로고 -->
                        <div class = "bt_title" id="icon">
                            <a><img src="<%=request.getContextPath()%>/resources/images/logo.png"></img></a>
                        </div> 
                        <li id="challMargin"><a>challenge</a></li>
                        <li><a>confirm</a></li>
                        <li><a>study cafe</a></li>
                        <li><a>community</a>
                           <ul>
                               <li><a>자유게시판</a></li>
                               <li><a>후기</a></li>
                           </ul>
                        </li>
                        <li><a>contact</a>
                        <ul>
                            <li><a>공지사항</a></li>
                            <li><a>신고</a></li>
                            <li><a>QNA</a></li>
                            <li><a>FAQ</a></li>
                        </ul>
                        </li>
                        <div id="login">
                            <a>Login </a>
                            <a> | </a>
                            <a> Join</a>
                        </div>
                        <!-- 사이드바 -->
                        <span id="sidebar_css" style="font-size:25px;cursor:pointer" onclick="openNav()">&#9776;</span>
                    </ul>
                </div>
               </nav>
    </header>

    <!-- 사이드바 메뉴-->
    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="#">개인정보수정</a>
        <a href="#">시작전 챌린지</a>
        <a href="#">참여했던 챌린지</a>
        <a href="#">찜하기한 챌린지</a>
        <a href="#">참여중인 챌린지</a>
        <a href="#">내가 모집한 챌린지</a>
        <a href="#">환급받기</a>
        <a href="#">신고 내역</a>
        <a href="#">포인트 충전</a>
      </div>

      <!--사이드바 여닫여닫-->
      <script>
        function openNav() {
          document.getElementById("mySidenav").style.width = "250px";
        }
        
        function closeNav() {
          document.getElementById("mySidenav").style.width = "0";
        }
        </script>

   




</body>
</html>