<div class="page-breadcrumb bg-white p-4">
	<div class="row align-items-center">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
			<h4 class="page-title text-uppercase font-medium font-14">Vendedores</h4>
		</div>
		<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
			<div class="d-md-flex">
				<a href="?controle=vendedor&acao=form" class="btn btn-primary ml-auto">
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
								
							</tr>
						</thead>
						<tbody>
							<?php
							foreach ($this->pagination->rows as $vendedor) {
								echo "<tr>";
								echo "<td>{$vendedor['id']}</td>";
								echo "<td>" . utf8_encode($vendedor['nome']) . "</td>";
                                
								echo "<td class='text-right pr-1'>";

										echo "<a class='text-16 ml-3 mt-2 font-weight-bold' href='index.php?controle=vendedor&acao=form&id={$vendedor['id']}'>Editar</a>";
										if (Security::usuario()['perfil'] == 1) {
                                    		echo "<a class='text-16 ml-3 mt-2 font-weight-bold text-danger' href='javascript:remove({$vendedor['id']})'>Excluir</a>";
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
				window.location = 'index.php?controle=vendedor&acao=excluir&id=' + id;
			}
		});
	}
</script>