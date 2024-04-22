<?php

class salaController extends AbstractController
{
    public function listar()
    {

        // Carrega as salas
        $this->pagination = new Pagination("sala", null, array());
        $this->pagination->columnsFilters = array("Sala");
        $this->pagination->filters[] = "id_andar.id_empresa = " . Security::usuario()['id_empresa']; // Filtro por empresa
        $this->pagination->load();
        $this->total = $this->pagination->countBy();
        
        $db = Database::getConn();
        // Carrega os andares
        $andaresDb = $db->andar()->where("id_empresa = " . Security::usuario()['id_empresa'])->order("numero");
        $this->andares = array();
        foreach ($andaresDb as $andarDb) {
            $this->andares[] = array(
                "id" => $andarDb["id"],
                "numero" => htmlspecialchars(utf8_encode($andarDb["numero"])),
                "id_empresa" => $andarDb["id_empresa"]
            );
        }
        // Renderiza a view
        $this->render('sala/lista', 'default');
    }

    /**
     * Formulário do sala
     */
    public function form()
    {
        $db = Database::getConn();

        // Carrega os detalhes do sala
        if (isset($_GET['id'])) {
            $this->sala = $db->sala('id', $_GET['id'])->fetch();

            // Verifica se é um registro válido
            if (!$this->sala) {
                Util::erro(ERRO_REGISTRO_NAO_ENCONTRADO);
            }

            $this->sala["sala"] = htmlspecialchars(utf8_encode($this->sala["sala"]));
            $this->sala["arquivo"] = htmlspecialchars(utf8_encode($this->sala["arquivo"]));

           // Relação com os grupos
            $gruposRels = $db->acl_grupo_usuario('id_usuario', $_GET['id']);
            foreach ($gruposRels as $grupoRel) {
                $this->gruposUsuario[] = $grupoRel['id_acl_grupo'];
            }

        }
        // Carrega os andares
        $andaresDb = $db->andar()->where("id_empresa = " . Security::usuario()['id_empresa'])->order("numero");
        $this->andares = array();
        foreach ($andaresDb as $andarDb) {
            $this->andares[] = array(
                "id" => $andarDb["id"],
                "numero" => htmlspecialchars(utf8_encode($andarDb["numero"])),
                "id_empresa" => $andarDb["id_empresa"]
            );
        }
        $this->render('sala/form');
    }

    /**
     * Salva um sala
     */
    public function salvar()
    {
        $db = Database::getConn();
        $andarid = ($_POST['andar']);
        // Recupera a sala no caso de edição, ou cria um array para o novo
        if ($_POST['id']) {
            $sala = $db->sala('id', $_POST['id'])->fetch();

        } else {
            $sala = array();
        }

        // Preenche os campos
        $sala['sala']            = utf8_decode($_POST['sala']);
        $sala['id_andar']            = $andarid;

        // Upload
        if( $_FILES['arquivo']['name'] ) {
            $file_name_temp = $_FILES['arquivo']['name'];
            $imageExtension = explode('.', $file_name_temp);
            $imageExtension = strtolower(end($imageExtension));
            $file_name = time();
            $file_name .= '.' . $imageExtension;
            $pasta_empresa;
            $pasta_empresa = Security::usuario()['id_empresa'];

            $file = "./".$pasta_empresa."/".$file_name;

            // Salva o arquivo novo
            if (move_uploaded_file($_FILES['arquivo']['tmp_name'], $file)) {
                $sala['arquivo']         = $file_name;
            }
            
            
        }
            
        // Salva no banco
        if ($_POST['id']) {
            $salaId = $_POST['id'];
            $sala->update();
        } else {
            $salaId = $db->sala()->insert($sala);
        }
        Util::redirect('index.php?controle=sala&acao=listar');
    }

    /**
     * Remove um sala
     */
    public function excluir()
    {
        if (isset($_GET['id'])) {
            $db = Database::getConn();
            $sala = $db->sala('id', $_GET['id'])->fetch();

            $sala->delete();
            Util::redirect('index.php?controle=sala&acao=listar');
        }
    }
}
