<%@page import="model.bean.NguoiDatHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/view/head_tag.jsp">
	<jsp:param value="Địa chỉ mua hàng" name="title" />
</jsp:include>
<body>
	<form action="DiaChiDatHangServlet?id=<%="CAPNHAT"%>" method="POST">
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
									value="${hoTen}" title=""
									placeholder="Nhập họ tên">
									<p></p></td>
							</tr>
							<tr>
								<td>Điện thoại di động</td>
								<td><input type="text" name="dienThoai"
									class="form-control"
									value="${dienThoai}" title=""
									placeholder="Nhập số điện thoại">
									<p></p></td>
							</tr>

							<tr>
								<td>Tinh/Thành phố</td>
								<td><input type="text" name="tinhThanhPho"
									class="form-control"
									value="${tinhThanhPho}" title=""
									placeholder="Nhập tỉnh/thành phố">
									<p></p></td>
							</tr>

							<tr>
								<td>Quận/Huyện</td>
								<td><input type="text" name="quanHuyen"
									class="form-control"
									value="${quanHuyen}" title=""
									placeholder="Nhập quận/huyện">
									<p></p></td>
							</tr>

							<tr>
								<td>Phường/Xã</td>
								<td><input type="text" name="phuongXa" class="form-control"
									value="${phuongXa}" title=""
									placeholder="Nhập phường/xã">
									<p></p></td>
							</tr>

							<tr>
								<td>Địa chỉ</td>
								<td><textarea name="daiChi" class="form-control" rows="3"
										placeholder="Vi dụ : 19,đường b">${diaChi}</textarea>
									<p></p></td>
							</tr>


							<tr>
								<td><input hidden="hidden" type="text" name="idNDH" value="${idNDH}"></td>
								<td>
									<button type="button" class="btn btn-default" id="huySua"
										style="width: 49%">Hủy bỏ</button> <input type="submit"
									class="btn btn-info" role="button" value="Cập Nhật"
									style="color: white; width: 49%;">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</form>
	
	<script type="text/javascript">
		$("#huySua").click(function() {
			$('.SuaDiachi').css({
				"display" : "none"
			});
			
			$('.footer').css({
				"margin-top" : "225px"
			});
		});
		
	</script>


</body>
</html>