<?php
require_once __DIR__ . '/../../vendor/autoload.php';

?>

<div class="page-breadcrumb bg-white p-4">
	<div class="row align-items-center">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
			<h4 class="page-title text-uppercase font-medium font-14">Gerar Relatório IVC</h4>
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
				<form id="frmRelatorioIVC" method="post" action="?controle=atividade&acao=converterIVC" autocomplete="off" enctype="multipart/form-data">
					<div class="row">
						<div class="col-md-12">
							<div class="card mb-4">
								<div class="card-body">
									<!-- Data Início -->
									<div class="form-group col-md-6">
										<label for="data_inicio" class="ul-form__label p-0"><span>*</span> Data de Início:</label>
										<input type="date" class="form-control" name="data_inicio" id="data_inicio" required>
									</div>
									<!-- Data Fim -->
									<div class="form-group col-md-6">
										<label for="data_fim" class="ul-form__label p-0"><span>*</span> Data de Fim:</label>
										<input type="date" class="form-control" name="data_fim" id="data_fim" required>
									</div>


									<!-- Botões -->
									<div class="card-footer bg-transparent">
										<div class="mc-footer">
											<div class="row">
												<div class="col-lg-12">
												<button type="submit" id="converterBtn" class="btn btn-primary ladda-button m-1" data-style="expand-left">
													<span class="ladda-label">Converter e Exportar</span>
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