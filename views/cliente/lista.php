<div class="page-breadcrumb bg-white p-4">
	<div class="row align-items-center">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
			<h4 class="page-title text-uppercase font-medium font-14">Clientes</h4>
		</div>
		<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
			<div class="d-md-flex">
				<a href="?controle=cliente&acao=form" class="btn btn-primary ml-auto">
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
									<?php echo $this->pagination->column("empresa", "Empresa") ?>
								</th>
                                <th scope="col">
									<?php echo $this->pagination->column("numero", "Número") ?>
								</th>
								<th scope="col">
									<?php echo $this->pagination->column("vendedor", "Vendedor") ?>
								</th>
							</tr>
						</thead>
						<tbody>
							<?php
							foreach ($this->pagination->rows as $cliente) {
								echo "<tr>";
								echo "<td>{$cliente['id']}</td>";
								echo "<td>" . utf8_encode($cliente['nome']) . "</td>";
								echo "<td>" . utf8_encode($cliente['email']) . "</td>";
								echo "<td>" . utf8_encode($cliente['empresa']) . "</td>";
								echo "<td>" . utf8_encode($cliente['numero']) . "</td>";
                                if($cliente['id_vendedor']){
                                    foreach($this->vendedores as $vendedor){
                                        if($vendedor['id'] == $cliente['id_vendedor']){
                                            echo "<td>" . utf8_encode($vendedor['nome']) . "</td>";
                                        }
                                    }
                                }else{
                                    echo "<td> Cliente fora da carteira </td>";
                                }
								
								echo "<td class='text-right pr-5'>
									<a class='text-16 mt-2 font-weight-bold' href='index.php?controle=cliente&acao=form&id={$cliente['id']}'>Editar</a>";
                                    if ($usuario['perfil'] = "1") {
                                        echo "<a class='text-16 ml-3 mt-2 font-weight-bold text-danger' href='javascript:remove({$cliente['id']})'>Excluir</a>";
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
				window.location = 'index.php?controle=cliente&acao=excluir&id=' + id;
			}
		});
	}
</script>