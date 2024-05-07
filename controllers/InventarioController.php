<?php

class InventarioController extends AbstractController
{
// Lista do inventario
public function listar()
{
    // Carrega o inventario
    $this->pagination = new Pagination("inventario", null, array());
    $this->pagination->columnsFilters = array("data");
    $this->pagination->filters[] = "id_empresa = " . Security::usuario()['id_empresa']; // Filtro por empresa
    $this->pagination->load();
    
    $db = Database::getConn(true);
    // Renderiza a view
    $this->render('inventario/lista', 'default');
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

            $this->inventario["id_computador"] = htmlspecialchars(utf8_encode($this->inventario["id_computador"]));
            $this->inventario["id_tela"] = htmlspecialchars(utf8_encode($this->inventario["id_tela"]));
            $this->inventario["id_equipamento"] = htmlspecialchars(utf8_encode($this->inventario["id_equipamento"]));
            $this->inventario["patrimonio"] = htmlspecialchars(utf8_encode($this->inventario["patrimonio"]));

           // Relação com os grupos
            $gruposRels = $db->acl_grupo_usuario('id_usuario', $_GET['id']);
            foreach ($gruposRels as $grupoRel) {
                $this->gruposUsuario[] = $grupoRel['id_acl_grupo'];
            }
        }
        // Carrega os computadores
        $computadoresDb = $db->computador()->where("id_empresa = " . Security::usuario()['id_empresa'])->order("marca");
        $this->computadores = array();
        foreach ($computadoresDb as $computadorDb) {
            $this->computadores[] = array(
                "id" => $computadorDb["id"],
                "marca" => htmlspecialchars(utf8_encode($computadorDb["marca"] . ", " . $computadorDb["tipo"])),
            );
        }
        // Carrega as telas
        $telasDb = $db->tela()->where("id_empresa = " . Security::usuario()['id_empresa'])->order("marca");
        $this->telas = array();
        foreach ($telasDb as $telaDb) {
            $this->telas[] = array(
                "id" => $telaDb["id"],
                "marca" => htmlspecialchars(utf8_encode($telaDb["marca"] . " " . $telaDb["tamanho"] . " | " . $telaDb["tipo"])),
            );
        }
        // Carrega os equipamentos
        $equipamentosDb = $db->equipamento()->where("id_empresa = " . Security::usuario()['id_empresa'])->order("marca");
        $this->equipamentos = array();
        foreach ($equipamentosDb as $equipamentoDb) {
            $this->equipamentos[] = array(
                "id" => $equipamentoDb["id"],
                "marca" => htmlspecialchars(utf8_encode($equipamentoDb["nome"] . ", " . $equipamentoDb["marca"])),
            );
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

        // Preenche os campos
        if($_POST['id_computador'] == '' && $_POST['id_tela'] == ''){
            $inventario['id_equipamento']       = utf8_encode($_POST['id_equipamento']);
        }else if($_POST['id_tela'] == '' && $_POST['id_equipamento'] == ''){
            $inventario['id_computador']        = utf8_encode($_POST['id_computador']);
        }else if($_POST['id_equipamento'] == '' && $_POST['id_computador'] == ''){
            $inventario['id_tela']              = utf8_encode($_POST['id_tela']);
        }else{
            Util::redirect("index.php?controle=inventario&acao=listar&erro=1");
        }
        if(!$_POST['id_ponto'] == ''){
            $inventario['id_ponto']             = utf8_encode($_POST['id_ponto']);
        } else{
            $inventario['id_ponto']             = NULL;
        }
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
