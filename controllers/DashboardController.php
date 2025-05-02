<?php

class DashBoardController extends AbstractController
{
    public function dashboard()
{
    // Carrega o dashboard
    
    $db = Database::getConn(true);
    // Renderiza a view
    $this->render('dashboard/dashboard', 'default');
}
}
