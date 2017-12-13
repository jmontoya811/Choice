class DepositController < ApplicationController
    before_action :amount_to_be_charged
    before_action :set_description
    before_action :authenticate_user!
    
  def new
  end

  def create
    post '/deposit' do
        token = params[:stripeToken]
        Stripe.api_key = 'sk_test_abcdef1234567890'
        begin
            Stripe::Plan.create(
                 id:  'monthlytuition',
                interval:  'month',
                amount: @amount,
                currency: 'usd',
                description: @description
            )

            redirect thank_you_path
        rescue Stripe::StripeError => e
            @error = e
            erb :error
        end
    end
end


# def create
#     customer = StripeTool.create_customer(email: params[:stripeEmail], 
#                                           stripe_token: params[:stripeToken])

#     charge = StripeTool.create_deposit(customer_id: customer.id, 
#                                       amount: @amount,
#                                       description: @description)


#         redirect_to thank_you_path
#     rescue Stripe::CardError => e
#     flash[:error] = e.message
#     redirect_to deposit_path
#     end

#     def thank_you
#     end

    private

    def amount_to_be_charged
        @amount = 5000
    end

    def set_description
        @description = "Learning Center Material Fee"
    end
end