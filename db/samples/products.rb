# frozen_string_literal: true

Spree::Sample.load_sample("tax_categories")
Spree::Sample.load_sample("shipping_categories")

tax_category = Spree::TaxCategory.find_by!(name: "Default")
shipping_category = Spree::ShippingCategory.find_by!(name: "Default")

descriptions = [
  "Occaecati repellendus soluta perspiciatis ea ea voluptatum alias. Dolorem possimus sunt ipsam eos aliquam voluptates. Voluptate est nemo ullam cumque ea ut molestiae iste.",
  "Nisi dolor explicabo est fugiat alias. Asperiores sunt rerum quisquam perspiciatis quis doloremque. Autem est harum eum dolorem voluptas nihil. Nulla omnis voluptas sint cumque ad ut dignissimos reiciendis. Mollitia culpa iure libero labore nulla autem non eum.",
  "Perferendis sed voluptatem error ipsam voluptatem esse ipsa incidunt. Doloremque quos ratione quia voluptas consequatur mollitia optio. Optio sed iure aut aliquid voluptatum facilis mollitia cum. Dignissimos in saepe consequatur et consequatur dolorem blanditiis.",
  "Necessitatibus optio quod ullam itaque quis corporis occaecati. Saepe harum voluptates consectetur rerum dolorum. Corrupti officiis reprehenderit quo excepturi cumque. Soluta eos perspiciatis aut et ea nulla amet dolores. Dolores distinctio nesciunt libero voluptas molestiae consequatur aut veritatis.",
  "Soluta sed error debitis repellendus et. Voluptates unde enim qui velit. Libero earum tenetur nulla similique temporibus quod repellendus quibusdam.",
  "Recusandae animi deserunt provident dignissimos ullam harum alias et. Itaque dicta maxime consectetur ut nemo non voluptatem. Voluptatem ipsum ut culpa eaque dolores.",
]

default_attrs = {
  description: descriptions.sample,
  available_on: Time.current
}

products = [
  {
    name: "Miel de thym - 250G",
    tax_category: tax_category,
    shipping_category: shipping_category,
    price: 12,
    mad_price: 120,
    weight: 0.25,
    height: 20,
    width: 10,
    depth: 5
  },
  {
    name: "Miel de fleur d'oranger - 500G",
    tax_category: tax_category,
    shipping_category: shipping_category,
    price: 5,
    mad_price: 50,
    weight: 0.5,
    height: 20,
    width: 10,
    depth: 5
  },
  {
    name: "Huile d'argane alimentaire biologique - 100ml",
    tax_category: tax_category,
    shipping_category: shipping_category,
    price: 7,
    mad_price: 70,
    weight: 0.1,
    height: 20,
    width: 10,
    depth: 5
  },
  {
    name: "Safran de taliouine 5g",
    tax_category: tax_category,
    shipping_category: shipping_category,
    price: 20,
    mad_price: 198,
    weight: 0.05,
    height: 5,
    width: 5,
    depth: 5
  },
  {
    name: "Mélange d’épices pour poisson - 100G",
    tax_category: tax_category,
    shipping_category: shipping_category,
    price: 1.3,
    mad_price: 13,
    weight: 0.1,
    height: 20,
    width: 10,
    depth: 5
  },
  {
    name: "Olives Meslala Avec harissa 500g",
    tax_category: tax_category,
    shipping_category: shipping_category,
    price: 0.3,
    mad_price: 27,
    weight: 0.5,
    height: 20,
    width: 10,
    depth: 5
  },
  {
    name: "Dattes Majhoul - Boite 2kg Type B",
    tax_category: tax_category,
    shipping_category: shipping_category,
    price: 15,
    mad_price: 150,
    weight: 2,
    height: 20,
    width: 10,
    depth: 5
  },
  {
    name: "Huile de sesames 50ml",
    tax_category: tax_category,
    shipping_category: shipping_category,
    price: 0.3,
    mad_price: 30,
    weight: 0.5,
    height: 20,
    width: 10,
    depth: 5
  }
]

products.each do |product_attrs|
  mad_price = product_attrs.delete(:mad_price)
  Spree::Config[:currency] = "USD"

  product = Spree::Product.create!(default_attrs.merge(product_attrs))
  Spree::Config[:currency] = "MAD"
  product.reload
  product.price = mad_price
  product.shipping_category = shipping_category
  product.save!
end

Spree::Config[:currency] = "USD"
