require 'menu'
require 'order'
describe Menu do
  subject(:menu) { described_class.new }
  it "contains menu options" do
    expect(subject.dishes).to include(:margherita, :marinara, :meatfeast, :vegetarian)
  end
  describe "#display_menu" do
    it "puts out the menu" do
      expect { subject.display_menu }.to output.to_stdout
    end
  end

  describe "#view_total" do
    it "prints the total of the order" do
      order = Order.new
      order.select_dish("marinara", 2)
      expect { subject.view_total(order) }. to output(/Your total is £12.0/).to_stdout
    end
  end
end
