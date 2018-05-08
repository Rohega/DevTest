ActiveAdmin.register Company do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :name, :rfc, :subdomain, :address

  index do
    column :name
    column "Rfc", sortable: :rfc do |company|
    	company.rfc
    end
    actions
  end

 form name: 'A custom name' do |f|
    inputs 'Company data' do
      input :name
      input :rfc
      input :address
    end

    panel 'Markup' do
      "The following can be used in the content below..."
    end
    actions
  end

  action_item :view, only: :index do
    link_to 'Importar empresas', import_form_path
  end


  controller do
    def import_xls
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end
  end
end
