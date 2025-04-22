brand = Brand.first || Brand.create!(name: "Acme Lenses")
p     = Product.create!(name: "Lente Esférica", price: 100, brand:)
(-12.0).step(8.0, 0.25) do |sph|
  p.product_variants.create!(sphere: sph, base_curve: 8.6, diameter: 14.2, unit_price: 100)
end