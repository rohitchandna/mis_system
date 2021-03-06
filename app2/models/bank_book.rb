class BankBook
require 'carrierwave/datamapper'
  
  
  
  class MisUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick
    def extension_white_list
      %w(pdf jpg jpeg gif png)  	
 end
  end
  
  include DataMapper::Resource
  property :id, Serial
  property :chq_date, Date
  property :chq_no, String
  property :account_head, String
  property :added_date, DateTime 
  property :narration, Text
  property :remark, String
  property :gross_amt, Float
  property :service_tax, Float
  property :amount, Float
  property :chq_amount, Serial
  property :total, Serial        
  mount_uploader :attach_copy,   MisUploader
  property :status,   Enum[:not_approved, :approved, :rejected], :default => :not_approved
  property :action_date, Date
  property :action_time, DateTime
  property :approved_date, DateTime
 property :created_date, DateTime
  property  :created_time, Time
  
belongs_to :created_by, User	
belongs_to :action_by, User, :required => false
  belongs_to :approved_by, User, :required => false
  belongs_to :branch
  belongs_to :added_by, User, :required => true
  belongs_to :update_by, User, :required => false	
  
  
  
end
