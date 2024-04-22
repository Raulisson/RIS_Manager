<?php

    abstract class AbstractController {

        public function __construct()
        {
            if( $_GET['controle'] && $_GET['acao'] ) {
                $perm = Security::check($_GET['controle'], $_GET['acao']);
                if( !$perm ) {
                    echo "Você não tem permissão para acessar esse recurso!";
                    die;
                }
            }
        }

        /**
         * Carrega a camada de visão
         */
        public function render($view, $layout = 'default') {
            $this->view = $view;
            require_once("../views/layouts/{$layout}.php");
        }

        /**
         * Retorna sucesso
         */
        public function success() {
            $rs = ['success'=>true];
            echo json_encode($rs);
        }
    }
?>