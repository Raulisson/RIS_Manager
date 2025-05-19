<?php
    // Extrai os IDs dos clientes relacionados às vendas que precisam de pós-venda
    $idsClientes = array_map(function($venda) {
        return $venda['id_cliente'];
    }, $this->vendasPosVenda);

    // Gera uma string com os IDs
    $idsQueryString = implode(',', $idsClientes);

    $idsProspeccoes = array_map(function($prospeccao) {
        return $prospeccao['id'];
    }, $this->prospeccoesfeitas);

    $idsQueryStringProspeccao = implode(',', $idsProspeccoes);
?>
<div class="page-breadcrumb bg-white p-4">
	<div class="row align-items-center">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
			<h4 class="page-title text-uppercase font-medium font-14">Dashboard</h4>
</br>
			<a href="index.php?controle=venda&acao=venda_passo_1">
				<button id="venda" class="btn btn-primary text-uppercase font-high font-14">ADICIONAR VENDA</button>
			</a>
		</div>
        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
			<div class="d-md-flex">
				
			</div>
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12 col-xlg-12 col-md-12">
			
			<div class="white-box" style="display: flex; justify-content: center;">
				<div>
				<!-- POS VENDA -->
				<a href="index.php?controle=dashboard&acao=pos_venda&ids=<?= $idsQueryString ?>">
					<button id="pos" class="btn btn-primary text-uppercase font-high font-14 m-2 col-lg-4">
						PÓS VENDA
						<span style="font-weight: bold;  text-align: center;  border-radius: 50%;">(<?= $this->qtdPosVenda ?>)</span>
					</button>
				</a>

				<!-- CLIENTES ANTIGOS -->
<?php $idsAntigosQueryString = implode(',', $this->clientesAntigosIds); ?>
				<a href="index.php?controle=dashboard&acao=clientes_antigos&ids=<?= $idsAntigosQueryString ?>">
					<button id="clientes_antigos" class="btn btn-primary text-uppercase font-high font-14 m-2 col-lg-4">
						CLIENTES ANTIGOS
						<span style="font-weight: bold; text-align: center; border-radius: 50%;">
							(<?= $this->qtdClientesAntigos ?>)
						</span>
					</button>
				</a>
				
				<!-- POS VENDA -->
				<a href="index.php?controle=dashboard&acao=prospeccao&ids=<?= $idsQueryStringProspeccao ?>">
					<button id="prospeccao" class="btn btn-primary text-uppercase font-high font-14 m-2 col-lg-4">
						PROSPECÇÃO
						<span style="font-weight: bold;  text-align: center;  border-radius: 50%;">(<?= $this->qtdProspeccao ?>)</span>
					</button>
				</a>
	
				<a href="?controle=atividade&acao=listarCalendario">
					<button id="pos" class="btn btn-primary text-uppercase font-high font-14 m-2 col-lg-4">agendamentos</button>
				</a>
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
</script>