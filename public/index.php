<?php
    header("Access-Control-Allow-Headers: Authorization, Content-Type");
    header("Access-Control-Allow-Origin: *");

    session_start();
    date_default_timezone_set('America/Sao_Paulo');
    
    require_once('../library/Database.php');
    require_once('../library/Util.php');
    require_once('../library/Security.php');
    require_once('../library/Pagination.php');
    require_once('../config/Constants.php');
    require_once('../controllers/AbstractController.php');
    require_once('../controllers/UsuarioController.php');

    // Ação padrão
    if( !isset($_GET['controle']) ) {
        $_GET['controle'] = 'index';
    }
    if( !isset($_GET['acao']) ) {
        $_GET['acao'] = 'index';
    }

    // Verifica se a ação é pública
    if( !Security::isPublic($_GET['controle'], $_GET['acao']) ) {

        // Verifica a sessão
        if( !isset($_SESSION['usuario']['id']) ) {
            Util::redirect('index.php?controle=usuario&acao=login');
        }
    }
    
    // Seleciona o controle e a ação
    $controller = ( isset($_GET['controle']) ? $_GET['controle'] : 'index' );
    $ctrlParams = explode("-", $controller);
    $ctrlClass = "";
    foreach( $ctrlParams as $ctrlParam ) {
        $ctrlClass .= ucfirst($ctrlParam);
    }
    $controller = $ctrlClass.'Controller';
    $action = ( isset($_GET['acao']) ? $_GET['acao'] : 'index' );
    if( strpos($action, "-") !== false ) {
        $actParams = explode("-", $action);
        foreach( $actParams as $k => $actParam ) {
            if( $k > 0 ) {
                $actParams[$k] = ucfirst($actParam);
            }
        }
        $action = implode("", $actParams);
    }

    require_once('../controllers/'.$controller.'.php');
    $objController = new $controller();
    $objController->$action();
?>