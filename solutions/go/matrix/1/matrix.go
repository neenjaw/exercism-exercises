package matrix

import (
	"errors"
	"strconv"
	"strings"
)

type Matrix [][]int

func New(input string) (*Matrix, error) {
	var err error
	lines := strings.Split(input, "\n")
	matrix := make(Matrix, len(lines))

	for i, line := range lines {
		numbers := strings.Fields(line)
		if i > 0 && len(numbers) != len(matrix[0]) {
			return nil, errors.New("rows have unequal length")
		}
		row := make([]int, len(numbers))
		for j, number := range numbers {
			if row[j], err = strconv.Atoi(number); err != nil {
				return nil, errors.New("invalid int in element data")
			}
		}
		matrix[i] = row
	}

	return &matrix, nil
}

func (m *Matrix) Rows() [][]int {
	rows := make([][]int, len(*m))
	for i, mRow := range *m {
		rows[i] = append([]int{}, mRow...)
	}
	return rows
}

func (m *Matrix) Cols() [][]int {
	if len(*m) == 0 {
		return nil
	}
	cols := make([][]int, len((*m)[0]))
	for i := range cols {
		col := make([]int, len(*m))
		for j := range col {
			col[j] = (*m)[j][i]
		}
		cols[i] = col
	}
	return cols
}

func (m *Matrix) Set(row, col, value int) bool {
	if row < 0 || row >= len(*m) || col < 0 || col >= len((*m)[0]) {
		return false
	}
	(*m)[row][col] = value
	return true
}
