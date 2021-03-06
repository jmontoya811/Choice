class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy,]
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, admin: :all

    def index
        @portfolio_items = Portfolio.all
    end

    def new
        @portfolio_item = Portfolio.new
    end

    def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end 

    def destroy
      @portfolio_item = Portfolio.find(params[:id])
      @portfolio_item.destroy 
      respond_to do |format|
        format.html { redirect_to portfolios_url, notice: 'Portfolio has been removed.' }
    end 
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

    def portfolio_params
      params.require(:portfolio).permit(:title, 
                                        :subtitle,
                                        :body,
                                        :main_image,
                                        :thumb_image)
    end
end
