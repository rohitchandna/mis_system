class BankBook

 
  
  
  require 'carrierwave/datamapper'
  
  
  
  class MisUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick
    
    def store_dir
      'uploads'
    end
    def filename
      a = Time.now.strftime("%Y%m%d")
      "#{secure_token(10)}.#{a}.#{file.extension}" if original_filename.present?
    end

    protected
    def secure_token(length=16)
      var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
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
  property :chq_amount, Float
  property :total, Float        
  mount_uploader :attach_copy,   MisUploader
  property :status,   Enum[:not_approved, :approved, :rejected], :default => :not_approved
  property :action_date, Date
  property :action_time, DateTime
  property :approved_date, DateTime
  property :created_date, Date
  property  :created_time, Time
  
 # belongs_to :created_by, User	
  belongs_to :action_by, User, :required => false
  belongs_to :approved_by, User, :required => false
  belongs_to :branch
  belongs_to :added_by, User, :required => true
  belongs_to :update_by, User, :required => false	
 
  
end
