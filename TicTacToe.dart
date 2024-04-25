import 'dart:io';

class TicTacToe {
  List<String> board = List.filled(9, ' ');

  void printBoard() {
    print(' ${board[0]} | ${board[1]} | ${board[2]} ');
    print('---|---|---');
    print(' ${board[3]} | ${board[4]} | ${board[5]} ');
    print('---|---|---');
    print(' ${board[6]} | ${board[7]} | ${board[8]} ');
  }

  bool checkWinner(String player) {
    // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (board[i] == player &&
          board[i + 1] == player &&
          board[i + 2] == player) {
        return true;
      }
    }
    // Check columns
    for (int i = 0; i < 3; i++) {
      if (board[i] == player &&
          board[i + 3] == player &&
          board[i + 6] == player) {
        return true;
      }
    }
    // Check diagonals
    if ((board[0] == player && board[4] == player && board[8] == player) ||
        (board[2] == player && board[4] == player && board[6] == player)) {
      return true;
    }
    return false;
  }

  bool isBoardFull() {
    return !board.contains(' ');
  }

  void play() {
    String currentPlayer = 'X';
    while (true) {
      printBoard();
      stdout.write('Player $currentPlayer, enter your move (1-9): ');
      String input = stdin.readLineSync()!;
      int move = int.tryParse(input) ?? -1;
      if (move < 1 || move > 9 || board[move - 1] != ' ') {
        print('Invalid move. Try again.');
        continue;
      }
      board[move - 1] = currentPlayer;
      if (checkWinner(currentPlayer)) {
        printBoard();
        print('Player $currentPlayer wins!');
        break;
      } else if (isBoardFull()) {
        printBoard();
        print('It\'s a tie!');
        break;
      }
      currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
    }
  }
}

void main() {
  print('Welcome to Tic Tac Toe!');
  TicTacToe game = TicTacToe();
  game.play();
}
