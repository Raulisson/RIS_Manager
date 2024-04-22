<?php

	/**
     * Paginação das grids
     */
    class Pagination {

        public $tableName;
        public $limit 	= 10;
        public $total   = 0;
        public $pages   = 0;
        public $filters = array();
        public $order   = '';
        public $rows	= array();
		public $columnsFilters = array();

        // Construtor
        function __construct($tableName, $order = null, $filters = array()) {
            $this->tableName    = $tableName;
            $this->filters      = $filters;
			
			// Ordenação
			if( $order ) {
				$this->order = $order;
			} else if( isset($_GET['ordem']) ) {
				$this->order = $_GET['ordem'];
			} else {
				$this->order = "{$tableName}.id DESC";
			}
            if( isset($_GET['limite']) ) {
                $this->limit = $_GET['limite'];
            }
        }

        // Carrega os registros
        function load() {
            $db = Database::getConn(true);

            // Carrega os registros
            $this->total = $db->{$this->tableName}()->select($this->tableName.".id");
            $this->rows =  $db->{$this->tableName}()
                ->order($this->order);
				
			// Filtros por palavra-chave
			if( isset($_GET["grid-filtro"]) ) { // 
				foreach( $this->columnsFilters as $col ) {
					$columnsFilter[] = "$col LIKE '%".Util::escapeString($_GET["grid-filtro"])."%'";
				}
				$this->filters[] = "(" . implode(" OR ", $columnsFilter) . ")";
			}
				
            // Filtros customizáveis
            if( count($this->filters) ) {
				$where = implode(" AND ", $this->filters);
				$this->rows->where($where);
				$this->total->where($where);
            }
			
			// Filtro por status
			if( isset($_GET["filter-ativo"]) ) {
				if( $_GET["filter-ativo"] == 1 ) {
					$this->rows->where($this->tableName . ".ativo = 1");
					$this->total->where($this->tableName . ".ativo = 1");
				} else if( $_GET["filter-ativo"] == 0 ) {
					$this->rows->where($this->tableName . ".ativo = 0");
					$this->total->where($this->tableName . ".ativo = 0");
				}
			}

			// Contabiliza os registros
            $this->total = $this->total->count();            
            $this->pages = ceil($this->total / $this->limit);
            $offset = ( isset($_GET['pagina']) ) ? ( $_GET['pagina'] - 1 ) * $this->limit : 0;

            // Limit/offset
            $this->rows->limit($this->limit, $offset);
        }

        // Exibe a paginação
        function show() {
            $_GET['pagina'] = ( isset($_GET['pagina']) ) ? $_GET['pagina'] : 1;
            $params = $_GET;

            // Anterior
            $pagAnterior = ( $_GET['pagina'] > 1 ) ? $_GET['pagina'] - 1 : 1;
            $params['pagina'] = $pagAnterior;
            $link = http_build_query($params);
            $liPages = "
                <li class='paginate_button page-item previous'><a href='?{$link}' class='page-link'>Anterior</a></li>
            ";

            // Limites de Páginas
            $paginas = array();
            $pAnt = 0;
            $pPos = 0;
            for( $i = 1; $i <= $this->pages; $i++ ) {
                $paginas[] = $i;
                if( $i < $_GET['pagina'] ) {
                    $pAnt ++;
                    if( $pAnt > 3 ) {
                        array_shift($paginas);   
                    }
                } else {
                    $pPos ++;
                    if( $pPos > 5 ) {
                        break;
                    }   
                }
            }

            // Páginas
            foreach( $paginas as $i ) {
                $active = ( isset($_GET['pagina']) && $_GET['pagina'] == $i ) ? 'active' : '';
                $params['pagina'] = $i;
                $link = http_build_query($params);
                $liPages .= "<li class='paginate_button page-item {$active}'><a href='?{$link}' class='page-link'>{$i}</a></li>";
            }

            // Próxima
            $pagProx = ( $_GET['pagina'] < $this->pages ) ? $_GET['pagina'] + 1 : $_GET['pagina'];  
            $params['pagina'] = $pagProx;
            $link = http_build_query($params);
            $liPages .= "
                <li class='paginate_button page-item previous'><a href='?{$link}' class='page-link'>Próxima</a></li>
            ";

            // Html
            $init = ($_GET['pagina'] - 1) * $this->limit + 1;
            $end = ( $_GET['pagina'] * $this->limit );
			if( $this->total == 0 ) {
				$init = 0;
				$end = 0;
			}
            if( $_GET['pagina'] == $this->pages ) {
                $end = $this->total;
            }
            $params['limite'] = '99999';
            $params['pagina'] = '1';
            $link = http_build_query($params);
            echo "
                <div class='row mt-4'>
                    <div class='col-md-4'>
                        <div>Exibindo {$init} à {$end} (Total de <a href='?{$link}'>{$this->total}</a>)</div>
                    </div>
                    <div class='col-md-8'>
                        <div class='d-flex'>
                            <ul class='pagination ml-auto'>{$liPages}</ul>
                        </div>
                    </div>
                </div>
            ";
        }
		
		// Gera o link da coluna
		function column($column, $label) {
			$get = $_GET;
			if( isset($get["pagina"]) ) {
				unset($get["pagina"]);
			} 
			$params = "?ordem=" . $column;
			if( isset($_GET["ordem"]) ) {
				if( $get["ordem"] == $column ) {
					$params .= "+DESC";					
				}
				unset($get["ordem"]);
			}

			if( count($get) ) {
				$params .= "&".http_build_query($get);
			}
			
			$html = "<a href='{$params}' class='link-order'>" . $label . "</a>";
			
			return $html;
		}
		
		// Calcula a quantidade de registro com novos filtros
		function countBy($newFilter = array()) {
			
			if( count($newFilter) ) {
				$filters = array_merge($this->filters, $newFilter);
			} else {
				$filters = $this->filters;
			}
			$where = implode(" AND ", $filters);
			
			// Calcula
			$db = Database::getConn(true);
			$total = $db->{$this->tableName}()
				->select($this->tableName.".id")->where($where)->count();
			return $total;
		}
    }
    

?>