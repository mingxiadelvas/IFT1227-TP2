library IEEE; 
use IEEE.STD_LOGIC_1164.all;
entity testbenchM is --no inputs or outputs
end;
architecture sim of testbenchM is
	component mealy
	port(clk, reset, input: in STD_LOGIC;
	output: out STD_LOGIC);
	end component;

type state_type is (s0, s1, s2, s3, s4, s5, s6);
signal curr_state, next_state : state_type;
signal clk, reset, input, output: STD_LOGIC;



begin--instantiate device under test
dut: mealy port map(clk, reset, input, output);
dut: mealy type map(s0, s1, s2, s3, s4, s5, s6);
--apply inputs one at a time
process begin
curr_state <= s0;
input <= '1';clk <= '0'; reset<= '0'; wait for 10 ns;
assert output = '0' and next_state = s2 report "s0 failed.";

curr_state <= s0;
input <= '0'; wait for 10 ns;
assert output = '0' and next_state = s1 report "s0-2 failed.";

curr_state <= s1;
input <= '1'; wait for 10 ns;
assert output = '0' and next_state = s4 report "s1 failed.";

curr_state <= s1;
input <= '0'; wait for 10 ns;
assert output = '0' and next_state = s3 report "s1-2 failed.";

curr_state <= s2;
input <= '1'; wait for 10 ns;
assert output = '0' and next_state = s6 report "s2 failed.";

curr_state <= s2;
input <= '0'; wait for 10 ns;
assert output = '0' and next_state = s5 report "s2-2 failed.";

curr_state <= s3;
input <= '1'; wait for 10 ns;
assert output = '0' and next_state = s4 report "s3 failed.";

curr_state <= s3;
input <= '0'; wait for 10 ns;
assert output = '0' and next_state = s3 report "s3-2 failed.";

curr_state <= s4;wait for 10 ns;
input <= '1'; wait for 10 ns;
assert output = '1' and next_state = s6 report "s4 failed.";--

curr_state <= s4;
input <= '0'; wait for 10 ns;
assert output = '0' and next_state = s5 report "s4-2 failed.";

curr_state <= s5;
input <= '0'; wait for 10 ns; 
assert output = '0' and next_state = s3 report "s5 failed.";

curr_state <= s5;
input <= '1'; wait for 10 ns; 
assert output = '0' and next_state = s4 report "s5-2 failed.";

curr_state <= s6;wait for 10 ns;
input <= '0'; wait for 10 ns;
assert output = '1' and next_state = s5 report "s6 failed.";-- 

curr_state <= s6;
input <= '1'; wait for 10 ns;
assert output = '0' and next_state = s6 report "s6-2 failed.";

wait; --wait forever 
end process; 
end;