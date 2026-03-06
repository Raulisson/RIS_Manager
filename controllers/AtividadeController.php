<?php

class AtividadeController extends AbstractController
{
    // Funções da Página do Calendário
    public function listarCalendario()
    {
        // Carrega o calendário
        // Renderiza a view
        $this->render('atividade/calendario', 'default');
    }

    /**
     * Página para gerar relatório IVC
     */
    public function relatorioIVC()
    {
        // redireciona para a view
        $this->render('atividade/relatorio_ivc', 'default');
    }

    public function listarAtividadesCalendario()
    {
        $db = Database::getConn();
        $events = array();
        if(Security::usuario()['perfil'] == '1'){
            $bookings = $db->bookings()->where("id_empresa = " . Security::usuario()['id_empresa'])->order("created_at");
        }else if(Security::usuario()['perfil'] == '3'){
            $bookings = $db->bookings()->where("id_usuario = " . Security::usuario()['id'])->order("created_at");
        }else if(Security::usuario()['perfil'] == '2'){
            $bookings = $db->bookings()->where("id_perfil = " . Security::usuario()['perfil'])->order("created_at");
        }
        foreach($bookings as $booking) {
            $color = null;
            if($booking["ativo"] == '0') {
                $color = '#00fa2b';
            }
            else if ($booking["ativo"] == '1' && $booking["prioridade"] == '1') {
                $color = '#fa0000';
            }
            else {
                $color = '#eea50b';
            }

            $events[] = [
                'id'   => $booking["id"],
                'title' => $booking["title"],
                'start' => $booking["start_date"],
                'end' => $booking["end_date"],
                'ativo' => $booking["ativo"],
                'prioridade' => $booking["prioridade"],
                'ivc' => $booking["ivc"],
                'codigo_player' => $booking["codigo_player"],
                'codigo_display' => $booking["codigo_display"],
                'obs' => $booking["obs"],
                'created_at' => $booking["created_at"],
                'atualizada' => $booking["updated_at"],
                'color' => $color
            ];
        }
    echo json_encode($events);
    }
    
    /**
     * Salvar uma atividade
     */
    public function salvarAtividade()
{
    $db = Database::getConn();

    // Verifica se os dados foram enviados via POST
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Recupera os dados do formulário
        $title = $_POST['local'];
        $start_date = $_POST['data_inicio'];
        $end_date = $start_date;
        $obs = $_POST['obs'];
        $ativo = isset($_POST['ativo']) ? $_POST['ativo'] : 0;
        $prioridade = $_POST['prioridade'];
        $ivc = isset($_POST['ivc']) ? $_POST['ivc'] : 0;
        $codigo_player = isset($_POST['codigo_player']) ? (int)$_POST['codigo_player'] : null;
        $codigo_display = isset($_POST['codigo_display']) ? (int)$_POST['codigo_display'] : null;
        $id_empresa = Security::usuario()['id_empresa'];
        $id_usuario = Security::usuario()['id'];
        $id_perfil = Security::usuario()['perfil'];
        
        // Obtém o horário atual
        $currentDateTime = date('Y-m-d H:i:s');
        
        $dados = [
            'title' => $title,
            'start_date' => $start_date,
            'end_date' => $end_date,
            'obs' => $obs,
            'ativo' => $ativo,
            'prioridade' => $prioridade,
            'ivc' => $ivc,
            'codigo_player' => $codigo_player,
            'codigo_display' => $codigo_display,
            'created_at' => $currentDateTime,
            'updated_at' => $currentDateTime,
            'id_empresa' => $id_empresa,
            'id_usuario' => $id_usuario,
            'id_perfil' => $id_perfil
        ];

        // Insere os dados no banco de dados
        $idAtividade = $db->bookings()->insert($dados);

        // Verifica se a inserção foi bem-sucedida
        if ($idAtividade) {
            // Responde com sucesso
            echo json_encode(['success' => true, 'message' => 'Atividade salva com sucesso!']);
        } else {
            // Responde com erro
            echo json_encode(['success' => false, 'message' => 'Erro ao salvar atividade.']);
        }
    } else {
        // Responde com erro se não houver dados enviados via POST
        echo json_encode(['success' => false, 'message' => 'Nenhum dado enviado.']);
    }

}

