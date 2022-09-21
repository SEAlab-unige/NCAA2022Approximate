------------------------------------------------------------
-- Deeds (Digital Electronics Education and Design Suite)
-- VHDL Code generated on (4/30/2021, 4:28:09 PM)
--      by Deeds (Digital Circuit Simulator)(Deeds-DcS)
--      Ver. 2.40.330 (Jan 07, 2021)
-- Copyright (c) 2002-2020 University of Genoa, Italy
--      Web Site:  https://www.digitalelectronicsdeeds.com
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;


ENTITY ToyExample IS
  PORT( 
    --------------------------------------> Inputs:
    iclk:         IN  std_logic;
    iRST:         IN  std_logic;
    iSTART:       IN  std_logic;
    iIN_DATA:     IN  std_logic_vector( 7 downto 0 );
    iIN_ADDRESS:  IN  std_logic_vector( 7 downto 0 );
    iW_IN:        IN  std_logic;
    iWM:          IN  std_logic;
    --------------------------------------> Outputs:
    oacc:         OUT std_logic_vector( 15 downto 0 );
    oDONE_N:      OUT std_logic;
    oDONE_ALL:    OUT std_logic;
    ox_j:         OUT std_logic_vector( 7 downto 0 );
    ow_nj:        OUT std_logic_vector( 7 downto 0 );
    oMult:        OUT std_logic_vector( 15 downto 0 );
    oEM_MUL:      OUT std_logic;
    oIND_H:       OUT std_logic_vector( 15 downto 0 );
    oSYN_RAM:     OUT std_logic_vector( 7 downto 0 );
    oT_ADD:       OUT std_logic_vector( 15 downto 0 );
    oe_nj:        OUT std_logic;
    oE_acc:       OUT std_logic;
    oCL:          OUT std_logic 
    ------------------------------------------------------
    );
END ToyExample;


