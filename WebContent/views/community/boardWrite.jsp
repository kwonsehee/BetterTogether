<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/summernote/summernote-ko-KR.js"></script>

<title>Insert title here</title>
<style>
#btSection{
			padding-bottom:100px;
		}

        #con1_title h1{
            text-align: center;
            margin-top: 25px;          
        }

        .h1_title {
           margin-top: 50px;
           text-align: center;
           font-size: 24px;
           color : #757575;
        }
        

        .line {
           border: 0.5px solid #937cf790;
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
<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>

	<section id="btSection">
		<!-- 타이틀 -->
		<div id="con1_title">
			<h1 class="h1_title">글쓰기</h1>
		</div>
		<div class="line"></div>

		<div style="width: 60%; margin: auto;">
			<form method="post" action="/write">
				<input type="text" name="title" style="width: 100%;"
					placeholder="제목" /> <br>
				<br>
				<textarea id="summernote" name="content"></textarea>
		</div>




		<!-- 버튼 -->
		<button type="button" class="btn" id="back"
			onclick="javascript:history.back();">뒤로가기</button>
		<button class="btn" id="submit">
			등록
		</button>
		
		</form>
	</section>

	<%@ include file="../common/footer.jsp" %>
   
    
    

</body>
</html>