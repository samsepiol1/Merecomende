class RecomendacoesController < ApplicationController
  before_action :set_recomendacao, only: %i[ show edit update destroy ]

  # GET /recomendacoes or /recomendacoes.json
  def index
    @recomendacoes = Recomendacao.all
  end

  # GET /recomendacoes/1 or /recomendacoes/1.json
  def show
  end

  # GET /recomendacoes/new
  def new
    @recomendacao = Recomendacao.new
  end

  # GET /recomendacoes/1/edit
  def edit
  end

  # POST /recomendacoes or /recomendacoes.json
  def create
    @recomendacao = Recomendacao.new(recomendacao_params)

    respond_to do |format|
      if @recomendacao.save
        format.html { redirect_to recomendacao_url(@recomendacao), notice: "Recomendacao was successfully created." }
        format.json { render :show, status: :created, location: @recomendacao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recomendacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recomendacoes/1 or /recomendacoes/1.json
  def update
    respond_to do |format|
      if @recomendacao.update(recomendacao_params)
        format.html { redirect_to recomendacao_url(@recomendacao), notice: "Recomendacao was successfully updated." }
        format.json { render :show, status: :ok, location: @recomendacao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recomendacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recomendacoes/1 or /recomendacoes/1.json
  def destroy
    @recomendacao.destroy

    respond_to do |format|
      format.html { redirect_to recomendacoes_url, notice: "Recomendacao was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recomendacao
      @recomendacao = Recomendacao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recomendacao_params
      params.require(:recomendacao).permit(:artista, :titulo, :img, :desc)
    end
end
