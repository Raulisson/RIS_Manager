<div class="page-breadcrumb bg-white p-4">
	<div class="row align-items-center">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
			<h4 class="page-title text-uppercase font-medium font-14">Pontos</h4>
		</div>
        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
			<div class="d-md-flex">
				<a href="?controle=ponto&acao=form" class="btn btn-primary ml-auto">
					Adicionar
				</a>
			</div>
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12 col-xlg-12 col-md-12">
			<form method="POST" action="?controle=ponto&acao=filtro">
                <div class="col-md-2">
                    <label>Nome do Ponto:</label>
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
									<?php echo $this->pagination->column("id", "#") ?>
								</th>
								<th scope="col">
									<?php echo $this->pagination->column("nome", "Nome") ?>
								</th>
								<th scope="col">
									<?php echo $this->pagination->column("endereco", "Endereço") ?>
								</th>
                                <th scope="col">
									<?php echo $this->pagination->column("nome_responsavel", "Nome do Responsável") ?>
								</th>
                                <th scope="col">
									<?php echo $this->pagination->column("contato_responsavel", "Contato do Responsável") ?>
								</th>
							</tr>
						</thead>
						<tbody>
							<?php
							foreach ($this->pagination->rows as $pontos) {
								echo "<tr>";
									echo "<td>{$pontos['id']}</td>";
									echo "<td>{$pontos['nome']}</td>";
									echo "<td>{$pontos['endereco']}</td>";
									echo "<td>{$pontos['nome_responsavel']}</td>";
									echo "<td>{$pontos['contato_responsavel']}</td>";
                                    echo "<td class='text-right pr-5'>
									<a class='text-16 mt-2 font-weight-bold' href=''>Equipamentos</a>";
                                    echo "<a class='text-16 ml-3 mt-2 font-weight-bold' href='index.php?controle=ponto&acao=form&id={$pontos['id']}'>Editar</a>";
									if ($usuario['perfil'] = "1") {
                                        echo "<a class='text-16 ml-3 mt-2 font-weight-bold text-danger' href='javascript:remove({$pontos['id']})'>Excluir</a>";
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
				window.location = 'index.php?controle=ponto&acao=excluir&id=' + id;
			}
		});
	}
</script>