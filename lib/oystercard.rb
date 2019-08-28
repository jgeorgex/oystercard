class Oystercard
  attr_reader :balance
  attr_reader :in_journey

  BALANCE_LIMIT = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    check_limit(value)
    @balance = value + @balance
  end

  def check_limit(value)
    raise "Balance limit is £#{BALANCE_LIMIT}" if value + @balance > BALANCE_LIMIT
  end

  def deduct(value)
    @balance = @balance - value
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey
  end

  def in_journey?
    @in_journey = true
  end

end
