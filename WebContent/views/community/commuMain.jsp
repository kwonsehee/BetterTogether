<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, common.model.vo.PageInfo, challenge.model.vo.*"%>
 <%
 	ArrayList<Challenge> list = (ArrayList<Challenge>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	// 참여중인 인원 카운트 
	//int joinPeopleCnt = Integer.parseInt((String.valueOf(request.getAttribute("joinPeopleCnt"))));

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
<style>
		/* 연분홍 배경 */
        #con1 {
            width: 1000px;
            height: 704px;
            background: #F9F1F1;
            border-radius: 20px;
            margin : auto;
            margin-top:15px;
        }
        
         /* 슬라이드 */
		 #slide {
		    width : 100%;
		    height : 78%;
		    float: left;
		}
		
		.container {
		    width: 300vw;
		    transition: transform 0.5s;
		}
		
			.outer {
		    width: 100vw;
		    float: left;
		    height:500px;
		}
		
		.chall_box{
			width:480px;
			height:150px;
			border:1px solid #F9F1F1;
			margin-bottom:10px;
		}
		 
		 
		.chall_img {
			width:150px;
			height:90px;
			margin-top:30px;
			margin-left:10px;
			float:left;
		}
		
		
		 .inner {
			float:left;
			margin:10px;
		}
		
		.cTitle{
			width:300px;
			height:22px;
			margin-left:170px;
			margin-top:30px;
			font-size:18px;
			color : #757575;
			font-weight: bold;
			
		}
		
		.cDate{
			font-size:14px;
			color : #757575;
			margin-left:170px;
			margin-top:0;
		}
		.cFrequency{
		width:60px;
		height:20px;
		line-height:20px;
		text-align:center;
			font-size:14px;
			color:white;
			background-color : #bdbdbd;
			border-radius:25px;
		}
		.cPeriod{
		width:40px;
		height:20px;
		line-height:20px;
		text-align:center;
			font-size:14px;
			color:white;
			background-color : #bdbdbd;
			border-radius:25px;
			margin-right:100px;
		}
		
		 .pCountArea{
            border: 1px solid black;
            width:80px;
            height:20px;
            color:rgba(255, 96, 100, 0.7);
            border-radius: 25px;
            border:0px;
            display:inline-block;
			
        }
        .personIcon {
            width:22px;
            height: 20px;
            float: left;
            padding-left:5px;
        }
        .cpCount {
            line-height: 20px;
            font-size:16px;
        }
		
		
		.aaa {
			float:left;
			margin-left:10px;
			margin-top:0;
		}
		
		
		
		button:hover {
		    cursor : pointer;
		}
        

        /* 챌린저 랭킹 배경*/
        #con2 {
            width: 100%;
            height: 800px;
            background : rgba(240, 240, 240, 0.466);
            border-radius: 20px; 
            margin-top: 20px;    
        }

        #con1_title,#con2_title{
            width: 100%;
            height : 80px;
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

        /* 타이틀 & 라인 */
        #con1_title h1,#con2_title h1 {
            position: absolute;
            width: 1000px;  
            text-align: center;
            margin-top: 25px;
        }

        #con1_title a {
            position: absolute;
            color : #757575;
            font-size: 16px;
            margin-top:35px;
            margin-left:925px;
            cursor:pointer;
        }

        #con1_title a:hover {
            color : #88a1db;
        }

        .line {
            border: 3px solid rgba(255, 96, 100, 0.7);
        }

        .h1_title {
           margin-top: 50px;
           text-align: center;
           font-family: "Do Hyeon";
           font-size: 24px;
           color : #757575;
        }

       

        /* 챌린저 랭킹 TOP 5 */
        .rankwrap {
            width: 500px;
            height: 80px;
            margin : auto;
            display:block;
            padding: 20px;
        }
        .ranknum {
            width: 80px;
            height: 80px;
            display: block;
            float: left;
            transform: rotate(20deg);
        }

        .rank {
            width: 360px;
            height: 80px;
            margin-left: 20%;  
            background: #FFFFFF;
            border: 3px solid rgba(255, 96, 100, 0.7);
            box-sizing: border-box;
            border-radius: 55px;         
        }    
        
        #slidebtn_div {
            margin: auto;
            text-align: center;

        }

        .slidebtn{
            width:20px;
            height:8px; 
            border-radius: 50px;  
            border: 0px;   
            background-color: rgba(255, 96, 100, 0.7);
        }


