if @user.present?
  json.success "true"
  json.response do
  	json.(@user, :id, :token, :name, :image, :designation, :team, :company)
  end
else
	json.success "false"
	json.response do
		json.message "Invalid User"
	end
end