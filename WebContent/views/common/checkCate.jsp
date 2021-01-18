<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심있는 카테고리 선택하기</title>
    <style>
  /* content 부분 */
  #content-1{
            /* border:solid 1px red;  */
            width: 100%;
            height: 10%;
            float: left;
        }

        #content-1 p{
            /* border:solid 1px red;  */
            font-size: 30px;
            text-align: center;
            margin-top: 18px;
        }

        #content-2{
            /* border:solid 1px blue;  */
            width: 100%;
            height: 70%;
            float: left;


        }

        #content-3{
            /* border:solid 3px lightgreen;  */
            width: 100%;
            height: 20%;
            float: left;
            

        }
        #ok{
            width: 150px;
            height: 50px;
            margin-left: 40%;
            margin-top: 1%;
            font-family: "Do Hyeon";
            font-size: 20px;
            border-radius: 20px;
            border: 1px solid #fdc8c6;
            background-color: #fdc8c6;
      
        }
        .category{ 
            width: 80%;
            height: 70%;
            margin-top: 5%;
            margin-left: 10%;
            text-align: center;
            border: 1px solid black; 
            padding-top: 5%;
        }
        .img_size{
            width: 144px;
            height: 144px;
        }
 
        input[type=checkbox] { 
            display:none; 
        }

        #체중관리 + label span{ 
            display: inline-block; 
            cursor: pointer;
            width: 134px;
            height: 134px;
            background-size: 100%;
            background-repeat: no-repeat;
            background-position: center;
            background-image: url("<%=request.getContextPath()%>/resources/images/체중계.png");
            padding-bottom: 50px;
            }
        #운동 + label span{ 
            display: inline-block; 
            cursor: pointer;
            width: 134px;
            height: 144px;
            background-size: 100%;
            background-repeat: no-repeat;
            background-position: center;
            background-image: url("<%=request.getContextPath()%>/resources/images/운동.png");
            padding-bottom: 50px;
            }
        #자격증 + label span{ 
            display: inline-block; 
            cursor: pointer;
            width: 134px;
            height: 144px;
            background-size: 100%;
            background-repeat: no-repeat;
            background-position: center;
            background-image: url("<%=request.getContextPath()%>/resources/images/자격증.png");
            padding-bottom: 50px;
            }
        #돈관리 + label span{ 
            display: inline-block; 
            cursor: pointer;
            width: 144px;
            height: 144px;
            background-size: 100%;
            background-repeat: no-repeat;
            background-position: center;
            background-image: url("<%=request.getContextPath()%>/resources/images/돈관리.png");
            padding-bottom: 50px;
            }
        #생활습관 + label span{ 
            display: inline-block; 
            cursor: pointer;
            width: 124px;
            height: 134px;
            background-size: 100%;
            background-repeat: no-repeat;
            background-position: center;
            background-image: url("<%=request.getContextPath()%>/resources/images/생활습관.png");
            padding-bottom: 50px;
            }
        #공부 + label span{ 
            display: inline-block; 
            cursor: pointer;
            width: 114px;
            height: 134px;
            background-size: 100%;
            background-repeat: no-repeat;
            background-position: center;
            background-image: url("<%=request.getContextPath()%>/resources/images/공부.png");
            padding-bottom: 50px;
            padding-left: 10px;
            margin-left: 10px;
            }
        #업무스킬 + label span{ 
            display: inline-block; 
            cursor: pointer;
            width: 114px;
            height: 124px;
            background-size: 100%;
            background-repeat: no-repeat;
            background-position: center;
            background-image: url("<%=request.getContextPath()%>/resources/images/업무스킬.png");
            padding-bottom: 50px;
            }
        #외국어 + label span{ 
            display: inline-block; 
            cursor: pointer;
            width: 114px;
            height: 114px;
            background-size: 100%;
            background-repeat: no-repeat;
            background-position: center;
            background-image:  url("<%=request.getContextPath()%>/resources/images/외국어.png");
            padding-bottom: 50px;
            margin-left: 20px;
            }

        #체중관리:checked + label span{ 
            opacity: 0.8;
            background-image: url("<%=request.getContextPath()%>/resources/images/check1.png"),url("<%=request.getContextPath()%>/resources/images/체중계.png");
        }
        #운동:checked + label span{
            opacity: 0.8; 
            background-image: url("<%=request.getContextPath()%>/resources/images/check1.png"),url("<%=request.getContextPath()%>/resources/images/운동.png"); 
        }
        #자격증:checked + label span{ 
            opacity: 0.8;
            background-image: url("<%=request.getContextPath()%>/resources/images/check1.png"),url("<%=request.getContextPath()%>/resources/images/자격증.png"); 
        }
        #돈관리:checked + label span{ 
            opacity: 0.8;
            background-image: url("<%=request.getContextPath()%>/resources/images/check1.png"),url("<%=request.getContextPath()%>/resources/images/돈관리.png"); 
        }
        #생활습관:checked + label span{ 
            opacity: 0.8;
            background-image: url("<%=request.getContextPath()%>/resources/images/check1.png"),url("<%=request.getContextPath()%>/resources/images/생활습관.png"); 
        }
        #공부:checked + label span{ 
            opacity: 0.8;
            background-image: url("<%=request.getContextPath()%>/resources/images/check1.png"),url("<%=request.getContextPath()%>/resources/images/공부.png"); 
        }
        #업무스킬:checked + label span{
            opacity: 0.8; 
            background-image: url("<%=request.getContextPath()%>/resources/images/check1.png"),url("<%=request.getContextPath()%>/resources/images/업무스킬.png"); 
        }
        #외국어:checked + label span{ 
            opacity: 0.8;
            background-image: url("<%=request.getContextPath()%>/resources/images/check1.png"),url("<%=request.getContextPath()%>/resources/images/외국어.png"); 
        }
        
    </style>
