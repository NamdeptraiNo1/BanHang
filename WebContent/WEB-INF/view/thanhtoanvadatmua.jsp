<%@page import="model.bean.HinhThucThanhToan"%>
<%@page import="model.bean.MatHang"%>
<%@page import="common.StringProcess"%>
<%@page import="model.bean.GioHang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.NguoiDatHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/view/head_tag.jsp">
	<jsp:param value="Thanh toán và đặt mua" name="title" />
</jsp:include>
<body>
	<header> <nav class="navbar navbar-default" role="navigation"
		style="background-color: white; border-radius: 4px;">
	<div class="container-fluid">
		<div class="row">
			<a href="TrangChuServlet"><img src="anh/logo.png" alt=""
				class="logo" style="width: 240px; float: left;"></a>
			<div class="col-xs-12 col-sm-12 col-md-10 col-lg-9">
				<div class="row text-center">
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
						<p style="padding-bottom: 10px">Đăng Nhập</p>
						<p class="so">1</p>
						<p
							style="height: 7px; background-color: #00b6f0; width: 50%; float: right;"></p>
					</div>

					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
						<p style="padding-bottom: 10px">Địa Chỉ Giao Hàng</p>
						<p class="so">2</p>
						<p style="height: 7px; background-color: #00b6f0;"></p>

					</div>

					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
						<p style="padding-bottom: 10px">Thanh Toán & Đặt Mua</p>
						<p class="so">3</p>
						<p
							style="height: 7px; background-color: #00b6f0; width: 50%; float: left;"></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	</nav> </header>
	<!-- end menu -->
	<c:choose>
		<c:when test="${empty idDDH}">
			<div class="container">
				<b style="font-size: 17px; margin-bottom: 12px; display: block;">1.Chọn
					hình thức giao hàng</b>
				<div class="row">
					<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
						<form
							action="ThanhToanVaDatMuaServlet?idNDH=${nguoiDatHang.idNDH}"
							method="POST">
							<div class="row"
								style="border: 1px solid #75686838; margin-right: 20px; margin-left: 2px; padding: 20px; border-radius: 3px; font-size: 15px">
								<div class="radio">
									<label> <input type="radio" name="" id="input" value=""
										checked="checked"> Giao hàng tiêu chuẩn (dự kiến giao
										hàng vào Thứ sáu, 09/11/2018): miễn phí
									</label>
								</div>

							</div>
							<b
								style="font-size: 17px; margin-bottom: 12px; display: block; margin-top: 10px">2.Chọn
								hình thức thanh toán</b>
							<div class="row"
								style="border: 1px solid #75686838; margin-right: 20px; padding: 20px; font-size: 15px; border-radius: 3px; margin-left: 2px">
								<c:forEach items="${hTTT}" var="h">
									<div class="radio">
										<label> <input type="radio" name="hTTT"
											value="${h.maHTTT}">${h.tenHTTT}
										</label>
									</div>
								</c:forEach>
							</div>

							<div class="row" style="margin-top: 25px;">
								<div class="col-xs-3 col-sm-3 col-md-4 col-lg-3"></div>
								<div class="col-xs-6 col-sm-6 col-md-4 col-lg-6 text-center">
									<input type="submit" class="btn btn-default" 
										style="width: 100%; background-color: #f30707d4; color: white; font-size: 20px;"
										name="datMua" id="datMua" type="submit"disabled="disabled" value="Đặt Mua">
									<p>(Xin vui lòng kiểm tra lại đơn hàng trước khi Đặt Mua)</p>
								</div>
								<div class="col-xs-3 col-sm-3 col-md-4 col-lg-3"></div>
							</div>
						</form>
						
						<script type="text/javascript">
							/* $(':radio:not(:checked)').attr('disabled', true); */
							$(':radio').change(function(){
							    $('#datMua').attr("disabled", false);
							});
						</script>

					</div>
					<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
						<div class="row"
							style="border: 1px solid #75686838; padding: 15px; margin-bottom: 25px; border-radius: 3px;">
							<p>
								Địa chỉ giao hàng<span style="float: right;"><a
									class="btn btn-default" href="DiaChiDatHangServlet"
									role="button" style="display: block; margin-top: -7px;">Sửa</a></span>
							</p>
							<hr>
							<b>${nguoiDatHang.tenNDH}</b>
							<p style="margin-bottom: 0px;">${nguoiDatHang.diaChi}</p>
							<p>T: ${nguoiDatHang.sDT}</p>
						</div>
						<div class="row"
							style="border: 1px solid #75686838; padding: 15px; border-radius: 3px;">

							<p>
								Đơn hàng (${soLuongGH} sản phẩm)<span style="float: right;"><a
									class="btn btn-default" href="GioHangServlet?key=<%="SHOW"%>"
									role="button" style="display: block; margin-top: -7px;">Sửa</a></span>
							</p>
							<hr>
							<c:set var="tongTien" value="${0}" />
							<c:forEach items="${listGH}" var="a">
								<c:forEach items="${tenMH}" var="b">
									<c:if test="${a.idMH.equals(b.idMH)}">
										<a href="ChiTietSanPhamServlet?id=${a.idMH}"
											style="color: #00a4d8;"> <b
											style="color: black; padding-right: 5px">${a.soLuong}x</b>
											${b.tenMH}<span style="float: right; color: black"><fmt:formatNumber
													type="number" minIntegerDigits="6" value="${a.gia}" /> đ</span></a>
										<p>
											<b>Roza</b>
										</p>
										<hr>
									</c:if>
								</c:forEach>
								<c:set var="tongTien" value="${tongTien + a.gia}" />
							</c:forEach>
							<p>
								Tạm Tính <span style="float: right;"><fmt:formatNumber
										type="number" minIntegerDigits="6" value="${tongTien}" /> đ</span>
							</p>
							<p>
								Phí vận chuyển <span style="float: right;">0đ</span>
							</p>
							<div style="border-top: 2px solid gray; padding-top: 15px;">
								<b style="font-size: 14px;">Thành tiền <span
									style="float: right; font-size: 17px; color: red;"><fmt:formatNumber
											type="number" minIntegerDigits="6" value="${tongTien}" /> đ</span></b>
							</div>
						</div>
					</div>
				</div>

			</div>
		</c:when>
		<c:otherwise>
			<div class="container-fluid">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"></div>
					<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8"
						style="background-color: white; border-radius: 4px; padding: 15px;">
						<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
							<img src="anh/icon1.png" class="img-responsive" alt="Image">
						</div>
						<div class="col-xs-12 col-sm-12 col-md-10 col-lg-10">
							<p style="color: red; font-weight: 500;">Cảm ơn các bạn đã
								mua hàng của chúng tôi !</p>
							<p>Mã số đơn hàng của bạn:</p>
							<p
								style="padding: 10px 40px; background-color: #58b712; display: inline-block; color: white;">${idDDH}</p>
							<p>
								Bạn có thể xem lại <a href="UserServlet?idDDH=${idDDH}" style="color: #007FF0;">đơn
									hàng của tôi</a>
							</p>
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-1 col-lg-1">
									<img src="anh/ico2.png" class="img-responsive" alt="Image">
								</div>
								<div class="col-xs-12 col-sm-12 col-md-11 col-lg-11"
									style="padding-left: 0px">Thời gian dự kiến giao hàng
									trước 10:00 ngày mai</div>
							</div>
							<p>Thông tin chi tiết về đơn hàng đã được gửi đến địa chỉ
								mail . Nếu không tìm thấy vui lòng kiểm
								tra trong hộp thư Spam hoặc Junk Folder.</p>
							<div class="col-xs-12 col-sm-12 col-md-11 col-lg-11"
								style="border: 1px solid #f1efef; border-radius: 4px; background: url(anh/ico13.png) no-repeat 7px 14px; margin-top: 10px; padding: 10px 45px; margin-left: 1px;background-color: #f8f7f7;">
								<b style="font-weight: 300px">Nhằm giúp việc xử lý đơn hàng chính xác hơn, chúng tôi sẽ gọi
								điện cho bạn để xác nhận đơn hàng.</b>
							</div>

						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"></div>
				</div>
			</div>
			<script type="text/javascript">
				$(document).ready(function() {
					$('.footer').css({
						"margin-top" : "140px"
					});

				});
			</script>
		</c:otherwise>
	</c:choose>

	<footer class="footer"
		style="background-color: #eae6e67d; color: black;margin-top: 15px;">
	<div class="container text-center" style="padding: 15px;">
		<div class="row">
			<a style="font-size: 25px; color: #807d7d"
				class="fa fa-facebook-square"></a> <a
				style="font-size: 25px; color: #807d7d"
				class="fa fa-google-plus-square"></a> <a
				style="font-size: 25px; color: #807d7d" class="fa fa-twitter-square"></a>
		</div>
		<div class="row" style="font-size: 13px">© 2018 - Bản quyền
			thuộc NamHS</div>
	</div>
	</footer>
</body>
</html>