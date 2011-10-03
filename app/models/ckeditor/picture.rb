class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
                    :path => ":class/:id/:basename.:extension",
	                  :styles => {}
	                  
	validates_attachment_size :data, :less_than => 5.megabytes
	validates_attachment_presence :data
	
	def url_content
	  url(:content)
	end
end
