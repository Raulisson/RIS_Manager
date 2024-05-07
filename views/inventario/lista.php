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
									<?php echo $this->pagination->column("id", "Tipo") ?>
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
                                    if($inventarios['id_computador']){
                                        echo "<td>{$inventarios->id_computador['marca']}</td>";
                                        echo "<td>{$inventarios->id_computador['tipo']}</td>";
                                    }else if($inventarios['id_tela']){
                                        echo "<td>{$inventarios->id_tela['marca']}, {$inventarios->id_tela['tamanho']}</td>";
                                        echo "<td>{$inventarios->id_tela['tipo']}</td>";
                                    }
                                    else if($inventarios['id_equipamento']){
                                        echo "<td>{$inventarios->id_equipamento['nome']}, {$inventarios->id_equipamento['marca']}</td>";
                                        echo "<td>{$inventarios->id_equipamento['descricao']}</td>";
                                    }
                                    echo "<td>{$inventarios['patrimonio']}</td>";
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