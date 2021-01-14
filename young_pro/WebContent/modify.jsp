<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<%@ page import = "java.util.*" %>
<%@ page import = "java.util.regex.Pattern" %>
<%@ page import="com.user.dao.UserDAO" %>
<%@ page import="com.user.bean.UserBean" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%request.setCharacterEncoding("UTF-8");  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>

<link rel="stylesheet" href="css/content7.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />
<link rel="stylesheet" href="css/common.css">

<script src=https://code.jquery.com/jquery-3.5.1.min.js></script>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.js"></script>
<script src="js/jquery.cookie.js"></script>
<script src="js/easings.js"></script>
<script src="js/fullpage.js"></script>
<script src="js/slick.js"></script>
<script src="https://www.jsviews.com/download/jsrender.min.js"></script>
<script src="js/json2.js"></script>
<script src="js/jquery.mousewheel.min.js"></script>
<script src="js/dr.common.js"></script>
<script src="js/ul.js"></script>
<script src="js/dr.scrn.js"></script>
<script src="js/dr.main.js"></script>
<script src="js/dr.bnr.cont.js"></script>
<script src="js/dr.cart.js"></script>
<script src="js/dr.topBnr.js"></script>
<script src="js/young.main.js"></script>
<script src="js/map.js"></script>
<script src="js/id.common.js"></script>
<script src="js/date.js"></script>
<script src="js/valid.js"></script>
<script src="js/paging.js"></script>



<style>

.rollBanner>a 
{ height:40px; 
  display:block; 
  font-size:15px; 
  text-align:center; 
  line-height:40px; }

</style>

<script>
	$.views.helpers({ib: $.ib});
	$.context = "";

	main = true;

	$(document).ready(function(){ 
	$('.eventView_box .opt_txt').each(function(){ 
		if ($(this).text().length > 220) 
		$(this).text($(this).text().substr(0,220)+"  ...  더보기"); 
		}); 
	});

</script>	

</head>
<body>
<% 
	String pw = (String)session.getAttribute("pw");
	System.out.println("modify.jsp" + pw);
	String id = (String)session.getAttribute("id");
	System.out.println("modify.jsp" + id);

%>

	<header id="header">
			<div class="header">
		<div class="fixmenu">
			<a class="plus" href="javascript:void(0);">
				<span></span>
				<span></span>
				<span class="blind">Home</span>
			</a>
			<a class="all-menu" href="javascript:void(0);">
				<span></span>
				<span></span>
				<span></span>
			</a>
			<div class="util">
				<ul>
					<li class="cart">
						<a href="ShoppingCart.jsp">
							<img src="img/shopping-cart.svg" alt="cart" />
							<span class="blind">장바구니</span>
							<span class="n" id="hCartCnt"></span>
						</a>
					</li>
					<li class="search">
						<a href="seach.jsp">
							<img src="img/search02.png" alt="search" />
							<span class="blind">검색</span>
						</a>
					</li>
					<c:if test="${id==null}">
					<li class="login">
						<a href="userLogin.bo">
							<img src="img/user.svg" alt="login" />
							<em>로그인</em>
						</a>
					</li>
					</c:if>
					
					<c:if test="${id!=null}">
					<li class="login">
						<a href="userLogout.bo">
							<img src="img/user.svg" alt="logout" />
							<em>로그아웃</em>
						</a>
					</li>
					</c:if>
				</ul>
			</div>
		</div>
		<div class="gnbwrap">
			<p class="logo">
				<a href="home.jsp">
					<img src="img/logo.jpg" alt="logo" />
				</a>
			</p>
			<div class="gnbIn">
				<div>
					<ul id="gnb">
						<li>
							<a href="prdList.vo">제품</a>
						</li>
						<li>
							<a href="main.do">이벤트</a>
						</li>
						<c:if test="${id!=null}">
						<li>
							<a href="mypage.bo">마이페이지</a>
						</li>
						</c:if>
						
					</ul>
					
				</div>
			</div>
			<!-- <ul class="language">
				<li class="on">
					<a href="javascipt:;">
						<span>KR</span>
					</a>
				</li>
				<li>
					<a href="#">
						<span>EN</span>
					</a>
				</li>
				<li>
					<a href="#">
						<span>CN</span>
					</a>
				</li>
			</ul> -->
		</div>
	</div>
