class ArticulosController < ApplicationController
  before_action :set_articulo, only: [:show, :edit, :update, :destroy, :toggle_status]

  #Declarando los permisos gracias a la gema petergate
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all


  #Declarando el layout particular que usaremos
  layout "articulo"


  # GET /articulos
  # GET /articulos.json
  def index
    @articulos = Articulo.all
    @page_title = "My portfolio Blog"
  end

  # GET /articulos/1
  # GET /articulos/1.json
  def show
    #En este caso puedo acceder a @articulo porque está disponible por el before_Action :set:articulo
    @page_title = @articulo.titulo
    #sobreescribiendo la variable @seo_keywords por defecto creada por mi para los tags (se crea concerns)
    @seo_keywords = @articulo.cuerpo
  end

  # GET /articulos/new
  def new
    @articulo = Articulo.new
  end

  # GET /articulos/1/edit
  def edit
  end

  # POST /articulos
  # POST /articulos.json
  def create
    @articulo = Articulo.new(articulo_params)

    respond_to do |format|
      if @articulo.save
        format.html { redirect_to @articulo, notice: 'Articulo was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /articulos/1
  # PATCH/PUT /articulos/1.json
  def update
    respond_to do |format|
      if @articulo.update(articulo_params)
        format.html { redirect_to @articulo, notice: 'Articulo was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /articulos/1
  # DELETE /articulos/1.json
  def destroy
    @articulo.destroy
    respond_to do |format|
      format.html { redirect_to articulos_url, notice: 'Articulo was successfully destroyed.' }
    end
  end

def toggle_status
   if @articulo.published?
      @articulo.draft!
    elsif @articulo.draft?
      @articulo.published!
    end

  redirect_to articulos_url
end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articulo
      @articulo = Articulo.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def articulo_params
      params.require(:articulo).permit(:titulo, :cuerpo)
    end
end
