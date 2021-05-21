ActiveAdmin.register Article do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :user_id, :image_id, :introduction, :postal_code, :prefecture_code,
                :city, :street,:other_address, :telephone_number, :url
  # 投稿作成
  form do |f|
    f.inputs do
      f.input :user
      f.input :title
      f.input :image
      f.input :postal_code
      f.input :prefecture_code
      f.input :city
      f.input :street
      f.input :other_address
      f.input :telephone_number
      f.input :url
    end
    f.actions
  end

  # 投稿一覧
  index do
    selectable_column
    id_column
    column :title
    column :image
    column :postal_code
    column :prefecture_code
    column :city
    column :street
    column :other_address
    column :telephone_number
    column :url
  end
  # or
  #
  # permit_params do
  #   permitted = [:title, :image_id, :introduction, :postal_code, :prefecture_code, :city, :street, :other_address, :latitude, :longitude, :telephone_number, :url, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
