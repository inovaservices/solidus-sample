# frozen_string_literal: true

Spree::Sample.load_sample("taxonomies")
Spree::Sample.load_sample("products")

categories = Spree::Taxonomy.find_by!(name: "Categories")

products = {
  miel_de_thym: "Miel de thym - 250G",
  miel_oranger: "Miel de fleur d'oranger - 500G",
  huile_argane: "Huile d'argane alimentaire biologique - 100ml",
  safran: "Safran de taliouine 5g",
  melange_epices: "Mélange d’épices pour poisson - 100G",
  olives_meslala: "Olives Meslala Avec harissa - 500G",
  dattes_majhoul: "Dattes Majhoul - Boite 2kg Type B",
  huile_sesames: "Huile de sesames 50ml",
}

products.each do |key, name|
  products[key] = Spree::Product.find_by!(name: name)
end

taxons = [
  {
    name: "Categories",
    taxonomy: categories,
    position: 0
  },
  {
    name: "Miels, Amlou et confitures",
    taxonomy: categories,
    parent: "Categories"
  },
  {
    name: "Miels, Amlou et confitures",
    taxonomy: categories,
    parent: "Categories",
    position: 1,
    products: [
      products[:miel_de_thym],
      products[:miel_oranger]
    ]
  },
  {
    name: "Huiles alimentaires",
    taxonomy: categories,
    parent: "Categories",
    position: 2,
    products: [
      products[:huile_argane],
      products[:olives_meslala]
    ]
  },
  {
    name: "Épices & Condiments",
    taxonomy: categories,
    parent: "Categories",
    position: 3,
    products: [
      products[:safran],
      products[:melange_epices]
    ]
  },
  {
    name: "Bien être",
    taxonomy: categories,
    parent: "Categories",
    position: 4,
    products: [
      products[:huile_sesames]
    ]
  },
  {
    name: "Fruits secs",
    taxonomy: categories,
    parent: "Categories",
    position: 5,
    products: [
      products[:dattes_majhoul]
    ]
  }
]

taxons.each do |taxon_attrs|
  if taxon_attrs[:parent]
    taxon_attrs[:parent] = Spree::Taxon.find_by!(name: taxon_attrs[:parent])
    Spree::Taxon.create!(taxon_attrs)
  end
end
