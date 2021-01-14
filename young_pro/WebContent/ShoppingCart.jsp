<%@ page import = "com.shop.bean.*, com.shop.dao.PrdDAO, java.util.List, java.text.SimpleDateFormat, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="css/maincss/common.css">
<link rel="stylesheet" href="css/maincss/slick.css">
<link  rel="stylesheet" href="css/maincss/jquery-ui.css">
<link  rel="stylesheet" href="css/maincss/jquery.mCustomScrollbar.min.css">
<link  rel="stylesheet" href="css/maincss/order.css">
<link rel="stylesheet" href="css/maincss/main.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.isotope/3.0.6/isotope.pkgd.js"></script>
<script src="https://www.jsviews.com/download/jsrender.min.js"></script>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.js"></script>
<script src="js/easings.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/jquery.inview.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="js/json2.js"></script>
<script src="js/slick.js"></script>

<script src="js/ul.js"></script>
<script src="js/young.main.js"></script>
<script>
	function  checkAll(theForm){
		if(theForm.remove.length == undefined){
			theForm.remove.checked = theForm.allCheck.checked;
		}else{
			for(var i=0; i<theFrom.remove.length; i++){
				theForm.remove[i].checked = theForm.allCheck.checked;
			}
		}
	}
	
	function checkQty(name,qty){
		if(qty != 1){
			location.href="prdCartQtyDown.vo?name="+name;
		}
	}
</script>
</head>
<body class="loading">
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
					<li class="login">
						<a href="login.jsp">
							<img src="img/user.svg" alt="login" />
							<em>로그인</em>
						</a>
					</li>
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
							<a href="myPageAction.bo">마이페이지</a>
						</li>
						</c:if>
					</ul>
					<ul class="gnb_util">
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
					</ul>
				</div>
			</div>
			<ul class="language">
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
			</ul>
		</div>
	</div>
