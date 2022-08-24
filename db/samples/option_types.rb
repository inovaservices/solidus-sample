# frozen_string_literal: true

Spree::OptionType.create!([
  {
    name: "weight",
    presentation: "Weight",
    position: 1
  },
  {
    name: "volume",
    presentation: "Volume",
    position: 2
  }
])
