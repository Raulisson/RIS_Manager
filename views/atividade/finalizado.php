<div class="page-breadcrumb bg-white p-4">
	<div class="row align-items-center">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
			<h4 class="page-title text-uppercase font-medium font-14">Finalizados</h4>
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12 col-xlg-12 col-md-12">
			<div class="row">
				<div class="col-lg-12">
				<form method="POST" action="?controle=atividade&acao=filtro">
                    <div class="col-md-2">
                    	<label>Data de Início:</label>
                        <input type="date" name="data_inicio" class="form-control">
						
                        <label>Data Final:</label>
                        <input type="date" name="data_final" class="form-control">

                        <label>Palavra-Chave:</label>
                        <input type="text" name="pesquisa" class="form-control">
                        <button type="submit" class="btn btn-secondary m-1">Filtrar</button>
                    </div>
                </form>
				</div>
			</div>
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
									<?php echo $this->pagination->column("title", "Local") ?>
								</th>
								<th scope="col">
									<?php echo $this->pagination->column("obs", "Observações") ?>
								</th>
								<th scope="col">
									<?php echo $this->pagination->column("Data", "Data") ?>
								</th>
							</tr>
						</thead>
						<tbody>
							<?php
							foreach ($this->pagination->rows as $booking) {
								echo "<tr>";
									echo "<td>{$booking['id']}</td>";
									echo "<td>{$booking['title']}</td>";
									echo "<td>{$booking['obs']}</td>";
									echo "<td>{$booking['start_date']}</td>";
									
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
