# frozen_string_literal: true

unless Spree::Store.where(code: 'terroir-shop').exists?
  Spree::Store.create!(
    name: "TerroirShop",
    code: "terroir-shop",
    url: "terroir-shop.local",
    default: true,
    mail_from_address: "shop@terroir-shop.local",
    bcc_email: "contact@shop@terroir-shop.local",
    default_currency: "MAD",
    cart_tax_country_iso: "MA",
    available_locales: ["fr", "en"],
    meta_description: "La plateforme e-vitrine Terroir du Maroc, « TerroirShop » est une vitrine digitale 100% marocaine permettant l’accès à des produits du terroir marocain, en misant sur la qualité",
    seo_title: "Terroir du Maroc"
  )
end
