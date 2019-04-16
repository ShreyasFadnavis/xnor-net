library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.textio.ALL;
use ieee.std_logic_textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity test_xnor_popcount is
end test_xnor_popcount;

architecture tb of test_xnor_popcount is
--
component xnor_popcount is
           -- filter size 4x4
               Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
                      B : in  STD_LOGIC_VECTOR (31 downto 0);
                      xnor_op : buffer  STD_LOGIC_VECTOR (31 downto 0);
                      pop_count : out  STD_LOGIC_VECTOR (7 downto 0));
end component;


signal A : std_logic_vector(31 downto 0);
signal B : std_logic_vector(31 downto 0);
signal xnor_op : std_logic_vector(31 downto 0);
signal pop_count : std_logic_vector(7 downto 0);

begin
   uut: xnor_popcount PORT MAP (
          A => A, 
          B => B,
          xnor_op => xnor_op,
          pop_count => pop_count
        );
 
    --read filter file
   PROCESS
   FILE file_pointer : text;
   --VARIABLE line_content : std_logic_vector(1 TO 32);
   VARIABLE line_content : STRING(1 TO 32);
   VARIABLE line_num : line;
   VARIABLE i : INTEGER := 0;
   VARIABLE char : CHARACTER := '0';
   BEGIN
        --open file for read only
       file_open(file_pointer, "C:\Users\kcnil\Documents\xnor-net-master\Test.txt", READ_MODE);
       WHILE NOT endfile(file_pointer) LOOP --read file until end of file
           readline(file_pointer, line_num); --read the whole line
           read(line_num, line_content); --read the contents of the line
           --A <= line_content;
           for i in 1 to 32 loop        
            char := line_content(i);
            if(char = '0') then
                A(32-i) <= '0';
            else
                A(32-i) <= '1';
            end if;
           END LOOP;
           wait for 10 ns;
       END LOOP;
       file_close(file_pointer);
       wait;
   END PROCESS;
   stim_proc: process
   begin        
        -- testing for the number 10: hex representation 0000000A (32bit)
       -- A <= X"0000000A";   wait for 100 ns;
        B <= X"0000000A";   wait for 100 ns;
   end process;
end tb;
