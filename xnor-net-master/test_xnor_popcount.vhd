library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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
 
   stim_proc: process
   begin        
        -- testing for the number 10: hex representation 0000000A (32bit)
        A <= X"0000000A";   wait for 100 ns;
        B <= X"0000000A";   wait for 100 ns;
   end process;
end tb;
