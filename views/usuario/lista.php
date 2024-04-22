<div class="page-breadcrumb bg-white p-4">
	<div class="row align-items-center">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
			<h4 class="page-title text-uppercase font-medium font-14">Usuários</h4>
		</div>
		<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
			<div class="d-md-flex">
				<a href="?controle=usuario&acao=form" class="btn btn-primary ml-auto">
					Adicionar
				</a>
			</div>
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12 col-xlg-12 col-md-12">
			<div class="white-box">
				<div class="table-responsive">

					<!-- Tabela -->
					<table class="table datatable">
						<thead>
							<tr class="ul-widget6__tr--sticky-th">
								<th scope="col">
									<?php echo $this->pagination->column("id", "Id") ?>
								</th>
								<th scope="col">
									<?php echo $this->pagination->column("nome", "Nome") ?>
								</th>
								<th scope="col">
									<?php echo $this->pagination->column("email", "E-mail") ?>
								</th>
								<th scope="col">
									<?php echo $this->pagination->column("perfil", "Perfil") ?>
								</th>
							</tr>
						</thead>
						<tbody>
							<?php
							foreach ($this->pagination->rows as $usuario) {
								echo "<tr>";
								echo "<td>{$usuario['id']}</td>";
								echo "<td>" . utf8_encode($usuario['nome']) . "</td>";
								echo "<td>" . utf8_encode($usuario['email']) . "</td>";
								
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
				window.location = 'index.php?controle=usuario&acao=excluir&id=' + id;
			}
		});
	}
</script>