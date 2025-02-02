<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="community.model.vo.*, qna.model.vo.QnA, challenge.model.vo.*, studycafe.model.vo.*, report.model.vo.*"%>
<%
   ArrayList<QnA> QNANew = (ArrayList<QnA>)request.getAttribute("QNANew");
   ArrayList<Challenge> challNew = (ArrayList<Challenge>)request.getAttribute("challNew");
   ArrayList<Cafe> cafeNew = (ArrayList<Cafe>)request.getAttribute("cafeNew");
   ArrayList<Report> reportNew = (ArrayList<Report>)request.getAttribute("reportNew");
   ArrayList<Board> boardNew = (ArrayList<Board>)request.getAttribute("boardNew");
   int board = Integer.parseInt(String.valueOf(request.getAttribute("boardCount")));
   int cafe = Integer.parseInt(String.valueOf(request.getAttribute("cafeCount")));
   int chall = Integer.parseInt(String.valueOf(request.getAttribute("challCount")));
   int notice = Integer.parseInt(String.valueOf(request.getAttribute("noticeCount")));
   int qna = Integer.parseInt(String.valueOf(request.getAttribute("qnaCount")));
   int report = Integer.parseInt(String.valueOf(request.getAttribute("reportCount")));
   int todayJoin = Integer.parseInt(String.valueOf(request.getAttribute("todayJoinCount")));
   int challStart = Integer.parseInt(String.valueOf(request.getAttribute("challStartCnt")));
   int challBefore = Integer.parseInt(String.valueOf(request.getAttribute("challBeforeCnt")));
   int challEndCnt = Integer.parseInt(String.valueOf(request.getAttribute("challEndCnt")));
   int totalCnt = Integer.parseInt(String.valueOf(request.getAttribute("totalCnt"))); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <!-- 차트 링크 --> 
 <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>


<style>

#con2_title h1 {
   text-align: center;
   font-family: "Nanum Gothic";
   color: #757575;
   font-size: 24px;
}

.btn1 {
   font-family: "Nanum Gothic";
   border-radius: 10px;
   border: solid 1px #9e9e9e5b;
   padding: 5px 15px 5px 15px;
   background-color: #e6e4e4b6;
   font-size: 10px;
   font-weight: bolder;
   margin-top: 5%;
   margin-bottom: 1%;
   
}

#btnArea{
   padding:5%;
   float:right;
}

#line {
   border: 0.5px solid #937cf790;
   width: 100%;
   margin: auto;
   
}

#boardSection {

}

#newContent_div{
   width: 30%;
    border: 1px solid black;
    display: inline-table;
    margin-left: 8%;
   
}

#title{
   font-size: 15px;
   color: #757575;
}

#article1{
   margin-left:15%;
   
}

#newcontent_title{
   font-family: "Nanum Gothic";
   border-bottom: 2px solid #937cf790;
   text-align: center;

}

#content_title {
   font-size: 15px;
   color: #757575;
   width: 300px;

}

#chaSection{
   width: 100%;
   margin-left: 13%;
}

#chart{
   width: 30%;
    float: left;
    background-color: white;
    margin: 50px;
   margin-top: -10px;
}

.btSection{
   display:inlien-block;
}



#divlabel{
   width:100%;
   text-align: center;
   font-family: "Nanum Gothic";
   color: #757575;
   font-size: 24px;
   padding-bottom: 3%;
}

#background{

   background-color:rgba(196, 196, 196, 0.15);
   margin:5%;
   padding-bottom: 20%;
}

