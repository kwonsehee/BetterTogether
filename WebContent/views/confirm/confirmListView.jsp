<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, confirm.model.vo.Cer, common.model.vo.PageInfo"%>
<%
	ArrayList<Cer> list = (ArrayList<Cer>)request.getAttribute("list");
	System.out.println(list);
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String title = (String)request.getAttribute("title");
	System.out.println(title);
	int cno = Integer.parseInt((String.valueOf(request.getAttribute("cno"))));
	System.out.println(cno);
	int loop = 4<list.size() ? 4 :list.size();
	System.out.println(loop);
	int join = Integer.parseInt((String.valueOf(request.getAttribute("join"))));
	System.out.println("confirmListView : "+join);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증하기 리스트</title>
   <style>
     /* content 부분 */
     	#content-1{
            
            width: 100%;
            height: 10%;
            float: left;
        }

        #content-1 p{
            border:solid 1px red; 
            font-size: 30px;
            text-align: center;
            margin-top: 18px;
        }

        #content-2{
            border:solid 1px blue; 
            width: 100%;
            height: 90%;
            float: left;


        }
        
        .confirm{ 
            width: 80%;
            height: 70%;
            margin-top: 5%;
            margin-left: 10%;
            text-align: center;
            border: 1px solid black; 
            padding-top: 10%;
            background: white; 
        }
        .confirm img{
            width : 180px;
            height : 150px;
            border: 1px solid black;
        }
