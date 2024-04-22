<div class="page-breadcrumb bg-white p-4">
	<div class="row align-items-center">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
			<h4 class="page-title text-uppercase font-medium font-14">Calendário de Atividades</h4>
		</div>
	</div>
</div>

<!-- Modals -->
	<!-- Modal Visualização de Informações -->
	<div class="modal fade" id="bookingDelModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Detalhes da Atividade</h5>
				</div>
				<div class="modal-body">
					<div class="row">
						<span class="col-sm-12" id="ponto"></span>
						<span class="col-sm-12" id="datahorainsercao"></span>
						<span class="col-sm-12" id="datahora"></span>
						<span class="col-sm-12" id="datahorafinalizado"></span>
						<span class="col-sm-12" id="obs"></span>
						<span class="col-sm-12" id="prioridade"></span>
					</div>
				</div>
				<div class="modal-footer" style="justify-content:space-between;">
					<div>
						<button  type="button" id="pendenciarBtn" class="btn btn-secondary" data-bs-dismiss="modal" style="background-color: red;">Pendenciar</button>
						<button type="button" id="finalizarBtn" class="btn btn-primary">Finalizar</button>
					</div>
					<div>
						<button type="button" id="delBtn" class="btn btn-secondary" data-bs-dismiss="modal" style="background-color: red;">Deletar</button>
						<button type="button" id="editarBtn" class="btn btn-primary" data-event-id="{{ event.id }}">Editar</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal de Adicionar -->
	<div class="modal fade" id="bookingModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Adicionar Atividade</h5>
				</div>
				<div class="modal-body">
					<div class="row">
						<form method="POST" id="frmCalendario">
						<input type="hidden" id="event_id" name="event_id" value="">
							<!-- Select Ponto já cadastrado -->
						<div class="form-group col-md-12">
							<label for="local" class="ul-form__label p-0"><span>*</span> Local de Atendimento:</label>
							<input type="text" class="form-control" name="local" id="local" required>
						</div>
						<!-- Data/Hora -->
						<div class="form-group col-md-12">
							<label for="data" class="ul-form__label p-0"><span>*</span> Data/Hora:</label>
							<input type="datetime-local" class="form-control" name="data_inicio" id="data_inicio" required>
						</div>
						<!-- Observações -->
						<div class="form-group col-md-12">
							<label for="observacao" class="ul-form__label p-0">Observações</label>
							<input type="text" class="form-control" id="observacao" name="observacao" placeholder="Descrição/Observações">
						</div>

						<!-- Checkbox atividade ativa -->
						<div class="form-group col-md-12">
							<div class="checkbox-wrapper-2">
								<label for="ativo" class="ul-form__label p-0">Atividade Ativa</label>
								<br>
								<input type="checkbox" class="sc-gJwTLC ikxBAC" name="checkin" id="checkin" value="1">
							</div>
						</div>
						<!-- Checkbox Prioridade -->
						<div class="form-group col-md-12">
							<div class="checkbox-wrapper-2">
								<label for="prio" class="ul-form__label p-0">Prioridade</label>
								<br>
								<input type="checkbox" class="sc-gJwTLC ikxBAC" name="prio" id="prio" value="1">
							</div>
						</div>
						
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" id="salvarBtn" class="btn btn-primary" data-bs-dismiss="modal">Salvar</button>
					<button type="button" id="cancelarBtn" class="btn btn-secondary">Cancelar</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Modal de Edição -->
	<div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Editar Atividade</h5>
				</div>
				<div class="modal-body">
					<div class="row">
						<form method="POST" id="frmEdicao">
							<input type="hidden" id="edit_event_id" name="event_id" value="">
							<!-- Campos para edição -->
							<div class="form-group col-md-12">
								<label for="local" class="ul-form__label p-0"><span>*</span> Local de Atendimento:</label>
								<input type="text" class="form-control" name="local" id="edit_local" required>
							</div>
							<div class="form-group col-md-12">
								<label for="data_inicio" class="ul-form__label p-0"><span>*</span> Data/Hora:</label>
								<input type="datetime-local" class="form-control" name="data_inicio" id="edit_data_inicio" required>
							</div>
							<div class="form-group col-md-12">
								<label for="obs" class="ul-form__label p-0">Observações</label>
								<input type="text" class="form-control" id="edit_obs" name="obs" placeholder="Descrição/Observações">
							</div>
							<!-- Checkbox atividade ativa -->
							<div class="form-group col-md-12">
								<div class="checkbox-wrapper-2">
									<label for="edit_ativo" class="ul-form__label p-0">Atividade Ativa</label>
									<br>
									<input type="checkbox" class="sc-gJwTLC ikxBAC" name="edit_ativo" id="edit_ativo" value="1">
								</div>
							</div>
							<!-- Checkbox Prioridade -->
							<div class="form-group col-md-12">
								<div class="checkbox-wrapper-2">
									<label for="edit_prio" class="ul-form__label p-0">Prioridade</label>
									<br>
									<input type="checkbox" class="sc-gJwTLC ikxBAC" name="edit_prio" id="edit_prio" value="1">
								</div>
							</div>
							<!-- Mais campos conforme necessário -->
						
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" id="enviaredicaoBtn" class="btn btn-primary">Salvar</button>
					<button type="button" id="cancelarEdicaoBtn" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Modal de Pendência -->
	<div class="modal fade" id="pendenciaModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Pendenciar Atividade</h5>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="motivoPendencia">Motivo da Pendência:</label>
						<input type="text" class="form-control" id="motivoPendencia" placeholder="Digite o motivo da pendência">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="enviarPendenciaBtn" class="btn btn-primary">Enviar</button>
					<button type="button" id="cancelarPendenciaBtn" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
				</div>
			</div>
		</div>
	</div>


<!-- Calendário -->
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12 col-xlg-12 col-md-12">
			<div class="white-box">
				<div class="table-responsive">
					<div id='calendar'></div>
					<script src='assets/js/calendario.js'></script>
				</div>
			</div>
		</div>
	</div>
</div>