#articleback{
   margin-left: 5%;
    margin-right: 5%;
    padding-right: 13%;
    padding-bottom: 5%;
    background-color: rgba(196, 196, 196, 0.15);
}
</style>
<body>
   <%@ include file="../common/common_ui.jsp"%>
   <section id="btSection" class="btSection">
   <!-- title -->
    <div id="con2_title">
      <h1 class="h1_title">관리자페이지</h1>
    </div>
    
    <div id="line"></div>
    
    <div id="background">
    
    <label id="divlabel" style="padding-top:3%;">통계</label>
    
    <div id="chaSection">
             <!-- 차트div --> 
         <div id="chart" >   
            <div class="container"> 
               <canvas id="myChart" class="myChart"></canvas>
            </div> 
         </div>
   
         <div id="chart">   
            <div class="container"> 
               <canvas id="myChart2" class="myChart2"></canvas>
            </div> 
         </div>
      
   </div>
   </div>
   
   <div id="articleback">
   <div id="article1">
   
   <label id="divlabel" style=" padding-top: 2%;">게시판</label>
   
      <!-- 질문div -->
     <div id="newContent_div" style="margin-left: 50px;">
               <div id="newcontent_title">
                  <span id="title">최근 등록 된 질문</span>
               </div>
               <%
                  if (QNANew.isEmpty()) {
               %>
               <div id="content_title">최근 등록 된 질문이 없습니다.</div>
               <%
                  } else {
               %>
               <%
                  for (QnA q : QNANew) {
               %>
               <div id="content_title"><%=q.getQnaTitle()%></div>
               <%
                  }
               %>
               <%
                  }
               %>
            </div>

            <!-- 신고div -->
            <div id="newContent_div" style="margin-left: 160px;">
               <div id="newcontent_title">
                  <span id="title">최근 등록 된 신고</span>
               </div>
               <%
                  if (reportNew.isEmpty()) {
               %>
               <div id="content_title">최근 등록 된 신고가 없습니다.</div>
               <%
                  } else {
               %>
               <%
                  for (Report r : reportNew) {
               %>
               <div id="content_title"><%=r.getReport_title()%></div>
               <%
                  }
               %>
               <%
                  }
               %>
            </div>

            <!-- 챌린지div -->
            <div id="newContent_div" style="margin-left: 50px;">
               <div id="newcontent_title">
                  <span id="title">최근 등록 된 챌린지</span>
               </div>
               <%
                  if (challNew.isEmpty()) {
               %>
               <div id="content_title">최근 등록 된 챌린지가 없습니다.</div>
               <%
                  } else {
               %>
               <%
                  for (Challenge c : challNew) {
               %>
               <div id="content_title"><%=c.getChallTitle()%></div>
               <%
                  }
               %>
               <%
                  }
               %>
            </div>

            <!-- 카페div -->
            <div id="newContent_div"
               style="margin-left: 160px; margin-top: 30px;">
               <div id="newcontent_title">
                  <span id="title">최근 등록 된 카페</span>
               </div>
               <%
                  if (cafeNew.isEmpty()) {
               %>
               <div id="content_title">최근 등록 된 카페가 없습니다.</div>
               <%
                  } else {
               %>
               <%
                  for (Cafe c : cafeNew) {
               %>
               <div id="content_title"><%=c.getCafe_name()%></div>
               <%
                  }
               %>
               <%
                  }
               %>
            </div>

            <!-- 게시물div -->
            <div id="newContent_div" style="margin-top: 5%; margin-left: 50px;">
               <div id="newcontent_title">
                  <span id="title">최근 등록 된 게시물</span>
               </div>
               <%
                  if (boardNew.isEmpty()) {
               %>
               <div id="content_title">최근 등록 된 게시물이 없습니다.</div>
               <%
                  } else {
               %>
               <%
                  for (Board b : boardNew) {
               %>
               <div id="content_title"><%= b.getbTitle() %></div>
               <% } %>
               <% } %>
            </div>
         </div>
      </div>
   <!-- 버튼 -->
   <div id="btnArea">
      <button id="download" type="button" class="btn1"
            onclick="location.href='<%= request.getContextPath() %>/administratorPage'">다운로드</button>
   </div>
   
   </section>
   <!-- 부트스트랩 --> 
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> 
   
   <!-- 차트 --> 
   <script> 
   var ctx = document.getElementById('myChart');
   var myChart = new Chart(ctx, { type: 'bar', data: { labels: ['자유게시판', '챌린지', '카페', '질문', '신고'], 
      datasets: [{ label: '최근 등록 된 게시물', data: [<%= board %>, <%= chall %>, <%= cafe %>, <%= qna %>, <%= report %>], 
      backgroundColor: [ 'rgba(255, 99, 132, 0.2)', 
                     'rgba(54, 162, 235, 0.2)', 
                     'rgba(255, 206, 86, 0.2)', 
                     'rgba(75, 192, 192, 0.2)', 
                     'rgba(153, 102, 255, 0.2)'], 
      borderColor: [ 'rgba(255, 99, 132, 1)', 
                  'rgba(54, 162, 235, 1)', 
                  'rgba(255, 206, 86, 1)', 
                  'rgba(75, 192, 192, 1)', 
                  'rgba(153, 102, 255, 1)'], 
      borderWidth: 1 }] }, 
      options: { scales: { yAxes: [{ ticks: { beginAtZero: true } }] } } }); 
   
   var ctx = document.getElementById('myChart2');
   var myChart2 = new Chart(ctx, { type: 'bar', data: { labels: ['오늘 가입한 회원', '총 회원수'], 
      datasets: [{ label: '회원 정보', data: [<%= todayJoin %>, <%= totalCnt %>], 
      backgroundColor: [ 'rgba(255, 99, 132, 0.2)', 
                     'rgba(54, 162, 235, 0.2)', 
                     'rgba(255, 206, 86, 0.2)', 
                     'rgba(75, 192, 192, 0.2)', 
                     'rgba(153, 102, 255, 0.2)'], 
      borderColor: [ 'rgba(255, 99, 132, 1)', 
                  'rgba(54, 162, 235, 1)', 
                  'rgba(255, 206, 86, 1)', 
                  'rgba(75, 192, 192, 1)', 
                  'rgba(153, 102, 255, 1)'], 
      borderWidth: 1 }] }, 
      options: { scales: { yAxes: [{ ticks: { beginAtZero: true } }] } } }); 
   </script>
   
   
    <%@ include file="../common/footer.jsp" %>
   
</body>
</html>