class Ticket
  ROWS = 3
  COLUMNS = 9

  def print_ticket
    puts '----------------------------------------------------------------------------'
    create_ticket.each { |row| p row.join('    |   ') }
    puts '----------------------------------------------------------------------------'
  end

  private

  def create_ticket
    # A Grid which has housie boxes in 2-dimensional form.
    grid = Array.new(ROWS) { Array.new(COLUMNS) }
    row = []
    all_rows = generate_slots(row)

    1.upto(9) do |i|
      column_count = all_rows.count(i)
      numbers = lookup_range(i)[0..column_count].sort
      0.upto(2) do |j|
        grid[j][i - 1] = 'X' and next unless row[j].include?(i)

        grid[j][i - 1] = numbers.shift
      end
    end

    grid
  end

  def lookup_range(col)
    lower_range = col == 1 ? 1 : (col - 1) * 10
    upper_range = (col * 10) - 1
    (lower_range..upper_range).to_a.sort { rand - 0.5 }
  end

  def generate_slots(row)
    # To generate 5 random slots for each row.
    row << (1..9).to_a.sort { rand - 0.5 }[0..4].sort
    row << (1..9).to_a.sort { rand - 0.5 }[0..4].sort
    row << (1..9).to_a.sort { rand - 0.5 }[0..4].sort
    row = row.flatten.sort
  end
end

Ticket.new.print_ticket
