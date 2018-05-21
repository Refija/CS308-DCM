<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 3 | Blank Page</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
	<link href="<c:url value="/resources/css/adminlte.css" />" rel="stylesheet">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
<script src="<c:url value="/resources/plugins/jquery/jquery.min.js"/>"></script>
<!-- Bootstrap 4 -->
<script src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<!-- SlimScroll -->
<script src="<c:url value="/resources/plugins/slimScroll/jquery.slimscroll.min.js"/>"></script>
<!-- FastClick -->
<script src="<c:url value="/resources/plugins/fastclick/fastclick.js"/>"></script>
<!-- AdminLTE App -->
<script src="<c:url value="/resources/js/adminlte.min.js"/>"></script>
<!-- AdminLTE for demo purposes -->
<script src="<c:url value="/resources/js/demo.js"/>"></script>
<style>

		.footer {
		  width: 100%;
		  height: 60px; /* Set the fixed height of the footer here */
		  line-height: 60px; /* Vertically center the text there */
		  background-color: #f5f5f5;
		}</style>
</head>
<body class="hold-transition">
  <!-- Navbar -->
  <nav class=" navbar navbar-expand bg-dark navbar-dark ">
    <!-- Left navbar links -->
    
    <a href="/DCM/" class="brand-link">
      <img src="${pageContext.request.contextPath}/resources/img/logoHome.jpg"
           alt="Dental Clinic Logo"
           class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Dental Clinic</span>
    </a>
    <ul class="navbar-nav">
      <li class="nav-item d-none d-sm-inline-block">
        <a href="/DCM/" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="/DCM/about" class="nav-link">About us</a>
      </li>
    </ul>

    
    <ul class="navbar-nav ml-auto">
      <li class="nav-item d-none d-sm-inline-block">
        <a href="/DCM/login" class="nav-link">Login</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="/DCM/users" class="nav-link">Register</a>
      </li>
        </ul>
            
  </nav>
     <div class="">
    <!-- Content Header (Page header) -->
    <section class="">
      <img alt="" src="${pageContext.request.contextPath}/resources/img/main.jpg" class="img-fluid">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Welcome to Dental Clinic Management</h1>
          </div>
        </div>
      </div>
    </section>
    <section class="content">
		<div class="container">
			<div class="row">
			<div class="col">
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam neque erat, molestie ac nunc vitae, hendrerit bibendum nunc. Quisque eu nunc semper enim lacinia pharetra id non dolor. Vestibulum varius libero eleifend odio lobortis, vitae facilisis ex blandit. In vulputate odio ut fringilla consequat. Phasellus malesuada nunc in justo placerat lobortis sollicitudin vitae est. Donec eu lectus magna. Aliquam at accumsan nisl. Duis vitae egestas diam. Proin cursus feugiat imperdiet. Maecenas vehicula ex ut dolor ullamcorper, eu volutpat ante dictum. Curabitur ac metus tellus. Donec tellus dui, rutrum nec egestas eu, tempus ut orci. Vivamus blandit euismod est pellentesque molestie.</p>
				<p>Vestibulum vestibulum risus id mi semper, sit amet varius lacus vestibulum. Mauris vel orci ut est lobortis faucibus. Quisque hendrerit iaculis neque, id posuere massa porta sed. Pellentesque sed dapibus eros. Phasellus lacinia venenatis magna non placerat. Vestibulum in accumsan quam. Nulla finibus diam vitae augue egestas, non ultricies urna ornare.</p>
			</div>
			</div>
			<div class="row">
			<div class="col">
				<div class="card">
        <div class="card-header">
          <h3 class="card-title">Our Doctors</h3>

        </div>
        <div class="card-body">
        <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-left">
                  <img class="profile-user-img img-fluid img-circle"
                       src="${pageContext.request.contextPath}/resources/img/avatar.png"
                       alt="User profile picture">
                </div>

                <h3 class="profile-username text-left">John Doe</h3>
                <div class="text-left">
                  <img class="profile-user-img img-fluid img-circle"
                       src="${pageContext.request.contextPath}/resources/img/avatar2.png"
                       alt="User profile picture">
                </div>

                <h3 class="profile-username text-left">Jane Doe</h3>
              </div>
              <!-- /.card-body -->
            </div>
       
        </div>
      </div>
      <!-- /.card -->
			</div>
			</div>
		</div>
      <!-- Default box -->
      

    </section>
    </div>
    
    <footer class="footer">
      <div class="container">
        <span class="text-muted">&copy; Copyright 2018, Dental Clinic Management</span>
      </div>
    </footer>
    
    
</body>
</html>

