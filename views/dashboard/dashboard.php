<div class="page-breadcrumb bg-white p-4">
	<div class="row align-items-center">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
			<h4 class="page-title text-uppercase font-medium font-14">Dashboard</h4>
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
				<button id="pos" class="btn btn-primary text-uppercase font-high font-14 m-2 col-lg-4">PÓS VENDA</button>
				<button id="pos" class="btn btn-primary text-uppercase font-high font-14 m-2 col-lg-4">Clientes antigos</button>
				<button id="pos" class="btn btn-primary text-uppercase font-high font-14 m-2 col-lg-4">prospecção</button>
				<button id="pos" class="btn btn-primary text-uppercase font-high font-14 m-2 col-lg-4">agendamentos</button>
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