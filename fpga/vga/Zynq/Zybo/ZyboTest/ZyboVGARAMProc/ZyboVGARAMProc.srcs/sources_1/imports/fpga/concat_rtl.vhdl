
--------> /softl3/catapultc10_0a/64bit/Mgc_home/pkgs/hls_pkgs/src/funcs.vhd 

-- a package of attributes that give verification tools a hint about
-- the function being implemented
PACKAGE attributes IS
  ATTRIBUTE CALYPTO_FUNC : string;
  ATTRIBUTE CALYPTO_DATA_ORDER : string;
end attributes;

-----------------------------------------------------------------------
-- Package that declares synthesizable functions needed for RTL output
-----------------------------------------------------------------------

LIBRARY ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

PACKAGE funcs IS

-----------------------------------------------------------------
-- utility functions
-----------------------------------------------------------------

   FUNCTION TO_STDLOGIC(arg1: BOOLEAN) RETURN STD_LOGIC;
--   FUNCTION TO_STDLOGIC(arg1: STD_ULOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGIC(arg1: STD_LOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGIC(arg1: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGIC(arg1: SIGNED(0 DOWNTO 0)) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGICVECTOR(arg1: STD_LOGIC) RETURN STD_LOGIC_VECTOR;

   FUNCTION maximum(arg1, arg2 : INTEGER) RETURN INTEGER;
   FUNCTION minimum(arg1, arg2 : INTEGER) RETURN INTEGER;
   FUNCTION ifeqsel(arg1, arg2, seleq, selne : INTEGER) RETURN INTEGER;
   FUNCTION resolve_std_logic_vector(input1: STD_LOGIC_VECTOR; input2 : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;
   
-----------------------------------------------------------------
-- logic functions
-----------------------------------------------------------------

   FUNCTION and_s(inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC;
   FUNCTION or_s (inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC;
   FUNCTION xor_s(inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC;

   FUNCTION and_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR;
   FUNCTION or_v (inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR;
   FUNCTION xor_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- mux functions
-----------------------------------------------------------------

   FUNCTION mux_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC       ) RETURN STD_LOGIC;
   FUNCTION mux_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR) RETURN STD_LOGIC;
   FUNCTION mux_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC       ) RETURN STD_LOGIC_VECTOR;
   FUNCTION mux_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- latch functions
-----------------------------------------------------------------
   FUNCTION lat_s(dinput: STD_LOGIC       ; clk: STD_LOGIC; doutput: STD_LOGIC       ) RETURN STD_LOGIC;
   FUNCTION lat_v(dinput: STD_LOGIC_VECTOR; clk: STD_LOGIC; doutput: STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- tristate functions
-----------------------------------------------------------------
--   FUNCTION tri_s(dinput: STD_LOGIC       ; control: STD_LOGIC) RETURN STD_LOGIC;
--   FUNCTION tri_v(dinput: STD_LOGIC_VECTOR; control: STD_LOGIC) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- compare functions returning STD_LOGIC
-- in contrast to the functions returning boolean
-----------------------------------------------------------------

   FUNCTION "=" (l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "=" (l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION "/="(l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "/="(l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION "<="(l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "<="(l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION "<" (l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "<" (l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION ">="(l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION ">="(l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION ">" (l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION ">" (l, r: SIGNED  ) RETURN STD_LOGIC;

   -- RETURN 2 bits (left => lt, right => eq)
   FUNCTION cmp (l, r: STD_LOGIC_VECTOR) RETURN STD_LOGIC;

-----------------------------------------------------------------
-- Vectorized Overloaded Arithmetic Operators
-----------------------------------------------------------------

   FUNCTION faccu(arg: UNSIGNED; width: NATURAL) RETURN UNSIGNED;
 
   FUNCTION fabs(arg1: SIGNED  ) RETURN UNSIGNED;

   FUNCTION "/"  (l, r: UNSIGNED) RETURN UNSIGNED;
   FUNCTION "MOD"(l, r: UNSIGNED) RETURN UNSIGNED;
   FUNCTION "REM"(l, r: UNSIGNED) RETURN UNSIGNED;
   FUNCTION "**" (l, r: UNSIGNED) RETURN UNSIGNED;

   FUNCTION "/"  (l, r: SIGNED  ) RETURN SIGNED  ;
   FUNCTION "MOD"(l, r: SIGNED  ) RETURN SIGNED  ;
   FUNCTION "REM"(l, r: SIGNED  ) RETURN SIGNED  ;
   FUNCTION "**" (l, r: SIGNED  ) RETURN SIGNED  ;

-----------------------------------------------------------------
--               S H I F T   F U C T I O N S
-- negative shift shifts the opposite direction
-- *_stdar functions use shift functions from std_logic_arith
-----------------------------------------------------------------

   FUNCTION fshl(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED;

   FUNCTION fshl(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshl(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED  ;

   FUNCTION fshl(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;

   FUNCTION frot(arg1: STD_LOGIC_VECTOR; arg2: STD_LOGIC_VECTOR; signd2: BOOLEAN; sdir: INTEGER range -1 TO 1) RETURN STD_LOGIC_VECTOR;
   FUNCTION frol(arg1: STD_LOGIC_VECTOR; arg2: UNSIGNED) RETURN STD_LOGIC_VECTOR;
   FUNCTION fror(arg1: STD_LOGIC_VECTOR; arg2: UNSIGNED) RETURN STD_LOGIC_VECTOR;
   FUNCTION frol(arg1: STD_LOGIC_VECTOR; arg2: SIGNED  ) RETURN STD_LOGIC_VECTOR;
   FUNCTION fror(arg1: STD_LOGIC_VECTOR; arg2: SIGNED  ) RETURN STD_LOGIC_VECTOR;

   -----------------------------------------------------------------
   -- *_stdar functions use shift functions from std_logic_arith
   -----------------------------------------------------------------
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED;

   FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED  ;

   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;

-----------------------------------------------------------------
-- indexing functions: LSB always has index 0
-----------------------------------------------------------------

   FUNCTION readindex(vec: STD_LOGIC_VECTOR; index: INTEGER                 ) RETURN STD_LOGIC;
   FUNCTION readslice(vec: STD_LOGIC_VECTOR; index: INTEGER; width: POSITIVE) RETURN STD_LOGIC_VECTOR;

   FUNCTION writeindex(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC       ; index: INTEGER) RETURN STD_LOGIC_VECTOR;
   FUNCTION n_bits(p: NATURAL) RETURN POSITIVE;
   --FUNCTION writeslice(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC_VECTOR; index: INTEGER) RETURN STD_LOGIC_VECTOR;
   FUNCTION writeslice(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC_VECTOR; enable: STD_LOGIC_VECTOR; byte_width: INTEGER;  index: INTEGER) RETURN STD_LOGIC_VECTOR ;

   FUNCTION ceil_log2(size : NATURAL) return NATURAL;
   FUNCTION bits(size : NATURAL) return NATURAL;    

   PROCEDURE csa(a, b, c: IN INTEGER; s, cout: OUT STD_LOGIC_VECTOR);
   PROCEDURE csha(a, b: IN INTEGER; s, cout: OUT STD_LOGIC_VECTOR);
   
END funcs;


--------------------------- B O D Y ----------------------------


PACKAGE BODY funcs IS

-----------------------------------------------------------------
-- utility functions
-----------------------------------------------------------------

   FUNCTION TO_STDLOGIC(arg1: BOOLEAN) RETURN STD_LOGIC IS
     BEGIN IF arg1 THEN RETURN '1'; ELSE RETURN '0'; END IF; END;
--   FUNCTION TO_STDLOGIC(arg1: STD_ULOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC IS
--     BEGIN RETURN arg1(0); END;
   FUNCTION TO_STDLOGIC(arg1: STD_LOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC IS
     BEGIN RETURN arg1(0); END;
   FUNCTION TO_STDLOGIC(arg1: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN arg1(0); END;
   FUNCTION TO_STDLOGIC(arg1: SIGNED(0 DOWNTO 0)) RETURN STD_LOGIC IS
     BEGIN RETURN arg1(0); END;

   FUNCTION TO_STDLOGICVECTOR(arg1: STD_LOGIC) RETURN STD_LOGIC_VECTOR IS
     VARIABLE result: STD_LOGIC_VECTOR(0 DOWNTO 0);
   BEGIN
     result := (0 => arg1);
     RETURN result;
   END;

   FUNCTION maximum (arg1,arg2: INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 > arg2) THEN
       RETURN(arg1) ;
     ELSE
       RETURN(arg2) ;
     END IF;
   END;

   FUNCTION minimum (arg1,arg2: INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 < arg2) THEN
       RETURN(arg1) ;
     ELSE
       RETURN(arg2) ;
     END IF;
   END;

   FUNCTION ifeqsel(arg1, arg2, seleq, selne : INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 = arg2) THEN
       RETURN(seleq) ;
     ELSE
       RETURN(selne) ;
     END IF;
   END;

   FUNCTION resolve_std_logic_vector(input1: STD_LOGIC_VECTOR; input2: STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len: INTEGER := input1'LENGTH;
     ALIAS input1a: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS input1;
     ALIAS input2a: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS input2;
     VARIABLE result: STD_LOGIC_VECTOR(len-1 DOWNTO 0);
   BEGIN
     result := (others => '0');
     --synopsys translate_off
     FOR i IN len-1 DOWNTO 0 LOOP
       result(i) := resolved(input1a(i) & input2a(i));
     END LOOP;
     --synopsys translate_on
     RETURN result;
   END;

   FUNCTION resolve_unsigned(input1: UNSIGNED; input2: UNSIGNED) RETURN UNSIGNED IS
   BEGIN RETURN UNSIGNED(resolve_std_logic_vector(STD_LOGIC_VECTOR(input1), STD_LOGIC_VECTOR(input2))); END;

   FUNCTION resolve_signed(input1: SIGNED; input2: SIGNED) RETURN SIGNED IS
   BEGIN RETURN SIGNED(resolve_std_logic_vector(STD_LOGIC_VECTOR(input1), STD_LOGIC_VECTOR(input2))); END;

-----------------------------------------------------------------
-- Logic Functions
-----------------------------------------------------------------

   FUNCTION "not"(arg1: UNSIGNED) RETURN UNSIGNED IS
     BEGIN RETURN UNSIGNED(not STD_LOGIC_VECTOR(arg1)); END;
   FUNCTION and_s(inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
     BEGIN RETURN TO_STDLOGIC(and_v(inputs, 1)); END;
   FUNCTION or_s (inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
     BEGIN RETURN TO_STDLOGIC(or_v(inputs, 1)); END;
   FUNCTION xor_s(inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
     BEGIN RETURN TO_STDLOGIC(xor_v(inputs, 1)); END;

   FUNCTION and_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT ilen: POSITIVE := inputs'LENGTH;
     CONSTANT ilenM1: POSITIVE := ilen-1; --2.1.6.3
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT ilenMolenM1: INTEGER := ilen-olen-1; --2.1.6.3
     VARIABLE inputsx: STD_LOGIC_VECTOR(ilen-1 DOWNTO 0);
     CONSTANT icnt2: POSITIVE:= inputs'LENGTH/olen;
     VARIABLE result: STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT ilen REM olen = 0 SEVERITY FAILURE;
     --synopsys translate_on
     inputsx := inputs;
     result := inputsx(olenM1 DOWNTO 0);
     FOR i IN icnt2-1 DOWNTO 1 LOOP
       inputsx(ilenMolenM1 DOWNTO 0) := inputsx(ilenM1 DOWNTO olen);
       result := result AND inputsx(olenM1 DOWNTO 0);
     END LOOP;
     RETURN result;
   END;

   FUNCTION or_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT ilen: POSITIVE := inputs'LENGTH;
     CONSTANT ilenM1: POSITIVE := ilen-1; --2.1.6.3
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT ilenMolenM1: INTEGER := ilen-olen-1; --2.1.6.3
     VARIABLE inputsx: STD_LOGIC_VECTOR(ilen-1 DOWNTO 0);
     CONSTANT icnt2: POSITIVE:= inputs'LENGTH/olen;
     VARIABLE result: STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT ilen REM olen = 0 SEVERITY FAILURE;
     --synopsys translate_on
     inputsx := inputs;
     result := inputsx(olenM1 DOWNTO 0);
     -- this if is added as a quick fix for a bug in catapult evaluating the loop even if inputs'LENGTH==1
     -- see dts0100971279
     IF icnt2 > 1 THEN
       FOR i IN icnt2-1 DOWNTO 1 LOOP
         inputsx(ilenMolenM1 DOWNTO 0) := inputsx(ilenM1 DOWNTO olen);
         result := result OR inputsx(olenM1 DOWNTO 0);
       END LOOP;
     END IF;
     RETURN result;
   END;

   FUNCTION xor_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT ilen: POSITIVE := inputs'LENGTH;
     CONSTANT ilenM1: POSITIVE := ilen-1; --2.1.6.3
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT ilenMolenM1: INTEGER := ilen-olen-1; --2.1.6.3
     VARIABLE inputsx: STD_LOGIC_VECTOR(ilen-1 DOWNTO 0);
     CONSTANT icnt2: POSITIVE:= inputs'LENGTH/olen;
     VARIABLE result: STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT ilen REM olen = 0 SEVERITY FAILURE;
     --synopsys translate_on
     inputsx := inputs;
     result := inputsx(olenM1 DOWNTO 0);
     FOR i IN icnt2-1 DOWNTO 1 LOOP
       inputsx(ilenMolenM1 DOWNTO 0) := inputsx(ilenM1 DOWNTO olen);
       result := result XOR inputsx(olenM1 DOWNTO 0);
     END LOOP;
     RETURN result;
   END;

-----------------------------------------------------------------
-- Muxes
-----------------------------------------------------------------
   
   FUNCTION mux_sel2_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(1 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'LENGTH / 4;
     ALIAS    inputs0: STD_LOGIC_VECTOR( inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector( size-1 DOWNTO 0);
   BEGIN
     -- for synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "00" =>
       result := inputs0(1*size-1 DOWNTO 0*size);
     WHEN "01" =>
       result := inputs0(2*size-1 DOWNTO 1*size);
     WHEN "10" =>
       result := inputs0(3*size-1 DOWNTO 2*size);
     WHEN "11" =>
       result := inputs0(4*size-1 DOWNTO 3*size);
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END;
   
   FUNCTION mux_sel3_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(2 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'LENGTH / 8;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0);
   BEGIN
     -- for synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "000" =>
       result := inputs0(1*size-1 DOWNTO 0*size);
     WHEN "001" =>
       result := inputs0(2*size-1 DOWNTO 1*size);
     WHEN "010" =>
       result := inputs0(3*size-1 DOWNTO 2*size);
     WHEN "011" =>
       result := inputs0(4*size-1 DOWNTO 3*size);
     WHEN "100" =>
       result := inputs0(5*size-1 DOWNTO 4*size);
     WHEN "101" =>
       result := inputs0(6*size-1 DOWNTO 5*size);
     WHEN "110" =>
       result := inputs0(7*size-1 DOWNTO 6*size);
     WHEN "111" =>
       result := inputs0(8*size-1 DOWNTO 7*size);
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END;
   
   FUNCTION mux_sel4_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(3 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'LENGTH / 16;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0);
   BEGIN
     -- for synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "0000" =>
       result := inputs0( 1*size-1 DOWNTO 0*size);
     WHEN "0001" =>
       result := inputs0( 2*size-1 DOWNTO 1*size);
     WHEN "0010" =>
       result := inputs0( 3*size-1 DOWNTO 2*size);
     WHEN "0011" =>
       result := inputs0( 4*size-1 DOWNTO 3*size);
     WHEN "0100" =>
       result := inputs0( 5*size-1 DOWNTO 4*size);
     WHEN "0101" =>
       result := inputs0( 6*size-1 DOWNTO 5*size);
     WHEN "0110" =>
       result := inputs0( 7*size-1 DOWNTO 6*size);
     WHEN "0111" =>
       result := inputs0( 8*size-1 DOWNTO 7*size);
     WHEN "1000" =>
       result := inputs0( 9*size-1 DOWNTO 8*size);
     WHEN "1001" =>
       result := inputs0( 10*size-1 DOWNTO 9*size);
     WHEN "1010" =>
       result := inputs0( 11*size-1 DOWNTO 10*size);
     WHEN "1011" =>
       result := inputs0( 12*size-1 DOWNTO 11*size);
     WHEN "1100" =>
       result := inputs0( 13*size-1 DOWNTO 12*size);
     WHEN "1101" =>
       result := inputs0( 14*size-1 DOWNTO 13*size);
     WHEN "1110" =>
       result := inputs0( 15*size-1 DOWNTO 14*size);
     WHEN "1111" =>
       result := inputs0( 16*size-1 DOWNTO 15*size);
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END;
   
   FUNCTION mux_sel5_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(4 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'LENGTH / 32;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0 );
   BEGIN
     -- for synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "00000" =>
       result := inputs0( 1*size-1 DOWNTO 0*size);
     WHEN "00001" =>
       result := inputs0( 2*size-1 DOWNTO 1*size);
     WHEN "00010" =>
       result := inputs0( 3*size-1 DOWNTO 2*size);
     WHEN "00011" =>
       result := inputs0( 4*size-1 DOWNTO 3*size);
     WHEN "00100" =>
       result := inputs0( 5*size-1 DOWNTO 4*size);
     WHEN "00101" =>
       result := inputs0( 6*size-1 DOWNTO 5*size);
     WHEN "00110" =>
       result := inputs0( 7*size-1 DOWNTO 6*size);
     WHEN "00111" =>
       result := inputs0( 8*size-1 DOWNTO 7*size);
     WHEN "01000" =>
       result := inputs0( 9*size-1 DOWNTO 8*size);
     WHEN "01001" =>
       result := inputs0( 10*size-1 DOWNTO 9*size);
     WHEN "01010" =>
       result := inputs0( 11*size-1 DOWNTO 10*size);
     WHEN "01011" =>
       result := inputs0( 12*size-1 DOWNTO 11*size);
     WHEN "01100" =>
       result := inputs0( 13*size-1 DOWNTO 12*size);
     WHEN "01101" =>
       result := inputs0( 14*size-1 DOWNTO 13*size);
     WHEN "01110" =>
       result := inputs0( 15*size-1 DOWNTO 14*size);
     WHEN "01111" =>
       result := inputs0( 16*size-1 DOWNTO 15*size);
     WHEN "10000" =>
       result := inputs0( 17*size-1 DOWNTO 16*size);
     WHEN "10001" =>
       result := inputs0( 18*size-1 DOWNTO 17*size);
     WHEN "10010" =>
       result := inputs0( 19*size-1 DOWNTO 18*size);
     WHEN "10011" =>
       result := inputs0( 20*size-1 DOWNTO 19*size);
     WHEN "10100" =>
       result := inputs0( 21*size-1 DOWNTO 20*size);
     WHEN "10101" =>
       result := inputs0( 22*size-1 DOWNTO 21*size);
     WHEN "10110" =>
       result := inputs0( 23*size-1 DOWNTO 22*size);
     WHEN "10111" =>
       result := inputs0( 24*size-1 DOWNTO 23*size);
     WHEN "11000" =>
       result := inputs0( 25*size-1 DOWNTO 24*size);
     WHEN "11001" =>
       result := inputs0( 26*size-1 DOWNTO 25*size);
     WHEN "11010" =>
       result := inputs0( 27*size-1 DOWNTO 26*size);
     WHEN "11011" =>
       result := inputs0( 28*size-1 DOWNTO 27*size);
     WHEN "11100" =>
       result := inputs0( 29*size-1 DOWNTO 28*size);
     WHEN "11101" =>
       result := inputs0( 30*size-1 DOWNTO 29*size);
     WHEN "11110" =>
       result := inputs0( 31*size-1 DOWNTO 30*size);
     WHEN "11111" =>
       result := inputs0( 32*size-1 DOWNTO 31*size);
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END;
   
   FUNCTION mux_sel6_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(5 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'LENGTH / 64;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0);
   BEGIN
     -- for synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "000000" =>
       result := inputs0( 1*size-1 DOWNTO 0*size);
     WHEN "000001" =>
       result := inputs0( 2*size-1 DOWNTO 1*size);
     WHEN "000010" =>
       result := inputs0( 3*size-1 DOWNTO 2*size);
     WHEN "000011" =>
       result := inputs0( 4*size-1 DOWNTO 3*size);
     WHEN "000100" =>
       result := inputs0( 5*size-1 DOWNTO 4*size);
     WHEN "000101" =>
       result := inputs0( 6*size-1 DOWNTO 5*size);
     WHEN "000110" =>
       result := inputs0( 7*size-1 DOWNTO 6*size);
     WHEN "000111" =>
       result := inputs0( 8*size-1 DOWNTO 7*size);
     WHEN "001000" =>
       result := inputs0( 9*size-1 DOWNTO 8*size);
     WHEN "001001" =>
       result := inputs0( 10*size-1 DOWNTO 9*size);
     WHEN "001010" =>
       result := inputs0( 11*size-1 DOWNTO 10*size);
     WHEN "001011" =>
       result := inputs0( 12*size-1 DOWNTO 11*size);
     WHEN "001100" =>
       result := inputs0( 13*size-1 DOWNTO 12*size);
     WHEN "001101" =>
       result := inputs0( 14*size-1 DOWNTO 13*size);
     WHEN "001110" =>
       result := inputs0( 15*size-1 DOWNTO 14*size);
     WHEN "001111" =>
       result := inputs0( 16*size-1 DOWNTO 15*size);
     WHEN "010000" =>
       result := inputs0( 17*size-1 DOWNTO 16*size);
     WHEN "010001" =>
       result := inputs0( 18*size-1 DOWNTO 17*size);
     WHEN "010010" =>
       result := inputs0( 19*size-1 DOWNTO 18*size);
     WHEN "010011" =>
       result := inputs0( 20*size-1 DOWNTO 19*size);
     WHEN "010100" =>
       result := inputs0( 21*size-1 DOWNTO 20*size);
     WHEN "010101" =>
       result := inputs0( 22*size-1 DOWNTO 21*size);
     WHEN "010110" =>
       result := inputs0( 23*size-1 DOWNTO 22*size);
     WHEN "010111" =>
       result := inputs0( 24*size-1 DOWNTO 23*size);
     WHEN "011000" =>
       result := inputs0( 25*size-1 DOWNTO 24*size);
     WHEN "011001" =>
       result := inputs0( 26*size-1 DOWNTO 25*size);
     WHEN "011010" =>
       result := inputs0( 27*size-1 DOWNTO 26*size);
     WHEN "011011" =>
       result := inputs0( 28*size-1 DOWNTO 27*size);
     WHEN "011100" =>
       result := inputs0( 29*size-1 DOWNTO 28*size);
     WHEN "011101" =>
       result := inputs0( 30*size-1 DOWNTO 29*size);
     WHEN "011110" =>
       result := inputs0( 31*size-1 DOWNTO 30*size);
     WHEN "011111" =>
       result := inputs0( 32*size-1 DOWNTO 31*size);
     WHEN "100000" =>
       result := inputs0( 33*size-1 DOWNTO 32*size);
     WHEN "100001" =>
       result := inputs0( 34*size-1 DOWNTO 33*size);
     WHEN "100010" =>
       result := inputs0( 35*size-1 DOWNTO 34*size);
     WHEN "100011" =>
       result := inputs0( 36*size-1 DOWNTO 35*size);
     WHEN "100100" =>
       result := inputs0( 37*size-1 DOWNTO 36*size);
     WHEN "100101" =>
       result := inputs0( 38*size-1 DOWNTO 37*size);
     WHEN "100110" =>
       result := inputs0( 39*size-1 DOWNTO 38*size);
     WHEN "100111" =>
       result := inputs0( 40*size-1 DOWNTO 39*size);
     WHEN "101000" =>
       result := inputs0( 41*size-1 DOWNTO 40*size);
     WHEN "101001" =>
       result := inputs0( 42*size-1 DOWNTO 41*size);
     WHEN "101010" =>
       result := inputs0( 43*size-1 DOWNTO 42*size);
     WHEN "101011" =>
       result := inputs0( 44*size-1 DOWNTO 43*size);
     WHEN "101100" =>
       result := inputs0( 45*size-1 DOWNTO 44*size);
     WHEN "101101" =>
       result := inputs0( 46*size-1 DOWNTO 45*size);
     WHEN "101110" =>
       result := inputs0( 47*size-1 DOWNTO 46*size);
     WHEN "101111" =>
       result := inputs0( 48*size-1 DOWNTO 47*size);
     WHEN "110000" =>
       result := inputs0( 49*size-1 DOWNTO 48*size);
     WHEN "110001" =>
       result := inputs0( 50*size-1 DOWNTO 49*size);
     WHEN "110010" =>
       result := inputs0( 51*size-1 DOWNTO 50*size);
     WHEN "110011" =>
       result := inputs0( 52*size-1 DOWNTO 51*size);
     WHEN "110100" =>
       result := inputs0( 53*size-1 DOWNTO 52*size);
     WHEN "110101" =>
       result := inputs0( 54*size-1 DOWNTO 53*size);
     WHEN "110110" =>
       result := inputs0( 55*size-1 DOWNTO 54*size);
     WHEN "110111" =>
       result := inputs0( 56*size-1 DOWNTO 55*size);
     WHEN "111000" =>
       result := inputs0( 57*size-1 DOWNTO 56*size);
     WHEN "111001" =>
       result := inputs0( 58*size-1 DOWNTO 57*size);
     WHEN "111010" =>
       result := inputs0( 59*size-1 DOWNTO 58*size);
     WHEN "111011" =>
       result := inputs0( 60*size-1 DOWNTO 59*size);
     WHEN "111100" =>
       result := inputs0( 61*size-1 DOWNTO 60*size);
     WHEN "111101" =>
       result := inputs0( 62*size-1 DOWNTO 61*size);
     WHEN "111110" =>
       result := inputs0( 63*size-1 DOWNTO 62*size);
     WHEN "111111" =>
       result := inputs0( 64*size-1 DOWNTO 63*size);
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END;

   FUNCTION mux_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC) RETURN STD_LOGIC IS
   BEGIN RETURN TO_STDLOGIC(mux_v(inputs, sel)); END;

   FUNCTION mux_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
   BEGIN RETURN TO_STDLOGIC(mux_v(inputs, sel)); END;

   FUNCTION mux_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC) RETURN STD_LOGIC_VECTOR IS  --pragma hls_map_to_operator mux
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     CONSTANT size   : POSITIVE := inputs'LENGTH / 2;
     CONSTANT olen   : POSITIVE := inputs'LENGTH / 2;
     VARIABLE result : STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT inputs'LENGTH = olen * 2 SEVERITY FAILURE;
     --synopsys translate_on
       CASE sel IS
       WHEN '1'
     --synopsys translate_off
            | 'H'
     --synopsys translate_on
            =>
         result := inputs0( size-1 DOWNTO 0);
       WHEN '0' 
     --synopsys translate_off
            | 'L'
     --synopsys translate_on
            =>
         result := inputs0(2*size-1  DOWNTO size);
       WHEN others =>
         --synopsys translate_off
         result := resolve_std_logic_vector(inputs0(size-1 DOWNTO 0), inputs0( 2*size-1 DOWNTO size));
         --synopsys translate_on
       END CASE;
       RETURN result;
   END;
--   BEGIN RETURN mux_v(inputs, TO_STDLOGICVECTOR(sel)); END;

   FUNCTION mux_v(inputs: STD_LOGIC_VECTOR; sel : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS --pragma hls_map_to_operator mux
     ALIAS    inputs0: STD_LOGIC_VECTOR( inputs'LENGTH-1 DOWNTO 0) IS inputs;
     ALIAS    sel0   : STD_LOGIC_VECTOR( sel'LENGTH-1 DOWNTO 0 ) IS sel;

     VARIABLE sellen : INTEGER RANGE 2-sel'LENGTH TO sel'LENGTH;
     CONSTANT size   : POSITIVE := inputs'LENGTH / 2;
     CONSTANT olen   : POSITIVE := inputs'LENGTH / 2**sel'LENGTH;
     VARIABLE result : STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
     TYPE inputs_array_type is array(natural range <>) of std_logic_vector( olen - 1 DOWNTO 0);
     VARIABLE inputs_array : inputs_array_type( 2**sel'LENGTH - 1 DOWNTO 0);
   BEGIN
     sellen := sel'LENGTH;
     --synopsys translate_off
     ASSERT inputs'LENGTH = olen * 2**sellen SEVERITY FAILURE;
     sellen := 2-sellen;
     --synopsys translate_on
     CASE sellen IS
     WHEN 1 =>
       CASE sel0(0) IS

       WHEN '1' 
     --synopsys translate_off
            | 'H'
     --synopsys translate_on
            =>
         result := inputs0(  size-1 DOWNTO 0);
       WHEN '0' 
     --synopsys translate_off
            | 'L'
     --synopsys translate_on
            =>
         result := inputs0(2*size-1 DOWNTO size);
       WHEN others =>
         --synopsys translate_off
         result := resolve_std_logic_vector(inputs0( size-1 DOWNTO 0), inputs0( 2*size-1 DOWNTO size));
         --synopsys translate_on
       END CASE;
     WHEN 2 =>
       result := mux_sel2_v(inputs, not sel);
     WHEN 3 =>
       result := mux_sel3_v(inputs, not sel);
     WHEN 4 =>
       result := mux_sel4_v(inputs, not sel);
     WHEN 5 =>
       result := mux_sel5_v(inputs, not sel);
     WHEN 6 =>
       result := mux_sel6_v(inputs, not sel);
     WHEN others =>
       -- synopsys translate_off
       IF(Is_X(sel0)) THEN
         result := (others => 'X');
       ELSE
       -- synopsys translate_on
         FOR i in 0 to 2**sel'LENGTH - 1 LOOP
           inputs_array(i) := inputs0( ((i + 1) * olen) - 1  DOWNTO i*olen);
         END LOOP;
         result := inputs_array(CONV_INTEGER( (UNSIGNED(NOT sel0)) ));
       -- synopsys translate_off
       END IF;
       -- synopsys translate_on
     END CASE;
     RETURN result;
   END;

 
-----------------------------------------------------------------
-- Latches
-----------------------------------------------------------------

   FUNCTION lat_s(dinput: STD_LOGIC; clk: STD_LOGIC; doutput: STD_LOGIC) RETURN STD_LOGIC IS
   BEGIN RETURN mux_s(STD_LOGIC_VECTOR'(doutput & dinput), clk); END;

   FUNCTION lat_v(dinput: STD_LOGIC_VECTOR ; clk: STD_LOGIC; doutput: STD_LOGIC_VECTOR ) RETURN STD_LOGIC_VECTOR IS
   BEGIN
     --synopsys translate_off
     ASSERT dinput'LENGTH = doutput'LENGTH SEVERITY FAILURE;
     --synopsys translate_on
     RETURN mux_v(doutput & dinput, clk);
   END;

-----------------------------------------------------------------
-- Tri-States
-----------------------------------------------------------------
--   FUNCTION tri_s(dinput: STD_LOGIC; control: STD_LOGIC) RETURN STD_LOGIC IS
--   BEGIN RETURN TO_STDLOGIC(tri_v(TO_STDLOGICVECTOR(dinput), control)); END;
--
--   FUNCTION tri_v(dinput: STD_LOGIC_VECTOR ; control: STD_LOGIC) RETURN STD_LOGIC_VECTOR IS
--     VARIABLE result: STD_LOGIC_VECTOR(dinput'range);
--   BEGIN
--     CASE control IS
--     WHEN '0' | 'L' =>
--       result := (others => 'Z');
--     WHEN '1' | 'H' =>
--       FOR i IN dinput'range LOOP
--         result(i) := to_UX01(dinput(i));
--       END LOOP;
--     WHEN others =>
--       -- synopsys translate_off
--       result := (others => 'X');
--       -- synopsys translate_on
--     END CASE;
--     RETURN result;
--   END;

-----------------------------------------------------------------
-- compare functions returning STD_LOGIC
-- in contrast to the functions returning boolean
-----------------------------------------------------------------

   FUNCTION "=" (l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN not or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;
   FUNCTION "=" (l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN not or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;
   FUNCTION "/="(l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;
   FUNCTION "/="(l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;

   FUNCTION "<" (l, r: UNSIGNED) RETURN STD_LOGIC IS
     VARIABLE diff: UNSIGNED(l'LENGTH DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT l'LENGTH = r'LENGTH SEVERITY FAILURE;
     --synopsys translate_on
     diff := ('0'&l) - ('0'&r);
     RETURN diff(l'LENGTH);
   END;
   FUNCTION "<"(l, r: SIGNED  ) RETURN STD_LOGIC IS
   BEGIN
     RETURN (UNSIGNED(l) < UNSIGNED(r)) xor (l(l'LEFT) xor r(r'LEFT));
   END;

   FUNCTION "<="(l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(r < l); END;
   FUNCTION "<=" (l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(r < l); END;
   FUNCTION ">" (l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN r < l; END;
   FUNCTION ">"(l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN r < l; END;
   FUNCTION ">="(l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(l < r); END;
   FUNCTION ">=" (l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(l < r); END;

   FUNCTION cmp (l, r: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
   BEGIN
     --synopsys translate_off
     ASSERT l'LENGTH = r'LENGTH SEVERITY FAILURE;
     --synopsys translate_on
     RETURN not or_s(l xor r);
   END;

-----------------------------------------------------------------
-- Vectorized Overloaded Arithmetic Operators
-----------------------------------------------------------------

   --some functions to placate spyglass
   FUNCTION mult_natural(a,b : NATURAL) RETURN NATURAL IS
   BEGIN
     return a*b;
   END mult_natural;

   FUNCTION div_natural(a,b : NATURAL) RETURN NATURAL IS
   BEGIN
     return a/b;
   END div_natural;

   FUNCTION mod_natural(a,b : NATURAL) RETURN NATURAL IS
   BEGIN
     return a mod b;
   END mod_natural;

   FUNCTION add_unsigned(a,b : UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return a+b;
   END add_unsigned;

   FUNCTION sub_unsigned(a,b : UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return a-b;
   END sub_unsigned;

   FUNCTION sub_int(a,b : INTEGER) RETURN INTEGER IS
   BEGIN
     return a-b;
   END sub_int;

   FUNCTION concat_0(b : UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return '0' & b;
   END concat_0;

   FUNCTION concat_uns(a,b : UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return a&b;
   END concat_uns;

   FUNCTION concat_vect(a,b : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
   BEGIN
     return a&b;
   END concat_vect;





   FUNCTION faccu(arg: UNSIGNED; width: NATURAL) RETURN UNSIGNED IS
     CONSTANT ninps : NATURAL := arg'LENGTH / width;
     ALIAS    arg0  : UNSIGNED(arg'LENGTH-1 DOWNTO 0) IS arg;
     VARIABLE result: UNSIGNED(width-1 DOWNTO 0);
     VARIABLE from  : INTEGER;
     VARIABLE dto   : INTEGER;
   BEGIN
     --synopsys translate_off
     ASSERT arg'LENGTH = width * ninps SEVERITY FAILURE;
     --synopsys translate_on
     result := (OTHERS => '0');
     FOR i IN ninps-1 DOWNTO 0 LOOP
       --result := result + arg0((i+1)*width-1 DOWNTO i*width);
       from := mult_natural((i+1), width)-1; --2.1.6.3
       dto  := mult_natural(i,width); --2.1.6.3
       result := add_unsigned(result , arg0(from DOWNTO dto) );
     END LOOP;
     RETURN result;
   END faccu;

   FUNCTION  fabs (arg1: SIGNED) RETURN UNSIGNED IS
   BEGIN
     CASE arg1(arg1'LEFT) IS
     WHEN '1'
     --synopsys translate_off
          | 'H'
     --synopsys translate_on
       =>
       RETURN UNSIGNED'("0") - UNSIGNED(arg1);
     WHEN '0'
     --synopsys translate_off
          | 'L'
     --synopsys translate_on
       =>
       RETURN UNSIGNED(arg1);
     WHEN others =>
       RETURN resolve_unsigned(UNSIGNED(arg1), UNSIGNED'("0") - UNSIGNED(arg1));
     END CASE;
   END;

   PROCEDURE divmod(l, r: UNSIGNED; rdiv, rmod: OUT UNSIGNED) IS
     CONSTANT llen: INTEGER := l'LENGTH;
     CONSTANT rlen: INTEGER := r'LENGTH;
     CONSTANT llen_plus_rlen: INTEGER := llen + rlen;
     VARIABLE lbuf: UNSIGNED(llen+rlen-1 DOWNTO 0);
     VARIABLE diff: UNSIGNED(rlen DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT rdiv'LENGTH = llen AND rmod'LENGTH = rlen SEVERITY FAILURE;
     --synopsys translate_on
     lbuf := (others => '0');
     lbuf(llen-1 DOWNTO 0) := l;
     FOR i IN rdiv'range LOOP
       diff := sub_unsigned(lbuf(llen_plus_rlen-1 DOWNTO llen-1) ,(concat_0(r)));
       rdiv(i) := not diff(rlen);
       IF diff(rlen) = '0' THEN
         lbuf(llen_plus_rlen-1 DOWNTO llen-1) := diff;
       END IF;
       lbuf(llen_plus_rlen-1 DOWNTO 1) := lbuf(llen_plus_rlen-2 DOWNTO 0);
     END LOOP;
     rmod := lbuf(llen_plus_rlen-1 DOWNTO llen);
   END divmod;

   FUNCTION "/"  (l, r: UNSIGNED) RETURN UNSIGNED IS
     VARIABLE rdiv: UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'LENGTH-1 DOWNTO 0);
   BEGIN
     divmod(l, r, rdiv, rmod);
     RETURN rdiv;
   END "/";

   FUNCTION "MOD"(l, r: UNSIGNED) RETURN UNSIGNED IS
     VARIABLE rdiv: UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'LENGTH-1 DOWNTO 0);
   BEGIN
     divmod(l, r, rdiv, rmod);
     RETURN rmod;
   END;

   FUNCTION "REM"(l, r: UNSIGNED) RETURN UNSIGNED IS
     BEGIN RETURN l MOD r; END;

   FUNCTION "/"  (l, r: SIGNED  ) RETURN SIGNED  IS
     VARIABLE rdiv: UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'LENGTH-1 DOWNTO 0);
   BEGIN
     divmod(fabs(l), fabs(r), rdiv, rmod);
     IF to_X01(l(l'LEFT)) /= to_X01(r(r'LEFT)) THEN
       rdiv := UNSIGNED'("0") - rdiv;
     END IF;
     RETURN SIGNED(rdiv); -- overflow problem "1000" / "11"
   END "/";

   FUNCTION "MOD"(l, r: SIGNED  ) RETURN SIGNED  IS
     VARIABLE rdiv: UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'LENGTH-1 DOWNTO 0);
     CONSTANT rnul: UNSIGNED(r'LENGTH-1 DOWNTO 0) := (others => '0');
   BEGIN
     divmod(fabs(l), fabs(r), rdiv, rmod);
     IF to_X01(l(l'LEFT)) = '1' THEN
       rmod := UNSIGNED'("0") - rmod;
     END IF;
     IF rmod /= rnul AND to_X01(l(l'LEFT)) /= to_X01(r(r'LEFT)) THEN
       rmod := UNSIGNED(r) + rmod;
     END IF;
     RETURN SIGNED(rmod);
   END "MOD";

   FUNCTION "REM"(l, r: SIGNED  ) RETURN SIGNED  IS
     VARIABLE rdiv: UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'LENGTH-1 DOWNTO 0);
   BEGIN
     divmod(fabs(l), fabs(r), rdiv, rmod);
     IF to_X01(l(l'LEFT)) = '1' THEN
       rmod := UNSIGNED'("0") - rmod;
     END IF;
     RETURN SIGNED(rmod);
   END "REM";

   FUNCTION mult_unsigned(l,r : UNSIGNED) return UNSIGNED is
   BEGIN
     return l*r; 
   END mult_unsigned;

   FUNCTION "**" (l, r : UNSIGNED) RETURN UNSIGNED IS
     CONSTANT llen  : NATURAL := l'LENGTH;
     VARIABLE result: UNSIGNED(llen-1 DOWNTO 0);
     VARIABLE fak   : UNSIGNED(llen-1 DOWNTO 0);
   BEGIN
     fak := l;
     result := (others => '0'); result(0) := '1';
     FOR i IN r'reverse_range LOOP
       --was:result := UNSIGNED(mux_v(STD_LOGIC_VECTOR(result & (result*fak)), r(i)));
       result := UNSIGNED(mux_v(STD_LOGIC_VECTOR( concat_uns(result , mult_unsigned(result,fak) )), r(i)));

       fak := mult_unsigned(fak , fak);
     END LOOP;
     RETURN result;
   END "**";

   FUNCTION "**" (l, r : SIGNED) RETURN SIGNED IS
     CONSTANT rlen  : NATURAL := r'LENGTH;
     ALIAS    r0    : SIGNED(0 TO r'LENGTH-1) IS r;
     VARIABLE result: SIGNED(l'range);
   BEGIN
     CASE r(r'LEFT) IS
     WHEN '0'
   --synopsys translate_off
          | 'L'
   --synopsys translate_on
     =>
       result := SIGNED(UNSIGNED(l) ** UNSIGNED(r0(1 TO r'LENGTH-1)));
     WHEN '1'
   --synopsys translate_off
          | 'H'
   --synopsys translate_on
     =>
       result := (others => '0');
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END "**";

-----------------------------------------------------------------
--               S H I F T   F U C T I O N S
-- negative shift shifts the opposite direction
-----------------------------------------------------------------

   FUNCTION add_nat(arg1 : NATURAL; arg2 : NATURAL ) RETURN NATURAL IS
   BEGIN
     return (arg1 + arg2);
   END;
   
--   FUNCTION UNSIGNED_2_BIT_VECTOR(arg1 : NATURAL; arg2 : NATURAL ) RETURN BIT_VECTOR IS
--   BEGIN
--     return (arg1 + arg2);
--   END;
   
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shl(result, arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshl_stdar(arg1: SIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: SIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shl(SIGNED(result), arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shr(result, arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshr_stdar(arg1: SIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: SIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shr(result, arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg1l: NATURAL := arg1'LENGTH - 1;
     ALIAS    arg1x: UNSIGNED(arg1l DOWNTO 0) IS arg1;
     CONSTANT arg2l: NATURAL := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE arg1x_pad: UNSIGNED(arg1l+1 DOWNTO 0);
     VARIABLE result: UNSIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others=>'0');
     arg1x_pad(arg1l+1) := sbit;
     arg1x_pad(arg1l downto 0) := arg1x;
     IF arg2l = 0 THEN
       RETURN fshr_stdar(arg1x_pad, UNSIGNED(arg2x), sbit, olen);
     -- ELSIF arg1l = 0 THEN
     --   RETURN fshl(sbit & arg1x, arg2x, sbit, olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
     --synopsys translate_off
            | 'L'
     --synopsys translate_on
       =>
         RETURN fshl_stdar(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1'
     --synopsys translate_off
            | 'H'
     --synopsys translate_on
       =>
         RETURN fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN others =>
         --synopsys translate_off
         result := resolve_unsigned(
           fshl_stdar(arg1x, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit,  olen),
           fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen)
         );
         --synopsys translate_on
         RETURN result;
       END CASE;
     END IF;
   END;

   FUNCTION fshl_stdar(arg1: SIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
     CONSTANT arg1l: NATURAL := arg1'LENGTH - 1;
     ALIAS    arg1x: SIGNED(arg1l DOWNTO 0) IS arg1;
     CONSTANT arg2l: NATURAL := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE arg1x_pad: SIGNED(arg1l+1 DOWNTO 0);
     VARIABLE result: SIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others=>'0');
     arg1x_pad(arg1l+1) := sbit;
     arg1x_pad(arg1l downto 0) := arg1x;
     IF arg2l = 0 THEN
       RETURN fshr_stdar(arg1x_pad, UNSIGNED(arg2x), sbit, olen);
     -- ELSIF arg1l = 0 THEN
     --   RETURN fshl(sbit & arg1x, arg2x, sbit, olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
       --synopsys translate_off
            | 'L'
       --synopsys translate_on
       =>
         RETURN fshl_stdar(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1'
       --synopsys translate_off
            | 'H'
       --synopsys translate_on
       =>
         RETURN fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN others =>
         --synopsys translate_off
         result := resolve_signed(
           fshl_stdar(arg1x, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit,  olen),
           fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen)
         );
         --synopsys translate_on
         RETURN result;
       END CASE;
     END IF;
   END;

   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg2l: INTEGER := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE result: UNSIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others => '0');
     IF arg2l = 0 THEN
       RETURN fshl_stdar(arg1, UNSIGNED(arg2x), olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
       --synopsys translate_off
            | 'L'
       --synopsys translate_on
        =>
         RETURN fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1'
       --synopsys translate_off
            | 'H'
       --synopsys translate_on
        =>
         RETURN fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen);
       WHEN others =>
         --synopsys translate_off
         result := resolve_unsigned(
           fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen),
           fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen)
         );
         --synopsys translate_on
	 return result;
       END CASE;
     END IF;
   END;

   FUNCTION fshr_stdar(arg1: SIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
     CONSTANT arg2l: INTEGER := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE result: SIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others => '0');
     IF arg2l = 0 THEN
       RETURN fshl_stdar(arg1, UNSIGNED(arg2x), olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
       --synopsys translate_off
            | 'L'
       --synopsys translate_on
       =>
         RETURN fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1'
       --synopsys translate_off
            | 'H'
       --synopsys translate_on
       =>
         RETURN fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen);
       WHEN others =>
         --synopsys translate_off
         result := resolve_signed(
           fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen),
           fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen)
         );
         --synopsys translate_on
	 return result;
       END CASE;
     END IF;
   END;

   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl_stdar(arg1, arg2, '0', olen); END;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr_stdar(arg1, arg2, '0', olen); END;
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl_stdar(arg1, arg2, '0', olen); END;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr_stdar(arg1, arg2, '0', olen); END;

   FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshl_stdar(arg1, arg2, arg1(arg1'LEFT), olen); END;
   FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshr_stdar(arg1, arg2, arg1(arg1'LEFT), olen); END;
   FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshl_stdar(arg1, arg2, arg1(arg1'LEFT), olen); END;
   FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshr_stdar(arg1, arg2, arg1(arg1'LEFT), olen); END;


   FUNCTION fshl(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
     VARIABLE temp: UNSIGNED(len-1 DOWNTO 0);
     --SUBTYPE  sw_range IS NATURAL range 1 TO len;
     VARIABLE sw: NATURAL range 1 TO len;
     VARIABLE temp_idx : INTEGER; --2.1.6.3
   BEGIN
     sw := 1;
     result := (others => sbit);
     result(ilen-1 DOWNTO 0) := arg1;
     FOR i IN arg2'reverse_range LOOP
       temp := (others => '0');
       FOR i2 IN len-1-sw DOWNTO 0 LOOP
         --was:temp(i2+sw) := result(i2);
         temp_idx := add_nat(i2,sw);
         temp(temp_idx) := result(i2);
       END LOOP;
       result := UNSIGNED(mux_v(STD_LOGIC_VECTOR(concat_uns(result,temp)), arg2(i)));
       sw := minimum(mult_natural(sw,2), len);
     END LOOP;
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshr(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
     VARIABLE temp: UNSIGNED(len-1 DOWNTO 0);
     SUBTYPE  sw_range IS NATURAL range 1 TO len;
     VARIABLE sw: sw_range;
     VARIABLE result_idx : INTEGER; --2.1.6.3
   BEGIN
     sw := 1;
     result := (others => sbit);
     result(ilen-1 DOWNTO 0) := arg1;
     FOR i IN arg2'reverse_range LOOP
       temp := (others => sbit);
       FOR i2 IN len-1-sw DOWNTO 0 LOOP
         -- was: temp(i2) := result(i2+sw);
         result_idx := add_nat(i2,sw);
         temp(i2) := result(result_idx);
       END LOOP;
       result := UNSIGNED(mux_v(STD_LOGIC_VECTOR(concat_uns(result,temp)), arg2(i)));
       sw := minimum(mult_natural(sw,2), len);
     END LOOP;
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshl(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg1l: NATURAL := arg1'LENGTH - 1;
     ALIAS    arg1x: UNSIGNED(arg1l DOWNTO 0) IS arg1;
     CONSTANT arg2l: NATURAL := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE arg1x_pad: UNSIGNED(arg1l+1 DOWNTO 0);
     VARIABLE result: UNSIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others=>'0');
     arg1x_pad(arg1l+1) := sbit;
     arg1x_pad(arg1l downto 0) := arg1x;
     IF arg2l = 0 THEN
       RETURN fshr(arg1x_pad, UNSIGNED(arg2x), sbit, olen);
     -- ELSIF arg1l = 0 THEN
     --   RETURN fshl(sbit & arg1x, arg2x, sbit, olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
       --synopsys translate_off
            | 'L'
       --synopsys translate_on
       =>
         RETURN fshl(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);

       WHEN '1'
       --synopsys translate_off
            | 'H'
       --synopsys translate_on
       =>
         RETURN fshr(arg1x_pad(arg1l+1 DOWNTO 1), not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);

       WHEN others =>
         --synopsys translate_off
         result := resolve_unsigned(
           fshl(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit,  olen),
           fshr(arg1x_pad(arg1l+1 DOWNTO 1), not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen)
         );
         --synopsys translate_on
         RETURN result;
       END CASE;
     END IF;
   END;

   FUNCTION fshr(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg2l: INTEGER := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE result: UNSIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others => '0');
     IF arg2l = 0 THEN
       RETURN fshl(arg1, UNSIGNED(arg2x), olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
       --synopsys translate_off
            | 'L'
       --synopsys translate_on
       =>
         RETURN fshr(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);

       WHEN '1'
       --synopsys translate_off
            | 'H'
       --synopsys translate_on
       =>
         RETURN fshl(arg1 & '0', not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen);
       WHEN others =>
         --synopsys translate_off
         result := resolve_unsigned(
           fshr(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen),
           fshl(arg1 & '0', not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen)
         );
         --synopsys translate_on
	 return result;
       END CASE;
     END IF;
   END;

   FUNCTION fshl(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl(arg1, arg2, '0', olen); END;
   FUNCTION fshr(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr(arg1, arg2, '0', olen); END;
   FUNCTION fshl(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl(arg1, arg2, '0', olen); END;
   FUNCTION fshr(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr(arg1, arg2, '0', olen); END;

   FUNCTION fshl(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshl(UNSIGNED(arg1), arg2, arg1(arg1'LEFT), olen)); END;
   FUNCTION fshr(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshr(UNSIGNED(arg1), arg2, arg1(arg1'LEFT), olen)); END;
   FUNCTION fshl(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshl(UNSIGNED(arg1), arg2, arg1(arg1'LEFT), olen)); END;
   FUNCTION fshr(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshr(UNSIGNED(arg1), arg2, arg1(arg1'LEFT), olen)); END;


   FUNCTION frot(arg1: STD_LOGIC_VECTOR; arg2: STD_LOGIC_VECTOR; signd2: BOOLEAN; sdir: INTEGER range -1 TO 1) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len: INTEGER := arg1'LENGTH;
     VARIABLE result: STD_LOGIC_VECTOR(len-1 DOWNTO 0);
     VARIABLE temp: STD_LOGIC_VECTOR(len-1 DOWNTO 0);
     SUBTYPE sw_range IS NATURAL range 0 TO len-1;
     VARIABLE sw: sw_range;
     VARIABLE temp_idx : INTEGER; --2.1.6.3
   BEGIN
     result := (others=>'0');
     result := arg1;
     sw := sdir MOD len;
     FOR i IN arg2'reverse_range LOOP
       EXIT WHEN sw = 0;
       IF signd2 AND i = arg2'LEFT THEN 
         sw := sub_int(len,sw); 
       END IF;
       -- temp := result(len-sw-1 DOWNTO 0) & result(len-1 DOWNTO len-sw)
       FOR i2 IN len-1 DOWNTO 0 LOOP
         --was: temp((i2+sw) MOD len) := result(i2);
         temp_idx := add_nat(i2,sw) MOD len;
         temp(temp_idx) := result(i2);
       END LOOP;
       result := mux_v(STD_LOGIC_VECTOR(concat_vect(result,temp)), arg2(i));
       sw := mod_natural(mult_natural(sw,2), len);
     END LOOP;
     RETURN result;
   END frot;

   FUNCTION frol(arg1: STD_LOGIC_VECTOR; arg2: UNSIGNED) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), FALSE, 1); END;
   FUNCTION fror(arg1: STD_LOGIC_VECTOR; arg2: UNSIGNED) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), FALSE, -1); END;
   FUNCTION frol(arg1: STD_LOGIC_VECTOR; arg2: SIGNED  ) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), TRUE, 1); END;
   FUNCTION fror(arg1: STD_LOGIC_VECTOR; arg2: SIGNED  ) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), TRUE, -1); END;

-----------------------------------------------------------------
-- indexing functions: LSB always has index 0
-----------------------------------------------------------------

   FUNCTION readindex(vec: STD_LOGIC_VECTOR; index: INTEGER                 ) RETURN STD_LOGIC IS
     CONSTANT len : INTEGER := vec'LENGTH;
     ALIAS    vec0: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS vec;
   BEGIN
     IF index >= len OR index < 0 THEN
       RETURN 'X';
     END IF;
     RETURN vec0(index);
   END;

   FUNCTION readslice(vec: STD_LOGIC_VECTOR; index: INTEGER; width: POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len : INTEGER := vec'LENGTH;
     CONSTANT indexPwidthM1 : INTEGER := index+width-1; --2.1.6.3
     ALIAS    vec0: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS vec;
     CONSTANT xxx : STD_LOGIC_VECTOR(width-1 DOWNTO 0) := (others => 'X');
   BEGIN
     IF index+width > len OR index < 0 THEN
       RETURN xxx;
     END IF;
     RETURN vec0(indexPwidthM1 DOWNTO index);
   END;

   FUNCTION writeindex(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC       ; index: INTEGER) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len : INTEGER := vec'LENGTH;
     VARIABLE vec0: STD_LOGIC_VECTOR(len-1 DOWNTO 0);
     CONSTANT xxx : STD_LOGIC_VECTOR(len-1 DOWNTO 0) := (others => 'X');
   BEGIN
     vec0 := vec;
     IF index >= len OR index < 0 THEN
       RETURN xxx;
     END IF;
     vec0(index) := dinput;
     RETURN vec0;
   END;

   FUNCTION n_bits(p: NATURAL) RETURN POSITIVE IS
     VARIABLE n_b : POSITIVE;
     VARIABLE p_v : NATURAL;
   BEGIN
     p_v := p;
     FOR i IN 1 TO 32 LOOP
       p_v := div_natural(p_v,2);
       n_b := i;
       EXIT WHEN (p_v = 0);
     END LOOP;
     RETURN n_b;
   END;


--   FUNCTION writeslice(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC_VECTOR; index: INTEGER) RETURN STD_LOGIC_VECTOR IS
--
--     CONSTANT vlen: INTEGER := vec'LENGTH;
--     CONSTANT ilen: INTEGER := dinput'LENGTH;
--     CONSTANT max_shift: INTEGER := vlen-ilen;
--     CONSTANT ones: UNSIGNED(ilen-1 DOWNTO 0) := (others => '1');
--     CONSTANT xxx : STD_LOGIC_VECTOR(vlen-1 DOWNTO 0) := (others => 'X');
--     VARIABLE shift : UNSIGNED(n_bits(max_shift)-1 DOWNTO 0);
--     VARIABLE vec0: STD_LOGIC_VECTOR(vlen-1 DOWNTO 0);
--     VARIABLE inp: UNSIGNED(vlen-1 DOWNTO 0);
--     VARIABLE mask: UNSIGNED(vlen-1 DOWNTO 0);
--   BEGIN
--     inp := (others => '0');
--     mask := (others => '0');
--
--     IF index > max_shift OR index < 0 THEN
--       RETURN xxx;
--     END IF;
--
--     shift := CONV_UNSIGNED(index, shift'LENGTH);
--     inp(ilen-1 DOWNTO 0) := UNSIGNED(dinput);
--     mask(ilen-1 DOWNTO 0) := ones;
--     inp := fshl(inp, shift, vlen);
--     mask := fshl(mask, shift, vlen);
--     vec0 := (vec and (not STD_LOGIC_VECTOR(mask))) or STD_LOGIC_VECTOR(inp);
--     RETURN vec0;
--   END;

   FUNCTION writeslice(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC_VECTOR; enable: STD_LOGIC_VECTOR; byte_width: INTEGER;  index: INTEGER) RETURN STD_LOGIC_VECTOR IS

     type enable_matrix is array (0 to enable'LENGTH-1 ) of std_logic_vector(byte_width-1 downto 0);
     CONSTANT vlen: INTEGER := vec'LENGTH;
     CONSTANT ilen: INTEGER := dinput'LENGTH;
     CONSTANT max_shift: INTEGER := vlen-ilen;
     CONSTANT ones: UNSIGNED(ilen-1 DOWNTO 0) := (others => '1');
     CONSTANT xxx : STD_LOGIC_VECTOR(vlen-1 DOWNTO 0) := (others => 'X');
     VARIABLE shift : UNSIGNED(n_bits(max_shift)-1 DOWNTO 0);
     VARIABLE vec0: STD_LOGIC_VECTOR(vlen-1 DOWNTO 0);
     VARIABLE inp: UNSIGNED(vlen-1 DOWNTO 0);
     VARIABLE mask: UNSIGNED(vlen-1 DOWNTO 0);
     VARIABLE mask2: UNSIGNED(vlen-1 DOWNTO 0);
     VARIABLE enables: enable_matrix;
     VARIABLE cat_enables: STD_LOGIC_VECTOR(ilen-1 DOWNTO 0 );
     VARIABLE lsbi : INTEGER;
     VARIABLE msbi : INTEGER;

   BEGIN
     cat_enables := (others => '0');
     lsbi := 0;
     msbi := byte_width-1;
     inp := (others => '0');
     mask := (others => '0');

     IF index > max_shift OR index < 0 THEN
       RETURN xxx;
     END IF;

     --initialize enables
     for i in 0 TO (enable'LENGTH-1) loop
       enables(i)  := (others => enable(i));
       cat_enables(msbi downto lsbi) := enables(i) ;
       lsbi := msbi+1;
       msbi := msbi+byte_width;
     end loop;


     shift := CONV_UNSIGNED(index, shift'LENGTH);
     inp(ilen-1 DOWNTO 0) := UNSIGNED(dinput);
     mask(ilen-1 DOWNTO 0) := UNSIGNED((STD_LOGIC_VECTOR(ones) AND cat_enables));
     inp := fshl(inp, shift, vlen);
     mask := fshl(mask, shift, vlen);
     vec0 := (vec and (not STD_LOGIC_VECTOR(mask))) or STD_LOGIC_VECTOR(inp);
     RETURN vec0;
   END;


   FUNCTION ceil_log2(size : NATURAL) return NATURAL is
     VARIABLE cnt : NATURAL;
     VARIABLE res : NATURAL;
   begin
     cnt := 1;
     res := 0;
     while (cnt < size) loop
       res := res + 1;
       cnt := 2 * cnt;
     end loop;
     return res;
   END;
   
   FUNCTION bits(size : NATURAL) return NATURAL is
   begin
     return ceil_log2(size);
   END;

   PROCEDURE csa(a, b, c: IN INTEGER; s, cout: OUT STD_LOGIC_VECTOR) IS
   BEGIN
     s    := conv_std_logic_vector(a, s'LENGTH) xor conv_std_logic_vector(b, s'LENGTH) xor conv_std_logic_vector(c, s'LENGTH);
     cout := ( (conv_std_logic_vector(a, cout'LENGTH) and conv_std_logic_vector(b, cout'LENGTH)) or (conv_std_logic_vector(a, cout'LENGTH) and conv_std_logic_vector(c, cout'LENGTH)) or (conv_std_logic_vector(b, cout'LENGTH) and conv_std_logic_vector(c, cout'LENGTH)) );
   END PROCEDURE csa;

   PROCEDURE csha(a, b: IN INTEGER; s, cout: OUT STD_LOGIC_VECTOR) IS
   BEGIN
     s    := conv_std_logic_vector(a, s'LENGTH) xor conv_std_logic_vector(b, s'LENGTH);
     cout := (conv_std_logic_vector(a, cout'LENGTH) and conv_std_logic_vector(b, cout'LENGTH));
   END PROCEDURE csha;

END funcs;

--------> /softl3/catapultc10_0a/64bit/Mgc_home/pkgs/siflibs/mgc_ioport_comps_v11.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2015 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------


--------------------------------------------------------------------
--                M G C _ I O P O R T _ C O M P S
--------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE mgc_ioport_comps_v11 IS

-- INPUT COMPONENTS

COMPONENT mgc_in_wire_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    z        : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_in_wire_en_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_in_wire_wait_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : IN  std_logic_vector(width-1 DOWNTO 0)
   );
END COMPONENT;

COMPONENT mgc_chan_in_v2
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    sz_width : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : IN  std_logic_vector(width-1 DOWNTO 0);
    sd       : OUT std_logic_vector(sz_width-1 DOWNTO 0);
    sld      : IN  std_logic;
    sz       : IN std_logic_vector(sz_width-1 DOWNTO 0);
    slz      : OUT std_logic
   );
END COMPONENT;

COMPONENT mgc_in_wire_wait_nb_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    sz_width : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : IN  std_logic_vector(width-1 DOWNTO 0);
    sd       : OUT   std_logic_vector(sz_width-1 DOWNTO 0);
    sld      : in    std_logic
  );
END COMPONENT;

-- OUTPUT COMPONENTS

COMPONENT mgc_out_stdreg_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_stdreg_en_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;


COMPONENT mgc_out_stdreg_wait_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_dreg_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_reg_pos_v2
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_reg_neg_v2
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_reg_v3
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_buf_wait_v4
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_fifo_wait_v9
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    fifo_sz  : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1;
    ph_log2  : INTEGER
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

-- implementation for mgc_out_fifo_wait
COMPONENT mgc_out_fifo_wait_core_v9
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    sz_width : INTEGER;
    fifo_sz  : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1;
    ph_log2  : INTEGER
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0);
    sd       : OUT std_logic_vector(sz_width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_prereg_en_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

-- INOUT COMPONENTS

COMPONENT mgc_inout_dreg_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    zin      : IN    std_logic_vector(width-1 DOWNTO 0);
    zout     : OUT   std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_inout_stdreg_en_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ldin     : IN    std_logic;
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    ldout    : IN    std_logic;
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    lzin     : OUT   std_logic;
    zin      : IN    std_logic_vector(width-1 DOWNTO 0);
    lzout    : OUT   std_logic;
    zout     : OUT   std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_inout_stdreg_wait_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic;
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic;
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    lzin     : OUT   std_logic;
    vzin     : IN    std_logic;
    zin      : IN    std_logic_vector(width-1 DOWNTO 0);
    lzout    : OUT   std_logic;
    vzout    : IN    std_logic;
    zout     : OUT   std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_hid_tribuf_v1
  GENERIC (
    width    : INTEGER
  );
  PORT ( 
    I_SIG    : IN     std_logic_vector(width-1 DOWNTO 0);
    ENABLE   : IN     boolean ;
    O_SIG    : OUT    std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_inout_buf_wait_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN    std_logic;
    en       : IN    std_logic;
    arst     : IN    std_logic;
    srst     : IN    std_logic;
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic;
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic;
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    lzin     : OUT   std_logic;
    vzin     : IN    std_logic;
    zin      : IN    std_logic_vector(width-1 DOWNTO 0);
    lzout    : OUT   std_logic;
    vzout    : IN    std_logic;
    zout     : OUT   std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_inout_fifo_wait_v2
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    fifo_sz  : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1;
    ph_log2  : INTEGER
  );
  PORT (
    clk      : IN    std_logic;
    en       : IN    std_logic;
    arst     : IN    std_logic;
    srst     : IN    std_logic;
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic;
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic;
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    lzin     : OUT   std_logic;
    vzin     : IN    std_logic;
    zin      : IN    std_logic_vector(width-1 DOWNTO 0);
    lzout    : OUT   std_logic;
    vzout    : IN    std_logic;
    zout     : OUT   std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

-- IO SYNCHRONIZATION

COMPONENT mgc_io_sync_v1
  GENERIC (
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    ld       : IN    std_logic;
    lz       : OUT   std_logic
  );
END COMPONENT;

-- IO SYNCHRONIZATION

COMPONENT mgc_in_sync_v1
  GENERIC (
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    vd       : OUT   std_logic;
    vz       : IN    std_logic
  );
END COMPONENT;

-- PIPE

COMPONENT mgc_bsync_rdy_v1
  GENERIC (
    rscid    : INTEGER;
    ready    : INTEGER RANGE 0 TO 1;
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    rd       : IN    std_logic;
    rz       : OUT   std_logic
  );
END COMPONENT;

COMPONENT mgc_bsync_vld_v1
  GENERIC (
    rscid    : INTEGER;
    ready    : INTEGER RANGE 0 TO 1;
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    vd       : OUT   std_logic;
    vz       : IN    std_logic
  );
END COMPONENT;

COMPONENT mgc_bsync_rv_v1
  GENERIC (
    rscid    : INTEGER;
    ready    : INTEGER RANGE 0 TO 1;
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    rd       : IN    std_logic;
    vd       : OUT   std_logic;
    rz       : OUT   std_logic;
    vz       : IN    std_logic
  );
END COMPONENT;

-- PIPE

COMPONENT mgc_pipe_v10
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    sz_width : INTEGER;
    fifo_sz  : INTEGER;
    log2_sz  : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN    std_logic;
    en       : IN    std_logic;
    arst     : IN    std_logic;
    srst     : IN    std_logic;
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic;
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic;
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    sd       : OUT   std_logic_vector(sz_width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_sync_v1
  PORT (
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic;
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic
  );
END COMPONENT;

COMPONENT ccs_event_chan_v1 IS
  GENERIC (
    rscid    : INTEGER
  );
  PORT (
    ldout    : IN    std_logic;
    vdin     : OUT   std_logic
  );
END COMPONENT;

COMPONENT ccs_event_in_v1 IS
  GENERIC (
    rscid    : INTEGER
  );
  PORT (
    vzin : IN    std_logic;
    vdin : OUT   std_logic
  );
END COMPONENT;

COMPONENT ccs_event_out_v1 IS
  GENERIC (
    rscid    : INTEGER
  );
  PORT (
    ldout    : IN    std_logic;
    lzout    : OUT   std_logic
  );
END COMPONENT;

COMPONENT ccs_sync_chan_v1 IS
  GENERIC (
    rscid    : INTEGER
  );
  PORT (
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic;
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic
  );
END COMPONENT;

COMPONENT ccs_sync_in_v1 IS
  GENERIC (
    rscid    : INTEGER
  );
  PORT (
    vzin : IN    std_logic;
    lzin : OUT   std_logic;
    ldin : IN    std_logic;
    vdin : OUT   std_logic
  );
END COMPONENT;

COMPONENT ccs_sync_out_v1 IS
  GENERIC (
    rscid    : INTEGER
  );
  PORT (
    ldout : IN    std_logic;
    vdout : OUT   std_logic;
    lzout : OUT   std_logic;
    vzout : IN    std_logic
  );
END COMPONENT;


-- The start of the asynch CDC components
COMPONENT mgc_regfile_pos_v1
generic
(
  data_width   : integer;
  addr_width   : integer;
  num_of_words : integer;
  ph_en        : integer RANGE 0 to 1;
  ph_arst      : integer RANGE 0 to 1;
  ph_srst      : integer RANGE 0 to 1
);
port
(
  clk           : IN  std_logic;
  arst          : IN  std_logic;
  srst          : IN  std_logic;
  en            : IN  std_logic;
  write_en      : IN  std_logic;
  write_address : IN  std_logic_vector (addr_width - 1 downto 0);
  write_data    : IN  std_logic_vector (data_width - 1 downto 0);
  read_address  : IN  std_logic_vector (addr_width - 1 downto 0);
  read_data     : OUT std_logic_vector (data_width - 1 downto 0)
);
END COMPONENT;

COMPONENT mgc_regfile_neg_v1
generic
(
  data_width   : integer;
  addr_width   : integer;
  num_of_words : integer;
  ph_en        : integer RANGE 0 to 1;
  ph_arst      : integer RANGE 0 to 1;
  ph_srst      : integer RANGE 0 to 1
);
port
(
  clk           : IN  std_logic;
  arst          : IN  std_logic;
  srst          : IN  std_logic;
  en            : IN  std_logic;
  write_en      : IN  std_logic;
  write_address : IN  std_logic_vector (addr_width - 1 downto 0);
  write_data    : IN  std_logic_vector (data_width - 1 downto 0);
  read_address  : IN  std_logic_vector (addr_width - 1 downto 0);
  read_data     : OUT std_logic_vector (data_width - 1 downto 0)
);
END COMPONENT;

COMPONENT mgc_regfile_v1
generic
(
  data_width   : integer;
  addr_width   : integer;
  num_of_words : integer;
  ph_clk       : integer RANGE 0 TO 1;
  ph_en        : integer RANGE 0 to 1;
  ph_arst      : integer RANGE 0 to 1;
  ph_srst      : integer RANGE 0 to 1
);
port
(
  clk           : IN  std_logic;
  arst          : IN  std_logic;
  srst          : IN  std_logic;
  en            : IN  std_logic;
  write_en      : IN  std_logic;
  write_address : IN  std_logic_vector (addr_width - 1 downto 0);
  write_data    : IN  std_logic_vector (data_width - 1 downto 0);
  read_address  : IN  std_logic_vector (addr_width - 1 downto 0);
  read_data     : OUT std_logic_vector (data_width - 1 downto 0)
);
END COMPONENT;

COMPONENT mgc_in_ram_v1
generic
(
  ram_id            : integer;
  words             : integer;
  width             : integer;
  addr_width        : integer;
  re_active         : integer;
  num_byte_enables  : integer;
  no_of_ports       : integer
);
port
(
 id : out  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 ad : in  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
 rd : in  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0) ;
 iz : in  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 az : out  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
 rz : out  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0)
);
END COMPONENT;

COMPONENT mgc_out_ram_v1
generic
(
  ram_id            : integer;
  words             : integer;
  width             : integer;
  addr_width        : integer;
  we_active         : integer;
  num_byte_enables  : integer;
  no_of_ports       : integer
);
port
(
 id : in  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 ad : in  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
 rd : in  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0) ;
 iz : out  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 az : out  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
 rz : out  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0)
);
END COMPONENT;

COMPONENT mgc_inout_ram_v1
generic
(
  ram_id            : integer;
  words             : integer;
  width             : integer;
  addr_width        : integer;
  re_active         : integer;
  we_active         : integer;
  num_byte_enables  : integer;
  no_of_ports       : integer
);
port
(
 id  : out  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 od  : in  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 ad  : in  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
 rd  : in  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0) ;
 wd  : in  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0) ;
 iz  : in  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 oz  : out  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 az  : out  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
 rz  : out  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0);
 wz  : out  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0)
);
END COMPONENT;


COMPONENT funccall_inout_v1
generic
(
  ram_id           : integer;
  width           : integer;  -- models the concat of the return value (data)
  addr_width      : integer  -- models the concat of the input arguments (addr)
);
port
(
  d  : out  STD_LOGIC_VECTOR(width - 1 downto 0);
  ad : in  STD_LOGIC_VECTOR(addr_width - 1 downto 0) ;
  bd : in  STD_LOGIC;
  z  : in  STD_LOGIC_VECTOR(width - 1 downto 0);
  az : out  STD_LOGIC_VECTOR(addr_width - 1 downto 0) ;
  bz : out  STD_LOGIC
);
END COMPONENT;

END mgc_ioport_comps_v11;

--------> /softl3/catapultc10_0a/64bit/Mgc_home/pkgs/siflibs/mgc_io_sync_v1.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2015 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY mgc_io_sync_v1 IS
  GENERIC (
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    ld       : IN    std_logic;
    lz       : OUT   std_logic
  );
END mgc_io_sync_v1;

ARCHITECTURE beh OF mgc_io_sync_v1 IS
BEGIN

  lz <= ld;

END beh;


LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY mgc_in_sync_v1 IS
  GENERIC (
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    vd       : OUT   std_logic;
    vz       : IN    std_logic
  );
END mgc_in_sync_v1;

ARCHITECTURE beh OF mgc_in_sync_v1 IS
BEGIN

  vd <= vz;

END beh;



--------> /softl3/catapultc10_0a/64bit/Mgc_home/pkgs/ccs_xilinx/hdl/BLOCK_1R1W_RBW.vhd 

LIBRARY IEEE;

   USE IEEE.STD_LOGIC_1164.ALL;
   USE IEEE.Numeric_Std.ALL;

PACKAGE BLOCK_1R1W_RBW_pkg IS

   COMPONENT BLOCK_1R1W_RBW
      GENERIC (
         data_width    : integer := 8;
         addr_width : integer := 7;
         depth         : integer := 128
      );
      PORT (
         clk  : IN  std_logic;
         radr : IN  std_logic_vector(addr_width-1 DOWNTO 0);
         wadr : IN  std_logic_vector(addr_width-1 DOWNTO 0);
         we   : IN  std_logic;
         re   : IN  std_logic;
         d    : IN  std_logic_vector(data_width-1 DOWNTO 0);
         q    : OUT std_logic_vector(data_width-1  DOWNTO 0)
      );
   END COMPONENT;

END BLOCK_1R1W_RBW_pkg;


LIBRARY IEEE;

   USE IEEE.STD_LOGIC_1164.ALL;
   USE IEEE.Numeric_Std.ALL;

ENTITY BLOCK_1R1W_RBW IS
      GENERIC (
         data_width    : integer := 8;
         addr_width : integer := 7;
         depth         : integer := 128
      );
      PORT (
         clk  : IN  std_logic;
         radr : IN  std_logic_vector(addr_width-1 DOWNTO 0);
         wadr : IN  std_logic_vector(addr_width-1 DOWNTO 0);
         we   : IN  std_logic;
         re   : IN  std_logic;
         d    : IN  std_logic_vector(data_width-1 DOWNTO 0);
         q    : OUT std_logic_vector(data_width-1  DOWNTO 0)
      );
END BLOCK_1R1W_RBW;

ARCHITECTURE rtl OF BLOCK_1R1W_RBW IS

   TYPE ram_t IS ARRAY (depth-1 DOWNTO 0) OF std_logic_vector(data_width-1 DOWNTO 0);
   SIGNAL mem : ram_t := (OTHERS => (OTHERS => '0'));

   ATTRIBUTE ram_style: STRING;
   ATTRIBUTE ram_style OF mem : SIGNAL IS "BLOCK";
   ATTRIBUTE syn_ramstyle: STRING;
   ATTRIBUTE syn_ramstyle OF mem : SIGNAL IS "block_ram";

BEGIN
   PROCESS (clk)
   BEGIN
      IF (rising_edge(clk)) THEN
         IF (we='1') THEN
           mem(to_integer(unsigned(wadr))) <= d;
         END IF;
         IF (re='1') THEN
            q <= mem(to_integer(unsigned(radr))) ; -- read port
         END IF; 
      END IF;
   END PROCESS;
END rtl;


--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.0a/269363 Production Release
--  HLS Date:       Wed Nov  9 17:38:00 PST 2016
-- 
--  Generated by:   xph3sei702@ocaepc57
--  Generated date: Fri Jan 26 16:56:05 2018
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_8_16_59292_3_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps_v11.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_8_16_59292_3_gen IS
  PORT(
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    re : OUT STD_LOGIC;
    q : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    we_d : IN STD_LOGIC;
    re_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
  );
END Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_8_16_59292_3_gen;

ARCHITECTURE v13 OF Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_8_16_59292_3_gen IS
  -- Default Constants

BEGIN
  -- Default Constant Signal Assignments

  we <= (we_d);
  d <= (d_d);
  wadr <= (wadr_d);
  re <= (re_d);
  q_d <= q;
  radr <= (radr_d);
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    Xilinx_RAMS_BLOCK_1R1W_RBW_wport_8_17_76800_2_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps_v11.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY Xilinx_RAMS_BLOCK_1R1W_RBW_wport_8_17_76800_2_gen IS
  PORT(
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    we_d : IN STD_LOGIC
  );
END Xilinx_RAMS_BLOCK_1R1W_RBW_wport_8_17_76800_2_gen;

ARCHITECTURE v13 OF Xilinx_RAMS_BLOCK_1R1W_RBW_wport_8_17_76800_2_gen IS
  -- Default Constants

BEGIN
  -- Default Constant Signal Assignments

  we <= (we_d);
  d <= (d_d);
  wadr <= (wadr_d);
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    Xilinx_RAMS_BLOCK_1R1W_RBW_rport_8_16_57600_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps_v11.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY Xilinx_RAMS_BLOCK_1R1W_RBW_rport_8_16_57600_1_gen IS
  PORT(
    re : OUT STD_LOGIC;
    q : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    re_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
  );
END Xilinx_RAMS_BLOCK_1R1W_RBW_rport_8_16_57600_1_gen;

ARCHITECTURE v13 OF Xilinx_RAMS_BLOCK_1R1W_RBW_rport_8_16_57600_1_gen IS
  -- Default Constants

BEGIN
  -- Default Constant Signal Assignments

  re <= (re_d);
  q_d <= q;
  radr <= (radr_d);
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    apply_conv_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps_v11.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY apply_conv_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END apply_conv_core_core_fsm;

ARCHITECTURE v13 OF apply_conv_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for apply_conv_core_core_fsm_1
  TYPE apply_conv_core_core_fsm_1_ST IS (core_rlp_C_0, main_C_0);

  SIGNAL state_var : apply_conv_core_core_fsm_1_ST;
  SIGNAL state_var_NS : apply_conv_core_core_fsm_1_ST;

BEGIN
  -- Default Constant Signal Assignments

  apply_conv_core_core_fsm_1 : PROCESS (state_var)
  BEGIN
    CASE state_var IS
      WHEN main_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10");
        state_var_NS <= main_C_0;
      -- core_rlp_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "01");
        state_var_NS <= main_C_0;
    END CASE;
  END PROCESS apply_conv_core_core_fsm_1;

  apply_conv_core_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= core_rlp_C_0;
      ELSE
        state_var <= state_var_NS;
      END IF;
    END IF;
  END PROCESS apply_conv_core_core_fsm_1_REG;

END v13;

-- ------------------------------------------------------------------
--  Design Unit:    apply_conv_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps_v11.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY apply_conv_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    conv_in_rsc_triosy_lz : OUT STD_LOGIC;
    conv_out_rsc_triosy_lz : OUT STD_LOGIC;
    conv_in_rsci_radr_d : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    conv_in_rsci_re_d : OUT STD_LOGIC;
    conv_in_rsci_q_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    conv_out_rsci_wadr_d : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
    conv_out_rsci_d_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    conv_out_rsci_we_d : OUT STD_LOGIC;
    pad_input_rsci_radr_d : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    pad_input_rsci_wadr_d : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    pad_input_rsci_d_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    pad_input_rsci_we_d : OUT STD_LOGIC;
    pad_input_rsci_re_d : OUT STD_LOGIC;
    pad_input_rsci_q_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0)
  );
END apply_conv_core;

ARCHITECTURE v13 OF apply_conv_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL conv_in_rsc_triosy_obj_ld : STD_LOGIC;
  SIGNAL conv_out_rsc_triosy_obj_ld : STD_LOGIC;
  SIGNAL fsm_output : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL or_dcpl_1 : STD_LOGIC;
  SIGNAL or_dcpl_3 : STD_LOGIC;
  SIGNAL or_dcpl_6 : STD_LOGIC;
  SIGNAL or_dcpl_7 : STD_LOGIC;
  SIGNAL and_dcpl_30 : STD_LOGIC;
  SIGNAL and_dcpl_42 : STD_LOGIC;
  SIGNAL and_dcpl_49 : STD_LOGIC;
  SIGNAL or_dcpl_26 : STD_LOGIC;
  SIGNAL or_dcpl_27 : STD_LOGIC;
  SIGNAL or_dcpl_29 : STD_LOGIC;
  SIGNAL or_dcpl_30 : STD_LOGIC;
  SIGNAL or_dcpl_31 : STD_LOGIC;
  SIGNAL or_dcpl_32 : STD_LOGIC;
  SIGNAL or_dcpl_34 : STD_LOGIC;
  SIGNAL or_dcpl_37 : STD_LOGIC;
  SIGNAL or_tmp_7 : STD_LOGIC;
  SIGNAL or_tmp_10 : STD_LOGIC;
  SIGNAL or_tmp_14 : STD_LOGIC;
  SIGNAL o_r_6_0_lpi_2 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL o_c_7_0_lpi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL o_d_1_0_lpi_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL PAD_d_1_0_lpi_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL PAD_for_r_6_0_lpi_3 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL lfst_exit_PAD_for_1_lpi_2 : STD_LOGIC;
  SIGNAL PAD_for_for_c_7_0_lpi_3 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_NB_K_i_1_0_lpi_3 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL CONV_V_SLIDE_j_6_0_lpi_3 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL lfst_exit_CONV_V_SLIDE_1_lpi_3 : STD_LOGIC;
  SIGNAL CONV_H_SLIDE_k_7_0_lpi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL lfst_exit_CONV_H_SLIDE_1_lpi_2 : STD_LOGIC;
  SIGNAL temp_1_lpi_2 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL CONV_K_D_l_1_0_lpi_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL lfst_exit_CONV_K_D_1_lpi_2 : STD_LOGIC;
  SIGNAL CONV_K_H_m_1_0_lpi_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL lfst_exit_CONV_K_H_1_lpi_2 : STD_LOGIC;
  SIGNAL CONV_K_W_n_1_0_lpi_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL exitL_exit_CONV_NB_K_sva : STD_LOGIC;
  SIGNAL exit_PAD_sva_2 : STD_LOGIC;
  SIGNAL exit_CONV_K_D_sva_2 : STD_LOGIC;
  SIGNAL exit_CONV_H_SLIDE_sva_7 : STD_LOGIC;
  SIGNAL exit_CONV_V_SLIDE_sva_3 : STD_LOGIC;
  SIGNAL exit_CONV_NB_K_sva_1 : STD_LOGIC;
  SIGNAL o_d_1_0_lpi_1_dfm_7 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL o_d_1_0_lpi_1_dfm_8 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL CONV_NB_K_equal_tmp_6 : STD_LOGIC;
  SIGNAL CONV_NB_K_equal_tmp_7 : STD_LOGIC;
  SIGNAL lfst_exit_CONV_H_SLIDE_1_lpi_1_dfm_4 : STD_LOGIC;
  SIGNAL exit_CONV_H_SLIDE_sva_8 : STD_LOGIC;
  SIGNAL exit_CONV_H_SLIDE_sva_9 : STD_LOGIC;
  SIGNAL CONV_H_SLIDE_CONV_H_SLIDE_and_itm_3 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL CONV_K_W_slc_CONV_K_W_acc_2_psp_0_itm_4 : STD_LOGIC;
  SIGNAL CONV_K_W_mux_3_itm_4 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL CONV_K_W_mux_3_itm_5 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL o_c_slc_o_c_7_0_4_0_itm_5 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL o_c_slc_o_c_7_0_4_0_itm_6 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL PAD_for_for_if_PAD_for_for_if_or_itm_3 : STD_LOGIC;
  SIGNAL PAD_for_for_else_if_PAD_for_for_else_if_or_itm_3 : STD_LOGIC;
  SIGNAL exit_CONV_K_D_lpi_1_dfm_2_st_3 : STD_LOGIC;
  SIGNAL exit_CONV_NB_K_lpi_1_dfm_1_st_3 : STD_LOGIC;
  SIGNAL exit_CONV_NB_K_lpi_1_dfm_1_st_4 : STD_LOGIC;
  SIGNAL main_stage_0_2 : STD_LOGIC;
  SIGNAL main_stage_0_3 : STD_LOGIC;
  SIGNAL lfst_exit_CONV_NB_K_lpi_1_dfm_3_1 : STD_LOGIC;
  SIGNAL lfst_exit_CONV_NB_K_lpi_1_dfm_3_0 : STD_LOGIC;
  SIGNAL CONV_K_W_acc_14_itm_1_14_1_2 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_K_W_acc_14_itm_1_0_2 : STD_LOGIC;
  SIGNAL CONV_H_SLIDE_acc_10_itm_1_9_2_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_H_SLIDE_acc_10_itm_1_1_0_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL CONV_H_SLIDE_acc_10_itm_2_9_2_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_H_SLIDE_acc_10_itm_2_1_0_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL lfst_exit_CONV_NB_K_lpi_1_dfm_st_1_1 : STD_LOGIC;
  SIGNAL lfst_exit_CONV_NB_K_lpi_1_dfm_st_1_0 : STD_LOGIC;
  SIGNAL lfst_exit_CONV_NB_K_lpi_1_dfm_st_2_1_1 : STD_LOGIC;
  SIGNAL lfst_exit_CONV_NB_K_lpi_1_dfm_st_2_0_1 : STD_LOGIC;
  SIGNAL CONV_NB_K_acc_tmp_2 : STD_LOGIC;
  SIGNAL CONV_K_D_acc_tmp_2 : STD_LOGIC;
  SIGNAL CONV_K_H_acc_tmp_2 : STD_LOGIC;
  SIGNAL CONV_K_W_acc_tmp_2 : STD_LOGIC;
  SIGNAL PAD_acc_tmp_2 : STD_LOGIC;
  SIGNAL lfst_exit_CONV_NB_K_lpi_1_dfm_1 : STD_LOGIC;
  SIGNAL lfst_exit_CONV_NB_K_lpi_1_dfm_0 : STD_LOGIC;
  SIGNAL exit_CONV_V_SLIDE_lpi_1_dfm_2 : STD_LOGIC;
  SIGNAL exit_CONV_H_SLIDE_lpi_1_dfm_2 : STD_LOGIC;
  SIGNAL exit_CONV_K_D_lpi_1_dfm_2 : STD_LOGIC;
  SIGNAL exit_CONV_K_H_lpi_1_dfm_2 : STD_LOGIC;
  SIGNAL lfst_exit_CONV_H_SLIDE_1_lpi_1_dfm : STD_LOGIC;
  SIGNAL lfst_exit_CONV_NB_K_lpi_1_dfm_3_1_mx0w0 : STD_LOGIC;
  SIGNAL lfst_exit_CONV_NB_K_lpi_1_dfm_3_0_mx0w0 : STD_LOGIC;
  SIGNAL CONV_NB_K_equal_tmp : STD_LOGIC;
  SIGNAL exit_CONV_NB_K_lpi_1_dfm_1 : STD_LOGIC;
  SIGNAL CONV_NB_K_equal_tmp_1 : STD_LOGIC;
  SIGNAL CONV_NB_K_and_ssc : STD_LOGIC;
  SIGNAL CONV_NB_K_and_6_ssc : STD_LOGIC;
  SIGNAL exit_PAD_lpi_1_dfm_2 : STD_LOGIC;
  SIGNAL CONV_NB_K_nor_dfs : STD_LOGIC;
  SIGNAL CONV_NB_K_CONV_NB_K_nor_2_m1c : STD_LOGIC;
  SIGNAL reg_PAD_for_for_if_acc_itm_1_14_1_cse : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL reg_PAD_for_for_if_acc_itm_1_0_cse : STD_LOGIC;
  SIGNAL reg_PAD_for_for_c_slc_PAD_for_for_c_7_0_0_cse : STD_LOGIC;
  SIGNAL CONV_NB_K_and_17_cse : STD_LOGIC;
  SIGNAL asn_PAD_d_1_0_lpi_1_nor_cse : STD_LOGIC;
  SIGNAL PAD_for_r_6_0_lpi_1_dfm : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL PAD_for_for_else_else_acc_11_sdt : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL PAD_d_1_0_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL PAD_for_for_else_else_acc_5_psp_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL pad_input_rsci_wadr_d_mx0c0 : STD_LOGIC;
  SIGNAL temp_1_sva_1 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL CONV_K_W_n_1_0_sva_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL CONV_K_H_m_1_0_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL CONV_K_H_m_1_0_sva_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL CONV_K_D_l_1_0_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL CONV_K_D_l_1_0_sva_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL o_r_6_0_lpi_1_dfm : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL and_121_tmp : STD_LOGIC;
  SIGNAL nor_tmp : STD_LOGIC;
  SIGNAL and_124_tmp : STD_LOGIC;
  SIGNAL CONV_NB_K_and_10_tmp : STD_LOGIC;
  SIGNAL temp_1_lpi_1_mx0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL o_d_1_0_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL PAD_for_for_c_7_0_lpi_1_dfm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL PAD_for_r_6_0_sva_1 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL PAD_for_for_c_7_0_sva_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL PAD_unequal_tmp : STD_LOGIC;
  SIGNAL CONV_NB_K_i_1_0_sva_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL CONV_V_SLIDE_j_6_0_sva_1 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL CONV_H_SLIDE_k_7_0_sva_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_H_SLIDE_k_7_0_lpi_1_dfm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_K_W_n_1_0_lpi_1_dfm : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL lfst_exit_CONV_K_D_1_lpi_1_dfm : STD_LOGIC;
  SIGNAL PAD_d_1_0_sva_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL PAD_for_for_if_acc_3_ncse : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_K_W_acc_2_psp_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_K_W_acc_15_sdt : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL o_c_7_0_lpi_1_dfm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_H_SLIDE_acc_11_sdt_6_0 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL CONV_K_W_acc_18_sdt : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL PAD_for_acc_itm_6 : STD_LOGIC;
  SIGNAL CONV_V_SLIDE_acc_itm_4 : STD_LOGIC;
  SIGNAL CONV_H_SLIDE_acc_itm_3 : STD_LOGIC;
  SIGNAL PAD_for_for_else_acc_itm_8 : STD_LOGIC;
  SIGNAL PAD_for_for_acc_itm_7 : STD_LOGIC;
  SIGNAL PAD_for_for_acc_1_itm_7 : STD_LOGIC;
  SIGNAL PAD_for_for_oif_acc_itm_7 : STD_LOGIC;
  SIGNAL PAD_for_for_else_oif_acc_itm_8 : STD_LOGIC;
  SIGNAL CONV_NB_K_and_8_rgt : STD_LOGIC;
  SIGNAL nor_13_rgt : STD_LOGIC;
  SIGNAL nor_14_rgt : STD_LOGIC;
  SIGNAL CONV_K_D_l_and_1_rgt : STD_LOGIC;
  SIGNAL reg_exit_CONV_K_D_lpi_1_dfm_2_st_2_cse : STD_LOGIC;

  SIGNAL PAD_for_for_if_mul_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_K_W_mul_11_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_NB_K_CONV_NB_K_nor_3_nl : STD_LOGIC;
  SIGNAL CONV_NB_K_and_1_nl : STD_LOGIC;
  SIGNAL CONV_NB_K_and_19_nl : STD_LOGIC;
  SIGNAL CONV_NB_K_and_20_nl : STD_LOGIC;
  SIGNAL CONV_NB_K_and_18_nl : STD_LOGIC;
  SIGNAL CONV_V_SLIDE_j_and_nl : STD_LOGIC;
  SIGNAL or_68_nl : STD_LOGIC;
  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL mux_10_nl : STD_LOGIC;
  SIGNAL PAD_PAD_and_4_nl : STD_LOGIC;
  SIGNAL CONV_H_SLIDE_k_and_nl : STD_LOGIC;
  SIGNAL CONV_K_W_asn_pref_pref_pref_4_6_CONV_K_W_acc_nl : STD_LOGIC_VECTOR (6 DOWNTO
      0);
  SIGNAL CONV_K_W_acc_20_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL CONV_K_W_mul_12_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL CONV_V_SLIDE_CONV_V_SLIDE_and_3_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_H_SLIDE_mux_6_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_H_SLIDE_acc_5_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_V_SLIDE_CONV_V_SLIDE_and_2_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL CONV_V_SLIDE_acc_1_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL CONV_NB_K_CONV_NB_K_CONV_V_SLIDE_not_4_nl : STD_LOGIC;
  SIGNAL or_69_nl : STD_LOGIC;
  SIGNAL CONV_NB_K_acc_1_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL PAD_for_acc_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL CONV_V_SLIDE_acc_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL CONV_H_SLIDE_acc_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL CONV_NB_K_mux_6_nl : STD_LOGIC;
  SIGNAL nor_11_nl : STD_LOGIC;
  SIGNAL and_133_nl : STD_LOGIC;
  SIGNAL CONV_K_W_mul_10_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL CONV_NB_K_mux_1_nl : STD_LOGIC;
  SIGNAL CONV_K_D_mux_1_nl : STD_LOGIC;
  SIGNAL CONV_NB_K_not_31_nl : STD_LOGIC;
  SIGNAL CONV_NB_K_not_37_nl : STD_LOGIC;
  SIGNAL PAD_PAD_and_1_nl : STD_LOGIC;
  SIGNAL PAD_for_for_else_acc_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL PAD_for_for_acc_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL PAD_for_for_acc_1_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_V_SLIDE_mux_1_nl : STD_LOGIC;
  SIGNAL CONV_H_SLIDE_mux_3_nl : STD_LOGIC;
  SIGNAL CONV_K_D_CONV_K_D_and_1_nl : STD_LOGIC;
  SIGNAL PAD_mux_1_nl : STD_LOGIC;
  SIGNAL PAD_for_for_if_PAD_for_for_if_mul_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_K_W_mul_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_K_W_acc_1_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL CONV_NB_K_not_32_nl : STD_LOGIC;
  SIGNAL CONV_NB_K_not_33_nl : STD_LOGIC;
  SIGNAL CONV_K_W_acc_21_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL CONV_K_W_acc_16_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL PAD_for_for_oif_acc_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL PAD_for_for_else_oif_acc_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL PAD_for_for_else_else_PAD_for_for_else_else_and_1_nl : STD_LOGIC_VECTOR
      (10 DOWNTO 0);
  SIGNAL PAD_for_for_else_else_acc_10_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL PAD_for_for_else_else_acc_14_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL PAD_for_for_else_else_mul_7_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL PAD_for_for_else_else_PAD_for_for_else_else_and_nl : STD_LOGIC_VECTOR (4
      DOWNTO 0);
  SIGNAL CONV_H_SLIDE_CONV_H_SLIDE_and_6_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_H_SLIDE_not_13_nl : STD_LOGIC;
  SIGNAL CONV_H_SLIDE_CONV_H_SLIDE_and_5_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL CONV_H_SLIDE_not_nl : STD_LOGIC;
  SIGNAL o_c_o_c_and_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL not_86_nl : STD_LOGIC;
  SIGNAL o_d_o_d_and_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL not_87_nl : STD_LOGIC;
  SIGNAL CONV_K_W_CONV_K_W_and_2_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_K_W_not_2_nl : STD_LOGIC;
  SIGNAL CONV_K_W_CONV_K_W_and_1_nl : STD_LOGIC;
  SIGNAL CONV_K_W_CONV_K_W_and_nl : STD_LOGIC;
  SIGNAL pad_input_and_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL pad_input_not_nl : STD_LOGIC;
  SIGNAL pad_input_and_1_nl : STD_LOGIC;
  SIGNAL pad_input_and_2_nl : STD_LOGIC;
  SIGNAL and_65_nl : STD_LOGIC;
  COMPONENT apply_conv_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL apply_conv_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (1 DOWNTO 0);

  FUNCTION MUX1HOT_v_12_3_2(input_2 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(11 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(11 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_2_3_2(input_2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(1 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(1 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_7_3_2(input_2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(6 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(6 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_8_3_2(input_2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(7 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX_s_1_2_2(input_0 : STD_LOGIC;
  input_1 : STD_LOGIC;
  sel : STD_LOGIC)
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_11_2_2(input_0 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(10 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(10 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_12_2_2(input_0 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(11 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(11 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_14_2_2(input_0 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(13 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(13 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(13 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_2_2_2(input_0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(1 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(1 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_3_81_2(input_0 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_15 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_16 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_17 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_18 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_19 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_20 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_21 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_22 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_23 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_24 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_25 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_26 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_27 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_28 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_29 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_30 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_31 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_32 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_33 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_34 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_35 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_36 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_37 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_38 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_39 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_40 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_41 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_42 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_43 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_44 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_45 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_46 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_47 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_48 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_49 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_50 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_51 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_52 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_53 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_54 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_55 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_56 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_57 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_58 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_59 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_60 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_61 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_62 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_63 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_64 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_65 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_66 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_67 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_68 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_69 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_70 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_71 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_72 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_73 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_74 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_75 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_76 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_77 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_78 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_79 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_80 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(6 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(2 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(2 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN "0000000" =>
          result := input_0;
        WHEN "0000001" =>
          result := input_1;
        WHEN "0000010" =>
          result := input_2;
        WHEN "0000011" =>
          result := input_3;
        WHEN "0000100" =>
          result := input_4;
        WHEN "0000101" =>
          result := input_5;
        WHEN "0000110" =>
          result := input_6;
        WHEN "0000111" =>
          result := input_7;
        WHEN "0001000" =>
          result := input_8;
        WHEN "0001001" =>
          result := input_9;
        WHEN "0001010" =>
          result := input_10;
        WHEN "0001011" =>
          result := input_11;
        WHEN "0001100" =>
          result := input_12;
        WHEN "0001101" =>
          result := input_13;
        WHEN "0001110" =>
          result := input_14;
        WHEN "0001111" =>
          result := input_15;
        WHEN "0010000" =>
          result := input_16;
        WHEN "0010001" =>
          result := input_17;
        WHEN "0010010" =>
          result := input_18;
        WHEN "0010011" =>
          result := input_19;
        WHEN "0010100" =>
          result := input_20;
        WHEN "0010101" =>
          result := input_21;
        WHEN "0010110" =>
          result := input_22;
        WHEN "0010111" =>
          result := input_23;
        WHEN "0011000" =>
          result := input_24;
        WHEN "0011001" =>
          result := input_25;
        WHEN "0011010" =>
          result := input_26;
        WHEN "0011011" =>
          result := input_27;
        WHEN "0011100" =>
          result := input_28;
        WHEN "0011101" =>
          result := input_29;
        WHEN "0011110" =>
          result := input_30;
        WHEN "0011111" =>
          result := input_31;
        WHEN "0100000" =>
          result := input_32;
        WHEN "0100001" =>
          result := input_33;
        WHEN "0100010" =>
          result := input_34;
        WHEN "0100011" =>
          result := input_35;
        WHEN "0100100" =>
          result := input_36;
        WHEN "0100101" =>
          result := input_37;
        WHEN "0100110" =>
          result := input_38;
        WHEN "0100111" =>
          result := input_39;
        WHEN "0101000" =>
          result := input_40;
        WHEN "0101001" =>
          result := input_41;
        WHEN "0101010" =>
          result := input_42;
        WHEN "0101011" =>
          result := input_43;
        WHEN "0101100" =>
          result := input_44;
        WHEN "0101101" =>
          result := input_45;
        WHEN "0101110" =>
          result := input_46;
        WHEN "0101111" =>
          result := input_47;
        WHEN "0110000" =>
          result := input_48;
        WHEN "0110001" =>
          result := input_49;
        WHEN "0110010" =>
          result := input_50;
        WHEN "0110011" =>
          result := input_51;
        WHEN "0110100" =>
          result := input_52;
        WHEN "0110101" =>
          result := input_53;
        WHEN "0110110" =>
          result := input_54;
        WHEN "0110111" =>
          result := input_55;
        WHEN "0111000" =>
          result := input_56;
        WHEN "0111001" =>
          result := input_57;
        WHEN "0111010" =>
          result := input_58;
        WHEN "0111011" =>
          result := input_59;
        WHEN "0111100" =>
          result := input_60;
        WHEN "0111101" =>
          result := input_61;
        WHEN "0111110" =>
          result := input_62;
        WHEN "0111111" =>
          result := input_63;
        WHEN "1000000" =>
          result := input_64;
        WHEN "1000001" =>
          result := input_65;
        WHEN "1000010" =>
          result := input_66;
        WHEN "1000011" =>
          result := input_67;
        WHEN "1000100" =>
          result := input_68;
        WHEN "1000101" =>
          result := input_69;
        WHEN "1000110" =>
          result := input_70;
        WHEN "1000111" =>
          result := input_71;
        WHEN "1001000" =>
          result := input_72;
        WHEN "1001001" =>
          result := input_73;
        WHEN "1001010" =>
          result := input_74;
        WHEN "1001011" =>
          result := input_75;
        WHEN "1001100" =>
          result := input_76;
        WHEN "1001101" =>
          result := input_77;
        WHEN "1001110" =>
          result := input_78;
        WHEN "1001111" =>
          result := input_79;
        WHEN others =>
          result := input_80;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_5_2_2(input_0 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(4 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(4 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_7_2_2(input_0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(6 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(6 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_8_2_2(input_0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(7 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  -- Default Constant Signal Assignments

  conv_in_rsc_triosy_obj : work.mgc_ioport_comps_v11.mgc_io_sync_v1
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => conv_in_rsc_triosy_obj_ld,
      lz => conv_in_rsc_triosy_lz
    );
  conv_out_rsc_triosy_obj : work.mgc_ioport_comps_v11.mgc_io_sync_v1
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => conv_out_rsc_triosy_obj_ld,
      lz => conv_out_rsc_triosy_lz
    );
  apply_conv_core_core_fsm_inst : apply_conv_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => apply_conv_core_core_fsm_inst_fsm_output
    );
  fsm_output <= apply_conv_core_core_fsm_inst_fsm_output;

  CONV_NB_K_CONV_NB_K_nor_2_m1c <= NOT(asn_PAD_d_1_0_lpi_1_nor_cse OR lfst_exit_CONV_NB_K_lpi_1_dfm_1);
  CONV_NB_K_and_8_rgt <= exit_CONV_V_SLIDE_lpi_1_dfm_2 AND CONV_NB_K_equal_tmp;
  CONV_NB_K_and_17_cse <= CONV_K_W_acc_tmp_2 AND (NOT or_dcpl_37);
  mux_nl <= MUX_s_1_2_2(CONV_K_D_acc_tmp_2, CONV_K_W_acc_tmp_2, or_dcpl_6);
  nor_tmp <= NOT(mux_nl OR or_dcpl_37);
  nor_13_rgt <= NOT(or_dcpl_6 OR or_dcpl_37 OR nor_tmp);
  mux_10_nl <= MUX_s_1_2_2(CONV_H_SLIDE_acc_itm_3, (NOT or_dcpl_6), or_dcpl_7);
  and_121_tmp <= mux_10_nl AND (NOT or_dcpl_37);
  nor_14_rgt <= NOT(or_dcpl_7 OR or_dcpl_37 OR and_121_tmp);
  CONV_K_D_l_and_1_rgt <= or_dcpl_6 AND (NOT or_dcpl_37);
  asn_PAD_d_1_0_lpi_1_nor_cse <= NOT(PAD_for_for_acc_itm_7 OR PAD_for_acc_itm_6);
  lfst_exit_CONV_NB_K_lpi_1_dfm_1 <= lfst_exit_CONV_NB_K_lpi_1_dfm_3_1 AND (NOT exitL_exit_CONV_NB_K_sva);
  lfst_exit_CONV_NB_K_lpi_1_dfm_0 <= lfst_exit_CONV_NB_K_lpi_1_dfm_3_0 AND (NOT exitL_exit_CONV_NB_K_sva);
  PAD_for_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(PAD_for_r_6_0_sva_1(6
      DOWNTO 1)), 6), 7) + SIGNED'( "1000011"), 7));
  PAD_for_acc_itm_6 <= readindex(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(PAD_for_acc_nl),
      7)), 6);
  CONV_NB_K_acc_tmp_2 <= (CONV_NB_K_i_1_0_sva_1(0)) XOR (CONV_NB_K_i_1_0_sva_1(1));
  CONV_V_SLIDE_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (NOT (CONV_V_SLIDE_j_6_0_sva_1(6
      DOWNTO 3)))) + SIGNED'( "01111"), 5));
  CONV_V_SLIDE_acc_itm_4 <= readindex(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(CONV_V_SLIDE_acc_nl),
      5)), 4);
  CONV_H_SLIDE_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (NOT (CONV_H_SLIDE_k_7_0_sva_1(7
      DOWNTO 5)))) + SIGNED'( "0101"), 4));
  CONV_H_SLIDE_acc_itm_3 <= readindex(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(CONV_H_SLIDE_acc_nl),
      4)), 3);
  CONV_K_D_acc_tmp_2 <= (CONV_K_D_l_1_0_sva_1(0)) XOR (CONV_K_D_l_1_0_sva_1(1));
  CONV_K_H_acc_tmp_2 <= (CONV_K_H_m_1_0_sva_1(0)) XOR (CONV_K_H_m_1_0_sva_1(1));
  CONV_NB_K_mux_6_nl <= MUX_s_1_2_2((NOT exit_CONV_NB_K_lpi_1_dfm_1), lfst_exit_CONV_NB_K_lpi_1_dfm_1,
      CONV_NB_K_equal_tmp_1);
  lfst_exit_CONV_NB_K_lpi_1_dfm_3_1_mx0w0 <= (CONV_NB_K_mux_6_nl AND (NOT CONV_NB_K_and_ssc))
      OR CONV_NB_K_and_6_ssc;
  lfst_exit_CONV_NB_K_lpi_1_dfm_3_0_mx0w0 <= (lfst_exit_CONV_NB_K_lpi_1_dfm_0 AND
      (NOT(CONV_NB_K_and_6_ssc OR CONV_NB_K_equal_tmp))) OR CONV_NB_K_and_ssc;
  and_124_tmp <= CONV_NB_K_equal_tmp_7 AND main_stage_0_3 AND (exit_CONV_H_SLIDE_sva_9
      OR (NOT reg_exit_CONV_K_D_lpi_1_dfm_2_st_2_cse));
  CONV_NB_K_and_10_tmp <= reg_exit_CONV_K_D_lpi_1_dfm_2_st_2_cse AND CONV_NB_K_equal_tmp_7
      AND main_stage_0_3;
  nor_11_nl <= NOT(CONV_NB_K_and_10_tmp OR and_124_tmp);
  and_133_nl <= CONV_NB_K_and_10_tmp AND (NOT and_124_tmp);
  temp_1_lpi_1_mx0 <= MUX1HOT_v_12_3_2(temp_1_lpi_2, STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(exit_CONV_H_SLIDE_sva_9,
      1),12)), temp_1_sva_1, STD_LOGIC_VECTOR'( nor_11_nl & and_133_nl & and_124_tmp));
  CONV_K_W_mul_10_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(pad_input_rsci_q_d)
      * UNSIGNED(CONV_K_W_mux_3_itm_5)), 10));
  temp_1_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_H_SLIDE_CONV_H_SLIDE_and_itm_3)
      + CONV_UNSIGNED(UNSIGNED(CONV_K_W_mul_10_nl), 12), 12));
  lfst_exit_CONV_H_SLIDE_1_lpi_1_dfm <= lfst_exit_CONV_H_SLIDE_1_lpi_2 AND lfst_exit_CONV_V_SLIDE_1_lpi_3;
  PAD_acc_tmp_2 <= (PAD_d_1_0_sva_1(0)) XOR (PAD_d_1_0_sva_1(1));
  CONV_NB_K_mux_1_nl <= MUX_s_1_2_2((NOT CONV_NB_K_acc_tmp_2), exit_CONV_NB_K_sva_1,
      or_dcpl_26);
  exit_CONV_NB_K_lpi_1_dfm_1 <= CONV_NB_K_mux_1_nl AND exit_CONV_V_SLIDE_lpi_1_dfm_2;
  CONV_K_D_mux_1_nl <= MUX_s_1_2_2((NOT CONV_K_D_acc_tmp_2), exit_CONV_K_D_sva_2,
      or_dcpl_6);
  exit_CONV_K_D_lpi_1_dfm_2 <= CONV_K_D_mux_1_nl AND exit_CONV_K_H_lpi_1_dfm_2;
  CONV_NB_K_not_31_nl <= NOT exitL_exit_CONV_NB_K_sva;
  o_d_1_0_lpi_1_dfm <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), o_d_1_0_lpi_2, CONV_NB_K_not_31_nl);
  CONV_NB_K_equal_tmp <= lfst_exit_CONV_NB_K_lpi_1_dfm_1 AND (NOT lfst_exit_CONV_NB_K_lpi_1_dfm_0);
  PAD_for_r_6_0_lpi_1_dfm <= MUX_v_7_2_2(STD_LOGIC_VECTOR'("0000000"), PAD_for_r_6_0_lpi_3,
      PAD_unequal_tmp);
  PAD_for_for_else_else_acc_11_sdt <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(PAD_for_r_6_0_lpi_1_dfm),
      7), 8) + CONV_SIGNED(CONV_SIGNED(SIGNED('1' & (PAD_for_for_else_else_acc_5_psp_sva(7
      DOWNTO 5))), 4), 8), 8));
  CONV_NB_K_not_37_nl <= NOT exitL_exit_CONV_NB_K_sva;
  PAD_d_1_0_lpi_1_dfm <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), PAD_d_1_0_lpi_2, CONV_NB_K_not_37_nl);
  PAD_for_for_else_else_acc_5_psp_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(PAD_for_for_c_7_0_lpi_1_dfm)
      + UNSIGNED'( "11111111"), 8));
  PAD_PAD_and_1_nl <= lfst_exit_PAD_for_1_lpi_2 AND PAD_unequal_tmp;
  PAD_for_for_c_7_0_lpi_1_dfm <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), PAD_for_for_c_7_0_lpi_3,
      PAD_PAD_and_1_nl);
  PAD_for_for_else_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(PAD_for_for_c_7_0_lpi_1_dfm),
      8), 9) + SIGNED'( "111111111"), 9));
  PAD_for_for_else_acc_itm_8 <= readindex(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(PAD_for_for_else_acc_nl),
      9)), 8);
  PAD_for_r_6_0_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(PAD_for_r_6_0_lpi_1_dfm)
      + UNSIGNED'( "0000001"), 7));
  PAD_for_for_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(PAD_for_for_c_7_0_sva_1(7
      DOWNTO 1)), 7), 8) + SIGNED'( "10101111"), 8));
  PAD_for_for_acc_itm_7 <= readindex(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(PAD_for_for_acc_nl),
      8)), 7);
  PAD_for_for_c_7_0_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(PAD_for_for_c_7_0_lpi_1_dfm)
      + UNSIGNED'( "00000001"), 8));
  PAD_for_for_acc_1_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(PAD_for_r_6_0_lpi_1_dfm),
      7), 8) + SIGNED'( "11111111"), 8));
  PAD_for_for_acc_1_itm_7 <= readindex(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(PAD_for_for_acc_1_nl),
      8)), 7);
  PAD_unequal_tmp <= lfst_exit_CONV_NB_K_lpi_1_dfm_1 OR lfst_exit_CONV_NB_K_lpi_1_dfm_0;
  CONV_NB_K_i_1_0_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_NB_K_i_1_0_lpi_3)
      + UNSIGNED'( "01"), 2));
  CONV_V_SLIDE_j_6_0_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_V_SLIDE_j_6_0_lpi_3)
      + UNSIGNED'( "0000001"), 7));
  CONV_H_SLIDE_k_7_0_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_H_SLIDE_k_7_0_lpi_1_dfm)
      + UNSIGNED'( "00000001"), 8));
  CONV_H_SLIDE_k_7_0_lpi_1_dfm <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), CONV_H_SLIDE_k_7_0_lpi_2,
      lfst_exit_CONV_V_SLIDE_1_lpi_3);
  CONV_K_D_l_1_0_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_K_D_l_1_0_lpi_1_dfm)
      + UNSIGNED'( "01"), 2));
  CONV_K_D_l_1_0_lpi_1_dfm <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), CONV_K_D_l_1_0_lpi_2,
      lfst_exit_CONV_H_SLIDE_1_lpi_1_dfm);
  CONV_K_H_m_1_0_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_K_H_m_1_0_lpi_1_dfm)
      + UNSIGNED'( "01"), 2));
  CONV_K_H_m_1_0_lpi_1_dfm <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), CONV_K_H_m_1_0_lpi_2,
      lfst_exit_CONV_K_D_1_lpi_1_dfm);
  CONV_V_SLIDE_mux_1_nl <= MUX_s_1_2_2(CONV_V_SLIDE_acc_itm_4, exit_CONV_V_SLIDE_sva_3,
      or_dcpl_31);
  exit_CONV_V_SLIDE_lpi_1_dfm_2 <= CONV_V_SLIDE_mux_1_nl AND exit_CONV_H_SLIDE_lpi_1_dfm_2;
  CONV_H_SLIDE_mux_3_nl <= MUX_s_1_2_2(CONV_H_SLIDE_acc_itm_3, exit_CONV_H_SLIDE_sva_7,
      or_dcpl_7);
  exit_CONV_H_SLIDE_lpi_1_dfm_2 <= CONV_H_SLIDE_mux_3_nl AND exit_CONV_K_D_lpi_1_dfm_2;
  exit_CONV_K_H_lpi_1_dfm_2 <= NOT(CONV_K_H_acc_tmp_2 OR CONV_K_W_acc_tmp_2);
  CONV_K_W_acc_tmp_2 <= (CONV_K_W_n_1_0_sva_1(0)) XOR (CONV_K_W_n_1_0_sva_1(1));
  CONV_K_W_n_1_0_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_K_W_n_1_0_lpi_1_dfm)
      + UNSIGNED'( "01"), 2));
  CONV_K_D_CONV_K_D_and_1_nl <= lfst_exit_CONV_K_H_1_lpi_2 AND lfst_exit_CONV_K_D_1_lpi_1_dfm;
  CONV_K_W_n_1_0_lpi_1_dfm <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), CONV_K_W_n_1_0_lpi_2,
      CONV_K_D_CONV_K_D_and_1_nl);
  lfst_exit_CONV_K_D_1_lpi_1_dfm <= lfst_exit_CONV_K_D_1_lpi_2 AND lfst_exit_CONV_H_SLIDE_1_lpi_1_dfm;
  PAD_mux_1_nl <= MUX_s_1_2_2((NOT PAD_acc_tmp_2), exit_PAD_sva_2, or_dcpl_3);
  exit_PAD_lpi_1_dfm_2 <= PAD_mux_1_nl AND asn_PAD_d_1_0_lpi_1_nor_cse;
  CONV_NB_K_nor_dfs <= NOT(CONV_NB_K_equal_tmp OR CONV_NB_K_equal_tmp_1);
  CONV_NB_K_equal_tmp_1 <= lfst_exit_CONV_NB_K_lpi_1_dfm_1 AND lfst_exit_CONV_NB_K_lpi_1_dfm_0;
  PAD_d_1_0_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(PAD_d_1_0_lpi_1_dfm)
      + UNSIGNED'( "01"), 2));
  PAD_for_for_if_PAD_for_for_if_mul_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
      UNSIGNED(PAD_for_r_6_0_lpi_1_dfm) * UNSIGNED'( "1010001")), 14));
  PAD_for_for_if_acc_3_ncse <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(PAD_for_for_if_PAD_for_for_if_mul_nl),
      14) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(PAD_for_for_c_7_0_lpi_1_dfm(7 DOWNTO
      1)), 7), 14), 14));
  CONV_K_W_acc_2_psp_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_H_SLIDE_k_7_0_lpi_1_dfm)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_K_W_n_1_0_lpi_1_dfm), 2), 8), 8));
  CONV_K_W_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_V_SLIDE_j_6_0_lpi_3)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_K_H_m_1_0_lpi_1_dfm), 2), 7), 7));
  CONV_K_W_mul_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( CONV_UNSIGNED(UNSIGNED(CONV_K_W_acc_1_nl),
      7) * UNSIGNED'( "1010001")), 14));
  CONV_K_W_acc_15_sdt <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_K_W_mul_nl),
      14) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_K_W_acc_2_psp_sva(7 DOWNTO
      1)), 7), 14), 14));
  CONV_NB_K_and_ssc <= (NOT exit_PAD_lpi_1_dfm_2) AND CONV_NB_K_nor_dfs;
  CONV_NB_K_and_6_ssc <= exit_PAD_lpi_1_dfm_2 AND CONV_NB_K_nor_dfs;
  CONV_NB_K_not_32_nl <= NOT exitL_exit_CONV_NB_K_sva;
  o_c_7_0_lpi_1_dfm <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), o_c_7_0_lpi_2,
      CONV_NB_K_not_32_nl);
  CONV_H_SLIDE_acc_11_sdt_6_0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(o_r_6_0_lpi_1_dfm)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(o_c_7_0_lpi_1_dfm(7 DOWNTO 5)), 3),
      7), 7));
  CONV_NB_K_not_33_nl <= NOT exitL_exit_CONV_NB_K_sva;
  o_r_6_0_lpi_1_dfm <= MUX_v_7_2_2(STD_LOGIC_VECTOR'("0000000"), o_r_6_0_lpi_2, CONV_NB_K_not_33_nl);
  CONV_K_W_acc_21_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_K_H_m_1_0_lpi_1_dfm),
      2), 3) + CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(CONV_K_D_l_1_0_lpi_1_dfm(1),
      1), 1), 3), 3));
  CONV_K_W_acc_16_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_K_H_m_1_0_lpi_1_dfm),
      2), 3) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_K_W_n_1_0_lpi_1_dfm), 2),
      3), 3));
  CONV_K_W_acc_18_sdt <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_K_W_acc_21_nl),
      3)) & (CONV_K_D_l_1_0_lpi_1_dfm(0))) + CONV_UNSIGNED(UNSIGNED(CONV_K_W_acc_16_nl),
      4), 4));
  or_dcpl_1 <= exitL_exit_CONV_NB_K_sva OR (NOT lfst_exit_CONV_NB_K_lpi_1_dfm_3_1);
  or_dcpl_3 <= PAD_for_for_acc_itm_7 OR PAD_for_acc_itm_6;
  or_dcpl_6 <= CONV_K_W_acc_tmp_2 OR CONV_K_H_acc_tmp_2;
  or_dcpl_7 <= or_dcpl_6 OR CONV_K_D_acc_tmp_2;
  and_dcpl_30 <= main_stage_0_3 AND lfst_exit_CONV_NB_K_lpi_1_dfm_st_2_1_1;
  and_dcpl_42 <= main_stage_0_2 AND (NOT lfst_exit_CONV_NB_K_lpi_1_dfm_st_1_1);
  and_dcpl_49 <= and_dcpl_30 AND (NOT lfst_exit_CONV_NB_K_lpi_1_dfm_st_2_0_1) AND
      reg_exit_CONV_K_D_lpi_1_dfm_2_st_2_cse;
  or_dcpl_26 <= or_dcpl_7 OR (NOT CONV_H_SLIDE_acc_itm_3) OR (NOT CONV_V_SLIDE_acc_itm_4);
  or_dcpl_27 <= CONV_K_D_acc_tmp_2 OR (NOT CONV_H_SLIDE_acc_itm_3);
  or_dcpl_29 <= or_dcpl_1 OR or_dcpl_6;
  or_dcpl_30 <= or_dcpl_29 OR or_dcpl_27 OR (NOT CONV_V_SLIDE_acc_itm_4);
  or_dcpl_31 <= or_dcpl_6 OR or_dcpl_27;
  or_dcpl_32 <= CONV_K_H_acc_tmp_2 OR CONV_K_D_acc_tmp_2;
  or_dcpl_34 <= or_dcpl_1 OR CONV_K_W_acc_tmp_2;
  or_dcpl_37 <= or_dcpl_1 OR lfst_exit_CONV_NB_K_lpi_1_dfm_3_0;
  or_tmp_7 <= ((NOT(main_stage_0_2 AND lfst_exit_CONV_NB_K_lpi_1_dfm_st_1_1)) OR
      lfst_exit_CONV_NB_K_lpi_1_dfm_st_1_0) AND (fsm_output(1));
  or_tmp_10 <= (NOT(main_stage_0_3 AND lfst_exit_CONV_NB_K_lpi_1_dfm_st_2_1_1 AND
      (NOT lfst_exit_CONV_NB_K_lpi_1_dfm_st_2_0_1) AND reg_exit_CONV_K_D_lpi_1_dfm_2_st_2_cse))
      AND (fsm_output(1));
  or_tmp_14 <= or_dcpl_1 AND (NOT PAD_for_for_acc_1_itm_7) AND PAD_for_for_oif_acc_itm_7
      AND (NOT PAD_for_for_else_acc_itm_8) AND PAD_for_for_else_oif_acc_itm_8 AND
      (fsm_output(1));
  pad_input_rsci_wadr_d_mx0c0 <= (NOT main_stage_0_2) OR lfst_exit_CONV_NB_K_lpi_1_dfm_st_1_1;
  PAD_for_for_oif_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(PAD_for_r_6_0_lpi_1_dfm),
      7), 8) + SIGNED'( "10000111"), 8));
  PAD_for_for_oif_acc_itm_7 <= readindex(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(PAD_for_for_oif_acc_nl),
      8)), 7);
  PAD_for_for_else_oif_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(PAD_for_for_c_7_0_lpi_1_dfm),
      8), 9) + SIGNED'( "101011111"), 9));
  PAD_for_for_else_oif_acc_itm_8 <= readindex(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(PAD_for_for_else_oif_acc_nl),
      9)), 8);
  PAD_for_for_else_else_acc_14_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(PAD_for_r_6_0_lpi_1_dfm),
      7), 9) + CONV_SIGNED(CONV_SIGNED(SIGNED(PAD_for_for_else_else_acc_11_sdt(7
      DOWNTO 2)), 6), 9), 9));
  PAD_for_for_else_else_mul_7_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(PAD_d_1_0_lpi_1_dfm)
      * UNSIGNED'( "1001011")), 8));
  PAD_for_for_else_else_acc_10_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(PAD_for_for_else_else_acc_14_nl),
      9)) & (PAD_for_for_else_else_acc_11_sdt(1 DOWNTO 0))) + UNSIGNED(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(PAD_for_for_else_else_mul_7_nl),
      8)) & STD_LOGIC_VECTOR'( "011")), 11));
  PAD_for_for_else_else_PAD_for_for_else_else_and_1_nl <= MUX_v_11_2_2(STD_LOGIC_VECTOR'("00000000000"),
      STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(PAD_for_for_else_else_acc_10_nl), 11)),
      or_tmp_14);
  PAD_for_for_else_else_PAD_for_for_else_else_and_nl <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"),
      (PAD_for_for_else_else_acc_5_psp_sva(4 DOWNTO 0)), or_tmp_14);
  conv_in_rsci_radr_d <= PAD_for_for_else_else_PAD_for_for_else_else_and_1_nl & PAD_for_for_else_else_PAD_for_for_else_else_and_nl;
  conv_in_rsci_re_d <= or_tmp_14;
  CONV_H_SLIDE_not_13_nl <= NOT or_tmp_10;
  CONV_H_SLIDE_CONV_H_SLIDE_and_6_nl <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"),
      CONV_H_SLIDE_acc_10_itm_2_9_2_2, CONV_H_SLIDE_not_13_nl);
  CONV_H_SLIDE_not_nl <= NOT or_tmp_10;
  CONV_H_SLIDE_CONV_H_SLIDE_and_5_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), CONV_H_SLIDE_acc_10_itm_2_1_0_2,
      CONV_H_SLIDE_not_nl);
  not_86_nl <= NOT or_tmp_10;
  o_c_o_c_and_nl <= MUX_v_5_2_2(STD_LOGIC_VECTOR'("00000"), o_c_slc_o_c_7_0_4_0_itm_6,
      not_86_nl);
  not_87_nl <= NOT or_tmp_10;
  o_d_o_d_and_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), o_d_1_0_lpi_1_dfm_8, not_87_nl);
  conv_out_rsci_wadr_d <= CONV_H_SLIDE_CONV_H_SLIDE_and_6_nl & CONV_H_SLIDE_CONV_H_SLIDE_and_5_nl
      & o_c_o_c_and_nl & o_d_o_d_and_nl;
  conv_out_rsci_d_d <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), (temp_1_sva_1(11
      DOWNTO 4)), and_dcpl_49);
  conv_out_rsci_we_d <= and_dcpl_49;
  CONV_K_W_not_2_nl <= NOT or_tmp_7;
  CONV_K_W_CONV_K_W_and_2_nl <= MUX_v_14_2_2(STD_LOGIC_VECTOR'("00000000000000"),
      CONV_K_W_acc_14_itm_1_14_1_2, CONV_K_W_not_2_nl);
  CONV_K_W_CONV_K_W_and_1_nl <= CONV_K_W_acc_14_itm_1_0_2 AND (NOT or_tmp_7);
  CONV_K_W_CONV_K_W_and_nl <= CONV_K_W_slc_CONV_K_W_acc_2_psp_0_itm_4 AND (NOT or_tmp_7);
  pad_input_rsci_radr_d <= CONV_K_W_CONV_K_W_and_2_nl & CONV_K_W_CONV_K_W_and_1_nl
      & CONV_K_W_CONV_K_W_and_nl;
  pad_input_not_nl <= NOT pad_input_rsci_wadr_d_mx0c0;
  pad_input_and_nl <= MUX_v_14_2_2(STD_LOGIC_VECTOR'("00000000000000"), reg_PAD_for_for_if_acc_itm_1_14_1_cse,
      pad_input_not_nl);
  pad_input_and_1_nl <= reg_PAD_for_for_if_acc_itm_1_0_cse AND (NOT pad_input_rsci_wadr_d_mx0c0);
  pad_input_and_2_nl <= reg_PAD_for_for_c_slc_PAD_for_for_c_7_0_0_cse AND (NOT pad_input_rsci_wadr_d_mx0c0);
  pad_input_rsci_wadr_d <= pad_input_and_nl & pad_input_and_1_nl & pad_input_and_2_nl;
  and_65_nl <= and_dcpl_42 AND (NOT PAD_for_for_if_PAD_for_for_if_or_itm_3) AND (NOT
      PAD_for_for_else_if_PAD_for_for_else_if_or_itm_3);
  pad_input_rsci_d_d <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), conv_in_rsci_q_d,
      and_65_nl);
  pad_input_rsci_we_d <= and_dcpl_42;
  pad_input_rsci_re_d <= main_stage_0_2 AND lfst_exit_CONV_NB_K_lpi_1_dfm_st_1_1
      AND (NOT lfst_exit_CONV_NB_K_lpi_1_dfm_st_1_0);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        conv_out_rsc_triosy_obj_ld <= '0';
        conv_in_rsc_triosy_obj_ld <= '0';
        CONV_H_SLIDE_acc_10_itm_2_9_2_2 <= STD_LOGIC_VECTOR'( "00000000");
        CONV_H_SLIDE_acc_10_itm_2_1_0_2 <= STD_LOGIC_VECTOR'( "00");
        o_c_slc_o_c_7_0_4_0_itm_6 <= STD_LOGIC_VECTOR'( "00000");
        o_d_1_0_lpi_1_dfm_8 <= STD_LOGIC_VECTOR'( "00");
        exit_CONV_NB_K_lpi_1_dfm_1_st_4 <= '0';
        reg_exit_CONV_K_D_lpi_1_dfm_2_st_2_cse <= '0';
        CONV_H_SLIDE_CONV_H_SLIDE_and_itm_3 <= STD_LOGIC_VECTOR'( "000000000000");
        CONV_K_W_mux_3_itm_5 <= STD_LOGIC_VECTOR'( "000");
        lfst_exit_CONV_NB_K_lpi_1_dfm_st_2_1_1 <= '0';
        lfst_exit_CONV_NB_K_lpi_1_dfm_st_2_0_1 <= '0';
        reg_PAD_for_for_if_acc_itm_1_14_1_cse <= STD_LOGIC_VECTOR'( "00000000000000");
        reg_PAD_for_for_if_acc_itm_1_0_cse <= '0';
        reg_PAD_for_for_c_slc_PAD_for_for_c_7_0_0_cse <= '0';
        PAD_for_for_else_if_PAD_for_for_else_if_or_itm_3 <= '0';
        PAD_for_for_if_PAD_for_for_if_or_itm_3 <= '0';
        CONV_K_W_acc_14_itm_1_14_1_2 <= STD_LOGIC_VECTOR'( "00000000000000");
        CONV_K_W_acc_14_itm_1_0_2 <= '0';
        CONV_K_W_slc_CONV_K_W_acc_2_psp_0_itm_4 <= '0';
        lfst_exit_CONV_NB_K_lpi_1_dfm_st_1_1 <= '0';
        lfst_exit_CONV_NB_K_lpi_1_dfm_st_1_0 <= '0';
        PAD_for_for_c_7_0_lpi_3 <= STD_LOGIC_VECTOR'( "00000000");
        PAD_for_r_6_0_lpi_3 <= STD_LOGIC_VECTOR'( "0000000");
        lfst_exit_CONV_V_SLIDE_1_lpi_3 <= '0';
        CONV_H_SLIDE_k_7_0_lpi_2 <= STD_LOGIC_VECTOR'( "00000000");
        PAD_d_1_0_lpi_2 <= STD_LOGIC_VECTOR'( "00");
        main_stage_0_2 <= '0';
        main_stage_0_3 <= '0';
        temp_1_lpi_2 <= STD_LOGIC_VECTOR'( "000000000000");
        exit_CONV_H_SLIDE_sva_9 <= '0';
        CONV_NB_K_equal_tmp_7 <= '0';
        lfst_exit_CONV_H_SLIDE_1_lpi_1_dfm_4 <= '0';
        exit_CONV_NB_K_lpi_1_dfm_1_st_3 <= '0';
        exit_CONV_K_D_lpi_1_dfm_2_st_3 <= '0';
        o_c_slc_o_c_7_0_4_0_itm_5 <= STD_LOGIC_VECTOR'( "00000");
        CONV_H_SLIDE_acc_10_itm_1_9_2_1 <= STD_LOGIC_VECTOR'( "00000000");
        CONV_H_SLIDE_acc_10_itm_1_1_0_1 <= STD_LOGIC_VECTOR'( "00");
        CONV_K_W_mux_3_itm_4 <= STD_LOGIC_VECTOR'( "000");
        o_d_1_0_lpi_1_dfm_7 <= STD_LOGIC_VECTOR'( "00");
        exit_CONV_H_SLIDE_sva_8 <= '0';
        CONV_NB_K_equal_tmp_6 <= '0';
        o_c_7_0_lpi_2 <= STD_LOGIC_VECTOR'( "00000000");
        o_r_6_0_lpi_2 <= STD_LOGIC_VECTOR'( "0000000");
        o_d_1_0_lpi_2 <= STD_LOGIC_VECTOR'( "00");
      ELSE
        conv_out_rsc_triosy_obj_ld <= and_dcpl_30 AND (NOT lfst_exit_CONV_NB_K_lpi_1_dfm_st_2_0_1)
            AND exit_CONV_NB_K_lpi_1_dfm_1_st_4;
        conv_in_rsc_triosy_obj_ld <= lfst_exit_CONV_NB_K_lpi_1_dfm_1 AND (NOT CONV_K_W_acc_tmp_2)
            AND (NOT(CONV_K_H_acc_tmp_2 OR CONV_K_D_acc_tmp_2)) AND CONV_H_SLIDE_acc_itm_3
            AND CONV_V_SLIDE_acc_itm_4 AND (NOT(CONV_NB_K_acc_tmp_2 OR lfst_exit_CONV_NB_K_lpi_1_dfm_3_0));
        CONV_H_SLIDE_acc_10_itm_2_9_2_2 <= CONV_H_SLIDE_acc_10_itm_1_9_2_1;
        CONV_H_SLIDE_acc_10_itm_2_1_0_2 <= CONV_H_SLIDE_acc_10_itm_1_1_0_1;
        o_c_slc_o_c_7_0_4_0_itm_6 <= o_c_slc_o_c_7_0_4_0_itm_5;
        o_d_1_0_lpi_1_dfm_8 <= o_d_1_0_lpi_1_dfm_7;
        exit_CONV_NB_K_lpi_1_dfm_1_st_4 <= exit_CONV_NB_K_lpi_1_dfm_1_st_3;
        reg_exit_CONV_K_D_lpi_1_dfm_2_st_2_cse <= exit_CONV_K_D_lpi_1_dfm_2_st_3;
        CONV_H_SLIDE_CONV_H_SLIDE_and_itm_3 <= MUX_v_12_2_2(STD_LOGIC_VECTOR'("000000000000"),
            temp_1_lpi_1_mx0, lfst_exit_CONV_H_SLIDE_1_lpi_1_dfm_4);
        CONV_K_W_mux_3_itm_5 <= CONV_K_W_mux_3_itm_4;
        lfst_exit_CONV_NB_K_lpi_1_dfm_st_2_1_1 <= lfst_exit_CONV_NB_K_lpi_1_dfm_st_1_1;
        lfst_exit_CONV_NB_K_lpi_1_dfm_st_2_0_1 <= lfst_exit_CONV_NB_K_lpi_1_dfm_st_1_0;
        reg_PAD_for_for_if_acc_itm_1_14_1_cse <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(PAD_for_for_if_acc_3_ncse(13
            DOWNTO 1)), 13), 14) + CONV_UNSIGNED(UNSIGNED(PAD_for_for_if_mul_nl),
            14), 14));
        reg_PAD_for_for_if_acc_itm_1_0_cse <= PAD_for_for_if_acc_3_ncse(0);
        reg_PAD_for_for_c_slc_PAD_for_for_c_7_0_0_cse <= PAD_for_for_c_7_0_lpi_1_dfm(0);
        PAD_for_for_else_if_PAD_for_for_else_if_or_itm_3 <= (NOT PAD_for_for_else_oif_acc_itm_8)
            OR PAD_for_for_else_acc_itm_8;
        PAD_for_for_if_PAD_for_for_if_or_itm_3 <= (NOT PAD_for_for_oif_acc_itm_7)
            OR PAD_for_for_acc_1_itm_7;
        CONV_K_W_acc_14_itm_1_14_1_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_K_W_acc_15_sdt(13
            DOWNTO 1)), 13), 14) + CONV_UNSIGNED(UNSIGNED(CONV_K_W_mul_11_nl), 14),
            14));
        CONV_K_W_acc_14_itm_1_0_2 <= CONV_K_W_acc_15_sdt(0);
        CONV_K_W_slc_CONV_K_W_acc_2_psp_0_itm_4 <= CONV_K_W_acc_2_psp_sva(0);
        lfst_exit_CONV_NB_K_lpi_1_dfm_st_1_1 <= lfst_exit_CONV_NB_K_lpi_1_dfm_1;
        lfst_exit_CONV_NB_K_lpi_1_dfm_st_1_0 <= lfst_exit_CONV_NB_K_lpi_1_dfm_0;
        PAD_for_for_c_7_0_lpi_3 <= MUX_v_8_2_2(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            PAD_for_acc_itm_6, 1),8)), PAD_for_for_c_7_0_sva_1, CONV_NB_K_CONV_NB_K_nor_3_nl);
        PAD_for_r_6_0_lpi_3 <= MUX1HOT_v_7_3_2(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            PAD_acc_tmp_2, 1),7)), PAD_for_r_6_0_sva_1, PAD_for_r_6_0_lpi_1_dfm,
            STD_LOGIC_VECTOR'( CONV_NB_K_and_1_nl & CONV_NB_K_and_19_nl & CONV_NB_K_and_20_nl));
        lfst_exit_CONV_V_SLIDE_1_lpi_3 <= MUX_s_1_2_2(PAD_PAD_and_4_nl, (NOT exit_CONV_V_SLIDE_lpi_1_dfm_2),
            CONV_NB_K_equal_tmp);
        CONV_H_SLIDE_k_7_0_lpi_2 <= MUX1HOT_v_8_3_2(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_V_SLIDE_acc_itm_4,
            1),8)), CONV_H_SLIDE_k_7_0_sva_1, CONV_H_SLIDE_k_7_0_lpi_1_dfm, STD_LOGIC_VECTOR'(
            (NOT or_dcpl_31) & CONV_H_SLIDE_k_and_nl & or_dcpl_7));
        PAD_d_1_0_lpi_2 <= MUX_v_2_2_2(PAD_d_1_0_lpi_1_dfm, PAD_d_1_0_sva_1, asn_PAD_d_1_0_lpi_1_nor_cse);
        main_stage_0_2 <= fsm_output(1);
        main_stage_0_3 <= main_stage_0_2;
        temp_1_lpi_2 <= temp_1_lpi_1_mx0;
        exit_CONV_H_SLIDE_sva_9 <= exit_CONV_H_SLIDE_sva_8;
        CONV_NB_K_equal_tmp_7 <= CONV_NB_K_equal_tmp_6;
        lfst_exit_CONV_H_SLIDE_1_lpi_1_dfm_4 <= lfst_exit_CONV_H_SLIDE_1_lpi_1_dfm;
        exit_CONV_NB_K_lpi_1_dfm_1_st_3 <= exit_CONV_NB_K_lpi_1_dfm_1;
        exit_CONV_K_D_lpi_1_dfm_2_st_3 <= exit_CONV_K_D_lpi_1_dfm_2;
        o_c_slc_o_c_7_0_4_0_itm_5 <= o_c_7_0_lpi_1_dfm(4 DOWNTO 0);
        CONV_H_SLIDE_acc_10_itm_1_9_2_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_H_SLIDE_acc_11_sdt_6_0(6
            DOWNTO 2)), 5), 8) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(o_r_6_0_lpi_1_dfm),
            7), 8), 8));
        CONV_H_SLIDE_acc_10_itm_1_1_0_1 <= CONV_H_SLIDE_acc_11_sdt_6_0(1 DOWNTO 0);
        CONV_K_W_mux_3_itm_4 <= MUX_v_3_81_2(STD_LOGIC_VECTOR'( "001"), STD_LOGIC_VECTOR'(
            "010"), STD_LOGIC_VECTOR'( "001"), STD_LOGIC_VECTOR'( "010"), STD_LOGIC_VECTOR'(
            "100"), STD_LOGIC_VECTOR'( "010"), STD_LOGIC_VECTOR'( "001"), STD_LOGIC_VECTOR'(
            "010"), STD_LOGIC_VECTOR'( "001"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'(
            "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'(
            "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'(
            "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'(
            "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'(
            "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'(
            "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'(
            "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'(
            "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'(
            "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'( "001"), STD_LOGIC_VECTOR'(
            "010"), STD_LOGIC_VECTOR'( "001"), STD_LOGIC_VECTOR'( "010"), STD_LOGIC_VECTOR'(
            "100"), STD_LOGIC_VECTOR'( "010"), STD_LOGIC_VECTOR'( "001"), STD_LOGIC_VECTOR'(
            "010"), STD_LOGIC_VECTOR'( "001"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'(
            "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'(
            "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'(
            "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'(
            "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'(
            "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'(
            "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'(
            "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'(
            "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'(
            "000"), STD_LOGIC_VECTOR'( "000"), STD_LOGIC_VECTOR'( "001"), STD_LOGIC_VECTOR'(
            "010"), STD_LOGIC_VECTOR'( "001"), STD_LOGIC_VECTOR'( "010"), STD_LOGIC_VECTOR'(
            "100"), STD_LOGIC_VECTOR'( "010"), STD_LOGIC_VECTOR'( "001"), STD_LOGIC_VECTOR'(
            "010"), STD_LOGIC_VECTOR'( "001"), STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_K_W_asn_pref_pref_pref_4_6_CONV_K_W_acc_nl),
            7)));
        o_d_1_0_lpi_1_dfm_7 <= o_d_1_0_lpi_1_dfm;
        exit_CONV_H_SLIDE_sva_8 <= CONV_H_SLIDE_acc_itm_3;
        CONV_NB_K_equal_tmp_6 <= CONV_NB_K_equal_tmp;
        o_c_7_0_lpi_2 <= MUX_v_8_2_2(CONV_V_SLIDE_CONV_V_SLIDE_and_3_nl, o_c_7_0_lpi_1_dfm,
            or_dcpl_1);
        o_r_6_0_lpi_2 <= MUX_v_7_2_2(CONV_V_SLIDE_CONV_V_SLIDE_and_2_nl, o_r_6_0_lpi_1_dfm,
            or_69_nl);
        o_d_1_0_lpi_2 <= MUX_v_2_2_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_NB_K_acc_1_nl),
            2)), o_d_1_0_lpi_1_dfm, or_dcpl_30);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        lfst_exit_PAD_for_1_lpi_2 <= '0';
      ELSIF ( lfst_exit_CONV_NB_K_lpi_1_dfm_1 = '0' ) THEN
        lfst_exit_PAD_for_1_lpi_2 <= NOT asn_PAD_d_1_0_lpi_1_nor_cse;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        exit_CONV_NB_K_sva_1 <= '0';
      ELSIF ( (NOT((fsm_output(0)) OR or_dcpl_30)) = '1' ) THEN
        exit_CONV_NB_K_sva_1 <= NOT CONV_NB_K_acc_tmp_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_NB_K_i_1_0_lpi_3 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( (CONV_NB_K_nor_dfs OR CONV_NB_K_and_8_rgt) = '1' ) THEN
        CONV_NB_K_i_1_0_lpi_3 <= MUX_v_2_2_2(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            exit_PAD_lpi_1_dfm_2, 1),2)), CONV_NB_K_i_1_0_sva_1, CONV_NB_K_and_8_rgt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        exit_CONV_V_SLIDE_sva_3 <= '0';
      ELSIF ( (NOT((fsm_output(0)) OR or_dcpl_34 OR or_dcpl_32 OR (NOT CONV_H_SLIDE_acc_itm_3)))
          = '1' ) THEN
        exit_CONV_V_SLIDE_sva_3 <= CONV_V_SLIDE_acc_itm_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_V_SLIDE_j_6_0_lpi_3 <= STD_LOGIC_VECTOR'( "0000000");
      ELSIF ( (NOT(or_dcpl_31 AND CONV_NB_K_equal_tmp)) = '1' ) THEN
        CONV_V_SLIDE_j_6_0_lpi_3 <= MUX1HOT_v_7_3_2(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            exit_PAD_lpi_1_dfm_2, 1),7)), STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            CONV_NB_K_acc_tmp_2, 1),7)), CONV_V_SLIDE_j_6_0_sva_1, STD_LOGIC_VECTOR'(
            CONV_NB_K_nor_dfs & CONV_NB_K_and_18_nl & CONV_V_SLIDE_j_and_nl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        exit_CONV_H_SLIDE_sva_7 <= '0';
      ELSIF ( (NOT((fsm_output(0)) OR or_dcpl_34 OR or_dcpl_32)) = '1' ) THEN
        exit_CONV_H_SLIDE_sva_7 <= CONV_H_SLIDE_acc_itm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        exit_CONV_K_D_sva_2 <= '0';
      ELSIF ( (NOT((fsm_output(0)) OR or_dcpl_29)) = '1' ) THEN
        exit_CONV_K_D_sva_2 <= NOT CONV_K_D_acc_tmp_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_n_1_0_lpi_2 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( or_dcpl_37 = '0' ) THEN
        CONV_K_W_n_1_0_lpi_2 <= MUX_v_2_2_2(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            CONV_K_H_acc_tmp_2, 1),2)), CONV_K_W_n_1_0_sva_1, or_68_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        lfst_exit_CONV_K_H_1_lpi_2 <= '0';
      ELSIF ( or_dcpl_1 = '0' ) THEN
        lfst_exit_CONV_K_H_1_lpi_2 <= NOT exit_CONV_K_H_lpi_1_dfm_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_H_m_1_0_lpi_2 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( (nor_13_rgt OR CONV_NB_K_and_17_cse OR nor_tmp) = '1' ) THEN
        CONV_K_H_m_1_0_lpi_2 <= MUX1HOT_v_2_3_2(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            CONV_K_D_acc_tmp_2, 1),2)), CONV_K_H_m_1_0_lpi_1_dfm, CONV_K_H_m_1_0_sva_1,
            STD_LOGIC_VECTOR'( nor_13_rgt & CONV_NB_K_and_17_cse & nor_tmp));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        lfst_exit_CONV_K_D_1_lpi_2 <= '0';
      ELSIF ( or_dcpl_1 = '0' ) THEN
        lfst_exit_CONV_K_D_1_lpi_2 <= NOT exit_CONV_K_D_lpi_1_dfm_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_D_l_1_0_lpi_2 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( (nor_14_rgt OR CONV_K_D_l_and_1_rgt OR and_121_tmp) = '1' ) THEN
        CONV_K_D_l_1_0_lpi_2 <= MUX1HOT_v_2_3_2(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_H_SLIDE_acc_itm_3,
            1),2)), CONV_K_D_l_1_0_lpi_1_dfm, CONV_K_D_l_1_0_sva_1, STD_LOGIC_VECTOR'(
            nor_14_rgt & CONV_K_D_l_and_1_rgt & and_121_tmp));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        lfst_exit_CONV_H_SLIDE_1_lpi_2 <= '0';
      ELSIF ( or_dcpl_1 = '0' ) THEN
        lfst_exit_CONV_H_SLIDE_1_lpi_2 <= NOT exit_CONV_H_SLIDE_lpi_1_dfm_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        lfst_exit_CONV_NB_K_lpi_1_dfm_3_1 <= '0';
      ELSIF ( (fsm_output(0)) = '0' ) THEN
        lfst_exit_CONV_NB_K_lpi_1_dfm_3_1 <= lfst_exit_CONV_NB_K_lpi_1_dfm_3_1_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        exitL_exit_CONV_NB_K_sva <= '1';
      ELSIF ( (fsm_output(0)) = '0' ) THEN
        exitL_exit_CONV_NB_K_sva <= NOT(lfst_exit_CONV_NB_K_lpi_1_dfm_3_1_mx0w0 OR
            lfst_exit_CONV_NB_K_lpi_1_dfm_3_0_mx0w0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        lfst_exit_CONV_NB_K_lpi_1_dfm_3_0 <= '0';
      ELSIF ( (fsm_output(0)) = '0' ) THEN
        lfst_exit_CONV_NB_K_lpi_1_dfm_3_0 <= lfst_exit_CONV_NB_K_lpi_1_dfm_3_0_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        exit_PAD_sva_2 <= '0';
      ELSIF ( (NOT((fsm_output(0)) OR lfst_exit_CONV_NB_K_lpi_1_dfm_1 OR or_dcpl_3))
          = '1' ) THEN
        exit_PAD_sva_2 <= NOT PAD_acc_tmp_2;
      END IF;
    END IF;
  END PROCESS;
  PAD_for_for_if_mul_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(PAD_d_1_0_lpi_1_dfm)
      * UNSIGNED'( "1001101001101")), 14));
  CONV_K_W_mul_11_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(CONV_K_D_l_1_0_lpi_1_dfm)
      * UNSIGNED'( "1001101001101")), 14));
  CONV_NB_K_CONV_NB_K_nor_3_nl <= NOT((NOT PAD_for_for_acc_itm_7) OR lfst_exit_CONV_NB_K_lpi_1_dfm_1);
  CONV_NB_K_and_1_nl <= asn_PAD_d_1_0_lpi_1_nor_cse AND (NOT lfst_exit_CONV_NB_K_lpi_1_dfm_1);
  CONV_NB_K_and_19_nl <= (NOT PAD_for_for_acc_itm_7) AND CONV_NB_K_CONV_NB_K_nor_2_m1c;
  CONV_NB_K_and_20_nl <= PAD_for_for_acc_itm_7 AND CONV_NB_K_CONV_NB_K_nor_2_m1c;
  PAD_PAD_and_4_nl <= lfst_exit_CONV_V_SLIDE_1_lpi_3 AND (NOT exit_PAD_lpi_1_dfm_2);
  CONV_H_SLIDE_k_and_nl <= (NOT or_dcpl_7) AND or_dcpl_31;
  CONV_K_W_acc_20_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_K_D_l_1_0_lpi_1_dfm),
      2), 3) + CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(CONV_K_W_acc_18_sdt(3),
      1), 1), 3), 3));
  CONV_K_W_mul_12_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(CONV_NB_K_i_1_0_lpi_3)
      * UNSIGNED'( "11011")), 7));
  CONV_K_W_asn_pref_pref_pref_4_6_CONV_K_W_acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_K_W_acc_20_nl),
      3)) & (CONV_K_W_acc_18_sdt(2 DOWNTO 0))), 6), 7) + CONV_UNSIGNED(UNSIGNED(CONV_K_W_mul_12_nl),
      7), 7));
  CONV_H_SLIDE_acc_5_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(o_c_7_0_lpi_1_dfm)
      + UNSIGNED'( "00000001"), 8));
  CONV_H_SLIDE_mux_6_nl <= MUX_v_8_2_2(o_c_7_0_lpi_1_dfm, STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_H_SLIDE_acc_5_nl),
      8)), exit_CONV_K_D_lpi_1_dfm_2);
  CONV_V_SLIDE_CONV_V_SLIDE_and_3_nl <= CONV_H_SLIDE_mux_6_nl AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
      exit_CONV_H_SLIDE_lpi_1_dfm_2, 1),8)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
      exit_CONV_V_SLIDE_lpi_1_dfm_2, 1),8));
  CONV_V_SLIDE_acc_1_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(o_r_6_0_lpi_1_dfm)
      + SIGNED'( "0000001"), 7));
  CONV_NB_K_CONV_NB_K_CONV_V_SLIDE_not_4_nl <= NOT exit_CONV_V_SLIDE_lpi_1_dfm_2;
  CONV_V_SLIDE_CONV_V_SLIDE_and_2_nl <= MUX_v_7_2_2(STD_LOGIC_VECTOR'("0000000"),
      STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(CONV_V_SLIDE_acc_1_nl), 7)), CONV_NB_K_CONV_NB_K_CONV_V_SLIDE_not_4_nl);
  or_69_nl <= (NOT exit_CONV_H_SLIDE_lpi_1_dfm_2) OR or_dcpl_1;
  CONV_NB_K_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(o_d_1_0_lpi_1_dfm)
      + UNSIGNED'( "01"), 2));
  CONV_NB_K_and_18_nl <= (NOT or_dcpl_26) AND CONV_NB_K_equal_tmp;
  CONV_V_SLIDE_j_and_nl <= (NOT or_dcpl_31) AND or_dcpl_26 AND CONV_NB_K_equal_tmp;
  or_68_nl <= (NOT(CONV_K_W_acc_tmp_2 OR or_dcpl_37 OR CONV_K_H_acc_tmp_2)) OR CONV_NB_K_and_17_cse;
