<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, report.model.vo.Report, common.model.vo.PageInfo, java.text.SimpleDateFormat, java.text.DateFormat"%>
<%
ArrayList<Report> reList = (ArrayList<Report>)request.getAttribute("list");
PageInfo pi = (PageInfo)request.getAttribute("pi");
Date reported = (Date)request.getAttribute("reported_date");
System.out.println("jsp list : "+reList);

//오늘 날짜 구하기
Date date= new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String today = sdf.format(date);

String year= null;
String month = null;
String day = null;
if(reported !=null){
//글쓰기 비활성화는 30일간
SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
String reported_date = transFormat.format(reported);


//시작날짜 + 기간
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	cal.setTime(reported); // 챌린지 시작일로 세팅 
	cal.add(Calendar.DATE, 30); // 챌린지 시작일 + 기간 세팅 
	String end_date = df.format(cal.getTime()); // 챌린지 시작일 + 기간 
	System.out.println("period(챌린지 끝나는 날): " + end_date); 
	
	year = end_date.substring(0, 4);
	month = end_date.substring(5, 7);
	day = end_date.substring(8, 10);


}
%>

<%if(session.getAttribute("msg") != null){ %>
<script>
	alert('<%=session.getAttribute("msg") %>');
	
</script>
<%
	session.removeAttribute("msg");
 	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
<style>

	.line {
		border: 0.5px solid #937cf790;
	}
	
	#btSection {
		padding-bottom: 100px;
	}
        
	 #content-1 p{
