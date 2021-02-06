<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.text.SimpleDateFormat ,confirm.model.vo.Confirm, common.model.vo.PageInfo"%>
<%
	ArrayList<Confirm> list= (ArrayList<Confirm>)request.getAttribute("list");
	System.out.println("참여중인 챌린지 리스트 : "+list);
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
<style>
#btSection {
	padding-bottom: 100px;
}
        .content_css>p{
           margin-top: 50px;
           text-align: center;
           font-size: 24px;
           color : #757575;
        }
        
       
        #ok{
            width: 150px;
            height: 50px;
            margin-left: 40%;
            margin-top: 1%;
            font-family: "Nanum Gothic";

            font-size: 20px;
            border-radius: 20px;
            border: 1px solid #fdc8c6;
            background-color: #fdc8c6;
      
        }
           .line{
            float: left;
            width: 100%;
            height: 1px;
            
            background-color:#937cf790;
             border: 0.5px solid #937cf790;
             
        } 
        .empty_chall{
        	color : #937cf790;
        	margin-top : 10%;
        	font-size : 35px;
        	font-family:"Nanum Gothic";

        	text-align : center;
        }
      .ing_challenge{
            
            width: 80%;
            height: 140px;
            margin-left: 9%;
            margin-right: 9%;
            margin-top: 6%;
            /* border: solid 1px black; */
            background-color: rgba(196, 196, 196, 0.15);

        }
        .ing_challenge1{
            float: left;
            width: 25%;
            height: 100%;
            /* border: solid 1px black; */

        }
        .ing_challenge2{
        	padding-top:12px;
        	padding-left : 10px;
            float: left;
            width: 35%;
            height: 100%;
        }
        .ing_challenge2 p{
        	font-size : 16px;
        	font-family:"Nanum Gothic";
        
        }
        .ing_challenge3{
            float: left;
            width: 350px;
            height: 100px;
            padding-top: 40px;
            padding-left: 50px;
         
        }
        .btn_camera{ 
            width: 55px;
            height: 55px;
            border-radius: 100%;
            border: #937cf790;
            background-color: #937cf790;
        }
        .btn_camera_end{
            width: 55px;
            height: 55px;
            border-radius: 100%;
            border:rgba(117, 117, 117, 0.5);
            background-color:rgba(117, 117, 117, 0.5);
        }
        #cno{
        	display : none;
        }
     
   
       .pagingArea {
       		margin-top:5%;
			text-align:center;
		}
		.pagingArea button {
			width:25px;
			margin-top:20px;
			border : 0px;
			color : #757575;
			font-family: "Nanum Gothic";
			font-size:12px;
		}
		
		.pagingArea button:hover {
			cursor:pointer;
		}
		.chall_button{
		font-family: "Nanum Gothic";
         border-radius: 10px;
           border: solid 1px #9e9e9e5b;
           padding:5px 15px 5px 15px;
           background-color: #e6e4e4b6;
           font-size:10px;
           font-weight: bolder;
           color : black;
           }
           #nowJoin{
           margin-top:10%;
           text-align:center;
            margin-bottom:10%;
          
           }
			#nowJoin p{
			 font-size :15px;
			}
    </style>
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>
	<section id="btSection" class="content_css">
	

        <section class="content_css">
            <p>참여중인 챌린지</p>
            <div class="line"></div>
     
            <%if(list.isEmpty()){ %>
            <div class="empty_chall">참여중인 챌린지가 없습니다!!</div>
            <div id="nowJoin">
            	<p>지금 바로 챌린지에 참여하기</p>
            	<a href="<%=request.getContextPath()%>/chall/list">더보기</a>
            </div>
            <%}else{ %>
            	<% for(Confirm c:list){ %>
          <div class='ing_challenge'>
                <div class='ing_challenge1'>
                    <img src="<%= request.getContextPath()%>/resources/uploadFiles/<%=c.getFile_path()%>"width="200px"height="140px">
                    <!--  file_path()들어가야하는 자리 -->
                </div>
                <div class='ing_challenge2'>
                    <p><%=c.getChall_title() %></p>
                    <p><%=c.getChall_start() %> ~ <%=c.getEnd_date() %></p>
                    <p><button  class="chall_button" disabled>주 <%=c.getChall_frequency() %>회</button>
					<button class="chall_button"disabled><%=c.getChall_period() %>주 동안</button></p>
                </div>
                
                
            <div class='ing_challenge3'>
                 <div id="cno"name="cno" value="<%=c.getChall_no()%>"><%=c.getChall_no()%></div>
                
                <span>인증하기</span>
                <%System.out.println("ddd : "+c.getStatus()); %>
                <!-- 참여중인 챌린지만 인증하기 버튼 활성화  -->
                <%if(c.getStatus()==1){%>
                 <button type="button"class="btn_camera" id="confirm_submitBtn">
                  
                <%}else {%>
                <button type="button"class="btn_camera"style=" border: rgba(117, 117, 117, 0.5); background-color: rgba(117, 117, 117, 0.5);"  onClick="alert('챌린가 종료되었습니다. ')" > 
                <%} %>
                <img src="<%=request.getContextPath()%>/resources/images/camera_confirm.png"width="42px"height="33px"> 
                </button>
             
                 <span>결과보기</span>
                 <!-- 종료된 챌린지만 결과보기 버튼 활성화  -->
                <%if(c.getStatus()==2){%>
                <button type="button"class="btn_camera" id="confirm_resultBtn">
               
                <%} else{%>
                <button type="button"class="btn_camera" style="border: rgba(117, 117, 117, 0.5); background-color: rgba(117, 117, 117, 0.5);"  onClick="alert('챌린지 종료 후 확인가능합니다.')" >
                
                <%} %>               
                    <img src="<%=request.getContextPath()%>/resources/images/result.png"width="42px"height="33px">
                 </button>
              
                </div>
              
            </div>
				<%} %>	
          
         	
             <!-- 페이징 바 -->
			<div class="pagingArea">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%= request.getContextPath() %>/confirm/joinchalllist?currentPage=1'"> &lt;&lt; </button>
			
			<!-- 이전 페이지로 (<) -->
			<% if(pi.getCurrentPage() == 1){ %>
				<button disabled> &lt; </button>
			<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/confirm/joinchalllist?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
				<% if(p == pi.getCurrentPage()){ %>
				<button style="background:lightgray;" disabled> <%= p %> </button>
				<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/confirm/joinchalllist?currentPage=<%= p %>'"> <%= p %> </button>				
				<% } %>
			<%} %>
			<!-- 다음 페이지로(>) -->
			<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<button disabled> &gt; </button>
				<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/confirm/joinchalllist?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<button onclick="location.href='<%= request.getContextPath() %>/confirm/joinchalllist?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
			</div>
			<%} %>
         	
        </section>
     
		<script>
		
   //인증 리스트로 이동 
		$(function(){
			$(".ing_challenge #confirm_submitBtn").mouseover(function(){
				$(this).parent().parent().css("background","#e0dbf890");
			}).mouseout(function(){
				$(this).parent().parent().css("background", "rgba(219, 219, 219, 0.356)");
			}).click(function(){
				var cno = $(this).parent().children().eq(0).text();
				console.log(cno);
				location.href='<%= request.getContextPath() %>/confirm/list?cno=' + cno;
				
			});
		});
   //결과보기 화면으로 이동
		$(function(){
			$(".ing_challenge #confirm_resultBtn").mouseover(function(){
				$(this).parent().parent().css("background","#e0dbf890");
			}).mouseout(function(){
				$(this).parent().parent().css("background", "#e6e4e4b6");
			}).click(function(){
				var cno = $(this).parent().children().eq(0).text();
				console.log(cno);
				location.href='<%= request.getContextPath() %>/confirm/result?cno=' + cno;
				
			});
		});
	</script>
	
   
    </section>
    
    <%@ include file="../common/footer.jsp"%>
</body>
</html>