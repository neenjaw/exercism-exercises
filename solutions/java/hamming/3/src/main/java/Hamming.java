import java.util.stream.*;

class Hamming {
    final private int hammingDistance;

    Hamming(String leftStrand, String rightStrand) {
        if (leftStrand.length() != rightStrand.length()) {
            if (leftStrand.length() == 0)
                throw new IllegalArgumentException("left strand must not be empty.");

            if (rightStrand.length() == 0)
                throw new IllegalArgumentException("right strand must not be empty.");

            throw new IllegalArgumentException("leftStrand and rightStrand must be of equal length.");
        }

        int hammingCount = (int) IntStream.range(0, leftStrand.length())
                                          .filter(i -> (leftStrand.charAt(i) != rightStrand.charAt(i)))
                                          .count();

        this.hammingDistance = hammingCount;
    }

    int getHammingDistance() {
        return this.hammingDistance;
    }
}
