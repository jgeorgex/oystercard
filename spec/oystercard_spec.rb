require 'oystercard'

describe Oystercard do

  it "new oystercard has default balance of 0" do
    expect(subject.balance).to eq (0)
  end

  it "expect new oystercard to have £10 on, when topped up with 10" do
    expect(subject.top_up(10)).to eq (10)
  end
end



=begin
create Oystercard
create default balance
irb create card then check balance

=end
