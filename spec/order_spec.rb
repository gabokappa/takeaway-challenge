require 'menu'
require 'order'
describe Order do
  describe "#select_dish" do
    # it 'lets you pick a dish' do
    #   expect(subject.select_dish("margherita")).to eq (:margherita)
    # end
    context "The dish is available on the menu" do
      it "adds the selected dish and quantity to ordered_dishes" do
        subject.select_dish("margherita", 1)
        expect(subject.ordered_dishes).to eq(["1 x margherita"])
      end
    end

    it "raises an error if dish not on the menu" do
      expect { subject.select_dish("gumbo", 1) }.to raise_error "Dish not available"
    end

    it "stores quantity and price" do
      subject.select_dish("margherita", 1)
      subject.select_dish("marinara", 2)
      expect(subject.price_total).to eq([[1, 7.00], [2, 6.00]])
    end
  end

  describe "#total_price" do
    it "calculates the total price of the order" do
      subject.select_dish("margherita", 1)
      subject.select_dish("marinara", 2)
      subject.select_dish("meatfeast", 1)
      expect(subject.total_price).to eq(29.5)
    end
  end

end