
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
    <script src="JS/userlist.js"></script>

  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <header class="main-header">
      <!-- Logo -->
      <a href="index2.html" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>A</b>LT</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>Admin</b>LTE</span>
      </a>

      <!-- Header Navbar: style can be found in header.less -->
      <nav class="navbar navbar-static-top">
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
          <ul class="nav navbar-nav">

            <li class="dropdown user user-menu">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="align-items: center;display: flex;margin-right: 60px"> 
                <img src="./img/user1_image.jpg" class="user-image" alt="User Image" style="object-fit: cover;">
                <span class="hidden-xs">Alexander Pierce</span>
              </a>
              <ul class="dropdown-menu" style="margin-right: 40px">
                <!-- User image -->
                <li class="user-header" style="height: inherit;">
                  <img src="./img/user1_image.jpg" class="img-circle" alt="User Image" style="object-fit: cover;width: 40px;height: 40px;">
                  <p>
                    Alexander Pierce
                  </p>
                </li>
                <!-- Menu Footer-->
                <li class="user-footer">
                  <div class="pull-left">
                    <a href="#" class="btn btn-default btn-flat">Profile</a>
                  </div>
                  <div class="pull-right">
                    <a href="#" class="btn btn-default btn-flat">Sign out</a>
                  </div>
                </li>
              </ul>
            </li>
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
              <a href="#">
                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
              </a>
            </li>

            <li class="active treeview">
              <a href="userlist">
                <i class="fa fa-th"></i> <span>User List</span>
              </a>
            </li>

            <li class="">
              <a href="adsettinglist">
                <i class="fa fa-gear" aria-hidden="true"></i> <span>Setting List</span>
              </a>
            </li>

          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>
      <div class="col-lg-10 content">
        <h1>User List</h1>
        <div class="filter-area">
          <div class="form-area">
            <div class="role-filter">
              <label for="role-filter">Roles:</label>
              <select id="role-filter" name="role" onchange="getFil()">
                <option value="${null}">All Roles</option>
                <c:forEach items="${roleList}" var="rl">
                  <option value="${rl.roleID}" ${(rl.roleID==role) ? "selected" :""}>
                    ${rl.roleName}</option>
                </c:forEach>
              </select>
            </div>

            <div class="status-filter">
              <label for="status-filter">Statuses:</label>
              <select id="status-filter" name="stt" onchange="getFil()">
                <option value="${null}">All Statuses</option>
                <c:forEach items="${sttList}" var="sl">
                  <option value="${sl.sttID}" ${(sl.sttID==stt) ? "selected" :""}>
                    ${sl.sttName}</option>
                </c:forEach>
              </select>
            </div>

            <div class="gender-filter">
              <label for="gender-filter">Gender:</label>
              <select id="gender-filter" name="gen" onchange="getFil()">
                <option value="${null}">All Gender</option>
                <option value="1" ${(gen==1)?"selected":""}>Male</option>
                <option value="0" ${(gen==0)?"selected":""}>Female</option>
              </select>
            </div>

            <div class="search-filter">
              <input type="text" id="search" placeholder="Type name, email, mobile to search" name="txtSearch"
                     value="${txt}" onkeyup="getFil()">
              <i class="fas fa-search search-icon"></i>
            </div>
          </div>
          <button onclick="window.location.href = 'userdetail?id=0'">Add User</button>
        </div>

        <div class="user-list">
          <table class="table-list">
            <thead>
              <tr>
                <th class="so" data-column="AccID" data-order="desc">ID</th>
                <th class="so" data-column="Username" data-order="desc">Name</th>
                <th class="so" data-column="Gender" data-order="desc">Gender</th>
                <th class="so" data-column="Email" data-order="desc">Email</th>
                <th class="so" data-column="Phone" data-order="desc">Mobile</th>
                <th class="so" data-column="Role" data-order="desc">Role</th>
                <th data-column="Time" data-order="desc">Last login</th>
                <th class="so" data-column="Status" data-order="desc">Status</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items="${listUser}" var="ul">
              <tr>
                <td>${ul.accID}</td>
                <td>${ul.username}</td>
                <td>${(ul.gender)?"Male":"Female"}</td>
                <td>${ul.email}</td>
                <td>${ul.phone}</td>
                <td>${ul.role.roleName}</td>
                <td>${DateTimeFormatter.ofPattern("yyyy-MMM-dd HH:mm:ss").format(ul.time)}</td>
                <td>${ul.status.sttName}</td>
                <td>
                  <div class="action-btn">
                    <button class="btn-edit"
                            onclick="window.location.href = '/Fruitshop/userdetail?id=${ul.accID}'"><i
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
    
  </body>
</html>
