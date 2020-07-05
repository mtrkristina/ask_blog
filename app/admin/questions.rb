ActiveAdmin.register Question do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :text, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:text]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  show do
    attributes_table do
      row :text
      row 'image' do |ad|
        image_tag(ad.image) if ad.image.attached?
      end
    end
  end
  form do |f|
    f.inputs do
      f.input :text, as: :text
      f.input :image, as: :file
    end

    f.actions
  end
end