public function excluir()
{
    if (isset($_GET['id'])) {
        $db = Database::getConn();
        $id = $_GET['id'];
        
        $result = $db->bookings('id', $id)->delete();

        // Verifica se a exclusão foi bem-sucedida
        if ($result) {
            // Responde com sucesso
            echo json_encode(['success' => true, 'message' => 'Atividade excluída com sucesso!']);
        } else {
            // Responde com erro
            echo json_encode(['success' => false, 'message' => 'Erro ao excluir atividade.']);
        }
    } else {
        // Responde com erro se não houver ID enviado
        echo json_encode(['success' => false, 'message' => 'ID da atividade não fornecido.']);
    }
}
public function editarAtividade()
{
    // Verifica se os dados foram enviados via POST
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Recupera os dados do formulário
        $eventId = $_POST['edit_event_id'];
        $title = $_POST['edit_local'];
        $start_date = $_POST['edit_data_inicio'];
        $obs = $_POST['edit_obs'];
        $ativo = isset($_POST['edit_ativo']) ? $_POST['edit_ativo'] : 0;
        $prioridade = $_POST['edit_prioridade'];
        $ivc = isset($_POST['edit_ivc']) ? $_POST['edit_ivc'] : 0;
        $codigo_player = isset($_POST['edit_codigo_player']) ? (int)$_POST['edit_codigo_player'] : null;
        $codigo_display = isset($_POST['edit_codigo_display']) ? (int)$_POST['edit_codigo_display'] : null;
        $id_empresa = Security::usuario()['id_empresa'];
        $id_usuario = Security::usuario()['id'];
        $id_perfil = Security::usuario()['perfil'];

        // Obtém o horário atual
        $currentDateTime = date('Y-m-d H:i:s');

        // Atualiza os dados do evento no banco de dados
        $db = Database::getConn();
        $result = $db->bookings('id', $eventId)->update([
            'title' => $title,
            'start_date' => $start_date,
            'obs' => $obs,
            'ativo' => $ativo,
            'prioridade' => $prioridade,
            'ivc' => $ivc,
            'codigo_player' => $codigo_player,
            'codigo_display' => $codigo_display,
            'updated_at' => $currentDateTime,
            'id_empresa' => $id_empresa,
            'id_usuario' => $id_usuario,
            'id_perfil' => $id_perfil
        ]);

        if ($result) {
            // Responde com sucesso
            echo json_encode(['success' => true, 'message' => 'Atividade atualizada com sucesso!']);
        } else {
            // Responde com erro
            echo json_encode(['success' => false, 'message' => 'Erro ao atualizar atividade.']);
        }
    } else {
        // Responde com erro se não houver dados enviados via POST
        echo json_encode(['success' => false, 'message' => 'Nenhum dado enviado.']);
    }
}
public function finalizar()
{
    if (isset($_GET['id'])) {
        $db = Database::getConn();
        $id = $_GET['id'];
        
        // Atualiza a coluna 'ativo' para 0
        $result = $db->bookings('id', $id)->update(['ativo' => 0]);

        // Verifica se a atualização foi bem-sucedida
        if ($result) {
            // Responde com sucesso
            echo json_encode(['success' => true, 'message' => 'Atividade finalizada com sucesso!']);
        } else {
            // Responde com erro
            echo json_encode(['success' => false, 'message' => 'Erro ao finalizar atividade.']);
        }
    } else {
        // Responde com erro se não houver ID enviado
        echo json_encode(['success' => false, 'message' => 'ID da atividade não fornecido.']);
    }
}
public function pendenciar()
{
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Recupera os dados do formulário
        $eventId = $_POST['id'];
        $motivo = $_POST['motivo'];
        $title = $_POST['title']; 
        $start_date = $_POST['start_date']; 
        $obs = $_POST['motivo'];
        $ativo = isset($_POST['ativo']) ? $_POST['ativo'] : 0; 
        $prioridade = $_POST['prioridade'];
        $currentDateTime = date('Y-m-d H:i:s');
        $id_empresa = Security::usuario()['id_empresa'];
        $id_usuario = Security::usuario()['id'];
        $id_perfil = Security::usuario()['perfil'];

        // Primeiro, edita a atividade atual, mudando a coluna "ativo" para 0
        $db = Database::getConn();
        $result = $db->bookings('id', $eventId)->update(['ativo' => 0]);

            // Em seguida, crie uma nova atividade com os mesmos dados, exceto a data e o motivo da pendência
            $atividadePendente = $db->bookings()->insert([
                'title' => $title,
                'start_date' => $start_date, // Data 1 dia após a original
                'obs' => $obs, // Motivo da pendência
                'ativo' => $ativo, 
                'prioridade' => $prioridade,
                'created_at' => $currentDateTime, // Adiciona o horário atual para 'created_at'
                'updated_at' => $currentDateTime,
                'id_empresa' => $id_empresa,
                'id_usuario' => $id_empresa,
                'id_perfil' => $id_empresa
            ]);

            if ($atividadePendente) {
                // Responde com sucesso
                echo json_encode(['success' => true, 'message' => 'Atividade pendenciada com sucesso!']);
            } else {
                // Responde com erro
                echo json_encode(['success' => false, 'message' => 'Erro ao pendenciar atividade.']);
            }
        
    } else {
        // Responde com erro se não houver dados enviados via POST
        echo json_encode(['success' => false, 'message' => 'Nenhum dado enviado.']);
    }
}
// Página de Listagem de Pendências
public function listarPendencias()
    {
        // Carrega as pendencias
        $this->pagination = new Pagination("bookings", null, array());
        $this->pagination->columnsFilters = array("Atividade");
        $this->pagination->filters[] = "ativo = 1";
        $this->pagination->filters[] = "id_empresa = " . Security::usuario()['id_empresa']; // Filtro por empresa
        $this->pagination->load();
        
        $db = Database::getConn();
        // Renderiza a view
        $this->render('atividade/pendencia', 'default');
    }

