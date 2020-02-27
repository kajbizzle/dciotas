class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.enrollments.create(due: current_due)

    # Amount in cents
    @amount = (current_due.amount * 100).to_i

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Beta Omega Chapter Dues',
      currency: 'usd',
    })

  redirect_to due_path(current_due)
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end

  private

  def current_due
    @current_due ||= Due.find(params[:due_id])
  end
end
