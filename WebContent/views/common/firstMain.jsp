<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    <!-- w3schools 사진 슬라이드-->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        body {        
            height: 1100px;
        }
         #btHeader, #btNavi-wrapper, #btSection, #btFooter {
            box-sizing: border-box;
            display: block;
            margin: auto;
        }
        p, span,input{
            font-family: "Nanum Gothic";
            font-size: 20px;
        }

        /* header 영역 */
        #btHeader {
            width:100%;
            height:5%;
            position: fixed;
            /* border:1px solid black; */
        }
        #bt_titlewrap{
            height : 80px;
            width: 100%;     
            margin : auto; 
            align-items: center;  
        }    
        
        .bt_title img {
            margin:auto;
            width:350px;
            cursor: pointer;
            margin-top: 38px;
            margin-left: 480px;
        }

        /* nav 영역 */
        #btNavi-wrapper{
            /* border:1px solid black; */
            width:100%;
            height:20%;
        } 
         .bt_container {   
            width : 1200px;
            height: 5px; 
            position: absolute;
            left : 50%;
            
            transform:translate(-50%,-50%);
        }
        .bt_navi {
            display:flex;
            list-style: none;
            width:100%;
            height: 90px; 
            background-color: #fff;
            padding: 45px;
            margin: 0;
            border-radius: 10px;
            /*box-shadow: 0 0 30px rgba(0,0,0,0.1);*/
            font-family: 'Nanum Gothic', sans-serif;
            font-weight: bolder;
            z-index: 1;
        }

        .bt_navi li {
            list-style-type: none;
            margin: 20px;
            cursor:pointer;
            margin-top: -10px;
        }

        #challMargin{
            margin-left: 160px;
        }

        .bt_navi li a{
            font-size: 14px;
            color : #222;
            position: relative;         
        }
    
        .bt_navi li a:before {
            content: '';
            background-color: #937CF7;
            width: 0;
            height: 3px;
            position: absolute; 
            left: 50%;
            transform: translateX(-50%);
            bottom: -10px;
            transition : 0.3s;
        }

        .bt_navi li a:hover:before {
            width: 100%;
        }

        .bt_navi li>ul{
            position: absolute;
            /*블릿제거 및 공백제거*/
            list-style-type: none;
            padding: 0;
            margin: 0; 
            /*평소에는 보이지 않게*/
            z-index:2;
            opacity: 0;
            visibility: hidden;
            /* line-height: 40px; */
        }   

        .bt_navi ul li {
            
            margin-top: 40px;
            text-align: center;
            margin-left: 0px;
        }

        .bt_navi li:hover ul{
            cursor : pointer;
            /*메인 메뉴에 마우스 오버 시 서브메뉴 보이게*/
            opacity: 1;
            visibility: visible; 
            /*트렌지션*/
            transition: all 0.6s;
        }

        /* content 영역 */
        #btSection {
            /* border:1px solid black; */
            width:100%;
            height:80%;
            padding-top: 50px;
        }

        .w3-animate-fading{
            padding-top: 100px;
        }

        .w3-content{
            padding-top: -50px;
        }

         /* footer 영역 */
         #btFooter {
            width: 100%;
            height: 5%;
            margin-top: 100px;
            text-align: center;
            /* border:1px solid black; */
            font-family: 'Nanum Gothic', sans-serif;
        }

        #btFooter_pre{
            font-family: 'Nanum Gothic', sans-serif;
            background-color: white;
            font-size:5px;
        }
    </style>
</head>

<body>
  <header id="btHeader">
       <div class = "bt_title" id="icon">
       <a><img src="<%=request.getContextPath() %>/resources/images/mainLogo.png"></img></a>
       </div>   
    </header>

    <section id="btSection"> 
         <!--내용부분-->
         <div class="w3-content w3-section" style="max-width:1270px">
            <a href="<%=request.getContextPath()%>/commu/main"><img class="mySlides w3-animate-fading" src="<%=request.getContextPath() %>/resources/images/blanket.jpg" style="width:100%; height: 900px;"></a>
            <a href="<%=request.getContextPath()%>/commu/main"><img class="mySlides w3-animate-fading" src="<%=request.getContextPath() %>/resources/images/running.jpg" style="width:100%; height: 900px;"></a>
            <a href="<%=request.getContextPath()%>/commu/main"><img class="mySlides w3-animate-fading" src="<%=request.getContextPath() %>/resources/images/morning.jpg" style="width:100%; height: 900px;"></a>
            <a href="<%=request.getContextPath()%>/commu/main"><img class="mySlides w3-animate-fading" src="<%=request.getContextPath() %>/resources/images/studing.jpg" style="width:100%; height: 900px;"></a>
        </div>

        <script>
            var myIndex = 0;
            carousel();

            function carousel() {
                var i;
                var x = document.getElementsByClassName("mySlides");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                myIndex++;
                if (myIndex > x.length) { myIndex = 1 }
                x[myIndex - 1].style.display = "block";
                setTimeout(carousel, 3800);
            }
        </script>
           
    </section>

    <footer id="btFooter">
       <pre id="btFooter_pre">KH정보교육원 ｜ 사업자등록번호 : 851-87-00622 ｜ 서울 강남 제2014-01호 ｜ 대표자 : 양진선 ｜ 책임자 : 김언체 ｜  개인정보관리책임자 : 강명주

        강남지원 1관 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F
        강남지원 2관 : 서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩 4F, 5F, 7F
        강남지원 3관 : 서울특별시 강남구 테헤란로 130 호산빌딩 5F, 6F
       
        Copyright © Better Together
    </pre>
    </footer>



</body>
</html>