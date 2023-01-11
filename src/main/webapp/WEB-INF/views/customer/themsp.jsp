<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="base" value="${pageContext.servletContext.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>themsp</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
	<link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
</head>
<body>
	<main class="container">
		<header class="row text-center"></header>
		<section class="row">
			<div class="col mt-4">
				<form action="${base}/themsp" >
				<div class="card">

					<div class="card-header">
						<h2>Add new product</h2>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-7">
								<div class="form-group" style="margin-bottom: 10px;">
							<label for="productId">ID:</label>
							<input type="text" class="form-control" name="id" id="productId" aria-describedby="helpId" placeholder="Product ID">
							<small id="productIdHid" class="form-text text-muted">Product id is required</small>
						</div>

						<div class="fom-group" style="margin-bottom: 10px;">
							<label for="name">Name</label>
							<input type="text" class="form-control" name="ten" id="name" aria-describedby="nameHid" placeholder="name">
							<small id="nameHid" class="form-text text-muted">Name is required</small>
						</div>
						<div class="form-group" style="margin-bottom: 10px;">
							<label for="name">Số Lượng</label>
							<input type="text" class="form-control" name="soLuong" id="soluong" aria-describedby="nameHid" placeholder="Soluong">
							<small id="soluongHid" class="form-text text-muted">Số lượng is required</small>
						</div>

						<div class="input-group form-group" style="margin-bottom: 10px; margin-top: 20px;">
							<span class="input-group-text">Đơn Giá</span>
							<input type="number" class="form-control" name="donGia" id="dongia"  placeholder="dongia">
							<span class="input-group-text">vnđ</span>
						</div>
                     
							</div>
							<div class="col-3" style="margin-left: 30px;">
								<img src="" width="60%"
								class="img-fluid" >
								<div class="form-group">
							<label for="">image File</label>
							<input type="file" class="form-control-file" name="file" id="fileId" aria-describedby="fileId" placeholder="file image">
							<small id="fileimage" class="form-text text-muted">chọn file chứa ảnh sản phẩm</small>
						</div>
                        <div class=" form-group">
                     	<label for="theloai"> Thể loại</label>
						<select class="form-control " name="theLoai" id="theloai">
                        <option>Converse</option>
                        <option>Vans</option>
                        <option>Palladium</option>
                    </select>
                      </div>
                      <div class=" form-group">
                     	<label for="trangthai">Trạng Thái</label>
						<select class="form-control " name="trangThai" id="trangthai">
                        <option>sale</option>
                        <option>new</option>
                        </select>
                      </div>
							</div>
						</div>

					</div>
					<div class="card-footer text-muted ">
						
					</div>
					<div class="card-footer text-muted">
					<button type="button" class="btn btn-success" onclick="saveSp('${base}');">New</button>
						<button type="button" class="btn btn-primary " onclick="saveSp('${base}');">Save</button>
					</div>
				</div>
				</form>
			</div>
		</section>
		<footer class="row"></footer>
	</main>
	<script type="text/javascript">
	function saveSp(baseUrl){
		var data={
				    id:jQuery("#productId").val(),
					ten:jQuery("#name").val(),
					theLoai:jQuery("#productId").val(),
					trangThai:jQuery("#trangthai").val(),
					soLuong:jQuery("#soluong").val(),
					donGia:jQuery("#dongia").val()
		}
		jQuery.ajax({
			url:baseUrl+"/ajax/themsp",
			type:"post",
			contentType:"application/json",
			data:JSON.stringify(data),
			dataType:"json",
			success: function(jsonSp) {
				alert("success");
				},
				error: function(jqXhr, textStatus,errorMessage) {
					alert("lỗi");
					
				}
			
		});
		
	}
	</script>

</body>
</html>