<div class="page-breadcrumb bg-white p-4">
	<div class="row align-items-center">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
			<h4 class="page-title text-uppercase font-medium font-14">Formulário</h4>
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12 col-xlg-12 col-md-12">
			<div class="white-box">
				<div class="table-responsive">

					<!-- Form -->
					<form id="frmcliente" method="post" action="index.php?controle=cliente&acao=salvar" autocomplete="off">
						<div class="row">
							<div class="col-md-12">
								<div class="card mb-4">
									<div class="card-body">
										<div class="card-title mb-3"> <?php echo (isset($this->cliente)) ? "Adicionando Venda / Edição de cadastro" : "Cadastro" ?></div>
										<div class="row mt-3">
											<input type="hidden" name="id" value="<?php if (isset($this->cliente))
																						echo $this->cliente['id'] ?>" />

											<!-- Nome -->
											<div class="form-group col-md-6">
												<label for="nome" class="ul-form__label p-0"><span>*</span> Nome:</label>
												<input  disabled type="text" class="form-control" name="nome" id="nome" value="<?php if (isset($this->cliente))
																															echo $this->cliente['nome'] ?>" required maxlength="50">
											</div>

											<!-- E-mail -->
											<div class="form-group col-md-6">
												<label for="email" class="ul-form__label p-0"><span>*</span> E-mail:</label>
												<input disabled type="email"  class="form-control" name="email" id="email" value="<?php if (isset($this->cliente)) echo $this->cliente['email'] ?>" required maxlength="100">
												<div id="erro-email" class="text-danger small mt-1"></div>
											</div>
										</div>

										<div class="row mt-3">
											
											<!-- Número -->
											<div class="form-group col-md-6">
												<label for="numero" class="ul-form__label p-0"><span>*</span> Número:</label>
												<input disabled type="text"  class="form-control" name="numero" id="numero" value="<?php if (isset($this->cliente))
																															echo $this->cliente['numero'] ?>" required maxlength="50">
											</div>

											<!-- Empresa -->
											<div class="form-group col-md-6">
												<label for="empresa" class="ul-form__label p-0"><span>*</span> Empresa:</label>
												<input disabled type="text"  class="form-control" name="empresa" id="empresa" value="<?php if (isset($this->cliente))
																															echo $this->cliente['empresa'] ?>" required maxlength="100">
											</div>
										</div>

										<div class="row mt-3">
											
											<!-- CNPJ -->
											<div class="form-group col-md-6">
												<label for="cnpj" class="ul-form__label p-0"><span>*</span> CNPJ:</label>
												<input disabled type="text"  class="form-control" name="cnpj" id="cnpj" value="<?php if (isset($this->cliente))
																															echo $this->cliente['cnpj'] ?>" required maxlength="50">
											</div>

											<!-- Razão Social -->
											<div class="form-group col-md-6">
												<label for="razao_social" class="ul-form__label p-0"><span>*</span> Razão Social:</label>
												<input disabled type="text"  class="form-control" name="razao_social" id="razao_social" value="<?php if (isset($this->cliente))
																															echo $this->cliente['razao_social'] ?>" required maxlength="100">
											</div>
										</div>

										<div class="row">

											<!-- Vendedor -->
											<div class="form-group col-md-6 campo-grupo">
												<label for="vendedor_id" class="ul-form__label p-0"><span>*</span> Vendedor:</label>
												<select disabled name="vendedor_id" id="vendedor_id" class="form-control"  autocomplete="off">
													<option value="">Sem vendedor</option>
													<?php foreach($this->vendedores as $vendedor): ?>
														<option value="<?= htmlspecialchars($vendedor['id']) ?>" 
															<?= isset($this->cliente['id_vendedor']) && $this->cliente['id_vendedor'] == $vendedor['id'] ? 'selected' : '' ?>>
															<?= htmlspecialchars($vendedor['nome']) ?>
														</option>
													<?php endforeach; ?>
												</select>
											</div>

											<!-- Situação -->
											<div class="form-group col-md-6 campo-grupo">
												<label for="situacao" class="ul-form__label p-0"><span>*</span> Situação do cliente:</label>
												<select disabled name="situacao" id="situacao" class="form-control" autocomplete="off">
													<option value="0" <?= (!isset($this->cliente['situacao']) || $this->cliente['situacao'] == '0') ? 'selected' : '' ?>>Prospecção</option>
													<option value="1" <?= (isset($this->cliente['situacao']) && $this->cliente['situacao'] == '1') ? 'selected' : '' ?>>Venda ativa</option>
													<option value="2" <?= (isset($this->cliente['situacao']) && $this->cliente['situacao'] == '2') ? 'selected' : '' ?>>Venda inativa</option>
												</select>
											</div>

										</div>

										
										<!-- Data de Encerramento -->
										<div class="row mt-3" id="encerramento-wrapper" style="display: none;">
											<div class="form-group col-md-6">
												<label for="data_encerramento" class="ul-form__label p-0">Data de encerramento:</label>
												<input type="date" class="form-control" name="data_encerramento" id="data_encerramento" value="">
											</div>
										</div>
									</div>

									<!-- Histórico de Observações -->
									
									<div class="row mt-5">
										<div class="col-md-12">
											<h5 class="font-weight-bold">Histórico de Observações</h5>
											<div class="table-responsive">
												<table class="table table-bordered table-striped">
													<thead>
														<tr>
															<th>Data/Hora</th>
															<th>Observação</th>
															<th>Compra Feita</th>
															<th>Data de Encerramento</th>
															<th>Alterado por</th>
														</tr>
													</thead>
													<tbody>
														<?php if (!empty($this->cliente_observacao)): ?>
															<?php foreach ($this->cliente_observacao as $obs): ?>
																<?php if ($obs['id_cliente'] == $this->cliente['id']): ?>
																	<tr>
																		<td><?= date('d/m/Y H:i', strtotime($obs['data_hora'])) ?></td>
																		<td><?= nl2br(htmlspecialchars($obs['observacao'])) ?></td>
																		<td><?= !empty($obs['compra']) ? nl2br(htmlspecialchars($obs['compra'])) : 'Sem compra informada' ?></td>
																		<td>
																			<?= 
																				!empty($obs['data_encerramento']) && $obs['data_encerramento'] !== '0000-00-00'
																					? date('d/m/Y', strtotime($obs['data_encerramento']))
																					: 'Sem data informada'
																			?>
																		</td>
																		<td><?= nl2br(htmlspecialchars($obs['feito_por'])) ?></td>
																	</tr>
																<?php endif; ?>
															<?php endforeach; ?>
														<?php endif; ?>
														
													</tbody>
												</table>
											</div>
										</div>

									</div>
									
									
									<!-- Botões -->
									<div class="card-footer bg-transparent">
										<div class="mc-footer">
											<div class="row">
												<div class="col-lg-12">
													<button type="submit" id="salvarDados" class="btn btn-primary ladda-button m-1" data-style="expand-left">
														<span class="ladda-label">Salvar</span>
													</button>
													<a type="button" href="javascript:history.go(-1)" class="btn btn-secondary m-1">Cancelar</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