</header>
<section>
<div class="order" id="container">
		<div class="wideContents">
			<div class="order_step">
				<ol>
					<li class="s1 on"><span>01</span> 장바구니</li>
					<li class="s2"><span>02</span> 결제진행</li>
					<li class="s3"><span>03</span> 주문완료</li>
				</ol>
			</div>
			<div class="pageTitArea">
				<img alt="" src="https://image.drjart.com/front/ko/images/order/ico_cart.gif">
				<h2 class="tit_en">장바구니</h2> 
			</div>
		</div>
		<div class="contents aside_con">
			<c:if test="${cartList == null }">
				<div class="noData border" id="noCrtData">
					<p>장바구니에 담긴 상품이 없습니다.</p>
				</div>
			</c:if>
				<c:if test="${cartList != null && cartList.size() >0}">
					<div class="tbl_order borderT" id="crtDataArea" >
				<form id="order_Form" action="orderStart.vo" method="post">
						<table summary="장바구니 내역">
							<caption>장바구니 내역 표</caption>
							<colgroup>
								<col width="120px">
								<col width="*">
								<col width="150px">
								<col width="110px">
								<col width="45px">
							</colgroup>
							<thead>
								<tr>
									<th class="th_thumb">
										<span class="inp_check">
							                <input name="allCheck" id="allCheck" type="checkbox" onclick="checkAll(this.form)" style="opacity: 1"/>
							                	<span class="blind">전체선택</span>
							            </span>
							            <span class="blind">상품이미지</span>
							        </th>
									<th class="th_prd">
							            상품
							            <span class="blind">정보</span>
							        </th>
									<th class="th_qty">수량</th>
									<th class="th_price">가격</th>
									<th class="th_btn">
										<span class="blind">삭제</span>
									</th>
								</tr>
							</thead>
							<c:forEach var="cart" items="${cartList }"  varStatus="status">
							<tbody id="crtListArea">
								<tr class="crtP1015">
									<td class="td_thumb">
										<span class="inp_check" >
											<input type="checkbox"  id="remove" name="remove" value="remove" style="opacity: 1" />
												<span class="blind">선택</span>
										</span>
										<div class="opt_thumb">
											<img src="img/${cart.image}" alt="-"  style="width:120px;"/>
										</div>
									</td>
									<td class="td_prd">
										<div class="opt_detail">
											<p class="opt_prdname">${cart.name }</p>
										</div>
									</td>
									<td class="td_qty">
										<div class="inp_qty1">
											<a href="prdCartQtyUp.vo?name=${cart.name }">
												<img alt="수량추가" src="img/up1.png" />
											</a>
											<br>${cart.qty }<br>
											<a href="javascript:checkQty('${cart.name }', ${cart.qty })">
												<img alt="수량감소" src="img/down1.png" />
											</a>
										</div>
									</td>
									<td class="td_price">
											<div class="opt_price">
												<span class="cost">${cart.price }</span>
											</div>
									</td>
									<td class="td_btn">
										<div class="btn_wrap">
											<a href="prdCartRemove.vo" class="btnTypeIcon btn_delete delCrtBtn">
											<img src="img/clear.png" alt="" />
												<span class="blind">삭제</span>
											</a>
										</div>
									</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
		</form>
				</div>
			</c:if>
			
			
			
		<div class="btn_wrap" id="crtDelBtns" >
			<a class="btn btnType4 btnSizeS" id="selCrtDel" href="prdCartRemove.vo">
				<span>선택상품 삭제</span>
			</a>
		</div>
		<!-- 담긴상품 있음 : E -->
		<div class="btn_wrap btn_shopping al_c">
			<a class="btn btnType4 btnSizeM" href="prdList.vo">
				<span>쇼핑 계속하기</span>
			</a>
		</div>

		<div class="shopping_noti">
		    <dl>
		        <dt>꼭 확인해주세요!</dt>
		        <dd>- 장바구니에 담긴 상품은 최대 30일 동안 보관되며 이후에는 삭제됩니다.</dd>
		        <dd>- SNS 간편 로그인, 네이버페이, 비회원 구매 시 닥터자르트 회원혜택이 적용되지 않습니다.</dd>
		        <dd>- 장바구니에 담긴 상품 중 품절, 단종으로 판매 상태 변경 시 장바구니에서 비활성화 처리되며, 구매가 불가합니다.</dd>
		    </dl>
		</div>

		<div class="aside_area" id="sideInfoArea">
			<div class="order_total">
				<div class="sec">
					<dl class="pdtPrice">
						<dt>총 상품 금액</dt>
						<dd><em class="cost type2" id="totlPrdSellPrc">${totalMoney }</em></dd>
					</dl>
					<dl class="discountPrice">
						<dt>총 할인 금액</dt>
						<dd><span class="cost txt_red" id="totlSalePrc">0</span></dd>
					</dl>
				</div>
				<div class="sec">
					<dl class="payPrice">
						<dt>예상 결제 금액</dt>
						<dd><strong class="cost type2" id="finalSttlPrc">${totalMoney }</strong></dd>
					</dl>
				</div>
				<div class="sec sec_btn">
					<div class="btn_wrap">
						<a class="btn btnType2 btnSizeL disabled" id="ordrBtn" href="#" onclick="subMit();">
							<span>선택상품 주문하기</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	</div>
</section>

		<script type="text/javascript">
				function subMit() {
					
					alert("주문 페이지로 이동합니다.");
					form.submit();
				}
				
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
			<button class="tit"><span>Site map</span></button>
			<div class="sitemap_menu">
				<ul>
					<li class="dep1 shop">
						<p><a href="/ko/prd/main">제품</a></p>
						<ul>
							<li><a href="/ko/prd/all">모든제품</a></li>
							<li><a href="/ko/prd/solution?catSeq=63">민감피부솔루션</a></li>
							<li><a href="/ko/prd/item">유형별</a></li>
							<li><a href="/ko/prd/line">라인별</a>
							<li><a href="/ko/prd/special?catSeq=58">온라인세트</a></li>
							<!-- 2018.10.22 히든처리 -->

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
							<!-- <li><a href="/ko/jartinside/dear/artist/list">Dear Artist</a></li>  -->
							<!-- <li><a href="/ko/jartinside/jart/studio/list">Studio</a></li>  -->
						</ul>
					</li>
					
					<!-- 2018.10.22 히든처리 -->
					<li class="dep1 beauty">
						<p><a href="/ko/brand/fltrspce/cmpgn/ing">필터 스페이스</a></p>
						<ul>
							<li><a href="/ko/brand/fltrspce/cmpgn/ing">진행중인 캠페인</a></li>
							<li><a href="javascript:void(0);" onclick="$.jart.brand.fltrspce.cmpgn.moveToApntPage('view');">나의 예약확인</a></li>
							<li><a href="/ko/brand/fltrspce/cmpgn/intro">소개</a></li>
