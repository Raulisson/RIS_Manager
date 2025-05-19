<?php

class VendaController extends AbstractController
{


    public function venda_passo_1(){
        $this->render('venda/inicio_1', 'default');
    }
    public function venda_passo_2(){
        $this->render('venda/inicio_2', 'default');
    }
    /**
     * Lista os clientes
     */
    public function listar()
    {
        if(Security::usuario()['perfil'] == 1 || Security::usuario()['perfil'] == 2){
        // Carrega os clientes
        $db = Database::getConn();
        $this->perfil = $db->acl_grupo()->order('id');
        $this->vendedores = $db->vendedor()->order('id');


         if (!empty($_GET['search'])) {
                $filtro = $_GET['search'];
                $this->pagination = new Pagination("cliente", null, array());
                $this->pagination->columnsFilters = array("id", "nome", "email");
                $this->pagination->filters[] = "empresa LIKE '%" . $filtro . "%'";
        }else{
            $this->pagination = new Pagination("cliente", null, array());
            $this->pagination->columnsFilters = array("id", "nome", "email");
        }
        
        
        $this->pagination->load();

        // Renderiza a view
        $this->render('cliente/lista', 'default');
        } else{
            $this->render('index/inicio', 'default');
        }
    }

    public function form()
        {
            $bloquear = isset($_GET['visualizar']) && $_GET['visualizar'] == '1';
            $this->bloquear = $bloquear;
            $db = Database::getConn();
            $this->vendedores = $db->vendedor()->order('id');
            // Carrega os detalhes
            if (isset($_GET['id'])) {
                $this->cliente = $db->cliente('id', $_GET['id'])->fetch();
                $this->cliente_observacao = $db->observacao_cliente()->order('id');
                // Verifica se é um registro válido
                if (!$this->cliente) {
                    Util::erro(ERRO_REGISTRO_NAO_ENCONTRADO);
                    }

                    //$this->cliente["nome"] = htmlspecialchars(utf8_encode($this->cliente["nome"]));
                    //$this->cliente["empresa"] = htmlspecialchars(utf8_encode($this->cliente["empresa"]));
                    //$this->cliente_observacao["observacao"] = htmlspecialchars(utf8_encode($this->cliente_observacao["observacao"]));
                    //$this->cliente_observacao["data_hora"] = htmlspecialchars(utf8_encode($this->cliente_observacao["data_hora"]));
                    //echo "<pre>";print_r($this->cliente_observacao);die;

                }
                
                $this->render('cliente/form');
        }

    public function checarEmail()
    {
        $db = Database::getConn();

        // Pega os dados enviados via GET
        $email = isset($_GET['email']) ? trim($_GET['email']) : '';
        $id = isset($_GET['id']) ? intval($_GET['id']) : 0;

        // Verifica se o e-mail está sendo usado por outro cliente (excluindo o atual, se for edição)
        $clienteExistente = $db->cliente()
            ->where('email = ?', $email)
            ->where('id != ?', $id)
            ->fetch();

        // Retorna 1 se estiver disponível, 0 se já existir
        echo $clienteExistente ? "0" : "1";
        exit;
    }

    
    public function salvar()
    {
        $db = Database::getConn();

        // Verifica se é edição
        if (!empty($_POST['id'])) {
            $cliente = $db->cliente('id', $_POST['id'])->fetch();
            
            // Verifica se o cliente existe e se pertence à empresa do usuário
            Security::checkCompany($cliente);
        } else {
            $cliente = [];
            $observacao_cliente = [];
        }

        // Preenche os dados do cliente com validações básicas
        $cliente['nome']         = trim($_POST['nome'] ?? '');
        $cliente['email']        = trim($_POST['email'] ?? '');
        $cliente['numero']       = trim($_POST['numero'] ?? '');
        $cliente['empresa']      = trim($_POST['empresa'] ?? '');
        $cliente['cnpj']       = trim($_POST['cnpj'] ?? '');
        $cliente['razao_social']      = trim($_POST['razao_social'] ?? '');
        $cliente['compra']      = trim($_POST['compra'] ?? '');
        $cliente['id_vendedor']  = $_POST['vendedor_id'] ?: null;
        $cliente['id_empresa']   = Security::usuario()['id_empresa'];

        //Observação
        $observacao_cliente['observacao']       = trim($_POST['observacao'] ?? '');

        
        // Verifica se é atualização ou criação
        if (!empty($_POST['id'])) {
            $clienteId = $_POST['id'];
            $observacao_cliente['id_cliente']       = $clienteId;
            $observacaoId = $db->observacao_cliente()->insert($observacao_cliente);
            $cliente->update();
        } else {
            $clienteId = $db->cliente()->insert($cliente);
            $observacao_cliente['id_cliente']       = $clienteId;
            $observacaoId = $db->observacao_cliente()->insert($observacao_cliente);
        }

        Util::redirect('index.php?controle=cliente&acao=listar');
    }

    public function excluir()
    {
        if (isset($_GET['id'])) {
            $db = Database::getConn();
            $cliente = $db->cliente('id', $_GET['id'])->fetch();


            $cliente->delete();
            Util::redirect('index.php?controle=cliente&acao=listar');
        }
    }

    
}
