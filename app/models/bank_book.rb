class BankBook
require 'carrierwave/datamapper'


 
class MisUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  	

end

  include DataMapper::Resource
property :id, Serial
	property :chq_date, Date
	property :chq_no, String
	property :account_head, String
	property :narration, Text
	property :remark, String
	property :gross_amt, Float
	property :service_tax, Float
	property :amount, Float
	property :chq_amount, Serial

mount_uploader :attach_copy,   MisUploader

belongs_to :branch
belongs_to :added_by, User, :required => true
  belongs_to :update_by, User, :required => false	



end
