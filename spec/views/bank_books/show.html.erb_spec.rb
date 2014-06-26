require 'spec_helper'

describe "bank_books/show" do
  before(:each) do
    @bank_book = assign(:bank_book, stub_model(BankBook))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
