class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    @productos = Product.all
    @sale_products = SaleProduct.where(sale_id: @sale.id)
  end



  def end_sale
    sale = Sale.find(params[:id])
    # sale.sale_products.each do |offer|
    #   current_amount = Product.find(offer.product_id).amount
    #   Product.find(offer.product_id).update(amount: (current_amount - offer.amount))
    # end
    sale.update({finished: true})
    redirect_to sales_path
  end

  # GET /sales/new
  def new
    @clientes = Client.all
    @productos = Product.all
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
    @clientes = Client.all
    @productos = Product.all
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Venta creada exitosamente.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Venta editada exitosamente.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Venta eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:client_id, :product_id, :sale_product)
    end
end
