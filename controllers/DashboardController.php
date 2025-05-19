<?php

class DashboardController extends AbstractController
{
    public function dashboard()
    {
        $db = Database::getConn(true);
        $idUsuario = Security::usuario()['id'];
        $hoje = new DateTime();

        $this->vendasPosVenda = [];
        $this->qtdPosVenda = 0;

        // Data de início da semana atual (segunda-feira)
        $inicioSemanaAtual = clone $hoje;
        $inicioSemanaAtual->modify('monday this week')->setTime(0, 0, 0);

        // Data de fim da semana atual (domingo)
        $fimSemanaAtual = clone $inicioSemanaAtual;
        $fimSemanaAtual->modify('sunday this week')->setTime(23, 59, 59);

        // Semana passada: segunda-feira até domingo
        $inicioSemanaPassada = clone $inicioSemanaAtual;
        $inicioSemanaPassada->modify('-7 days');

        $fimSemanaPassada = clone $fimSemanaAtual;
        $fimSemanaPassada->modify('-7 days');

        // Busca vendedores vinculados ao usuário logado
        $vendedores = $db->vendedor()->where('id_usuario', $idUsuario);

        foreach ($vendedores as $vendedor) {
            $idVendedor = $vendedor['id'];

            // Busca vendas do vendedor
            $vendas = $db->venda()->where('id_vendedor', $idVendedor);

            foreach ($vendas as $venda) {
                $dataEncerramento = $venda['data_encerramento'];

                if (!empty($dataEncerramento)) {
                    $dataEncerramentoObj = new DateTime($dataEncerramento);

                    // Verifica se a venda foi encerrada na semana passada
                    if ($dataEncerramentoObj >= $inicioSemanaPassada && $dataEncerramentoObj <= $fimSemanaPassada) {
                        $this->vendasPosVenda[] = $venda;
                    }
                }
            }
        }

        $this->qtdPosVenda = count($this->vendasPosVenda);

        //  CLIENTES ANTIGOS (sem atualização há pelo menos 6 meses)
        $dataLimite = (clone $hoje)->modify('-6 months');

        $clientesAntigos = [];
        foreach ($db->cliente() as $cliente) {
            if (!empty($cliente['ultima_atualizacao'])) {
                $ultimaAtualizacao = new DateTime($cliente['ultima_atualizacao']);
                if ($ultimaAtualizacao < $dataLimite) {
                    $clientesAntigos[] = $cliente;
                }
            }
        }

        $this->qtdClientesAntigos = count($clientesAntigos);
        $this->clientesAntigosIds = array_column($clientesAntigos, 'id');
        
        //PROSPECAÇÃO
        $this->prospeccoesfeitas = [];
        foreach ($vendedores as $vendedor) {
            $idVendedor = $vendedor['id'];

            // Busca vendas do vendedor
            $prospeccoes = $db->prospeccao()->where('id_vendedor', $idVendedor);

            foreach ($prospeccoes as $prospeccao) {
                $this->prospeccoesfeitas[] = $prospeccao;
            }
        }

        $this->qtdProspeccao = count($this->prospeccoesfeitas);

        $this->render('dashboard/dashboard', 'default');
    }


    public function pos_venda()
    {
        if (Security::usuario()['perfil'] == 1 || Security::usuario()['perfil'] == 2 || Security::usuario()['perfil'] == 3) {
            $db = Database::getConn();
            $this->perfil = $db->acl_grupo()->order('id');
            $this->vendedores = $db->vendedor()->order('id');

            // Pega os IDs da URL e transforma em array
            $ids = isset($_GET['ids']) ? explode(',', $_GET['ids']) : [];

            if (empty($ids) || $ids == [""]) {
                echo '<div style="display: flex; align-items: center; justify-content: center; height: 100vh; text-align: center;">
                    <div>
                        <h2 style="color: #333;">Nenhum cliente para pós-venda hoje</h2>
                        <p style="color: #666; font-size: 16px;">Você não possui atendimentos de pós-venda agendados para o dia de hoje.</p>
                        <a href="index.php?controle=dashboard&acao=dashboard" style="display: inline-block; margin-top: 20px; padding: 10px 20px; background-color: #007bff; color: #fff; text-decoration: none; border-radius: 4px;">Voltar ao dashboard</a>
                    </div>
                </div>';
                return;
            }

            $ids = array_unique(array_filter($ids));

            // Se houver IDs, aplica filtro
            if (!empty($ids)) {
                $idsStr = implode(",", array_map('intval', $ids)); // Segurança básica

                $this->pagination = new Pagination("cliente", null, []);
                $this->pagination->columnsFilters = array("id", "nome", "email");
                $this->pagination->filters[] = "id IN ($idsStr)";
            } else {
                
            }

            $this->pagination->load();

            // Renderiza a view de clientes
            $this->render('cliente/lista', 'default');
        } else {
            $this->render('index/inicio', 'default');
        }
    }

