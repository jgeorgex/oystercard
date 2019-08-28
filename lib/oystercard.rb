class Oystercard
  attr_reader :balance
  attr_reader :in_journey
  attr_reader :MIN_FARE

  BALANCE_LIMIT = 90
  MIN_FARE = 1

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

  def touch_in
    check_minimum_fare
    @in_journey = true
  end

  def touch_out
    charge_min_fare
    @in_journey
  end

  def in_journey?
    @in_journey = true
  end

  def check_minimum_fare
    fail "Insufficent Funds" if @balance < MIN_FARE
    true
  end

  def charge_min_fare
      @balance -= MIN_FARE
  end

  private
  def deduct(value)
    @balance -= value
  end
end
