require 'spec_helper'

describe "bank_books/new" do
  before(:each) do
    assign(:bank_book, stub_model(BankBook).as_new_record)
  end

  it "renders new bank_book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bank_books_path, "post" do
    end
  end
end
