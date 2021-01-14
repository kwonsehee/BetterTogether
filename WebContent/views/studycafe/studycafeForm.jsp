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
        
        .studycafe_title{
            font-family: Do Hyeon;
            font-style: normal;
            font-weight: normal;
            font-size: 18px;
            line-height: 22px;  
            position: absolute; 
            left: 18%;
            right: 72.54%;
            margin-top: 15px; 
            
        }

        .studycafe_title2{
            position: absolute;
            left: 47.27%;
            right: 22.16%; 
            margin-top: 150px; 

            font-family: Do Hyeon;
            font-style: normal;
            font-weight: normal;
            font-size: 18px;
            line-height: 22px; 

        }
     
        #title{
            position: absolute;
            left: 35.96%;
            right: 36.35%;
            top: 7.33%;
            bottom: 85.06%;

            font-family: Do Hyeon;
            font-style: normal;
            font-weight: normal;
            font-size: 36px;
            line-height: 45px;

         
        }
        .input_area input{
            position: absolute;
            left: 27%;
            right: 55.38%;
            margin-top: 150px; 

            background: #FFFFFF;
            border-radius: 5px; 
        }

        textarea {
            position: absolute;
            width : 350px;
		    height : 150px; 
            background: #FFFFFF;
            border-radius: 5px;
	        }

            .btnArea {
		text-align:center;
		padding : 50px;
        bottom: 0;
        
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
	 <!--  스터디카페등록ㅇㅇ -->
	 <section id="content" class="content_css">
       
        <div id ="main">

            <div class="outer">
                <div class="tableArea">
                    <h1 id="title">스터디카페 등록</h1>
                    <form>
                        <h4 class="studycafe_title"   style=" bottom: 65%;">카페이름</h4>
                        <span class="input_area">
                            <input type="text" name="cafe_name" maxlength="30" required style="margin-top: 15%; ">
                        </span>
                        
                        <h4 class="studycafe_title"   style=" bottom: 57%;" >운영시간</h4>
                        <span class="input_area">
                            <input type="text" name="cafe_open" required style="margin-top: 20%; ">
                        </span>
                        
                        <h4 class="studycafe_title"   style=" bottom: 49%;" >지역</h4>
                        <span class="input_area">
                            <input type="text" name="cafe_area" required style="margin-top: 25%;" >
                        </span>

                        <h4 class="studycafe_title"   style=" bottom: 41%;" >전화번호</h4>
                        <span class="input_area">
                            <input type="text" name="cafe_phone" required style="margin-top: 30%;">
                        </span>

                        <h4 class="studycafe_title"   style=" bottom: 33%;" >휴무일</h4>
                        <span class="input_area">
                            <input type="text" name="cafe_day" required style="margin-top: 35%;">
                        </span>

                        <h4 class="studycafe_title"   style=" bottom: 25%;">예약가능인원</h4>
                        <span class="input_area">
                            <input type="text" name="cafe_one" required style="margin-top: 40%;">
                        </span>

                        <h4 class="studycafe_title"   style=" bottom: 17%;">카페홈페이지</h4>
                        <span class="input_area">
                            <input type="text" name="cafe_page" required required style="margin-top: 45%;">
                        </span>
 

                        <h4 class="studycafe_title2">카페소개글</h4>
                        <textarea name="content" style="resize:none;margin-left: 0px;left: 550px;top: 170px;"  required > </textarea>
                
                        <h4 class="studycafe_title2" style="margin-top: 31%;">카페공지글</h4>
				        <textarea name="content" style="resize:none;left: 550px;top: 330px;" required> </textarea>
                         
                         
                         <h4 class="studycafe_title2" style="margin-top: 48%;">카페이미지</h4>
                        <td><input type="file"  value="CAFE_PHOTO" name="file" style="
                            margin-left: 550px;
                            border-left-width: 50px;
                            padding-left: 0px;
                            margin-top: 480px;
                        "></td>
                        
                  
                        <div class="btnArea" >
                            <button type="button" onclick="javascript:history.back();">취소</button>
                            <button type="submit"  style="  margin-top: 70px;">등록</button>
                        </div>
                   
                    </form>
                </div>
            </div>
        
         </div>
    </section>
		 

</body>
</html>