// Página de Listagem de Finalizados
public function listarFinalizados()
{
    // Carrega os finalizados
    $this->pagination = new Pagination("bookings", null, array());
    $this->pagination->columnsFilters = array("Atividade");
    $this->pagination->filters[] = "ativo = 0";
    $this->pagination->filters[] = "id_empresa = " . Security::usuario()['id_empresa']; // Filtro por empresa
    $this->pagination->load();
    
    $db = Database::getConn();
    // Renderiza a view
    $this->render('atividade/finalizado', 'default');
}
// Filtro de atividades
public function filtro(){
    // Filtro
    $data_inicio                = htmlspecialchars($_POST["data_inicio"]);
    $data_final                 = htmlspecialchars($_POST["data_final"]);
    $palavra_chave = isset($_POST["pesquisa"]) ? htmlspecialchars($_POST["pesquisa"]) : null;

    // Carrega os finalizados com o filtro
    $this->pagination = new Pagination("bookings", null, array());
    $this->pagination->columnsFilters = array("Atividade");
    $this->pagination->filters[] = "ativo = 0";
    $this->pagination->filters[] = "id_empresa = " . Security::usuario()['id_empresa']; // Filtro por empresa
    $this->pagination->filters[] = "start_date >= '" . $data_inicio . "'";
    $this->pagination->filters[] = "start_date <= '" . $data_final . "'";
    // Adiciona o filtro por palavra-chave, se estiver definido
    if ($palavra_chave !== null) {
        $this->pagination->filters[] = "title LIKE '%" . $palavra_chave . "%'";
    }
    $this->pagination->load();
    
    $db = Database::getConn();
    // Renderiza a view
    $this->render('atividade/finalizado', 'default');
}

/**
     * Converter registros IVC em relatório Excel
     */
    public function converterIVC()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $data_inicio = $_POST['data_inicio'] . ' 00:00:00';
            $data_fim = $_POST['data_fim'] . ' 23:59:59';
            $id_empresa = Security::usuario()['id_empresa'];

            $db = Database::getConn();
            
            // Buscar registros com ivc = 1 entre as datas
            $bookings = $db->bookings()
                ->where("ivc = 1 AND id_empresa = {$id_empresa} AND start_date >= '{$data_inicio}' AND start_date <= '{$data_fim}'")
                ->order("start_date");

            if (count($bookings) == 0) {
                echo json_encode(['success' => false, 'message' => 'Nenhum registro encontrado para o período especificado.']);
                return;
            }

            // Criar arquivo CSV
            $filename = 'relatorio_ivc_' . date('Y-m-d_H-i-s') . '.csv';
            header('Content-Type: text/csv; charset=utf-8');
            header('Content-Disposition: attachment; filename="' . $filename . '"');
            
            // Abrir output como arquivo
            $output = fopen('php://output', 'w');
            
            // BOM para UTF-8
            fprintf($output, chr(0xEF).chr(0xBB).chr(0xBF));
            
            // Headers
            $headers = [
                'ORDEM DE SERVIÇO',
                'CÓDIGO DO PONTO',
                'ESTABELECIMENTO',
                'CÓDIGO DO PLAYER AFETADO',
                'DATA INICIO',
                'HORA INICIO',
                'DATA TERMINO',
                'HORA TERMINO',
                'DESCRIÇÃO DA FALHA REPARO'
            ];
            
            fputcsv($output, $headers, ';');
            
            // Processar dados
            $numero = 1;
            $mes = date('M', strtotime($data_inicio));
            
            foreach ($bookings as $booking) {
                // A: ORDEM DE SERVIÇO (numerado como 001/FEV)
                $ordem_servico = str_pad($numero, 3, '0', STR_PAD_LEFT) . '/' . strtoupper(substr($mes, 0, 3));
                
                // B: CÓDIGO DO PONTO (codigo_display)
                $codigo_ponto = $booking['codigo_display'];
                
                // C: ESTABELECIMENTO (title)
                $estabelecimento = $booking['title'];
                
                // D: CÓDIGO DO PLAYER AFETADO (codigo_player)
                $codigo_player = $booking['codigo_player'];
                
                // E: DATA INICIO
                $data_inicio_only = date('d/m/Y', strtotime($booking['start_date']));
                
                // F: HORA INICIO
                $hora_inicio = date('H:i', strtotime($booking['start_date']));
                
                // G: DATA TERMINO
                $data_fim_only = date('d/m/Y', strtotime($booking['end_date']));
                
                // H: HORA TERMINO
                $hora_fim = date('H:i', strtotime($booking['end_date']));
                
                // I: DESCRIÇÃO DA FALHA REPARO (obs)
                $descricao = $booking['obs'];

                $dados = [
                    $ordem_servico,
                    $codigo_ponto,
                    $estabelecimento,
                    $codigo_player,
                    $data_inicio_only,
                    $hora_inicio,
                    $data_fim_only,
                    $hora_fim,
                    $descricao
                ];
                
                fputcsv($output, $dados, ';');
                $numero++;
            }
            
            fclose($output);
        }
    }
}