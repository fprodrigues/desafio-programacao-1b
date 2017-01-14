require 'rails_helper'
RSpec.feature "error uploading file" do

	scenario "A user don't creates a new file " do
		visit "/"
		click_link "Adicionar novos dados"
		page.attach_file("arquivo_attachment", Rails.root + 'spec/fixtures/files/dados.pdf') 
		click_button "Processar arquivo"

		expect(page).to have_content ("Arquivo não compativél")
		expect(page.current_path).to eq(new_arquivo_path)
	end
end
