board = Dino::Board.new(Dino::TxRx.new)
@@button = Dino::Components::Button.new(pin: 8, board: board)
x = true
z = true
while z
    @@button.up do      
      @@button1 = "The button is down"
      puts @button1
      puts z = false
    end
   @@button.down do
      @@button1= "up"
      puts @button1
      z = false
    end
end

# .down = button not pressed
# .up = button pressed