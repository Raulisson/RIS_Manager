<?php

class VendedorController extends AbstractController
{

    /**
     * Lista os vendedores cadastrados
     */
    public function listar()
    {
        if(Security::usuario()['perfil'] == 1 || Security::usuario()['perfil'] == 2 || Security::usuario()['perfil'] == 3){
        // Carrega os vendedors
        $db = Database::getConn();
        $this->perfil = $db->acl_grupo()->order('id');
        $this->vendedores = $db->vendedor()->order('id');


        $this->pagination = new Pagination("vendedor", null, array());
        $this->pagination->columnsFilters = array("id", "nome");
        $this->pagination->load();

        // Renderiza a view
        $this->render('vendedor/lista', 'default');
        } else{
            $this->render('index/inicio', 'default');
        }
    }

    public function form()
    {
        $db = Database::getConn();
        $this->usuarios = $db->usuario()->order('id');
        // Carrega os detalhes
        if (isset($_GET['id'])) {
            $this->vendedor = $db->vendedor('id', $_GET['id'])->fetch();
            
            // Verifica se é um registro válido
            if (!$this->vendedor) {
                Util::erro(ERRO_REGISTRO_NAO_ENCONTRADO);
                }

                //$this->vendedor["nome"] = htmlspecialchars(utf8_encode($this->vendedor["nome"]));
                //$this->vendedor["empresa"] = htmlspecialchars(utf8_encode($this->vendedor["empresa"]));
                //$this->vendedor_observacao["observacao"] = htmlspecialchars(utf8_encode($this->vendedor_observacao["observacao"]));
                //$this->vendedor_observacao["data_hora"] = htmlspecialchars(utf8_encode($this->vendedor_observacao["data_hora"]));
                //echo "<pre>";print_r($this->vendedor_observacao);die;

            }
            
            $this->render('vendedor/form');
    }
    
    public function salvar()
    {
        $db = Database::getConn();

        // Verifica se é edição
        if (!empty($_POST['id'])) {
            $vendedor = $db->vendedor('id', $_POST['id'])->fetch();
            
        } else {
            $vendedor = [];
        }

        // Preenche os dados do vendedor com validações básicas
        $vendedor['nome']         = trim($_POST['nome'] ?? '');
        $vendedor['id_usuario']  = $_POST['usuario_id'] ?: null;
        $vendedor['dias_pos_venda']  = $_POST['dias_pos_venda'] ?: null;

        
        // Verifica se é atualização ou criação
        if (!empty($_POST['id'])) {
            $vendedorId = $_POST['id'];
            $vendedor->update();
        } else {
            $vendedorId = $db->vendedor()->insert($vendedor);
        }

    
        Util::redirect('index.php?controle=vendedor&acao=listar');
        
    }

    public function excluir()
    {
        if (isset($_GET['id'])) {
            $db = Database::getConn();
            $vendedor = $db->vendedor('id', $_GET['id'])->fetch();


            $vendedor->delete();
            Util::redirect('index.php?controle=vendedor&acao=listar');
        }
    }

    
}
