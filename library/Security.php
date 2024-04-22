<?php

    class Security {

        // Ações públicas
        private static $public = array(
            'usuario'   => array('login', 'autenticar', 'sair','checar-atividade'),
        );

        // Permissões
        private static $acl = array(
            
        );
		
        /**
         * Recupera o usuário da sessão
         */
        public static function usuario() {
            if( isset($_SESSION['usuario']) ) {
                return $_SESSION['usuario'];
            }
        }

        /**
         * Verifica se um usuário possui a permissão
         */
        public static function check($controle, $acao, $perfil = '') {
            $db = Database::getConn();
			
            // Verifica se a ação é pública
            if( self::isPublic($controle, $acao) ) {
                return true;
            }
			
			// Usuário admin
			$usuario = $db->usuario("id", $_SESSION['usuario']['id'])->fetch();
			if( $usuario['perfil'] == "1" ) {
				return true;
			}

            // Verifica se o controle e a ação estão registrados
			$controle = $db->acl_controle("classe", $controle)->fetch();
			if( $controle ) {
				$acao = $db->acl_acao()->where("id_acl_controle = {$controle['id']} AND metodo = '{$acao}'")->fetch();
				if( $acao ) {
					
					// Verifica se o usuário participa de algum grupo com permissão
					$relGrupos = $db->acl_grupo_usuario("id_usuario", $_SESSION['usuario']);
					foreach( $relGrupos as $relGrupo ) {
						$grupoAcoes = $db->acl_grupo_acao("id_acl_grupo", $relGrupo['id_acl_grupo']);
						foreach( $grupoAcoes as $grupoAcao ) {
							if( $grupoAcao["id_acl_acao"] == $acao["id"] ) {
								return true;
							}
						}
					}
					
					// Sem permissão
					return false;
				}
			}
			
			return true;
        }

        /**
         * Verifica se a ação é pública
         */
        public static function isPublic($controle, $acao) {
            if( isset(self::$public[$controle]) && in_array($acao, self::$public[$controle]) !== false ) {
                return true;
            } else {
                return false;
            }
        }
		
		/**
         * Verifica se possui permissão para editar registros da empresa
         */
        public static function checkCompany($registro) {
            if( isset(self::usuario()['id_empresa'])
				&& $registro['id_empresa'] == self::usuario()['id_empresa'] ) {
				return true;
            }
			Util::erro(ERRO_PERMISSAO_EMPRESA);
        }
    }
?>