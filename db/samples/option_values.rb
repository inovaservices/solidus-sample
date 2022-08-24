# frozen_string_literal: true

Spree::Sample.load_sample("option_types")

weight = Spree::OptionType.find_by!(presentation: "Weight")
volume = Spree::OptionType.find_by!(presentation: "Volume")

Spree::OptionValue.create!([
  {
    name: "kilogramme",
    presentation: "kg",
    position: 1,
    option_type: weight
  },
  {
    name: "gramme",
    presentation: "gr",
    position: 2,
    option_type: weight
  },
  {
    name: "milligramme",
    presentation: "mg",
    position: 3,
    option_type: weight
  },
  {
    name: "litre",
    presentation: "l",
    position: 5,
    option_type: volume
  },
  {
    name: "millilitre",
    presentation: "ml",
    position: 4,
    option_type: volume
  },
  {
    name: "centilitre",
    presentation: "cl",
    position: 1,
    option_type: volume
  }
])
