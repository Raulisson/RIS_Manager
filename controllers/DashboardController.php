<?php

class DashBoardController extends AbstractController
{
    public function dashboard()
{
    // Carrega o inventario
    $this->pagination = new Pagination("inventario", null, array());
    $this->pagination->columnsFilters = array("data");
    $this->pagination->filters[] = "id_empresa = " . Security::usuario()['id_empresa']; // Filtro por empresa
    $this->pagination->load();
    
    $db = Database::getConn(true);
    // Renderiza a view
    $this->render('dashboard/dashboard', 'default');
}
}
