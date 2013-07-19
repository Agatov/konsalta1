class OrdersController < ApplicationController
  include ApplicationHelper
  def create
    @order = Order.new params[:order]
    if @order.save
      if params[:order][:email].present?
        OrderMailer.konsalt_mail(
          {phone: @order.phone, email: @order.email, username: @order.username, created_at: get_time(@order.created_at)}
        ).deliver
      else
        OrderMailer.call_mail(
          {phone: @order.phone, username: @order.username, created_at: get_time(@order.created_at)}
        ).deliver
      end
      render json: {status: :ok}
    else
      render json: {status: :error}
    end
  end
end