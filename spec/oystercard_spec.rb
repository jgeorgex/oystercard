require 'oystercard'

describe Oystercard do

  it "new oystercard has default balance of 0" do
    expect(subject.balance).to eq (0)
  end

  it "expect new oystercard to have £10 on, when topped up with 10" do
    expect(subject.top_up(10)).to eq (10)
  end

  it "expect oystercard with £20 to have £30 on, when topped up with 10" do
    subject.top_up(20)
    expect(subject.top_up(10)).to eq (30)
  end

  it "expect an error if balance is more than £90" do
    expect{subject.top_up(91)}.to raise_error "Balance limit is £90"
  end

  it "expect oystercard with £20 to error if £80 added" do
    subject.top_up(20)
    expect{subject.top_up(80)}.to raise_error "Balance limit is £90"
  end

  it "card with £50 should reduce to £40 when £10 is spent" do
    subject.top_up(50)
    expect(subject.deduct(10)).to eq(40)
  end
end




=begin
create Oystercard
create default balance
irb create card then check balance

=end
