import java.util.stream.Stream;

class Matrix {
    private final String ROW_DELIMITER = "\n";
    private final String COL_DELIMITER = " ";

    private int[][] matrix;

    /**
     * Creates a multidimentional int[][] array from a supplied
     * String.  Matrix rows are delimited by "\n" and columns
     * delimited by " ".
     * @param matrixAsString
     */
    Matrix(String matrixAsString) {
        // break string into rows
        String[] rowsAsString = matrixAsString.split(ROW_DELIMITER);

        // create temporary matrix, initialize the rows
        int[][] m = new int[rowsAsString.length][];

        // iterate through the rows, keeping track of the index
        int row_index = 0;
        for (String rowAsString : rowsAsString) {
            // break the row string into cells
            String[] cellsAsStrings = rowAsString.split(COL_DELIMITER);

            // initialize the columns for the row
            m[row_index] = new int[cellsAsStrings.length];

            // iterate through the cells, building the columns
            int col_index = 0;
            for (String cellAsString : cellsAsStrings) {
                m[row_index][col_index] = Integer.parseInt(cellAsString);

                col_index++;
            }

            row_index++;
        }

        this.matrix = m;
    }

    /**
     * Returns the int[] at the specified row number
     * @param rowNumber
     * @return int[] of column values
     */
    int[] getRow(int rowNumber) {
        if (rowNumber < 1) {
            throw new IllegalArgumentException("Row number must be 1 or greater.");
        }

        return this.matrix[rowNumber-1];
    }

    /**
     * Returns an int[] associated with the specified column,
     * uses functional stream to map each row to the single
     * column element, then returns the resulting array.
     * @param columnNumber
     * @return int[] of column values
     */
    int[] getColumn(int columnNumber) {
        if (columnNumber < 1) {
            throw new IllegalArgumentException("Column number must be 1 or greater.");
        }

        return Stream.of(this.matrix)
                     .mapToInt(row -> row[columnNumber-1])
                     .toArray();
    }
}
