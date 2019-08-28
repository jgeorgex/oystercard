require 'oystercard'

describe Oystercard do

let(:topup_value) {10}

  it "new oystercard has default balance of 0" do
    expect(subject.balance).to eq (0)
  end

  it "expect new oystercard to have £10 on, when topped up with 10" do
    expect(subject.top_up(topup_value)).to eq (topup_value)
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

  it "when card touch_in card status is in_journey" do
    subject.top_up(5)
    expect(subject.touch_in).to eq (true)
  end

  it "when card touch_out card status is false" do
    expect(subject.touch_out).to be (false)
  end

  it "In journey is true if Oystercard has been touched in" do
    expect(subject.in_journey?).to eq (true)
  end

  it "reduces balance by minimum fair when touching out" do
    expect{subject.touch_out}.to change{subject.balance}.by -Oystercard::MIN_FARE
  end
end

=begin
"hello"
=end