END v13;

-- ------------------------------------------------------------------
--  Design Unit:    apply_conv
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps_v11.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY apply_conv IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    conv_in_rsc_radr : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    conv_in_rsc_q : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    conv_in_rsc_re : OUT STD_LOGIC;
    conv_in_rsc_triosy_lz : OUT STD_LOGIC;
    conv_out_rsc_wadr : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
    conv_out_rsc_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    conv_out_rsc_we : OUT STD_LOGIC;
    conv_out_rsc_triosy_lz : OUT STD_LOGIC
  );
END apply_conv;

ARCHITECTURE v13 OF apply_conv IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL conv_in_rsci_radr_d : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL conv_in_rsci_re_d : STD_LOGIC;
  SIGNAL conv_in_rsci_q_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL conv_out_rsci_wadr_d : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL conv_out_rsci_d_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL conv_out_rsci_we_d : STD_LOGIC;
  SIGNAL pad_input_rsci_radr_d : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL pad_input_rsci_wadr_d : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL pad_input_rsci_d_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL pad_input_rsci_we_d : STD_LOGIC;
  SIGNAL pad_input_rsci_re_d : STD_LOGIC;
  SIGNAL pad_input_rsci_q_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL pad_input_rsc_we : STD_LOGIC;
  SIGNAL pad_input_rsc_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL pad_input_rsc_wadr : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL pad_input_rsc_re : STD_LOGIC;
  SIGNAL pad_input_rsc_q : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL pad_input_rsc_radr : STD_LOGIC_VECTOR (15 DOWNTO 0);

  SIGNAL pad_input_rsc_comp_radr : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL pad_input_rsc_comp_wadr : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL pad_input_rsc_comp_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL pad_input_rsc_comp_q : STD_LOGIC_VECTOR (7 DOWNTO 0);

  COMPONENT Xilinx_RAMS_BLOCK_1R1W_RBW_rport_8_16_57600_1_gen
    PORT(
      re : OUT STD_LOGIC;
      q : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      re_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL conv_in_rsci_q : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL conv_in_rsci_radr : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL conv_in_rsci_radr_d_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL conv_in_rsci_q_d_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);

  COMPONENT Xilinx_RAMS_BLOCK_1R1W_RBW_wport_8_17_76800_2_gen
    PORT(
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      we_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL conv_out_rsci_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL conv_out_rsci_wadr : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL conv_out_rsci_wadr_d_1 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL conv_out_rsci_d_d_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);

  COMPONENT Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_8_16_59292_3_gen
    PORT(
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      re : OUT STD_LOGIC;
      q : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      we_d : IN STD_LOGIC;
      re_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL pad_input_rsci_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL pad_input_rsci_wadr : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL pad_input_rsci_q : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL pad_input_rsci_radr : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL pad_input_rsci_radr_d_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL pad_input_rsci_wadr_d_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL pad_input_rsci_d_d_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL pad_input_rsci_q_d_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);

  COMPONENT apply_conv_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      conv_in_rsc_triosy_lz : OUT STD_LOGIC;
      conv_out_rsc_triosy_lz : OUT STD_LOGIC;
      conv_in_rsci_radr_d : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      conv_in_rsci_re_d : OUT STD_LOGIC;
      conv_in_rsci_q_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      conv_out_rsci_wadr_d : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
      conv_out_rsci_d_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      conv_out_rsci_we_d : OUT STD_LOGIC;
      pad_input_rsci_radr_d : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      pad_input_rsci_wadr_d : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      pad_input_rsci_d_d : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      pad_input_rsci_we_d : OUT STD_LOGIC;
      pad_input_rsci_re_d : OUT STD_LOGIC;
      pad_input_rsci_q_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL apply_conv_core_inst_conv_in_rsci_radr_d : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL apply_conv_core_inst_conv_in_rsci_q_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL apply_conv_core_inst_conv_out_rsci_wadr_d : STD_LOGIC_VECTOR (16 DOWNTO
      0);
  SIGNAL apply_conv_core_inst_conv_out_rsci_d_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL apply_conv_core_inst_pad_input_rsci_radr_d : STD_LOGIC_VECTOR (15 DOWNTO
      0);
  SIGNAL apply_conv_core_inst_pad_input_rsci_wadr_d : STD_LOGIC_VECTOR (15 DOWNTO
      0);
  SIGNAL apply_conv_core_inst_pad_input_rsci_d_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL apply_conv_core_inst_pad_input_rsci_q_d : STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN
  -- Default Constant Signal Assignments

  pad_input_rsc_comp : work.block_1r1w_rbw_pkg.BLOCK_1R1W_RBW
    GENERIC MAP(
      data_width => 8,
      addr_width => 16,
      depth => 59292
      )
    PORT MAP(
      radr => pad_input_rsc_comp_radr,
      wadr => pad_input_rsc_comp_wadr,
      d => pad_input_rsc_comp_d,
      we => pad_input_rsc_we,
      re => pad_input_rsc_re,
      clk => clk,
      q => pad_input_rsc_comp_q
    );
  pad_input_rsc_comp_radr <= pad_input_rsc_radr;
  pad_input_rsc_comp_wadr <= pad_input_rsc_wadr;
  pad_input_rsc_comp_d <= pad_input_rsc_d;
  pad_input_rsc_q <= pad_input_rsc_comp_q;

  conv_in_rsci : Xilinx_RAMS_BLOCK_1R1W_RBW_rport_8_16_57600_1_gen
    PORT MAP(
      re => conv_in_rsc_re,
      q => conv_in_rsci_q,
      radr => conv_in_rsci_radr,
      radr_d => conv_in_rsci_radr_d_1,
      re_d => conv_in_rsci_re_d,
      q_d => conv_in_rsci_q_d_1
    );
  conv_in_rsci_q <= conv_in_rsc_q;
  conv_in_rsc_radr <= conv_in_rsci_radr;
  conv_in_rsci_radr_d_1 <= conv_in_rsci_radr_d;
  conv_in_rsci_q_d <= conv_in_rsci_q_d_1;

  conv_out_rsci : Xilinx_RAMS_BLOCK_1R1W_RBW_wport_8_17_76800_2_gen
    PORT MAP(
      we => conv_out_rsc_we,
      d => conv_out_rsci_d,
      wadr => conv_out_rsci_wadr,
      wadr_d => conv_out_rsci_wadr_d_1,
      d_d => conv_out_rsci_d_d_1,
      we_d => conv_out_rsci_we_d
    );
  conv_out_rsc_d <= conv_out_rsci_d;
  conv_out_rsc_wadr <= conv_out_rsci_wadr;
  conv_out_rsci_wadr_d_1 <= conv_out_rsci_wadr_d;
  conv_out_rsci_d_d_1 <= conv_out_rsci_d_d;

  pad_input_rsci : Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_8_16_59292_3_gen
    PORT MAP(
      we => pad_input_rsc_we,
      d => pad_input_rsci_d,
      wadr => pad_input_rsci_wadr,
      re => pad_input_rsc_re,
      q => pad_input_rsci_q,
      radr => pad_input_rsci_radr,
      radr_d => pad_input_rsci_radr_d_1,
      wadr_d => pad_input_rsci_wadr_d_1,
      d_d => pad_input_rsci_d_d_1,
      we_d => pad_input_rsci_we_d,
      re_d => pad_input_rsci_re_d,
      q_d => pad_input_rsci_q_d_1
    );
  pad_input_rsc_d <= pad_input_rsci_d;
  pad_input_rsc_wadr <= pad_input_rsci_wadr;
  pad_input_rsci_q <= pad_input_rsc_q;
  pad_input_rsc_radr <= pad_input_rsci_radr;
  pad_input_rsci_radr_d_1 <= pad_input_rsci_radr_d;
  pad_input_rsci_wadr_d_1 <= pad_input_rsci_wadr_d;
  pad_input_rsci_d_d_1 <= pad_input_rsci_d_d;
  pad_input_rsci_q_d <= pad_input_rsci_q_d_1;

  apply_conv_core_inst : apply_conv_core
    PORT MAP(
      clk => clk,
      rst => rst,
      conv_in_rsc_triosy_lz => conv_in_rsc_triosy_lz,
      conv_out_rsc_triosy_lz => conv_out_rsc_triosy_lz,
      conv_in_rsci_radr_d => apply_conv_core_inst_conv_in_rsci_radr_d,
      conv_in_rsci_re_d => conv_in_rsci_re_d,
      conv_in_rsci_q_d => apply_conv_core_inst_conv_in_rsci_q_d,
      conv_out_rsci_wadr_d => apply_conv_core_inst_conv_out_rsci_wadr_d,
      conv_out_rsci_d_d => apply_conv_core_inst_conv_out_rsci_d_d,
      conv_out_rsci_we_d => conv_out_rsci_we_d,
      pad_input_rsci_radr_d => apply_conv_core_inst_pad_input_rsci_radr_d,
      pad_input_rsci_wadr_d => apply_conv_core_inst_pad_input_rsci_wadr_d,
      pad_input_rsci_d_d => apply_conv_core_inst_pad_input_rsci_d_d,
      pad_input_rsci_we_d => pad_input_rsci_we_d,
      pad_input_rsci_re_d => pad_input_rsci_re_d,
      pad_input_rsci_q_d => apply_conv_core_inst_pad_input_rsci_q_d
    );
  conv_in_rsci_radr_d <= apply_conv_core_inst_conv_in_rsci_radr_d;
  apply_conv_core_inst_conv_in_rsci_q_d <= conv_in_rsci_q_d;
  conv_out_rsci_wadr_d <= apply_conv_core_inst_conv_out_rsci_wadr_d;
  conv_out_rsci_d_d <= apply_conv_core_inst_conv_out_rsci_d_d;
  pad_input_rsci_radr_d <= apply_conv_core_inst_pad_input_rsci_radr_d;
  pad_input_rsci_wadr_d <= apply_conv_core_inst_pad_input_rsci_wadr_d;
  pad_input_rsci_d_d <= apply_conv_core_inst_pad_input_rsci_d_d;
  apply_conv_core_inst_pad_input_rsci_q_d <= pad_input_rsci_q_d;

END v13;



