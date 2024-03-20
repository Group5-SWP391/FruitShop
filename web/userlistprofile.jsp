<%-- 
    Document   : userlistprofile1
    Created on : Feb 28, 2024, 3:34:09 PM
    Author     : vinhp
--%>
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
    <link rel="stylesheet" href="css/userlistprofile.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/33f9434037.js" crossorigin="anonymous"></script>
    <script>
      $(document).ready(function () {
        $('#add').click(function () {
          window.location.href = "userdetail?id=0";
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
                        <li>
                            <a href="admindashboard">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>

                            </a>

                        </li>

                        <li class="active treeview">
                            <a href="userlist">
                                <i class="fa fa-th"></i> <span>Manage User</span>
                                <span class="pull-right-container">
                                    <small class="label pull-right bg-green">new</small>
                                </span>
                            </a>
                        </li>

                        <li>
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
      <div class="col-lg-10 main-content">
      <div class="function-area">
        <h1 class="title">User Profile</h1>
        <div>
          <button id="add" ${hd}><i class="fa-solid fa-plus"></i></button>
        <button id="cancel" ><i class="fa-solid fa-xmark"></i></button>
        </div>
      </div>
      <form class="form-area" method="post" id="form" action="userdetail">
        <input type="text" name="id" hidden value="${id}">
        <div class="half-col">              
          <label class="form-label" name="name">User Name</label>
          <input name="name" id="name" type="text" class="form-control" placeholder="Username :" value="${requestScope.acc.username}" ${d} required>
        </div><!--end col-->

        <div class="half-col">              
          <label class="form-label" name="gen">Gender</label><br>
          <input type="radio" name="gen" id="" value="1" ${(requestScope.acc.gender)?"checked":""} ${d}>Male
          <input type="radio" name="gen" id="" value="0" ${(requestScope.acc.gender)?"":"checked"} ${d}>Female
        </div><!--end col-->

        <div class="half-col">              
          <label class="form-label">Your Email</label>
          <input name="email" id="email" type="email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" onblur="va"
                 class="form-control" placeholder="Your email :" value="${requestScope.acc.email}" required ${d}>
          <p>${msg}</p>
        </div><!--end col-->

        <div class="half-col">              
          <label class="form-label">Mobile</label>
          <input name="phone" id="number" type="text" pattern="0[0-9]{9}" onblur="validateForm()"
                 class="form-control" placeholder="Phone no. :" value="${requestScope.acc.phone}" ${d}>
        </div><!--end col-->

        <div class="half-col">              
          <label class="form-label">Role</label>
          <select class="form-control" name="role" ${v}>
            <c:forEach items="${roleList}" var="rl">
              <option value="${rl.roleID}" ${(rl.roleID==requestScope.acc.role.roleID) ? "selected" :""} ${rl.roleID==1 ? ad:""}>
                ${rl.roleName}</option>
              </c:forEach>
          </select>
        </div><!--end col-->

        <div class="half-col">              
          <label class="form-label">Status</label>
          <select class="form-control" name="stt" ${v}>
            <c:forEach items="${sttList}" var="sl">
              <option value="${sl.sttID}" ${(sl.sttID==requestScope.acc.status.sttID) ? "selected" :""}>
                ${sl.sttName}</option>
              </c:forEach>
          </select>
        </div><!--end col-->

        <div class="full-col">              
          <label class="form-label">Address</label>
          <textarea name="address" id="address" rows="3" class="form-control"
                    placeholder="Address" ${d}>${requestScope.acc.address}</textarea>
        </div><!--end col-->

        <button type="submit" id="submit" class="btn" act="${id}">Submit</button>
      </form>
      </div>
    </div>
      
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
            
  </body>
</html>