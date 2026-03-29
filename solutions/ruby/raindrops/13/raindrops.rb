class Raindrops
  FACTOR_NOTE = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }

  def self.convert(number)
    new(number).to_s
  end

  private

  def initialize(number, rules = FACTOR_NOTE)
    @notes ||= rules.each_with_object('') do |(factor, note), sound|
      sound << note if factor?(number, factor)
    end
    @sound = @notes.empty? ? number : @notes
  end

  def factor?(number, divisor)
    (number % divisor).zero?
  end

  public

  attr_reader :sound

  def to_s
    sound.to_s
  end
end

if defined? Minitest

  describe 'The Stretch Specifications' do
    describe 'must be able to use newly supplied rules' do
      fruits_rule = { 3 => 'Apples', 10 => 'Bananas' }
      it 'must be apples for odds' do
        expected = 'Apples'
        value(Raindrops.new(3, fruits_rule).to_s).must_equal expected
        value(Raindrops.new(15, fruits_rule).to_s).must_equal expected
        value(Raindrops.new(9, fruits_rule).to_s).must_equal expected
      end
      it 'must be bananas for evens' do
        expected = 'Bananas'
        value(Raindrops.new(20, fruits_rule).to_s).must_equal expected
        value(Raindrops.new(1000, fruits_rule).to_s).must_equal expected
      end
      it 'must be a number when the rules do not apply' do
        expected = 11
        value(Raindrops.new(11, fruits_rule).sound).must_equal expected
      end
      it 'must give the words in order when it is 0' do
        expected = 'ApplesBananas'
        value(Raindrops.new(0, fruits_rule).sound).must_equal expected

      end
    end
  end
end
