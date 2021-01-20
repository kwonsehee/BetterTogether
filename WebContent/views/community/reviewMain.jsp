<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        /* 연분홍 배경 */
        #con1 {
            width: 1000px;
            height: 1400px;
            background: #F9F1F1;
            border-radius: 20px;
            margin : auto;
            margin-top:15px;
        }

        /* 세부 카테고리 버튼 */
        #btnwrap {
            width: 320px;
            height: 50px;
            line-height: 50px;
            text-align: center;
            margin: auto;
        }

        .btn {
            width: 130px;
            height: 30px;
            margin:10px;   
            background: #ff60657e;
            border: 0px;
            border-radius: 55px;
            
        }

        .btn a {
            color:white;
            font-family: "Do Hyeon";
            font-size: 16px;
        }

        #con1_title h1{
            position: absolute;
            width: 1000px;  
            text-align: center;
            margin-top: 25px;
        }

        .h1_title {
           margin-top: 50px;
           text-align: center;
           font-family: "Do Hyeon";
           font-size: 24px;
           color : #757575;
        }

        .line {
            border: 3px solid rgba(255, 96, 100, 0.7);
            position: absolute;
            width:994px;
            top:400px;  
        }

        /* 후기 목록 */
        .reviewdiv_1 {
            width : 90%;
            height : 70px;
            background: #fff;
            margin: auto;
            margin-top: 100px;
        }

        .reviewdiv {
            width : 90%;
            height : 70px;
            background: #fff;
            margin: auto;
            margin-top : 20px;
        }

        #pagenum {
            width : 200px;
            height : 30px;
            margin:auto;
            margin-top : 20px;
            text-align: center;
        }

        #pagenum a {
            font-family: "Do Hyeon";
            font-size: 18px;
            padding: 5px;
            color : #757575;
        }

        /* 후기 쓰기 */
        .h2_title {
            margin-left: 48px;
            color : #757575;
            font-family: "Do Hyeon";
            float:left;
            margin-right: 10px;
        }

        #reviewwrite {
            margin: auto;
            width: 900px;
            height: 70px;
        }
        #reviewWriteArea {
            width: 900px;
            height: 70px;
            resize: none;
            background: none;
            border: 1px solid #75757552;
        }

        /* 버튼 */
        .btn a {
            color:white;
            font-family: "Do Hyeon";
            font-size: 16px;
        }

        #submit {
            width:55px;
            color:white;
            font-family: "Do Hyeon";
            margin-top : 40px;
            margin-left : 72%;
        }
        #submit a {
            font-size: 14px;
        }

        #myReview {
            width:120px;
            font-family: "Do Hyeon";
            background: none;
            border : 2px solid  #ff60657e; 
            margin-left: 44px;       
        }
        #myReview a {
            font-size: 14px;
            color: #ff60657e;
        }

        /* 별점 */
        #star a{ 
            text-decoration: none; 
            color: rgb(172, 172, 172); 
            font-size: 25px;
            margin-top: 2px;
        } 
        #star a.on{ color: #ff6064; }
        
    </style>
        <script>
        $('#star_grade a').click(function(){
            $(this).parent().children("a").removeClass("on");  
            $(this).addClass("on").prevAll("a").addClass("on"); 
            return false;
        });
    </script>
    
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>
	 <!-- content -->
    <!-- 후기 -->
    <section id="con1"> 
        <!-- 세부 카테고리 버튼 -->
        <div id="btnwrap">
            <button class="btn"><a href='<%= request.getContextPath()%>/board/main'>자유게시판</a></button>
            <button class="btn"><a href='<%= request.getContextPath()%>/review/main'>후기</a></button>
        </div>

        <!-- 타이틀 -->
        <div id="con1_title">
            <h1 class="h1_title">후기</h1>   
        </div>

        <div class="line"></div>

        <!-- 후기 목록 -->
        <div class="reviewdiv_1"></div>
        <div class="reviewdiv"></div>
        <div class="reviewdiv"></div>
        <div class="reviewdiv"></div>
        <div class="reviewdiv"></div>
        <div class="reviewdiv"></div>
        <div class="reviewdiv"></div>
        <div class="reviewdiv"></div>
        <div class="reviewdiv"></div>
        <div class="reviewdiv"></div>
        <div class="reviewdiv"></div>

        <div id="pagenum">
            <a href="#">&lt;</a>
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a>...</a>
            <a href="#">10</a>
            <a href="#">&gt;</a>
        </div>

        <!-- 후기 쓰기 -->
        <h2 class="h2_title">후기 쓰기</h2>
        <p id="star"> 
            <a href="#" value="1">★</a> 
            <a href="#" value="2">★</a>
            <a href="#" value="3">★</a> 
            <a href="#" value="4">★</a> 
            <a href="#" value="5">★</a> 
        <p>
            <script>
                $('#star a').click(function(){ 
                    $(this).parent().children("a").removeClass("on"); 
                    $(this).addClass("on").prevAll("a").addClass("on"); 
                    console.log($(this).attr("value")); 
                });
            </script>
       
        <div id="reviewwrite">
            <textarea id="reviewWriteArea"></textarea>
        </div>
        
        <%-- 로그인 유저만 후기 등록, 내가 쓴 후기 보기 버튼 보이기 --%>
  		 <% if(loginUser != null) { %>
        <button class="btn" id="myReview"><a href='<%= request.getContextPath()%>/views/community/myReview.jsp'>내가 쓴 후기 보기</a></button>
        <button class="btn" id="submit"><a href='<%= request.getContextPath()%>/views/community/reviewMain.jsp'>등록</a></button> 
        <% } %>
        <!-- 등록 후 후기 등록 서블릿으로 이동하기(추가해야 함) -->    
    </section>
     <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</body>
</html>