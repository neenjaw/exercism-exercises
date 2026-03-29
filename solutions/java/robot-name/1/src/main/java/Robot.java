import java.util.Random;
import java.util.function.Supplier;
import java.util.stream.IntStream;

/**
 * Robot
 */
public class Robot {
  private static Random random = new Random();
  private String name;

  public Robot() {
    this.name = generateName();
  }

  public String getName() {
    return this.name;
  }

  public void reset() {
    this.name = generateName();
  }

  /**
   * Returns a new name following the convention:
   * LLDDD where LL is a random uppercase letter combination and
   * DDD is a random number combination.
   * @return new robot name
   */
  private String generateName() {
    int targetAlphaLength = 2;
    int targetDigitLength = 3;

    StringBuilder buffer = new StringBuilder(targetAlphaLength + targetDigitLength);

    buffer.append(getRandomChars(targetAlphaLength, Robot::getAlphaChar));
    buffer.append(getRandomChars(targetDigitLength, Robot::getDigitChar));

    return buffer.toString();
  }

  private static StringBuilder getRandomChars(int number, Supplier<Character> randomChar) {
    return IntStream.rangeClosed(1, number)
                    .mapToObj(i -> randomChar.get())
                    .collect(
                      StringBuilder::new,
                      StringBuilder::append,
                      StringBuilder::append);
  }

  private static char getAlphaChar() {
    int leftAlphaLimit = (int) 'A';
    int rightAlphaLimit = (int) 'Z';

    return (char) getRandomLimitedInt(leftAlphaLimit, rightAlphaLimit);
  }

  private static char getDigitChar() {
    int leftDigitLimit = (int) '0';
    int rightDigitLimit = (int) '9';

    return (char) getRandomLimitedInt(leftDigitLimit, rightDigitLimit);
  }

  private static int getRandomLimitedInt(int left, int right) {
    return left + (int) (random.nextFloat() * (right - left + 1));
  }
}