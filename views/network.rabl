object @network => :network
attributes :updated_at
  child :lines => :lines do
    attributes :name
    child :status => :status do
      attributes :status_details, :status_description
    end
  end
