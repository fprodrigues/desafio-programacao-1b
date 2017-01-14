require 'rails_helper'
RSpec.feature "uploading file" do

	scenario "A user creates a new file" do
		visit "/"
		click_link "Adicionar novos dados"
		page.attach_file("attchment", Rails.root + 'spec/fixtures/files/dados.txt') 
		click_button "Processar arquivo"

		expect(page).to have_content ("Arquivo processado")
		expect(page.current_path).to eq(arquivos_path)
	end
end