/*         .plus_btn{ 
            width : 180px;
            height : 150px;
            border: 0px;
            color: white;
            font-size: 60px;
            background-color: rgba(196, 196, 196, 0.5);

        } */

        .line{
            float: left;
            width: 100%;
            height: 7px;
            background-color: rgba(255, 96, 100, 0.7);
        }
        
        /* 뒤로가기 버튼 */
        .back_btn,  .plus_btn {
            width: 130px;
            font-family: "Do Hyeon";
            font-size: 20px;
            background: none;
            border-radius : 20px;
            border: 2px solid #ff60657e;
            float: right;
            margin-top : 2%;
            margin-right : 10%;
        }
        .confirm_table td{
        	width: 250px;
        	height: 180px;
        	border: 1px solid red;
        	
        }
    </style>
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>
<section id="content" class="content_css">

        <section id="content-1">
        <%if(join==0){ %>
         <p>인증모아보기</p>	
        <%}else{ %>
            <p>인증하기</p>
		<%} %>
            <div class="line"></div>
        </section> 

        <section id="content-2">
        	
            <div class='confirm'style="padding-top: 7%;">
            <p style="text-align: center; margin-top:0px;"><%=title %></p>
                <table class="confirm_table"style="width : 100%; height: 80%; border : solid 1px red;">
                 <% if(list.isEmpty()) { %>
                 <tr style="border : solid 1px red;">
                 	<th style="color : red; font-size:35px;">챌린지 인증사진이 없습니다.</th>
                 </tr>
                 <tr>
                   <%if(join>0){ %>
                        <th ><input type="submit" value="+" class="plus_btn" id="plusBtn"></th>
                    <%} %>
                 </tr>
                  <% } else { %>
                  		
                  <tr style="border : solid 1px red;">
                    <% for(int i=0;i<loop;i++) { %>
                        <td style="border : solid 1px red;">
                        <input type="hidden" name="ceno" value="<%=list.get(i).getCer_id() %>">	
                        <img src="<%= request.getContextPath()%>/resources/uploadFiles/<%= list.get(i).getCer_pic()%>">
                        </td>
                    <% } %>
                    </tr>
                    <tr>
                    <% for(int i=4;i<list.size();i++) { %>
                        <td style="border : solid 1px red;">
                        <input type="hidden" value="<%=list.get(i).getCer_id() %>">   
                        <img src="<%= request.getContextPath()%>/resources/uploadFiles/<%= list.get(i).getCer_pic()%>">
                        </td>
                    <% } %>
                    
                   
                     
                    </tr>    
                    
                 <% } %>
                </table>
                
            </div>
             <%if(join>0){ %>
                 <button type="button" id="plusBtn" class="plus_btn">인증하기</button>
                 <script>
                        
                    //+버튼 클릭 이벤트
                    const plusBtn = document.getElementById('plusBtn');
                    plusBtn.addEventListener('click',function(){
                       location.href='<%=request.getContextPath()%>/views/confirm/confirmInsert.jsp?cno=<%=cno%>&title=<%=title%>';
                    });
                        
						</script>  
                 
                    <%} %>
            <button type="button" id="backBtn" class="back_btn"onclick="javascript:history.back();">목록으로</button>
		
              <!-- 페이징 바 -->
			<div class="pagingArea">
			<!-- 맨 처음으로 (<<) -->
			<%if(join>0){ %>
			<button onclick="location.href='<%= request.getContextPath() %>/confirm/list?cno=<%=cno%>&currentPage=1'"> &lt;&lt; </button>
			<%}else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/confirm/list?title=챌린지&cno=<%=cno%>&currentPage=1'"> &lt;&lt; </button>
			<%} %>
			
			<!-- 이전 페이지로 (<) -->
			<% if(pi.getCurrentPage() == 1){ %>
				<button disabled> &lt; </button>
			<%}else if(join>0){ %>	
				<button onclick="location.href='<%= request.getContextPath() %>/confirm/list?cno=<%=cno%>&currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
			<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/confirm/list?title=챌린지&cno=<%=cno%>&currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
				<% if(p == pi.getCurrentPage()){ %>
				<button style="background:lightgray;" disabled> <%= p %> </button>
				<% } else { %>
					<%if(join>0){ %>
					<button onclick="location.href='<%= request.getContextPath() %>/confirm/list?cno=<%=cno%>&currentPage=<%= p %>'"> <%= p %> </button>
					<%}else { %>
					<button onclick="location.href='<%= request.getContextPath() %>/confirm/list?title=챌린지&cno=<%=cno%>&currentPage=<%= p%>'"> <%= p%> </button>		
					<% } %>
				<% } %>
			<%} %>
			<!-- 다음 페이지로(>) -->
			<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<button disabled> &gt; </button>
				<%} else if(join>0) { %>
				<button onclick="location.href='<%= request.getContextPath() %>/confirm/list?cno=<%=cno%>&currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
				<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/confirm/list?title=챌린지&cno=<%=cno%>&currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<%if(join>0){ %>
			<button onclick="location.href='<%= request.getContextPath() %>/confirm/list?cno=<%=cno%>&currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
			<%}else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/confirm/list?title=챌린지&cno=<%=cno%>&currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
			<%} %>
			</div>
			
        </section>
	  
    </section>
	<script>
   <%--  //+버튼 클릭 이벤트
         const plusBtn = document.getElementById('plusBtn');
         plusBtn.addEventListener('click',function(){
            location.href='<%=request.getContextPath()%>/views/confirm/confirmInsert.jsp?cno=<%=cno%>&title=<%=title%>';
         });
         
 --%>
     <%-- 	//목록으로 버튼 이벤트
     	const backBtn = document.getElementById('backBtn');
     	backBtn.addEventListener('click',function(){
     		location.href='<%= request.getContextPath()%>/confirm/joinchalllist';
     	});
 --%>
  //인증 디테일으로 이동
	$(function(){
		$(".confirm_table td").mouseover(function(){
			console.log("들어옴 ");
			$(this).css("background","#f7dede");
		}).mouseout(function(){
			$(this).css("background", "#f9f1f1");
		}).click(function(){
			var ceno = $(this).children().eq(0).val();
			location.href='<%= request.getContextPath() %>/confirm/detail?ceno=' + ceno;
			
		});
	});
	</script>
</body>
</html>