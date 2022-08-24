# frozen_string_literal: true

Spree::Sample.load_sample("addresses")
Spree::Sample.load_sample("stores")

payment_method = Spree::PaymentMethod::Check.first!
store = Spree::Store.first!

orders = []
orders << Spree::Order.create!(
  number: "R123456789",
  email: "client@example.com",
  currency: "MAD",
  item_total: 159,
  adjustment_total: 100,
  total: 259,
  shipping_address: Spree::Address.first,
  billing_address: Spree::Address.last
)

orders << Spree::Order.create!(
  number: "R987654321",
  email: "client@example.com",
  currency: "MAD",
  item_total: 159,
  adjustment_total: 100,
  total: 259,
  shipping_address: Spree::Address.first,
  billing_address: Spree::Address.last
)

orders[0].line_items.create!(
  variant: Spree::Product.find_by!(name: "Miel de thym - 250G").master,
  quantity: 1,
  price: 12
)

orders[1].line_items.create!(
  variant: Spree::Product.find_by!(name: "Huile d'argane alimentaire biologique - 100ml").master,
  quantity: 1,
  price: 7
)

orders.each do |order|
  order.payments.create!(payment_method: payment_method)
  order.update(store: store)

  order.next! while !order.can_complete?
  order.complete!
end
