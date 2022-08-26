# frozen_string_literal: true

Spree::PaymentMethod::BogusCreditCard.create!(
  {
    name: "Credit Card",
    description: "Bogus payment gateway",
    active: false
  }
)

Spree::PaymentMethod::Check.create!(
  {
    name: "Check",
    description: "Pay by check.",
    active: true
  }
)

Spree::PaymentMethod::Check.create!(
  {
    name: "Cash on delivery",
    description: "Pay by cash",
    active: true
  }
)

Spree::PaymentMethod::Check.create!(
  {
    name: "Bank transfer",
    description: "Pay by transfer money to bank account",
    active: true
  }
)
