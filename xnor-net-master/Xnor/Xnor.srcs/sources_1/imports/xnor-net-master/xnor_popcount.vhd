library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity xnor_popcount is
           -- filter size 4x4
               Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
                      B : in  STD_LOGIC_VECTOR (31 downto 0);
                      pop_count : out  STD_LOGIC_VECTOR (7 downto 0);
                      xnor_op : buffer  STD_LOGIC_VECTOR (31 downto 0));
end xnor_popcount;

architecture xnor_pop of xnor_popcount is
begin
    xnor_op <= A xnor B;
    process(xnor_op)
    variable bit_count : unsigned(7 downto 0) := "00000000";
    begin
        bit_count := "00000000";  
        for i in 0 to 31 loop  
         if(xnor_op(i) = '1') then 
          bit_count := bit_count + 1; 
         end if;
        end loop;
        pop_count <= std_logic_vector(bit_count);
    end process;

end xnor_pop;