ARCHITECTURE structural OF ToyExample IS 

  ----------------------------------------> Components:
  COMPONENT ROM256x16C200 IS
    PORT( CS  : IN  std_logic;
          A00 : IN  std_logic;   -- ADR 7..0 (256 locations)
          A01 : IN  std_logic;
          A02 : IN  std_logic;
          A03 : IN  std_logic;
          A04 : IN  std_logic;
          A05 : IN  std_logic;
          A06 : IN  std_logic;
          A07 : IN  std_logic;
          D00 : OUT std_logic;   -- Data Output 15..00 (16-bits)
          D01 : OUT std_logic;
          D02 : OUT std_logic;
          D03 : OUT std_logic;
          D04 : OUT std_logic;
          D05 : OUT std_logic;
          D06 : OUT std_logic;
          D07 : OUT std_logic;
          D08 : OUT std_logic;
          D09 : OUT std_logic;
          D10 : OUT std_logic;
          D11 : OUT std_logic;
          D12 : OUT std_logic;
          D13 : OUT std_logic;
          D14 : OUT std_logic;
          D15 : OUT std_logic );
  END COMPONENT;
  --
  COMPONENT ROM4kx8C1068 IS
    PORT( CS  : IN  std_logic;
          A00 : IN  std_logic;   -- ADR 11..00 (4k locations)
          A01 : IN  std_logic;
          A02 : IN  std_logic;
          A03 : IN  std_logic;
          A04 : IN  std_logic;
          A05 : IN  std_logic;
          A06 : IN  std_logic;
          A07 : IN  std_logic;
          A08 : IN  std_logic;
          A09 : IN  std_logic;
          A10 : IN  std_logic;
          A11 : IN  std_logic;
          D00 : OUT std_logic;   -- Data Output 7..0 (8-bits)
          D01 : OUT std_logic;
          D02 : OUT std_logic;
          D03 : OUT std_logic;
          D04 : OUT std_logic;
          D05 : OUT std_logic;
          D06 : OUT std_logic;
          D07 : OUT std_logic );
  END COMPONENT;

  COMPONENT NOT_gate IS
    PORT( I: IN std_logic;
          O: OUT std_logic );
  END COMPONENT;
  --
  COMPONENT AND2_gate IS
    PORT( I0,I1: IN std_logic;
          O: OUT std_logic );
  END COMPONENT;
  --
  COMPONENT Multiplexer_2_1 IS
          
    PORT( I0: IN  std_logic;
          I1: IN  std_logic;
          S0: IN  std_logic;
          Q: OUT std_logic );
  END COMPONENT;
  --
  COMPONENT BusMultiplexer21_8 IS
          
    PORT( Q_07: OUT std_logic;
          Q_06: OUT std_logic;
          Q_05: OUT std_logic;
          Q_04: OUT std_logic;
          Q_03: OUT std_logic;
          Q_02: OUT std_logic;
          Q_01: OUT std_logic;
          Q_00: OUT std_logic;
          I0_07: IN  std_logic;
          I0_06: IN  std_logic;
          I0_05: IN  std_logic;
          I0_04: IN  std_logic;
          I0_03: IN  std_logic;
          I0_02: IN  std_logic;
          I0_01: IN  std_logic;
          I0_00: IN  std_logic;
          I1_07: IN  std_logic;
          I1_06: IN  std_logic;
          I1_05: IN  std_logic;
          I1_04: IN  std_logic;
          I1_03: IN  std_logic;
          I1_02: IN  std_logic;
          I1_01: IN  std_logic;
          I1_00: IN  std_logic;
          S0  :  IN  std_logic );
  END COMPONENT;
  --
  COMPONENT BusMultiplexer21_16 IS
          
    PORT( Q_15: OUT std_logic;
          Q_14: OUT std_logic;
          Q_13: OUT std_logic;
          Q_12: OUT std_logic;
          Q_11: OUT std_logic;
          Q_10: OUT std_logic;
          Q_09: OUT std_logic;
          Q_08: OUT std_logic;
          Q_07: OUT std_logic;
          Q_06: OUT std_logic;
          Q_05: OUT std_logic;
          Q_04: OUT std_logic;
          Q_03: OUT std_logic;
          Q_02: OUT std_logic;
          Q_01: OUT std_logic;
          Q_00: OUT std_logic;
          I0_15: IN  std_logic;
          I0_14: IN  std_logic;
          I0_13: IN  std_logic;
          I0_12: IN  std_logic;
          I0_11: IN  std_logic;
          I0_10: IN  std_logic;
          I0_09: IN  std_logic;
          I0_08: IN  std_logic;
          I0_07: IN  std_logic;
          I0_06: IN  std_logic;
          I0_05: IN  std_logic;
          I0_04: IN  std_logic;
          I0_03: IN  std_logic;
          I0_02: IN  std_logic;
          I0_01: IN  std_logic;
          I0_00: IN  std_logic;
          I1_15: IN  std_logic;
          I1_14: IN  std_logic;
          I1_13: IN  std_logic;
          I1_12: IN  std_logic;
          I1_11: IN  std_logic;
          I1_10: IN  std_logic;
          I1_09: IN  std_logic;
          I1_08: IN  std_logic;
          I1_07: IN  std_logic;
          I1_06: IN  std_logic;
          I1_05: IN  std_logic;
          I1_04: IN  std_logic;
          I1_03: IN  std_logic;
          I1_02: IN  std_logic;
          I1_01: IN  std_logic;
          I1_00: IN  std_logic;
          S0  :  IN  std_logic );
  END COMPONENT;
  --
  COMPONENT Adder_16 IS
          
    PORT( CIN: IN  std_logic;
          COUT:OUT std_logic;
          OVF: OUT std_logic;
          A15: IN  std_logic;
          A14: IN  std_logic;
          A13: IN  std_logic;
          A12: IN  std_logic;
          A11: IN  std_logic;
          A10: IN  std_logic;
          A9:  IN  std_logic;
          A8:  IN  std_logic;
          A7:  IN  std_logic;
          A6:  IN  std_logic;
          A5:  IN  std_logic;
          A4:  IN  std_logic;
          A3:  IN  std_logic;
          A2:  IN  std_logic;
          A1:  IN  std_logic;
          A0:  IN  std_logic;
          B15: IN  std_logic;
          B14: IN  std_logic;
          B13: IN  std_logic;
          B12: IN  std_logic;
          B11: IN  std_logic;
          B10: IN  std_logic;
          B9:  IN  std_logic;
          B8:  IN  std_logic;
          B7:  IN  std_logic;
          B6:  IN  std_logic;
          B5:  IN  std_logic;
          B4:  IN  std_logic;
          B3:  IN  std_logic;
          B2:  IN  std_logic;
          B1:  IN  std_logic;
          B0:  IN  std_logic;
          F15: OUT std_logic;
          F14: OUT std_logic;
          F13: OUT std_logic;
          F12: OUT std_logic;
          F11: OUT std_logic;
          F10: OUT std_logic;
          F9:  OUT std_logic;
          F8:  OUT std_logic;
          F7:  OUT std_logic;
          F6:  OUT std_logic;
          F5:  OUT std_logic;
          F4:  OUT std_logic;
          F3:  OUT std_logic;
          F2:  OUT std_logic;
          F1:  OUT std_logic;
          F0:  OUT std_logic );
  END COMPONENT;
  --
  COMPONENT Multiplier_8x8 IS
          
    PORT( SNA:  IN  std_logic;
          SNB:  IN  std_logic;
          A07:  IN  std_logic;
          A06:  IN  std_logic;
          A05:  IN  std_logic;
          A04:  IN  std_logic;
          A03:  IN  std_logic;
          A02:  IN  std_logic;
          A01:  IN  std_logic;
          A00:  IN  std_logic;
          B07:  IN  std_logic;
          B06:  IN  std_logic;
          B05:  IN  std_logic;
          B04:  IN  std_logic;
          B03:  IN  std_logic;
          B02:  IN  std_logic;
          B01:  IN  std_logic;
          B00:  IN  std_logic;
          M15:  OUT std_logic;
          M14:  OUT std_logic;
          M13:  OUT std_logic;
          M12:  OUT std_logic;
          M11:  OUT std_logic;
          M10:  OUT std_logic;
          M09:  OUT std_logic;
          M08:  OUT std_logic;
          M07:  OUT std_logic;
          M06:  OUT std_logic;
          M05:  OUT std_logic;
          M04:  OUT std_logic;
          M03:  OUT std_logic;
          M02:  OUT std_logic;
          M01:  OUT std_logic;
          M00:  OUT std_logic );
  END COMPONENT;
  --
  COMPONENT DpetFF IS
    PORT( D, Ck   : IN std_logic;
          nCL, nPR: IN std_logic;
          Q, nQ   : OUT std_logic );
  END COMPONENT;
  --
  COMPONENT EpetFF IS
    PORT( D, E, Ck: IN std_logic;
          nCL, nPR: IN std_logic;
          Q, nQ   : OUT std_logic );
  END COMPONENT;
  --
  COMPONENT Counter8b IS
    PORT( Ck : IN std_logic;
          nCL: IN std_logic;
          LD : IN std_logic;
          ENP: IN std_logic;
          ENT: IN std_logic;
          UD : IN std_logic;
          
          P7 : IN std_logic;
          P6 : IN std_logic;
          P5 : IN std_logic;
          P4 : IN std_logic;
          P3 : IN std_logic;
          P2 : IN std_logic;
          P1 : IN std_logic;
          P0 : IN std_logic;
          
          Q7 : OUT std_logic;
          Q6 : OUT std_logic;
          Q5 : OUT std_logic;
          Q4 : OUT std_logic;
          Q3 : OUT std_logic;
          Q2 : OUT std_logic;
          Q1 : OUT std_logic;
          Q0 : OUT std_logic;
          
          Tc : OUT std_logic );
  END COMPONENT;
  --
  COMPONENT Counter16 IS
    PORT( Ck : IN std_logic;
          nCL: IN std_logic;
          LD : IN std_logic;
          ENP: IN std_logic;
          ENT: IN std_logic;
          UD : IN std_logic;
          
          P15: IN std_logic;
          P14: IN std_logic;
          P13: IN std_logic;
          P12: IN std_logic;
          P11: IN std_logic;
          P10: IN std_logic;
          P9 : IN std_logic;
          P8 : IN std_logic;
          
          P7 : IN std_logic;
          P6 : IN std_logic;
          P5 : IN std_logic;
          P4 : IN std_logic;
          P3 : IN std_logic;
          P2 : IN std_logic;
          P1 : IN std_logic;
          P0 : IN std_logic;
          
          Q15: OUT std_logic;
          Q14: OUT std_logic;
          Q13: OUT std_logic;
          Q12: OUT std_logic;
          Q11: OUT std_logic;
          Q10: OUT std_logic;
          Q9 : OUT std_logic;
          Q8 : OUT std_logic;
          
          Q7 : OUT std_logic;
          Q6 : OUT std_logic;
          Q5 : OUT std_logic;
          Q4 : OUT std_logic;
          Q3 : OUT std_logic;
          Q2 : OUT std_logic;
          Q1 : OUT std_logic;
          Q0 : OUT std_logic;
          
          Tc : OUT std_logic );
  END COMPONENT;
  --
  COMPONENT PiPoE8b IS
    PORT( Ck : IN std_logic;
          nCL: IN std_logic;
          E  : IN std_logic;
          P7 : IN std_logic;
          P6 : IN std_logic;
          P5 : IN std_logic;
          P4 : IN std_logic;
          P3 : IN std_logic;
          P2 : IN std_logic;
          P1 : IN std_logic;
          P0 : IN std_logic;
          Q7 : OUT std_logic;
          Q6 : OUT std_logic;
          Q5 : OUT std_logic;
          Q4 : OUT std_logic;
          Q3 : OUT std_logic;
          Q2 : OUT std_logic;
          Q1 : OUT std_logic;
          Q0 : OUT std_logic );
  END COMPONENT;
  --
  COMPONENT PiPoE16 IS
    PORT( Ck : IN std_logic;
          nCL: IN std_logic;
          E  : IN std_logic;
          P15: IN std_logic;
          P14: IN std_logic;
          P13: IN std_logic;
          P12: IN std_logic;
          P11: IN std_logic;
          P10: IN std_logic;
          P9 : IN std_logic;
          P8 : IN std_logic;
          P7 : IN std_logic;
          P6 : IN std_logic;
          P5 : IN std_logic;
          P4 : IN std_logic;
          P3 : IN std_logic;
          P2 : IN std_logic;
          P1 : IN std_logic;
          P0 : IN std_logic;
          Q15: OUT std_logic;
          Q14: OUT std_logic;
          Q13: OUT std_logic;
          Q12: OUT std_logic;
          Q11: OUT std_logic;
          Q10: OUT std_logic;
          Q9 : OUT std_logic;
          Q8 : OUT std_logic;
          Q7 : OUT std_logic;
          Q6 : OUT std_logic;
          Q5 : OUT std_logic;
          Q4 : OUT std_logic;
          Q3 : OUT std_logic;
          Q2 : OUT std_logic;
          Q1 : OUT std_logic;
          Q0 : OUT std_logic );
  END COMPONENT;
  --
  COMPONENT PiSoE16 IS
    PORT( Ck : IN std_logic;
          nCL: IN std_logic;
          E  : IN std_logic;
          LD : IN std_logic;
          P15: IN std_logic;
          P14: IN std_logic;
          P13: IN std_logic;
          P12: IN std_logic;
          P11: IN std_logic;
          P10: IN std_logic;
          P9 : IN std_logic;
          P8 : IN std_logic;
          P7 : IN std_logic;
          P6 : IN std_logic;
          P5 : IN std_logic;
          P4 : IN std_logic;
          P3 : IN std_logic;
          P2 : IN std_logic;
          P1 : IN std_logic;
          P0 : IN std_logic;
          Q0 : OUT std_logic );
  END COMPONENT;
  --
  COMPONENT SSRAM256x8 IS
    PORT( CK  : IN  std_logic;
          CS  : IN  std_logic;
          WE  : IN  std_logic;
          A00 : IN  std_logic;   -- ADR 14..0 (32K)
          A01 : IN  std_logic;
          A02 : IN  std_logic;
          A03 : IN  std_logic;
          A04 : IN  std_logic;
          A05 : IN  std_logic;
          A06 : IN  std_logic;
          A07 : IN  std_logic;
          D00 : IN  std_logic;   -- Data Input 07..00 (8-bits)
          D01 : IN  std_logic;
          D02 : IN  std_logic;
          D03 : IN  std_logic;
          D04 : IN  std_logic;
          D05 : IN  std_logic;
          D06 : IN  std_logic;
          D07 : IN  std_logic;
          Q00 : OUT std_logic;   -- Data Output 07..00 (8-bits)
          Q01 : OUT std_logic;
          Q02 : OUT std_logic;
          Q03 : OUT std_logic;
          Q04 : OUT std_logic;
          Q05 : OUT std_logic;
          Q06 : OUT std_logic;
          Q07 : OUT std_logic );
  END COMPONENT;

  ----------------------------------------> Finite State Machine(s):
  COMPONENT Fsm1_ControlUnit IS
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
  END COMPONENT;

  ----------------------------------------> Signals:
  SIGNAL S001: std_logic;
  SIGNAL S002: std_logic;
  SIGNAL S003: std_logic;
  SIGNAL S004: std_logic;
  SIGNAL S005: std_logic;
  SIGNAL S006: std_logic;
  SIGNAL S007: std_logic;
  SIGNAL S008: std_logic;
  SIGNAL S009: std_logic;
  SIGNAL S010: std_logic;
  SIGNAL S011: std_logic;
  SIGNAL S012: std_logic;
  SIGNAL S013: std_logic;
  SIGNAL S014: std_logic;
  SIGNAL S015: std_logic;
  SIGNAL S016: std_logic;
  SIGNAL S017: std_logic;
  SIGNAL S018: std_logic;
  SIGNAL S019: std_logic;
  SIGNAL S020: std_logic;
  SIGNAL S021: std_logic;
  SIGNAL S022: std_logic;
  SIGNAL S023: std_logic;
  SIGNAL S024: std_logic;
  SIGNAL S025: std_logic;
  SIGNAL S026: std_logic;
  SIGNAL S027: std_logic;
  SIGNAL S028: std_logic;
  SIGNAL S029: std_logic;
  SIGNAL S030: std_logic;
  SIGNAL S031: std_logic;
  SIGNAL S032: std_logic;
  SIGNAL S033: std_logic;
  SIGNAL S034: std_logic;
  SIGNAL S035: std_logic;
  SIGNAL S036: std_logic;
  SIGNAL S037: std_logic;
  SIGNAL S038: std_logic;
  SIGNAL S039: std_logic;
  SIGNAL S040: std_logic;
  SIGNAL S041: std_logic;
  SIGNAL S042: std_logic;
  SIGNAL S043: std_logic;
  SIGNAL S044: std_logic;
  SIGNAL S045: std_logic;
  SIGNAL S046: std_logic;
  SIGNAL S047: std_logic;
  SIGNAL S048: std_logic;
  SIGNAL S049: std_logic;
  SIGNAL S050: std_logic;
  SIGNAL S051: std_logic;
  SIGNAL S052: std_logic;
  SIGNAL S053: std_logic;
  SIGNAL S054: std_logic;
  SIGNAL S055: std_logic;
  SIGNAL S056: std_logic;
  SIGNAL S057: std_logic;
  SIGNAL S058: std_logic;
  SIGNAL S059: std_logic;
  SIGNAL S060: std_logic;
  SIGNAL S061: std_logic;
  SIGNAL S062: std_logic;
  SIGNAL S063: std_logic;
  SIGNAL S064: std_logic;
  SIGNAL S065: std_logic;
  SIGNAL S066: std_logic;
  SIGNAL S067: std_logic;
  SIGNAL S068: std_logic;
  SIGNAL S069: std_logic;
  SIGNAL S070: std_logic;
  SIGNAL S071: std_logic;
  SIGNAL S072: std_logic;
  SIGNAL S073: std_logic;
  SIGNAL S074: std_logic;
  SIGNAL S075: std_logic;
  SIGNAL S076: std_logic;
  SIGNAL S077: std_logic;
  SIGNAL S078: std_logic;
  SIGNAL S079: std_logic;
  SIGNAL S080: std_logic;
  SIGNAL S081: std_logic;
  SIGNAL S082: std_logic;
  SIGNAL S083: std_logic;
  SIGNAL S084: std_logic;
  SIGNAL S085: std_logic;
  SIGNAL S086: std_logic;
  SIGNAL S087: std_logic;
  SIGNAL S088: std_logic;
  SIGNAL S089: std_logic;
  SIGNAL S090: std_logic;
  SIGNAL S091: std_logic;
  SIGNAL S092: std_logic;
  SIGNAL S093: std_logic;
  SIGNAL S094: std_logic;
  SIGNAL S095: std_logic;
  SIGNAL S096: std_logic;
  SIGNAL S097: std_logic;
  SIGNAL S098: std_logic;
  SIGNAL S099: std_logic;
  SIGNAL S100: std_logic;
  SIGNAL S101: std_logic;
  SIGNAL S102: std_logic;
  SIGNAL S103: std_logic;
  SIGNAL S104: std_logic;
  SIGNAL S105: std_logic;
  SIGNAL S106: std_logic;
  SIGNAL S107: std_logic;
  SIGNAL S108: std_logic;
  SIGNAL S109: std_logic;
  SIGNAL S110: std_logic;
  SIGNAL S111: std_logic;
  SIGNAL S112: std_logic;
  SIGNAL S113: std_logic;
  SIGNAL S114: std_logic;
  SIGNAL S115: std_logic;
  SIGNAL S116: std_logic;
  SIGNAL S117: std_logic;
  SIGNAL S118: std_logic;
  SIGNAL S119: std_logic;
  SIGNAL S120: std_logic;
  SIGNAL S121: std_logic;
  SIGNAL S122: std_logic;
  SIGNAL S123: std_logic;
  SIGNAL S124: std_logic;
  SIGNAL S125: std_logic;
  SIGNAL S126: std_logic;
  SIGNAL S127: std_logic;
  SIGNAL S128: std_logic;
  SIGNAL S129: std_logic;
  SIGNAL S130: std_logic;
  SIGNAL S131: std_logic;
  SIGNAL S132: std_logic;
  SIGNAL S133: std_logic;
  SIGNAL S134: std_logic;
  SIGNAL S135: std_logic;
  SIGNAL S136: std_logic;
  SIGNAL S137: std_logic;
  SIGNAL S138: std_logic;
  SIGNAL S139: std_logic;
  SIGNAL S140: std_logic;
  SIGNAL S141: std_logic;
  SIGNAL S142: std_logic;
  SIGNAL S143: std_logic;
  SIGNAL S144: std_logic;
  SIGNAL S145: std_logic;
  SIGNAL S146: std_logic;
  SIGNAL S147: std_logic;
  SIGNAL S148: std_logic;
  SIGNAL S149: std_logic;
  SIGNAL S150: std_logic;
  SIGNAL S151: std_logic;
  SIGNAL S152: std_logic;
  SIGNAL S153: std_logic;
  SIGNAL S154: std_logic;
  SIGNAL S155: std_logic;
  SIGNAL S156: std_logic;
  SIGNAL S157: std_logic;
  SIGNAL S158: std_logic;
  SIGNAL S159: std_logic;
  SIGNAL S160: std_logic;
  SIGNAL S161: std_logic;
  SIGNAL S162: std_logic;
  SIGNAL S163: std_logic;
  SIGNAL S164: std_logic;
  SIGNAL S165: std_logic;
  SIGNAL S166: std_logic;
  SIGNAL S167: std_logic;
  SIGNAL S168: std_logic;
  SIGNAL S169: std_logic;
  SIGNAL S170: std_logic;
  SIGNAL S171: std_logic;
  SIGNAL S172: std_logic;
  SIGNAL S173: std_logic;
  SIGNAL S174: std_logic;
  SIGNAL S175: std_logic;
  SIGNAL S176: std_logic;
  SIGNAL S177: std_logic;
  SIGNAL S178: std_logic;
  SIGNAL S179: std_logic;
  SIGNAL S180: std_logic;
  SIGNAL S181: std_logic;
  SIGNAL S182: std_logic;
  SIGNAL S183: std_logic;
  SIGNAL S184: std_logic;
  SIGNAL S185: std_logic;
  SIGNAL S186: std_logic;
  SIGNAL S187: std_logic;
  SIGNAL S188: std_logic;
  SIGNAL S189: std_logic;
  SIGNAL S190: std_logic;
  SIGNAL S191: std_logic;
  SIGNAL S192: std_logic;
  SIGNAL S193: std_logic;
  SIGNAL S194: std_logic;
  SIGNAL S195: std_logic;
  SIGNAL S196: std_logic;
  SIGNAL S197: std_logic;
  SIGNAL S198: std_logic;
  SIGNAL S199: std_logic;
  SIGNAL S200: std_logic;
  SIGNAL S201: std_logic;
  SIGNAL S202: std_logic;
  SIGNAL S203: std_logic;
  SIGNAL S204: std_logic;
  SIGNAL S205: std_logic;
  SIGNAL S206: std_logic;
  SIGNAL S207: std_logic;
  SIGNAL S208: std_logic;
  SIGNAL S209: std_logic;
  SIGNAL S210: std_logic;
  SIGNAL S211: std_logic;
  SIGNAL S212: std_logic;
  SIGNAL S213: std_logic;
  SIGNAL S214: std_logic;
  SIGNAL S215: std_logic;
  SIGNAL S216: std_logic;
  SIGNAL S217: std_logic;
  SIGNAL S218: std_logic;
  SIGNAL S219: std_logic;
  SIGNAL S220: std_logic;
  SIGNAL S221: std_logic;
  SIGNAL S222: std_logic;
  SIGNAL S223: std_logic;
  SIGNAL S224: std_logic;
  SIGNAL S225: std_logic;
  SIGNAL S226: std_logic;
  SIGNAL S227: std_logic;
  SIGNAL S228: std_logic;
  SIGNAL S229: std_logic;
  SIGNAL S230: std_logic;
  SIGNAL S231: std_logic;
  SIGNAL S232: std_logic;
  SIGNAL S233: std_logic;
  SIGNAL S234: std_logic;
  SIGNAL S235: std_logic;
  SIGNAL S236: std_logic;
  SIGNAL S237: std_logic;
  SIGNAL S238: std_logic;
  SIGNAL S239: std_logic;
  SIGNAL S240: std_logic;
  SIGNAL S241: std_logic;
  SIGNAL S242: std_logic;
  SIGNAL S243: std_logic;
  SIGNAL S244: std_logic;
  SIGNAL S245: std_logic;
  SIGNAL S246: std_logic;
  SIGNAL S247: std_logic;
  SIGNAL S248: std_logic;
  SIGNAL S249: std_logic;
  SIGNAL S250: std_logic;
  SIGNAL S251: std_logic;
  SIGNAL S252: std_logic;
  SIGNAL S253: std_logic;
  SIGNAL S254: std_logic;
  SIGNAL S255: std_logic;
  SIGNAL S256: std_logic;
  SIGNAL S257: std_logic;
  SIGNAL S258: std_logic;
  SIGNAL S259: std_logic;
  SIGNAL S260: std_logic;
  SIGNAL S261: std_logic;
  SIGNAL S262: std_logic;
  SIGNAL S263: std_logic;
  SIGNAL S264: std_logic;
  SIGNAL S265: std_logic;
  SIGNAL S266: std_logic;
  SIGNAL S267: std_logic;
  SIGNAL S268: std_logic;

  ----------------------------------------> Not Connected Pins:
  SIGNAL ncp2_C015: std_logic;
  SIGNAL ncp3_C015: std_logic;
  SIGNAL ncp23_C341: std_logic;
  SIGNAL ncp6_C644: std_logic;
  SIGNAL ncp6_C664: std_logic;
  SIGNAL ncp6_C715: std_logic;
  SIGNAL ncp6_C1345: std_logic;
  SIGNAL ncp7_C1704: std_logic;


