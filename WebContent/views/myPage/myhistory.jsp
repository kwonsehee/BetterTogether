<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="refund.model.vo.History, common.model.vo.*,  java.util.ArrayList"%>
 <%
 // 내가 모집한 챌린지 조회
 ArrayList<History> list = (ArrayList<History>)request.getAttribute("list");
	
// 페이징 처리 
PageInfo pi = (PageInfo)request.getAttribute("pi");

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
     /*        border:solid 1px red;  */
            font-size: 24px;
            text-align: center;
   }
        #content-2{
            padding-left: 22%;
            margin-top: 5%;
        }
      #history_tb{
      	width:800px;
      	
      }
      #history_tb p{
       font-family: "Nanum Gothic";
		font-size:16px;
      }  
       #history_column p{
       text-align : center;
       }
    	/*페이징 바*/
	#pagingArea {
			text-align:center;
		}
		
	#pagingArea button {
		width:25px;
		margin-top:20px;
		border : 0px;
		color : #757575;
		font-family: "Nanum Gothic";
		font-size:12px;
		margin-top:70px;
	}
		
	#pagingArea button:hover {
		cursor:pointer;
	}
	    
    .pointBtn{
    font-family: "Nanum Gothic";
         border-radius: 10px;
           border: solid 1px #9e9e9e5b;
           padding:5px 15px 5px 15px;
           background-color: #e6e4e4b6;
           font-size:10px;
           font-weight: bolder;
           margin-left : 10px;
           
    }
    #pointBtns{
    text-align : center;
    margin-top:70px;
    }
    </style>
</head>
<body>

<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>

<section id="btSection" class="content_css">

        <section id="content-1">
            <p>포인트 거래 내역</p>
            <div class="line"></div>
        </section> 
        

        <section id="content-2">
        <%if(list.size()>0){ %>
            <table id="history_tb"style="border:1px solid black;">
            	<tr id="history_column">
            	<td><p>출입금</p></td>
            	<td><p>거래 내역</p></td>
            	<td><p>금액</p></td>
            	<td><p>거래 후 잔액</p></td>
            	<td><p>날짜</p></td>
            	</tr>
            <%for(int i =0;i<list.size();i++){ %>
           	<tr>
            	<td><%if(list.get(i).getPm()==0){ %>
            		<p>출금</p>
            		<%}else{ %>
            		<p>입금</p>
            		<%} %>
            	</td>
            	<td><p><%=list.get(i).getComment() %></p></td>
            	<td><p><%=list.get(i).getHis_money() %></p></td>
            	<td><p><%=list.get(i).getPoint() %></p></td>
            	<td><p><%=list.get(i).getHis_date() %></p></td>
            </tr>
            <%} %>
            </table>
          <%}else{ %>
          <p>포인트 출입금 내역이 없습니다.</p>
          <%} %>
        </section>
	<!-- 페이징 바 -->
        <section id="page_css">
            <div id="pagingArea">
            <!-- 처음으로(<<) 이전페이지로(<) 페이지 목록 다음 페이지로(>) 맨 끝으로(>>) -->  
              
            <!-- 처음으로(<<) -->
			<button onclick="location.href='<%= request.getContextPath() %>/myPage/history?currentPage=1'"> &lt;&lt;</button>	
			
			<!-- 이전으로(<) -->
			<% if(pi.getCurrentPage() == 1) {%>
			<button disabled> &lt; </button>
			<% } else {%>
	        <button onclick="location.href='<%= request.getContextPath() %>/myPage/history?currentPage=<%= pi.getCurrentPage() - 1%>'"> &lt; </button>
			<% } %>
			
			<!-- 7개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) {%>
			<% if(p == pi.getCurrentPage()) { %>
			<button style="background:lightgray;" disabled><%= p %></button>
			<% } else {%>
			<button onclick="location.href='<%= request.getContextPath() %>/myPage/history?currentPage=<%=p %>'"> <%= p %> </button>
			<% } %>
			<%} %>
            
            <!-- 다음으로(>) -->
			<% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
			<button disabled> &gt;</button>
			<% } else {%>
			<button onclick="location.href='<%= request.getContextPath() %>/myPage/history?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt;</button>
			<% } %>
              
             <!-- 맨 끝으로 (>>) -->
			<button onclick="location.href='<%= request.getContextPath() %>/myPage/history?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
            </div>
             
         </section>
         
         <div id="pointBtns">
         
         <button type="button" id="refundBtn" class="pointBtn">포인트 환급</button>
         <button type="button" id="pointcharginBtn"class="pointBtn">포인트 충전</button>
         </div>
       <script>
	// 참가인원 보기 
	const refundBtn = document.getElementById('refundBtn');
	refundBtn.addEventListener('click',function(){
	 	
		var url = '<%= request.getContextPath()%>/views/myPage/refundForm.jsp';
		
		// 팝업 가운데에 띄우기
		var popupWidth = 600;
		var popupHeight = 500;

		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
		
		window.open(url , "포인트 환급",  'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	});
	// 참가인원 보기 
	const pointcharginBtn = document.getElementById('pointcharginBtn');
	pointcharginBtn.addEventListener('click',function(){
	 	
		var url = '<%= request.getContextPath()%>/views/myPage/PointCharging.jsp';
		
		// 팝업 가운데에 띄우기
		var popupWidth = 600;
		var popupHeight = 500;

		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
		
		window.open(url , "포인트 충전",  'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	});
	</script>
    </section>
    
    <%@ include file="../common/footer.jsp" %>
</body>
</html>