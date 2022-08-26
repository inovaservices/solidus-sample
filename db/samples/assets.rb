# frozen_string_literal: true

Spree::Sample.load_sample("products")
# Spree::Sample.load_sample("variants")

products = {}
products[:miel_de_thym] = Spree::Product.find_by!(name: "Miel de thym - 250G")
products[:miel_doranger] = Spree::Product.find_by!(name: "Miel de fleur d'oranger - 500G")
products[:huile_argane] = Spree::Product.find_by!(name: "Huile d'argane alimentaire biologique - 100ml")
products[:safran] = Spree::Product.find_by!(name: "Safran de taliouine 5g")
products[:melange_epices] = Spree::Product.find_by!(name: "Mélange d’épices pour poisson - 100G")
products[:olives_meslala] = Spree::Product.find_by!(name: "Olives Meslala Avec harissa 500g")
products[:datte_majhoul] = Spree::Product.find_by!(name: "Dattes Majhoul - Boite 2kg Type B")
products[:huile_sesames] = Spree::Product.find_by!(name: "Huile de sesames 50ml")

def image(name, type = "jpg")
  images_path = Pathname.new(File.dirname(__FILE__)) + "images"
  path = images_path + "#{name}.#{type}"

  return false if !File.exist?(path)

  path
end

images = {
  products[:miel_de_thym].master => [
    {
      attachment: image("miel_de_thym")
    }
  ],
  products[:miel_doranger].master => [
    {
      attachment: image("miel_doranger")
    }
  ],
  products[:safran].master => [
    {
      attachment: image("safran_taliouine")
    }
  ],
  products[:huile_argane].master => [
    {
      attachment: image("huile_argane")
    }
  ],
  products[:olives_meslala].master => [
    {
      attachment: image("olives_meslala")
    }
  ],
  products[:melange_epices].master => [
    {
      attachment: image("melange_epices")
    }
  ],
  products[:datte_majhoul].master => [
    {
      attachment: image("datte_majhoul")
    }
  ],
  products[:huile_sesames].master => [
    {
      attachment: image("huile_sesames")
    }
  ]
}

# products[:solidus_tshirt].variants.each do |variant|
#   color = variant.option_value("tshirt-color").downcase
#   main_image = image("solidus_tshirt_#{color}", "png")
#   File.open(main_image) do |f|
#     variant.images.create!(attachment: f)
#   end
#   back_image = image("solidus_tshirt_back_#{color}", "png")
#
#   next unless back_image
#
#   File.open(back_image) do |f|
#     variant.images.create!(attachment: f)
#   end
# end

# products[:solidus_long].variants.each do |variant|
#   color = variant.option_value("tshirt-color").downcase
#   main_image = image("solidus_long_#{color}", "png")
#   File.open(main_image) do |f|
#     variant.images.create!(attachment: f)
#   end
#   back_image = image("solidus_long_back_#{color}", "png")
#
#   next unless back_image
#
#   File.open(back_image) do |f|
#     variant.images.create!(attachment: f)
#   end
# end
#
# products[:solidus_womens_tshirt].reload.variants.each do |variant|
#   color = variant.option_value("tshirt-color").downcase
#   main_image = image("solidus_womens_tshirt_#{color}", "png")
#   File.open(main_image) do |f|
#     variant.images.create!(attachment: f)
#   end
# end

images.each do |variant, attachments|
  puts "Loading images for #{variant.product.name}"
  attachments.each do |attachment|
    File.open(attachment[:attachment]) do |f|
      variant.images.create!(attachment: f)
    end
  end
end
