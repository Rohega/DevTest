class Company < ApplicationRecord
	extend Importable

	has_many :users
	permalink :name, to: "subdomain"
end
