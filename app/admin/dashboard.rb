# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Estatísticas da Loja" do
          div class: "statistics" do
            ul do
              li do
                span "Total de Produtos: "
                strong Product.count
              end
              li do
                span "Total de Variantes: "
                strong ProductVariant.count
              end
              li do
                span "Total de Pedidos: "
                strong Order.count
              end
              li do
                span "Receita Total: "
                strong number_to_currency(Order.sum(:total))
              end
            end
          end
        end
      end

      column do
        panel "Pedidos Recentes" do
          table_for Order.order(created_at: :desc).limit(5) do
            column("ID") { |order| link_to("##{order.id}", admin_order_path(order)) }
            column("Status") { |order| status_tag(order.status) }
            column("Cliente") { |order| order.user.email }
            column("Total") { |order| number_to_currency(order.total) }
          end
        end
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
