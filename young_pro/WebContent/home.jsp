<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.user.dao.UserDAO" %>
<%@ page import="com.user.bean.UserBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link rel="stylesheet" href="css/maincss/common.css">
<link rel="stylesheet" href="css/maincss/fullpage.css">
<link rel="stylesheet" href="css/maincss/main.css">
<link rel="stylesheet" href="css/maincss/slick.css">


<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.js"></script>
<script src="js/jquery.cookie.js"></script>
<script src="js/easings.js"></script>
<script src="js/fullpage.js"></script>
<script src="js/slick.js"></script>
<script src="https://www.jsviews.com/download/jsrender.min.js"></script>
<script src="js/json2.js"></script>
<script src="js/jquery.mousewheel.min.js"></script>				
<script src="js/ul.js"></script>
<script src="js/ul_main2.js"></script>
<script src="js/ui.shopmain_layer.js"></script>
<script src="js/dr.scrn.js"></script>
<script src="js/dr.main.js"></script>
<script src="js/dr.bnr.cont.js"></script>
<script src="js/young.main.js"></script>
<script src="js/map.js"></script>
<script src="js/id.common.js"></script>
<script src="js/date.js"></script>
<script src="js/valid.js"></script>
<script src="js/paging.js"></script>
<script src="js/dr.common.js"></script>
<script src="js/dr.cart.js"></script>
<script src="js/dr.topBnr.js"></script>
<script src="jsar.common.js"></script>

<script type="text/javascript">

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
	<div class="skipNavi">
		<ul>
			<li><a href="#header">주메뉴 바로가기</a></li>
			<li><a href="#container">본문 바로가기</a></li>
			<li><a href="#footer">하단메뉴 바로가기</a></li>
		</ul>
	</div>
<div class="MAIN" id="wrap">
	<div class="textBanner" id="topBnr" style="background: rgb(0, 184, 186); display: none;">
		<div id="topBnrList">
		</div>
	</div>
<header id="header">
	<div class="header">
		<div class="fixmenu">
			<a class="plus" href="javascript:void(0);">
				<span></span>
				<span></span>
				<!-- <span class="blind">Home</span> -->
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
						<a href="userLogoutAction.bo">
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
				<!-- 	<ul class="gnb_util">
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
		<!-- 	<ul class="language">
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