</style>
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>
	

    <!-- content -->
    <!-- 1. 인기 챌린지 -->
    <section id="con1"> 
        <!-- 세부 카테고리 버튼 -->
        <div id="btnwrap">
            <button class="btn"><a href='<%= request.getContextPath()%>/board/main'>자유게시판</a></button>
            <button class="btn"><a href='<%= request.getContextPath()%>/review/main'>후기</a></button>
        </div>

        <!-- 타이틀 -->
        <div id="con1_title">
            <h1 class="h1_title">인기 챌린지</h1>
            <p><a href="<%=request.getContextPath()%>/chall/list">더보기</a></p>            
        </div>

        <div class="line"></div>

        <!-- 슬라이드 -->
        <section id="slide">
            <div style="overflow: hidden;">
                <div class="container">
                	<!-- 첫번째 슬라이드 -->
					 <div class="outer">
                    	 <div class="inner">
                       	<% for(int i = 0; i < 3; i++){ %>
                    	<% for(Challenge c : list){ %>
                    	<% if(list.indexOf(c) == i){ %>
                    		<div class="chall_box">
                    		<img src="<%= request.getContextPath() %>/views/community/images/test1.jpeg" class="chall_img">
                       		<p name="cTitle" class="cTitle"><%= c.getChallTitle() %></p>
                       		<p name="cDate" class="cDate"><%= c.getChallStart() %> 시작</p>
                       		<p name="cFrequency" class="cFrequency aaa"><%= c.getChallFrequency() %></p>
                       		<p name="cPeriod" class="cPeriod aaa"><%= c.getChallPeriod() %></p>
                       		<div class="pCountArea">
	                       		<img src="<%= request.getContextPath() %>/views/community/images/heart.png" class="personIcon">
	                       		<p name="cpCount" class="cpCount aaa"> 234</p>
                       		</div>
                       		</div>
                       		<% } %>
                       		<% } %>
                       		<% } %>
                    	</div>
                    	<div class="inner">
                    	<% for(int i = 3; i < 6; i++){ %>
                    	<% for(Challenge c : list){ %>
                    	<% if(list.indexOf(c) == i){ %>
                    		<div class="chall_box">
                    		<img src="<%= request.getContextPath() %>/views/community/images/test1.jpeg" class="chall_img">
                       		<p name="cTitle" class="cTitle"><%= c.getChallTitle() %></p>
                       		<p name="cDate" class="cDate"><%= c.getChallStart() %> 시작</p>
                       		<p name="cFrequency" class="cFrequency aaa"><%= c.getChallFrequency() %></p>
                       		<p name="cPeriod" class="cPeriod aaa"><%= c.getChallPeriod() %></p>
                       		<div class="pCountArea">
	                       		<img src="<%= request.getContextPath() %>/views/community/images/heart.png" class="personIcon">
	                       		<p name="cpCount" class="cpCount aaa"> 234</p>
                       		</div>
                       		</div>
                       		<% } %>
                       		<% } %>
                       		<% } %>
                    	</div> 
                    	
                    </div>
                    <!-- 두번째 슬라이드 -->
                    <div class="outer">
                    <div class="inner">
                       	<% for(int i = 6; i < 9; i++){ %>
                    	<% for(Challenge c : list){ %>
                    	<% if(list.indexOf(c) == i){ %>
                    		<div class="chall_box">
                    		<img src="<%= request.getContextPath() %>/views/community/images/test1.jpeg" class="chall_img">
                       		<p name="cTitle" class="cTitle"><%= c.getChallTitle() %></p>
                       		<p name="cDate" class="cDate"><%= c.getChallStart() %> 시작</p>
                       		<p name="cFrequency" class="cFrequency aaa"><%= c.getChallFrequency() %></p>
                       		<p name="cPeriod" class="cPeriod aaa"><%= c.getChallPeriod() %></p>
                       		<div class="pCountArea">
	                       		<img src="<%= request.getContextPath() %>/views/community/images/heart.png" class="personIcon">
	                       		<p name="cpCount" class="cpCount aaa"> 234</p>
                       		</div>
                       		</div>
                       		<% } %>
                       		<% } %>
                       		<% } %>
                    	</div>
                    	<div class="inner">
                    	<% for(int i = 9; i < 12; i++){ %>
                    	<% for(Challenge c : list){ %>
                    	<% if(list.indexOf(c) == i){ %>
                    		<div class="chall_box">
                    		<img src="<%= request.getContextPath() %>/views/community/images/test1.jpeg" class="chall_img">
                       		<p name="cTitle" class="cTitle"><%= c.getChallTitle() %></p>
                       		<p name="cDate" class="cDate"><%= c.getChallStart() %> 시작</p>
                       		<p name="cFrequency" class="cFrequency aaa"><%= c.getChallFrequency() %></p>
                       		<p name="cPeriod" class="cPeriod aaa"><%= c.getChallPeriod() %></p>
                       		<div class="pCountArea">
	                       		<img src="<%= request.getContextPath() %>/views/community/images/heart.png" class="personIcon">
	                       		<p name="cpCount" class="cpCount aaa"> 234</p>
                       		</div>
                       		</div>
                       		<% } %>
                       		<% } %>
                       		<% } %>
                    	</div> 
                    </div>
                    <!-- 세번째 슬라이드 -->
                    <div class="outer">
                    	 <div class="inner">
                       	<% for(int i = 12; i < 15; i++){ %>
                    	<% for(Challenge c : list){ %>
                    	<% if(list.indexOf(c) == i){ %>
                    		<div class="chall_box">
                    		<img src="<%= request.getContextPath() %>/views/community/images/test1.jpeg" class="chall_img">
                       		<p name="cTitle" class="cTitle"><%= c.getChallTitle() %></p>
                       		<p name="cDate" class="cDate"><%= c.getChallStart() %> 시작</p>
                       		<p name="cFrequency" class="cFrequency aaa"><%= c.getChallFrequency() %></p>
                       		<p name="cPeriod" class="cPeriod aaa"><%= c.getChallPeriod() %></p>
                       		<div class="pCountArea">
	                       		<img src="<%= request.getContextPath() %>/views/community/images/heart.png" class="personIcon">
	                       		<p name="cpCount" class="cpCount aaa"> 234</p>
                       		</div>
                       		</div>
                       		<% } %>
                       		<% } %>
                       		<% } %>
                    	</div>
                    	<div class="inner">
                    	<% for(int i = 15; i < 18; i++){ %>
                    	<% for(Challenge c : list){ %>
                    	<% if(list.indexOf(c) == i){ %>
                    		<div class="chall_box">
                    		<img src="<%= request.getContextPath() %>/views/community/images/test1.jpeg" class="chall_img">
                       		<p name="cTitle" class="cTitle"><%= c.getChallTitle() %></p>
                       		<p name="cDate" class="cDate"><%= c.getChallStart() %> 시작</p>
                       		<p name="cFrequency" class="cFrequency aaa"><%= c.getChallFrequency() %></p>
                       		<p name="cPeriod" class="cPeriod aaa"><%= c.getChallPeriod() %></p>
                       		<div class="pCountArea">
	                       		<img src="<%= request.getContextPath() %>/views/community/images/heart.png" class="personIcon">
	                       		<p name="cpCount" class="cpCount aaa"> 234</p>
                       		</div>
                       		</div>
                       		<% } %>
                       		<% } %>
                       		<% } %>
                    	</div> 
                    </div>
                </div>
            </div>
            
            
            <!-- 페이징ㄴㄴ 슬라이드 버튼 -->
            <div id="slidebtn_div">
                <button id="slidebtn1" class="slidebtn"> </button>
                <button id="slidebtn2" class="slidebtn"> </button>
                <button id="slidebtn3" class="slidebtn"> </button>
            </div>
            

             <script>
                document.querySelector('#slidebtn2').addEventListener('click', function(){
                    document.querySelector('.container').style.transform = 'translate(-100vw)';
                    
                })
                document.querySelector('#slidebtn3').addEventListener('click', function(){
                	document.querySelector('.container').style.transform = 'translate(-200vw)';
                })
                document.querySelector('#slidebtn1').addEventListener('click', function(){
                    document.querySelector('.container').style.transform = 'translate(0vw)';
                })

            </script>
        </section>   
    </section>


    <!-- 2. 챌린저 랭킹 -->
    <section id="con2">
    <!-- 타이틀 -->
        <div id="con2_title">
            <h1 class="h1_title">챌린저 랭킹 TOP 5</h1>
        </div>
        <div class="line"></div>
        <br><br><br>

        <!-- 랭킹 -->
        <div class="rankwrap">
            <image src='<%=request.getContextPath()%>/views/community/images/1.png' class="ranknum"></image>
            <div class="rank"></div>
        </div>
        <div class="rankwrap">
            <image src='<%=request.getContextPath()%>/views/community/images/2.png' class="ranknum"></image>
             <div class="rank"></div>
        </div>
        <div class="rankwrap">
            <image src='<%=request.getContextPath()%>/views/community/images/3.png' class="ranknum"></image>
            <div class="rank"></div>
        </div>
        <div class="rankwrap">
            <image src='<%=request.getContextPath()%>/views/community/images/4.png' class="ranknum"></image>
            <div class="rank"></div>
        </div>
        <div class="rankwrap">
            <image src='<%=request.getContextPath()%>/views/community/images/5.png' class="ranknum"></image>
             <div class="rank"></div>
        </div> 
    </section>
    
    <footer></footer>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</body>
</html>