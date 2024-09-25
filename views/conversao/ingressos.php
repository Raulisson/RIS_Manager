<?php
require_once __DIR__ . '/../../vendor/autoload.php';

?>

<div class="page-breadcrumb bg-white p-4">
	<div class="row align-items-center">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
			<h4 class="page-title text-uppercase font-medium font-14">Conversão de Ingressos</h4>
		</div>
        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
			
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12 col-xlg-12 col-md-12">
			<div class="white-box">
            <div class="page-breadcrumb bg-white p-4">
	<div class="row align-items-center">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
			<h4 class="page-title text-uppercase font-medium font-14">CONVERSOR</h4>
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12 col-xlg-12 col-md-12">
			<div class="white-box">
				<div class="table-responsive">

					<!-- Form -->
					<form id="frmConversao" method="post" action="index.php?controle=conversao&acao=conversao" autocomplete="off" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-12">
								<div class="card mb-4">
									<div class="card-body">
										<!-- Input para Códigos dos Ingressos (Excel) -->
										<div class="form-group col-md-6">
											<label for="codigoIngressos">Códigos dos ingressos (Excel)</label>
											<input type="file" name="arquivo_excel" id="codigoIngressos" class="form-control" accept=".xls, .xlsx" required>
										</div>

										<!-- Input para Modelo do Ingresso (Imagem) -->
										<div class="form-group col-md-6">
											<label for="modeloIngresso">Modelo do ingresso (PNG, JPG, JPEG)</label>
											<input type="file" name="arquivo_imagem" id="modeloIngresso" class="form-control" accept=".png, .jpg, .jpeg" required>
										</div>
                                    </div>


									<!-- Botões -->
									<div class="card-footer bg-transparent">
										<div class="mc-footer">
											<div class="row">
												<div class="col-lg-12">
													<button type="submit" id="salvarDados" class="btn btn-primary ladda-button m-1" data-style="expand-left">
														<span class="ladda-label">Converter</span>
													</button>
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
			</div>
		</div>
	</div>
</div>
<script>

	
</script>