BEGIN -- structural

  ----------------------------------------> Input:
  S049 <= iclk;
  S046 <= iRST;
  S007 <= iSTART;
  S097 <= iIN_DATA(0);
  S098 <= iIN_DATA(1);
  S099 <= iIN_DATA(2);
  S100 <= iIN_DATA(3);
  S101 <= iIN_DATA(4);
  S102 <= iIN_DATA(5);
  S103 <= iIN_DATA(6);
  S104 <= iIN_DATA(7);
  S105 <= iIN_ADDRESS(0);
  S106 <= iIN_ADDRESS(1);
  S107 <= iIN_ADDRESS(2);
  S108 <= iIN_ADDRESS(3);
  S109 <= iIN_ADDRESS(4);
  S110 <= iIN_ADDRESS(5);
  S111 <= iIN_ADDRESS(6);
  S112 <= iIN_ADDRESS(7);
  S042 <= iW_IN;
  S041 <= iWM;

  ----------------------------------------> Output:
  oacc(0) <= S213;
  oacc(1) <= S214;
  oacc(2) <= S215;
  oacc(3) <= S216;
  oacc(4) <= S217;
  oacc(5) <= S218;
  oacc(6) <= S219;
  oacc(7) <= S220;
  oacc(8) <= S221;
  oacc(9) <= S222;
  oacc(10) <= S223;
  oacc(11) <= S224;
  oacc(12) <= S225;
  oacc(13) <= S226;
  oacc(14) <= S227;
  oacc(15) <= S228;
  oDONE_N <= S055;
  oDONE_ALL <= S050;
  ox_j(0) <= S137;
  ox_j(1) <= S138;
  ox_j(2) <= S139;
  ox_j(3) <= S140;
  ox_j(4) <= S141;
  ox_j(5) <= S142;
  ox_j(6) <= S143;
  ox_j(7) <= S144;
  ow_nj(0) <= S181;
  ow_nj(1) <= S182;
  ow_nj(2) <= S183;
  ow_nj(3) <= S184;
  ow_nj(4) <= S185;
  ow_nj(5) <= S186;
  ow_nj(6) <= S187;
  ow_nj(7) <= S188;
  oMult(0) <= S145;
  oMult(1) <= S146;
  oMult(2) <= S147;
  oMult(3) <= S148;
  oMult(4) <= S149;
  oMult(5) <= S150;
  oMult(6) <= S151;
  oMult(7) <= S152;
  oMult(8) <= S153;
  oMult(9) <= S154;
  oMult(10) <= S155;
  oMult(11) <= S156;
  oMult(12) <= S157;
  oMult(13) <= S158;
  oMult(14) <= S159;
  oMult(15) <= S160;
  oEM_MUL <= S034;
  oIND_H(0) <= S030;
  oIND_H(1) <= S029;
  oIND_H(2) <= S028;
  oIND_H(3) <= S027;
  oIND_H(4) <= S026;
  oIND_H(5) <= S025;
  oIND_H(6) <= S024;
  oIND_H(7) <= S023;
  oIND_H(8) <= S022;
  oIND_H(9) <= S021;
  oIND_H(10) <= S020;
  oIND_H(11) <= S019;
  oIND_H(12) <= S161;
  oIND_H(13) <= S162;
  oIND_H(14) <= S163;
  oIND_H(15) <= S164;
  oSYN_RAM(0) <= S165;
  oSYN_RAM(1) <= S166;
  oSYN_RAM(2) <= S167;
  oSYN_RAM(3) <= S168;
  oSYN_RAM(4) <= S169;
  oSYN_RAM(5) <= S170;
  oSYN_RAM(6) <= S171;
  oSYN_RAM(7) <= S172;
  oT_ADD(0) <= S189;
  oT_ADD(1) <= S190;
  oT_ADD(2) <= S191;
  oT_ADD(3) <= S192;
  oT_ADD(4) <= S193;
  oT_ADD(5) <= S194;
  oT_ADD(6) <= S195;
  oT_ADD(7) <= S196;
  oT_ADD(8) <= S197;
  oT_ADD(9) <= S198;
  oT_ADD(10) <= S199;
  oT_ADD(11) <= S200;
  oT_ADD(12) <= S201;
  oT_ADD(13) <= S202;
  oT_ADD(14) <= S203;
  oT_ADD(15) <= S204;
  oe_nj <= S045;
  oE_acc <= S034;
  oCL <= S047;

  ----------------------------------------> Constants:
  S001 <= '0';
  S002 <= '0';
  S003 <= '0';
  S089 <= '1';
  S090 <= '0';
  S091 <= '0';
  S092 <= '0';
  S093 <= '0';
  S094 <= '0';
  S095 <= '0';
  S096 <= '0';
  S081 <= '0';
  S082 <= '1';
  S083 <= '0';
  S084 <= '0';
  S085 <= '0';
  S086 <= '0';
  S087 <= '0';
  S088 <= '0';
  S006 <= '1';
  S008 <= '0';
  S010 <= '1';
  S012 <= '1';
  S018 <= '1';
  S037 <= '1';
  S035 <= '1';
  S015 <= '1';
  S033 <= '0';
  S032 <= '1';
  S121 <= '1';
  S122 <= '0';
  S123 <= '1';
  S124 <= '0';
  S125 <= '0';
  S126 <= '0';
  S127 <= '0';
  S128 <= '0';
  S129 <= '0';
  S130 <= '0';
  S131 <= '0';
  S132 <= '0';
  S133 <= '0';
  S134 <= '0';
  S135 <= '0';
  S136 <= '0';
  S040 <= '1';
  S043 <= '1';
  S229 <= '0';
  S230 <= '0';
  S231 <= '0';
  S232 <= '0';
  S233 <= '0';
  S234 <= '0';
  S235 <= '0';
  S236 <= '0';
  S237 <= '0';
  S238 <= '0';
  S239 <= '0';
  S240 <= '0';
  S241 <= '0';
  S242 <= '0';
  S243 <= '0';
  S244 <= '0';
  S053 <= '1';
  S054 <= '1';

  ----------------------------------------> Component Mapping:
  C005: Multiplier_8x8 PORT MAP ( S002, S002, S188, S187, S186, 
                                  S185, S184, S183, S182, S181, 
                                  S144, S143, S142, S141, S140, 
                                  S139, S138, S137, S160, S159, 
                                  S158, S157, S156, S155, S154, 
                                  S153, S152, S151, S150, S149, 
                                  S148, S147, S146, S145 );
  C015: Adder_16 PORT MAP ( S001, ncp2_C015, ncp3_C015, S160, 
                            S159, S158, S157, S156, S155, S154, 
                            S153, S152, S151, S150, S149, S148, 
                            S147, S146, S145, S072, S071, S070, 
                            S069, S068, S067, S066, S065, S064, 
                            S063, S062, S061, S060, S059, S058, 
                            S057, S204, S203, S202, S201, S200, 
                            S199, S198, S197, S196, S195, S194, 
                            S193, S192, S191, S190, S189 );
  C027: PiPoE16 PORT MAP ( S049, S046, S034, S204, S203, S202, 
                           S201, S200, S199, S198, S197, S196, 
                           S195, S194, S193, S192, S191, S190, 
                           S189, S228, S227, S226, S225, S224, 
                           S223, S222, S221, S220, S219, S218, 
                           S217, S216, S215, S214, S213 );
  C084: PiPoE8b PORT MAP ( S049, S046, S017, S172, S171, S170, 
                           S169, S168, S167, S166, S165, S144, 
                           S143, S142, S141, S140, S139, S138, 
                           S137 );
  C088: PiPoE8b PORT MAP ( S049, S046, S054, S080, S079, S078, 
                           S077, S076, S075, S074, S073, S180, 
                           S179, S178, S177, S176, S175, S174, 
                           S173 );
  C196: PiSoE16 PORT MAP ( S049, S046, S056, S009, S260, S259, 
                           S258, S257, S256, S255, S254, S253, 
                           S252, S251, S250, S249, S248, S247, 
                           S246, S245, S039 );
  C200: ROM256x16C200 PORT MAP ( S006, S205, S206, S207, S208, 
                                 S209, S210, S211, S212, S245, 
                                 S246, S247, S248, S249, S250, 
                                 S251, S252, S253, S254, S255, 
                                 S256, S257, S258, S259, S260 );
  C259: Counter8b PORT MAP ( S049, S046, S005, S031, S018, S003, 
                             S088, S087, S086, S085, S084, S083, 
                             S082, S081, S120, S119, S118, S117, 
                             S116, S115, S114, S113, S004 );
  C341: Counter8b PORT MAP ( S049, S046, S051, S011, S010, S008, 
                             S096, S095, S094, S093, S092, S091, 
                             S090, S089, S212, S211, S210, S209, 
                             S208, S207, S206, S205, ncp23_C341 );
  C640: NOT_gate PORT MAP ( S055, S044 );
  C644: DpetFF PORT MAP ( S031, S049, S046, S037, S036, ncp6_C644 );
  C664: DpetFF PORT MAP ( S044, S049, S046, S043, S047, ncp6_C664 );
  C715: DpetFF PORT MAP ( S045, S049, S046, S035, S013, ncp6_C715 );
  C716: AND2_gate PORT MAP ( S013, S038, S034 );
  C779: BusMultiplexer21_8 PORT MAP ( S268, S267, S266, S265, 
                                      S264, S263, S262, S261, 
                                      S112, S111, S110, S109, 
                                      S108, S107, S106, S105, 
                                      S120, S119, S118, S117, 
                                      S116, S115, S114, S113, 
                                      S014 );
  C845: NOT_gate PORT MAP ( S014, S016 );
  C924: AND2_gate PORT MAP ( S014, S045, S017 );
  C1068: ROM4kx8C1068 PORT MAP ( S012, S030, S029, S028, S027, 
                                 S026, S025, S024, S023, S022, 
                                 S021, S020, S019, S073, S074, 
                                 S075, S076, S077, S078, S079, 
                                 S080 );
  C1085: Counter16 PORT MAP ( S049, S046, S051, S031, S032, S033, 
                              S136, S135, S134, S133, S132, S131, 
                              S130, S129, S128, S127, S126, S125, 
                              S124, S123, S122, S121, S164, S163, 
                              S162, S161, S019, S020, S021, S022, 
                              S023, S024, S025, S026, S027, S028, 
                              S029, S030, S048 );
  C1194: SSRAM256x8 PORT MAP ( S049, S015, S016, S261, S262, 
                               S263, S264, S265, S266, S267, 
                               S268, S097, S098, S099, S100, 
                               S101, S102, S103, S104, S165, 
                               S166, S167, S168, S169, S170, 
                               S171, S172 );
  C1228: NOT_gate PORT MAP ( S042, S014 );
  C1282: PiPoE8b PORT MAP ( S049, S046, S045, S180, S179, S178, 
                            S177, S176, S175, S174, S173, S188, 
                            S187, S186, S185, S184, S183, S182, 
                            S181 );
  C1345: DpetFF PORT MAP ( S036, S049, S046, S037, S038, ncp6_C1345 );
  C1396: Multiplexer_2_1 PORT MAP ( S039, S040, S041, S045 );
  C1641: BusMultiplexer21_16 PORT MAP ( S072, S071, S070, S069, 
                                        S068, S067, S066, S065, 
                                        S064, S063, S062, S061, 
                                        S060, S059, S058, S057, 
                                        S244, S243, S242, S241, 
                                        S240, S239, S238, S237, 
                                        S236, S235, S234, S233, 
                                        S232, S231, S230, S229, 
                                        S228, S227, S226, S225, 
                                        S224, S223, S222, S221, 
                                        S220, S219, S218, S217, 
                                        S216, S215, S214, S213, 
                                        S047 );
  C1704: EpetFF PORT MAP ( S048, S048, S049, S052, S053, S050, 
                           ncp7_C1704 );
  C1721: NOT_gate PORT MAP ( S051, S052 );
  C1765: Fsm1_ControlUnit PORT MAP ( S049, S046, S004, S050, 
                                     S007, S005, S031, S011, 
                                     S051, S009, S055, S056 );
END structural;
