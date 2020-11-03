----------------------------------------------------------------------------------
-- Cenk KILIÇ
-- 3 bit up/down counter
-- 0,3,5,7 for k=0 or 7,5,3,0 for k=1 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity updown_counter is
Port ( 

clk: in std_logic;
rst:in std_logic;
q: out std_logic_vector(2 downto 0);
k: in std_logic

);
end updown_counter;

architecture Behavioral of updown_counter is

signal cnt_up: std_logic_vector(2 downto 0):="000";
signal cnt_down: std_logic_vector(2 downto 0):="111";

begin

process(clk,rst,cnt_up,k)
begin
    if(rst='1') then
        q<="000";
    elsif(clk'event and clk='1') then
        if(cnt_up="000" and k='0') then
            q<="011";
        elsif(cnt_down="000" and k='1') then
            q<="111";
        end if;
        if(cnt_up="011" and k='0') then
            q<="101";
        elsif(cnt_down="011" and k='1') then
            q<="000";
        end if;
        if(cnt_up="101" and k='0') then
            q<="111";
        elsif(cnt_down="101" and k='1') then
            q<="011";
        end if;
        if(cnt_up="111" and k='0') then
            q<="000";
        elsif(cnt_down="111" and k='1') then
            q<="101";
        end if;
cnt_up<=cnt_up+1;
cnt_down<=cnt_down-1;
    end if;
end process;
end Behavioral;
