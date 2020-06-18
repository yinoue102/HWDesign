library IEEE;
use IEEE.std_logic_1164.all;

entity SwitchAndLed is
  port (
    switch  : in std_logic;
    led : out std_logic
  );
end entity SwitchAndLed;

architecture RTL of SwitchAndLed is
  
begin
  
  led <= sw;
  
end architecture RTL;