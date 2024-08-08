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
			    <!-- selectEquipamento -->
				<div class="form-group col-md-4">
                        <label for="selectEquipamento" class="ul-form__label p-0"><span>*</span> Equipamento </label>
						<select name="selectEquipamento" id="selectEquipamento" onchange="mostraDiv(this.value)" class="form-control" required autocomplete="off">
                            <option>[Selecione o equipamento para filtrar]</option>
                            <option value="1" >Computador</option>
                            <option value="2">Tela</option>
                            <option value="3">Equipamentos Gerais</option>
						</select>
					</div>
				<form method="POST" action="?controle=inventario&acao=filtro">
                    <div class="col-lg-12">
                        <div class="col-md-2" id="mostraPc" style="display:none;">
                            <label>Insira o ID do Computador:</label>
                            <input type="text" name="pesquisaPc" class="form-control">
                        </div>
                        <div class="col-md-2" id="mostraTela" style="display:none;">
                            <label>Insira o ID da Tela:</label>
                            <input type="text" name="pesquisaTela" class="form-control">
                        </div>
                        <div class="col-md-2" id="mostraEquipamento" style="display:none;">
                            <label>Insira o ID do Equipamento:</label>
                            <input type="text" name="pesquisaEquipamento" class="form-control">
                        </div>
                        <button type="submit" style="display:none;" id="mostraFiltro" class="btn btn-secondary m-1">Filtrar</button>
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
								if($inventarios['id_equipamento'] == 2){
									if($inventarios['id_ponto']){
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
									}
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
	function mostraDiv(value){
        const mostraFiltro = document.getElementById("mostraFiltro");
        const mostraPc = document.getElementById("mostraPc");
        const mostraTela = document.getElementById("mostraTela");
        const mostraEquipamento = document.getElementById("mostraEquipamento");
        if(value == "1"){
            mostraPc.style.display = "block";
            mostraTela.style.display = "none";
            mostraEquipamento.style.display = "none";
            mostraFiltro.style.display = "block";
        } else if (value == "2"){
            mostraPc.style.display = "none";
            mostraTela.style.display = "block";
            mostraEquipamento.style.display = "none";
            mostraFiltro.style.display = "block";
        }else if (value == "3"){
            mostraPc.style.display = "none";
            mostraTela.style.display = "none";
            mostraEquipamento.style.display = "block";
            mostraFiltro.style.display = "block";
        }else{
            mostraPc.style.display = "none";
            mostraTela.style.display = "none";
            mostraEquipamento.style.display = "none";
            mostraFiltro.style.display = "none";
        }
    }
	function remove(id) {
		confirme("Tem certeza que desejar remover esse registro?", function(rs) {
			if (rs) {
				window.location = 'index.php?controle=inventario&acao=excluir&id=' + id;
			}
		});
	}
</script>s