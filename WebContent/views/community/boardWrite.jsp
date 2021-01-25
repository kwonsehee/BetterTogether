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
	 <section id="con1">
         <!-- 타이틀 -->
         <div id="con1_title">
            <h1 id="title">글쓰기</h1>
        </div>
        <div class="line"></div>

		<form action="<%=request.getContextPath()%>/board/write" method="post" enctype="multipart/form-data">
		
        <!-- 글쓰기 박스 -->
        <div id="writebox">
            <!-- 제목 입력-->
           <input type="text" id ="write_title" placeholder="  글제목을 입력해주세요" name="title">
           
           <!-- 이미지 첨부 최대 6개-->
           <% for(int i = 1; i <= 6; i++) { %>
           <div class="write_option">
                <label><input type="file" class="file-input<%= i %>" name="inputImg<%= i %>"></label>
                <span class="filename<%= i %>">파일을 선택해주세요.</span>
           </div>
           <% } %>
        
           <textarea id="writeArea"rows="5" name="content"></textarea>
           
           <!-- 파일첨부 미리보기 영역 -->
           <div id="imgViewArea">
           		<img id="img1">
           		<img id="img2">
           		<img id="img3">
           		<img id="img4">
           		<img id="img5">
           		<img id="img6">
           </div>
        </div>
        
        <!-- 파일명 보이게 이벤트 -->
        <% for(int i = 1; i <= 6; i++) { %>
			<script>
             $(document).on("change", ".file-input<%= i %>", function(){
                var filename<%= i %> = $(this).val();
                console.log(filename<%= i %>);
                if(filename<%= i %> == "")
                    filename<%= i %> = "파일을 선택해주세요.";
                $(".filename<%= i %>").text(filename<%= i %>);
                })
                
             $(function(){
					// input type="file" 태그에 파일이 첨부 될 때 동작하는 이벤트
					$("[type=file]").change(function(){
						loadImg(this);
					});
				});
             </script>
        <% } %>
        
        <!-- 파일 첨부 됐을 시 미리보기 영역 이벤트 -->
       <script>
             function loadImg(element){
            	// element를 판별해서 알맞은 위치에 preview 표현하기
				// console.log(element.name);
					
					// input type="file" 엘리먼트에 첨부 파일 속성, 첨부파일이 잘 존재하는지 확인
					if(element.files && element.files[0]){
						// 파일을 읽어들일 FileReader 객체 생성
						var reader = new FileReader();
						
						// 파일 읽기가 다 완료 되었을 때 실행 되는 메소드
						reader.onload = function(e){
							
							var selector;
							var size;
							
							switch(element.name){
							case "inputImg1" :
								selector = "#img1";
								size = {width:"150px", height:"90px", border: "solid 1px #dadada"};
								break;
							case "inputImg2" :
								selector = "#img2";
								size = {width:"150px", height:"90px", border: "solid 1px #dadada"};
								break;
							case "inputImg3" :
								selector = "#img3";
								size = {width:"150px", height:"90px", border: "solid 1px #dadada"};
								break;
							
							case "inputImg4" :
								selector = "#img4";
								size = {width:"150px", height:"90px", border: "solid 1px #dadada"};
								break;
							
							case "inputImg5" :
								selector = "#img5";
								size = {width:"150px", height:"90px", border: "solid 1px #dadada"};
								break;
							
							case "inputImg6" :
								selector = "#img6";
								size = {width:"150px", height:"90px", border: "solid 1px #dadada"};
								break;
							}
							
							$(selector).attr("src", e.target.result).css(size);
							
							console.log(e);
							console.log(e.target);
							console.log(e.target.result);
						}
						
						// 파일 읽기 하는 메소드
						reader.readAsDataURL(element.files[0]);
					}
             }
        </script>

			<!-- 버튼 -->
         <button type="button" class="btn" id="back" onclick="javascript:history.back();">뒤로가기</button>
         <button class="btn" id="submit"><a>등록</a></button>
   		</form>
    </section>
    
    
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>