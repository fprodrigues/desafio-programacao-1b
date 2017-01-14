class ArquivosController < ApplicationController
before_action :set_arquivo, only: [:show, :destroy]
  
def index
	@arquivos = Arquivo.all
  end

  def new
	@arquivo = Arquivo.new
  end

  def create
	@arquivo = Arquivo.new(arquivo_params)
   if @arquivo.save
	 file = File.open(File.join(Rails.root,'public', @arquivo.attachment_url), "r")
	arquivo = File.read(file)
	linha = 0
        arquivo.each_line do |l|
    			m = l.chop.split("\t")
			if linha === 0
				linha = 1
			else
	   	    		dado = Dado.create(comprador: m[0],descricao: m[1], preco: m[2], quantidade: m[3], endereco: m[4], fornecedor: m[5], parcial: m[2].to_f*m[3].to_f, arquivo_id: @arquivo.id)
				dado.save
			end  	
		end
	@arquivo.valortotal = Dado.where(arquivo_id: @arquivo.id).sum(:parcial)
	 @arquivo.save
	redirect_to arquivos_path, notice:  "Arquivo processado."
	else
	redirect_to new_arquivo_path, notice:  "Arquivo não compativél."
	end
  end

  def show
  @dados = Dado.where(arquivo_id: @arquivo.id)
  end

  def destroy
	@arquivo.destroy
      redirect_to arquivos_path, notice:  "Arquivo excluido."
  end

private

def set_arquivo
	@arquivo = Arquivo.find(params[:id])
end

def arquivo_params
	params.fetch(:arquivo, {}).permit(:valortotal, :attachment, dados_attributes:[:id, :comprador, :descricao, :preco, :quantidade, :endereco, :fornecedor, :arquivo_id])
end

end
