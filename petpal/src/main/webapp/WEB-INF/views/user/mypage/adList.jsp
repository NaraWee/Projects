<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .inquiry .tab_each{display:none}
			.inquiry .tab_each:first-child{display:block}
			.inquiry .tab{display:none}
			.tab_each{clear:both;border-top:1px solid rgba(0,0,0,0.08)}
			.tab .active, .tab .tab_btn.active {
    			color: #000;
    			font-weight: bold;
    			color: #45b99c8a;
			}
			.tab span.tab_btn {
			    display: inline-block;
			    float: none;
			    position: relative;
			    width: auto;
			    height: 40px;
			    margin-right: 22px;
			    font-size: 18px;
			    line-height: normal;
			    color: rgba(0,0,0,0.56);
			    text-align: left;
			    cursor: pointer;
			}
            .tab {
    			height: auto;
    			border-bottom: 1px solid rgba(0,0,0,0.2);
			}
			.tab .active:after {
			    display: block;
			    content: '';
			    position: absolute;
			    bottom: 0;
			    left: 0;
			    width: 100%;
			    height: 2px;
			    background: #45b99c8a;
			}
			td > button {
				background-color: #45B99C; 
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                width: 10px; 
                height: 15px;
                border-radius: 10px;
				margin-left: 5px;
			}
			td > button:hover {
				background-color: white; 
                color: #45B99C;
                border-color: white; 
                border: 1px solid;
			}
			.filtering {
				cursor: pointer;
			}
			.overlay {
  				position: fixed;
				top: 0;
				bottom: 0;
				left: 0;
				right: 0;
				background: rgba(0, 0, 0, 0.7);
				transition: opacity 500ms;
				visibility: hidden;
				opacity: 0;
				z-index: 900;
				height: 150% !important;
			}
			.overlay:target {
				visibility: visible;
				opacity: 1;
			}
			.popup {
				position: fixed;
				width: 60%;
				padding: 10px;
				max-width: 500px;
				border-radius: 10px;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				background: rgba(255, 255, 255, .9);
				-webkit-transition: opacity .5s, visibility 0s linear .5s;
				transition: opacity .5s, visibility 0s linear .5s;
				z-index: 1;
			}
			.popup:target {
				visibility: visible;
				opacity: 1;
				-webkit-transition-delay: 0s;
				transition-delay: 0s;
			}
			.popup-close {
				position: absolute;
				padding: 10px;
				max-width: 500px;
				border-radius: 10px;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				background: rgba(255, 255, 255, .9);
			}
			.popup .close {
				position: absolute;
				right: 5px;
				top: 5px;
				padding: 5px;
				color: #000;
				transition: color .3s;
				font-size: 2em;
				line-height: .6em;
			}
			.popup .close:hover {
				color: #007a5c;
			}
			.btn_submit, .certification {
                background-color: #45B99C; 
                height: 35px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
                width: 20%;
            }
			.pagination > li > a, .pagination > li > span {
            	color: #19A985 !important;
            }
        </style>
        <meta charset="utf-8">
        <title>PET-PAL</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    	<script>
    		var $j3 = jQuery.noConflict();
    		const message = '${ requestScope.message }';
		    if(message != null && message !== '') {
		    	alert(message);
		    }
    	</script>
    </head>

        <!-- Preloader -->
        <div id="loading">
            <div id="loading-center">
                <div id="loading-center-absolute">
                    <div class="object" id="object_one"></div>
                    <div class="object" id="object_two"></div>
                    <div class="object" id="object_three"></div>
                    <div class="object" id="object_four"></div>
                </div>
            </div>
        </div><!--End off Preloader -->


        <div class="culmn">
            <!--Home page style-->

           <jsp:include page="../common/userHeader.jsp"/>
            <!--Home Sections-->

            <section id="board" class="board" style="width: 70%; margin: 0px auto;  margin-bottom: 40px;">
                <div style="color: #45B99C; font-size: 25px; font-weight: 600;">?????? ??????</div>
            </section> <!--End off Home Sections-->

            <section id="list" class="list" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
                <div class="tab">
					<span id="sp0" class="tab_btn active" data-toggle="tab" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/ad/list?type=A'">?????? ?????? ??????</span>
					<span id="sp1" class="tab_btn" data-toggle="tab" onclick="location.href='#notice'">???????????? ?????? ??????</span>
				</div>
            </section>
            
            <!-- ?????? ?????? ?????? -->
			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
			<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="isToday"/>
            <section id="menutable" class="menutable">
				<div class="tab-content">
	                <div id="menu0" class="tab-pane fade in active">
	                	<c:if test="${ type eq 'A' }">
							<div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 50px;">
			                	<table class="table table-hover" style="margin-bottom: 5px;">
				                    <thead>
				                        <tr style="background-color: #F1FAF8;">
				                            <th style="text-align: center; border-radius: 21px 0px 0px 0px;"><b>?????? / ?????????</b></th>
		                                    <th style="text-align: center;"><b>?????? ??????</b></th>
				                            <th style="text-align: center;"><b>?????? ?????? ??????</b></th>
				                            <th style="text-align: center; border-radius: 0px 21px 0px 0px;"><b>?????? ??????</b></th>
				                        </tr>
				                    </thead>
				                    <tbody>
				                        <c:forEach var="arr" items="${ adList }" varStatus="status">
											<fmt:parseNumber value="${arr.decisionDate.time / (1000*60*60*24)}" integerOnly="true" var="isDecisionDate"/>
				                        	<tr>
				                            	<td onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/adApply/detail?adCode=${ arr.adCode }'" style="text-align: center;"><c:out value="${ arr.companyName }"/></td>
				                            	<td onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/adApply/detail?adCode=${ arr.adCode }'" style="text-align: center;"><c:out value="${ arr.adWeek }"/>???</td>
				                            	<td onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/adApply/detail?adCode=${ arr.adCode }'" style="text-align: center;"><c:out value="${ arr.applyDate }"/></td>
				                            	<c:if test="${ arr.postYn eq 'N' && arr.stateCode eq '1' }">
				                          			<td style="text-align: center; color: red;">????????????</td>
				                          		</c:if>
				                          		<c:if test="${ arr.postYn eq 'N' && arr.stateCode eq '2' && isToday-isDecisionDate <= 3 }">
				                          			<td style="text-align: center; color: #45B99C;">????????????<button id="adPay" type="button" class="adPay${ arr.adCode }"></button></td>
				                          			<!-- ?????? 1??? ????????? ??????????????? ?????? ????????? ????????? ??????  -->
				                          			<script>
				                          			$j3(document).on("click", ".adPay${ arr.adCode }",function(){
													        var IMP = window.IMP; // ????????????
													        IMP.init('imp27572898'); 
													        var msg;
													        var adPrice = ${arr.adPrice};
													        var email = '<c:out value="${arr.companyEmail}"/>';
													        var name = '<c:out value="${arr.companyName}"/>';
													        var phone = '<c:out value="${arr.companyPhone}"/>';
													        var companyLocation = '<c:out value="${arr.companyLocation}"/>';
													        var adCode = '<c:out value="${arr.adCode}"/>'
													        
													        IMP.request_pay({
													            pg : 'kakaopay',
													            pay_method : 'card',
													            merchant_uid : 'merchant_' + new Date().getTime(),
													            name : '?????? 1??? ?????????',
													            amount : 100,
													            buyer_email : email,
													            buyer_name : name,
													            buyer_tel : phone,
													            buyer_addr : companyLocation,
													            buyer_postcode : '123-456'
													        }, function(rsp) {
													            if ( rsp.success ) {
													                //[1] ??????????????? ???????????? ????????? ?????? jQuery ajax??? imp_uid ????????????
													                jQuery.ajax({
													                    url: "/payments/complete",
													                    type: 'POST',
													                    dataType: 'json',
													                    data: {
													                        imp_uid : rsp.imp_uid
													                    }
													                }).done(function(data) {
													                    //[2] ???????????? REST API??? ?????????????????? ??? ?????????????????? ???????????? ??????
													                    if ( everythings_fine ) {
													                        msg = '????????? ?????????????????????.';
													                        msg += '\n??????ID : ' + rsp.imp_uid;
													                        msg += '\n?????? ??????ID : ' + rsp.merchant_uid;
													                        msg += '\?????? ?????? : ' + rsp.paid_amount;
													                        msg += '?????? ???????????? : ' + rsp.apply_num;
													                        
													                        alert(msg);
													                    } else {
													                    	alert("????????? ??????????????????.");
													                    	return;
													                    }
													                });
													                //????????? ????????? ?????????
													                
													                $j3.ajax({
											    			    		url:"${ pageContext.servletContext.contextPath }/user/update/first/adPayment",
											    				    	type:"POST",
											    				    	data:{
											    				    		adPrice : adPrice,
																	        companyEmail : email,
																	        companyName : name,
																	        comapnyPhone : phone,
																	        companyLocation : companyLocation,
											    			    		    adCode : adCode
											    				    	},
											    				    	success:function(data, textStatus, xhr){
											    				    		alert("?????? ?????????????????????!!\n???????????? ????????? ?????? ??????????????? ??????????????????.");
											    				    		location.replace("${pageContext.servletContext.contextPath}/user/select/ad/list")
											    				    	},
											    				    	error:function(xhr,status,error){
											    				    		console.log(error);
											    				    	}
											    				    });
											                
													                
													            } else {
													                msg = '????????? ?????????????????????.';
													                msg += '???????????? : ' + rsp.error_msg;
													                //????????? ????????? ?????????
													                <%-- location.href="<%=request.getContextPath()%>/order/payFail"; --%>
													                alert(msg);
													            }
													        });
													        
													    });
		    									</script>
				                          		</c:if>
				                          		<c:if test="${ arr.postYn eq 'Y' && today < arr.postStartDate && arr.stateCode eq '2' }">
				                          			<td style="text-align: center; color: orange;">???????????? ?????? ?????????</td>
				                          		</c:if>
				                          		<c:if test="${ arr.postYn eq 'N' && isToday-isDecisionDate > 3 && arr.stateCode eq '2' }">
				                          			<td style="text-align: center; color: lightgray;">????????????</td>
				                          		</c:if>
				                          		<c:if test="${ arr.postYn eq 'Y' && today >= arr.postStartDate && today <= arr.postEndDate && arr.stateCode eq '2' }">
				                          			<td style="text-align: center; color: blue;">?????????</td>
				                          		</c:if>
				                          		<c:if test="${ today > arr.postEndDate && arr.stateCode eq '2' && arr.postYn eq 'Y' }">
				                          			<td style="text-align: center; color: #fedd00;">????????????</td>
				                          		</c:if>
				                          		<c:if test="${ arr.stateCode eq '3' }">
				                          			<td style="text-align: center; color: lightgray;">????????????</td>
				                          		</c:if>
				                          		<c:if test="${ arr.stateCode eq '4' }">
				                          			<td style="text-align: center; color: lightgray;">????????????</td>
				                          		</c:if>
				                        	</tr>
				                        </c:forEach>
				                    </tbody>
				                </table>
		                	</div>
			                <!-- ??????????????? -->
							<div class="text-center">
								<ul class="pagination">
									<li>
										<c:if test="${paging.startPage != 1 }">
											<li><a href="${ pageContext.servletContext.contextPath }/user/select/ad/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
										</c:if>
										<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
											<c:choose>
												<c:when test="${p == paging.nowPage }">
													<li><a>${p }</a></li>
												</c:when>
												<c:when test="${p != paging.nowPage }">
													<li><a href="${ pageContext.servletContext.contextPath }/user/select/ad/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
												</c:when>
											</c:choose>
										</c:forEach>
										<c:if test="${paging.endPage != paging.lastPage}">
											<li><a href="${ pageContext.servletContext.contextPath }/user/select/ad/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
										</c:if>
									</li>
								</ul>
							</div>
	                	</c:if>
	                	
	                	<c:if test="${ type eq 'B' }">
		                	<div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 50px;">
			                	<table class="table" id="paytable" style="margin-bottom: 5px;">
				                    <thead>
				                        <tr style="background-color: #F1FAF8;">
				                            <th style="width:16%; text-align: center; border-radius: 21px 0px 0px 0px;"><b>?????? / ?????????</b></th>
				                            <th style="width:16%; text-align: center;"><b>?????? ??????</b></th>
				                            <th style="width:16%; text-align: center;"><b>?????? ??????</b></th>
				                            <th style="width:16%; text-align: center;"><b>?????? ?????? ??????</b></th>
				                            <th style="width:16%; text-align: center;"><b>?????? ?????? ??????</b></th>
				                            <th class="filtering" onclick="filtering();" style="width:20%; text-align: center; border-radius: 0px 21px 0px 0px;"><b>?????? ??????</b><img src="${ pageContext.servletContext.contextPath }/resources/images/filter.png" style="width:15px; margin-left:10px;"></th>
				                        </tr>
				                    </thead>
				                    <tbody>
				                        <c:forEach var="arr" items="${ adList2 }">
				                        	<c:forEach var="arr2" items="${ adPaymentList }">
					                        	<c:if test="${ today > arr.postEndDate && empty arr.payDate2nd }">
					                        		<c:if test="${ arr.adCode == arr2.adCode }">
					                        			<c:if test="${ arr2.morePayAmount != '0' }">
									                        <tr class="morepay">
									                            <td style="text-align: center;"><c:out value="${ arr.companyName }"/></td>
									                            <td style="text-align: center;"><c:out value="${ arr.adWeek }"/>???</td>
									                            <td style="text-align: center;"><c:out value="${ arr2.clickCount }"/></td>
									                            <td style="text-align: center;"><c:out value="${ arr.postEndDate }"/></td>
									                            <td style="text-align: center;"><c:out value="${ arr2.morePayAmount }"/>???</td>
									                            <td class="class" style="text-align: center; color: red;">???????????? ?????????<button onclick="morePay(this)" class="${ arr.adCode }"></button></td>
								                            </tr>
							                            </c:if>
							                            <c:if test="${ arr2.morePayAmount == '0' }">
									                        <tr class="completepay">
									                            <td style="text-align: center;"><c:out value="${ arr.companyName }"/></td>
									                            <td style="text-align: center;"><c:out value="${ arr.adWeek }"/>???</td>
									                            <td style="text-align: center;"><c:out value="${ arr2.clickCount }"/></td>
									                            <td style="text-align: center;"><c:out value="${ arr.postEndDate }"/></td>
									                            <td style="text-align: center;"><c:out value="${ arr2.morePayAmount }"/>???</td>
									                            <td style="text-align: center; color: #45B99C;">?????? ??????</td>
							                            	</tr>
							                            </c:if>
						                            </c:if>
					                            </c:if>
					                            <c:if test="${ today > arr.postEndDate && !empty arr.payDate2nd }">
					                            	<c:if test="${ arr.adCode == arr2.adCode }">
								                        <tr class="completepay">
								                            <td style="text-align: center;"><c:out value="${ arr.companyName }"/></td>
								                            <td style="text-align: center;"><c:out value="${ arr.adWeek }"/>???</td>
								                            <td style="text-align: center;"><c:out value="${ arr2.clickCount }"/></td>
								                            <td style="text-align: center;"><c:out value="${ arr.postEndDate }"/></td>
								                            <td style="text-align: center;"><c:out value="${ arr2.morePayAmount }"/>???</td>
								                            <td style="text-align: center; color: #45B99C;">?????? ??????</td>
							                            </tr>
						                            </c:if>
					                            </c:if>
					                            <c:if test="${ !empty arr.cancelApplyDate && arr.postStartDate <= arr.cancelApplyDate && arr.cancelApplyDate <= arr.postEndDate && empty arr.payDate2nd }">
					                            	<c:if test="${ arr.adCode == arr2.adCode }">
					                        			<c:if test="${ arr2.morePayAmount != '0' }">
									                        <tr class="morepay">
									                            <td style="text-align: center;"><c:out value="${ arr.companyName }"/></td>
									                            <td style="text-align: center;"><c:out value="${ arr.adWeek }"/>???</td>
									                            <td style="text-align: center;"><c:out value="${ arr2.clickCount }"/></td>
									                            <td style="text-align: center;"><c:out value="${ arr.postEndDate }"/></td>
									                            <td style="text-align: center;"><c:out value="${ arr2.morePayAmount }"/>???</td>
									                            <td class="class" style="text-align: center; color: red;">???????????? ?????????<button onclick="morePay(this)" class="${ arr.adCode }"></button></td>
								                            </tr>
							                            </c:if>
							                            <c:if test="${ arr2.morePayAmount == '0' }">
									                        <tr class="completepay">
									                            <td style="text-align: center;"><c:out value="${ arr.companyName }"/></td>
									                            <td style="text-align: center;"><c:out value="${ arr.adWeek }"/>???</td>
									                            <td style="text-align: center;"><c:out value="${ arr2.clickCount }"/></td>
									                            <td style="text-align: center;"><c:out value="${ arr.postEndDate }"/></td>
									                            <td style="text-align: center;"><c:out value="${ arr2.morePayAmount }"/>???</td>
									                            <td style="text-align: center; color: #45B99C;">?????? ??????</td>
							                            	</tr>
							                            </c:if>
						                            </c:if>
					                            </c:if>
					                            <c:if test="${ !empty arr.cancelApplyDate && arr.postStartDate <= arr.cancelApplyDate && arr.cancelApplyDate <= arr.postEndDate && !empty arr.payDate2nd }">
					                            	<c:if test="${ arr.adCode == arr2.adCode }">
								                        <tr class="completepay">
								                            <td style="text-align: center;"><c:out value="${ arr.companyName }"/></td>
								                            <td style="text-align: center;"><c:out value="${ arr.adWeek }"/>???</td>
								                            <td style="text-align: center;"><c:out value="${ arr2.clickCount }"/></td>
								                            <td style="text-align: center;"><c:out value="${ arr.postEndDate }"/></td>
								                            <td style="text-align: center;"><c:out value="${ arr2.morePayAmount }"/>???</td>
								                            <td style="text-align: center; color: #45B99C;">?????? ??????</td>
							                            </tr>
						                            </c:if>
					                            </c:if>
				                        	</c:forEach>
				                        </c:forEach>
				                    </tbody>
				                </table>
		                	</div>
	                	</c:if>
					</div>
            	</div>
            </section>
            
            <!-- ?????? 2??? ???????????? -->
            <form action="${ pageContext.servletContext.contextPath }/user/update/ad/morePay" method="post">
	            <div id="taxBill" class="overlay">
	                <div class="popup">
	                	<a href="" class="close">&times;</a>
	                    <p style="font-size: 30px; text-align: center; font-weight:bold; margin-top: 40px;">
	                     	?????? 2??? ?????? ??????<br>
	                    </p>
	                    <p style="font-size: 18px; text-align: left; padding-bottom: 10px; margin-top: 30px; line-height:150%;">
	                     	?????? ?????? ???<aa style="font-size: 13px;"> (?????? ??????????????? ??????)</aa> <b style="color: red;">7??? ??????</b>??? ????????? ??????????????? ?????? ????????? ??????????????? ?????????.
	                    </p>
	                    <p style="font-size: 20px; text-align: left; padding-bottom: 10px; margin-top: 15px;">
	                     	???????????? : 326-15622-874  ???????????????<br><br>
	                     	????????? : ???????????? ??????
	                    </p>
	                    <p style="font-size: 15px; text-align: center; padding-bottom: 10px; margin-top: 20px; color:red;">
	                     	????????? ???????????? ???????????? ?????? ????????? ???????????????<br>
	                     	?????? ???????????? ????????? ???????????? ?????? ??? ?????? ????????? ???????????????
	                    </p>
	                    <input type="hidden" value="" name="adCode" id="morePayAdCode">
	                    <div style="text-align: center; margin-top: 30px;"><button class="btn_submit">??????</button></div>
	                </div>
	            </div>
            </form>
            
            <div id="notice" class="overlay">
                <div class="popup">
                    <p style="font-size: 30px; text-align: center; font-weight:bold; margin-top: 40px;">
                     	?????? 2??? ???????????? ??????<br><br>
                    </p>
                    <p style="font-size: 18px; text-align: left; padding-bottom: 10px; margin-top: 20px; line-height:150%;">
                     	?????? ?????? ???<aa style="font-size: 13px;"> (?????? ??????????????? ??????)</aa> <b style="color: red;">7??? ??????</b>??? ????????? ??????????????? ?????? ????????? ??????????????? ?????????.
                    </p>
                    <p style="font-size: 20px; text-align: left; padding-bottom: 10px; margin-top: 15px;">
                     	???????????? : 326-15622-874  ???????????????<br><br>
                     	????????? : ???????????? ??????
                    </p>
                    <p style="font-size: 10px; text-align: center; margin-top: 20px;">
                    	???????????????????????? ?????????????????? 10%??? ????????????????????????.<br>
                    </p>
                    <p style="font-size: 10px; text-align: center;">
                    	?????????????????? ????????? ??? ???????????? ???????????? ?????????, ??? ???????????? ????????? ??? ?????? ????????? ??????<br>
                    </p>
                    <p style="font-size: 10px; text-align: center; padding-bottom: 10px;">
                    	?????????????????? ???????????? ?????? ???????????? ????????? ???????????????.
                    </p>
                    <div style="text-align: center; margin-top: 30px;"><button class="btn_submit" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/ad/list?type=B'">??????</button></div>
                </div>
            </div>
            
            <script>
				let targetLink = document.querySelectorAll('.tab span');
				for(var i = 0; i < targetLink.length; i++){
					targetLink[i].classList.remove('active');
					if(i == ${ requestScope.num}){
						targetLink[i].classList.add('active');
					}
				};
				
				/* ?????? ?????? ????????? */
				var filterNo = 0;
				function filtering() {
					
					filterNo++;
					
					if(filterNo > 2) {
						filterNo = 1;
					}
					
					if(filterNo == 1) {
						$(".completepay").hide();
						$(".morepay").show();
					} else {
						$(".morepay").hide();
						$(".completepay").show();
					}
					
				}
				
				function morePay (code) {
					
					let adCode = code.className;
					
					document.getElementById("morePayAdCode").value = adCode;
					
					location.href = '#taxBill';
				}
				
			</script>

            
            <!-- ????????? ?????? -->
            <jsp:include page="../../common/banner.jsp"/>

            <!-- ?????? -->
            <jsp:include page="../common/footer.jsp"/>
        </div>
        
</html>