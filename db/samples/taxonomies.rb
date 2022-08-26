# frozen_string_literal: true

taxonomies = [
  { name: "Categories" }
]

taxonomies.each do |taxonomy_attrs|
  Spree::Taxonomy.create!(taxonomy_attrs)
end
