Given("que acesso a pagina de login") do
  visit "/integrador"
end

Quando("submeto o seguinte formulario de login com {string} e {string}") do |email, senha|
  find("#Email").set email
  find("#Senha").set senha

  click_button "Entrar"
end

Then("sou redirecionado para o Dashboad") do
  expect(page).to have_css ".dashboard-container"
end

Then("mensagem de alerta: {string}") do |expect_alert|
  alert = find(".field-validation-error")
  expect(alert.text).to eql expect_alert
end
