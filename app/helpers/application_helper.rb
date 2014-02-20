module ApplicationHelper

	def cp(path)
  		if current_page?(path)
  			puts "active"
  		end
	end
end
