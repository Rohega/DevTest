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
  permit_params :name, :rfc

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
end
