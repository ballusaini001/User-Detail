json.extract! detail, :id, :First_name, :Last_name, :Caste, :Age, :Height_in_CMs, :Weight_in_KGs, :Phone_no, :Email, :created_at, :updated_at
json.url detail_url(detail, format: :json)
