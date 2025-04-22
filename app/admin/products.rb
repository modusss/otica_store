# app/admin/products.rb
ActiveAdmin.register Product do
    permit_params :name, :price, :brand_id, :lens_type, :wear_schedule,
                  product_variants_attributes: %i[id sphere cylinder axis
                                                base_curve diameter stock
                                                unit_price sku _destroy]
  
    form do |f|
      f.inputs "Dados básicos" do
        f.input :name
        f.input :price
        f.input :lens_type
        f.input :wear_schedule
        f.input :brand
      end
  
      f.inputs "Variantes" do
        f.has_many :product_variants, allow_destroy: true, new_record: true do |pv|
          pv.input :sphere
          pv.input :cylinder
          pv.input :axis
          pv.input :stock
          pv.input :unit_price
          pv.input :sku
        end
      end
      f.actions
    end
  end