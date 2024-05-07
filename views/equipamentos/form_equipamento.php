<div class="page-breadcrumb bg-white p-4">
	<div class="row align-items-center">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
			<h4 class="page-title text-uppercase font-medium font-14">Formulário</h4>
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12 col-xlg-12 col-md-12">
			<div class="white-box">
				<div class="table-responsive">

					<!-- Form -->
					<form id="frmEquipamento" method="post" action="index.php?controle=equipamento&acao=salvarEquipamento" autocomplete="off" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-12">
								<div class="card mb-4">
									<div class="card-body">
										<div class="card-title mb-3">
											<?php echo (isset($this->equipamento)) ? "Edição" : "Cadastro" ?>
										</div>
										<div class="row mt-3">
											<input type="hidden" name="id" value="<?php if (isset($this->equipamento))
																						echo $this->equipamento['id'] ?>" />

											<!-- Nome do equipamento -->
											<div class="form-group col-md-3">
												<label for="nome" class="ul-form__label p-0"><span>*</span> Nome:</label>
												<input type="text" class="form-control" name="nome" id="nome" value="<?php if (isset($this->equipamento))
																															echo $this->equipamento['nome'] ?>" required maxlength="200">
											</div>
                                            <!-- Marca do equipamento-->
                                            <div class="form-group col-md-3">
												<label for="marca" class="ul-form__label p-0"><span>*</span> Marca:</label>
												<input type="text" class="form-control" name="marca" id="marca" placeholder="Ex: Kramer" value="<?php if (isset($this->equipamento))
																															echo $this->equipamento['marca'] ?>" required maxlength="40">
											</div>
										</div>
                                        <div class="row mt-3">
                                            <!-- Descrição do equipamento -->
                                            <div class="form-group col-md-6">
												<label for="descricao" class="ul-form__label p-0"> Descrição:</label>
												<input type="text" class="form-control" name="descricao" id="descricao" value="<?php if (isset($this->equipamento))
																															echo $this->equipamento['descricao'] ?>" maxlength="200">
											</div>
                                        </div>
                                    </div>


									<!-- Botões -->
									<div class="card-footer bg-transparent">
										<div class="mc-footer">
											<div class="row">
												<div class="col-lg-12">
													<button type="submit" id="salvarDados" class="btn btn-primary ladda-button m-1" data-style="expand-left">
														<span class="ladda-label">Salvar</span>
													</button>
													<a type="button" href="javascript:history.go(-1)" class="btn btn-secondary m-1">Cancelar</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	// Submete o formulário
	$("#frmequipamento").on("submit", function(e) {
	});

</script>