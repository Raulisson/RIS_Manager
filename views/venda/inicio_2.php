<div class="page-breadcrumb bg-white p-4">
	<div class="row align-items-center">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
			<h4 class="page-title text-uppercase font-medium font-14">VENDA</h4>

		</div>
        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
			<div class="d-md-flex">
				
			</div>
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12 col-xlg-12 col-md-12">
			
			<div class="white-box" style="display: flex; justify-content: center;">
				<div>
                    <h4>Digite o nome da empresa</h4>
				    <form method="GET" action="index.php">
						<input type="hidden" name="controle" value="cliente">
						<input type="hidden" name="acao" value="listar">
						<div class="row mb-3">
							<div class="col-md-6">
								<input type="text" placeholder="Pesquisar" name="search" class="form-control"value="<?php echo isset($_GET['search']) ? $_GET['search'] : ''; ?>">
							</div>
							<div class="col-md-2">
								<button type="submit" class="btn btn-primary">Buscar</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	
</script>