<?php

class InventarioController extends AbstractController
{
// Lista do inventario
public function listar()
{
    $db = Database::getConn(true);
    // Carrega o inventario
    $this->pagination = new Pagination("inventario", null, array());
    $this->pagination->columnsFilters = array("data");

    if (!empty($_GET['search'])) {
        $filtro = trim($_GET['search']);

        if (mb_strtolower($filtro) === 'estoque') {
            // Quando a busca for "estoque", filtra onde id_ponto é NULL
            $this->pagination->filters[] = "id_ponto IS NULL";
        } else {
            // Busca todos os pontos cujo nome contenha o termo
            $pontosDb = $db->ponto()->where("nome LIKE ?", "%$filtro%");

            // Extrai os IDs em um array
            $ids = [];
            foreach ($pontosDb as $ponto) {
                $ids[] = $ponto['id'];
            }

            // Aplica o filtro se houver resultados
            if (!empty($ids)) {
                $idsStr = implode(',', $ids); // Ex: "2,5,9"
                $this->pagination->filters[] = "id_ponto IN ($idsStr)";
            } else {
                // Nenhum ponto encontrado, força resultado vazio
                $this->pagination->filters[] = "0 = 1";
            }
        }
    }
    
    if (!empty($_GET['searchname'])) {
                $filtroNome = $_GET['searchname'];
                $this->pagination->filters[] = "nome LIKE '%" . $filtroNome . "%'";
        }

    $this->pagination->filters[] = "id_empresa = " . Security::usuario()['id_empresa']; // Filtro por empresa
    $this->pagination->load();
    
    
    // Renderiza a view
    $this->render('inventario/lista', 'default');
}
// Lista do inventário em estoque
public function estoque()
{
    // Carrega o inventario
    $this->pagination = new Pagination("inventario", null, array());
    $this->pagination->columnsFilters = array("data");
    $this->pagination->filters[] = "id_empresa = " . Security::usuario()['id_empresa']; // Filtro por empresa
    $this->pagination->load();
    
    $db = Database::getConn(true);
    // Renderiza a view
    $this->render('estoque/lista', 'default');
}
// Formulário dos inventarios
public function form()
{
    $db = Database::getConn();

    // Carrega os detalhes
    if (isset($_GET['id'])) {
        $this->inventario = $db->inventario('id', $_GET['id'])->fetch();
        // Verifica se é um registro válido
        if (!$this->inventario) {
            Util::erro(ERRO_REGISTRO_NAO_ENCONTRADO);
            }
           // Relação com os grupos
            $gruposRels = $db->acl_grupo_usuario('id_usuario', $_GET['id']);
            foreach ($gruposRels as $grupoRel) {
                $this->gruposUsuario[] = $grupoRel['id_acl_grupo'];
            }
        }
        // Carrega os pontos
        $pontosDb = $db->ponto()->where("id_empresa = " . Security::usuario()['id_empresa'])->order("nome");
        $this->pontos = array();
        foreach ($pontosDb as $pontoDb) {
            $this->pontos[] = array(
                "id" => $pontoDb["id"],
                "nome" => htmlspecialchars(utf8_encode($pontoDb["nome"] . " | " . $pontoDb["endereco"])),
            );
        }
        
        $this->render('inventario/form');
}

// Salva um inventario
public function salvar()
{
    $db = Database::getConn();
        // Recupera o inventario no caso de edição, ou cria um array para o novo
        if ($_POST['id']) {
            $inventario = $db->inventario('id', $_POST['id'])->fetch();
            // Checa a empresa proprietária do registro
            Security::checkCompany($inventario);
        } else {
            $inventario = array();
        }

        // Obtém o horário atual
        $currentDateTime = date('Y-m-d H:i:s');

        if(!$_POST['id_ponto'] == ''){
            $inventario['id_ponto']             = utf8_encode($_POST['id_ponto']);
        } else{
            $inventario['id_ponto']             = NULL;
        }
        $inventario['nome']               = utf8_encode($_POST['nome']);
        $inventario['patrimonio']               = utf8_encode($_POST['patrimonio']);
        $inventario['data']                     =  $currentDateTime;
        $inventario['id_empresa']               = Security::usuario()['id_empresa'];
        
        // Salva no banco
        if ($_POST['id']) {
            $inventarioId = $_POST['id'];
            $inventario->update();
        } else {
            $inventarioId = $db->inventario()->insert($inventario);
        }
        Util::redirect('index.php?controle=inventario&acao=listar');
}
public function excluir()
{
    if (isset($_GET['id'])) {
        $db = Database::getConn();
        $inventario = $db->inventario('id', $_GET['id'])->fetch();

        $inventario->delete();
        Util::redirect('index.php?controle=inventario&acao=listar');
    }
}

}