margin-top: 50px;
           text-align: center;
           font-size: 24px;
           color : #757575;   }
   
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
            background: #9e9e9e5b;
            border: 0px;
            border-radius: 55px;       
        }

        .btn a {
            color:white;
            font-family: "Do Hyeon";
            font-size: 16px;
        }

        #con1_title h1{
            /* position: absolute; */
            width: 1000px;  
            text-align: center;
            margin-top: 25px;          
        }

        #h1_title {
           margin-top: 150px;
           text-align: center;
           font-family: "Nanum Gothic";
           font-size: 24px;
           color : black;
        }

        #line {
            border: 3px solid #937cf790;
        }

        /* 게시판 */
        #board_tb {
            width: 80%;
           /*  height: 400px;       */
            border-collapse: collapse;
            
        }

        #board_tb th, #board_tb td {
            border-bottom: 1px solid #75757552;
           /*  padding: 2px; */
        }
        
        #board_tb th {
        	background:#fff;
        }
        
        #board_tb td {
        	height : 30px;
        }

        #tb_title {
            width:50%;
        }
        #tb_author {
            width:30%;
        }
        #tb_date {
            width:10%;
        }
        #tb_views {
            width: 5%;
        }
        #th_title {
        	background : rgba(240, 240, 240, 0.7);
	        height: 30px;
	        font-family: "Nanum Gothic";
	        font-size: 14px;
	        color : #757575;
        }
        
        #board_div{
        	/* padding-top:3%; */
        	margin-left:15%;
        
        }
        
        #write {
            width:55px;
            color:white;
            font-family: "Nanum Gothic";
            margin-top : 20px;
            margin-left : 80%;
        }
        #write a {
            font-size: 14px;
        }

       #backBtn {
		font-family: "Nanum Gothic";
        border-radius: 10px;
        border: solid 1px #9e9e9e5b;
        padding:5px 15px 5px 15px;
        background-color: #e6e4e4b6;
        font-size:10px;
        font-weight: bolder;
        margin-left:78%;
	}
        #btn a {
            font-size: 14px;
            color:#e6e4e4b6;
        }

        #board_tb td:hover {
            cursor : pointer;
        }
        
        /* 페이징바 영역 */
       .pagingArea {
			text-align:center;
		}
	.pagingArea button {
		width: 25px;
		margin-top: 30px;
		border: 0px;
		color: #757575;
		font-family: "Nanum Gothic";
		font-size: 12px;
	}
		
	.pagingArea button:hover {
		cursor:pointer;
	}
        #countDown_content {
	
	font-family: "Nanum Gothic";
	width: 55.5%;
	margin-left: 8%;
	padding: 20px;
}
#count_img {
	margin-left: 170px;
	height: 25px;
	width: 25px;
}
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp" %>

	<section id="btSection">
	
	  	<section id="content-1">
            <p>내가 신고당한 내역</p>
            <div class="line"></div>
        </section>
        
        <div id="board_div">
        	<%if(reported !=null){ %>
		<section id="countDown_content">
			<img
				src="<%=request.getContextPath()%>/resources/images/countdown.png"
				id="count_img" class="img-size"> <span id="countDown_title">챌린지
				시작까지</span> <span id="countDown"></span>
		</section>
		
		<script>
        // 챌린지 시작일 세팅
        var countDownDate = new Date("<%=month%> <%=day%> <%=year%> 00:00:00").getTime();
      
        // 1초마다 카운트 
        var x = setInterval(function() {
      
        // 현재 날짜/시간 가져오기 
        var now = new Date().getTime();
      
        // 챌린지 시작일 - 현재 날짜 
        var distance = countDownDate - now;
      
        // 일,시,분,초 계산
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);
      
        // 화면에 출력
        document.getElementById("countDown").innerHTML = days + "일 " + hours + "시간 "
        + minutes + "분 " + seconds + "초 ";
        
        // 카운트 진행중 & 종료 문구 바꾸기
     	
        
        /* if (distance < 0) {
          clearInterval(x);
          document.getElementById("countDown").innerHTML = "오늘부터 다시 글쓰기가 가능합니다.";
          
        } */
      }, 1000);
      </script>
		<%} %>
            <table id="board_tb">
                <thead>
                    <tr id="th_title">
                        <th style=text-align:center; id="tb_num">번호</th>
                        <th style=padding-left:3%; id="tb_title">제목</th>
                        <th style=text-align:center; id="tb_author">신고 날짜</th>
                        <th style=text-align:center; id="tb_date">처리여부</th>
                    </tr>
                </thead>
                <tbody>
                    <%if(reList.isEmpty()){ %>
					<tr>
						<td colspan="6">내가 신고한 내역이 없습니다.</td>
					</tr>
					<%} else { %>
						<% for(Report r : reList){ %>
						<% if(r.getReport_Status().equals("N")) { %>
						<tr>
							<td style=text-align:center;><%= r.getReport_no() %></td>
							<td style=padding-left:3%;><%= r.getReport_title() %></td>
							<td style=text-align:center;><%= r.getReport_date() %></td>
							<td style=text-align:center;><%= r.getT_f() %></td>
						</tr>
							<%} %>
						<%} %>	
					<%} %>
                </tbody>
            </table>
            
                 </div>

            <!-- 페이징 바 -->
			<div class="pagingArea">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%= request.getContextPath() %>/myPage/reported?currentPage=1'"> &lt;&lt; </button>
			
			<!-- 이전 페이지로 (<) -->
			<% if(pi.getCurrentPage() == 1){ %>
				<button disabled> &lt; </button>
			<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/myPage/reported?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
				<% if(p == pi.getCurrentPage()){ %>
				<button style="background:lightgray;" disabled> <%= p %> </button>
				<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/myPage/reported?currentPage=<%= p %>'"> <%= p %> </button>				
				<% } %>
			<%} %>
			<!-- 다음 페이지로(>) -->
			<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<button disabled> &gt; </button>
				<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/myPage/reported?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<button onclick="location.href='<%= request.getContextPath() %>/myPage/reported?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
			</div>
			
				
   
        
    <button id="backBtn" type="button" class="text_font joinform_btn" onclick="javascript:history.back();">뒤로가기</button>

    
        </section>
    <script>
		
		// 게시판 상세보기 기능
		$(function(){
			$("#board_tb td").mouseenter(function(){
				$(this).parent().css("background","#937cf755");
			}).mouseout(function(){
				$(this).parent().css("background", "none");
			}).click(function(){
				var rNo = $(this).parent().children().eq(0).text();
				
				// 로그인 한 사람만 게시글 상세 페이지 접근 가능하도록
				<% if(loginUser != null) { %>
					location.href='<%= request.getContextPath() %>/report/detail?rNo=' + rNo;
				<% } else { %>
					alert('로그인 해야만 게시글 보기가 가능합니다.');
				<% } %>
			});
		});
    </script>
    

    <%@ include file="../common/footer.jsp" %>
</body>
</html>