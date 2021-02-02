<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="member.model.vo.Member, news.model.vo.News, java.util.ArrayList"%>
<%
   //session 객체에 담긴 loginUser 정보를 변수에 담아두기
   Member loginUser = (Member)session.getAttribute("loginUser");
	//새로운 소식이 있는지 확인
	ArrayList<News> news = new ArrayList<News>();
	if(session.getAttribute("news")!=null){
	news = (ArrayList<News>)session.getAttribute("news");
	System.out.println("commonUi의 news 갯수"+news.size());
	}	
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>공통 ui</title>
<!-- 아이콘  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
   rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<!-- 글씨체 -->
<link
   href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
   crossorigin="anonymous"></script>
   
<!-- 스타일  -->
<link rel="stylesheet" href='<%=request.getContextPath()%>/resources/css/menu_style.css?after'>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"
   integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
   crossorigin="anonymous"></script>

<script>
        function openNav() {
           document.getElementById('mysidenav').style.width = '280px';
        }
        function closeNav() {
           document.getElementById('mysidenav').style.width = '0';
        }
</script>

<%if(session.getAttribute("msg") != null){ %>
<script>
   alert('<%=session.getAttribute("msg") %>');
   
</script>
<%
   session.removeAttribute("msg");
    }
%>
<style>
/* 사이드바 스타일 */
.sidenav {
   height: 100%;
   width: 0;
   position: fixed;
   z-index: 1;
   top: -20%; /*사이드 바 맨위로 올리기*/
   left: 3%; /*메뉴 상단바 안보이게 왼쪽 여백 주기*/
   background-color: #ff6064;
   overflow-x: hidden;
   transition: 0.5s ease-in-out;
   padding-top: 60px;
}

.sidenav button {
   padding: 8px 8px 8px 32px;
   text-decoration: none;
   font-size: 25px;
   color: black;
   display: block;
   transition: 0.2s ease-in-out;
}

.sidenav button:hover, .offcanvas button:focus {
   color: #88a1db;
   cursor : pointer;
}

.closebtn {
   position: absolute;
   top: 0;
   right: 0;
   font-size: 36px !important;
   margin-right: 15px;
   margin-top:5px;
}

.openmenu:hover {
   color: white;
   transition: 0.5s ease-in-out;
   cursor : pointer;
}

.openmenu {
   font-size: 25px;
   cursor: pointer;
   transition: 0.5s ease-in-out;
}

.openmenu>i {
   font-size: 30px;
}
/* 미디어쿼리 적용 */
@media screen and (max-height:450px) {
   .sidenav {
      padding-top: 15px;
   }
   .sidenav button {
      font-size: 18px;
   }
}

#mysidenav {
   
   margin-top: 200px;
}

