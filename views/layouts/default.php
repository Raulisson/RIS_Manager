<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex,nofollow">
    <title>RIS</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favico.png">
    <!-- Custom CSS -->
    <link href="assets/resources/select2/css/select2.min.css" rel="stylesheet">
    <link href="assets/css/style.min.css" rel="stylesheet">
    <link href="assets/css/custom.css" rel="stylesheet">
    <link href="assets/css/customizations.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="assets/resources/fullcalendar-6.1.11/dist/index.global.js"></script>
    <script src="assets/resources/fullcalendar-6.1.11/packages/core/locales-all.global.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

    <?php 
        if( isset($this->css) ) {
            foreach( $this->css as $css ) {
                echo "<link href='{$css}' rel='stylesheet'>";
            }
        }
    ?>

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
<script src="https://kit.fontawesome.com/cb78bbb11d.js" crossorigin="anonymous"></script>
    <script src="assets/resources/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="assets/resources/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/resources/bower_components/popper.js/dist/umd/popper.min.js"></script>
    <script src="assets/resources/bootstrap/js/bootstrap.min.js"></script>
    <!--Wave Effects -->
    <script src="assets/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="assets/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="assets/resources/select2/js/select2.full.min.js"></script>
    <script src="assets/resources/select2/js/select2.min.js"></script>
    <script src="assets/resources/jquery-mask/jquery.mask.min.js"></script>
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
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar" data-navbarbg="skin5">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin6">
                    <!-- Logo -->
                    <a class="navbar-brand" href="?controle=dashboard&acao=dashboard">
                        <!-- Logo icon -->
                        <b class="logo-icon" style="width:100%;text-align:center;">
                            <!-- Dark Logo icon -->
                            <img src="./assets/images/logo.png" style="width:100px;height:70px;" />
                        </b>
                        <!--End Logo icon -->
                    </a>
                    <a class="nav-toggler waves-effect waves-light text-dark d-block d-md-none" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                </div>

                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                    <ul class="navbar-nav d-none d-md-block d-lg-none">
                        <li class="nav-item">
                            <a class="nav-toggler nav-link waves-effect waves-light text-white" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                        </li>
                    </ul>
                    <!-- Right side toggle and nav items -->
                    <ul class="navbar-nav ml-auto d-flex align-items-center">

                        <!-- User profile and search -->
                        <li>
                            <a class="profile-pic" href="#"><span class="text-white font-medium"></span></a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav" style="padding-top: 10px;">
                    <ul id="sidebarnav">
                        <li class="sidebar-item">
                            <a href="?controle=dashboard&acao=dashboard"" class="sidebar-link">
                                <?php
                                    $nome = Security::usuario()['nome'];
                                    if(Security::usuario()['perfil'] == 1){
                                        $perfil = "Administrador";
                                    } else {
                                        $perfil = "Usuario";
                                    }
                                    echo "<span class='hide-menu'>{$nome} - {$perfil}</span>";
                                ?>
                            </a>
                        </li>
                        <!-- Atividades -->
                        <li class="sidebar-item">
                            <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                                <i class="fa fa-list-check"></i>
                                <span class="hide-menu">Atividades</span>
                            </a>
                            <ul aria-expanded="false" class="collapse first-level">

                                <!-- Menu - Calendário Geral -->
                                <li class="sidebar-item">
                                    <a href="?controle=atividade&acao=listarCalendario" class="sidebar-link">
                                        <i class="mdi mdi-border-top"></i>
                                        <span class="hide-menu">Calendário de Atividades</span>
                                    </a>
                                </li>

                                <!-- Menu - Pendências -->
                                <li class="sidebar-item">
                                    <a href="?controle=atividade&acao=listarPendencias" class="sidebar-link">
                                        <i class="mdi mdi-border-top"></i>
                                        <span class="hide-menu">Lista de Pendências</span>
                                    </a>
                                </li>

                                <!-- Menu - Finalizados -->
                                <li class="sidebar-item">
                                    <a href="?controle=atividade&acao=listarFinalizados" class="sidebar-link">
                                        <i class="mdi mdi-border-top"></i>
                                        <span class="hide-menu">Lista de Finalizados</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        
                        <!-- Menu - Pontos -->
                        <li class="sidebar-item">
                            <a href="?controle=ponto&acao=listar" class="sidebar-link">
                                <i class="fas fa-building" aria-hidden="true"></i>
                                <span class="hide-menu">Pontos</span>
                            </a>
                        </li>

                        <!-- Menu - Inventário -->
                        <li class="sidebar-item">
                            <a href="?controle=inventario&acao=listar" class="sidebar-link">
                                <i class="fa-solid fa-clipboard-list"></i>
                                <span class="hide-menu">Inventário</span>
                            </a>
                        </li>

                        <!-- Menu - Estoque -->
                        <li class="sidebar-item">
                            <a href="?controle=inventario&acao=estoque" class="sidebar-link">
                                <i class="fa-solid fa-boxes-stacked"></i>
                                <span class="hide-menu">Estoque</span>
                            </a>
                        </li>

                        <!-- Menu - Modens -->
                        <li class="sidebar-item">
                            <a href="?controle=equipamento&acao=listarModem" class="sidebar-link">
                                <i class="fa-solid fa-wifi"></i>
                                <span class="hide-menu">Modens</span>
                            </a>
                        </li>
                        
                        <!-- Equipamentos -->
                        <li class="sidebar-item">
                            <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                            <i class="fa-solid fa-tv"></i>
                                <span class="hide-menu">Equipamentos</span>
                            </a>
                            <ul aria-expanded="false" class="collapse first-level">

                                <!-- Menu Telas -->
                                <li class="sidebar-item">
                                    <a href="?controle=equipamento&acao=listarTela" class="sidebar-link">
                                        <i class="mdi mdi-border-top"></i>
                                        <span class="hide-menu">Lista de Telas</span>
                                    </a>
                                </li>

                                <!-- Menu - Computadores -->
                                <li class="sidebar-item">
                                    <a href="?controle=equipamento&acao=listarComputador" class="sidebar-link">
                                        <i class="mdi mdi-border-top"></i>
                                        <span class="hide-menu">Lista de Computadores</span>
                                    </a>
                                </li>

                                <!-- Menu - Dispositivos -->
                                <li class="sidebar-item">
                                    <a href="?controle=equipamento&acao=listarEquipamento" class="sidebar-link">
                                        <i class="mdi mdi-border-top"></i>
                                        <span class="hide-menu">Outros Equipamentos</span>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <?php if(Security::usuario()['perfil'] == 1){ 
                        // Usuários
                        echo "<li class='sidebar-item'> <a class='sidebar-link waves-effect waves-dark sidebar-link' href='index.php?controle=usuario&acao=listar' aria-expanded='false'><i class='fa fa-users' aria-hidden='true'></i><span class='hide-menu'>Usuários</span></a></li>";
                                                
                        }
                        ?>
                        <!-- Sair -->
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="index.php?controle=usuario&acao=sair" aria-expanded="false"><i class="fa fa-power-off" aria-hidden="true"></i><span class="hide-menu">Sair</span></a></li>
                    </ul>

                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">

            <!-- Page -->
            <?php require_once("../views/{$this->view}.php") ?> 

            <!-- Footer -->
            <footer class="footer text-center">
            Desenvolvido por <a href="https://twitter.com/Raulissin" target="_blank">https://twitter.com/Raulissin</a>
            </footer>
        
        </div>
    </div>

    <!-- Notificação -->
    <div class="modal fade" id="pleaseWaitDialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <h4 class="modal-title" align="center">Aguarde...</h4>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</body>

</html>