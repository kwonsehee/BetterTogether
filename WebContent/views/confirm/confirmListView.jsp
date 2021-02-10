<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, confirm.model.vo.Cer, common.model.vo.PageInfo"%>
<%
	ArrayList<Cer> list = (ArrayList<Cer>)request.getAttribute("list");
	System.out.println(list);
	String confirm = (String)request.getAttribute("confirm");

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
<title>Better Together</title>
   <style>
   #btSection {
	padding-bottom: 100px;
}
     /* content 부분 */
     	#content-1{
            
            width: 100%;
            height: 10%;
            float: left;
        }

        #content-1 p{
      /*       border:solid 1px red;  */
           
          margin-top: 50px;
           text-align: center;
           font-size: 24px;
           color : #757575;
        }
        

        #content-2{
       /*      border:solid 1px blue;  */
            width: 100%;
            height: 90%;
            float: left;
        }
        
        .confirm{ 
            width: 80%;
            height: 80%;
            margin-top: 5%;
            margin-left: 10%;
           
          /*   border: 1px solid black;  */
            padding-top: 10%;
            background: white; 
        }
        .confirm img{
            width : 180px;
            height : 150px;
    /*       border: 1px solid black;   */
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
             height: 1px;
            
            background-color:#937cf790;
             border: 0.5px solid #937cf790;
        }
        
        /* 뒤로가기 버튼 */
        .back_btn,  .plus_btn {
    /*          float: right; */
            
            font-family: "Nanum Gothic";
         border-radius: 10px;
           border: solid 1px #9e9e9e5b;
           padding:5px 15px 5px 15px;
           background-color: #e6e4e4b6;
           font-size:10px;
           font-weight: bolder;
        }
       
        
          .pagingArea {
       		margin-top:2%;
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
		.button_area{
		 float: left;
		
		margin-top:3%;
		margin-left:10%;
		display:block;
		
		}
		#confirm_photo{
	      width:95%;
	      min-height:400px;
	      margin:auto;
	     margin-top:5%;
	     padding-left:3%;
      
	   
      }
       #confirm_photo_list{
      	width:200px;
      	display:inline-block;
      	padding:10px;
      	margin:10px;
      	text-align:left;
      	
      }
  
    </style>
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>
<section id="btSection" class="content_css">

        <section id="content-1">
        <%if(join==0){ %>
         <p >인증모아보기</p>	
        <%}else{ %>
            <p >인증하기</p>
		<%} %>
            <div class="line"></div>
        </section> 

        <section id="content-2">
        	
            <div class="confirm" style="padding-top: 50px;padding-bottom: 50px;">
            <p style="text-align:center;margin-top:0px;" ><%=title %></p>
              
                 <% if(list.isEmpty()) { %>
              
                 	<p style="text-align:center;color : #937cf790; font-size:35px;padding-top:10%;padding-bottom:10%;">챌린지 인증사진이 없습니다.</p>
                 
                  <% } else { %>
                  		
                	<div id="confirm_photo">
                    <% for(int j=0;j<list.size();j++) { %>
                        <div id="confirm_photo_list">
                        
                        <input type="hidden" name="ceno" value="<%=list.get(j).getCer_id() %>">	
                        <img src="<%= request.getContextPath()%>/resources/uploadFiles/<%= list.get(j).getCer_pic()%>">
                        
                      </div>
                    <% } %>
                   </div>
         
                 <% } %>
             
            </div>
            
            <% if(!list.isEmpty()) { %>
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
			<%} %>
        </section>
    
    <div class="button_area">
       <button type="button" id="backBtn" class="back_btn">목록으로</button>
	  <%if(join>0){ %>
        <button type="button" id="plusBtn" class="plus_btn"style="margin-left: 865px;">인증하기</button>
        <script>
                        
        //+버튼 클릭 이벤트
        const plusBtn = document.getElementById('plusBtn');
        plusBtn.addEventListener('click',function(){
        location.href='<%=request.getContextPath()%>/views/confirm/confirmInsert.jsp?cno=<%=cno%>&title=<%=title%>&confirm=<%=confirm%>';
        });
        
      //나의 챌린지 인증하기 버튼
		const backBtn = document.getElementById("backBtn");
		backBtn.addEventListener('click',function(){
			
			location.href="<%= request.getContextPath()%>/confirm/joinchalllist";
			
		});
        </script>  
        
                 
        <%} %>
      </div>
		
    </section>
	<script>
  //인증 디테일으로 이동
	$(function(){
		$("#confirm_photo #confirm_photo_list").mouseover(function(){
			console.log("들어옴 ");
			$(this).css("background","#e0dbf890");
		}).mouseout(function(){
			$(this).css("background", "white");
		}).click(function(){
			var ceno = $(this).children().eq(0).val();
			location.href='<%= request.getContextPath() %>/confirm/detail?ceno=' + ceno;
			
		});
	});
	</script>
	 <%@ include file="../common/footer.jsp"%>
</body>
</html>