<%@page import="common.StringProcess"%>
<%@page import="model.bean.MatHang"%>
<%@page import="model.bean.GioHang"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/view/head_tag.jsp">
	<jsp:param value="Giỏ hàng" name="title" />
</jsp:include>

<body>

	<%@include file="/WEB-INF/view/header.jsp"%>

	<div class="main">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-8 col-md-9 col-lg-9"
					style="background-color: white; padding-bottom: 20px; border-radius: 4px;">
					<table class="table">
						<thead>
							<tr>
								<th>Sản phẩm</th>
								<th>Số lượng</th>
								<th>Giá</th>
								<th></th>
							</tr>
						</thead>
							<c:set var="tongTien" value="${0}"></c:set>
							<c:forEach items="${gioHang}" var="a">
								<c:forEach items="${tenMH}" var="b">
									<c:if test="${a.idMH.equals(b.idMH)}">
										<tr>
											<td>
												<a href="ChiTietSanPhamServlet?id=${a.idMH}"><img
													src="DisplayImageServlet?id=${a.idMH}"
													class="anhGioHang" alt="">
													${b.tenMH}
												</a>
											</td>
											<td>
												<span> <input type="number" min="1"
													value="${a.soLuong}" class="form-control"
													style="width: 56px; height: 25px; font-weight: bold; color: #ff00009e; padding-right: 0px; text-align: center;"
													id="${b.idMH}">
												</span>
											</td>
											<td>
												<fmt:formatNumber type="number" minIntegerDigits="6" value="${a.gia}"/> đ
											</td>
											<td style="width: 100px;">
												<div class="Sua" style="float: left; width: 30px; height: 25px; background-color: #00b6f0; border-radius: 3px">
													<a id="${b.idMH}">
														<span class="glyphicon glyphicon-pencil" style="padding: 4px 9px; color: white;"></span>
													</a>
												</div>
												<div class="Xoa" style="float: right; width: 30px; height: 25px; background-color: #ff424e; border-radius: 3px">
													<a id="${b.idMH}">
														<span
														class="glyphicon glyphicon-trash" style="padding: 4px 8px; color: white;">
														</span>
													</a>
												</div>
											</td>
										</tr>
									</c:if>
								</c:forEach>
								<c:set var="tongTien" value="${tongTien +a.gia}"></c:set>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- end trai -->
				
				<script type="text/javascript">
					$(document).ready(function() {
						$(".table .Xoa a").click(function() {
							var idMH = $(this).attr('id')
							$.ajax({
								url : 'GioHangServlet',
								type : 'POST',
								dataType : 'json',
								data : {
									idMH : idMH,
									key : "DELETE",
								},
								success : function(data) {
									window.location.reload();
									 alert(data); 
								}
							})
						});

						$(".table .Sua a").click(function() {
							var idMH = $(this).attr('id')
							$.ajax({
								url : 'GioHangServlet',
								type : 'POST',
								dataType : 'json',
								data : {
									idMH : idMH,
									soLuong : $("#" + idMH + "").val(),
									key : "EDIT",
								},
								success : function(data) {
									window.location.reload();
									 alert(data); 
								}
							})
						});
					});
				</script>

				<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
					<div class="row" style="padding-left: 20px;">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"
							style="background-color: white; padding: 15px; border-radius: 4px;">
							<p style="font-size: 15px; font-weight: 200;">
								Tạm Tính : <span
									style="font-size: 18px; float: right; font-weight: 400"
									id="tamTinh"> 
									<fmt:formatNumber type="number" minIntegerDigits="6" value="${tongTien}"/> đ
								</span>
							</p>
							<hr>
							<p style="font-size: 15px; font-weight: 200;">
								Thành Tiền : <span
									style="font-size: 22px; float: right; color: #ff424e; font-weight: 400"
									id="thanhTien">
									<fmt:formatNumber type="number" minIntegerDigits="6" value="${tongTien}"/> đ
								</span>
							</p>
							<p style="font-size: 12px; font-weight: 200;">
								<span style="float: right;">(Đã bao gồm thuế VAT)</span>
							</p>
							<!-- <a href="#" style="background-color: #ff7f00e3; border-radius: 7px; width: 100%;display: block;text-align: center;padding-top:5px;padding-bottom: 5px;font-size: 20px; color: white;">THANH TOÁN</a> -->

						</div>
					</div>

					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<c:choose>
								<c:when test="${not empty tenDangNhap}">
									<c:choose>
										<c:when test="${not empty gioHang}">
											<a href="DiaChiDatHangServlet"
												style="background-color: #ff424e; border-radius: 4px; width: 103%; display: block; text-align: center; padding-top: 7px; padding-bottom: 7px; font-size: 15px; color: white; margin-left: 5.5px; margin-top: 15px;">Tiến
												hành đặt hàng</a>
										</c:when>
										<c:otherwise>
											<a data-toggle="modal" href='#modalThongBao'
												style="background-color: #ff424e; border-radius: 4px; width: 103%; display: block; text-align: center; padding-top: 7px; padding-bottom: 7px; font-size: 15px; color: white; margin-left: 5.5px; margin-top: 15px;">Tiến
												hành đặt hàng</a>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<a data-toggle="modal" href="#modal-id"
										style="background-color: #ff424e; border-radius: 4px; width: 103%; display: block; text-align: center; padding-top: 7px; padding-bottom: 7px; font-size: 15px; color: white; margin-left: 5.5px; margin-top: 15px;">Tiến
										hành đặt hàng</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<!-- end phải -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->


		<div class="container">
			<p class="tieude">SẢN PHẨM ĐÃ XEM</p>
			<div class="row"
				style="background-color: white; padding-top: 15px; border-radius: 4px; height: 260px">
				<div class="owl-carousel owl-theme">
					<c:if test="${not empty listDAXEM}">
						<c:forEach items="${listDAXEM}" var="aa">
							<div class="col-md-2">
								<div class="thumbnail">
									<a href="ChiTietSanPhamServlet?id=${aa.idMH}"> <img
										src="DisplayImageServlet?id=${aa.idMH}"
										class="img img-responsive" style="height: 70%; width: 100%;"
										alt="">
										<div class="tenSPGiaBan">
											<p class="tenSP">${aa.tenMH}</p>
											<b><fmt:formatNumber type="number" minIntegerDigits="6" value="${aa.giaBan}"></fmt:formatNumber> đ<span
												style="color: red; padding-left: 30px;">
													<c:if test="${aa.giamGia != 0 }">
														- ${aa.giamGia} %
													</c:if>
												</span></b>

										</div>
									</a>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
			<!-- end sản phẩm khuyến mãi -->
		</div>
		<!-- end container -->
	</div>
	<!-- end main -->

	<script>
	$('.owl-carousel').owlCarousel({
	    loop:true,
	    margin:20,
	    responsiveClass:true,
	    responsive:{
	        0:{
	            items:1,
	            nav:true
	        },
	        600:{
	            items:3,
	            nav:false
	        },
	        1000:{
	            items:5,
	            nav:true,
	            loop:false
	        }
	    }
	})
		owl.on('mousewheel', '.owl-stage', function(e) {
			if (e.deltaY > 0) {
				owl.trigger('next.owl');
			} else {
				owl.trigger('prev.owl');
			}
			e.preventDefault();
		});
	</script>
	<%@include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>