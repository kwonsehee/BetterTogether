<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="challenge.model.vo.Challenge, confirm.model.vo.Cer"%>
<%
	Challenge c = (Challenge)request.getAttribute("challenge");
	
	int totalCnt = Integer.parseInt(String.valueOf(request.getAttribute("totalCnt")));
	totalCnt = 3;
	double avgTotal = Double.parseDouble(String.valueOf(request.getAttribute("avgTotal")));
	int num1 = Integer.parseInt(String.valueOf(request.getAttribute("num1")));//100% 달성 인원
	int num2 = Integer.parseInt(String.valueOf(request.getAttribute("num2")));//85%미만 달성 인원
	int num3 = Integer.parseInt(String.valueOf(request.getAttribute("num3")));//85%이상 달성 인원
	Cer cer = (Cer)request.getAttribute("cer");

	//돌려받을 금액
	int money=(int)(c.getChallPay()*cer.getAchieve());
	//달성률이 100%이면 추가금액 지급 
	if(cer.getAchieve()==1){
		money = c.getChallPay()+(c.getChallPay()*num2)/totalCnt;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
    <style>
        #join_chall_title{
              margin-top: 50px;
           text-align: center;
           font-size: 24px;
           color : #757575;
        }
        #join_chall_title2{
          /*   border:solid 1px green;  */
            width: 100%;
            height: 10%;


        }
        #confirm_content{
           /*  border:solid 1px blue;  */
            width: 100%;
            height: 80%;

        }

        .line{
            float: left;
            width: 100%;
            height: 1px;
           background-color:#937cf790;
             border: 0.5px solid #937cf790;
            margin-bottom: 35px;
        }
        
        .challenge_box{
            width: 1200px;
            height: 250px;
            margin-left: 7%;
            background-color: rgba(196, 196, 196, 0.15);
            float: left;
            margin-top:35px;
        }
         .challenge_box2{
            width: 1200px;
            height: 90px;
            margin-left: 7%;
            background-color: rgba(196, 196, 196, 0.15);
            float: left;
            margin-top:55px;
            text-align:center;
        }
      
     .challenge_box p,.challenge_box2 p {
            margin-top: -40px;
            
        }
        #font-large{
            font-family: "Nanum Gothic";
            font-size: 50px;
        }
        .result_chall {
        
        margin-top: 30px;
        margin-left: 15px;
        width: 95%;
        height: 95%;
       
        }
      
        .result_chall span{
 		font-family: "Nanum Gothic";
        font-size:16px;
            padding-left: 30px;
            padding-bottom: 20px;
        }
         .result_chall td{
 		font-family: "Nanum Gothic";
        font-size:22px;
            padding-left: 30px;
            padding-bottom: 20px;
        }
        .circle{
            width: 65px;
            height: 65px;
            margin: 0 0 0 20px;
            padding: 10.4px;
            border-radius: 100%;
            border: #937cf790;
            background-color:#937cf790;
            
        }
        .d_circle{
            width: 65px;
            height: 65px;
            margin: 0 0 0 20px;
            padding: 10.4px;
            border-radius: 100%;
            border: rgba(117, 117, 117, 0.5);
           background-color: rgba(117, 117, 117, 0.5);
        }
        .chall_subTitle{
            width : 100%;
            text-align: center;
            float: left;
            font-family: "Nanum Gothic";
            font-size : 30px;
        }
         /* 뒤로가기 버튼 */
   /*       .back_btn {
            width: 130px;
             font-family: "Nanum Gothic";
            font-size: 20px;
            background: none;
            border-radius : 20px;
            border: 2px solid #ff60657e;
            float: right;
            margin-top : 5%;
            margin-right : 8%;
        }  */
         .back_btn{
        font-family: "Nanum Gothic";
         border-radius: 10px;
           border: solid 1px #9e9e9e5b;
           padding:5px 15px 5px 15px;
           background-color: #e6e4e4b6;
           font-size:10px;
           font-weight: bolder;
          margin-top : 5%;
            margin-right : 8%;
          float: right;
        } 
        #btSection {
	padding-bottom: 100px;
}
/* .result_chall td, .result_chall th{
	border:1px solid black;
} */
#hi{
	font-size:20px;
     font-weight: bolder;
     color:#937CF7;
}
    </style>
</head>
<body>
 <!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>
 
   <section id="btSection" class="content_css">

        <p id="join_chall_title"><%=c.getChallTitle() %> 정보</p>

        <section id="join_chall_title2">
            <div class="line"></div>
           <!--  <div class="chall_subTitle">챌린지 현황 &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp;나의 인증 현황</div> -->
        </section> 

        <section id="confirm_content">
            <div class='challenge_box'>
            	<p style="text-align:center;">챌린지 현황</p>
                <table class="result_chall">
                    <tr>
                        <td rowspan="3"><img src="<%= request.getContextPath()%>/resources/uploadFiles/<%=c.getChallFile()%>"width="200px"height="170px"></td>
                        
                    </tr>
                    <tr>
                    
                        <td><span>총인원</span></td>
                        <td><span><%=totalCnt %>명</span></td>
                          <td><span>평균 달성률</span></td>
                        <td><span><%=Math.round(avgTotal*100*100)/100.0 %>%</span></td>
                      
                    </tr>
                   
                    <tr>
                        <td><span>100%달성</span></td>
                        <td><span><%=num1 %>명</span></td>
                           <td><span>85%이상 달성</span></td>
                        <td><span><%=num3 %>명</span></td>
                        
                        <td><span>85%미만 달성</span></td>
                        <td><span><%=num2 %>명</span></td>
                    
                    </tr>
                   
                    
                    

                </table>
            </div>
         <div class='challenge_box2'>
            <p style="text-align:center;">나의 인증 현황</p>
                <table class="result_chall">
                    <tr>
                        <th><span id="hi">달성률</span></th>
                        <th><span id="hi"><%=Math.round(cer.getAchieve()*100*100)/100.0 %>%</span></th>
                    
                        <td><span>인증 갯수</span></td>
                        <td><span><%=cer.getChall_count() %>개</span></td>
                    
                        <td><span>상금 받기</span></td>
                        <!-- 최소 달성률 통과 못할시 버튼 비화성화 만들어 놓기 -->
                        <%if(cer.getAchieve()>=0.85){ %>
                        <td><button type="button" class="circle" id="payback"> <img src="<%=request.getContextPath()%>/resources/images/money.png"width="44px"height="44px"></td>
                     	<%}else{ %>
                        <td><button type="button" class="d_circle" onclick="alert('최소 달성률을 통과하지 못하였습니다.')"> <img src="<%=request.getContextPath()%>/resources/images/money.png"width="44px"height="44px"></td>
                        
                   		<%} %>
                   
                    </tr>

                    

                </table>
                
                 
            </div>
        </section>

       <button type="button" id="backBtn" class="back_btn">목록으로</button>
    </section>
     
    <script>   

     	//목록으로 버튼 이벤트
     	const backBtn = document.getElementById('backBtn');
     	backBtn.addEventListener('click',function(){
     		location.href='<%=request.getContextPath()%>/confirm/joinchalllist';
     	});
     	//payback 버튼 이벤트
     	 const payback = document.getElementById('payback');
     	payback.addEventListener('click',function(){
     		location.href='<%=request.getContextPath()%>/refund/payback?money='+<%=money%>+'&challTitle='+<%=c.getChallTitle()%>;
     	});

	</script>
	 <%@ include file="../common/footer.jsp"%>
</body>
</html>