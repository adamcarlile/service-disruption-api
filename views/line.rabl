object @line => :line
attributes :name
  child :status => :status do
    attributes :status_details, :status_description
  end