    public function clientes_antigos()
    {
        if (Security::usuario()['perfil'] == 1 || Security::usuario()['perfil'] == 2 || Security::usuario()['perfil'] == 3) {
            $db = Database::getConn();
            $this->perfil = $db->acl_grupo()->order('id');
            $this->vendedores = $db->vendedor()->order('id');

            // Pega os IDs da URL e transforma em array
            $ids = isset($_GET['ids']) ? explode(',', $_GET['ids']) : [];

            if (empty($ids) || $ids == [""]) {
                echo '<div style="display: flex; align-items: center; justify-content: center; height: 100vh; text-align: center;">
                    <div>
                        <h2 style="color: #333;">Nenhum cliente há pelo menos 6 meses sem contato</h2>
                        <p style="color: #666; font-size: 16px;">Não há nenhum cliente na carteira de nenhum vendedor sem contato!</p>
                        <a href="index.php?controle=dashboard&acao=dashboard" style="display: inline-block; margin-top: 20px; padding: 10px 20px; background-color: #007bff; color: #fff; text-decoration: none; border-radius: 4px;">Voltar ao dashboard</a>
                    </div>
                </div>';
                return;
            }

            $ids = array_unique(array_filter($ids));

            // Se houver IDs, aplica filtro
            if (!empty($ids)) {
                $idsStr = implode(",", array_map('intval', $ids)); // Segurança básica

                $this->pagination = new Pagination("cliente", null, []);
                $this->pagination->columnsFilters = array("id", "nome", "email");
                $this->pagination->filters[] = "id IN ($idsStr)";
            } else {
                
            }

            $this->pagination->load();

            // Renderiza a view de clientes
            $this->render('cliente/lista', 'default');
        } else {
            $this->render('index/inicio', 'default');
        }
    }
    
    public function prospeccao()
    {
        if (Security::usuario()['perfil'] == 2 || Security::usuario()['perfil'] == 3) {
            $db = Database::getConn();
            $this->vendedores = $db->vendedor()->order('id');
            $this->perfil = $db->acl_grupo()->order('id');
            $this->clientes = $db->cliente()->order('id');

            // Pega os IDs da URL e transforma em array
            $ids = isset($_GET['ids']) ? explode(',', $_GET['ids']) : [];

            $ids = array_unique(array_filter($ids));

            // Se houver IDs, aplica filtro
            if (!empty($ids)) {
                
                $idsStr = implode(",", array_map('intval', $ids)); // Segurança básica

                $this->pagination = new Pagination("prospeccao", null, []);
                $this->pagination->columnsFilters = array("id", "observacao");
                $this->pagination->filters[] = "id IN ($idsStr)";
            } elseif (!empty($_GET['search'])) {
                $filtro = $_GET['search'];
                $this->pagination = new Pagination("prospeccao", null, array());
                $this->pagination->columnsFilters = array("id", "nome");
                $this->pagination->filters[] = "empresa LIKE '%" . $filtro . "%'";
            }else{
                $this->pagination = new Pagination("prospeccao", null, array());
                $this->pagination->columnsFilters = array("id", "nome");
            }

            $this->pagination->load();

            // Renderiza a view de clientes
            $this->render('dashboard/prospeccao', 'default');
        } elseif (Security::usuario()['perfil'] == 1) {
            $db = Database::getConn();
            $this->vendedores = $db->vendedor()->order('id');
            $this->perfil = $db->acl_grupo()->order('id');
            $this->clientes = $db->cliente()->order('id');
            // Se houver IDs, aplica filtro
            if (!empty($ids)) {
                $idsStr = implode(",", array_map('intval', $ids)); // Segurança básica
                $this->pagination = new Pagination("prospeccao", null, []);
                $this->pagination->columnsFilters = array("id", "observacao");
                $this->pagination->filters[] = "id IN ($idsStr)";
            } elseif (!empty($_GET['search'])) {
                $filtro = $_GET['search'];
                $this->pagination = new Pagination("prospeccao", null, array());
                $this->pagination->columnsFilters = array("id", "nome");
                $this->pagination->filters[] = "empresa LIKE '%" . $filtro . "%'";
            }else{
                $this->pagination = new Pagination("prospeccao", null, array());
                $this->pagination->columnsFilters = array("id", "nome");
            }
            $this->pagination->load();
            $this->render('dashboard/prospeccoesadmin', 'default');
        } else{
            $this->render('index/inicio', 'default');
        }
    }
}
