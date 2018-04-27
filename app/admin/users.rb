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
  permit_params :email, :password, :password_confirmation, :company_id

  index do
    column :email
    
    column "Email", sortable: :email do |user|
    	user.email
    end

    column "Company", sortable: :company_id do |user|
      user.company.name
    end

    actions
  end


 form email: 'A custom email' do |f|
    inputs 'Company data' do
      input :email
      input :password
      input :password_confirmation
      input :company_id, :label => 'Company', :as => :select, :collection => Company.all.map{|c| ["#{c.name}, #{c.rfc}", c.id] }
    end


    panel 'Markup' do
      "The following can be used in the content below..."
    end
    actions
  end

  controller do
    def update_resource object, attributes
      attributes.each do |attr|
        if attr[:password].blank? and attr[:password_confirmation].blank?
          attr.delete :password
          attr.delete :password_confirmation
        end
      end

      object.send :update_attributes, *attributes
    end
end
end