</header>

	<script>
		$(document).ready(function(){
		$.jart.common.cart.getCartList().done(function(data){
			if(data && data.length > 0) {
				$('#hCartCnt').html(data.length);
				$('#hCartCnt').closest('.cart').addClass('active');
			}
		});
		$(".fixmenu .plus").click(function(){
			location.href = "/"
		});
		})
	
		function changeView() 
		{
			location.href='list.do?seq=${bean.seq}';
		}
	</script>
			
		<!-- 와이드 메뉴 -->	
		<div id="container">
		 <div class="wideContent">
			<div class="upMenu" id="up">
			 <h2 class="topTitle">이벤트</h2>
				<ul>
					<li><a href="main.do">이벤트</a></li>		
					<li id="on"><a href="list.do">이벤트 리뷰</a></li>		
				</ul>
				</div>	
			</div>

		
		
		
			
		
		<div class="contents">
			<h2 class="conTitle">후기 작성하기</h2>
			<div class="listTotal">
			
			<form action="modify.do?seq=${bean.seq}" id="file_Form" method="post" name="boardForm" enctype="multipart/form-data">
			<input type="hidden" name="existFile" value="${bean.file}" />
			
			<!-- 아이디 가져오기 -->	
			<!-- <div class="inp_pw">
				<label for="writer"></label>
				<input type="text" name="writer" id="writer" placeholder="비밀번호를 입력해주세요" required="required" autocomplete="off"/>
				<p class="err1" id="error" style="display:none"></p>
			</div>  -->
			
			<div class="inp_title">
				<!-- <label for="title"></label> -->
				<input type="text" name="title" id="title" value="${bean.title}" required="required" autocomplete="off"/>
				<p class="err2" id="error" style="display:none"></p>
			</div>	
			
			<div class="textBox">
			<textarea name="content" id="content" cols="100" rows="10" required="required" autocomplete="off">${bean.content}</textarea>
			</div>
			
			<div class="addFile">
			 	
			 	<div class="button_b">
			 	<span>기존파일 : ${bean.file}</span>
			 	</div>
				
				<div class="button" onclick="onclick=document.all.file.click()">
			 	<span class="fileFont">이미지 첨부</span>
			 	</div>
				<input type="file" name="file" id="file" style="display:none">
				
			</div>
				
				<span class="fileA">* 게시글에 등록할 사진을 선택해 추가해주세요 (최대 10개) </span>
				<span class="err3" id="error"></span>
				
		
			<!-- onclick="document.getElementById('file_Form').submit().Check();" -->
			<div class="list_btn">
			
				<button type="submit" class="button-4">
				<div class="eff-4"></div>
				<a href="#" onClick="chanView(1);" ><span>수정</span></a>
				</button>

				<a href="main.do" class="btn_list">
				<div class="button-1">
				<div class="eff-1"></div>
				<span>목록</span>
				<!-- <input type="button" onclick="document.getElementById('file_Form').submit(); value='전송'"/> -->
				</div>
				</a>
			
			</div>
			
			<script type="text/javascript">
					function chanView(value) {
						if(value=="1"){
							alert('비밀번호가 일치하지 않습니다.');
						}else if(value=="2"){
							location.href="eventReviewList.jsp";
						}
					}
				
				</script>
				</form>
				</div>
			</div>
			</div>
			
	<!-- <script>
	
    /* 폼 서식 검사 */
    function formCheck() {   
       var formc=document.file_Form.value;
    	
       if(document.file_Form.writer.value == '') {
    	   alert("비밀번호를 입력하세요.")
    	   document.file_Form.writer.focus();
       }else if(document.file_Form.title.value == ''){
    	   alert("제목을 입력하세요.")
    	   document.file_Form.title.focus();
    	}else if(document.file_Form.content.value == ''){
    	   alert("내용을 입력하세요.")
    	   document.file_Form.content.focus();
    	}else{
    		formc.submit();
    	}

    }
        
	</script> -->
		
		<script>
		
		$(document).ready(function() {
			
			$(function(){
				var id = $("#writer");
				var ti = $("#title");
				var con = $("#content");

				id.on('focus', function() {
					$('.err1').css({'display' : 'none'});
					$('.inp_pw input').css({'border':'1px solid #dcdcdc'});
				});

				id.on('blur', function() {
					if (id.val() == '') {
						$('.err1').css({'display' : 'block'});
						$('.err1').text("비밀번호는 필수 입력 사항입니다.");
						$('.inp_pw input').css({'border':'1px solid black'});

					} else {
						$('.err1').css({'display' : 'none'});
						$('.inp_pw input').css({'border':'1px solid #dcdcdc'});
						id.blur();
					}

				});

				ti.on('focus', function() {
					$('.err2').css({'display' : 'none'});
					$('.inp_title input').css({'border':'1px solid #dcdcdc'});

				});

				ti.on('blur', function() {
					if (ti.val() == '') {
						$('.err2').css({'display' : 'block'});
						$('.err2').text("제목은 필수 입력 사항입니다.");
						$('.inp_title input').css({'border':'1px solid black'});
					} else {
						$('.err1').css({'display' : 'none'});
						$('.inp_title input').css({'border':'1px solid #dcdcdc'});
						ti.blur();
					}

				});

				con.on('focus', function() {
					$('.err3').css({'display' : 'none'});
					$('.textBox textarea').css({'border':'1px solid #dcdcdc'});

				});

				con.on('blur', function() {
					if (con.val() == '') {
						$('.err3').css({'display' : 'inline'});
						$('.err3').text("\u00A0 \u00A0내용은 필수 입력 사항입니다.");
						$('.textBox textarea').css({'border':'1px solid black'});
					} else {
						$('.err1').css({'display' : 'none'});
						$('.textBox textarea').css({'border':'1px solid #dcdcdc'});
						con.blur();
					}

				});

				
			});
			

			
		});
			</script>	
			
		
		<footer id="footer">
			 <div class="footerT">
				<div class="foot_menu">
					<ul>
					 <li class="m1">
						<a href="#" target="blank">
						회사소개</a>	
					 </li>		
					 
					 <li class="m2">
						<a href="#" target="blank">
						이용약관</a>	
					</li>		
					
					 <li class="m3">
						<a href="#" target="blank">
						개인정보 처리방침</a>	
					</li>		
					 
					 <li class="m4">
						<a href="#" target="blank">
						이메일 주소 무단수집 거부</a>	
					</li>		
					
					 <li class="m5">
						<a href="#" target="blank">
						고객만족센터</a>	
					</li>		
				</ul>
			</div>
			
			<div class="sitemap">
				<button class="tit">
					<span>Site map</span>
				</button>
			<div class="sitemap_menu">
				<ul>
				 <li class="dep1">
				 	<p><a href="#">제품</a></p>
				 	<ul>
				 	 <li><a href="#">모든 제품</a></li>
				 	 <li><a href="#">유형별</a></li>
				 	 <li><a href="#">제품 리뷰</a></li>
				 	</ul>
				 </li>
					<li class="dep1">
				 	<p><a href="main.do">이벤트</a></p>
				 	<ul>
				 	 <li><a href="main.do">이벤트</a></li>
				 	 <li><a href="list.do">이벤트 리뷰</a></li>
				 	</ul>
				 </li>
					<li class="dep1">
				 	<p><a href="#">유틸리티</a></p>
				 	<ul>
				 	 <li><a href="main.do">회원가입</a></li>
				 	 <li><a href="mypage.bo">마이페이지</a></li>
				 	 <li><a href="ShoppingCart.jsp">장바구니</a></li>
				 	 <li><a href="wishList.jsp">위시리스트</a></li>
				 	</ul>
				 </li>
				</ul>
		</div>
		</div>
			
			<div class="familysite">
				<button class="tit">
					<span>Family Site</span>
				</button>
			</div>
			
			<div class="language">
				<button class="tit">
					<span>Korean</span>
				</button>
			</div>
			
			
		</div>
						
			
			
	<div class="footerM">
		<div class="foot_info">
			<div class="address">
				<p>
				 <span>서울특별시 강남구 역삼동 769-8 엠스페이스빌딩, 
				 	도로명 주소 ( 서울특별시 강남구 논현로72길 13 M-SPACE 빌딩 해브앤비 )
				 </span>
				 <span>
				  대표이사 : 크리스토퍼 킨더슬리 우드
				 </span>
				 </p>
				
				<p>
				 <span>상호명 : 해브앤비(주)</span>
				 <span>사업자 등록번호 : 214-87-63681</span>
				 <span>통신판매업 신고번호 : 2008 서울 강남-2284호
				 <a href="#" target="_blank" class="busnessinfo">
				 	<span class="arr-right">
				 	사업자 정보 확인
				 	</span>
				 </a>
				 </span>	
				</p>
				 
				 
				 <p>
				 	<span>개인정보관리책임자 : 엄정식 팀장</span>
				 	<span>고객만족센터 : 1544-5453 ( 운영시간 : 09:00~18:00, 점심시간 : 11:50~12:50 )</span>
				 	<span>FAX : 02-3462-9051</span>
				 </p>
				 
				 <p>
				 <span>전자우편주소 : 
				 <a href="mailto:webmaster@drjart.com" class="mail">webmaster@drjart.com</a></span> 
				 </p>
				</div>
				
				<small class="copyright">Copyrightⓒ Have&amp;Be co., Ltd. All rights reserved.</small>
			</div>
			
			
			
			<!-- sns -->
			<div class="foot_sns">
				<a href="https://www.instagram.com/drjart_kr/" class="sns1" target="_blank">
				<img src="" alt="" /></a>
				
				<a href="https://ko-kr.facebook.com/DrJartPage/" class="sns2" target="_blank">
				<img src="" alt="" /></a>
			
				
				<a href="https://twitter.com/drjartkr/" class="sns3" target="_blank">
				<img src="" alt="" /></a>
				
			</div>
			
		</div>
		
		<div class="footerB">
			<div class="foot_mark">
			 <ul>
			 	<li><img src="#" alt="" />
			 	<span>
			 	iso9001,14001<br/>
			 	환경경영인증 획득</span>
			 	</li>
			 	
			 	<li><img src="#" alt="" />
			 	<span>
			 	기업 부설<br/>
			 	디자인 연구소 인정
			 	</span>
			 	</li>
			 
			 	
			 </ul>
			</div>
		</div>
					</footer>
	
	
	
	<script type="text/javascript"> 
	function goPage() { location.href="eventMain.jsp"; } 
	</script>

	
	
		
		
		
		
		<!-- 진행 중인 이벤트 사진 -->
		
		
		
		<!-- 이벤트 당첨자 후기 리스트 -->
		
		
	
	
	
</body>
</html>
	
	