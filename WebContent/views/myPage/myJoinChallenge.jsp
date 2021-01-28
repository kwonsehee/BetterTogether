<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, challenge.model.vo.*, common.model.vo.*"%>
<%
   // 내가 모집한 챌린지 조회
   ArrayList<Challenge> list = (ArrayList<Challenge>)request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 모집한 챌린지 그룹</title>
<style>
   #myJoinChallForm{
        width: 950px;
      height: 800px;
      /* border: 1px solid black; */
      margin-top: -6%;
      padding-left: 5%;
       background-color: #f9f1f1;
       border-radius: 20px;
        } 
    
    #title{
            margin-top: 70px;
            font-family: "Do Hyeon";
            font-size: 36px;
            margin-left: 300px;
        }

    .mychallContent {
        background-color: white;
        width: 900px;
        height: 125px;
        text-align: center;
        font-family: "Do Hyeon";
        font-size: 24px;
        border-radius: 20px;
        margin:7px;
    }

    #updateBtn{
        border: 1px solid #fdc8c6;
        background-color: #fdc8c6;
        border-radius: 20px;
        font-family: "Do Hyeon";
        font-size: 18px;
        margin-left: 360px;
    }

    #deleteBtn{
        border: 1px solid #fdc8c6;
        background-color: #fdc8c6;
        border-radius: 20px;
        font-family: "Do Hyeon";
        font-size: 18px;
    }
   
    #goMainBtn{
            border: 1px solid #fdc8c6;
            background-color: #fdc8c6;
            border-radius: 20px;
            font-family: "Do Hyeon";
            font-size: 18px;
            margin-left : 2px;
            margin-top : 100px;
        }  
        
      .img-size{
         width: 150px;
         height: 100px;
      }
      
      #table-wrap{
         padding:50px;
         margin:30px;
      }
      
      input[type="checkbox"]{
         padding-top:-20px;
      }
      
      .challInfo{
      font-family: "Do Hyeon";
      width: 80px;
      height: 30px;
      border-radius: 20px;
      border: solid 1px #fdc8c6;
      background-color: white;
      font-size: 20px;
   }
   
   #tableDIv{
      width:20px;
      height:20px;
      border: solid 1px red;
   }
      
 
</style>
</head>
<body>
   <%@ include file="../common/common_ui.jsp" %>
      <section id="content-1">
       <h1 id="title">내가 모집한 챌린지그룹</h1>
      <table id="table-wrap">
      <%if(list.isEmpty()) {%>
      <tr><td colspan="4">내가 모집한 챌린지가 없습니다.</td>
      <% } else {%>
      <% for(Challenge ch : list) {%>
            <tr>
               <td>
                  <input type="hidden" name="challNo" value="<%= ch.getChallNo() %>">
               </td>
               <td>
                  <input type="checkbox" id="check" name="challNo" value="<%=ch.getChallNo() %>" onclick="doOpenCheck(this);">
                  <img src="<%= request.getContextPath()%>/resources/uploadFiles/<%= ch.getChallFile()%>" style="width: 150px;height: 100px;" class="img-size">
               </td>
               <td>
                  <span><%=ch.getChallTitle() %></span>
                  <p><button class="challInfo"><%=ch.getChallFrequency() %></button> <button class="challInfo"><%=ch.getChallPeriod() %></button></p>
               </td>
            </tr>
          <% } %>
          <% } %>
        </table>
        </section> 
         <button type="button" id="updateBtn">수정</button>
         <button type="button" id="deleteBtn">삭제</button>
        <button id="goMainBtn" type="button" class="text_font joinform_btn">메인으로</button>
        
      <script>
    //1.메인으로 돌아가기
   const goMainBtn = document.getElementById('goMainBtn');
   goMainBtn.addEventListener('click',function(){
      location.href='<%=request.getContextPath()%>';
   });
   
      </script>
      
        
    <script>
    // 체크박스 하나만 선택되게 하기 // 체크한 체크박스의 val 가져와서 updateForm으로 그 번호 보내기
    let result = '';
   function doOpenCheck(chk){
       var obj = document.getElementsByName("challNo");
       for(var i=0; i<obj.length; i++){
           if(obj[i] != chk){
               obj[i].checked = false;
           }
       }
       
       // 선택된 목록 가져오기
       const query = 'input[name="challNo"]:checked';
       const selectedEls = 
           document.querySelectorAll(query);
       
       // 선택된 목록에서 value 찾기
       selectedEls.forEach((el) => {
         result = el.value + ' ';
       });
       
       // 출력
         console.log(result);
   }
    
       // 수정하기 버튼 이벤트
       const updateBtn = document.getElementById('updateBtn');
       updateBtn.addEventListener('click',function(){
          location.href="<%= request.getContextPath()%>/join/update?challNo="+result;
       });
       
       //삭제하기 버튼 이벤트
       const deleteBtn = document.getElementById('deleteBtn');
       deleteBtn.addEventListener('click',function(){
          location.href="<%= request.getContextPath()%>/join/delete?challNo="+result;
       });
       
    </script>    
            
</body>
</html>