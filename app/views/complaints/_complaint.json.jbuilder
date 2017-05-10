json.extract! complaint, :id, :complaintid, :status, :created_at, :updated_at
json.url complaint_url(complaint, format: :json)
