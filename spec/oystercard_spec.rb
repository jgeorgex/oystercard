require 'oystercard'

describe Oystercard do

  it "new oystercard has default balance of 0" do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq (0)
  end
end



=begin
create Oystercard
create default balance
irb create card then check balance

=end
