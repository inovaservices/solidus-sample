# frozen_string_literal: true

morocco = Spree::Country.find_by!(iso: "MA")
rabat = Spree::State.find_by!(name: "Rabat")

names = ["Adil", "Aziz", "Imane", "Fatima",
         "Tarik", "Nourreddine", "Amal", "Abdessalam",
         "Mouad", "Ibtissam"]

street_addresses = ["Av. My Abdellah, Lot. Rachad", "Rue Sanawbar, Lot. Al Wafae"]

secondary_addresses = ["Imm. 918", "Imm. 374", "Apt. 714", "Apt. 351",
                       "Imm. 274", "Imm. 240", "Imm. 892", "Apt. 176",
                       "Apt. 986", "Apt. 583"]

cities = ['Casablanca', "Tanger", "Tetouan",
          "Kenitra", "Marrakech", "Dakhela", "Oujda",
          "Meknes", "Fes", "Ouarzazate"]

phone_numbers = ["00212661000000", "00212660342312",
                 "0021270000000", '0021266123456']

2.times do
  Spree::Address.create!(
    name: names.sample,
    address1: street_addresses.sample,
    address2: secondary_addresses.sample,
    city: cities.sample,
    state: rabat,
    zipcode: 10_000,
    country: morocco,
    phone: phone_numbers.sample
  )
end
