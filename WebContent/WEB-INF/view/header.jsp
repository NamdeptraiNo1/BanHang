<%@page import="common.StringProcess"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<header>
	<nav class="navbar navbar-default" role="navigation"
		style="background-color: white;">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<img src="anh/logo.png" alt="" class="logo"
					style="width: 140px; height: 60px;">
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-ex1-collapse"
				style="position: relative;">
				<ul class="nav navbar-nav">
					<li><a href="TrangChuServlet">TRANG CHỦ</a></li>
					<li><a href="#">GIỚI THIỆU</a></li>
					<li><a href="#">TIN TỨC</a></li>
					<li><a href="#">LIÊN HỆ</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><c:choose>
							<c:when test="${empty soLuongGH}">
								<a href="GioHangServlet?key=<%="SHOW"%>" class="gioHang"><span
									class="glyphicon glyphicon-shopping-cart"
									style="top: -3px; left: -2px; color: white;"><input
										type="text" class="soLuongGH" value="0" id="a"></span>
								<!-- GIỎ HÀNG --></a>
							</c:when>
							<c:otherwise>
								<a href="GioHangServlet?key=<%="SHOW"%>" class="gioHang"> <span
									class="glyphicon glyphicon-shopping-cart"
									style="top: -3px; left: -2px; color: white;"><input
										type="text" class="soLuongGH" value="${soLuongGH}" id="a"></span>
								<!-- GIỎ HÀNG --></a>
							</c:otherwise>
						</c:choose></li>

					<c:choose>
						<c:when test="${empty tenDangNhap}">
							<li><a data-toggle="modal" href="#modal-id"> <!-- ĐĂNG NHẬP  -->
									<span class="glyphicon glyphicon-log-in"></span>
							</a></li>
							<li></li>
						</c:when>
						<c:otherwise>
							<li><button class="user">
									<span class="glyphicon glyphicon-user"
										style="font-size: 15px; float: left; padding-left: 5px; padding-top: 4px; color: #03d03ac7;">
									</span> ${hoName}
									<div class="dropdown">
										<ul class="list-group">
											<li class="list-group-item aa"><span
												class="	glyphicon glyphicon-user"
												style="padding-right: 10px; float: left;"></span><a href="WebContent/WEB-INF/view/user.jsp">Thông tin tài
													khoản</a></li>
											<li class="list-group-item aa"><span
												class="glyphicon glyphicon-bell"
												style="padding-right: 10px; float: left;"></span>Thông báo
												của tôi</li>
											<li class="list-group-item aa"><i
												class="glyphicon glyphicon-list-alt"
												style="padding-right: 10px; float: left;"></i><a href="UserServlet?key=<%="QLDH"%>">Quản lý đơn hàng</a></li>
											<li class="list-group-item aa"><span
												class="glyphicon glyphicon-map-marker"
												style="padding-right: 10px; float: left;"></span>Sổ địa chỉ</li>
											<li class="list-group-item aa"><i
												class="glyphicon glyphicon-eye-open"
												style="padding-right: 10px; float: left;"></i>Sản phẩn đã
												xem</li>
											<li class="list-group-item aa"><i
												class="glyphicon glyphicon-log-out"
												style="padding-right: 10px; float: left;"></i><a href="LogoutServlet">Thoát tài khoản</a></li>
										</ul>
									</div>
								</button></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
	</nav>
