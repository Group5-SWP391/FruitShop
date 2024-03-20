
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
    <script src="JS/productListMKT.js"></script>

  </head>
  <body class="hold-transition skin-blue sidebar-mini"> 
      <div class="row">
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
                                    <img src="./ProductListImg/${sessionScope.acc.accImg}" class="user-image" alt="User Image">
                                    <span class="hidden-xs">${sessionScope.acc.username}</span>
                                </a>
                                <ul class="dropdown-menu"  style="margin-right: 40px">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="./ProductListImg/${sessionScope.acc.accImg}" class="img-circle" alt="User Image">

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
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="./ProductListImg/${sessionScope.acc.accImg}" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>${sessionScope.acc.username}</p>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>

                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="header">MAIN NAVIGATION</li>
                        <li class="">
                            <a href="mkt-dashboard">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>

                            </a>

                        </li>

                        <li>
                            <a href="ManagerBlog">
                                <i class="fa fa-th"></i> <span>Manage Post</span>
                                <span class="pull-right-container">
                                    <small class="label pull-right bg-green">new</small>
                                </span>
                            </a>
                        </li>

                        <li>
                            <a href="sliderlist">
                                <i class="fa fa-picture-o" aria-hidden="true"></i> <span>Manage Sliders</span>
                                <span class="pull-right-container">
                                    <small class="label pull-right bg-green">new</small>
                                </span>
                            </a>
                        </li>

                        <li>
                            <a href="feedback">
                                <i class="fa fa-comment" aria-hidden="true"></i> <span>Manage Feedbacks</span>
                                <span class="pull-right-container">
                                    <small class="label pull-right bg-green">new</small>
                                </span>
                            </a>
                        </li>

                        <li>
                            <a href="customerlist">
                                <i class="fa fa-th"></i> <span>Manage Customers</span>
                                <span class="pull-right-container">
                                    <small class="label pull-right bg-green">new</small>
                                </span>
                            </a>
                        </li>





                        <li class="active treeview"><a href="ProductListMKT"><i class="fa fa-product-hunt" aria-hidden="true"></i> <span>Manage Products</span></a></li>

                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>
      <div class="col-lg-10 content">
        <h1>Product List</h1>
        <div class="filter-area">
          <div class="form-area">
              <div class="cate-filter">
              <label for="cate-filter">Category:</label>
              <select id="cate-filter" name="cate" onchange="getFil()">
                <option value="${null}">All Category</option>
                <c:forEach items="${category}" var="c">
                  <option value="${c.cateID}" ${(c.cateID==cate) ? "selected" :""}>
                    ${c.cateName}</option>
                </c:forEach>
              </select>
            </div>

           

            <div class="status-filter">
              <label for="status-filter">Status:</label>
              <select id="status-filter" name="status" onchange="getFil()">
                <option value="${null}">All Status</option>
                <option value="1" ${(isActive==1)?"selected":""}>Displayed</option>
                <option value="0" ${(isActive==0)?"selected":""}>Hided</option>
              </select>
            </div>

            <div class="search-filter">
              <input type="text" id="search" placeholder="Type name or description to search" name="txtSearch"
                     value="${txt}" onkeyup="getFil()">
              <i class="fas fa-search search-icon"></i>
            </div>
          </div>
          <button onclick="window.location.href = 'ProductListMKTAdd'">Add Product</button>
        </div>

        <div class="user-list">
          <table class="table-list">
            <thead>
              <tr>
                <th id="so" data-column="product.ProductID" data-order="desc">ID</th>
                <th id="so" data-column="Image" data-order="desc">Image</th>
                <th id="so" data-column="ProductName" data-order="desc">Name</th>
                <th id="so" data-column="CateName" data-order="desc">Category</th>
                <th id="so" data-column="ImportPrice" data-order="desc">Import Price</th>
                <th id="so" data-column="RootPrice" data-order="desc">Root Price</th>
                <th id="so" data-column="SellPrice" data-order="desc">Sell Price</th>
                <th id="so" data-column="Quantity" data-order="desc">Quantity</th>
                <th id="so" data-column="Description" data-order="desc">Description</th>
                <th id="so" data-column="IsActive" data-order="desc">Status</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items="${listProduct}" var="lp">
              <tr>
                <td>${lp.productID}</td>
                <td><img src="./img/${lp.image}" style="width:20%"></td>
                <td>${lp.productName}</td>
                <td>${lp.categoryMKT.cateName}</td>
                <td>${lp.price.importPrice}</td>
                <td>${lp.price.rootPrice}</td>
                <td>${lp.price.sellPrice}</td>
                <td>${lp.quantity}</td>
                <td>${lp.description}</td>
                <td>${(lp.isActive)?"Displayed":"Hided"}</td>

                <td>
                  <div class="action-btn">
                    <button class="btn-edit"
                            onclick="window.location.href = '/Fruitshop/ProductDetailMKT?id=${lp.productID}'"><i
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
              <c:if test="${p.index>1}">
                <li class="onclick">
                  <p index="1"><i class="fa-solid fa-angles-left"></i></p>
                </li>
                <li class="onclick">
                  <p index="${p.index-1}"><i class="fa-solid fa-arrow-right fa-rotate-180"></i></p>
                </li>
              </c:if>
              <c:forEach var="i" begin="${p.pageStart}" end="${p.pageEnd}">
                <li class="${(p.index == i)?" notclick":"onclick"}">
                  <p index='${i}'>${i}</p>
                </li>
              </c:forEach>
              <c:if test="${p.index<p.totalPage}">
                <li class="onclick">
                  <p index="${p.index+1}"><i class="fa-solid fa-arrow-right"></i></p>
                </li>
                <li class="onclick">
                  <p index="${p.totalPage}"><i class="fa-solid fa-angles-right"></i></p>
                </li>
              </c:if>
            </ul>
          </div>
        </div>
      </div>
    </div>
    
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

  </body>
</html>
