def clicar_opcao_select2(campo)
    if campo == 'AnoFabricacao' 
        find(:xpath, '//*[@id="form-validate"]/div[1]/div[1]/div/div[2]/div[1]/div[3]/div/div', visible: true).click
    elsif campo == 'AnoFabricacao' || campo == 'AnoModelo'
        find(:xpath, '//*[@id="form-validate"]/div[1]/div[1]/div/div[2]/div[1]/div[4]/div/div', visible: true).click
    else
        find("div.form-campo.#{campo}", visible: :all).click
    end
end


def selecionar_opcao_select2(campo, opcao)
    if !opcao.nil? && !opcao.empty?
        clicar_opcao_select2(campo)
        sleep 1
        using_wait_time(10) do
            begin
            while !page.has_selector?('input.select2-input', visible: true)
                sleep 1 
                clicar_opcao_select2(campo)
            end
        
            find('input.select2-input',visible: true).set(opcao)
            
            expect(page).to have_selector('ul.select2-results', visible: true)
            find('ul.select2-results', text: opcao, visible: true, wait: 10).click
        
            rescue Capybara::ElementNotFound => e
            puts "Elemento não encontrado: #{e.message}"
            raise
            end
        end 
    end                                  
end