<!-- 							<li><a href="#">필터 도슨트</a></li> -->
						</ul>						
						
					</li>

					<li class="dep1 brand">
						<p><a href="/ko/brand/story">브랜드</a></p>
						<ul>
							<li><a href="/ko/brand/story">브랜드 이야기</a></li>
							
							<!-- <li><a href="/ko/brand/fltrspce/cmpgn/intro">FilterSpace Campaign</a></li>  -->
							<!-- <li><a href="/ko/brand/channel/list">Dr.Jart Channel</a></li>  -->
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
							<!-- <li><a href="#">실시간 상담</a></li> -->
						</ul>
					</li>
					<li class="dep1 util">
						<p><a href="javascript:$.jart.login.layer.show(function(){location.href='/ko/mypage/index';});">유틸리티</a></p>
						<ul>
							
							<li><a href="/ko/cstm/joinus01">회원가입</a></li>
							
							<li><a href="javascript:$.jart.login.layer.show(function(){location.href='/ko/mypage/index';});">마이페이지</a></li>
							<li><a href="/ko/ordr/crt">장바구니</a></li>
							<li><a href="/ko/mypage/prd/cncr/list">위시리스트</a></li>
							<li><a href="/ko/search/index">검색</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div class="familysite">
			<button class="tit"><span>Family Site</span></button>
			<ul>
				<li><a href="http://www.dtrtmen.com/" target="_blank">DTRT</a></li>
				<li><a href="http://us.drjart.com/" target="_blank">Dr.Jart US</a></li>
				<!-- <li><a href="http://www.drjartchina.cn/" target="_blank">Dr.Jart CHINA</a></li> -->
			</ul>
		</div>
		<!-- 다국어 open시 적용 -->
		<div class="language">
			<button class="tit"><span>Korean</span></button>
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
						<a href="#" target="_blank" class="btn btnType3 btnSizeXS busnessinfo"><span class="arr-right">사업자 정보 확인</span></a>
						<!-- <a href="http://www.ftc.go.kr/info/bizinfo/communicationView.jsp?apv_perm_no=2008322012730202284&area1=&area2=&currpage=1&searchKey=04&searchVal=2148763681&stdate=&enddate=" class="busnessinfo" target="_blank"><span class="arr-right">사업자 정보 확인</span></a> -->
					</span>
				</p>
				<p>
					<span>개인정보관리책임자 : 엄정식 팀장</span>
					<span>고객만족센터 : 1544-5453 ( 운영시간 : 09:00~18:00, 점심시간 : 11:50~12:50 )</span>
					<span>FAX : 02-3462-9051</span>
				</p>
				<p>
					<span>전자우편주소 : <a href="mailto:webmaster@drjart.com" class="mail">webmaster@drjart.com</a></span>
				</p>
			</div>
			<small class="copyright">Copyrightⓒ Have&amp;Be co., Ltd. All rights reserved.</small>
		</div>
		<div class="foot_sns">
			<a href="https://www.instagram.com/drjart_kr/" class="sns_is" target="_blank"><span class="blind">Instagram</span></a>	
			<a href="https://www.facebook.com/DrJartPage?fref=photo" class="sns_fb" target="_blank"><span class="blind">Facebook</span></a> 
			<a href="http://post.naver.com/my.nhn?memberNo=2470585" class="sns_nv" target="_blank"><span class="blind">Naver Blog</span></a>
		</div>
	</div>		
	<div class="footerB">
		<div class="foot_mark">
			<ul>
				<li><i class="mark mark1"></i><span>iso9001,14001 <br>환경경영인증 획득</span></li>
				<li><i class="mark mark2"></i><span>기업 부설 <br>디자인 연구소 인정</span></li>
				<li><a href="#" class="btn" onclick="render_pop_escrow();return false;"><i class="mark mark3"></i><span class="arr-right2">에스크로 서비스 <br>가입사실 확인</span></a></li>
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
</body>
</html>