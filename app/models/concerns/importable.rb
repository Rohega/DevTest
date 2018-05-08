module Importable
	extend ActiveSupport::Concern

	def import(file)
	  spreadsheet = Roo::Spreadsheet.open(file.path)
	
	  header = spreadsheet.row(1)
	
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    model = find_by(id: row["id"]) || new
	    model.attributes = row.to_hash
	    model.save!
	  end

	end  

end