<div id="container">
	<div id="main">
		<div class="quickNavi">
			<ul>
				<li>
					<a href="prdList.vo">제품</a>
				</li>
				<li>
					<a href="main.do">이벤트</a>
				</li>
				
				<c:if test="${id!=null}">
					<li>
					<a href="myPage.bo">마이페이지</a>
					</li>
				</c:if>
				
			</ul>
		</div>
		<div class="mainNavi">
			<ul>
				<li class="">
					<a href="#sec1">
						<i>1</i>
					</a>
				</li>
				<li class="">
					<a href="#sec2">
						<i>2</i>
					</a>
				</li>
				<li class="">
					<a href="#sec3">
						<i>3</i>
					</a>
				</li>
				<li class="">
					<a href="#sec4">
						<i>4</i>
					</a>
				</li>
			</ul>
		</div>
		<div class="mainWrap fullpage-wrapper" style="height: 100%; position: relative; -ms-touch-action: none; transform: translate3d(0px, 0px, 0px); touch-action: none;">
			<div class="section secVisual fp-section fp-table active fp-completely" id="sec1" >
				<div class="fp-tableCell" style="height: 859px;">
					<div class="secIn mVisualWrap slick-slider slick-dotted" >
								<div class="item slick-slide" id="slick-slide20" role="tabpanel" aria-describedby="slick-slide-control20">
									<a style="color: rgb(0,0,0);" href="#">
										<br style="clear:both;" />
										<img name="attchImg" title="01_main_01_visual_W.gif" class="bgImg" alt=""  src="https://image.drjart.com/img/009/1592871071033.gif" attch_seq="410265" />
										<div class="con">
											<p class="subject">
											멤버십데이 첫 런칭!
											<br />
											닥자가 드립니다.
											</p>
											<p class="subtxt">
											단 3일간! 무더위에 지친 마음과 피부를 위한
											<br />
											시원한 혜택을 드립니다.!
											</p>
											<span class="btn btnType5 btnSizeL" style="border-color:inherit; color: inherit;">
												<span>자세히 보기</span>
											</span>
										</div>
									</a>
								</div>
								<div class="item slick-slide " id="slick-slide21" role="tabpanel" aria-describedby="slick-slide-control21" >
									<a style="color: rgb(0, 0, 0);" href="/ko/event/general/progress/343">
										<br style="clear: both;">
										<img name="attchImg" title="title=" class="bgImg" alt="" src="https://image.drjart.com/img/009/1591774231272.gif" attch_seq="409821" >
                                        <div class="con">
                                        	<p class="subject">
                                        	 피부 고민별로 PICK! 
                                        	 <br/> 
                                        	 233억에센스+바이옴샷 
                                        	 </p>
                                            <p class="subtxt">
                                            바이옴 에센스+바이옴 샷으로
                                            <br />
                                             내 피부고민에 맞는 피부레시피를 만들어보세요!
                                             </p>
											<span class="btn btnType5 btnSizeL" style="border-color: inherit; color: inherit;">
												<span>자세히 보기</span>
											</span>
										</div>
									</a>
								</div>
								<div class="item slick-slide" id="slick-slide22" role="tabpanel" aria-describedby="slick-slide-control22" >
                                	<a style="color: rgb(255, 255, 255);" href="/ko/prd/view/21300">
                               			<br style="clear: both;">
                               			<img name="attchImg" title="01_main_01_visual_W.jpg" class="bgImg" alt="" src="https://image.drjart.com/img/009/1591678426951.jpg" attch_seq="409758">
                               			<div class="con">
                                			<p class="subject">
                                		  	유튜버 회사원A 꾸준템 
                                			 <br>
                                			 바이옴 에센스+블루 샷 
                                			 </p>
                              				<p class="subtxt">
                              				회사원A 추천템 구매하고 
                              				<br> 
                              				공식몰 추가 혜택도 놓치지마세요!
                              				</p>
											<span class="btn btnType5 btnSizeL" style="border-color: inherit; color: inherit;">
												<span>자세히 보기</span>
											</span>
										</div>
									</a>
								</div>
								<div class="item slick-slide" id="slick-slide23" role="tabpanel" aria-describedby="slick-slide-control23">
                                	<a style="color: rgb(0, 0, 0);" href="/ko/prd/view/21223">
                                		<br style="clear: both;">
                               			 <img name="attchImg" title="01_main_01_visual_W.jpg" class="bgImg" alt="" src="https://image.drjart.com/img/009/1591931914157.jpg" attch_seq="409907">
                              			  <div class="con">
                             			 	 <p class="subject"> 
                             			 	 디렉터파이가 선정한
                             			 	 <br />
                             			 	 Top of Top 선케어
                             			 	 </p>
                              				 <p class="subtxt">
                              				 솔라바이옴 앰플 사용하고 
                              				 <br />
                              				  겉바속촉 피부를 느껴보세요!  
                              				  </p>
											  	<span class="btn btnType5 btnSizeL" style="border-color: inherit; color: inherit;">
											  		<span>자세히 보기</span>
											  	</span>
										</div>
									</a>
								</div>
								<div class="item slick-slide" id="slick-slide24" role="tabpanel" aria-describedby="slick-slide-control24" >
									<a style="color: rgb(0, 0, 0);" href="/ko/prd/gift/25">
										<br style="clear: both;">
										<img name="attchImg" class="bgImg" alt="" src="https://image.drjart.com/img/009/1592437221751.jpg" attch_seq="410138">
                                		<div class="con">
                                    		<p class="subject">
                                    		크라이오러버로 
                                    		<br />
                                    		#셀프홈케어♥
                                    		</p>
                                            <p class="subtxt">
                                            크라이오 러버 마스크로 피부 열감은 낮추고
                                            <br />
                                            자극 받은 피부 결은 시카페어 세럼으로 진정하세요!
                                            </p>
												<span class="btn btnType5 btnSizeL" style="border-color: inherit; color: inherit;">
													<span>자세히 보기</span>
												</span>
										</div>
									</a>
								</div>
								<div class="item slick-slide" id="slick-slide25" role="tabpanel" aria-describedby="slick-slide-control25" >
                                	<a style="color: rgb(0, 0, 0);" href="/ko/prd/view/21282">
                                    	<br style="clear: both;">
                                    	<img name="attchImg" title="01_main_01_visual_W_01.gif" class="bgImg" alt="" src="https://image.drjart.com/img/009/1591780771253.gif" attch_seq="409851">
                                        <div class="con">
                                        	<p class="subject"> 
                                        	귀차니즘들의 
                                        	<br />
                                        	 클렌징 해결책! 
                                        	 </p>
                                             <p class="subtxt">
                                             피부를 건강하게 해주는 
                                             <br> 
                                             바이옴클렌저로 클렌징 루틴을 바꿔보세요! 
                                             </p>
												<span class="btn btnType5 btnSizeL" style="border-color: inherit; color: inherit;">
													<span>자세히 보기</span>
												</span>
										</div>
									</a>
								</div>
								<div class="item slick-slide" id="slick-slide26" role="tabpanel" aria-describedby="slick-slide-control26" >
                                	<a style="color: rgb(255, 255, 255);" href="/ko/event/general/progress/346">
										<br style="clear: both;">
                                		<img title="01_main_01_visual_W.jpg" class="bgImg" alt="" src="https://image.drjart.com/img/009/1592301248099.jpg" attch_seq="410017">
                               		 	<div class="con">
                                			<p class="subject">
                                			기분 좋은 
                                			<br />
                                			첫 만남을 위한 선물!
                                			</p>
											<p class="subtxt">
											첫 구매하고,촉촉 수분 케어! 
											<br />
											#수분고정크림을 체험해 보세요!
											</p>
												<span class="btn btnType5 btnSizeL" style="border-color: inherit; color: inherit;">
													<span>자세히 보기</span>
												</span>
										</div>
									</a>
								</div>
								<div class="item slick-slide" id="slick-slide27" role="tabpanel" aria-describedby="slick-slide-control27" >
                                	<a style="color: rgb(0, 0, 0);" href="/ko/event/culture/progress/345">
	                                	<br style="clear: both;">
	                                	<img name="attchImg" title="01_main_01_visual_W.jpg" class="bgImg" alt="" src="https://image.drjart.com/img/009/1592266183185.jpg" attch_seq="409994">
	                                	<div class="con">
	                                		<p class="subject">
	                                		여름엔 촉촉 바이옴과
	                                		<br />
	                                		커피 한잔의 여유♥
	                                		</p>
											<p class="subtxt">
											바이탈하이드라솔루션과 함께 나만의 시원한 홈까페를 즐겨보세요!
											</p>
												<span class="btn btnType5 btnSizeL" style="border-color: inherit; color: inherit;">
													<span>자세히 보기</span>
												</span>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
			<div class="section secArtist fp-section fp-table active fp-completely"  id="sec2" style="height: 859px;">
				<div class="fp-tableCell" style="height: 859px;">
            		<div class="secIn">
						<div class="artistWrap slick-initialized slick-slider slick-dotted">          		
							<div class="slick-list draggable">
								<div class="slick-track" style="width: 1682px; opacity: 1;">
									<div tabindex="0" class="item slick-slide slick-current slick-active slickAni " id="slick-slide10" role="tabpanel" aria-hidden="false"
									 aria-describedby="slick-slide-control10" style="left: 0px; top: 0px; width: 1682px; position: relative; z-index: 99; opacity: 1; 
									 background-image: url('https://image.drjart.com/img/009/1584351429576.jpg');" data-slick-index="0">
										<div class="con" style="color: rgb(0, 0, 0);">
										<span class="t">
										<br style="clear: both;" />
											PROJECT #12
										</span>
										<p class="subject">
										 Vital Hydra Solution
										<br />
										 #Biome
										</p>
										<p class="subtxt">
										우리의 피부 수분체질 개선을 돕기 위해
										<br />
										필터스페이스에 바이옴™4총사가 도착했습니다.
										</p>
										<a tabindex="0" class="btn btnType5 btnSizeM" style="border-color: inherit; color: inherit;" href="/ko/brand/fltrspce/cmpgn/ing">
											<span>보러 가기</span>
										</a>
										</div>
									</div>
								</div>
                   		  </div>
                        <ul class="slick-dots" role="tablist" >
                        	<li class="slick-active" role="presentation">
                       			 <button tabindex="0" id="slick-slide-control10" role="tab" aria-selected="true" aria-controls="slick-slide10" aria-label="1 of 1" type="button" >1</button>
                        	</li>
                        </ul>
                  </div>
                 </div>
            </div>
        </div>
			<div class="section secStudio fp-section fp-table active fp-completely" id="sec3" style="height: 859px;">
			<div class="fp-tableCell" style="height: 859px;">
                <div class="secIn">
                	<div class="studioWrap slick-initialized slick-slider slick-dotted">
						<div class="slick-list draggable">
							<div class="slick-track" style="width: 1682px; opacity: 1;">
								<div tabindex="0" class="item slick-slide slick-current slick-active slickAni" id="slick-slide00" role="tabpanel" aria-hidden="false" 
								aria-describedby="slick-slide-control00" style="left: 0px; top: 0px; width: 1682px; position: relative; z-index: 99; opacity: 1;" data-slick-index="0">
									<div class="con" style="color: rgb(34, 34, 34);">
										<span class="t">
										NEW Product Movie
										</span>
										<p class="subject">
										태양에 맞서는
										<br />
										강력한 차단의 힘
										</p>
										<p class="subtxt">
										지구의 솔라스트레스에 맞서는
										<br />
										#우주선크림 솔라바이옴의
										<br />
										강력한 피부보호막을 경험해보세요.
										</p>
										<a tabindex="0" class="btn btnType2 btnSizeM" href="/ko/jartinside/jart/studio/list">
											<span>더 많은 영상 보기</span>
										</a>
									</div>
								<div class="vod">
									<a style='background-image: url("https://image.drjart.com/img/009/1585722443572.jpg");' href="#" alt="">
										<img alt="play" src="img/whiteplay.png"  style= "width: 50px; height: 50px;">
									</a>
								</div>
								</div>
							</div>
						</div>
						<ul class="slick-dots" role="tablist">
							<li class="slick-active" role="presentation">
								<button tabindex="0" id="slick-slide-control00" role="tab" aria-selected="true" aria-controls="slick-slide00" aria-label="1 of 1" type="button">1</button>
							</li>
						</ul>
				</div>
				<div class="vodArea">
					<iframe width="100%" height="100%" title="YouTube video player" class="vodplayer" id="player1"
					src=""  frameborder="0" allowfullscreen="1" allow="accelerometer; autoplay; emcrypted-media; gyroscope; picture-in-picture">
					</iframe>
					<div class="cover">
						<button class="btnStop" onclick="stopVideo();">
							<span class="blind">영상정지</span>
						</button>
					</div>
				</div>
				</div>
            </div>
         </div>
			<div class="section secEvt fp-section fp-table active fp-completely" id="sec4" style="height: 859px;">
				<div class="fp-tableCell" style="height: 859px;">
                	<div class="secIn" >
	                    <div class="event_list">
                        <ul>
							<li>
								<a href="javascript:gtag('event', '세라룸', { 'event_category' : 'Ban'}); document.location.href ='/ko/brand/channel/list';">
								<div class="ban">
									<img alt="" src="https://image.drjart.com/img/008/1508994989898.jpg">
									<span></span>
								</div>
									<span class="cate">
										Dr.Jart Channel
									</span>
									<p class="subject">
										신뢰가는 Doctor와 유쾌한 Art 요소들로 만들어가는 뷰티 그램
									</p>
							</a>
						</li>
						<li>
							<a href="javascript:gtag('event', '세라룸', { 'event_category' : 'Ban'}); document.location.href ='/ko/jartinside/product/story';">
							<div class="ban">
								<img alt="" src="https://image.drjart.com/img/008/1552613750448.jpg">
								<span></span>
							</div>
								<span class="cate">
									Product Zoom-in
								</span>
								<p class="subject">
									시카 스토리, 시카 뮤지엄 등 시카에 대한 모든 이야기
								</p>
						</a>
					</li>
					<li>
						<a href="javascript:gtag('event', '세라룸', { 'event_category' : 'Ban'}); document.location.href ='/ko/brand/fltrspce/cmpgn/intro';">
						<div class="ban">
							<img alt="" src="https://image.drjart.com/img/008/1508995257263.jpg">
							<span></span>
						</div>
							<span class="cate">
								Filter Space
							</span>
							<p class="subject">
								'물','공기','빛'의 경험! 닥터자르트 플래그쉽 스토어 
							</p>
						</a>
					</li>
					<li>
						<a href="javascript:gtag('event', '세라룸', { 'event_category' : 'Ban'}); document.location.href ='/ko/cs/membership';">
						<div class="ban">
							<img alt="" src="https://image.drjart.com/img/008/1508995370143.jpg">
							<span></span>
						</div>
							<span class="cate">
								Membership
							</span>
							<p class="subject">
								다양한 혜택의 닥터자르트 멤버십 안내!
							</p>
						</a>
				</li>
			</ul>
         	</div>
			<div class="paging">
				<span class="first">
					<a title="맨 처음" href="javascript:void(0);">
						<img alt="First" src="https://image.drjart.com/front/ko/images/common/arr_pageFirst.png">
					</a>
				</span> 
				<span class="prev">
					<a title="이전 5페이지" href="javascript:void(0);">
						<img alt="Previous" src="https://image.drjart.com/front/ko/images/common/arr_pagePrev.png">
					</a>
				</span> 
				<span class="current">1</span>
				<span class="next">
					<a title="다음 5페이지" href="javascript:void(0);">
						<img alt="Next" src="https://image.drjart.com/front/ko/images/common/arr_pageNext.png">
					</a>
				</span> 
				<span class="last">
					<a title="맨 마지막" href="javascript:void(0);">
						<img alt="Last" src="https://image.drjart.com/front/ko/images/common/arr_pageLast.png">
					</a>
				</span> 
			</div>
		</div>
	</div>
