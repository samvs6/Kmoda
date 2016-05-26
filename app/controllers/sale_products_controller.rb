class SaleProductsController < ApplicationController
  before_action :set_sale_product, only: [:show, :edit, :update, :destroy]

  # GET /sale_products
  # GET /sale_products.json
  def index
    @sale_products = SaleProduct.all
  end

  # GET /sale_products/1
  # GET /sale_products/1.json
  def show
  end

  # GET /sale_products/new
  def new
    @sale_product = SaleProduct.new
  end

  # GET /sale_products/1/edit
  def edit
  end

  # POST /sale_products
  # POST /sale_products.json
  def create
    @sale_product = SaleProduct.new(sale_product_params)

    if @sale_product.save
      # format.html { redirect_to @sale_product, notice: 'Sale product was successfully created.' }
      redirect_to :back
    else
      format.html { render :new }
    end
  end

  # PATCH/PUT /sale_products/1
  # PATCH/PUT /sale_products/1.json
  def update
    respond_to do |format|
      if @sale_product.update(sale_product_params)
        format.html { redirect_to @sale_product, notice: 'Venta de producto editada exitosamente.' }
        format.json { render :show, status: :ok, location: @sale_product }
      else
        format.html { render :edit }
        format.json { render json: @sale_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale_products/1
  # DELETE /sale_products/1.json
  def destroy
    
    if @sale_product.destroy
      redirect_to :back
    # respond_to do |format|
    #   format.html { redirect_to sale_products_url, notice: 'Venta de producto eliminada correctamente.' }
    #   format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_product
      @sale_product = SaleProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_product_params
      params.require(:sale_product).permit(:sale_id, :product_id, :amount)
    end
end
