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
  end

  def show
  end

  def destroy
	@arquivo.destroy
      redirect_to arquvivos_path, notice:  "Arquivo excluido."
  end

private

def set_arquivo
	@arquivo = Arquivo.find(params[:id])
end

def arquivo_params
	params.require(:arquivo).permit(:valortotal, :attachment, dados_attributes:[:id, :comprador, :descricao, :preco, :quantidade, :endereco, :fornecedor, :arquivo_id])
end

end
