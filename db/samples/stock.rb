# frozen_string_literal: true

# Spree::Sample.load_sample("variants")

country =  Spree::Country.find_by(iso: 'MA')
location = Spree::StockLocation.first_or_create! name: 'warehouse', address1: '18, Avenue Madagascar, Ocean', city: 'Rabat', zipcode: '10000', country: country, state: country.states.first
location.active = true
location.save!

Spree::Variant.all.each do |variant|
  variant.stock_items.each do |stock_item|
    Spree::StockMovement.create(quantity: 10, stock_item: stock_item)
  end
end
