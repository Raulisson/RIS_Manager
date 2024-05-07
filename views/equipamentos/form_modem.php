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
					<form id="frmmodem" method="post" action="index.php?controle=equipamento&acao=salvarModem" autocomplete="off" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-12">
								<div class="card mb-4">
									<div class="card-body">
										<div class="card-title mb-3">
											<?php echo (isset($this->modem)) ? "Edição" : "Cadastro" ?>
										</div>
										<div class="row mt-3">
											<input type="hidden" name="id" value="<?php if (isset($this->modem))
																						echo $this->modem['id'] ?>" />
										</div>
                                        <div class="row mt-3">
                                            <!-- Número do chip -->
											<div class="form-group col-md-3"  >
												<label for="numero" class="ul-form__label p-0"><span>*</span>Número do Chip:</label>
												<input type="text" class="form-control" name="numero" id="numero" value="<?php if (isset($this->modem))
																															echo $this->modem['numero'] ?>" required maxlength="20">
											</div>
                                        </div>
                                        <div class="row mt-3">
											<!-- selectLocal -->
											<div class="form-group col-md-3">
                                            <label for="selectLocal" class="ul-form__label p-0"><span>*</span> Está em algum ponto? </label>
													<select name="selectLocal" id="selectLocal" onchange="mostraPonto(this.value)" class="form-control" required autocomplete="off">
														<option>[Selecione]</option>
														<option value="1" >Sim</option>
                                                        <option value="2">Não</option>
													</select>
											</div>
                                            <!-- Select do ponto -->
											<div class="form-group col-md-3" style="display:none;" id="selectPonto">
												<label for="id_ponto" class="ul-form__label p-0"><span>*</span> Ponto:</label><br>
                                                <select name="id_ponto" id="id_ponto" class="form-control" <?php echo $readonly ?>>
													<option value="">[Selecione um ponto]</option>
													<?php 
														foreach($this->pontos as $ponto) {
															$selected = "";
															
															if( isset($this->ponto_equipamento['id_ponto']) && $this->ponto_equipamento['id_ponto'] == $ponto['id'] ) {
																$selected = "SELECTED";
															}
															
															echo "<option value='{$ponto['id']}' {$selected} {$readonly}>{$ponto['nome']}</option>";
														} 
													?>
												</select>
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
    var cmbPonto = null;
	$(function() {
			
		// Campo Ponto
		$("#id_ponto").select2();
		
	});

    function mostraPonto(value){
        const selectPonto = document.getElementById("selectPonto");
        if(value == "1"){
            selectPonto.style.display = "block";
        }else{
            selectPonto.style.display = "none";
        }
    }
	// Submete o formulário
	$("#frmmodem").on("submit", function(e) {
	});

</script>