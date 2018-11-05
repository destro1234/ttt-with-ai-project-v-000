module Players
  class Computer < Player
    attr_accessor :board

  def move(board)
    move = nil
    if !board.taken?("5")
      move = "5"
    elsif board.taken?("5")
      move = corners(board)

    else
      winning_move(board)+1 || corners(board)
    end
  end

  def corners(board)
    move = ["1", "3", "7", "9"].detect {|cell| !board.taken?(cell)}
  end

  def random_move(board)
    move = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].detect {|cell| !board.taken?(cell)}
  end

  def winnig_move(board)
    win_move = Game::WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == token && board.cells[combo[1]] == token && board.valid_move?(combo[2]+1) ||
      board.cells[combo[1]] == token && board.cells[combo[2]] == token && board.valid_move?(combo[0]+1) ||
      board.cells[combo[2]] == token && board.cells[combo[0]] == token && board.valid_move?(combo[1]+1)
    end

    if win_move
      move = combo.detect {|cell| board.valid_move?(cell+1)}
    end

  end



  end
end
