<%@page import="model.bean.NguoiDatHang"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/view/head_tag.jsp">
	<jsp:param value="Địa chỉ mua hàng" name="title" />
</jsp:include>
<body>
	<header> <nav class="navbar navbar-default" role="navigation"
		style="background-color: white; border-radius: 4px;">
	<div class="container-fluid">
		<div class="row">
			<a href="TrangChuServlet"><img src="anh/logo.png" alt="" class="logo"
				style="width: 240px; float: left;"></a>
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
						<p style="height: 7px; background-color: #00b6f0; width: 50%; float: left;"></p>

					</div>

					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
						<p style="padding-bottom: 10px">Thanh Toán & Đặt Mua</p>
						<p class="so" style=" background-color: white; color: black;border: 1px solid gray;">3</p>
						<!-- <p
							style="height: 7px; background-color: #00b6f0; width: 50%; float: left;"></p> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	</nav> </header>
	<!-- end menu -->

	<div class="container">
		<div class="row">
			<b style="font-size: 17px;">2. Địa chỉ giao hàng</b>
		</div>
		<div class="diachi">
			<div class="row">
				<p>Chọn đại chỉ giao hàng có săn bên dưới:</p>

				<c:forEach items="${listNDH}" var="list">
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6"
						style="border: 1px dotted #10da35; background-color: white; margin-bottom: 15px; padding: 10px;">
						<b>${list.tenNDH}</b>
						<p style="margin-bottom: 0px">Địa chỉ: ${list.diaChi}</p>
						<p>Điện thoại :${list.sDT}</p>
						<a class="btn btn-info"
							href="ThanhToanVaDatMuaServlet?id=${list.idNDH}&key=<%="TAOTHANHTOAN" %>">Giao
							đến đại chỉ này</a>
						<button type="button" class="btn btn-default" id="${list.idNDH}">Sửa</button>

						<a href="DiaChiDatHangServlet?id=${list.idNDH}&key=<%="XOA"%>"
							class="btn btn-default" id="btnXoa">Xóa</a>
					</div>
				</c:forEach>
			</div>
			<div class="row">
				<p>Bạn muốn giao đến địa chỉ khác? <a id="themDiaChiMoi"
					href="#" style="color: #00b6f0;">Thêm địa chỉ mới</a>
				</p>
			</div>
		</div>
	</div>

	<form action="DiaChiDatHangServlet?id=<%="THEMDIACHI"%>" method="POST">
		<div class="themDiaChi">
			<div class="container">
				<div class="row"
					style="background-color: white; padding-top: 15px; border-radius: 4px; padding-bottom: 15px;">
					<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						<table style="width: 100%">
							<tbody>
								<tr>
									<td>Họ Tên</td>
									<td><input type="text" name="hoTen" class="form-control"
										value="" title="" placeholder="Nhập họ tên">
										<p></p></td>
									<!-- required="required" pattern="" -->
								</tr>
								<tr>
									<td>Điện thoại di động</td>
									<td><input type="text" name="dienThoai"
										class="form-control" value="" title=""
										placeholder="Nhập số điện thoại">
										<p></p></td>
								</tr>

								<tr>
									<td>Tinh/Thành phố</td>
									<td><input type="text" name="tinhThanhPho"
										class="form-control" value="" title=""
										placeholder="Nhập tỉnh/thành phố">
										<p></p></td>
								</tr>

								<tr>
									<td>Quận/Huyện</td>
									<td><input type="text" name="quanHuyen"
										class="form-control" value="" title=""
										placeholder="Nhập quận/huyện">
										<p></p></td>
								</tr>

								<tr>
									<td>Phường/Xã</td>
									<td><input type="text" name="phuongXa"
										class="form-control" value="" title=""
										placeholder="Nhập phường/xã">
										<p></p></td>
								</tr>

								<tr>
									<td>Địa chỉ</td>
									<td><textarea name="daiChi" class="form-control" rows="3"
											placeholder="Vi dụ : 19,đường b"></textarea>
										<p></p></td>
								</tr>

								<tr>
									<td></td>
									<td><i style="font-size: 13px">Để thuận tiện bản vui
											lòng cho chúng tôi biết địa chỉ chính xác của bạn !</i>
										<p></p></td>
								</tr>


								<tr>
									<td></td>
									<td><a class="btn btn-default" id="huyThem"
										style="width: 49%">Hủy bỏ</a> <input class="btn btn-info"
										type="submit" role="button" style="color: white; width: 49%;"
										value="Tạo địa chỉ mới"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</div>
		<!-- end thêm địa chỉ -->
	</form>

	<div class="SuaDiachi"></div>

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
		<div class="row" style="font-size: 13px">© 2018 - Bản quyền thuộc
			NamHS</div>
	</div>
	</footer>

	<c:choose>
		<c:when test="${empty listNDH}">
			<script type="text/javascript">
				$(document).ready(function() {
					$('.diachi').css({
						"display" : "none"
					});

					$('.themDiaChi').css({
						"display" : "block"
					});
				});
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				$(document).ready(function() {
					$('.themDiaChi').css({
						"display" : "none"
					});
					$('.SuaDiachi').css({
						"display" : "none"
					});
					$('.footer').css({
						"margin-top" : "225px"
					});

					$("button").click(function() {
						$('.SuaDiachi').css({
							"display" : "block"
						});
						$('.themDiaChi').css({
							"display" : "none"
						});

						$('.footer').css({
							"margin-top" : "15px"
						});
						var idSUA = $(this).attr('id');
						$.ajax({
							url : 'DiaChiDatHangServlet',
							type : 'POST',
							data : {
								key : 'XEMDIACHI',
								idNDH : idSUA,
							},
							success : function(data) {
								$(".SuaDiachi").html(data);
							}
						})

					});

					$("#themDiaChiMoi").click(function() {
						$('.themDiaChi').css({
							"display" : "block"
						});
						$('.SuaDiachi').css({
							"display" : "none"
						});

						$('.footer').css({
							"margin-top" : "15px"
						});
					});

					$("#huyThem").click(function() {
						$('.themDiaChi').css({
							"display" : "none"
						});

						$('.footer').css({
							"margin-top" : "225px"
						});
					});
				});
			</script>
		</c:otherwise>
	</c:choose>
	<%-- <script type="text/javascript">
		$(document).ready(function() {
	<%if (listNDH.size() == 0) {%>
	
		$('.diachi').css({
				"display" : "none"
			});

			$('.themDiaChi').css({
				"display" : "block"
			});

	<%} else {%>
		$('.themDiaChi').css({
				"display" : "none"
			});
			$('.SuaDiachi').css({
				"display" : "none"
			});
			$('.footer').css({
				"margin-top" : "225px"
			});

			$("button").click(function() {
				$('.SuaDiachi').css({
					"display" : "block"
				});
				$('.themDiaChi').css({
					"display" : "none"
				});

				$('.footer').css({
					"margin-top" : "15px"
				});
				var idSUA = $(this).attr('id');
				$.ajax({
					url : 'DiaChiDatHangServlet',
					type : 'POST',
					data : {
						key : 'XEMDIACHI',
						idNDH : idSUA,
					},
					success : function(data) {
						$(".SuaDiachi").html(data);
					}
				})

			});

			$("#themDiaChiMoi").click(function() {
				$('.themDiaChi').css({
					"display" : "block"
				});
				$('.SuaDiachi').css({
					"display" : "none"
				});

				$('.footer').css({
					"margin-top" : "15px"
				});
			});

			$("#huyThem").click(function() {
				$('.themDiaChi').css({
					"display" : "none"
				});

				$('.footer').css({
					"margin-top" : "225px"
				});
			});
	<%}%>
		
		});
	</script> --%>
</body>
</html>