</head>
<body>
<%@ include file="../common/common_ui.jsp" %>
	 <section id="content" class="content_css">

        <section id="content-1">
            <p>관심있는 카테고리를 선택하세요.</p>
        </section> 

        <section id="content-2">
            <!-- 카테고리 8개 -->
            <form action="<%=request.getContextPath() %>/member/cateinput" method="POST">
            <div class='category'>
      
                <input type="checkbox" id="체중관리" value="10" name="cate" class="check_box" onclick="oneCheckbox(this)" ><label for="체중관리"><span>체중관리</span></label>
                <input type="checkbox" id="운동" value="20" name="cate"class="check_box"onclick="oneCheckbox(this)" ><label for="운동"><span>운동</span></label>
                <input type="checkbox" id="자격증" value="30"name="cate"class="check_box"onclick="oneCheckbox(this)"><label for="자격증"><span>자격증</span></label>
                <input type="checkbox" id="돈관리" value="40"name="cate"class="check_box"onclick="oneCheckbox(this)"><label for="돈관리"><span>돈관리</span></label>
                <br><br><br>
                <input type="checkbox" id="생활습관" value="50"name="cate"class="check_box"onclick="oneCheckbox(this)"><label for="생활습관"><span>생활습관</span></label>
                <input type="checkbox" id="공부" value="60"name="cate"lass="check_box"onclick="oneCheckbox(this)"><label for="공부"><span>공부</span></label>
                <input type="checkbox" id="업무스킬" value="70"name="cate"class="check_box"onclick="oneCheckbox(this)"><label for="업무스킬"><span>업무스킬</span></label>
                <input type="checkbox" id="외국어" value="80"name="cate"class="check_box"onclick="oneCheckbox(this)"><label for="외국어"><span>외국어</span></label>
        
              
            </div>
        </section>

        <section id="content-3">
            <!-- 완료 버튼 -->
            <input type="submit"id="ok"value="완료"/>
        </form>
        </section>
    </section>

    <script type="text/javascript">
        function oneCheckbox(a){
            var obj = document.getElementsByName("checkbox1");
            for(var i=0; i<obj.length; i++){
                if(obj[i] != a){
                    obj[i].checked = false;
                }
            }
        }
    </script>
</body>
</html>