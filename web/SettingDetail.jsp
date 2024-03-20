<%-- 
    Document   : SettingDetail
    Created on : Mar 8, 2024, 2:41:27 PM
    Author     : vinhp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Setting List</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"> 
    <!--     Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"> 
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="css/userlist.css" />
    <link rel="stylesheet" href="css/userlistprofile.css" />
    <link rel="stylesheet" href="css/bass.css"/>    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/33f9434037.js" crossorigin="anonymous"></script>
    <script>
      $(document).ready(function () {
        $('#add').click(function () {
          window.location.href = "adsettingdetail?id=0";
        });
      });
      $(document).ready(function () {
        $('#cancel').click(function () {
          window.history.back();
        });
      });
    </script>

  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <header class="main-header">

                <!-- Logo -->
                <a href="index2.html" class="logo">
                    <span class="logo-lg"><b>Admin</b></span>
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

      <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="./img/${sessionScope.acc.accImg}" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>${sessionScope.acc.username}</p>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>

                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="header">MAIN NAVIGATION</li>
                        <li >
                            <a href="admindashboard">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>

                            </a>

                        </li>

                        <li>
                            <a href="userlist">
                                <i class="fa fa-th"></i> <span>Manage User</span>
                                <span class="pull-right-container">
                                    <small class="label pull-right bg-green">new</small>
                                </span>
                            </a>
                        </li>

                        <li class="active treeview">
                            <a href="adsettinglist">
                                <i class="fa fa-picture-o" aria-hidden="true"></i> <span>Manage Setting</span>
                                <span class="pull-right-container">
                                    <small class="label pull-right bg-green">new</small>
                                </span>
                            </a>
                        </li>

                        

                       
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>
      <div class="col-lg-10 content">
        <div class="function-area">
          <h1 class="title">Setting Detail</h1>
          <div>
            <button id="add" ${hd}><i class="fa-solid fa-plus"></i></button>
            <button id="cancel" ><i class="fa-solid fa-xmark"></i></button>
          </div>
        </div>
        <form class="form-area" method="post" id="form" action="adsettingdetail">
          <input type="text" name="id" hidden value="${id}">
          <div class="half-col">              
            <label class="form-label" name="name">Setting Name</label>
            <input name="name" id="name" type="text" class="form-control" placeholder="Setting Name :" value="${set.name}" required>
          </div><!--end col-->

          <div class="half-col">              
            <label class="form-label">Type</label>
            <input type="text" name="typetxt" hidden value="${set.type.typeId}">
            <select class="form-control" name="type" ${d} required>
              <option value="">Select Type</option>
              <c:forEach items="${typeList}" var="tl">
                <option value="${tl.typeId}" ${(tl.typeId==set.type.typeId&&set.type.typeId!=null) ? "selected" :""}>
                  ${tl.typeName}</option>
                </c:forEach>
            </select>
          </div><!--end col-->

          <div class="half-col">              
            <label class="form-label">Value</label>
            <input name="oldvalue" type="text" value="${set.value}" hidden>
            <input name="value" id="number" type="text"
                   class="form-control" placeholder="Value :" value="${set.value}" pattern="[0-9]+" required>
          </div>
          <!--end col-->

          <div class="half-col order">
            <div class="half-col">              
              <label class="form-label">Order</label>
              <input name="order" id="email" type="text" pattern="[1-3]"
                     class="form-control" placeholder="Order :" value="${set.order}" required>
            </div><!--end col-->
  
            <div class="half-col">              
              <label class="form-label">Status</label><br>
              <label class="switch">
                <input type="checkbox" name="stt" value="1" ${set.isActive?"checked":""}>
                <span class="slider round"></span>
              </label>
            </div><!--end col-->
          </div>

          <div class="full-col">              
            <label class="form-label">Description</label>
            <textarea name="dec" id="address" rows="3" class="form-control"
                      placeholder="Description :" >${set.description}</textarea>
          </div><!--end col-->
          
          <div class="full-col">              
            <div class="alert">${er}</div>
          </div><!--end col-->

          <button type="submit" id="submit" class="btn" act="${id}">Submit</button>
        </form> 
      </div>
    </div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
            
  </body>
</html>


