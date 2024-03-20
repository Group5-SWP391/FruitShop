
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"> 
        <!--     Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"> 
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <link rel="stylesheet" href="css/userlist.css" />
        <link rel="stylesheet" href="css/bass.css"/>    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://kit.fontawesome.com/33f9434037.js" crossorigin="anonymous"></script>

    </head>
    <body class="hold-transition skin-blue sidebar-mini">
         <header class="main-header">

                <!-- Logo -->
                <a href="index2.html" class="logo">
                    <span class="logo-lg"><b>Marketing</b></span>
                </a>

                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                    </a>
                    <!-- Navbar Right Menu -->
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">




                            <!-- User Account: style can be found in dropdown.less -->
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="align-items: center;display: flex;margin-right: 60px">
                                    <img src="./img/${sessionScope.acc.accImg}" class="user-image" alt="User Image">
                                    <span class="hidden-xs">${sessionScope.acc.username}</span>
                                </a>
                                <ul class="dropdown-menu"  style="margin-right: 40px">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="./img/${sessionScope.acc.accImg}" class="img-circle" alt="User Image">

                                        <p>
                                            ${sessionScope.acc.username}
                                            
                                        </p>
                                    </li>
                                    <!-- Menu Body -->
                                    <li class="user-body">

                                        <!-- /.row -->
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        

                                        <div class="pull-right">
                                            <a href="logout" class="btn btn-default btn-flat">Sign out</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <!-- Control Sidebar Toggle Button -->
                            
                        </ul>
                    </div>

                </nav>
            </header>

        <div class="row">
            <c:if test="${param['index']==null }">   
                <c:set var = "index" scope = "page" value = "1"/>
            </c:if>
            <c:if test="${param['index']!=null}">
                <c:set var = "index" scope = "page" value = "${param['index']}"/>
            </c:if>
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="./img/user1_image.jpg" class="img-circle" alt="User Image" style="object-fit: cover;width: 40px;height: 40px;">
                        </div>
                        <div class="pull-left info">
                            <p style="color: white">Alexander Pierce</p>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>

                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="header">MAIN NAVIGATION</li>
                        <li class="">
                            <a href="SaleDashboard">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>

                        <li class="active treeview">
                            <a href="OrderList">
                                <i class="fa fa-th"></i> <span>Order List</span>
                            </a>
                        </li>

                       

                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>
            <div class="col-lg-10 content">
                <h1>Orders List</h1>
                <form action="OrderList" >
                    <div class="filter-area">
                        <div class="form-area" style="height: 100px;">
                            <div class="role-filter">
                                <label for="status-filter">Range Date :</label>
                                <input type="date"   value="${param.orderDateFrom}"  id="orderDateFrom" class="form-control" style="margin-bottom: 5px;"  name="orderDateFrom" value="${orderDateFrom}">
                                <input type="date"   value="${param.orderDateTo}"  id="orderDateTo" class="form-control" name="orderDateTo" value="${orderDateTo}">
                                <input type="hidden" name="index" value="${index}">
                            </div>
                            <div class="status-filter">
                                <label for="status-filter">Customer Name:</label>
                                <select id="status-filter" name="saleName" >
                                    <option value="">All </option>
                                    <c:forEach items="${ac}" var="sl">
                                        <option value="${sl.username}" ${(sl.accID==param.aid) ? "selected" :""}>
                                            ${sl.username}</option>
                                        </c:forEach>
                                </select>
                            </div>

                            <div class="gender-filter">
                                <label for="gender-filter">Status:</label>
                                <select id="gender-filter" name="status" >
                                    <option value="-1"${(param.status=="-1")?"selected":""}>All </option>
                                    <option value="1" ${(param.status=="1")?"selected":""}>Wait Confirm</option>
<!--                                    <option value="0" ${(param.status=="0")?"selected":""}>Inactive</option>-->
                                </select>
                            </div>

                            <div class="search-filter" style="width: 100%;display: list-item;">
                                <input type="text" id="search" name="searchQuery" placeholder="search orderId or customer name"
                                       value="${param.searchQuery}" >
                                <i class="fas fa-search search-icon"></i>
                                <label for="gender-filter">Sort:</label>
                                <select name="sortBy">
                                    <option ${param.sortBy == "o.OrderID"?"Selected":""} value="o.OrderID">Default</option>
                                    <option ${param.sortBy == "o.TotalPrice"?"Selected":""} value="o.TotalPrice">Price</option>
                                    <option ${param.sortBy == "o.Status"?"Selected":""} value="o.Status">Status</option>
                                </select>
                            </div>
                        </div>

                        <button type="submit">Search</button>
                        <button type="reset">Reset</button>

                    </div>
                </form>
                <div class="user-list">
                    <table class="table-list">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Ordered Date</th>
                                <th>Customer Name</th>
                                <th>First Product Name</th>
                                <th>Other Products Count</th>
                                <th>Total Price</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orderList}">
                                <tr>
                                    <td><a href="OrderDetailSaleController?orderId=${order.orderId}">${order.orderId}</a></td>
                                    <td>${order.orderedDate}</td>
                                    <td>${order.customerName}</td>
                                    <td>${order.firstProductName}</td>
                                    <td>${order.otherProductsCount}</td>
                                    <td>${order.totalPrice}</td>
                                    <td>${order.status}</td>
                                    <td>
                                        <div class="action-btn">
                                            <button class="btn-edit"
                                                    onclick="window.location.href = '/Fruitshop/OrderDetailSaleController?orderId=${order.orderId}&status=${order.status}'"><i
                                                    class="fa-solid fa-info"></i></button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <br>
                    <div class="paging">
                        <ul class="page-list">
                            <li class="onclick">
                                <a style="line-height: 40px;
    width: 40px " href="./OrderList?index=1&orderDateFrom=${param.orderDateFrom}&orderDateTo=${param.orderDateTo}&saleName=${param.saleName}&status=${param.status==null||param.status==""?"-1":param.status}&searchQuery=${param.searchQuery}&sortBy=${param.sortBy}"><i class="fa-solid fa-angles-left"></i></a>
                            </li>      
                            <c:forEach var="i" begin="1" end="${totalPage}">
                                <li class="${(index == i)?" notclick":"onclick"}">
                                    <a style="line-height: 40px;
    width: 40px " href="./OrderList?index=${i}&orderDateFrom=${param.orderDateFrom}&orderDateTo=${param.orderDateTo}&saleName=${param.saleName}&status=${param.status==null||param.status==""?"-1":param.status}&searchQuery=${param.searchQuery}&sortBy=${param.sortBy}">${i}</a>
                                </li>
                            </c:forEach>
                            <li class="onclick">
                                <a style="line-height: 40px;
    width: 40px "href="./OrderList?index=${totalPage}&orderDateFrom=${param.orderDateFrom}&orderDateTo=${param.orderDateTo}&saleName=${param.saleName}&status=${param.status==null||param.status==""?"-1":param.status}&searchQuery=${param.searchQuery}&sortBy=${param.sortBy}"><i class="fa-solid fa-angles-right"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-U9Yi14bGYPMjYfJAZGuh6o3JODvw/+T2BE6ZU7izjKT1VaVZfU9R8IBqweNkOF1d" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
