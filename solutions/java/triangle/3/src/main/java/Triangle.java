import java.util.stream.DoubleStream;

class Triangle {
    private final double[] sides;

    Triangle(double side1, double side2, double side3) throws TriangleException {
        sides = DoubleStream.of(side1, side2, side3)
                            .sorted()
                            .toArray();

        boolean smallestNotZero = sides[0] != 0;

        boolean validTriangle = sides[0] + sides [1] > sides[2];

        if (!(smallestNotZero && validTriangle)) {
            throw new TriangleException("Invalid Triangle Side Lengths");
        }
    }

    boolean isEquilateral() {
        return DoubleStream.of(sides).distinct().count() == 1;
    }

    boolean isIsosceles() {
        return DoubleStream.of(sides).distinct().count() <= 2;
    }

    boolean isScalene() {
        return !(isEquilateral() || isIsosceles());
    }
}
