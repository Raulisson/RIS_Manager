<?php

class UsuarioController extends AbstractController
{

    /**
     * Carrega a tela de login
     */
    public function login()
    {
        $this->render('usuario/login', 'basic');
    }

    /**
     * Autentica o usuário
     */
    public function autenticar()
    {
        if (isset($_POST['email']) && isset($_POST['senha'])) {

            $db = Database::getConn();
            $usuario = $db->usuario()
                ->where(array('email' => $_POST['email'], 'senha' => sha1(md5($_POST['senha']))))
                ->fetch();

            if ($usuario) {
                $_SESSION['usuario']['id']          = $usuario['id'];
                $_SESSION['usuario']['nome']        = $usuario['nome'];
                $_SESSION['usuario']['email']       = $usuario['email'];
                $_SESSION['usuario']['perfil']       = $usuario['perfil'];
                $_SESSION['usuario']['id_plano']       = $usuario['id_plano'];
                $_SESSION['usuario']['id_empresa']  = $usuario['id_empresa'];

                Util::redirect("index.php?controle=dashboard&acao=dashboard");
            } else {
                Util::redirect("index.php?controle=usuario&acao=login&erro=1");
            }
        }
    }

    /**
     * Lista os usuários
     */
    public function listar()
    {
        if(Security::usuario()['perfil'] == 1){
        // Carrega os usuários
        $this->pagination = new Pagination("usuario", null, array());
        $this->pagination->columnsFilters = array("id", "nome", "email");
        $this->pagination->filters[] = "id_empresa = " . Security::usuario()['id_empresa']; // Filtro por empresa
        $this->pagination->load();

        // Renderiza a view
        $this->render('usuario/lista', 'default');
        } else{
            $this->render('index/inicio', 'default');
        }
    }

    /**
     * Sair
     */
    public function sair()
    {
        session_destroy();
        Util::redirect('index.php?controle=usuario&acao=login');
    }

    /**
     * Formulário de usuário
     */
    public function form()
    {
        $db = Database::getConn();

        // Carrega os detalhes do usuário
        if (isset($_GET['id'])) {
            $this->usuario = $db->usuario('id', $_GET['id'])->fetch();

            // Verifica se é um registro válido
            if (!$this->usuario) {
                Util::erro(ERRO_REGISTRO_NAO_ENCONTRADO);
            }

            $this->usuario["nome"] = htmlspecialchars(utf8_encode($this->usuario["nome"]));
            $this->usuario["email"] = htmlspecialchars(utf8_encode($this->usuario["email"]));

            // Relação com os grupos
            $gruposRels = $db->acl_grupo_usuario('id_usuario', $_GET['id']);
            foreach ($gruposRels as $grupoRel) {
                $this->gruposUsuario[] = $grupoRel['id_acl_grupo'];
            }
             // Checa a empresa proprietária do registro
            Security::checkCompany($this->usuario);
        }

        // Carrega os grupos
        $gruposDb = $db->acl_grupo()->where("publico = 1")->order("nome");
        $this->grupos = array();
        foreach ($gruposDb as $grupoDb) {
            $this->grupos[] = array(
                "id" => $grupoDb["id"],
                "nome" => htmlspecialchars(utf8_encode($grupoDb["nome"]))
            );
        }
        $this->render('usuario/form');
    }

    /**
     * Salva um usuário
     */
    public function salvar()
    {
        $db = Database::getConn();
        $this->gruposUsuario = array();
        $perfil = ($_POST['perfil']);
        $plano = "4";

        // Recupera o usuário no caso de edição, ou cria um array para o novo
        if ($_POST['id']) {
            $usuario = $db->usuario('id', $_POST['id'])->fetch();

            // Checa a empresa proprietária do registro
            Security::checkCompany($usuario);
        } else {
            $usuario = array();
        }

        // Preenche os campos
        $usuario['id_empresa']      = Security::usuario()['id_empresa'];
        $usuario['nome']            = utf8_decode($_POST['nome']);
        $usuario['email']             = utf8_decode($_POST['email']);
        $usuario['perfil']             = $perfil;
        $usuario['id_plano']            =  $plano;
        if ($_POST['senha']) {
            $usuario['senha']       = sha1(md5(utf8_decode($_POST['senha'])));
        }

        // Salva no banco
        if ($_POST['id']) {
            $usuarioId = $_POST['id'];
            $usuario->update();
        } else {
            $usuarioId = $db->usuario()->insert($usuario);
        }

        // Salva a relação com os grupos
        $db->acl_grupo_usuario('id_usuario', $usuarioId)->delete();
        if (isset($_POST['grupos'])) {
            foreach ($_POST['grupos'] as $grupoId) {
                $db->acl_grupo_usuario()->insert(array(
                    'id_acl_grupo' => $grupoId,
                    'id_usuario' => $usuarioId
                ));
            }
        }

        Util::redirect('index.php?controle=usuario&acao=listar');
    }

    /**
     * Remove um usuário
     */
    public function excluir()
    {
        if (isset($_GET['id'])) {
            $db = Database::getConn();
            $usuario = $db->usuario('id', $_GET['id'])->fetch();

            // Checa a empresa proprietária do registro
            Security::checkCompany($usuario);

            $usuario->delete();
            Util::redirect('index.php?controle=usuario&acao=listar');
        }
    }
}
