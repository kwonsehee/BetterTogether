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
 <title>Better Together</title>
 <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
   integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
   crossorigin="anonymous"></script>
    <!-- 글씨체  -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">   
    <!-- font-family: 'Nanum Gothic', sans-serif; -->
    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <!-- w3schools 사이드바-->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
    <!-- 스타일  -->
	<link rel="stylesheet" href='<%=request.getContextPath()%>/resources/css/menu_style.css'>
<%if(session.getAttribute("msg") != null){ %>
<script>
   alert('<%=session.getAttribute("msg") %>');
   
</script>
<%
   session.removeAttribute("msg");
    }
%> 
</head>
<body>
   <header id="btHeader">
   		<nav id="btNavi-wrapper">
        	<div class="bt_container">
            	<ul class="bt_navi">
                <!-- 로고 -->
                <div class = "bt_title" id="icon">
                	<a><img id="homeBtn" src="<%=request.getContextPath()%>/resources/images/mainLogo.png"></img></a>
                </div> 
                	<li id="challMargin"><a id="challBtn">challenge</a></li>
                    <li><a id="confirmBtn">confirm</a></li>
                    <li><a id="studyBtn">study cafe</a></li>
                    <li>community</a>
                    	<ul>
                        	<li><a id="boardBtn">자유게시판</a></li>
                            <li><a id="reviewBtn">후기</a></li>
                       	</ul>
                    </li>
                    <li><a>contact</a>
                        <ul>
                            <li><a id="noticeBtn">공지사항</a></li>
                            <li><a id="reportBtn">신고</a></li>
                            <li><a id="qnaBtn">QNA</a></li>
                            <li><a id="faqBtn">FAQ</a></li>
                        </ul>
                    </li>
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
                    
                    <div id="login">
                    <%--2_1. 로그인이 된 상태와 되지 않은 상태를 구분하기 위해 if문으로 조건식을 추가 --%>
      				<%if(loginUser==null){ %>
      					 <a href="#" onclick='window.open("<%= request.getContextPath()%>/views/member/MemberLogin.jsp","_blank","height=500,width=500");return false'>로그인</a>
                         <a> | </a>
                        <button id="memberJoinBtn" type="button" class="login_logout">회원가입</button>
                       
                         <script>
    					// 1. 로그인 버튼 클릭 이벤트 작성
      					<%-- const memberLoginBtn = document.getElementById('memberLoginBtn');
      					memberLoginBtn.addEventListener('click',function(){
         				location.href="<%= request.getContextPath()%>/views/member/MemberLogin.jsp";
       					}); --%>
       					// 1. 회원가입 버튼 클릭 이벤트 작성
      					const memberJoinBtn = document.getElementById('memberJoinBtn');
      					memberJoinBtn.addEventListener('click',function(){
         				location.href="<%= request.getContextPath()%>/views/member/MemberJoin.jsp";
       					});
     				 </script>
     				 <%--2_2.로그인이 성공적으로 되었을 경우 --%>
  				    <%} else{ %> 
  				    
  				    <a><%=loginUser.getNickName() %></a>
  				    <a>종+<%=news.size() %></a>
  				    <button id="logoutBtn" type="button" class="login_logout">로그아웃</button>
                     
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
                     </div>
                        <!-- 사이드바 -->
                        <span id="sidebar_css" style="font-size:25px;cursor:pointer" onclick="openNav()">&#9776;</span>
                    </ul>
                </div>
               </nav>
    </header>

    <!-- 사이드바 메뉴-->
    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <button id="myUpdateBtn" class="mypageMenu1" style="padding-left: 10px;">개인정보수정</button>
        <button id="joinedChallBtn" class="mypageMenu1"style="padding-left: 10px;">참여했던 챌린지그룹</button>
        <button id="challingBtn" class="mypageMenu1"style="padding-left: 10px;">참여중인 챌린지그룹</button>
        <button id="joinbeforeChallBtn" class="mypageMenu1"style="padding-left: 10px;">시작전인 챌린지그룹</button>
        <button id="likeChallBtn" class="mypageMenu1"style="padding-left: 10px;">찜하기한 챌린지그룹</button>
        <button id="myChallBtn" class="mypageMenu1"style="padding-left: 10px;">내가 모집한 챌린지그룹</button>
        <button id="refundBtn" class="mypageMenu1"style="padding-left: 10px;">환급받기</button>
        <button id="myReportBtn" class="mypageMenu1"style="padding-left: 10px;">신고내역</button>
        <button id="pointcharginBtn" class="mypageMenu1"style="padding-left: 10px;">포인트충전</button>
        <button id="administratorPageBtn" class="mypageMenu1"style="padding-left: 10px;">관리자페이지</button>
    </div>

    <!--사이드바 여닫여닫-->
   <script>
        function openNav() {
          document.getElementById("mySidenav").style.width = "250px";
        }
        
        function closeNav() {
          document.getElementById("mySidenav").style.width = "0";
        }
   </script>
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
          
        //10.관리자페이지
          const administratorPageBtn = document.getElementById('administratorPageBtn');
          administratorPageBtn.addEventListener('click',function(){
           $("#admin").attr("action","<%=request.getContextPath()%>/administratorPage");
           $("#admin").submit();
        });   
          
         </script>
		<% } else { %>
		<script>
		 const sidebar_css = document.getElementById('sidebar_css');
		 sidebar_css.addEventListener('click',function(){
			 alert("로그인 후 이용 가능합니다.");
            location.href="<%= request.getContextPath()%>/views/member/MemberLogin.jsp";
         });
		</script>
		<% } %>
   




</body>
</html>