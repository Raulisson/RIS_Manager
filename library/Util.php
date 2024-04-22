<?php

    class Util {

        /**
         * Obtém a próxima senha
         */
        public static function gerarSenha($especialidadeId) {
            $db = Database::getConn();
            $sequencia = $db->sequencia('id_especialidade', $especialidadeId)->fetch();

            // Se não existir, cadastra uma nova sequência
            if( !$sequencia ) {
                $sequencia = array(
                    'inicio'            => 100,
                    'fim'               => 999,
                    'atual'             => 100,
                    'id_especialidade'  => $especialidadeId
                );
                $db->sequencia()->insert($sequencia);

            } else {

                // Incrementa
                if( $sequencia['atual'] < $sequencia['fim'] ) {
                    $sequencia['atual'] = $sequencia['atual'] + 1;
                } else {
                    $sequencia['atual'] = $sequencia['inicio'];
                }
                $sequencia->update();
            }

            return $sequencia['atual'];
        }

        /**
         * Redireciona a página
         */
        public static function redirect($url) {
            echo "<script>window.location='{$url}';</script>";
			die;
        }

        /**
         * Volta para a página anterior
         */
        public static function back() {
            echo "<script>history.go(-1);</script>";
        }

        /**
         * Converte a data para o padrão nacional
         */
        public static function dataBr($dt) {
            if( $dt ) {
                $params = explode('-', $dt);
                return implode('/', array_reverse($params));
            } else {
                return "";
            }
        }

        /**
         * Converte a data/hora para o padrão nacional
         */
        public static function dataHoraBr($dtHora) {
            $params = explode(' ', $dtHora);
            $params2 = explode('.', $params[1]);
            $params[1] = $params2[0];

            if( count($params) > 1 ) {
                $dt = Util::dataBr($params[0]);
                return $dt . ' ' . $params[1];
            } else {
                return "";
            }
        }
        
        /**
         * Converte a data para o padrão ISO
         */
        public static function dataIso($dt) {
            if( $dt ) {
                $params = explode('/', $dt);
                return implode('-', array_reverse($params));
            } else {
                return "";
            }
        }

        /**
         * Formata a moeda para Real
         */
        public static function real($valor) {
            return number_format($valor, 2, ",", ".");
        }

        /**
         * Formata a moeda para float
         */
        public static function realTofloat($valor) {
            $valor = str_replace(".", "", $valor);
            $valor = str_replace(",", ".", $valor);
            return $valor;
        }
		
		/**
		 * Remove a máscara de uma string
		 */
		public static function removerMascara($texto) {
			$texto = str_replace("-", "", $texto);
			$texto = str_replace(".", "", $texto);
			$texto = str_replace("/", "", $texto);
			return $texto;
		}
		
		/**
		 * Adiciona uma máscara ao texto
		 */
		public static function mascara($tipo, $texto) {
			switch( $tipo ) {
				case "cpf":
					$texto = substr($texto, 0, 3).".".substr($texto, 3, 3).".".substr($texto, 6, 3)."-".substr($texto, 9);
					break;
				case "cnpj":
					$texto = substr($texto, 0, 2).".".substr($texto, 2, 3).".".substr($texto, 5, 3)."/".substr($texto, 8, 4)."-".substr($texto, 12);
					break;
			}
			return $texto;
		}

        /**
         * Remove os acentos de uma string
         */
        public static function removerAcentos($string) {
            $caracteres_sem_acento = array(
                'Š'=>'S', 'š'=>'s', 'Ð'=>'Dj',''=>'Z', ''=>'z', 'À'=>'A', 'Á'=>'A', 'Â'=>'A', 'Ã'=>'A', 'Ä'=>'A',
                'Å'=>'A', 'Æ'=>'A', 'Ç'=>'C', 'È'=>'E', 'É'=>'E', 'Ê'=>'E', 'Ë'=>'E', 'Ì'=>'I', 'Í'=>'I', 'Î'=>'I',
                'Ï'=>'I', 'Ñ'=>'N', 'Ń'=>'N', 'Ò'=>'O', 'Ó'=>'O', 'Ô'=>'O', 'Õ'=>'O', 'Ö'=>'O', 'Ø'=>'O', 'Ù'=>'U', 'Ú'=>'U',
                'Û'=>'U', 'Ü'=>'U', 'Ý'=>'Y', 'Þ'=>'B', 'ß'=>'Ss','à'=>'a', 'á'=>'a', 'â'=>'a', 'ã'=>'a', 'ä'=>'a',
                'å'=>'a', 'æ'=>'a', 'ç'=>'c', 'è'=>'e', 'é'=>'e', 'ê'=>'e', 'ë'=>'e', 'ì'=>'i', 'í'=>'i', 'î'=>'i',
                'ï'=>'i', 'ð'=>'o', 'ñ'=>'n', 'ń'=>'n', 'ò'=>'o', 'ó'=>'o', 'ô'=>'o', 'õ'=>'o', 'ö'=>'o', 'ø'=>'o', 'ù'=>'u',
                'ú'=>'u', 'û'=>'u', 'ü'=>'u', 'ý'=>'y', 'ý'=>'y', 'þ'=>'b', 'ÿ'=>'y', 'ƒ'=>'f',
                'ă'=>'a', 'î'=>'i', 'â'=>'a', 'ș'=>'s', 'ț'=>'t', 'Ă'=>'A', 'Î'=>'I', 'Â'=>'A', 'Ș'=>'S', 'Ț'=>'T',
            );
            $nova_string = preg_replace("/[^a-zA-Z0-9 ]/", "", strtr($string, $caracteres_sem_acento));
            return trim($nova_string);
        }

        /**
         * Converte uma lista pra utf8
         */
        public static function listUtf8Encode(&$list) {
            foreach( $list as &$item ) {
                $item = utf8_encode($item);
            }
        }
		
				
		/**
		 * Gera a breadcrum
		 */
		public static function breadcrum($itens) {
			$itens = $itens;
			require_once("../views/helpers/breadcrum.php");
		}
		
		/**
		 * Cria um link preservando os parâmetros
		 */
		public static function createLink($uri, $exclude = array()) {
			$get = $_GET;
			$params = explode("?", $uri);
			if( count($params) > 1 ) {
				$params2 = explode("&", $params[1]);
				foreach( $params2 as $param ) {
					$params3 = explode("=", $param);
					if( count($params3) > 1 ) {
						$get[$params3[0]] = $params3[1];
					}
				}
			}	
			foreach( $exclude as $ex ) {
				if( isset($get[$ex]) ) {
					unset($get[$ex]);
				}
			}
			return $params[0] . "?" . http_build_query($get);die;
		}
		
		/**
		 * Carrega a tela de erro
		 */
		public static function erro($tipo) {
			Util::redirect("?controle=erro&acao=index&tipo=".$tipo);
		}
		
		/**
		 * Escapa uma string
		 */
		public static function escapeString($str) {
			$replacementMap = [
				"\0" => "\\0",
				"\n" => "\\n",
				"\r" => "\\r",
				"\t" => "\\t",
				chr(26) => "\\Z",
				chr(8) => "\\b",
				'"' => '\"',
				"'" => "\'",
				'_' => "\_",
				"%" => "\%",
				'\\' => '\\\\'
			];

			return \strtr($str, $replacementMap);
		}
		
		/**
		 * Registra uma notificação de sistema
		 */
		public static function notification($type, $msg) {
			$_SESSION["notification"][$type] = $msg;
		}
    }

?>