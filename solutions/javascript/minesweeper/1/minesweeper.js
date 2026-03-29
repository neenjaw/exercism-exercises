// annotate
export const annotate = (board = []) => {
  board = splitBoard(board);
  board = zeroBoard(board);

  const minelist = getMinePositionsFromBoard(board)

  board = numberBoard(board, minelist);
  board = formatBoard(board);
  board = joinBoard(board);
  return board;
};

// splitBoard
const splitBoard = board => {
  return board.map(row => row.split(''));
}

// joinBoard
const joinBoard = board => {
  return board.map(row => row.join(''));
}

// zeroBoard
const zeroBoard = board => {
  return board.map(row => row.map(cell => {
    if (cell === ' ') return 0;

    else return cell;
  }));
}

// formatBoard
const formatBoard = board => {
  return board.map(row => row.map(cell => {
    if (cell === 0) return ' ';

    else return `${cell}`;
  }));
}

// getMinePositionsFromBoard
// Args:
//   board - the game board
const getMinePositionsFromBoard = board => {
  return board.flatMap((row, y) => row.map((cell, x) => {
      if (cell === '*') return [y, x];

      return null;
    }))
    .filter(e => e !== null);
}

// numberBoard
// Args:
//   board - the game board
//   minelist - an array of mine coordinates
const numberBoard = (board, minelist) => {
  return minelist.reduce(numberAdjacentCells, board)
}

// numberAdjacentCells
// Args:
//   board - the game board
//   mine - coordinate (y,x)
const numberAdjacentCells = (board, mine) => {
  const [y, x] = mine;

  const adjacent = getAdjacent(y, x);

  return adjacent.reduce(numberAdjacentCell, board)
}

// getAdjacent
// Args:
//   coordinate (y,x) - the location of the mine
const getAdjacent = (y, x) => {
  const mutations = [
    [-1, -1], [-1,  0], [-1,  1],
    [ 0, -1],           [ 0,  1],
    [ 1, -1], [ 1,  0], [ 1,  1],
  ]

  return mutations.map(([my, mx]) => [my + y, mx + x])
}

// numberAdjacentCell
// Args:
//   board - the game board
//   coordinate (y,x) - the location to number
const numberAdjacentCell = (board, [y, x]) => {
  if (board[y] === undefined || board[y][x] === undefined) return board

  if (typeof board[y][x] === 'number') board[y][x]++;

  return board;
}