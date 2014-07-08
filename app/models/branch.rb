class Branch

  include DataMapper::Resource

  property :id, Serial
  property :branch_name,    String, :required => true
  property :branch_email,    String

has n, :bank_books
end
