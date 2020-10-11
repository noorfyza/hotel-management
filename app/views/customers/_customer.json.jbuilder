json.extract! customer, :id, :first_name, :last_name, :age, :sex, :address, :mobile, :email, :birthdate, :created_at, :updated_at
json.url customer_url(customer, format: :json)
