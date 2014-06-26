require 'spec_helper'

describe "bank_books/index" do
  before(:each) do
    assign(:bank_books, [
      stub_model(BankBook),
      stub_model(BankBook)
    ])
  end

  it "renders a list of bank_books" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
