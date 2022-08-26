# frozen_string_literal: true
unless Spree::OptionType.all.pluck(:name) == ["weight", "volume"]
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
end
