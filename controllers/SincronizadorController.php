<?php

class SincronizadorController extends AbstractController
{
    public function sincronizar()
    {
        $db = Database::getConn();
        $hoje = date('Y-m-d');

        // Seleciona todos os clientes
        $clientes = $db->cliente()->order('id');

        foreach ($clientes as $cliente) {
            echo "Verificando e sincronizando dados do cliente: " . $cliente['empresa'] . "<br>";
            $dataEncerramento = $cliente['data_encerramento'];

            // Verifica se a data não é vazia ou nula
            if (!empty($dataEncerramento)) {
                // Compara se a data de encerramento é igual ou anterior a hoje
                if ($dataEncerramento <= $hoje) {
                    // Atualiza a situação para "2" (Inativo)
                    $cliente->update(['situacao' => 2]);
                    echo "Data de encerramento detectada. Finalizando compra do cliente: " . $cliente['empresa'] . "<br>";
                }
            }
        }
    }
}
