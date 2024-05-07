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
					<form id="frmTela" method="post" action="index.php?controle=equipamento&acao=salvarTela" autocomplete="off" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-12">
								<div class="card mb-4">
									<div class="card-body">
										<div class="card-title mb-3">
											<?php echo (isset($this->tela)) ? "Edição" : "Cadastro" ?>
										</div>
										<div class="row mt-3">
											<input type="hidden" name="id" value="<?php if (isset($this->tela))
																						echo $this->tela['id'] ?>" />

											<!-- Marca da tela -->
											<div class="form-group col-md-3">
												<label for="marca" class="ul-form__label p-0"><span>*</span> Marca:</label>
												<input type="text" class="form-control" name="marca" id="marca" placeholder="EX: LG" value="<?php if (isset($this->tela))
																															echo $this->tela['marca'] ?>" required maxlength="30">
											</div>
                                            <!-- Tamanho da Tela-->
                                            <div class="form-group col-md-3">
												<label for="tamanho" class="ul-form__label p-0"><span>*</span> Tamanho:</label>
												<input type="text" class="form-control" name="tamanho" id="tamanho" placeholder="Ex: 42''" value="<?php if (isset($this->tela))
																															echo $this->tela['tamanho'] ?>" required maxlength="30">
											</div>
										</div>
                                        <div class="row mt-3">
                                            <!-- Tipo da Tela -->
                                            <div class="form-group col-md-6">
												<label for="tipo" class="ul-form__label p-0"> Tipo:</label>
												<input type="text" class="form-control" name="tipo" id="tipo" placeholder="EX: Monitor / Televisão" value="<?php if (isset($this->tela))
																															echo $this->tela['tipo'] ?>" maxlength="200">
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
	$("#frmtela").on("submit", function(e) {
	});

</script>