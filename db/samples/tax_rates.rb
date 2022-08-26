# frozen_string_literal: true

morocco = Spree::Zone.find_or_create_by(name: "Morocco")
terroir = Spree::TaxCategory.find_by!(name: "Default")
tax_rate = Spree::TaxRate.create(
  name: "Morocco",
  zone: morocco,
  amount: 0.05
)
tax_rate.calculator = Spree::Calculator::DefaultTax.create!
tax_rate.save!
Spree::TaxRateTaxCategory.create!(
  tax_rate: tax_rate,
  tax_category: terroir
)
