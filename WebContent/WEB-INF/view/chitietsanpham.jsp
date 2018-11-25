<%@page import="common.StringProcess"%>
<%@page import="model.bean.MatHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/view/head_tag.jsp">
	<jsp:param value="${sanPham.tenMH}" name="title" />
</jsp:include>

<body>

	<%@include file="/WEB-INF/view/header.jsp"%>

	<div class="main">
		<div class="container">
			<div class="row"
				style="background-color: white; padding-top: 25px; border-radius: 4px;">
				<div class="col-md-4" style="height: 300px; background-size: cover;">
					<img src="DisplayImageServlet?id=${sanPham.idMH}"
						style="margin: 0 auto; display: block; position: relative; padding-top: 25px;"
						alt="">
				</div>
				<!-- end ảnh -->
				<div class="col-md-8">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<h4>${sanPham.tenMH}</h4>
							<p>
								Thương hiệu : <b
									style="color: #007ff0; padding-right: 20px; font-weight: 400">Roza</b><span>SKU:
									1235648975565</span>
							</p>
							<b style="color: red; font-size: 20px">
							 <fmt:formatNumber type="number" maxIntegerDigits="9" value="${sanPham.giaBan}" />đ
							</b>
							<hr style="margin-top: 10px;">
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-7 col-lg-7">

							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<ul style="margin-left: 25px;">
										<li>${sanPham.moTa}</li>
									</ul>
								</div>
							</div>
							<hr>

							<!-- <div class="row">
								<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
									<img src="anh/24h.png" alt="">
								</div>
								<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
									<p><b style="font-weight: 600;">Bạn muốn nhận hàng trước 10h00 sáng ngày mai?</b></p>
									<p>Đặt hàng trong 13 giờ tới và chọn giao hàng 2h ở bước thanh toán -<a href="" style="color: #337ab7;">Xem chi tiết</a></p>
								</div>
							</div> -->

							<div class="khoi1">
								<img src="anh/24h.png" style="float: left;" alt="">
								<div class="chu">
									<p>
										<b style="font-weight: 600;">Bạn muốn nhận hàng trước
											10h00 sáng ngày mai?</b>
									</p>
									<p>
										Đặt hàng trong 13 giờ tới và chọn giao hàng 2h ở bước thanh
										toán -<a href="" style="color: #337ab7;">Xem chi tiết</a>
									</p>
								</div>
							</div>

							<div class="khoi2">
								<img src="anh/ic.png" style="width: 30px; height: 30px;" alt="">
								<div class="chu">
									<p>
										<b style="font-weight: 600;">Bạn muốn gói quà và gửi
											thiệp?</b> Hãy chọn hình thức gói quà ở bước thanh toán, Chúng
										tôi sẽ thực hiện gói quà và in thiệp với thông điệp riêng của
										bạn! -<a href="" style="color: #337ab7;">Xem chi tiết</a>
									</p>
								</div>
							</div>

							<div class="datMua">
								<div class="row">
									<div class="col-xs-4 col-sm-4 col-md-3 col-lg-3">
										<p style="padding-left: 2px;">Số Lượng :</p>
										<input type="number" min="1" value="1" class="form-control"
											style="width: 56px; height: 25px; margin-top: -7px; font-weight: bold; color: #ff00009e; padding-right: 0px; text-align: center;"
											id="so_luong">
									</div>
									<div class="col-xs-8 col-sm-8 col-md-9 col-lg-9">
										<a href="#" id="ahihi" class="btn btn-primary"
											style="background-color: #e81111a8; padding: 11px 27px; border: none; color: white; margin-top: 5px;"><span
											class="glyphicon glyphicon-shopping-cart"></span> CHỌN MUA</a>
											<p id="checkLogin"></p>
									</div>
								</div>
								<hr>
							</div>

						</div>
						<!-- end row trái -->

						<script type="text/javascript">
							$(document).ready(function() {
								$("#ahihi").click(function() {
									var idMH = ${sanPham.idMH};
									$.ajax({
										url : 'GioHangServlet',
										type : 'POST',
										dataType : 'json',
										data : {
											idMH : idMH,
											soLuong : $("#so_luong").val(),
											key: "ADD",
										},
										success : function(data) {
											 alert(data);
											 window.location.reload();
										}
									})
								});
							});
						</script>

						<div class="col-xs-12 col-sm-5 col-md-5 col-lg-5">
							<div class="row" style="padding-left: 20px;">
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<div
										style="width: 200px; height: 124px; border: 1px solid #e4e2e2; border-radius: 5px; padding: 10px 10px">
										<p
											style="font-size: 18px; color: #ffa7009e; margin-bottom: 0px;">
											<span style="top: 5px;" class="glyphicon glyphicon-briefcase"></span><b
												style="font-weight: 600; font-size: 14px; color: #007ff0; padding-left: 10px">RoZa
												Cosmetics</b>
										</p>
										<p style="padding-left: 20px; font-size: 12px;">Cam kết
											chính hiệu 100%</p>
										<p style="font-size: 14px; margin-bottom: 0px;">
											<span style="color: #ffa7009e"
												class="glyphicon glyphicon-usd"></span><b
												style="font-weight: 600; padding-left: 15px">Roza hoàn
												tiền 111% </b>
										</p>
										<p style="padding-left: 20px; font-size: 14px;">Nếu phát
											hiện hàng giả</p>
									</div>


									<div
										style="width: 200px; height: 124px; border: 1px solid #e4e2e2; border-radius: 5px; padding: 10px 10px; margin-top: 20px;">
										<p style="font-size: 15px; margin-bottom: 0px;">
											<span class="glyphicon glyphicon-earphone"></span><b
												style="font-weight: 600; font-size: 14px; padding-left: 3px; font-weight: 600;">Liên
												hệ</b>
										</p>
										<p
											style="padding-left: 18px; font-size: 13px; margin-bottom: 0px">Hotline
											đặt hàng 1800 6963</p>

										<p style="padding-left: 18px; font-size: 11px;">(Miễn phí,
											8-21h cả T7, CN)</p>

										<p style="font-size: 15px; margin-bottom: 0px;">
											<span class="glyphicon glyphicon-send"></span><b
												style="font-weight: 400; font-size: 14px; padding-left: 3px;">Email:
												hotro@roza.vn</b>
										</p>
									</div>

								</div>
							</div>
						</div>
						<!-- end row phải -->
					</div>
				</div>
			</div>
		</div>
		<!-- end container -->

		<div class="container">
			<p class="tieude">SẢN PHẨM LIÊN QUAN</p>
			<a href="#" style="padding-left: 73%; display: inline-block;"
				class="xemThem">Xem Thêm <span class="fa fa-angle-double-right"></span></a>
			<div class="row"
				style="background-color: white; padding-top: 15px; border-radius: 4px;">
				<div class="owl-carousel owl-theme">
					<div class="col-md-2">
						<div class="thumbnail">
							<a href="#"> <img src="anh/dd.jpg" alt="">
								<div class="tenSPGiaBan">
									<p class="tenSP">Tên sản phẩm 1</p>
									<b>Giá d</b>
								</div>
							</a>
						</div>
					</div>

					<div class="col-md-2">
						<div class="thumbnail">
							<a href="#"> <img src="anh/dd.jpg" alt="">
								<div class="tenSPGiaBan">
									<p class="tenSP">Tên sản phẩm 2</p>
									<b>Giá d</b>
								</div>
							</a>
						</div>
					</div>


					<div class="col-md-2">
						<div class="thumbnail">
							<a href="#"> <img src="anh/dd.jpg" alt="">
								<div class="tenSPGiaBan">
									<p class="tenSP">Tên sản phẩm 3</p>
									<b>Giá d</b>
								</div>
							</a>
						</div>
					</div>


					<div class="col-md-2">
						<div class="thumbnail">
							<a href="#"> <img src="anh/dd.jpg" alt="">
								<div class="tenSPGiaBan">
									<p class="tenSP">Tên sản phẩm 4</p>
									<b>Giá d</b>
								</div>
							</a>
						</div>
					</div>


					<div class="col-md-2">
						<div class="thumbnail">
							<a href="#"> <img src="anh/dd.jpg" alt="">
								<div class="tenSPGiaBan">
									<p class="tenSP">Tên sản phẩm 5</p>
									<b>Giá d</b>
								</div>
							</a>
						</div>
					</div>

					<div class="col-md-2">
						<div class="thumbnail">
							<a href="#"> <img src="anh/dd.jpg" alt="">
								<div class="tenSPGiaBan">
									<p class="tenSP">Tên sản phẩm 6</p>
									<b>Giá d</b>
								</div>
							</a>
						</div>
					</div>
				</div>
				<!-- end sản phẩm liên quan -->
			</div>
		</div>
		<!-- end container -->
	</div>
	<!-- end main -->





	<script>
		var owl = $('.owl-carousel');
		owl.owlCarousel({
			loop : true,
			// nav:true,
			margin : 20,
			responsive : {
				0 : {
					items : 1
				},
				600 : {
					items : 3
				},
				1000 : {
					items : 5
				}
			}
		});
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