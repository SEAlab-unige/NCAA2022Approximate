---------------------------------------------------------------------------------------------------
-- Deeds (Digital Electronics Education and Design Suite)
-- VHDL Code generated on (4/30/2021, 4:28:02 PM)
--      by the Deeds (Finite State Machine Simulator)(Deeds-FsM)
--      Ver. 2.40.330 (Jan 07, 2021)
-- Copyright (c) 2002-2020 University of Genoa, Italy
--      Web Site:  https://www.digitalelectronicsdeeds.com
---------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Fsm1_ControlUnit IS
  PORT( ----------------------------------->Clock & Reset:
        Ck:    IN std_logic;
        Reset: IN std_logic;
        ----------------------------------->Inputs:
        i_TCD: IN std_logic;
        i_TCA: IN std_logic;
        i_GO:  IN std_logic;
        ----------------------------------->Outputs:
        o_LDD: OUT std_logic;
        o_EA:  OUT std_logic;
        o_EN:  OUT std_logic;
        o_LDC: OUT std_logic;
        o_LDP: OUT std_logic;
        o_CA:  OUT std_logic;
        o_EP:  OUT std_logic
        -------------------------------------------
        );
END Fsm1_ControlUnit;

ARCHITECTURE behavioral OF Fsm1_ControlUnit IS       -- (Behavioral Description)
  TYPE states is ( state_a,
                   state_b,
                   state_c,
                   state_d,
                   dummy_0100,
                   state_f,
                   dummy_0110,
                   dummy_0111,
                   dummy_1000,
                   dummy_1001,
                   dummy_1010,
                   dummy_1011,
                   dummy_1100,
                   dummy_1101,
                   dummy_1110,
                   dummy_1111 );
  SIGNAL State,
         Next_State: states;
BEGIN

  -- Next State Combinational Logic ----------------------------------
  FSM: process( State, i_TCD, i_TCA, i_GO )
  begin
    CASE State IS
      when state_a =>
                 if (i_GO = '1') then
                   Next_State <= state_b;
                 else
                   Next_State <= state_a;
                 end if;
      when state_b =>
                 if (i_TCD = '1') then
                   Next_State <= state_c;
                 else
                   Next_State <= state_b;
                 end if;
      when state_c =>
                 Next_State <= state_d;
      when state_d =>
                 Next_State <= state_f;
      when state_f =>
                 if (i_TCA = '1') then
                   Next_State <= state_a;
                 else
                   if (i_TCD = '1') then
                     Next_State <= state_c;
                   else
                     Next_State <= state_b;
                   end if;
                 end if;
      when OTHERS =>
                 Next_State <= state_a;
    END case;
  end process;

  -- State Register --------------------------------------------------
  REG: process( Ck, Reset )
  begin
    if (Reset = '0') then
              State <= state_a;
    elsif rising_edge(Ck) then
              State <= Next_State;
       end if;
  end process;

  -- Outputs Combinational Logic -----------------------------------
  OUTPUTS: process( State, i_TCD, i_TCA, i_GO )
  begin
    -- Set output defaults:
    o_LDD <= '0';
    o_EA <= '0';
    o_EN <= '0';
    o_LDC <= '0';
    o_LDP <= '0';
    o_CA <= '0';
    o_EP <= '0';

    -- Set output as function of current state and input:
    CASE State IS
      when state_a =>
                 o_LDD <= '1';
                 o_LDC <= '1';
                 o_LDP <= '1';
      when state_b =>
                 o_EA <= '1';
                 o_EP <= '1';
      when state_c =>
                 o_LDD <= '1';
                 o_EN <= '1';
                 o_EP <= '1';
      when state_d =>
                 o_EA <= '1';
                 o_LDP <= '1';
                 o_EP <= '1';
      when state_f =>
                 o_EA <= '1';
                 o_CA <= '1';
                 o_EP <= '1';
      when OTHERS =>
                 o_LDD <= '0';
                 o_EA <= '0';
                 o_EN <= '0';
                 o_LDC <= '0';
                 o_LDP <= '0';
                 o_CA <= '0';
                 o_EP <= '0';
    END case;
  end process;

END behavioral;
