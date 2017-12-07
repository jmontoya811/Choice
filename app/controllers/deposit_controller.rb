class DepositController < ApplicationController
    before_action :amount_to_be_charged
    before_action :set_description
    before_action :authenticate_user!
    
  def new
  end

  def index
  end

def create
    customer = StripeTool.create_customer(email: params[:stripeEmail], 
                                          stripe_token: params[:stripeToken])

    charge = StripeTool.create_charge(customer_id: customer.id, 
                                      amount: @amount,
                                      description: @description)


        redirect_to thank_you_path
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to deposit_index_path
    end

    def thanks
    end

    private

    def amount_to_be_charged
        @amount = 5000
    end

    def set_description
        @description = "Learning Center Material Fee"
    end
end