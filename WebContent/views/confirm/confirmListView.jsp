<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, confirm.model.vo.Cer, common.model.vo.PageInfo"%>
<%
	ArrayList<Cer> list = (ArrayList<Cer>)request.getAttribute("list");
	System.out.println(list);
	String title = (String)request.getAttribute("title");
	System.out.println(title);
	int cno = Integer.parseInt((String.valueOf(request.getAttribute("cno"))));
	System.out.println(cno);
	int loop = 4<list.size() ? 4 :list.size();
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
        .plus_btn{ 
            width : 180px;
            height : 150px;
            border: 0px;
            color: white;
            font-size: 60px;
            background-color: rgba(196, 196, 196, 0.5);

        }

        .line{
            float: left;
            width: 100%;
            height: 7px;
            background-color: rgba(255, 96, 100, 0.7);
        }
        
        /* 뒤로가기 버튼 */
        .back_btn {
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
            <p>인증하기</p>
            <div class="line"></div>
        </section> 

        <section id="content-2">
        	
            <div class='confirm'style="padding-top: 7%;">
            <p style="text-align: center; margin-top:0px;"><%=title %></p>
                <table class="confirm_table"style="width : 100%; height: 80%; border : solid 1px red;">
                 <% if(list.isEmpty()) { %>
                 <tr style="border : solid 1px red;">
                 	<p>아직 <%=title %> 챌린지 인증사진이 없습니다.</p>
                 </tr>
                 <tr>
                   <td ><input type="submit" value="+" class="plus_btn" id="plusBtn"></td>
                 </tr>
                  <% } else { %>
                  		
                  <tr style="border : solid 1px red;">
                    <% for(int i=0;i<loop;i++) { %>
                        <td style="border : solid 1px red;"><%=list.get(i).getCer_pic() %></td>
                    <% } %>
                    </tr>
                    <tr>
                    <% for(int i=4;i<list.size();i++) { %>
                        <td style="border : solid 1px red;"><%=list.get(i).getCer_pic() %></td>
                    <% } %>
                    
                    
                        <td ><input type="submit" value="+" class="plus_btn" id="plusBtn"></td>
                    </tr>    
                    
                 <% } %>
                </table>
            </div>
            <button type="button" id="backBtn" class="back_btn">목록으로</button>
			
        </section>
	  
    </section>
	<script>
    //+버튼 클릭 이벤트
         const plusBtn = document.getElementById('plusBtn');
         plusBtn.addEventListener('click',function(){
            location.href='<%=request.getContextPath()%>/views/confirm/confirmInsert.jsp?cno=<%=cno%>&title=<%=title%>';
         });
         

     	//목록으로 버튼 이벤트
     	const backBtn = document.getElementById('backBtn');
     	backBtn.addEventListener('click',function(){
     		location.href='<%= request.getContextPath()%>/confirm/joinchalllist';
     	});

	</script>
</body>
</html>