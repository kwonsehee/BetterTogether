<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="challenge.model.vo.Challenge"%>
<%
	Challenge c = (Challenge)request.getAttribute("challenge");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증 결과 화면</title>
    <style>
        #join_chall_title{
            border:solid 1px red; 
            font-size: 30px;
            text-align: center;
            margin-top: 30px;
        }
        #join_chall_title2{
            border:solid 1px green; 
            width: 100%;
            height: 10%;


        }
        #confirm_content{
            border:solid 1px blue; 
            width: 100%;
            height: 80%;

        }

        .line{
            float: left;
            width: 100%;
            height: 7px;
            background-color: rgba(255, 96, 100, 0.7);
            margin-bottom: 35px;
        }
        .challenge_box{
            width: 40%;
            height: 80%;
            margin-left: 7%;
            background-color: rgba(196, 196, 196, 0.15);
            float: left;
        }
        .font-large{
            font-family: "Do Hyeon";
            font-size: 50px;
        }
        .result_chall {
        padding-top: 30px;
        margin-top: 30px;
        margin-left: 15px;
        width: 95%;
        height: 95%;
        }
        .result_chall td{

            padding-left: 30px;
            padding-bottom: 20px;
        }
        .circle{
            width: 65px;
            height: 65px;
            margin: 0 0 0 20px;
            padding: 10.4px;
            border-radius: 100%;
            border: #ff6064;
            background-color: #ff6064;
        }
        .chall_subTitle{
            width : 49%;
            text-align: center;
            float: left;
            font-family: "Do Hyeon";
            font-size : 30px;
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
            margin-top : 5%;
            margin-right : 8%;
        }
    </style>
</head>
<body>
 <!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>
 
   <section id="content" class="content_css">

        <p id="join_chall_title">챌린지 정보</p>

        <section id="join_chall_title2">
            <div class="line"></div>
            <div class="chall_subTitle">챌린지 현황</div>
            <div class="chall_subTitle">나의 인증 현황</div>
        </section> 

        <section id="confirm_content">
            <div class='challenge_box'>
                <table class="result_chall"style="border : 1px solid black;">
                    <tr class="">
                        <td><img src="img/영어필사.jpg"width="200px"height="170px"></td>
                        <td><span><%=c.getChallTitle() %></span></td>
                    </tr>
                    <tr>
                        <td><span>총인원</span></td>
                        <td><span>#명</span></td><!-- 참여인원수는 챌린지 현황 디비에서 확인 -->
                    </tr>
                    <tr>
                        <td><span>평균 달성률</span></td>
                        <td><span>#%</span></td>
                    </tr>
                    <tr>
                        <td><span>100%달성</span></td>
                        <td><span>#명</span></td>
                    </tr>
                    <tr>
                        <td><span>85%이상 달성</span></td>
                        <td><span>#명</span></td>
                    </tr>
                    <tr>
                        <td><span>85%미만 달성</span></td>
                        <td><span>#명</span></td>
                    </tr>
                    

                </table>
            </div>
            <div class='challenge_box'>
                <table class="result_chall" style="border : 1px solid black;">
                    <tr class="font-large">
                        <td >달성률</td>
                        <td>###%</td>
                    </tr>
                    <tr>
                        <th><span>인증 갯수</span></th>
                        <th><span>#개</span></th><!-- 챌린지 현황 디비에서  -->
                    </tr>
                    <tr class="">
                        <th><span>상금 받기</span></th>
                        <!-- 최소 달성률 통과 못할시 버튼 비화성화 만들어 놓기 -->
                        <td><button type="submit" class="circle"> <img src="<%=request.getContextPath()%>/resources/images/money.png"width="44px"height="44px"></td>
                    </tr>

                    

                </table>
                
                 
            </div>
            <button type="button" id="backBtn" class="back_btn">목록으로</button>
			
        </section>

       
    </section>
    
    <script>   

     	//목록으로 버튼 이벤트
     	const backBtn = document.getElementById('backBtn');
     	backBtn.addEventListener('click',function(){
     		location.href='<%=request.getContextPath()%>/confirm/joinchalllist';
     	});

	</script>
</body>
</html>