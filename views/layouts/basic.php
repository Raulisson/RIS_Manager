<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>RIS Sistemas</title>
	<!-- Custom CSS -->
	<link href="assets/css/login.css" rel="stylesheet">
	<link href="assets/css/custom.css" rel="stylesheet">
</head>
<body>
	<script src="assets/resources/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="assets/resources/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/resources/bower_components/popper.js/dist/umd/popper.min.js"></script>
    <script src="assets/resources/bootstrap/js/bootstrap.min.js"></script>
    <!--Custom JavaScript -->
    <script src="assets/js/custom.js"></script>

   <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full" data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
        
        <div class="auth-wrapper d-flex no-block justify-content-center align-items-center" style="background:#e4e4e4">

		<!-- View -->
		<?php require_once('../views/'.$this->view . '.php') ?>

		</div>
	</div>
</body>