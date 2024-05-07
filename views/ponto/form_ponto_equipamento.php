<div class="row mt-3">
											<!-- Select do Computador -->
											<div class="form-group col-md-3">
												<label for="computador" class="ul-form__label p-0"><span>*</span> Computador no Local:</label>
                                                <select name="id_computador" id="id_computador" class="tom-select form-control" multiple="multiple" <?php echo $readonly ?>>
													<option value="">[Selecione]</option>
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
											<div class="form-group col-md-3">
												<label for="tela" class="ul-form__label p-0"><span>*</span> Tela no Local:</label>
                                                <select name="id_tela" id="id_tela" class="tom-select form-control" multiple="multiple" <?php echo $readonly ?>>
													<option value="">[Selecione]</option>
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
											<div class="form-group col-md-3">
												<label for="equipamento" class="ul-form__label p-0"><span>*</span> Equipamento no Local:</label>
                                                <select name="id_equipamento" id="id_equipamento" class="tom-select form-control" multiple="multiple" <?php echo $readonly ?>>
													<option value="">[Selecione]</option>
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
                                        </script>