<?php

class ClienteController extends AbstractController
{

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
        $this->pagination = new Pagination("cliente", null, array());
        $this->pagination->columnsFilters = array("id", "nome", "email");
        $this->pagination->filters[] = "id_empresa = " . Security::usuario()['id_empresa'];
        $this->pagination->load();

        // Renderiza a view
        $this->render('cliente/lista', 'default');
        } else{
            $this->render('index/inicio', 'default');
        }
    }

    public function form()
    {
        $db = Database::getConn();
        $this->vendedores = $db->vendedor()->order('id');
        // Carrega os detalhes
        if (isset($_GET['id'])) {
            $this->cliente = $db->cliente('id', $_GET['id'])->fetch();
            // Verifica se é um registro válido
            if (!$this->cliente) {
                Util::erro(ERRO_REGISTRO_NAO_ENCONTRADO);
                }

                $this->cliente["nome"] = htmlspecialchars(utf8_encode($this->cliente["nome"]));
                $this->cliente["empresa"] = htmlspecialchars(utf8_encode($this->cliente["empresa"]));
                
            
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
        }

        // Preenche os dados do cliente com validações básicas
        $cliente['nome']         = trim($_POST['nome'] ?? '');
        $cliente['email']        = trim($_POST['email'] ?? '');
        $cliente['numero']       = trim($_POST['numero'] ?? '');
        $cliente['empresa']      = trim($_POST['empresa'] ?? '');
        $cliente['id_vendedor']  = $_POST['vendedor_id'] ?: null;
        $cliente['id_empresa']   = Security::usuario()['id_empresa'];

        // Verifica se é atualização ou criação
        if (!empty($_POST['id'])) {
            $clienteId = $_POST['id'];
            $cliente->update();
        } else {
            $clienteId = $db->cliente()->insert($cliente);
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
