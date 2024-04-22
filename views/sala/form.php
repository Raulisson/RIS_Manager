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
					<form id="frmSala" method="post" action="index.php?controle=sala&acao=salvar" autocomplete="off" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-12">
								<div class="card mb-4">
									<div class="card-body">
										<div class="card-title mb-3">
											<?php echo (isset($this->sala)) ? "Edição" : "Cadastro" ?>
										</div>
										<div class="row mt-3">
											<input type="hidden" name="id" value="<?php if (isset($this->sala))
																						echo $this->sala['id'] ?>" />
											<!-- Select Número do andar -->
											<div class="form-group col-md-6">
												<label for="numero" class="ul-form__label p-0"><span>*</span> Andar</label>
													<select name="andar[]" id="andar" class="form-control" required autocomplete="off">
														<option>[Selecione]</option>
														<?php
														foreach ($this->andares as $andar) {
															$selected = ( isset($this->sala) && $this->sala["id_andar"] == $andar["id"] )  ? 'selected' : '';
															echo "<option value='{$andar['id']}' {$selected}>{$andar['numero']}</option>";
														}
														?>
													</select>
											</div>

											<!-- Número da sala -->
											<div class="form-group col-md-6">
												<label for="sala" class="ul-form__label p-0"><span>*</span> Sala:</label>
												<input type="text" class="form-control" name="sala" id="sala" value="<?php if (isset($this->sala))
																															echo $this->sala['sala'] ?>" required maxlength="30">
											</div>
										</div>

										<div class="row mt-3">
                                            <!-- Arquivo -->
                                            <div class="col-12">
												<div class="form-group mb-4 campo-arquivo">
													<label class="col-md-12 p-0">Arquivo</label>
													<div class="col-md-12 border-bottom p-0">
														<input type="file" name="arquivo" id="arquivo" class="form-control p-0 border-0" 
															<?php if( !isset($this->sala) ) { echo 'required'; } ?> accept=".jpg, .jpeg, .png, .mp4" /> 
													</div>
												</div>
											</div>

											<div class="col-12">
												<!-- Arquivo anterior em caso de edição -->
												<?php 
												if(isset($this->sala)){
													$file_name_temp = $this->sala['arquivo'];
													$imageExtension = explode('.', $file_name_temp);
													$imageExtension = strtolower(end($imageExtension));
													
													if( $imageExtension == "jpg"){
														echo "<img width='30%' src='./".$andar['id_empresa']."/".$this->sala['arquivo']."'>";
													}else if ( $imageExtension == "png"){
														echo "<img width='30%' src='./".$andar['id_empresa']."/".$this->sala['arquivo']."'>";
													}else if ( $imageExtension == "jpeg"){
														echo "<img width='30%' src='./".$andar['id_empresa']."/".$this->sala['arquivo']."'>";
													}else if ( $imageExtension == 'mp4'){
														echo "<video width='30%' src='./".$andar['id_empresa']."/".$this->sala['arquivo']."' controls>";
													}else {
														echo "<h1>Arquivo não encontrado</h1>";
													}
												}
												?>
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
	$("#frmSala").on("submit", function(e) {
	});

</script>