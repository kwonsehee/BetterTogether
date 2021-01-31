<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="community.model.vo.Review"%>
<%
	Review r = (Review)request.getAttribute("r");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	if(request.getAttribute("result") != null){
		if(request.getAttribute("result").equals("success")) {
%>
<script>
	alert("후기가 수정 되었습니다.");
	window.close();
</script>
<%      } else { %>
<script>
	alert("후기 수정에 실패하였습니다.");
</script>
<%		}
	}%>

<style>
#contentArea{width:90%; height:100px;}

#star a {
	text-decoration: none;
	color: rgb(172, 172, 172);
	font-size: 25px;
	margin-top: 3px;
}

#star a.on {
	color: #ff6064;
}

#starArea {
	margin-left: 10px;
	color: rgba(255, 96, 100, 0.7);
}
</style>
</head>
<body>
	<h2>댓글 수정</h2>
	<br>
	
		 <table id="reviewTb">
					<tr>
						<td id="nickname"><%= r.getNickName() %></td>
						<td id="challName"><%= r.getChallTitle() %></td>
						<td id="starArea">
							<p id="star">
								<a href="#" value=1>★</a> 
								<a href="#" value=2>★</a> 
								<a href="#" value=3>★</a> 
								<a href="#" value=4>★</a>
								<a href="#" value=5>★</a>
							<p>
						</td>
						<td id="createDate" name="content"><%= r.getCreateDate() %></td>
					</tr>
					<tr>
						<textarea id="contentArea" style="resize:none;" name="content"><%= r.getrContent() %></textarea>
					</tr>
		</table>
		
		<div class="btnArea">
			<button type="submit" id="submit">수정하기</button>
			<button type="button" onclick='window.close()'>취소</button>
		</div>	
		
	<script>
    	// 별 색 채워짐 이벤트
        $('#star a').click(function(){ 
            $(this).parent().children("a").removeClass("on"); 
            $(this).addClass("on").prevAll("a").addClass("on"); 
            console.log($(this).attr("value")); 
            star = $(this).attr("value");
        });
 	</script>
 	
 	<script>
 	
 	$(function(){
 		$("#submit").click(function(){
 			var rId = <%= r.getrId() %>;
 			var content = $("#contentArea").val();
 			
 			$.ajax({
 	 			url : "<%= request.getContextPath() %>/review/update",
 	 			type : "post",
 	 			dataType : "json",
 	 			data : {rId : rId, content : content, star : star},
 	 			success : function(data){
 	 				window.opener.document.location.reload();
 	 				window.close();
 	 			},
 	 			error : function(e){
 	 				console.log(e);
 	 			}
 	 		});
 		});
 	});
 	</script>
 	
 	
 	
 	
 	
 	
 	
	
	
	
 	
 		
</body>
</html>