Given("{string}") do |testcase|
  @current_testcase = testcase
  puts "Iniciando o caso de teste: #{@current_testcase}"
end

When("estou logado no sistema") do
  visit "/integrador"
  jquery_path = File.expand_path("../../public/javascripts/jquery.min.js", __dir__)
  page.execute_script(File.read(jquery_path))
  find("#Email").set "qa@adset.com.br"
  find("#Senha").set "9PK6#E8m"
  click_button "Entrar"
end

And("incluo um novo veiculo") do
  click_on "Veículos"
  click_on "Incluir"
end

And("preencho os campos:") do |table|
  dados = table.hashes.first
  selecionar_opcao_select2("marca", dados["marca"])
  selecionar_opcao_select2("modelo", dados["modelo"])
  selecionar_opcao_select2("AnoFabricacao", dados["anoFabricacao"])
  selecionar_opcao_select2("AnoModelo", dados["anoModelo"])
  selecionar_opcao_select2("versao", dados["versao"])

  radio_condicao = dados["condicaoVeiculo"]
  if radio_condicao = dados["condicaoVeiculo"] == "ZeroKm"
    page.execute_script("$('input[name=\"CondicaoVeiculo\"][value=\"#{dados["condicaoVeiculo"]}\"]').closest('div').find('span').addClass('checked');")
    page.execute_script("$('input[name=\"CondicaoVeiculo\"][value=\"Usado\"]').closest('div').find('span').removeClass('checked');")
  else
    page.execute_script("$('input[name=\"CondicaoVeiculo\"][value=\"Usado\"]').closest('div').find('span').addClass('checked');")
    page.execute_script("$('input[name=\"CondicaoVeiculo\"][value=\"ZeroKm\"]').closest('div').find('span').removeClass('checked');")
  end

  find("#Km").set dados["quilometragem"]

  selecionar_opcao_select2("portas", dados["portas"])
  selecionar_opcao_select2("cor", dados["cor"])
  selecionar_opcao_select2("combustivel", dados["combustivel"])
  selecionar_opcao_select2("cambio", dados["cambio"])

  find("#Placa").set dados["placa"]
  find("#Chassi").set dados["chassi"]

  radio_blindado = dados["blindado"]
  if radio_blindado = dados["blindado"] == "True"
    page.execute_script("$('input[name=\"Blindado\"][value=\"#{dados["blindado"]}\"]').closest('div').find('span').addClass('checked');")
    page.execute_script("$('input[name=\"Blindado\"][value=\"False\"]').closest('div').find('span').removeClass('checked');")
  else
    page.execute_script("$('input[name=\"Blindado\"][value=\"False\"]').closest('div').find('span').addClass('checked');")
    page.execute_script("$('input[name=\"Blindado\"][value=\"True\"]').closest('div').find('span').removeClass('checked');")
  end

  find("#Valor").set dados["preco"]

  caracteristicas = dados["caracteristicas"].split(",")
  caracteristicas.each do |caracteristica|
    page.execute_script("$('input[name=\"Caracteristicas\"][value=\"#{caracteristica}\"]').closest('div').find('span').addClass('checked');")
  end

  find("#Informacoes").set dados["obsercacoes"]
  find("#Video").set dados["link"]

  itens_opcionais = dados["itensOpcionais"].split(",")
  itens_opcionais.each do |item|
    page.execute_script("$('input[name=\"Opcionals\"][value=\"#{item}\"]').closest('div').find('span').addClass('checked');")
  end

  fotos = dados["fotos"].split(",")
  diretorio = File.expand_path("../../", __dir__)

  fotos.each do |foto|
    arquivo = File.join(diretorio, foto.strip)
    attach_file("files[]", arquivo, make_visible: true)
  end

  click_button "Confirmar"
  sleep 5
end

Then("sou redirecionado para página de estoque de carro") do
  expect(page).to have_css "#EmpresaLogada"
end

Then("mensagem de alerta cenario negativo: {string}") do |expect_alert|
  alerts = page.all(".validation-summary-errors ul li").map(&:text)
  expect(alerts).to include expect_alert
end
