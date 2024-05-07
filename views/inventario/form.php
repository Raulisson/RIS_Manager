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
					<form id="frminventario" method="post" action="index.php?controle=inventario&acao=salvar" autocomplete="off" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-12">
								<div class="card mb-4">
									<div class="card-body">
										<div class="card-title mb-3">
											<?php echo (isset($this->inventario)) ? "Edição" : "Cadastro" ?>
										</div>
										<div class="row mt-3">
											<input type="hidden" name="id" value="<?php if (isset($this->inventario))
																						echo $this->inventario['id'] ?>" />

											<!-- selectEquipamento -->
											<div class="form-group col-md-3">
                                            <label for="selectEquipamento" class="ul-form__label p-0"><span>*</span> Equipamento </label>
													<select name="selectEquipamento" id="selectEquipamento" onchange="mostraDiv(this.value)" class="form-control" required autocomplete="off">
														<option>[Selecione o equipamento]</option>
														<option value="1" >Computador</option>
                                                        <option value="2">Tela</option>
                                                        <option value="3">Equipamentos Gerais</option>
													</select>
											</div>
										</div>
                                        <div class="row mt-3">
                                            <!-- Select do Computador -->
											<div class="form-group col-md-3" style="display:none;" id="selectComputador">
												<label for="computador" class="ul-form__label p-0"><span>*</span>Computador:</label>
                                                <br>
                                                <select name="id_computador" id="id_computador" class="form-control" <?php echo $readonly ?>>
													<option value="">[Selecione um computador]</option>
													<?php 
														foreach($this->computadores as $computador) {
															$selected = "";
															
															if( isset($this->ponto_equipamento['id_computador']) && $this->ponto_equipamento['id_computador'] == $computador['id'] ) {
																$selected = "SELECTED";
															}
															
															echo "<option value='{$computador['id']}' {$selected} {$readonly}>{$computador['marca']}</option>";
														} 
													?>
												</select>
											</div>
                                            <!-- Select da tela -->
											<div class="form-group col-md-3" style="display:none;" id="selectTela">
												<label for="tela" class="ul-form__label p-0"><span>*</span> Marca | Tipo da Tela:</label><br>
                                                <select name="id_tela" id="id_tela" class="form-control" <?php echo $readonly ?>>
													<option value="">[Selecione uma tela]</option>
													<?php 
														foreach($this->telas as $tela) {
															$selected = "";
															
															if( isset($this->ponto_equipamento['id_tela']) && $this->ponto_equipamento['id_tela'] == $tela['id'] ) {
																$selected = "SELECTED";
															}
															
															echo "<option value='{$tela['id']}' {$selected} {$readonly}>{$tela['marca']}</option>";
														} 
													?>
												</select>
											</div>
                                            <!-- Select do equipamento -->
											<div class="form-group col-md-3" style="display:none;" id="selectEquipamento1">
												<label for="equipamento" class="ul-form__label p-0"><span>*</span> Equipamento:</label><br>
                                                <select name="id_equipamento" id="id_equipamento" class="form-control" <?php echo $readonly ?>>
													<option value="">[Selecione um equipamento]</option>
													<?php 
														foreach($this->equipamentos as $equipamento) {
															$selected = "";
															
															if( isset($this->ponto_equipamento['id_equipamento']) && $this->ponto_equipamento['id_equipamento'] == $equipamento['id'] ) {
																$selected = "SELECTED";
															}
															
															echo "<option value='{$equipamento['id']}' {$selected} {$readonly}>{$equipamento['marca']}</option>";
														} 
													?>
												</select>
											</div>
                                            <!-- Patrimônio -->
											<div class="form-group col-md-3" id="patrimonioDiv" style="display:none;">
												<label for="patrimonio" class="ul-form__label p-0"><span>*</span>Número do Patrimônio:</label>
												<input type="text" class="form-control" name="patrimonio" id="patrimonio" value="<?php if (isset($this->inventario))
																															echo $this->inventario['patrimonio'] ?>" required maxlength="10">
											</div>
                                        </div>
                                        <div class="row mt-3">
											<!-- selectLocal -->
											<div class="form-group col-md-3" id="selectLocal" style="display:none;">
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
    var cmbComputador = null;
	$(function() {
			
		// Campo Computador
		$("#id_computador").select2();
		
	});
    var cmbTela = null;
	$(function() {
			
		// Campo Tela
		$("#id_tela").select2();
		
	});
    var cmbTela = null;
	$(function() {
			
		// Campo Equipamento
		$("#id_equipamento").select2();
		
	});
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
    function mostraDiv(value){
        const selectLocal = document.getElementById("selectLocal");
        const patrimonioDiv = document.getElementById("patrimonioDiv");
        const selectComputador = document.getElementById("selectComputador");
        const selectTela = document.getElementById("selectTela");
        const selectEquipamento1 = document.getElementById("selectEquipamento1");
        if(value == "1"){
            selectComputador.style.display = "block";
            selectTela.style.display = "none";
            selectEquipamento1.style.display = "none";
            patrimonioDiv.style.display = "block";
            selectLocal.style.display = "block"
        } else if (value == "2"){
            selectComputador.style.display = "none";
            selectTela.style.display = "block";
            selectEquipamento1.style.display = "none";
            patrimonioDiv.style.display = "block";
            selectLocal.style.display = "block"
        }else if (value == "3"){
            selectComputador.style.display = "none";
            selectTela.style.display = "none";
            selectEquipamento1.style.display = "block";
            patrimonioDiv.style.display = "block";
            selectLocal.style.display = "block"
        }else{
            selectComputador.style.display = "none";
            selectTela.style.display = "none";
            selectEquipamento1.style.display = "none";
            patrimonioDiv.style.display = "none";
            selectLocal.style.display = "none"
        }
    }
	// Submete o formulário
	$("#frminventario").on("submit", function(e) {
	});

</script>