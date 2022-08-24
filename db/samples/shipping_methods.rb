# frozen_string_literal: true

begin
  morocco = Spree::Zone.find_or_create_by!(name: 'Morocco')
rescue ActiveRecord::RecordNotFound
  puts "Couldn't find 'North America' zone. Did you run `rake db:seed` first?"
  puts 'That task will set up the countries, states and zones required for Spree.'
  exit
end

tax_category = Spree::TaxCategory.find_by!(name: 'Default')
morocco_vat = Spree::Zone.find_by!(name: 'TVA')
shipping_category = Spree::ShippingCategory.find_or_create_by!(name: 'Default')

Spree::ShippingMethod.create!([
                                {
                                  name: 'Amana',
                                  zones: [morocco],
                                  calculator: Spree::Calculator::Shipping::FlatRate.create!,
                                  tax_category: tax_category,
                                  shipping_categories: [shipping_category]
                                },
                                {
                                  name: 'Aramex',
                                  zones: [morocco],
                                  calculator: Spree::Calculator::Shipping::FlatRate.create!,
                                  tax_category: tax_category,
                                  shipping_categories: [shipping_category]
                                }
                              ])

{
  'Amana' => [40, 'MAD'],
  'Aramex' => [50, 'MAD']
}.each do |shipping_method_name, (price, currency)|
  shipping_method = Spree::ShippingMethod.find_by!(name: shipping_method_name)
  shipping_method.calculator.preferences = {
    amount: price,
    currency: currency
  }
  shipping_method.calculator.save!
  shipping_method.save!
end
