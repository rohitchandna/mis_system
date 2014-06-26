require 'spec_helper'

describe "bank_books/edit" do
  before(:each) do
    @bank_book = assign(:bank_book, stub_model(BankBook))
  end

  it "renders the edit bank_book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bank_book_path(@bank_book), "post" do
    end
  end
end
