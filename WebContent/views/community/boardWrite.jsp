<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 body {
            width: 1000px;
            height : 1100px;
        }
        /* 연분홍 배경 */
        #con1 {
            width: 1000px;
            height: 90%;
            background: #F9F1F1;
            border-radius: 20px;
            margin : auto;
            margin-top:15px;
        }

        #con1_title h1{
            position: absolute;
            width: 1000px;  
            text-align: center;
            margin-top: 25px;          
        }

        #title {
           margin-top: 50px;
           text-align: center;
           font-family: "Do Hyeon";
           font-size: 24px;
           color : #757575;
        }

        .line {
            border: 3px solid rgba(255, 96, 100, 0.7);
            position: absolute;
            width:994px;
            top:363px;        
        }

        #writebox {
            position: absolute;
            width:1000px;
            height: 500px;
            margin-top: 92px;       
        }
        
        #write_title{
            width:996px;
            height:40px;
            border:0px;
            border-bottom: 1px solid #75757552;
            background: none;
        }
        #write_option {
            width:1000px;
            height:40px;
            border-bottom: 1px solid #75757552;
        }
        #writeArea {
            width: 996px;
            height: 450px;
            border: 0px;
            resize: none;
            background: none;
            border-bottom: 1px solid #75757552;
        }
        .btn {
            width: 130px;
            height: 30px;
            margin:10px;   
            background: #ff60657e;
            border: 0px;
            border-radius: 55px;
            margin-top:650px;         
        }

        .btn a {
            color:white;
            font-family: "Do Hyeon";
            font-size: 16px;
        }

        #submit {
            width:55px;
            color:white;
            font-family: "Do Hyeon";
            margin-top : 20px;
            margin-left : 80%;
        }
        #submit a {
            font-size: 14px;
        }

        #back {
            width:100px;
            font-family: "Do Hyeon";
            background: none;
            border : 2px solid  #ff60657e;        
        }
        #back a {
            font-size: 14px;
            color: #ff60657e;
        }
        
        #write_option label{
        display:inline-block;
        background:#ff60657e;
        border-radius: 55px;
        color:#fff;
        padding:0px 15px;
        line-height:30px;
        cursor:pointer;
        margin-top: 5px;
        margin-left: 5px;
        font-family: "Do Hyeon";
        }

        #write_option label:after{
        content:"파일등록";
        }

        #write_option .file-input{
        display:none;
        }

        #write_option .filename{
        display:inline-block;
        padding-left:10px;
        font-size: 14px;
        color: #757575b7;
        }
	
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	 <section id="con1">
         <!-- 타이틀 -->
         <div id="con1_title">
            <h1 id="title">글쓰기</h1>
        </div>
        <div class="line"></div>

		<form action="<%=request.getContextPath()%>/board/write" method="post">
		
        <!-- 글쓰기 박스 -->
        <div id="writebox">
            <!-- 제목 입력-->
           <input type="text" id ="write_title" placeholder="  글제목을 입력해주세요" name="title">
           <!-- 파일 첨부, 이미지, 동영상 등 -->
           <div id="write_option">
                <label><input type="file" class="file-input"></label>
                <span class="filename">파일을 선택해주세요.</span>
           </div>
           <!-- 글 입력-->
           <textarea id="writeArea"rows="5" name="content"></textarea>
        </div>
        <script>
             $(document).on("change", ".file-input", function(){
                var filename = $(this).val();
                console.log(filename);
                if(filename == "")
                    filename = "파일을 선택해주세요.";
                $(".filename").text(filename);
                })
        </script>

         <!-- 버튼 -->
         <button class="btn" id="back"><a href="<%= request.getContextPath()%>/board/main">뒤로가기</a></button>
         <button class="btn" id="submit"><a>등록</a></button>
   		</form>
    </section>
    
    
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>