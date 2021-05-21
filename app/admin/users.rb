ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :email, :name, :telephone_number, :profile_image_id, :profile, :is_valid,:remember_created_at

   #ユーザー一覧ページ
   index do
     selectable_column
     id_column
     column :name
     column :'投稿数' do |user|
       user.articles.count
     end
     column :is_valid
     column :created_at
     column :updated_at
     actions
   end

   #ユーザー詳細ページ
   show do |user|
     attributes_table(*user.class.columns.collect { |column| column.name.to_sym})
     panel '投稿一覧' do
       table_for user.articles do
         column :user
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
     end
   end

   # ユーザー作成
   form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :encrypted_password
      f.input :telephone_number
      f.input :profile
      f.input :is_valid
    end
    actions
  end
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :telephone_number, :profile_image_id, :profile, :is_valid]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
