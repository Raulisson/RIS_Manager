<?php

class DashBoardController extends AbstractController
{
    public function dashboard()
{
    // Renderiza a view
    $this->render('dashboard/dashboard', 'default');
}
}
