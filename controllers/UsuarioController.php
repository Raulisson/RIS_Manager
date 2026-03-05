<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require_once('../library/php-mailer/src/PHPMailer.php');
require_once('../library/php-mailer/src/SMTP.php');
require_once('../library/php-mailer/src/Exception.php');

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
        $db = Database::getConn();
        $this->perfil = $db->acl_grupo()->order('id');
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

     public function convite()
    {
        $db = Database::getConn();
        // Carrega os grupos
        $gruposDb = $db->acl_grupo()->where("publico = 1")->order("nome");
        $this->grupos = array();
        foreach ($gruposDb as $grupoDb) {
            $this->grupos[] = array(
                "id" => $grupoDb["id"],
                "nome" => htmlspecialchars(utf8_encode($grupoDb["nome"]))
            );
        }
        $this->render('usuario/convidar');
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

    public function convidar()
    {
        $db = Database::getConn();

        if ($_POST['email'] && $_POST['nome'] && $_POST['perfil']) {
            $email  = utf8_decode($_POST['email']);
            $nome   = utf8_decode($_POST['nome']);
            $perfil = $_POST['perfil'];
            $plano  = 4;
            $token  = bin2hex(random_bytes(32));
            $senhaTemporaria = substr(md5(rand()), 0, 8);

            $usuario = array(
                'id_empresa'       => Security::usuario()['id_empresa'],
                'nome'             => $nome,
                'email'            => $email,
                'perfil'           => $perfil,
                'id_plano'         => $plano,
                'senha'            => sha1(md5($senhaTemporaria)),
                'token'            => $token
            );

            $usuarioId = $db->usuario()->insert($usuario);

            // Enviar email com o link
            $protocolo = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? "https" : "http";
            $host = $_SERVER['HTTP_HOST'];

            $link = "$protocolo://$host/public/index.php?controle=usuario&acao=definirSenha&token=$token";

            $mensagem = "Olá $nome,<br><br>Você foi convidado para acessar o sistema. Clique no link abaixo para definir sua senha:<br><a href='$link'>$link</a>";

            try {
                $mail = new PHPMailer(true);

                // Configurações do servidor SMTP
                $mail->isSMTP();
                $mail->Host       = 'smtp.gmail.com';
                $mail->SMTPAuth   = true;
                $mail->Username   = 'naoresponda.cbdooh@gmail.com';
                $mail->Password   = 'onam fyya mgce nede';
                $mail->SMTPSecure = 'ssl';
                $mail->Port       = 465;

                // Remetente e destinatário
                $mail->setFrom('naoresponda.cbdooh@gmail.com', 'RVA - Sistema');
                $mail->addAddress($email, $nome);

                // Conteúdo
                $mail->isHTML(true);
                $mail->CharSet = 'UTF-8';
                $mail->Subject = 'Definição de senha';

                // Corpo do e-mail
                $mail->Body = "
                    <p>Olá, <strong>$nome</strong>.</p>
                    <p>Você foi cadastrado no sistema de gestão e precisa definir sua senha de acesso.</p>
                    <p>
                        <a href='$link' style='
                            padding: 10px 20px;
                            background-color: #007BFF;
                            color: #fff;
                            text-decoration: none;
                            border-radius: 5px;
                            display: inline-block;
                        '>Clique aqui para definir sua senha</a>
                    </p>
                    <p>Se você não reconhece essa solicitação, apenas ignore este e-mail.</p>
                ";

                $mail->AltBody = "Olá, $nome. Acesse o seguinte link para definir sua senha: $link";

                $mail->send();
                
                Util::redirect('index.php?controle=usuario&acao=listar');
            } catch (Exception $e) {
                error_log("Erro ao enviar e-mail de definição de senha: {$mail->ErrorInfo}");
                
            }
            Util::redirect('index.php?controle=usuario&acao=listar');
        }
    }

    public function definirSenha()
    {
        $db = Database::getConn();
        
        if (!isset($_GET['token'])) {
            $this->render('usuario/login', 'basic');
        }

        $usuario = $db->usuario('token', $_GET['token'])->fetch();

        if (!$usuario) {
            Util::erro("Token não encontrado ou expirado.");
        }

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {

            $usuario['senha'] = sha1(md5($_POST['senha']));
            $usuario['token'] = null;

            $usuario->update();

            Util::redirect("index.php?controle=usuario&acao=login");
        }

        // Renderizar formulário de definição de senha
        $this->render('usuario/definirSenha', 'basic');
    }
    
    public function checarEmail()
    {
        $db = Database::getConn();

        // Pega os dados enviados via GET
        $email = isset($_GET['email']) ? trim($_GET['email']) : '';
        $id = isset($_GET['id']) ? intval($_GET['id']) : 0;

        // Verifica se o e-mail está sendo usado por outro cliente (excluindo o atual, se for edição)
        $usuarioExistente = $db->usuario()
            ->where('email = ?', $email)
            ->where('id != ?', $id)
            ->fetch();

        // Retorna 1 se estiver disponível, 0 se já existir
        echo $usuarioExistente ? "0" : "1";
        exit;
    }

}
