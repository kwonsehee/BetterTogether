<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="challenge.model.vo.Challenge"%>
<%
	Challenge ch = (Challenge)request.getAttribute("challenge");   
	String message=(String)request.getAttribute("msg");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 스타일  -->
<link rel="stylesheet" href='<%=request.getContextPath()%>/resources/css/menu_style.css'>
<style>
        #listbtn{
           font-family: "Do Hyeon";
           width: 150px;
           height: 50px;
           border-radius: 20px;
           border: solid 1px #fdc8c6;
           background-color: #fdc8c6;
           font-size: 20px;
           margin-top: 20px;
        }
        
        #msg_content{
            padding-top: 20px;
            font-size : 30px;
            font-family: "Do Hyeon";
            
        }
        
        button:focus{
            outline:none;
        }
        
        #pay_content{
            margin-top: 50px;
            height:400px;
            width: 400px;
            background-color:#fdc8c6;
            border-radius: 20px;
        
        }

        #pay_table tr{
            font-family: "Do Hyeon";
            font-size: 25px;
        }

        #pay_table td{
            padding:10px;
        }

        #pay_table{
            background-color:white;
            padding:20px;
            border-radius: 20px;
        }

        .pay_img{
            margin-right: 10px;
            margin-left: 10px;
            width: 20px;
            height: 20px;
        }

      
        </style>
</head>
<body>
  <%@ include file="../common/common_ui.jsp"%>
  
  <section id="content" class="content_css">
	<div align='center'>
	<div id="pay_content">
		<h1 id="msg_content" align='center'><%= message %></h1>
		<table id="pay_table">
                    <tr>
                       <td><img src="<%=request.getContextPath()%>/resources/images/check1.png" class="pay_img">주문자 명 : <%=ch.getNickName() %></td>
                    </tr>
                    <tr>
                        <td><img src="<%=request.getContextPath()%>/resources/images/check1.png" class="pay_img">챌린지 명 : <%=ch.getChallTitle() %></td> 
                    </tr>
                    <tr>
                        <td><img src="<%=request.getContextPath()%>/resources/images/check1.png" class="pay_img">결제 일시 : 2021.1.19 23:17</td>
                    </tr>
                    <tr>
                        <td><img src="<%=request.getContextPath()%>/resources/images/check1.png" class="pay_img">주문 금액 : <%=ch.getChallPay() %> 원</td>
                    </tr>
                </table>
	</div>
	
	
		<button id="listbtn">목록으로 돌아가기 </button>
  </section>
  





  <!-- form 태그를 post 방식으로 제출 
	challNo를 화면에 드러내지 않고 form을 submit 하면서 넘길 수 있음-->
	<form id="challNoForm" method="post">
		<input type="hidden" name="challNo" value="<%= ch.getChallNo() %>"> 
	</form>
	
	<script>
	const listbtn = document.getElementById('listbtn');
	listbtn.addEventListener('click',function(){
		$("#challNoForm").attr("action", "<%= request.getContextPath()%>/chall/list");
		$("#challNoForm").submit();
	});
	
	</script>
  
</body>
</html>