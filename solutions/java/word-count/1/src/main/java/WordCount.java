import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * WordCount
 */
public class WordCount {
  /**
   * phrase
   * this method takes a string phrase and separates it into words
   * delineated by whitespace and punctuation.
   * @param str
   * @return a mapping of the string to how many times they occur in
   *         the phrase.
   */
  public Map<String, Integer> phrase(String str) {
    var counts = new HashMap<String, Integer>();
    var words = str.toLowerCase().split("[^\\p{Alnum}'\\-]");

    // Stream the array, filter out empty strings, then for each
    // word, remove surrounding single quotes, add it to the map
    Arrays.stream(words)
          .filter(word -> !word.isEmpty())
          .forEach(word -> {
            if (word.startsWith("'") && word.endsWith("'")) {
              word = word.substring(1, word.length()-1);
            }

            counts.computeIfPresent(word, (k, v) -> v + 1);
            counts.putIfAbsent(word, 1);
          });

    return counts;
  }
}