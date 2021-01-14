<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

		 #main{
            position: absolute;
            padding-top: 20px;
            width: 1000px;
            height: 600px; 
            margin-top: 5px;

            background-color:  #f9f1f1;
            border-radius: 20px;
          }  
         #serch{
            position: absolute;
            
            left: 55%;
            right: 15%;
            top: 6.94%;
            bottom: 88.47%;
            width: 260px;
            height: 28px;
            background: #FFFFFF;
            border: 2px solid #FF6064;
            box-sizing: border-box;
         }
         ul{
       		  list-style:none;
       		 }
       	 input.img-button {
       
            position: absolute;
            width: 22px;
            height: 22px; 
            background : url('<%= request.getContextPath() %>/resources/images/돋보기.jpg');
            margin-left: 785px;
            margin-top:7px;
         }

         #area{
            position: absolute;
            left: 7%;
            right: 78.16%;
            top: 7.1%;
            bottom: 88.31%;
            width: 90px;
            height: 25px;

             background: #FEFDFD;
             border: 2px solid #FF6064;
             box-sizing: border-box;
         }
        

         #personnel{
            position: absolute;
            left: 17%;
            right: 65.95%;
            top: 7.17%;
            bottom: 88.47%;
            width: 80px;
            height: 25px;
            background: #FDFDFD;
            border: 2px solid #FF6064;
            box-sizing: border-box;
         }

        #line1{
            position: absolute;
            left:  3%;
            right: 3.63%;
            top: 14.67%;
            bottom: 85.33%;

            border: 1px solid #FF6064;
        }
      	  #line2{
            position: absolute;
            left: 3%;
            right: 3.63%;
            top: 57.56%;
            bottom: 42.44%;

            border: 1px solid #FF6064;
        } 

        a{
            color: black;
            text-decoration: none;
            
        } 
        #bt1{
            position: absolute;
            left:26%;
            right: 65.95%;
            top: 7.17%;
            bottom: 88.47%;
            width: 50px;
            height: 25px;
            background: #FDFDFD;
            border: 2px solid ;

        }

        .cafe :hover{
            color : #88a1db;
        }

        .cafe2 :hover{
            color : #88a1db;
        }

        

        /* 제휴카페 이미지 및 정보 */
        .cafe>div{ 
            background: #FFFCFC;
            border: 2px solid #ECE6E6;
            box-sizing: border-box;
            position: absolute;
            top: 24.08%;
            bottom: 48.94%;  
            border: 1px solid #FF6064;
            text-align: center; 
        }
      
         /*카페 위치설정*/
         #a  {  
          
          left: 6.86%;
          right: 76.37%;
         }
        #b{ 
          left: 30.34%;
          right: 52.93%;
         }
        #c{
          left: 52.89%;
          right: 30.26%;
          }

        #d{
          left: 76.13%;
          right: 7.08%; 
         }

        .cafe2>div{ 
            font-family: "Do Hyeon";
            background: #FFFCFC;
            border: 2px solid #ECE6E6;
            box-sizing: border-box;
            position: absolute;
            top: 64.11%;
            bottom: 9%;
            border: 1px solid #FF6064;
            text-align: center;
        } 

        /*카페이미지 크기*/   
       
        #cafeimg{
            width:166px;
            height:120px;
        } 

		#studycafe{
			position: absolute;
			left: 90.72%;
			right: 2.09%;
			top: 94.4%;
			bottom: 0.72%;

			background: #FF6064;
			border-radius: 5px;
		}
</style>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>스터디카페</title>

