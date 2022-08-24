# frozen_string_literal: true

Spree::Sample.load_sample("products")

weight = Spree::OptionType.find_by!(presentation: "Weight")
volume = Spree::OptionType.find_by!(presentation: "Volume")

miel = Spree::Product.find_by!(name: "Miel de thym - 250G")
miel.option_types = [size, color]
solidus_tshirt.save!
