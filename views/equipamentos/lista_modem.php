<div class="page-breadcrumb bg-white p-4">
	<div class="row align-items-center">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
			<h4 class="page-title text-uppercase font-medium font-14">Modens | Chips</h4>
		</div>
        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
			<div class="d-md-flex">
				<a href="?controle=equipamento&acao=cadastrarModem" class="btn btn-primary ml-auto">
					Adicionar
				</a>
			</div>
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12 col-xlg-12 col-md-12">
			<form method="POST" action="?controle=equipamento&acao=filtroModem">
                <div class="col-md-2">
                    <label>ID do Ponto:</label>
                    <input type="text" name="pesquisa" class="form-control">
                    <button type="submit" class="btn btn-secondary m-1">Filtrar</button>
                </div>
            </form>
			<div class="white-box">
				<div class="table-responsive">

					<!-- Tabela -->
					<table class="table datatable">
						<thead>
							<tr class="ul-widget6__tr--sticky-th">
								<th scope="col">
									<?php echo $this->pagination->column("id", "Local") ?>
								</th>
								<th scope="col">
									<?php echo $this->pagination->column("numero", "Número do chip no Modem") ?>
								</th>
							</tr>
						</thead>
						<tbody>
							<?php
							foreach ($this->pagination->rows as $modems) {
								echo "<tr>";
                                    if($modems['id_ponto']){
                                        echo "<td>{$modems->id_ponto['nome']}</td>";
                                    }else {
                                        echo "<td>Estoque</td>";
                                    }
									echo "<td>{$modems['numero']}</td>";
                                    echo "<td class='text-right pr-5'>
									<a class='text-16 mt-2 font-weight-bold' href='index.php?controle=equipamento&acao=cadastrarModem&id={$modems['id']}'>Editar</a>";
                                    if ($usuario['perfil'] = "1") {
                                        echo "<a class='text-16 ml-3 mt-2 font-weight-bold text-danger' href='javascript:remove({$modems['id']})'>Excluir</a>";
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
				window.location = 'index.php?controle=equipamento&acao=excluirModem&id=' + id;
			}
		});
	}
</script>