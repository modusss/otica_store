# db/seeds.rb -----------------------------------------------------------
puts "\n=== Resetando base (dev)…"
models = [
  LineItem, Cart, Payment, Shipment,
  OrderItem, Order, ProductVariant,
  Product, Brand, Category,
  Address, User
]
models.each(&:delete_all)

# ----------------------------------------------------------------------
puts "\n1) Usuário de teste"
user = User.create!(
  email:                 "user@example.com",
  password:              "password",          # ➜ login / senha
  password_confirmation: "password",
  role:                  :customer
)

# ----------------------------------------------------------------------
puts "2) Marca"
brand = Brand.create!(name: "Acme Lenses")

# ----------------------------------------------------------------------
puts "3) Categorias"
cat_soft     = Category.create!(name: "Gelatinosas", slug: "gelatinosas")
cat_esferica = Category.create!(name: "Esféricas",   slug: "esfericas",   parent: cat_soft)
cat_torica   = Category.create!(name: "Tóricas",     slug: "toricas",     parent: cat_soft)

# ----------------------------------------------------------------------
def create_product(name:, price:, lens_type:, desc:, brand:, categories:)
  Product.create!(
    name:              name,
    description:       desc,
    price:             price,
    brand:             brand,
    lens_type:         lens_type,
    wear_schedule:     :monthly,
    pack_quantity:     6,
    material:          "Hefilcon A",
    water_content:     55.0,
    oxygen_permeability: 30.0,
    categories:        categories
  )
end

puts "4) Produtos"
p_sph  = create_product(
  name:  "Acme Vision Esférica",
  price: 99.90,
  lens_type: :spherical,
  desc:  "Lente mensal para miopia/hipermetropia.",
  brand: brand,
  categories: [cat_soft, cat_esferica]
)

p_toric = create_product(
  name:  "Acme Vision Tórica",
  price: 129.90,
  lens_type: :toric,
  desc:  "Lente mensal para astigmatismo (cyl ‑1.25).",
  brand: brand,
  categories: [cat_soft, cat_torica]
)

# ----------------------------------------------------------------------
puts "5) Variantes (esféricas −12 D → +8 D passo 0,25)"
base_curve = 8.6
diameter   = 14.2
stock_qty  = 50

(-12.0).step(8.0, 0.25).each do |sph|
  p_sph.product_variants.create!(
    sphere:     sph.round(2),
    base_curve: base_curve,
    diameter:   diameter,
    stock:      stock_qty,
    unit_price: p_sph.price,
    sku:        format("ACM-SPH-%+.2f", sph)
  )
end

puts "   → #{p_sph.product_variants.size} variantes criadas"

puts "6) Variantes (tóricas  esferas −8 D → +4 D  cyl ‑1.25  axes 0‑180)"
cylinder = -1.25
axes     = (0..170).step(10)
count_toric = 0

(-8.0).step(4.0, 0.50) do |sph|
  axes.each do |axis|
    p_toric.product_variants.create!(
      sphere:     sph.round(2),
      cylinder:   cylinder,
      axis:       axis,
      base_curve: base_curve,
      diameter:   diameter,
      stock:      30,
      unit_price: p_toric.price,
      sku:        format("ACM-TOR-%+.2f-%.2f-%03d", sph, cylinder, axis)
    )
    count_toric += 1
  end
end

puts "   → #{count_toric} variantes criadas"

puts "\n=== Seed completo! ==="
puts "Login:  user@example.com"
puts "Senha:  password"AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?