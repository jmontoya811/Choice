class DepositController < ApplicationController
  def new
end

def create
  @amount = params[:amount]

  @amount = @amount.gsub('$', '').gsub(',', '')

  begin
    @amount = Float(@amount).round(2)
  rescue
    flash[:error] = 'Charge not completed. Please enter a valid amount in USD ($).'
    redirect_to new_deposit_path
    return
  end

  @amount = (@amount * 100).to_i # Must be an integer!

  if @amount < 500
    flash[:error] = 'Deposit not completed. Donation amount must be at least $5.'
    redirect_to new_deposit_path
    return
  end

  Stripe::Charge.create(
    :amount => @amount,
    :currency => 'usd',
    :source => params[:stripeToken],
    :description => 'Custom donation'
  )
  redirect_to thank_you_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_deposit_path
  end

  def thank_you
  end
end