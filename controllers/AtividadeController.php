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

    public function listarAtividadesCalendario()
    {
        $db = Database::getConn();
        $events = array();
        $bookings = $db->bookings()->where("id_empresa = " . Security::usuario()['id_empresa'])->order("created_at");
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
        $id_empresa = Security::usuario()['id_empresa'];

        // Obtém o horário atual
        $currentDateTime = date('Y-m-d H:i:s');
        
        $dados = [
            'title' => $title,
            'start_date' => $start_date,
            'end_date' => $end_date,
            'obs' => $obs,
            'ativo' => $ativo,
            'prioridade' => $prioridade,
            'created_at' => $currentDateTime,
            'updated_at' => $currentDateTime,
            'id_empresa' => $id_empresa
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
        $id_empresa = Security::usuario()['id_empresa'];

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
            'created_at' => $currentDateTime,
            'id_empresa' => $id_empresa
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
                'id_empresa' => $id_empresa
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
    // Carrega as pendencias
    $this->pagination = new Pagination("bookings", null, array());
    $this->pagination->columnsFilters = array("Atividade");
    $this->pagination->filters[] = "ativo = 0";
    $this->pagination->filters[] = "id_empresa = " . Security::usuario()['id_empresa']; // Filtro por empresa
    $this->pagination->load();
    
    $db = Database::getConn();
    // Renderiza a view
    $this->render('atividade/finalizado', 'default');
}
}