.mypageMenu1 {
   width : 270px;
   height : 50px;
   border-radius: 20px;
   border: solid 1px #fdc8c6;
   background-color: #fdc8c6;
   font-family: "Do Hyeon";
   font-size: 18px;
   margin-top: 30px;
   margin-left : 5px;
}
</style>
</head>
<body>

   <header>
      <section id="mypage">
            <p class="openmenu" onclick='openNav()'><i class="material-icons fa fa-angle-double-left fa-5" id="menu" aria-hidden="true" style="font-size : 80px">menu</i></p>
            <div id="mysidenav" class="sidenav">
                <a href="#" class="closebtn" onclick='closeNav()'>x</a>
                <button id="myUpdateBtn" class="mypageMenu1" style="padding-left: 10px;">개인정보수정</button>
                <button id="joinedChallBtn" class="mypageMenu1"style="padding-left: 10px;">참여했던 챌린지그룹</button>
                <button id="challingBtn" class="mypageMenu1"style="padding-left: 10px;">참여중인 챌린지그룹</button>
                <button id="joinbeforeChallBtn" class="mypageMenu1"style="padding-left: 10px;">시작전인 챌린지그룹</button>
                <button id="likeChallBtn" class="mypageMenu1"style="padding-left: 10px;">찜하기한 챌린지그룹</button>
                <button id="myChallBtn" class="mypageMenu1"style="padding-left: 10px;">내가 모집한 챌린지그룹</button>
                <button id="refundBtn" class="mypageMenu1"style="padding-left: 10px;">환급받기</button>
                <button id="myReportBtn" class="mypageMenu1"style="padding-left: 10px;">신고내역</button>
                 <button id="pointcharginBtn" class="mypageMenu1"style="padding-left: 10px;">포인트충전</button>
               
            </div>
         </section>
         
         <% if(loginUser != null) { %>
         <script>
         //1.개인정보 수정
         const myUpdateBtn = document.getElementById('myUpdateBtn');
         myUpdateBtn.addEventListener('click',function(){
            location.href="<%= request.getContextPath()%>/views/member/MemberEdit.jsp";
         });
         
         //2.참여했던 챌린지 그룹
           const joinedChallBtn = document.getElementById('joinedChallBtn');
           joinedChallBtn.addEventListener('click',function(){
            location.href="<%= request.getContextPath()%>/joined/list";
         });
         
         //3.찜하기한 챌린지 그룹
          const likeChallBtn = document.getElementById('likeChallBtn');
          likeChallBtn.addEventListener('click',function(){
            location.href="<%= request.getContextPath()%>/like/list";
         });
         
         //4.참여중인 챌린지 그룹
          const challingBtn = document.getElementById('challingBtn');
          challingBtn.addEventListener('click',function(){
            location.href="<%= request.getContextPath()%>/joining/list";
         });
         
         //5.내가 모집한 챌린지 그룹
          const myChallBtn = document.getElementById('myChallBtn');
          myChallBtn.addEventListener('click',function(){
            location.href="<%= request.getContextPath()%>/challMake/list";
         });
         
         //6.신고내역
          const myReportBtn = document.getElementById('myReportBtn');
          myReportBtn.addEventListener('click',function(){
            location.href="<%= request.getContextPath()%>/myPage/reported";
         });
          
         //7.환급받기
          const refundBtn = document.getElementById('refundBtn');
          refundBtn.addEventListener('click',function(){
            location.href="<%= request.getContextPath()%>/views/myPage/refundForm.jsp";
         });
          
          //8.포인트 충전하기
          const pointcharginBtn = document.getElementById('pointcharginBtn');
          pointcharginBtn.addEventListener('click',function(){
            location.href="<%= request.getContextPath()%>/views/myPage/PointCharging.jsp";
         });
         
        //9.참여중인 챌린지 그룹
          const joinbeforeChallBtn = document.getElementById('joinbeforeChallBtn');
          joinbeforeChallBtn.addEventListener('click',function(){
            location.href="<%= request.getContextPath()%>/before/list";
         });
          
          
          
         </script>
		<% } else { %>
		<script>
		 const menu = document.getElementById('menu');
		 menu.addEventListener('click',function(){
			 alert("로그인 후 이용 가능합니다.");
            location.href="<%= request.getContextPath()%>/views/member/MemberLogin.jsp";
         });
		</script>
		<% } %>
      <section id="logo_block">

          <img src="<%=request.getContextPath()%>/resources/images/logo.png"
            width="250px" height="170px" id="homeBtn">

      </section>
      <section id="login_block">
      <%--2_1. 로그인이 된 상태와 되지 않은 상태를 구분하기 위해 if문으로 조건식을 추가 --%>
      <%if(loginUser==null){ %>
         <table>
            <tr>
               <td>
                  <p style="text-align: center">
                     <button id="memberLoginBtn" type="button" class="login_logout">로그인/회원가입</button>
                  </p>
               </td>
               <td>
                  <i class="material-icons icon_css">check_box</i> 
                  <span>참여 챌린지 수 : 0개</span>
               </td>
            </tr>
            <tr>
               <td>
                  <i class="material-icons icon_css">mood</i>
                  <span>비회원</span>
               </td>
               <td>
                  <i class="material-icons icon_css">insert_chart</i>
                   <span>총 챌린지 수 : 132개</span>
                </td>
            </tr>
         </table>
      
      <script>
      // 1. 로그인/회원가입 버튼 클릭 이벤트 작성
        const memberJoinBtn = document.getElementById('memberLoginBtn');
           memberJoinBtn.addEventListener('click',function(){
              location.href="<%= request.getContextPath()%>/views/member/MemberLogin.jsp";
           });
      
      </script>
      <%--2_2.로그인이 성공적으로 되었을 경우 --%>
      <%} else{ %>
         <table>
            <tr>
               <td>
                  <p style="text-align: center">
                     <button id="logoutBtn" type="button" class="login_logout">로그아웃</button>
                     
                  </p>
               </td>
               <td>
                  <i class="material-icons icon_css">check_box</i> 
                  <span>참여 챌린지 수 : 개</span>
                  <!--여기도 디비에서 참여 챌린지 갯수 가져와야함 -->
               </td>
            </tr>
            <tr>
               <td>
                  <i class="material-icons icon_css">mood</i>
                  <span><%=loginUser.getNickName() %>님<a id="newNews">+<%=news.size() %></a></span>
               </td>
               <td>
                  <i class="material-icons icon_css">insert_chart</i>
                   <span>총 챌린지 수 : 132개</span>
                </td>
            </tr>
         </table>
         <script>
            //2_3. logout 이벤트
            const logoutBtn = document.getElementById('logoutBtn');
            logoutBtn.addEventListener('click',function(){
               location.href='<%=request.getContextPath()%>/member/logout';
            });
          //새로운 소식 보기
            const newNews = document.getElementById('newNews');
            newNews.addEventListener('click',function(){
              	if(<%=news.size() %>>0){
              		window.open("<%=request.getContextPath()%>/views/common/alertNews.jsp","새로운 알림","width=500, height=400");
              	}
            });
         </script>
         <%} %>
      </section>


   </header>


   <nav class="nav_css">
      <ul id="navi">
         <li><button class="nav_btn">

               <a id="challBtn">챌린지모집</a>

            </button></li>
         <li><button class="nav_btn">
               <a id="confirmBtn">나의 챌린지 인증</a>
            </button></li>
         <li><button class="nav_btn">
               <a id="studyBtn">스터디카페 예약</a>
            </button></li>
         <li><button class="nav_btn">
               <a id="commuBtn">커뮤니티</a>
            </button>
            <ul>
               <li><button class="nav_btn">
                     <a id="boardBtn">자유게시판</a>
                  </button></li>
               <li><button class="nav_btn">
                     <a id="reviewBtn">후기</a>
                  </button></li>
            </ul></li>
         <li><button class="nav_btn">
               <a>고객센터</a>
            </button>
            <ul>
               <li><button class="nav_btn">
                     <a id="noticeBtn">공지사항</a>
                  </button></li>
               <li><button class="nav_btn">
                     <a id="reportBtn">신고</a>
                  </button></li>
               <li><button class="nav_btn">
                     <a id="qnaBtn">Q&A</a>
                  </button></li>
               <li><button class="nav_btn">
                     <a id="faqBtn">FAQ</a>
                  </button></li>
            </ul></li>
      </ul>
   </nav>
   <script>

   
   const challBtn = document.getElementById("challBtn");
	challBtn.addEventListener('click',function(){
	      location.href="<%= request.getContextPath()%>/chall/list";
	   });

   //home버튼
   const homeBtn = document.getElementById("homeBtn");
   homeBtn.addEventListener('click',function(){
      location.href="<%= request.getContextPath()%>";
   });
   
   //공지사항버튼
   const noticeBtn = document.getElementById("noticeBtn");
   noticeBtn.addEventListener('click',function(){
      location.href="<%= request.getContextPath()%>/notice/list";
   });
   
 	//나의 챌린지 인증하기 버튼
	const confirmBtn = document.getElementById("confirmBtn");
	confirmBtn.addEventListener('click',function(){
		location.href="<%= request.getContextPath()%>/confirm/joinchalllist";
	});
	
   // qna버튼
   const qnaBtn = document.getElementById("qnaBtn");
   qnaBtn.addEventListener('click',function(){
      location.href="<%= request.getContextPath()%>/qna/list";
   });
   
	// 커뮤니티버튼
	const commuBtn = document.getElementById("commuBtn");
	commuBtn.addEventListener('click',function(){
		location.href="<%= request.getContextPath()%>/commu/main";
	 });
	  
	 // 자유게시판버튼
	const boardBtn = document.getElementById("boardBtn");
	boardBtn.addEventListener('click',function(){
		location.href="<%= request.getContextPath()%>/board/main";
	});
	
	// 후기버튼
	const reviewBtn = document.getElementById("reviewBtn");
	reviewBtn.addEventListener('click',function(){
		location.href="<%= request.getContextPath()%>/review/main";
	});



	//스터디카페버튼
	const studyBtn = document.getElementById("studyBtn");
	studyBtn.addEventListener('click',function(){
		location.href="<%= request.getContextPath()%>/cafe/list";
	});
	
	// 신고버튼
	   const reportBtn = document.getElementById("reportBtn");
	   reportBtn.addEventListener('click',function(){
	      location.href="<%= request.getContextPath()%>/report/list";
	   });
	   
	 //faq버튼
		const faqBtn = document.getElementById("faqBtn");
		faqBtn.addEventListener('click',function(){
			location.href="<%= request.getContextPath()%>/faq/list";
		});
	
	</script>



</body>
</html>