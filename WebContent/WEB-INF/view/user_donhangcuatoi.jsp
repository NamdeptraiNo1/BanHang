<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/view/head_tag.jsp">
	<jsp:param value="Quản lý đơn hàng" name="title" />
</jsp:include>
<body>
	<%@include file="/WEB-INF/view/header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
				<ul class="list-group">
					<li class="list-group-item aa"><span
						class="	glyphicon glyphicon-user"
						style="padding-right: 10px; float: left;"></span>Thông tin tài
						khoản</li>
					<li class="list-group-item aa"><span
						class="glyphicon glyphicon-bell" style="padding-right: 10px;"></span>Thông
						báo của tôi</li>
					<li class="list-group-item aa"><i
						class="glyphicon glyphicon-list-alt" style="padding-right: 10px;"></i><a
						href="UserServlet?key=<%="QLDH"%>">Quản lý đơn hàng</a></li>
					<li class="list-group-item aa"><span
						class="glyphicon glyphicon-map-marker"
						style="padding-right: 10px;"></span>Sổ địa chỉ</li>
					<li class="list-group-item aa"><i
						class="glyphicon glyphicon-eye-open" style="padding-right: 10px;"></i>Sản
						phẩn đã xem</li>
				</ul>
			</div>
			<!-- end khối trái -->

			<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9"
				style="background-color: white; border-radius: 4px;">
				<c:if test="${not empty listDH}">
					<div class="donHangCuaToi">
						<p style="font-size: 17px">Đơn hàng của tôi</p>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Mã đơn hàng</th>
									<th>Ngày mua</th>
									<!-- <th>Sản phẩm</th> -->
									<th>Tông tiền</th>
									<th>Trạng thái</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listDH}" var="a">
									<tr>
										<td><a href="UserServlet?idDDH=${a.idDDH}"
											style="color: #189eff;">${a.idDDH}</a></td>
										<td>${a.ngayDat}</td>
										<!-- <td>Tên sản phẩm</td> -->
										<td><fmt:formatNumber type="number" minIntegerDigits="6"
												value="${a.tongTien}"></fmt:formatNumber>đ</td>
										<td>${a.trangThai.equals("0") ? "Đang chờ xử lý" : a.trangThai.equals("1") ? "Đã xử lý" : "Đã hủy"}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- end donHangCuaToi -->
				</c:if>

				<c:if test="${empty listDH && empty idDDH}">
					<div class="chuaGiaoDich">
						<p>
							Bạn chưa tham gia giao dịch lần nào ! <a href="GioHangServlet?key=<%="SHOW"%>" style="color: #00b6f0;">Tiến hành
								đặt hàng</a>
						</p>
					</div>
				</c:if>

				<c:if test="${not empty cTDH}">
					<div class="chiTietDonHang">
						<p style="font-size: 17px; font-weight: 700;">Chi tiết đơn
							hàng #${idDDH} - ${tH.equals("0") ? "Đang chờ xử lý" : tH.equals("1") ? "Đã giao hàng " : "Đơn hàng đã bị hủy"}</p>
						<div class="container-fluid">
							<div class="row" style="padding-bottom: 20px">
								<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
									<p>ĐỊA CHỈ NGƯỜI NHẬN</p>
									<div
										style="width: 95%; height: 111px; border: 1px solid #f8f7f7; padding: 10px; border-radius: 4px; background-color: #f8f7f7;">
										<b>${nDH.tenNDH}</b>
										<p style="font-size: 13px; margin-bottom: 0px">Địa chỉ:
											${nDH.diaChi}</p>
										<p style="font-size: 13px;">Điện thoại: ${nDH.sDT}</p>
									</div>
								</div>
								<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
									<p>HÌNH THỨC GIAO HÀNG</p>
									<div
										style="width: 95%; height: 111px; border: 1px solid #f8f7f7; padding: 10px; border-radius: 4px; background-color: #f8f7f7;">
										<p style="font-size: 13px;">Giao Hàng Nhanh 2H (dự kiến
											giao hàng trước 10:00 ngày mai)</p>
										<p style="font-size: 13px;">Phí vận chuyển: 0 ₫</p>
									</div>
								</div>

								<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
									<p>HÌNH THỨC THANH TOÁN</p>
									<div
										style="width: 95%; height: 111px; border: 1px solid #f8f7f7; padding: 10px; border-radius: 4px; background-color: #f8f7f7;">
										<p style="font-size: 13px;">Thanh toán tiền mặt khi nhận
											hàng</p>

									</div>
								</div>
							</div>
							<!-- end row1 -->
							<div class="row">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>Sản phẩm</th>
											<th>Giá bán</th>
											<th>Số Lượng</th>
											<th>Giảm giá</th>
											<th>Tạm tính</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="tongTien" value="${0}"></c:set>
										<c:forEach items="${cTDH}" var="c">
											<c:forEach items="${tMH}" var="b">
												<c:if test="${c.idMH.equals(b.idMH)}">
													<tr>
														<td><a href="ChiTietSanPhamServlet?id=${c.idMH}"><img
																src="DisplayImageServlet?id=${c.idMH}"
																class="anhGioHang" alt=""> ${b.tenMH} </a></td>
														<td><fmt:formatNumber type="number"
																minIntegerDigits="6" value="${b.giaBan}" />đ</td>
														<td>${c.soLuong}</td>
														<td><c:choose>
																<c:when test="${b.giamGia == 0}">
																	0
																</c:when>
																<c:otherwise>
																	<p style="color: red;">- ${b.giamGia}%</p>
																</c:otherwise>
															</c:choose></td>
														<td><fmt:formatNumber type="number"
																minIntegerDigits="6"
																value="${(b.giaBan - (b.giaBan*b.giamGia)/100)*c.soLuong}" />đ
														</td>
													</tr>
													<c:set var="tongTien"
														value="${tongTien + (b.giaBan - (b.giaBan*b.giamGia)/100)*c.soLuong}"></c:set>
												</c:if>
											</c:forEach>
										</c:forEach>
									</tbody>
								</table>
								<hr>
								<div>
									<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"
										style="float: right; padding-top: 0px;padding-bottom: 20px">
										<p>
											Tổng tạm tính : <span style="float: right;"><fmt:formatNumber
													type="number" minIntegerDigits="6" value="${tongTien}" />đ</span>
										</p>
										<p>
											Phí vận chuyển : <span style="float: right;">0đ</span>
										</p>
										<p>
											Tổng cộng : <span
												style="float: right; color: red; font-size: 20px"><fmt:formatNumber
													type="number" minIntegerDigits="6" value="${tongTien}" />đ</span>
										</p>
										<c:if test="${tH == 0}">
											<a class="btn btn-primary" href="UserServlet?idDDH=${idDDH}&key=<%="HUY"%>"
												style="background-color: #fdd835; padding: 9px 30px; color: black; border: none; outline: none; margin-left: 142px; float: right; margin-top: 20px">Hủy
												đơn hàng</a>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- end Chi Tiết đơn Hàng -->
				</c:if>
			</div>
			<!-- end khối phải -->
		</div>
		<!-- end row -->
	</div>
	<!-- end container -->
	<!-- <script type="text/javascript">
		
		$(document).ready(function() {
			$("#huyDDH").click(function() {
				var id = ${idDDH};
				$.ajax({
					url: 'UserServlet',
					type: 'POST',
					data: {
						DDH: id,
						key: "HUY",
					},
					success: function(data) {

					}
				});
			});
		});
	</script> -->

	<%@include file="/WEB-INF/view/footer.jsp"%>

</body>
</html>