</header>
<!-- end menu -->
<div class="modal fade" id="modal-id">
	<div class="modal-dialog" style="width: 400px;">
		<div class="modal-content">
			<div class="modal-header"
				style="border: none; background-color: #e8200fab; color: white;">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" style="text-align: center;">LOG IN</h4>
			</div>
			<div class="modal-body" style="width: 300px; margin: auto;">
				<div class="row">
					<p style="margin-bottom: 0px">Tài Khoản</p>
					<input
						style="box-shadow: 1px 1px 1px white; border: none; border-radius: 0px; border-bottom: 1px solid #ea4709f0; margin-bottom: 10px;"
						type="text" name="" id="TenTK" class="form-control" value=""
						required="required" pattern="UserName" title="">
					<p style="margin-bottom: 0px">Mật Khẩu</p>
					<input
						style="box-shadow: 1px 1px 1px white; border: none; border-radius: 0px; border-bottom: 1px solid #ea4709f0;"
						type="password" name="" id="matKhauTK" class="form-control"
						value="" required="required" pattern="" title="">
				</div>
			</div>
			<div class="modal-footer" style="border: none; text-align: center;">
				<div class="row">
					<p id="checkLogin" style="color: red;"></p>
					<button type="button" class="btn btn-warning" id="dang_Nhap"
						style="width: 300px;">Đăng Nhập</button>
					<p style="margin-top: 15px">
						Not account yet ? <a data-toggle="modal" href="#modal-id2"
							id="sign_up" style="color: blue;">Sign Up</a>
					</p>
					<a style="font-size: 25px; color: #2a2acae8;"
						class="fa fa-facebook-square"></a> <a
						style="font-size: 25px; color: #ff0000cf;"
						class="fa fa-google-plus-square"></a> <a
						style="font-size: 25px; color: #00b6f0;"
						class="fa fa-twitter-square"></a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end Login -->

<div class="modal fade" id="modal-id2">
	<div class="modal-dialog" style="width: 400px;">
		<div class="modal-content">
			<div class="modal-header"
				style="border: none; background-color: #e8200fab; color: white;">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" style="text-align: center;">Sign Up</h4>
			</div>
			<div class="modal-body" style="width: 300px; margin: auto;">
				<div class="row">
					<label for="input-id" style="padding-left: 0px;" class="col-sm-5">Tên
						Tài Khoản</label> <input
						style="box-shadow: 1px 1px 1px white; border: none; border-radius: 0px; border-bottom: 1px solid #ea4709f0;"
						type="text" name="" id="taikhoan" class="form-control" value=""
						required="required" pattern="UserName" title=""> <label
						for="input-id" style="padding-left: 0px; padding-top: 20px"
						class="col-sm-4">Mật Khẩu</label> <input
						style="box-shadow: 1px 1px 1px white; border: none; border-radius: 0px; border-bottom: 1px solid #ea4709f0;"
						type="password" name="" id="matkhau" class="form-control" value=""
						required="required" pattern="" title=""> <label
						for="input-id" style="padding-left: 0px; padding-top: 20px"
						class="col-sm-12">Nhập lại mật khẩu</label> <input
						style="box-shadow: 1px 1px 1px white; border: none; border-radius: 0px; border-bottom: 1px solid #ea4709f0;"
						type="password" name="" id="nhaplaimatkhau" class="form-control"
						value="" required="required" pattern="" title="">
				</div>
			</div>
			<div class="modal-footer" style="border: none; text-align: center;">
				<div class="row">
					<div style="width: 300px; margin: auto; margin-bottom: 15px;">
						<button type="button" class="btn btn-danger" data-dismiss="modal"
							style="width: 48%;">Hủy</button>
						<button type="button" class="btn btn-warning" style="width: 48%;">Tạo
							Tài khoản</button>
					</div>
					<a style="font-size: 25px; color: #2a2acae8;"
						class="fa fa-facebook-square"></a> <a
						style="font-size: 25px; color: #ff0000cf;"
						class="fa fa-google-plus-square"></a> <a
						style="font-size: 25px; color: #125ebfe0;"
						class="fa fa-twitter-square"></a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end Sign Up -->


<div class="modal fade" id="modalThongBao">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">Thông báo</h4>
			</div>
			<div class="modal-body">
				<p>Bạn phải thêm sản phẩm vào giỏ hàng !</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>

			</div>
		</div>
	</div>
</div>
<!-- modol thông báo -->

<script type="text/javascript">
	$(document).ready(function() {
		/* $("#a").text("1"); */
		$("#sign_up").click(function() {
			$("#modal-id").modal("hide");
		});

		$("#dang_Nhap").click(function() {
			$.ajax({
				url : 'LoginServlet',
				type : 'POST',
				dataType : 'json',
				data : {
					tenTK : $("#TenTK").val(),
					matKhauTK : $("#matKhauTK").val(),
				},
				success : function(checkLogin) {
					$("#checkLogin").html(checkLogin);
				}
			})
		});
	});
</script>