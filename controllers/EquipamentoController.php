<?php

class EquipamentoController extends AbstractController
{
// Lista de Computadores (Gerais da empresa)
public function listarComputador()
{
    // Carrega as pendencias
    $this->pagination = new Pagination("computador", null, array());
    $this->pagination->columnsFilters = array("Marca");
    $this->pagination->filters[] = "id_empresa = " . Security::usuario()['id_empresa']; // Filtro por empresa
    $this->pagination->load();
    
    $db = Database::getConn();
    // Renderiza a view
    $this->render('equipamentos/lista_computador', 'default');
}
// Formulário de Computadores
public function cadastrarComputador()
{
    $db = Database::getConn();

    // Carrega os detalhes do pc
    if (isset($_GET['id'])) {
        $this->computador = $db->computador('id', $_GET['id'])->fetch();
        // Verifica se é um registro válido
        if (!$this->computador) {
            Util::erro(ERRO_REGISTRO_NAO_ENCONTRADO);
            }

            $this->computador["marca"] = htmlspecialchars(utf8_encode($this->computador["marca"]));
            $this->computador["tipo"] = htmlspecialchars(utf8_encode($this->computador["tipo"]));
            $this->computador["observacoes"] = htmlspecialchars(utf8_encode($this->computador["observacoes"]));

           // Relação com os grupos
            $gruposRels = $db->acl_grupo_usuario('id_usuario', $_GET['id']);
            foreach ($gruposRels as $grupoRel) {
                $this->gruposUsuario[] = $grupoRel['id_acl_grupo'];
            }
        }
        $this->render('equipamentos/form_computador');
}

// Salva um computador
public function salvarComputador()
{
    $db = Database::getConn();
    // Recupera o computador no caso de edição, ou cria um array para o novo
    if ($_POST['id']) {
        $computador = $db->computador('id', $_POST['id'])->fetch();

        // Checa a empresa proprietária do registro
        Security::checkCompany($computador);
    }else{
        $computador = array();
    }
    // Preenche os campos
    $computador['marca']           = utf8_decode($_POST['marca']);
    $computador["tipo"]            = utf8_decode($_POST['tipo']);
    $computador["observacoes"]     = utf8_decode($_POST['observacoes']);
    $computador['id_empresa']      = Security::usuario()['id_empresa'];
    // Salva no banco
    if ($_POST['id']) {
        $computadorId = $_POST['id'];
        $computador->update();
    }else {
        $computadorId = $db->computador()->insert($computador);
    }
    Util::redirect('index.php?controle=equipamento&acao=listarComputador');
}
public function excluirComputador()
{
    if (isset($_GET['id'])) {
        $db = Database::getConn();
        $computador = $db->computador('id', $_GET['id'])->fetch();

        $computador->delete();
        Util::redirect('index.php?controle=equipamento&acao=listarComputador');
    }
}

public function listarTela()
{
    // Carrega as pendencias
    $this->pagination = new Pagination("tela", null, array());
    $this->pagination->columnsFilters = array("Marca");
    $this->pagination->filters[] = "id_empresa = " . Security::usuario()['id_empresa']; // Filtro por empresa
    $this->pagination->load();
    
    $db = Database::getConn();
    // Renderiza a view
    $this->render('equipamentos/lista_tela', 'default');
}
// Formulário da Tela
public function cadastrarTela()
{
    $db = Database::getConn();

    // Carrega os detalhes da tela
    if (isset($_GET['id'])) {
        $this->tela = $db->tela('id', $_GET['id'])->fetch();

        // Verifica se é um registro válido
        if (!$this->tela) {
            Util::erro(ERRO_REGISTRO_NAO_ENCONTRADO);
            }

            $this->tela["marca"] = htmlspecialchars(utf8_encode($this->tela["marca"]));
            $this->tela["tamanho"] = htmlspecialchars(utf8_encode($this->tela["tamanho"]));
            $this->tela["tipo"] = htmlspecialchars(utf8_encode($this->tela["tipo"]));

           // Relação com os grupos
            $gruposRels = $db->acl_grupo_usuario('id_usuario', $_GET['id']);
            foreach ($gruposRels as $grupoRel) {
                $this->gruposUsuario[] = $grupoRel['id_acl_grupo'];
            }
        }
        $this->render('equipamentos/form_tela');
}

// Salva uma tela
public function salvarTela()
{
    $db = Database::getConn();
    // Recupera a tela no caso de edição, ou cria um array para o novo
    if ($_POST['id']) {
        $tela = $db->tela('id', $_POST['id'])->fetch();
         // Checa a empresa proprietária do registro
        Security::checkCompany($tela);
    }else{
        $tela = array();
    }
    // Preenche os campos
    $tela['marca']           = utf8_decode($_POST['marca']);
    $tela["tamanho"]            = utf8_decode($_POST['tamanho']);
    $tela["tipo"]     = utf8_decode($_POST['tipo']);
    $tela['id_empresa']      = Security::usuario()['id_empresa'];
    // Salva no banco
    if ($_POST['id']) {
        $telaId = $_POST['id'];
        $tela->update();
    }else {
        $telaId = $db->tela()->insert($tela);
    }
    Util::redirect('index.php?controle=equipamento&acao=listarTela');
}
public function excluirTela()
{
    if (isset($_GET['id'])) {
        $db = Database::getConn();
        $tela = $db->tela('id', $_GET['id'])->fetch();

        $tela->delete();
        Util::redirect('index.php?controle=equipamento&acao=listarTela');
    }
}
public function listarEquipamento()
{
    // Carrega as pendencias
    $this->pagination = new Pagination("equipamento", null, array());
    $this->pagination->columnsFilters = array("Marca");
    $this->pagination->filters[] = "id_empresa = " . Security::usuario()['id_empresa']; // Filtro por empresa
    $this->pagination->load();
    
    $db = Database::getConn();
    // Renderiza a view
    $this->render('equipamentos/lista_equipamento', 'default');
}
// Formulário do Equipamento
public function cadastrarEquipamento()
{
    $db = Database::getConn();

    // Carrega os detalhes do equipamento
    if (isset($_GET['id'])) {
        $this->equipamento = $db->equipamento('id', $_GET['id'])->fetch();
        // Verifica se é um registro válido
        if (!$this->equipamento) {
            Util::erro(ERRO_REGISTRO_NAO_ENCONTRADO);
            }

            $this->equipamento["nome"] = htmlspecialchars(utf8_encode($this->equipamento["nome"]));
            $this->equipamento["marca"] = htmlspecialchars(utf8_encode($this->equipamento["marca"]));
            $this->equipamento["descricao"] = htmlspecialchars(utf8_encode($this->equipamento["descricao"]));

           // Relação com os grupos
            $gruposRels = $db->acl_grupo_usuario('id_usuario', $_GET['id']);
            foreach ($gruposRels as $grupoRel) {
                $this->gruposUsuario[] = $grupoRel['id_acl_grupo'];
            }
        }
        $this->render('equipamentos/form_equipamento');
}

// Salva um Equipamento
public function salvarEquipamento()
{
    $db = Database::getConn();
    // Recupera o equipamento no caso de edição, ou cria um array para o novo
    if ($_POST['id']) {
        $equipamento = $db->equipamento('id', $_POST['id'])->fetch();
        // Checa a empresa proprietária do registro
        Security::checkCompany($equipamento);
    }else{
        $equipamento = array();
    }
    // Preenche os campos
    $equipamento['nome']           = utf8_decode($_POST['nome']);
    $equipamento["marca"]            = utf8_decode($_POST['marca']);
    $equipamento["descricao"]     = utf8_decode($_POST['descricao']);
    $equipamento['id_empresa']      = Security::usuario()['id_empresa'];
    // Salva no banco
    if ($_POST['id']) {
        $equipamentoId = $_POST['id'];
        $equipamento->update();
    }else {
        $equipamentoId = $db->equipamento()->insert($equipamento);
    }
    Util::redirect('index.php?controle=equipamento&acao=listarEquipamento');
}
public function excluirEquipamento()
{
    if (isset($_GET['id'])) {
        $db = Database::getConn();
        $equipamento = $db->equipamento('id', $_GET['id'])->fetch();

        $equipamento->delete();
        Util::redirect('index.php?controle=equipamento&acao=listarEquipamento');
    }
}
public function listarModem()
{
    // Carrega os modens
    $this->pagination = new Pagination("modem", null, array());
    $this->pagination->columnsFilters = array("patrimonio");
    $this->pagination->filters[] = "id_empresa = " . Security::usuario()['id_empresa']; // Filtro por empresa
    $this->pagination->load();
    
    $db = Database::getConn();
    // Renderiza a view
    $this->render('equipamentos/lista_modem', 'default');
}
// Formulário do Modem
public function cadastrarModem()
{
    $db = Database::getConn();

    // Carrega os detalhes do modem
    if (isset($_GET['id'])) {
        $this->modem = $db->modem('id', $_GET['id'])->fetch();
        // Verifica se é um registro válido
        if (!$this->modem) {
            Util::erro(ERRO_REGISTRO_NAO_ENCONTRADO);
            }

            $this->modem["numero"] = htmlspecialchars(utf8_encode($this->modem["numero"]));
            $this->modem["id_ponto"] = htmlspecialchars(utf8_encode($this->modem["id_ponto"]));

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
        
        $this->render('equipamentos/form_modem');
}

// Salva um Modem
public function salvarModem()
{
    $db = Database::getConn();
    // Recupera o Modem no caso de edição, ou cria um array para o novo
    if ($_POST['id']) {
        $modem = $db->modem('id', $_POST['id'])->fetch();
        // Checa a empresa proprietária do registro
        Security::checkCompany($modem);
    }else{
        $modem = array();
    }
    // Preenche os campos
    if(!$_POST['id_ponto'] == ''){
        $modem['id_ponto']            = utf8_encode($_POST['id_ponto']);
    } else{
        $modem['id_ponto']            = NULL;
    }
    $modem['numero']            = utf8_encode($_POST['numero']);
    $modem['id_empresa']      = Security::usuario()['id_empresa'];
    // Salva no banco
    if ($_POST['id']) {
        $modemId = $_POST['id'];
        $modem->update();
    }else {
        $modemId = $db->modem()->insert($modem);
    }
    Util::redirect('index.php?controle=equipamento&acao=listarModem');
}
public function excluirModem()
{
    if (isset($_GET['id'])) {
        $db = Database::getConn();
        $modem = $db->modem('id', $_GET['id'])->fetch();

        $modem->delete();
        Util::redirect('index.php?controle=equipamento&acao=listarModem');
    }
}
}