</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	 <!--  스터디카페ㅇㅇ -->
	
	
	
	
	
	
	 <section id="content" class="content_css">
        <div id ="main">
            
          
              
           
            <ul class="area"id="area1">
           	 <from>
                <select id="area" name = "city1"> 지역
                    <optgroup label = "서초구">
                        <option value = "songpa-gu">방배</option>
                        <option value = "gangnam-gu">반포</option>
                        <option value = "seocho-gu">서초</option>
                        <option value = "junggu-gu">잠원</option>
                    </optgroup>
    
                     <optgroup label = "강남구">
                        <option value = "seongnam-si">역삼</option>
                        <option value = "suwon-si">논현</option>
                        <option value = "yongin-si">압구정</option>
                        <option value = "anyang-si">신사</option>
                    </optgroup>      
                    
                    <optgroup label = "송파구">
                        <option value = "songpa-gu">장지</option>
                        <option value = "gangnam-gu">송파</option>
                        <option value = "seocho-gu">문정</option>
                        <option value = "junggu-gu">석촌</option>
                    </optgroup>
    
                    <optgroup label = " 관악구">
                        <option value = "songpa-gu">해운대구</option>
                        <option value = "gangnam-gu">동래구</option>
                        <option value = "seocho-gu">서구</option>
                        <option value = "junggu-gu">중구</option>
                    </optgroup>
    
                    <optgroup label = "동작구">
                        <option value = "songpa-gu">사당</option>
                        <option value = "gangnam-gu">흑성동</option>
                        <option value = "seocho-gu">대방동</option>
                        <option value = "junggu-gu">신대바</option>
                    </optgroup>
                    
                       <optgroup label = "노원구">
                        <option value = "songpa-gu">수성구</option>
                        <option value = "gangnam-gu">남구</option>
                        <option value = "seocho-gu">북구</option>
                        <option value = "junggu-gu">중구</option>
                    </optgroup>
                </select>
    
    
                
                
                <select id="personnel" name = "인원">  
                   
                    <option value = "songpa-gu">1명</option>
                    <option value = "gangnam-gu">2명</option>
                    <option value = "seocho-gu">3명</option>
                    <option value = "junggu-gu">4명</option>
                    <option value = "seocho-gu">5명</option>
                    <option value = "junggu-gu">6명</option>
               
            	 </select>
                <input id="bt1" type="button" value="적용">
                </p>
            </ul> 
             </from>
            <hr id="line1">
            
     
            <div class="cafe" style="font-size : 10px" >  
                <div id="a">   
                    <img id='cafeimg' SRC="크기변환_1.jpg" align="bottom"> 
                    <a href="스터디카페정보.html"> 제휴카페1<br>
                    [<% %>]
                    </a>
                   
                </div>
                <div id="b">   
                    <img id='cafeimg' SRC="크기변환_1.jpg" align="bottom"> 
                    <a href="스터디카페정보.html"> 제휴카페2<br>
                      [<% %>]
                        </a>
                </div> 
                <div id="c">   
                    <img id='cafeimg' SRC="크기변환_1.jpg" align="bottom"> 
                    <a href="스터디카페정보.html" >  제휴카페3<br>
                      [<% %>]
                        </a>
                </div> 
                <div id="d">   
                    <img id='cafeimg' SRC="크기변환_1.jpg" align="bottom"> 
                    <a href="스터디카페정보.html"> 제휴카페4<br>
                       [<% %>]
                        </a>
                </div>  
            </div>   
    
        <hr id="line2">
        
             <div class="cafe2" style="font-size : 9px" > 
                <div id="a">   
                    <img id='cafeimg' SRC="크기변환_1.jpg" align="bottom"> 
                    <a href="스터디카페정보.html"> 검색카페1<br>
                        [<% %>]</a>
                </div>
                <div id="b">   
                    <img id='cafeimg' SRC="크기변환_1.jpg" align="bottom"> 
                    <a href="스터디카페정보.html"> 검색카페2<br>
                        [<% %>] </a>
                </div> 
                <div id="c">   
                    <img id='cafeimg' SRC="크기변환_1.jpg" align="bottom"> 
                    <a href="스터디카페정보.html"> 검색카페3<br>
                       [<% %>] </a>
                </div> 
                <div id="d">   
                    <img id='cafeimg' SRC="크기변환_1.jpg" align="bottom"> 
                    <a href="스터디카페정보.html"> 검색카페4<br>
                       [<% %>] </a>
                </div>  

                
            </div>
            
            
           	<div class="searchArea">
			 <form>
					
			
				<input type="text" id="serch" placeholder="카페명을 검색하세요!"><input  type="submit" class="img-button" value=""></button>
				<% if(loginUser != null && loginUser.getUserId().equals("admin")) { %>
            
           		<button id="studycafe" type="button" >작성하기</button>
            
           			 <script>
						const noticeInsert = document.getElementById('studycafe');
						studycafe.addEventListener('click', function(){
						location.href='<%= request.getContextPath() %>/views/studycafe/studycafeForm.jsp';
						});
				</script>
				<% } %>
      		</form>
         	 </div>
        </div> 
       
    </section> 

</body>
</html>