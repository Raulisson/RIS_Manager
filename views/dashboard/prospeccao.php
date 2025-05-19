<div class="page-breadcrumb bg-white p-4">
	<div class="row align-items-center">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
			<h4 class="page-title text-uppercase font-medium font-14">Minhas prospecções</h4>
		</div>
		<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
			<div class="d-md-flex">
				<a href="index.php?controle=venda&acao=venda_passo_1" class="btn btn-primary ml-auto">
					Adicionar Prospecção
				</a>
			</div>
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12 col-xlg-12 col-md-12">
			<form method="GET" action="index.php">
				<input type="hidden" name="controle" value="dashboard">
				<input type="hidden" name="acao" value="prospeccao">
				<div class="row mb-3">
					<div class="col-md-4">
						<input type="text" placeholder="Pesquisar empresa cliente" name="search" class="form-control"value="<?php echo isset($_GET['search']) ? $_GET['search'] : ''; ?>">
					</div>
					<div class="col-md-2">
						<button type="submit" class="btn btn-primary">Buscar</button>
					</div>
				</div>
			</form>
</br>
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
									<?php echo $this->pagination->column("vendedor", "Vendedor") ?>
								</th>
								<th scope="col">
									<?php echo $this->pagination->column("observacao", "Observação") ?>
								</th>
								<th scope="col">
									<?php echo $this->pagination->column("id_cliente", "Cliente") ?>
								</th>
								<th scope="col">
									<?php echo $this->pagination->column("data_hora", "Data/Hora Realizado") ?>
								</th>
							</tr>
						</thead>
						<tbody>
							<?php
							foreach ($this->pagination->rows as $prospeccao) {
                                if($prospeccao['id_vendedor']){
                                    foreach($this->vendedores as $vendedor){
                                        if($vendedor['id_usuario'] == Security::usuario()['id'] && $prospeccao['id_vendedor'] == $vendedor['id']){
                                            echo "<tr>";
                                            echo "<td>{$prospeccao['id']}</td>";
                                            if($prospeccao['id_vendedor']){
                                                foreach($this->vendedores as $vendedor){
                                                    if($vendedor['id'] == $prospeccao['id_vendedor']){
                                                        echo "<td>" . utf8_encode($vendedor['nome']) . "</td>";
                                                    }
                                                }
                                            }
                                            echo "<td>" . $prospeccao['observacao'] . "</td>";
                                            if($prospeccao['id_cliente']){
                                                foreach($this->clientes as $cliente){
                                                    if($cliente['id'] == $prospeccao['id_cliente']){
                                                        echo "<td>" . utf8_encode($cliente['empresa']) . "</td>";
                                                    }
                                                }
                                            }
                                            echo "<td>" . date('d/m/Y H:i', strtotime($prospeccao['data_hora'])) . "</td>";
                                            
                                            echo "<td class='text-right pr-1'>";
                                            echo "<a class='text-16 mt-2 ml-3 font-weight-bold' href='index.php?controle=cliente&acao=visualizar&id={$prospeccao['id_cliente']}'>Visualizar</a>";
                                            
                                            echo "</td>";
                                            echo "</tr>";
                                        }
                                    }
                                }
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