<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

        <!-- sidebar menu area start -->
        <div class="sidebar-menu">
            <div class="sidebar-header">
                <div class="logo">
                    <a href="http://localhost:8080/trangchu">DRAKE_SHOPE</a>
                </div>
            </div>
            <div class="main-menu">
                <div class="menu-inner">
                    <nav>
                        <ul class="metismenu" id="menu" style="list-style: none">
                            <li>
                                <a href="javascript:void(0)" aria-expanded="true">
                                    <span>Số liêu thống kê</span></a>
                                <ul class="collapse">
                                    <li><a href="index.html">Doanh số</a></li>
                                    <li><a href="">Số lượng hàng</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0)" aria-expanded="true">
                                    <span>Quản lý tài khoản</span></a>
                                <ul class="collapse">
                                    <li><a href="${base }/admin/user">User</a></li>
                                </ul>
                            </li>
                           
                            <li>
                                <a href="javascript:void(0)" aria-expanded="true">
                                    <span>Phản Hồi</span></a>
                                <ul class="collapse">
                                    <li><a href="${base}/trangchu/List_contact">Thông tin liên hệ </a></li>
                                   
                                </ul>
                            </li>
                            <li class="active">
                                <a href="javascript:void(0)" aria-expanded="true">
                                    <span>CATEGORY</span></a>
                                <ul class="collapse">
                                    <li><a href="${base}/admin/category">Category</a>
                                    </li>
                                    <li><a href="${base}/admin/listcategory">Danh sách Category</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="active">
                                <a href="javascript:void(0)" aria-expanded="true">
                                    <span>Quản lý hàng hóa</span></a>
                                <ul class="collapse">
                                    <li><a href="${base}/admin/product/list">Danh sách hàng hóa</a>
                                    </li>
                                    <li class="active"><a href="${base}/admin/addproduct">Thêm mặt hàng</a></li>
                                </ul>
                            </li>
                            
                            <li>
                                <a href="javascript:void(0)" aria-expanded="true">
                                    <span>Quản lý đơn hàng</span></a>
                                <ul class="collapse">
                                <li><a href="${base }/bill">Đơn Hàng</a></li>
                                 <li><a href="${base }/billActive">Đơn hàng đang giao</a></li>
                                 <li><a href="${base }/billNoActive">Đơn hàng đã giao</a></li>
                                </ul>
                            </li> 
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <!-- sidebar menu area end -->