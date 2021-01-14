<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<%@ page import = "java.util.*" %>
<%@page import="com.user.dao.UserDAO" %>
<%@page import="com.user.bean.UserBean" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%	request.setCharacterEncoding("UTF-8"); %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>이벤트 리뷰 게시판</title>

<!-- Style -->
<link rel="stylesheet" href="css/content5.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />
<link rel="stylesheet" href="css/common.css">

<script src=https://code.jquery.com/jquery-3.5.1.min.js></script>	
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
	<% String id = (String)session.getAttribute("id");
		
	%>
	<!-- 왼쪽 메뉴창 -->
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
					<!-- <ul class="gnb_util">
						<li>
							<a href="#">멤버십</a>
						</li>
						<li>
							<a href="#">고객만족센터</a>
						</li>
						<li>
							<a href="#">매장안내</a>
						</li>
						<li class="merge_mbr">
							<a class="btn btnType3 btnSizeS"  href="javascript:void(0);">
								<span>통합회원 전환</span>
							</a>
						</li>
					</ul> -->
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

<script type="text/javascript">
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
			<h2 class="conTitle">이벤트 리뷰</h2>
			
			<!-- 이벤트 리뷰 제목 -->
			<div class="board">
				<div class="listTotal">
					<h3 class="listTi">${bean.title}</h3>
					 <p class="evt_info">
					 <span class="evt_name">
					 	${bean.writer}
					 </span>
					 <span class="evt_date">${bean.fdate}</span>
					 </p>
					</div>
					
					<!-- 게시판 내용 -->
			<div class="boardList">
			 <div class="boardCon">
				<p>${bean.content}</p>
			<div class="article">
				<c:if test="${bean.file!=null}">
						<!-- head는 사진 제목 뽑기. -->
					<c:set var="head" value="${fn:substring(bean.file, 0, fn:length(bean.file)-4)}"></c:set>
						<!-- pattern은 이미지 형식 뽑기. -->
					<c:set var="pattern" value="${fn:substring(bean.file, fn:length(head) +1, fn:length(bean.file))}"></c:set>
				
				<c:choose>
					<c:when test="${pattern == 'jpg' || pattern == 'gif' || pattern == 'png'}">
						<img src="UploadFolder/${head}.${pattern}" width="50%" height="50%"/><br/>
					</c:when>
					<c:otherwise>
						<c:out value="NO IMAGE"></c:out>
					</c:otherwise>
				</c:choose>
				
				</c:if>
				<div class="fileChum">
				파일첨부 : <a href='FileDownloadAction.do?file_name=${bean.file}'>${bean.file}</a>
				</div>
			
			</div>				 	
			 
			 </div>
			</div>
			</div>
			
			
			<!-- 목록 아이콘 -->
			
			
			<div class="list_btn">
				<a href="list.do" class="btn_css">
					<div class="button-1">
					<div class="eff-1"></div>
					<span>목록</span>
					</div>
					</a>
				</div>
			
			 <div class="list_btn_l">
				<!-- <input type="button" value="수정" onclick="doAction(0)" />
				<input type="button" value="삭제" onclick="doAction(1)" /> -->
				<c:if test="${id.equals(bean.writer)}">
				<a href="modifyForm.do?seq=${bean.seq}" class="button-4">
				<div class="eff-4"></div>
				<span>수정</span>
				</a>
				</c:if>
				
				<c:if test="${!id.equals(bean.writer)}">
				<a href="#" onClick="chanView(1);" class="button-3">
				<div class="eff-3"></div>
				<span>삭제</span>
				</a>
				</c:if>
				
				<c:if test="${id.equals(bean.writer)}">
				<a href="#" onClick="chanView(2);" class="button-3">
				<div class="eff-3"></div>
				<span>삭제</span>
				</a>
				</c:if>
				
				<c:if test="${!id.equals(bean.writer)}">
				<a href="#" onClick="chanView(3);" class="button-4">
				<div class="eff-4"></div>
				<span>수정</span>
				</a>
				</c:if>
				
				
			
			</div>	
				<script type="text/javascript">
					function chanView(value) {
						if(value=="1"){
							alert('글 작성자만 삭제 가능합니다.');
						}else if(value=="2"){
							alert('삭제하시겠습니까?');
							location.href = "delete.do?seq=${bean.seq}";
						}else if(value=="3"){
							alert('글 작성자만 수정 가능합니다.');
						}
					}
				
				</script>
				
				<!-- <script>
				$(".button-4").click(function doAction(value){
					if (value == 0) {
						if(alert('수정하시겠습니까?');
						location.href = "modifyForm.do?seq=${bean.seq}";
						}
					}

					function doAction(value) {
						if (value == 0) {
						if(alert('수정하시겠습니까?');
						location.href = "modifyForm.do?seq=${bean.seq}";
						
						} else if (value == 1) {
							alert('삭제하시겠습니까?');
							location.href = "delete.do?seq=${bean.seq}";
						}
					}
				</script> -->
			</div>				
		</div>


		
		<!-- 푸터 -->
          <footer id="footer">
			<div class="footerT">
				<div class="foot_menu">
					<ul>
						<li class="m1"><a href="https://haveandbe.recruiter.co.kr/appsite/company/callSubPage?code1=3000&amp;code2=3100&amp;code3=3110" target="_blank">회사소개</a></li>
						<li class="m2"><a href="javascript:void(0);">이용약관</a></li>
						<li class="m3"><a href="javascript:void(0);">개인정보처리방침</a></li>
						<li class="m4"><a href="javascript:void(0);">이메일주소 무단 수집거부</a></li>
						<li class="m5"><a href="/ko/cs/index">고객만족센터</a></li>
					</ul>
				</div>
				<div class="sitemap">
					<button class="tit">
						<span>Site map</span>
					</button>
					<div class="sitemap_menu">
						<ul>
							<li class="dep1 shop">
								<p><a href="prdList.vo">모든 제품</a></p>
								<ul>
									<li><a href="prdList.vo">모든 제품</a></li>
								</ul>
							</li>
							<li class="dep1 event">
								<p><a href="main.do">이벤트</a></p>
								<ul>
									<li><a href="list.do">이벤트 리뷰</a></li>
									<li><a href="list.do">종료된 이벤트</a></li>
								</ul>
							</li>
							<li class="dep1 inside">
								<p><a href="mypage.bo">유틸리티</a></p>
								<ul>
									<li><a href="myPageRePw.jsp">정보관리</a></li>		
									<li><a href="orderList.vo">주문조회</a></li>		
									<li><a href="wishList.jsp">위시리스트</a></li>	
								</ul>
							</li>
					<li class="dep1 beauty">
						<p><a href="/ko/brand/fltrspce/cmpgn/ing">필터 스페이스</a></p>
						<ul>
							<li><a href="/ko/brand/fltrspce/cmpgn/ing">진행중인 캠페인</a></li>
							<li><a onclick="$.jart.brand.fltrspce.cmpgn.moveToApntPage('view');" href="javascript:void(0);">나의 예약확인</a></li>
							<li><a href="/ko/brand/fltrspce/cmpgn/intro">소개</a></li>
						</ul>						
					</li>
					<li class="dep1 brand">
						<p><a href="/ko/brand/story">브랜드</a></p>
						<ul>
							<li><a href="/ko/brand/story">브랜드 이야기</a></li>
						</ul>
					</li>
					<li class="dep1 cs">
						<p><a href="/ko/cs/index">고객만족센터</a></p>
						<ul>
							<li><a href="/ko/cs/faq/list">FAQ</a></li>
							<li><a href="javascript:$.jart.login.layer.show(function(){location.href='/ko/cs/qna/insert';});">1:1 문의</a></li>
							<li><a href="/ko/cs/notc/list">공지사항</a></li>
							<li><a href="/ko/cs/membership">멤버십 안내</a></li>
							<li><a href="/ko/cs/store/ko/list">매장 안내</a></li>
						</ul>
					</li>
					<li class="dep1 util">
						<p><a href="javascript:$.jart.login.layer.show(function(){location.href='/ko/mypage/index';});">유틸리티</a></p>
						<ul>
							<li><a href="/ko/cstm/joinus01">회원가입</a></li>
							<li><a href="javascript:$.jart.login.layer.show(function(){location.href='/ko/mypage/index';});">마이페이지</a></li>
							<li><a href="ShoppingCart.jsp">장바구니</a></li>
							<li><a href="/ko/mypage/prd/cncr/list">위시리스트</a></li>
							<li><a href="seach.jsp">검색</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div class="familysite">
			<button class="tit">
				<span>Family Site</span>
			</button>
			<ul>
			</ul>
		</div>
		<div class="language">
			<button class="tit">
				<span>Korean</span>
			</button>
			<ul>
				<li><a href="javascript:;">Korean</a></li>
				<li><a href="/en/main/index?lang=en">English</a></li>
				<li><a href="/zh/main/index?lang=zh">Chinese</a></li>
			</ul>
		</div>
	</div>
	<div class="footerM">
		<div class="foot_info">
			<div class="address">
				<p>
					<span>서울특별시 강남구 역삼동 769-8 엠스페이스빌딩, 도로명 주소 ( 서울특별시 강남구 논현로72길 13 M-SPACE 빌딩 해브앤비 )</span>
					<span>대표이사 : 크리스토퍼 킨더슬리 우드</span>
				</p>
				<p>
					<span>상호명 : 해브앤비(주)</span>
					<span>사업자 등록번호 : 214-87-63681</span>
					<span>통신판매업 신고번호 : 2008 서울 강남-2284호
						<a class="btn btnType3 btnSizeXS busnessinfo" href="#" target="_blank"><span class="arr-right">사업자 정보 확인</span></a>
					</span>
				</p>
				<p>
					<span>개인정보관리책임자 : 엄정식 팀장</span>
					<span>고객만족센터 : 1544-5453 ( 운영시간 : 09:00~18:00, 점심시간 : 11:50~12:50 )</span>
					<span>FAX : 02-3462-9051</span>
				</p>
				<p>
					<span>전자우편주소 : <a class="mail" href="mailto:webmaster@drjart.com">webmaster@drjart.com</a></span>
				</p>
			</div>
			<small class="copyright">Copyrightⓒ Have&amp;Be co., Ltd. All rights reserved.</small>
		</div>
		<div class="foot_sns">
			<a class="sns_is" href="https://www.instagram.com/drjart_kr/" target="_blank"><span class="blind">Instagram</span></a>	
			<a class="sns_fb" href="https://www.facebook.com/DrJartPage?fref=photo" target="_blank"><span class="blind">Facebook</span></a> 
			<a class="sns_nv" href="http://post.naver.com/my.nhn?memberNo=2470585" target="_blank"><span class="blind">Naver Blog</span></a>
		</div>
	</div>		
	<div class="footerB">
		<div class="foot_mark">
			<ul>
				<li><i class="mark mark1"></i><span>iso9001,14001 <br>환경경영인증 획득</span></li>
				<li><i class="mark mark2"></i><span>기업 부설 <br>디자인 연구소 인정</span></li>
				<li><a class="btn" onclick="render_pop_escrow();return false;" href="#"><i class="mark mark3"></i><span class="arr-right2">에스크로 서비스 <br>가입사실 확인</span></a></li>
			</ul>
		</div>
	</div>
	<script>
		function render_pop_escrow() {
			var status  = "width=500 height=450 menubar=no,scrollbars=no,resizable=no,status=no";
			window.open('http://admin.kcp.co.kr/Modules/escrow/kcp_pop.jsp?site_cd=K2959', 'kcp_pop', status);
		}

		$('.foot_menu .m2 a').click(function(){
			window.open('/ko/util/service','company1','width=700, height=700, left=0, top=0, location=no, menubar=no, status=no, toolbar=no, scrollbars=yes');
			return false;
		});
		$('.foot_menu .m3 a').click(function(){
			window.open('/ko/util/privacy','company2','width=700, height=700, left=0, top=0, location=no, menubar=no, status=no, toolbar=no, scrollbars=yes');
			return false;
		});
		$('.foot_menu .m4 a').click(function(){
			window.open('/ko/util/emrefuse','company3','width=700, height=525, left=0, top=0, location=no, menubar=no, status=no, toolbar=no');
			return false;
		});
		
	</script>
</footer>
	
	
	
	
		
		
		
		
		<!-- 진행 중인 이벤트 사진 -->
		
		
		
		<!-- 이벤트 당첨자 후기 리스트 -->
		
		
	
	
	
</body>
</html>