</div>



<div class="section fp-auto-height fp-section fp-table" id="sec5" style="height: 859px;">
	<div class="fp-tableCell" style="height: 859px;">
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
								<p><a href="prductmain.jsp">제품</a></p>
								<ul>
									<li><a href="/ko/prd/all">모든제품</a></li>
									<li><a href="/ko/prd/solution?catSeq=63">민감피부솔루션</a></li>
									<li><a href="/ko/prd/item">유형별</a></li>
									<li><a href="/ko/prd/line">라인별</a>
									<li><a href="/ko/prd/special?catSeq=58">온라인세트</a></li>
									<li><a href="/ko/prd/revw/photo/list">제품 리뷰</a></li>
								</ul>
							</li>
							<li class="dep1 event">
								<p><a href="/ko/event/general/progress/list">이벤트</a></p>
								<ul>
									<li><a href="/ko/event/general/progress/list">이벤트</a></li>
									<li><a href="/ko/event/culture/progress/list">문화처방전</a></li>
									<li><a href="/ko/event/general/win/list">당첨자 발표</a></li>
									<li><a href="/ko/event/revw/list">이벤트 리뷰</a></li>
								</ul>
							</li>
							<li class="dep1 inside">
								<p><a href="/ko/jartinside/product/story">스토리</a></p>
								<ul>
									<li><a href="/ko/jartinside/product/story">제품 스토리</a></li>
									<li><a href="/ko/brand/channel/list">소셜채널</a></li>
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
		<!-- <div class="foot_sns">
			<a class="sns_is" href="https://www.instagram.com/drjart_kr/" target="_blank"><span class="blind">Instagram</span></a>	
			<a class="sns_fb" href="https://www.facebook.com/DrJartPage?fref=photo" target="_blank"><span class="blind">Facebook</span></a> 
			<a class="sns_nv" href="http://post.naver.com/my.nhn?memberNo=2470585" target="_blank"><span class="blind">Naver Blog</span></a>
		</div> -->
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
</div>
</div>
		</div>
	</div>
</div>
<script src="ui.shopmain_layer.js"></script>

<script type="text/javascript">
	$.jart.main.bnr.bnr_seq = '34';
	$.jart.main.scrn.cl_cd_main = '001';
	$.jart.main.scrn.scrn_cd_first = '001';
	$.jart.main.scrn.scrn_cd_second = '002';
	$.jart.main.scrn.scrn_cd_third = '003';
	$.jart.main.setIndex()
</script>
<div class="layerPop layerConfirm" id="layer_alert">
			<div class="layerBody">
				<p class="txt"></p>
				<div class="btn_wrap">
					<button class="btn btnType2 btnSizeM ok" onclick="hideLayer('layer_alert');return false;"><span>확인</span></button>
				</div>
			</div>  
		</div>
		<div class="layerPop layerConfirm" id="layer_confirm">
			<div class="layerBody">
				<p class="txt"></p>
				<div class="btn_wrap">
					<button class="btn btnType2 btnSizeM ok" onclick="hideLayer('layer_confirm');return false;"><span>확인</span></button>
					<button class="btn btnType4 btnSizeM cancel" onclick="hideLayer('layer_confirm');return false;"><span>취소</span></button>
				</div>
			</div>  
		</div>
</div>

</body>
</html>