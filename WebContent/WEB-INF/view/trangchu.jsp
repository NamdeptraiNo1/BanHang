<%@page import="common.StringProcess"%>
<%@page import="model.bean.MatHang"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/view/head_tag.jsp">
	<jsp:param value="Trang Chủ" name="title" />
</jsp:include>
<body>

	<%@include file="/WEB-INF/view/header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
				<p class="text-center" style="font-size: 20px;">DANH MỤC SẢN
					PHẨM</p>
				<ul class="list-group">
					<!-- <p class="tieude" style="text-align: center;display: block;">DANH MỤC SẢN PHẨM</p> -->
					<li class="list-group-item">Son Kem Lỳ RoZa Lip Stick</li>
					<li class="list-group-item">Son Dưỡng Da RoZa Silk</li>
					<li class="list-group-item">Phấn nước RoZa BB Cushion</li>
					<li class="list-group-item">Sữa Rửa Mặt RoZa</li>
					<li class="list-group-item">Tẩy Da Chết RoZa</li>
					<li class="list-group-item">Nước Hoa Hồng RoZa</li>
					<li class="list-group-item">Kem Dưỡng Trắng Da RoZa</li>
					<li class="list-group-item">Magic Serum</li>
				</ul>
				<div
					style="background-color: white; width: 100%; height: 952px; border-radius: 4px;">
					<div>
						<img src="anh/qq.png" class="img  img-responsive" alt=""> <img
							src="anh/qq.png" class="img  img-responsive" alt="">
					</div>
				</div>
			</div>
			<!-- end khối trái -->

			<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div id="carousel-id" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carousel-id" data-slide-to="0" class=""></li>
								<li data-target="#carousel-id" data-slide-to="1" class="active"></li>
							</ol>
							<div class="carousel-inner">
								<div class="item">
									<img src="anh/a.jpg" class="img img-responsive">
								</div>
								<div class="item active">
									<img src="anh/b.jpg" class="img img-responsive">
								</div>
							</div>
							<a class="left carousel-control" href="#carousel-id"
								data-slide="prev"><span
								class="glyphicon glyphicon-chevron-left"></span></a> <a
								class="right carousel-control" href="#carousel-id"
								data-slide="next"><span
								class="glyphicon glyphicon-chevron-right"></span></a>
						</div>
					</div>
				</div>
				<!-- end slide -->

				<hr>
				<p class="tieude">ROZA -LIPSTICK SON LỲ CAO CẤP</p>
				<a href="XemThemServlet"
					style="padding-left: 56%; display: inline-block;" class="xemThem">Xem
					Thêm <span class="fa fa-angle-double-right"></span>
				</a>

				<div class="row"
					style="background-color: white; padding-top: 15px; border-radius: 4px;">
					<c:forEach items="${listMH}" var="a" begin="0" end="3">
						<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
							<div class="thumbnail">
								<a href="ChiTietSanPhamServlet?id=${a.idMH}">
									<img src="DisplayImageServlet?id=${a.idMH}"
									class="img img-responsive" style="height: 70%; width: 100%;"alt="">
									<div class="tenSPGiaBan">
										<p class="tenSP">${a.tenMH}</p>
										<b><fmt:formatNumber type="number" minIntegerDigits="6" value="${a.giaBan}"/> đ
											<span style="color: red; padding-left: 30px;">
												<c:if test="${a.giamGia != 0}">
													- ${a.giamGia} %
												</c:if>
											</span></b>
									</div>
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- end ROZA -LIPSTICK SON LỲ CAO CẤP -->

				<p class="tieude">SẢN PHẨM NỔI BẬT</p>
				<a href="#" style="padding-left: 69%; display: inline-block;"
					class="xemThem">Xem Thêm <span class="fa fa-angle-double-right"></span></a>

				<div class="row"
					style="background-color: white; padding-top: 15px; border-radius: 4px;">
					<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
						<div class="thumbnail">
							<a href="chitietsanpham.jsp"> <img src="anh/dd.jpg" alt="">
								<div class="tenSPGiaBan">
									<p class="tenSP">Tên sản phẩm</p>
									<b>Giá d</b>
								</div>
							</a>
						</div>
					</div>

					<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
						<div class="thumbnail">
							<a href="#"> <img src="anh/dd.jpg" alt="">
								<div class="tenSPGiaBan">
									<p class="tenSP">Tên sản phẩm</p>
									<b>Giá d</b>
								</div>
							</a>
						</div>
					</div>

					<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
						<div class="thumbnail">
							<a href="#"> <img src="anh/dd.jpg" alt="">
								<div class="tenSPGiaBan">
									<p class="tenSP">Tên sản phẩm</p>
									<b>Giá d</b>
								</div>
							</a>
						</div>
					</div>

					<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
						<div class="thumbnail">
							<a href="#"> <img src="anh/dd.jpg" alt="">
								<div class="tenSPGiaBan">
									<p class="tenSP">Tên sản phẩm</p>
									<b>Giá d</b>
								</div>
							</a>
						</div>
					</div>
				</div>
				<!-- end sản phẩm nổi bật -->


				<p class="tieude">SẢN PHẨM KHUYẾN MÃI</p>
				<a href="#" style="padding-left: 64%; display: inline-block;"
					class="xemThem">Xem Thêm <span class="fa fa-angle-double-right"></span></a>

				<div class="row"
					style="background-color: white; padding-top: 15px; border-radius: 4px;">
					<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
						<div class="thumbnail">
							<a href="chitietsanpham.jsp"> <img src="anh/dd.jpg" alt="">
								<div class="tenSPGiaBan">
									<p class="tenSP">Tên sản phẩm</p>
									<b>Giá d</b>
								</div>
							</a>
						</div>
					</div>
					<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
						<div class="thumbnail">
							<a href="#"> <img src="anh/dd.jpg" alt="">
								<div class="tenSPGiaBan">
									<p class="tenSP">Tên sản phẩm</p>
									<b>Giá d</b>
								</div>
							</a>
						</div>
					</div>

					<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
						<div class="thumbnail">
							<a href="#"> <img src="anh/dd.jpg" alt="">
								<div class="tenSPGiaBan">
									<p class="tenSP">Tên sản phẩm</p>
									<b>Giá d</b>
								</div>
							</a>
						</div>
					</div>

					<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
						<div class="thumbnail">
							<a href="#"> <img src="anh/dd.jpg" alt="">
								<div class="tenSPGiaBan">
									<p class="tenSP">Tên sản phẩm</p>
									<b>Giá d</b>
								</div>
							</a>
						</div>
					</div>
				</div>
				<!-- end sản phẩm khuyến mãi -->
			</div>
			<!-- end khối phỉa -->
		</div>
		<!-- end row -->
	</div>
	<!-- end container -->

	<%@include file="/WEB-INF/view/footer.jsp"%>

</body>
</html>