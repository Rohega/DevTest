ActiveAdmin.register User do
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
  permit_params :email, :password, :password_confirmation

  index do
    column :email
    column "Email", sortable: :email do |user|
    	user.email
    end
    actions
  end

 form email: 'A custom email' do |f|
    inputs 'Company data' do
      input :email
      input :password
      input :password_confirmation
    end

    panel 'Markup' do
      "The following can be used in the content below..."
    end
    actions
  end
end
