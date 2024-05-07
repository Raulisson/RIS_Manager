<?php

class PontoController extends AbstractController
{
// Lista dos Pontos (Locais)
public function listar()
{
    // Carrega os pontos
    $this->pagination = new Pagination("ponto", null, array());
    $this->pagination->columnsFilters = array("Nome");
    $this->pagination->filters[] = "id_empresa = " . Security::usuario()['id_empresa']; // Filtro por empresa
    $this->pagination->load();
    
    $db = Database::getConn();
    // Renderiza a view
    $this->render('ponto/lista', 'default');
}
// Formulário dos pontos
public function form()
{
    $db = Database::getConn();

    // Carrega os detalhes
    if (isset($_GET['id'])) {
        $this->ponto = $db->ponto('id', $_GET['id'])->fetch();
        // Verifica se é um registro válido
        if (!$this->ponto) {
            Util::erro(ERRO_REGISTRO_NAO_ENCONTRADO);
            }

            $this->ponto["nome"] = htmlspecialchars(utf8_encode($this->ponto["nome"]));
            $this->ponto["endereco"] = htmlspecialchars(utf8_encode($this->ponto["endereco"]));
            $this->ponto["nome_responsavel"] = htmlspecialchars(utf8_encode($this->ponto["nome_responsavel"]));
            $this->ponto["contato_responsavel"] = htmlspecialchars(utf8_encode($this->ponto["contato_responsavel"]));

           // Relação com os grupos
            $gruposRels = $db->acl_grupo_usuario('id_usuario', $_GET['id']);
            foreach ($gruposRels as $grupoRel) {
                $this->gruposUsuario[] = $grupoRel['id_acl_grupo'];
            }
        }
        
        $this->render('ponto/form');
}

// Salva um ponto
public function salvar()
{
    $db = Database::getConn();
        // Recupera o ponto no caso de edição, ou cria um array para o novo
        if ($_POST['id']) {
            $ponto = $db->ponto('id', $_POST['id'])->fetch();
            // Checa a empresa proprietária do registro
            Security::checkCompany($ponto);
        } else {
            $ponto = array();
        }

        // Preenche os campos
        $ponto['nome']            = utf8_encode($_POST['nome']);
        $ponto['endereco']            = utf8_encode($_POST['endereco']);
        $ponto['nome_responsavel']            = utf8_encode($_POST['nome_responsavel']);
        $ponto['contato_responsavel']            = utf8_encode($_POST['contato_responsavel']);
        $ponto['id_empresa']      = Security::usuario()['id_empresa'];
        
        // Salva no banco
        if ($_POST['id']) {
            $pontoId = $_POST['id'];
            $ponto->update();
        } else {
            $pontoId = $db->ponto()->insert($ponto);
        }
        Util::redirect('index.php?controle=ponto&acao=listar');
}
public function excluir()
{
    if (isset($_GET['id'])) {
        $db = Database::getConn();
        $ponto = $db->ponto('id', $_GET['id'])->fetch();
        
        $ponto->delete();
        Util::redirect('index.php?controle=ponto&acao=listar');
    }
}

}
