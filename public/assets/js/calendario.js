    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            left: 'prevYear,prev,next,nextYear today',
            center: 'title',
            right: 'dayGridMonth,dayGridWeek,dayGridDay'
        },
        locale: 'pt-br',
        navLinks: true, // can click day/week names to navigate views
        editable: true,
        selectable: true,
        dayMaxEvents: true, // allow "more" link when too many events
        events: { // bring the events
            url: '?controle=atividade&acao=listarAtividadesCalendario',
            method: 'GET',
            success: function(data) {
                var events = [];
                data.forEach(function(eventData) {
                    var event = {
                        id: eventData.id,
                        title: eventData.title,
                        start: eventData.start_date,
                        end: eventData.end_date,
                        obs: eventData.obs,
                        prioridade: eventData.prioridade,
                        created_at: moment(eventData.created_at).format('DD/MM/YYYY HH:mm'),
                        atualizada: moment(eventData.atualizada).format('DD/MM/YYYY HH:mm'),
                        color: eventData.color
                    };
                    events.push(event);
                });
            }
        },
        eventClick: function(info){ // modal when click event
            $('#bookingDelModal').modal('toggle');
            
            document.getElementById("ponto").innerText = 'Ponto: ' + info.event.title;
            document.getElementById("datahorainsercao").innerText = 'Atividade criada em: ' + moment(info.event.extendedProps.created_at).format('DD/MM/YYYY HH:mm');
            document.getElementById("datahora").innerText = 'Data/Hora da Atividade: ' + moment(info.event.start).format('DD/MM/YYYY HH:mm');
            document.getElementById("datahorafinalizado").innerText = 'Atividade Finalizada em: ' + moment(info.event.extendedProps.atualizada).format('DD/MM/YYYY HH:mm');
            document.getElementById("obs").innerText = 'Observações: ' + info.event.extendedProps.obs;
            document.getElementById("prioridade").innerText = 'Prioridade: ' + info.event.extendedProps.prioridade;
            
            if (info.event.extendedProps.ativo == 1) {
                $('#finalizarBtn').show();
                $('#pendenciarBtn').show();
            } else {
                $('#finalizarBtn').hide();
                $('#pendenciarBtn').hide();
            }
            // Adicione um evento de clique para o botão "Finalizar"
            $('#finalizarBtn').click(function() {
                var eventId = info.event.id;
                // Envia uma requisição AJAX para atualizar a coluna "ativo" para 0
                $.ajax({
                    url: '?controle=atividade&acao=finalizar&id=' + eventId,
                    type: 'GET',
                    dataType: 'json',
                    success: function(response) {
                        if (response.success) {
                            // Fecha a modal
                            $('#bookingDelModal').modal('hide');
                            // Recarrega os eventos no calendário
                            calendar.refetchEvents();
                            console.log("Atividade Finalizada");
                        } else {
                            console.error(response.message);
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error(xhr.responseText);
                    }
                });
            });
            // Pendenciar atividade
            $('#pendenciarBtn').click(function() {
                $('#pendenciaModal').modal('toggle');
                $('#bookingDelModal').modal('hide');
            });

            $('#enviarPendenciaBtn').click(function() {
                var motivo = $('#motivoPendencia').val();
                var eventId = info.event.id;
                var title = info.event.title;
                var data = moment(info.event.start);
                var novaData = data.add(1, 'days');
                var start_date = novaData.format('YYYY-MM-DDTHH:mm');
                var ativo = info.event.extendedProps.ativo;
                var prioridade = info.event.extendedProps.prioridade;
                // Envia uma solicitação AJAX para tratar a pendência da atividade
                $.ajax({
                    url: '?controle=atividade&acao=pendenciar',
                    type: 'POST',
                    data: {
                        id: eventId,
                        motivo: motivo,
                        title: title,
                        start_date: start_date,
                        ativo: ativo,
                        prioridade: prioridade
                    },
                    dataType: 'json',
                    success: function(response) {
                        if (response.success) {
                            // Fecha a modal de pendência
                            $('#pendenciaModal').modal('hide');
                            // Recarrega os eventos no calendário
                            location.reload();
                        } else {
                            console.error(response.message);
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error(xhr.responseText);
                    }
                });
            });
            
            $('#cancelarPendenciaBtn').on('click', function() {
                // Fecha o modal
                $('#pendenciaModal').modal('hide');
                // Recarrega os eventos no calendário (opcional)
                calendar.refetchEvents();
            });

             // Adiciona um evento de clique para o botão "Deletar" da modal
            $('#delBtn').off().on('click', function() {
                
                var eventId = info.event.id;
                $.ajax({
                    url: '?controle=atividade&acao=excluir&id=' + eventId,
                    type: 'GET',
                    dataType: 'json',
                    success: function(response) {
                        if (response.success) {
                            // Fecha a modal
                            $('#bookingDelModal').modal('hide');
                            // Remove o evento deletado do calendário
                            info.event.remove();
                        } else {
                            console.error(response.message);
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error(xhr.responseText);
                    }
                });

            });
            $('#editarBtn').click(function() {
                $('#bookingDelModal').modal('hide');
                $('#editarModal').modal('toggle');
                
                var eventId = info.event.id;
                var title = info.event.title;
                var start_date = moment(info.event.start).format('YYYY-MM-DDTHH:mm');
                var obs = info.event.extendedProps.obs;
                var ativo = info.event.extendedProps.ativo;
                var prioridade = info.event.extendedProps.prioridade;
                
                // Preencher os campos da modal com os dados da atividade selecionada
                $('#edit_event_id').val(eventId);
                $('#edit_local').val(title);
                $('#edit_data_inicio').val(start_date);
                $('#edit_obs').val(obs);
                $('#edit_ativo').prop('checked', ativo == 1); // Define o estado do checkbox de acordo com o valor do evento
                $('#edit_prio').prop('checked', prioridade == 1); // Define o estado do checkbox de acordo com o valor do evento
            });
            
            $('#editarModal').on('hidden.bs.modal', function () {
                // Limpar os campos da modal ao fechar
                $('#frmEdicao')[0].reset();
            });
            
            $('#enviaredicaoBtn').click(function() {
                // Coleta os dados do formulário
                var formData = {
                    edit_event_id: $('#edit_event_id').val(),
                    edit_local: $('#edit_local').val(),
                    edit_data_inicio: $('#edit_data_inicio').val(),
                    edit_obs: $('#edit_obs').val(),
                    edit_ativo: $('#edit_ativo').is(':checked') ? 1 : 0,
                    edit_prioridade: $('#edit_prio').is(':checked') ? 1 : 0
                };
            
                // Envia os dados via AJAX para a controladora PHP
                $.ajax({
                    url: '?controle=atividade&acao=editarAtividade',
                    type: 'POST',
                    data: formData,
                    dataType: 'json',
                    success: function(response) {
                        if (response.success) {
                            // Fecha a modal e recarrega os eventos
                            $('#editarModal').modal('hide');
                            $('#calendar').fullCalendar('refetchEvents');
                            swal("Atividade Atualizada!");
                        } else {
                            console.error(response.message);
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error(xhr.responseText);
                    }
                });
            });

            $('#cancelarEdicaoBtn').on('click', function() {
                // Fecha o modal
                $('#editarModal').modal('hide');
                // Recarrega os eventos no calendário (opcional)
                calendar.refetchEvents();
            });
            
            
        },
        select: function(info) {
            $('#bookingModal').modal('toggle');
            
            // Obter a data atual
            var currentDate = new Date();
            // Definir o horário inicial como 09:00
            currentDate.setHours(9);
            currentDate.setMinutes(0);
            // Formatar a data clicada para o formato correto (YYYY-MM-DDTHH:MM)
            var clickedDateTime = info.start.getFullYear() + '-' + ('0' + (info.start.getMonth() + 1)).slice(-2) + '-' + ('0' + info.start.getDate()).slice(-2) + 'T' + ('0' + currentDate.getHours()).slice(-2) + ':' + ('0' + currentDate.getMinutes()).slice(-2);
            // Formatar a data atual para o formato correto (YYYY-MM-DDTHH:MM)
            var currentDateTime = currentDate.getFullYear() + '-' + ('0' + (currentDate.getMonth() + 1)).slice(-2) + '-' + ('0' + currentDate.getDate()).slice(-2) + 'T' + ('0' + currentDate.getHours()).slice(-2) + ':' + ('0' + currentDate.getMinutes()).slice(-2);
            
            // Definir o valor do input datetime-local para a data clicada e hora inicial 09:00
            document.getElementById("data_inicio").value = clickedDateTime;
            
        },

        
        });

        calendar.render();

        // Lógica de envio de dados do formulário para o banco
        $(document).ready(function() {
            $('#bookingModal').on('show.bs.modal', function (event) {
                // Limpa os campos do formulário
                $('#frmCalendario')[0].reset();
            });
            
            $('#cancelarBtn').on('click', function() {
                // Fecha o modal
                $('#bookingModal').modal('hide');
                // Recarrega os eventos no calendário (opcional)
                calendar.refetchEvents();
            });
            
            $('#frmCalendario').on('submit', function(event) {
                event.preventDefault(); // Impede o envio do formulário padrão
                // Coleta os dados do formulário
                var formData = {
                    local: $('#local').val(), // Pegar o texto selecionado no campo <select>,
                    data_inicio: $('#data_inicio').val(),
                    obs: $('#observacao').val(),
                    prioridade: $('#prio').is(':checked') ? 1 : 0,
                    ativo: $('#checkin').is(':checked') ? 1 : 0,
                    
                };
        
                // Envia os dados via AJAX para a controladora PHP
                $.ajax({
                    url: '?controle=atividade&acao=salvarAtividade',
                    type: 'POST',
                    data: formData,
                    dataType: 'json', // Espera uma resposta JSON do servidor
                    success: function(response) {
                        // Trate a resposta da controladora PHP aqui, se necessário
                        console.log(response);
                        // Fecha o modal
                        $('#bookingModal').modal('hide');
                        // Recarrega os eventos no calendário
                        calendar.refetchEvents();
                    },
                    error: function(xhr, status, error) {
                        // Trate os erros aqui, se necessário
                        console.error(xhr.responseText);
                    }
                });
            });
            
        });
    });

    
