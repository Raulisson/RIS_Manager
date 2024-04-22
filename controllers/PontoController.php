<?php

class PontoController extends AbstractController
{
// Lista dos Pontos (Locais)
public function listar()
{
    // Carrega as pendencias
    $this->pagination = new Pagination("ponto", null, array());
    $this->pagination->columnsFilters = array("Nome");
    $this->pagination->load();
    
    $db = Database::getConn();
    // Renderiza a view
    $this->render('ponto/lista', 'default');
}
}
