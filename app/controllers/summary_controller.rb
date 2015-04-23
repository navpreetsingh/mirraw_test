require "prawn"
class SummaryController < ApplicationController
  
  def details
  	@order_details = Order.joins(:items).select("orders.id, number, date, customer_name, sum(quantity * rate) as total, count(received) as status").where("received = 1").group("orders.id")

  	@order_status_total = Order.joins(:items).select("orders.id, count(received) as total_status").group("orders.id")
  end

  def print_bill
  	order = params  	
    send_data generate_pdf(order),
              filename: "#{order[:number]}.pdf",
              type: "application/pdf"
  end

  private
 
    def generate_pdf(order)
      Prawn::Document.new do
      	text "/------------------------------------------------------\\", align: :center
        text "Order no: #{order[:number]}    #{order[:status]}", align: :center
        text "Order Date: #{order[:date]}", align: :center
        text "       ", align: :center
        text "Customer Name: #{order[:customername]}", align: :center
        text "        ", align: :center
        text "   Total       Rs. #{order[:total]}", align: :center
        text "\\============================================/", align: :center
        text "                     ", align: :center
        text "Total amount for items received.", align: :center
      end.render
    end
end
