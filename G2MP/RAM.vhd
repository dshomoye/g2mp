library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity RAM is
		Port (
		I_RAM_EN : in std_logic;
		I_RAM_RE : in std_logic;
		I_RAM_WE : in std_logic;
		I_RAM_ADDR : in std_logic_vector (31 downto 0);
		I_RAM_DATA : in std_logic_vector (31 downto 0);
		O_RAM_DATA : out std_logic_vector (31 downto 0)
		);
end RAM;

architecture Behavioral of RAM is
		type ram_type is array (natural range <>) of std_logic_vector(31 downto 0);
	    signal ramReg:     ram_type(0 to 1023) := (others=> (others => '0'));
		signal addr: integer := 0;
begin
		
		process(I_RAM_EN,I_RAM_RE,I_RAM_WE,I_RAM_ADDR) begin
			addr <= to_integer (unsigned(I_RAM_ADDR)); --when (to_integer(unsigned(I_RAM_ADDR)) <= 1023) else 0;
			if(I_RAM_EN = '1') then 
				if(I_RAM_WE = '1') then
					ramReg(addr) <= I_RAM_DATA;
				elsif(I_RAM_RE = '1') then 
					O_RAM_DATA <= ramReg(addr);
				end if;
			end if;
		end process;
end Behavioral;

