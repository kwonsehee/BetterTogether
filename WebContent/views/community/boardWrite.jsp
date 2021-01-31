<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- include libraries(jQuery) -->
<!-- <script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> -->
<!-- include summernote css/js-->
<!--  <link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet"> -->

<title>Insert title here</title>
<style>
	 body {
            width: 1000px;
            height : 1100px;
        }
        /* 연분홍 배경 */
         #con1 {
            width: 1000px;
            height: 1050px;
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
        .write_option {
            width:1000px;
            height:40px;
            /* border-bottom: 1px solid #75757552; */
        }
        #writeArea {
            width: 996px;
            height: 500px;
            border: 0px;
            resize: none;
            background: none;
            border-top: 1px solid #75757552;
            border-bottom: 1px solid #75757552;
        }
        .btn {
            width: 130px;
            height: 30px;
            margin:10px;   
            background: #ff60657e;
            border: 0px;
            border-radius: 55px;
            margin-top:1000px;         
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
            font-size: 14px;
            color: #ff60657e;      
        }
        
        /* 파일 첨부 영역 */
        .write_option label{
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

        .write_option label:after{
        content:"파일등록";
        }

        .write_option .file-input1{display:none;}
        .write_option .file-input2{display:none;}
        .write_option .file-input3{display:none;}
        .write_option .file-input4{display:none;}
        .write_option .file-input5{display:none;}
        .write_option .file-input6{display:none;}
        
        .write_option .filename1{display:inline-block;padding-left:10px;font-size: 14px;color: #757575b7;}
        .write_option .filename2{display:inline-block;padding-left:10px;font-size: 14px;color: #757575b7;}
        .write_option .filename3{display:inline-block;padding-left:10px;font-size: 14px;color: #757575b7;}
        .write_option .filename4{display:inline-block;padding-left:10px;font-size: 14px;color: #757575b7;}
        .write_option .filename5{display:inline-block;padding-left:10px;font-size: 14px;color: #757575b7;}
        .write_option .filename6{display:inline-block;padding-left:10px;font-size: 14px;color: #757575b7;}
        
        /* 파일첨부 미리보기 영역 */
        .imgViewArea {
        width:100%;
        height:100px;
        display :inline-block;
        text-align:center;
        }
        
        #img1 {
        	width:150px;
        	height:90px;
        	margin-top:5px;
        	margin-left:11px;
        }
	
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	
	 <section id="con1">
         <!-- 타이틀 -->
		<div id="con1_title">
			<h1 id="title">글쓰기</h1>
		</div>
		<div class="line"></div>

		<form method="post">
			<textarea id="summernote" name="editordata"></textarea>
		</form>

		<script>
		$(document).ready(function() { 
			$('#summernote').summernote(); 
		});

			$(document).ready(function() {
				//여기 아래 부분
				$('#summernote').summernote({
					height : 300, // 에디터 높이
					minHeight : null, // 최소 높이
					maxHeight : null, // 최대 높이
					focus : true, // 에디터 로딩후 포커스를 맞출지 여부
					lang : "ko-KR", // 한글 설정
					placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정

				});
			});
		</script>


		<!-- 버튼 -->
         <button type="button" class="btn" id="back" onclick="javascript:history.back();">뒤로가기</button>
         <button class="btn" id="submit"><a>등록</a></button>
   		</form>
    </section>
    
   
    
    

</body>
</html>