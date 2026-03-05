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


											<!-- Nome do equipamento -->
											<div class="form-group col-md-3" id="nome">
												<label for="nome" class="ul-form__label p-0"><span>*</span>Nome do equipamento:</label>
												<input type="text" class="form-control" name="nome" id="nome" value="<?php if (isset($this->inventario))
																															echo $this->inventario['nome'] ?>" maxlength="10">
											</div>
											<!-- Patrimônio -->
											<div class="form-group col-md-3" id="patrimonioDiv">
												<label for="patrimonio" class="ul-form__label p-0"><span>*</span>Número do Patrimônio:</label>
												<input type="text" class="form-control" name="patrimonio" id="patrimonio" value="<?php if (isset($this->inventario))
																															echo $this->inventario['patrimonio'] ?>" maxlength="10">
											</div>
										</div>
                                        
                                            

                                        <div class="row mt-3">
											
                                            <!-- Select do ponto -->
											<div class="form-group col-md-3" id="selectPonto">
												<label for="id_ponto" class="ul-form__label p-0"><span>*</span> Ponto:</label><br>
                                                <select name="id_ponto" id="id_ponto" class="form-control" <?php echo $readonly ?>>
													<option value="">Estoque</option>
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
	$("#frminventario").on("submit", function(e) {
	});

</script>