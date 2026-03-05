<div class="page-breadcrumb bg-white p-4">
	<div class="row align-items-center">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
			<h4 class="page-title text-uppercase font-medium font-14">Inventário</h4>
		</div>
        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
			<div class="d-md-flex">
				<a href="?controle=inventario&acao=form" class="btn btn-primary ml-auto">
					Adicionar
				</a>
			</div>
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12 col-xlg-12 col-md-12">
			    <!--  -->
				<form method="GET" action="index.php">
					<input type="hidden" name="controle" value="inventario">
					<input type="hidden" name="acao" value="listar">
					<div class="row mb-3">
						<div class="col-md-4">
							<input type="text" placeholder="Pesquisar ponto" name="search" class="form-control"value="<?php echo isset($_GET['search']) ? $_GET['search'] : ''; ?>">
						</div>
						<div class="col-md-2">
							<button type="submit" class="btn btn-primary">Buscar</button>
						</div>
					</div>
				</form>
				<form method="GET" action="index.php">
					<input type="hidden" name="controle" value="inventario">
					<input type="hidden" name="acao" value="listar">
					<div class="row mb-3">
						<div class="col-md-4">
							<input type="text" placeholder="Pesquisar equipamento" name="searchname" class="form-control"value="<?php echo isset($_GET['searchname']) ? $_GET['searchname'] : ''; ?>">
						</div>
						<div class="col-md-2">
							<button type="submit" class="btn btn-primary">Buscar</button>
						</div>
					</div>
				</form>
			<div class="white-box">
				<div class="table-responsive">

					<!-- Tabela -->
					<table class="table datatable">
						<thead>
							<tr class="ul-widget6__tr--sticky-th">
								<th scope="col">
									<?php echo $this->pagination->column("id", "Nome") ?>
								</th>
                                <th scope="col">
									<?php echo $this->pagination->column("patrimonio", "Patrimônio") ?>
								</th>
                                <th scope="col">
									<?php echo $this->pagination->column("id_ponto", "Local") ?>
								</th>
								<th scope="col">
									<?php echo $this->pagination->column("data", "Criado em") ?>
								</th>
							</tr>
						</thead>
						<tbody>
							<?php
							foreach ($this->pagination->rows as $inventarios) {
								echo "<tr>";
											echo "<td>{$inventarios['nome']}</td>";
										if($inventarios['patrimonio']){
											echo "<td>{$inventarios['patrimonio']}</td>";
										}else {
											echo "<td>Não informado</td>";
										}
										if($inventarios['id_ponto']){
											echo "<td>{$inventarios->id_ponto['nome']}</td>";
										}else {
											echo "<td>Estoque</td>";
										}
										echo "<td>" . date('d/m/Y', strtotime($inventarios['data'])) . "</td>";
										echo "<td class='text-right pr-5'>
										<a class='text-16 mt-2 font-weight-bold' href='index.php?controle=inventario&acao=form&id={$inventarios['id']}'>Editar</a>";
										if ($usuario['perfil'] = "1") {
											echo "<a class='text-16 ml-3 mt-2 font-weight-bold text-danger' href='javascript:remove({$inventarios['id']})'>Excluir</a>";
										}
									echo "</td>";
								echo "</tr>";
							}
							?>
						</tbody>
					</table>

					<!-- Paginação -->
					<?php echo $this->pagination->show() ?>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	function remove(id) {
		confirme("Tem certeza que desejar remover esse registro?", function(rs) {
			if (rs) {
				window.location = 'index.php?controle=inventario&acao=excluir&id=' + id;
			}
		});
	}
</script>