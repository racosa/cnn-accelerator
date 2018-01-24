
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



--------> /softl3/catapultc10_0a/64bit/Mgc_home/pkgs/hls_pkgs/mgc_comps_src/mgc_comps.vhd 
LIBRARY ieee;

USE ieee.std_logic_1164.all;


USE work.funcs.all;

PACKAGE mgc_comps IS

COMPONENT mgc_not
  GENERIC (
    width  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    z: out std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_and
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_nand
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_or
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_nor
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_xor
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_xnor
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mux
  GENERIC (
    width  :  NATURAL;
    ctrlw  :  NATURAL;
    p2ctrlw : NATURAL := 0
  );
  PORT (
    a: in  std_logic_vector(width*(2**ctrlw) - 1 DOWNTO 0);
    c: in  std_logic_vector(ctrlw            - 1 DOWNTO 0);
    z: out std_logic_vector(width            - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mux1hot
  GENERIC (
    width  : NATURAL;
    ctrlw  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ctrlw - 1 DOWNTO 0);
    c: in  std_logic_vector(ctrlw       - 1 DOWNTO 0);
    z: out std_logic_vector(width       - 1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_reg_pos
  GENERIC (
    width  : NATURAL;
    has_a_rst : NATURAL;  -- 0 to 1
    a_rst_on  : NATURAL;  -- 0 to 1
    has_s_rst : NATURAL;  -- 0 to 1
    s_rst_on  : NATURAL;  -- 0 to 1
    has_enable : NATURAL; -- 0 to 1
    enable_on  : NATURAL  -- 0 to 1
  );
  PORT (
    clk: in  std_logic;
    d  : in  std_logic_vector(width-1 DOWNTO 0);
    z  : out std_logic_vector(width-1 DOWNTO 0);
    sync_rst_val : in std_logic_vector(width-1 DOWNTO 0);
    sync_rst : in std_logic;
    async_rst_val : in std_logic_vector(width-1 DOWNTO 0);
    async_rst : in std_logic;
    en : in std_logic
  );
END COMPONENT;

COMPONENT mgc_reg_neg
  GENERIC (
    width  : NATURAL;
    has_a_rst : NATURAL;  -- 0 to 1
    a_rst_on  : NATURAL;  -- 0 to 1
    has_s_rst : NATURAL;  -- 0 to 1
    s_rst_on  : NATURAL;   -- 0 to 1
    has_enable : NATURAL; -- 0 to 1
    enable_on  : NATURAL -- 0 to 1
  );
  PORT (
    clk: in  std_logic;
    d  : in  std_logic_vector(width-1 DOWNTO 0);
    z  : out std_logic_vector(width-1 DOWNTO 0);
    sync_rst_val : in std_logic_vector(width-1 DOWNTO 0);
    sync_rst : in std_logic;
    async_rst_val : in std_logic_vector(width-1 DOWNTO 0);
    async_rst : in std_logic;
    en : in std_logic
  );
END COMPONENT;

COMPONENT mgc_generic_reg
  GENERIC(
   width: natural := 8;
   ph_clk: integer range 0 to 1 := 1; -- clock polarity, 1=rising_edge
   ph_en: integer range 0 to 1 := 1;
   ph_a_rst: integer range 0 to 1 := 1;   --  0 to 1 IGNORED
   ph_s_rst: integer range 0 to 1 := 1;   --  0 to 1 IGNORED
   a_rst_used: integer range 0 to 1 := 1;
   s_rst_used: integer range 0 to 1 := 0;
   en_used: integer range 0 to 1 := 1
  );
  PORT(
   d: std_logic_vector(width-1 downto 0);
   clk: in std_logic;
   en: in std_logic;
   a_rst: in std_logic;
   s_rst: in std_logic;
   q: out std_logic_vector(width-1 downto 0)
  );
END COMPONENT;

COMPONENT mgc_equal
  GENERIC (
    width  : NATURAL
  );
  PORT (
    a : in  std_logic_vector(width-1 DOWNTO 0);
    b : in  std_logic_vector(width-1 DOWNTO 0);
    eq: out std_logic;
    ne: out std_logic
  );
END COMPONENT;

COMPONENT mgc_shift_l
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_shift_r
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_shift_bl
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_shift_br
  GENERIC (
    width_a: NATURAL;
    signd_a: NATURAL;
    width_s: NATURAL;
    width_z: NATURAL
  );
  PORT (
    a : in  std_logic_vector(width_a-1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_rot
  GENERIC (
    width  : NATURAL;
    width_s: NATURAL;
    signd_s: NATURAL;      -- 0:unsigned 1:signed
    sleft  : NATURAL;      -- 0:right 1:left;
    log2w  : NATURAL := 0; -- LOG2(width)
    l2wp2  : NATURAL := 0  --2**LOG2(width)
  );
  PORT (
    a : in  std_logic_vector(width  -1 DOWNTO 0);
    s : in  std_logic_vector(width_s-1 DOWNTO 0);
    z : out std_logic_vector(width  -1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_add
  GENERIC (
    width   : NATURAL; 
    signd_a : NATURAL := 0;
    width_b : NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b : NATURAL := 0;
    width_z : NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_sub
  GENERIC (
    width   : NATURAL; 
    signd_a : NATURAL := 0;
    width_b : NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b : NATURAL := 0;
    width_z : NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_add_ci
  GENERIC (
    width_a : NATURAL; 
    signd_a : NATURAL := 0;
    width_b : NATURAL := 0; -- if == 0 use width_a, compatiability with versions < 2005a
    signd_b : NATURAL := 0;
    width_z : NATURAL := 0  -- if == 0 use width_a, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width_a,width_b)-1 DOWNTO 0);
    c: in  std_logic_vector(0 DOWNTO 0);
    z: out std_logic_vector(ifeqsel(width_z,0,width_a,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_addc
  GENERIC (
    width   : NATURAL; 
    signd_a : NATURAL := 0;
    width_b : NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b : NATURAL := 0;
    width_z : NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    c: in  std_logic_vector(0 DOWNTO 0);
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_add_pipe
  GENERIC (
     width_a : natural := 16;
     signd_a : integer range 0 to 1 := 0;
     width_b : natural := 3;
     signd_b : integer range 0 to 1 := 0;
     width_z : natural := 18;
     ph_clk : integer range 0 to 1 := 1;
     ph_en : integer range 0 to 1 := 1;
     ph_a_rst : integer range 0 to 1 := 1;
     ph_s_rst : integer range 0 to 1 := 1;
     n_outreg : natural := 2;
     stages : natural := 2; -- Default value is minimum required value
     a_rst_used: integer range 0 to 1 := 1;
     s_rst_used: integer range 0 to 1 := 0;
     en_used: integer range 0 to 1 := 1
     );
  PORT(
     a: in std_logic_vector(width_a-1 downto 0);
     b: in std_logic_vector(width_b-1 downto 0);
     clk: in std_logic;
     en: in std_logic;
     a_rst: in std_logic;
     s_rst: in std_logic;
     z: out std_logic_vector(width_z-1 downto 0)
     );
END COMPONENT;

COMPONENT mgc_sub_pipe
  GENERIC (
     width_a : natural := 16;
     signd_a : integer range 0 to 1 := 0;
     width_b : natural := 3;
     signd_b : integer range 0 to 1 := 0;
     width_z : natural := 18;
     ph_clk : integer range 0 to 1 := 1;
     ph_en : integer range 0 to 1 := 1;
     ph_a_rst : integer range 0 to 1 := 1;
     ph_s_rst : integer range 0 to 1 := 1;
     n_outreg : natural := 2;
     stages : natural := 2; -- Default value is minimum required value
     a_rst_used: integer range 0 to 1 := 1;
     s_rst_used: integer range 0 to 1 := 0;
     en_used: integer range 0 to 1 := 1
     );
  PORT(
     a: in std_logic_vector(width_a-1 downto 0);
     b: in std_logic_vector(width_b-1 downto 0);
     clk: in std_logic;
     en: in std_logic;
     a_rst: in std_logic;
     s_rst: in std_logic;
     z: out std_logic_vector(width_z-1 downto 0)
     );
END COMPONENT;

COMPONENT mgc_addc_pipe
  GENERIC (
     width_a : natural := 16;
     signd_a : integer range 0 to 1 := 0;
     width_b : natural := 3;
     signd_b : integer range 0 to 1 := 0;
     width_z : natural := 18;
     ph_clk : integer range 0 to 1 := 1;
     ph_en : integer range 0 to 1 := 1;
     ph_a_rst : integer range 0 to 1 := 1;
     ph_s_rst : integer range 0 to 1 := 1;
     n_outreg : natural := 2;
     stages : natural := 2; -- Default value is minimum required value
     a_rst_used: integer range 0 to 1 := 1;
     s_rst_used: integer range 0 to 1 := 0;
     en_used: integer range 0 to 1 := 1
     );
  PORT(
     a: in std_logic_vector(width_a-1 downto 0);
     b: in std_logic_vector(width_b-1 downto 0);
     c: in std_logic_vector(0 downto 0);
     clk: in std_logic;
     en: in std_logic;
     a_rst: in std_logic;
     s_rst: in std_logic;
     z: out std_logic_vector(width_z-1 downto 0)
     );
END COMPONENT;

COMPONENT mgc_addsub
  GENERIC (
    width   : NATURAL; 
    signd_a : NATURAL := 0;
    width_b : NATURAL := 0; -- if == 0 use width, compatiability with versions < 2005a
    signd_b : NATURAL := 0;
    width_z : NATURAL := 0  -- if == 0 use width, compatiability with versions < 2005a
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    b: in  std_logic_vector(ifeqsel(width_b,0,width,width_b)-1 DOWNTO 0);
    add: in  std_logic;
    z: out std_logic_vector(ifeqsel(width_z,0,width,width_z)-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_accu
  GENERIC (
    width  : NATURAL;
    ninps  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width*ninps-1 DOWNTO 0);
    z: out std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_abs
  GENERIC (
    width  : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width-1 DOWNTO 0);
    z: out std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mul
  GENERIC (
    width_a : NATURAL;
    signd_a : NATURAL;
    width_b : NATURAL;
    signd_b : NATURAL;
    width_z : NATURAL    -- <= width_a + width_b
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mul_fast
  GENERIC (
    width_a : NATURAL;
    signd_a : NATURAL;
    width_b : NATURAL;
    signd_b : NATURAL;
    width_z : NATURAL    -- <= width_a + width_b
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mul_pipe
  GENERIC (
    width_a       : NATURAL;
    signd_a       : NATURAL;
    width_b       : NATURAL;
    signd_b       : NATURAL;
    width_z       : NATURAL; -- <= width_a + width_b
    clock_edge    : NATURAL; -- 0 to 1
    enable_active : NATURAL; -- 0 to 1
    a_rst_active  : NATURAL; -- 0 to 1 IGNORED
    s_rst_active  : NATURAL; -- 0 to 1 IGNORED
    stages        : NATURAL;    
    n_inreg       : NATURAL := 0 -- default for backwards compatability 

  );
  PORT (
    a     : in  std_logic_vector(width_a-1 DOWNTO 0);
    b     : in  std_logic_vector(width_b-1 DOWNTO 0);
    clk   : in  std_logic;
    en    : in  std_logic;
    a_rst : in  std_logic;
    s_rst : in  std_logic;
    z     : out std_logic_vector(width_z-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_div
  GENERIC (
    width_a : NATURAL;
    width_b : NATURAL;
    signd   : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_a-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_mod
  GENERIC (
    width_a : NATURAL;
    width_b : NATURAL;
    signd   : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_b-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_rem
  GENERIC (
    width_a : NATURAL;
    width_b : NATURAL;
    signd   : NATURAL
  );
  PORT (
    a: in  std_logic_vector(width_a-1 DOWNTO 0);
    b: in  std_logic_vector(width_b-1 DOWNTO 0);
    z: out std_logic_vector(width_b-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_csa
  GENERIC (
     width : NATURAL
  );
  PORT (
     a: in std_logic_vector(width-1 downto 0);
     b: in std_logic_vector(width-1 downto 0);
     c: in std_logic_vector(width-1 downto 0);
     s: out std_logic_vector(width-1 downto 0);
     cout: out std_logic_vector(width-1 downto 0)
  );
END COMPONENT;

COMPONENT mgc_csha
  GENERIC (
     width : NATURAL
  );
  PORT (
     a: in std_logic_vector(width-1 downto 0);
     b: in std_logic_vector(width-1 downto 0);
     s: out std_logic_vector(width-1 downto 0);
     cout: out std_logic_vector(width-1 downto 0)
  );
END COMPONENT;

COMPONENT mgc_rom
    GENERIC (
      rom_id : natural := 1;
      size : natural := 33;
      width : natural := 32
      );
    PORT (
      data_in : std_logic_vector((size*width)-1 downto 0);
      addr : std_logic_vector(ceil_log2(size)-1 downto 0);
      data_out : out std_logic_vector(width-1 downto 0)
    );
END COMPONENT;

END mgc_comps;

--------> /softl3/catapultc10_0a/64bit/Mgc_home/pkgs/hls_pkgs/mgc_comps_src/mgc_generic_reg_beh.vhd 
LIBRARY ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity mgc_generic_reg is
  GENERIC(
   width: natural := 8;
   ph_clk: integer range 0 to 1 := 1; -- clock polarity, 1=rising_edge
   ph_en: integer range 0 to 1 := 1;
   ph_a_rst: integer range 0 to 1 := 1;   --  0 to 1 IGNORED
   ph_s_rst: integer range 0 to 1 := 1;   --  0 to 1 IGNORED
   a_rst_used: integer range 0 to 1 := 1;
   s_rst_used: integer range 0 to 1 := 0;
   en_used: integer range 0 to 1 := 1
  );
  PORT(
   d: std_logic_vector(width-1 downto 0);
   clk: in std_logic;
   en: in std_logic;
   a_rst: in std_logic;
   s_rst: in std_logic;
   q: out std_logic_vector(width-1 downto 0)
  );
end mgc_generic_reg;

architecture rtl of mgc_generic_reg is
begin
    BLK_S_RST_USED: if s_rst_used = 1 generate
      BLK_CLK_POS: if ph_clk = 1 generate
        process(a_rst, clk)
        begin
          IF conv_integer(a_rst) = ph_a_rst THEN
            q <= (others => '0');
          ELSIF (clk'event and clk = '1') then
            IF conv_integer(s_rst) = ph_s_rst then
              q <= (others => '0');
            ELSIF conv_integer(en) = ph_en then
              q <= d;
            end if;
          end if;
        end process;
      end generate BLK_CLK_POS;
      BLK_CLK_NEG: if ph_clk = 0 generate
        process(a_rst, clk)
        begin
          IF conv_integer(a_rst) = ph_a_rst THEN
            q <= (others => '0');
          ELSIF (clk'event and clk = '0') then
            IF conv_integer(s_rst) = ph_s_rst then
              q <= (others => '0');
            ELSIF conv_integer(en) = ph_en then
              q <= d;
            end if;
          end if;
        end process;
      end generate BLK_CLK_NEG;
    end generate BLK_S_RST_USED;
    
    BLK_S_RST_NOT_USED: if s_rst_used = 0 generate
      BLK_CLK_POS: if ph_clk = 1 generate
        process(a_rst, clk)
        begin
          IF conv_integer(a_rst) = ph_a_rst THEN
            q <= (others => '0');
          ELSIF (clk'event and clk = '1') then
            IF conv_integer(en) = ph_en then
              q <= d;
            end if;
          end if;
        end process;
      end generate BLK_CLK_POS;
      BLK_CLK_NEG: if ph_clk = 0 generate
        process(a_rst, clk)
        begin
          IF conv_integer(a_rst) = ph_a_rst THEN
            q <= (others => '0');
          ELSIF (clk'event and clk = '0') then
            IF conv_integer(en) = ph_en then
              q <= d;
            end if;
          end if;
        end process;
      end generate BLK_CLK_NEG;
    end generate BLK_S_RST_NOT_USED;
end rtl;

--------> /softl3/catapultc10_0a/64bit/Mgc_home/pkgs/siflibs/ram_singleport_be_fpga.vhd 
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

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL ;
USE IEEE.STD_LOGIC_ARITH.ALL ;

PACKAGE singleport_ram_be_pkg IS

  COMPONENT singleport_ram_be
   GENERIC (ram_id           : integer;
            words            : integer;
            width            : integer;
            addr_width       : integer;
            a_reset_active   : integer;
            s_reset_active   : integer;
            enable_active    : integer;
            re_active        : integer;
            we_active        : integer;
            num_byte_enables : integer;
            clock_edge       : integer;
            num_input_registers          : integer;
            num_output_registers         : integer;
            no_of_singleport_readwrite_port  : integer
           );
     PORT (
           data_in    : IN  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * width) - 1 DOWNTO 0) ;
           addr       : IN  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * addr_width) - 1 DOWNTO 0) ;
           re         : IN  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port*num_byte_enables) - 1 DOWNTO 0);
           we         : IN  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port*num_byte_enables) - 1 DOWNTO 0);
           data_out   : OUT STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * width) - 1 DOWNTO 0);
           clk        : IN  std_logic;
           a_rst      : IN std_logic;
           s_rst      : IN std_logic;
           en         : IN std_logic
          );

  END COMPONENT;

  component singleport_ram_be_port
   generic (ram_id           : integer;
            words            : integer;
            width            : integer;
            addr_width       : integer;
            a_reset_active   : integer;
            s_reset_active   : integer;
            enable_active    : integer;
            re_active        : integer;
            we_active        : integer;
            num_byte_enables : integer;
            clock_edge       : integer;
            num_input_registers          : integer;
            num_output_registers         : integer;
            no_of_singleport_readwrite_port  : integer
           );
     port (
           data_in_d  : in  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * width) - 1 downto 0) ;
           addr_d     : in  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * addr_width) - 1 downto 0) ;
           re_d       : in  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port*num_byte_enables) - 1 downto 0);
           we_d       : in  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port*num_byte_enables) - 1 downto 0);
           data_out_d : out STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * width) - 1 downto 0);
           data_in    : out STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * width) - 1 downto 0) ;
           addr       : out  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * addr_width) - 1 downto 0) ;
           re         : out  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port*num_byte_enables) - 1 downto 0);
           we         : out  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port*num_byte_enables) - 1 downto 0);
           data_out   : in STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * width) - 1 downto 0);
           clk        : in  std_logic;
           a_rst      : in std_logic;
           s_rst      : in std_logic;
           en         : in std_logic
          );
  end component;

END singleport_ram_be_pkg;

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL ;
USE IEEE.STD_LOGIC_ARITH.ALL ;
USE IEEE.STD_LOGIC_UNSIGNED.ALL ;

USE work.singleport_ram_be_pkg.ALL;

  ENTITY singleport_ram_be IS
   GENERIC (ram_id           : integer := 1;
            words            : integer := 256;
            width            : integer := 8;
            addr_width       : integer := 8;
            a_reset_active   : integer := 0;
            s_reset_active   : integer := 1;
            enable_active    : integer := 1;
            re_active        : integer := 1;
            we_active        : integer := 1;
            num_byte_enables : integer := 1;
            clock_edge       : integer := 1;
            num_input_registers          : integer := 1;
            num_output_registers         : integer := 0;
            no_of_singleport_readwrite_port  : integer := 1
     );
     PORT (
           data_in    : IN  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * width) - 1 DOWNTO 0) ;
           addr       : IN  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * addr_width) - 1 DOWNTO 0) ;
           re         : IN  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port*num_byte_enables) - 1 DOWNTO 0);
           we         : IN  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port*num_byte_enables) - 1 DOWNTO 0);
           data_out   : OUT STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * width) - 1 DOWNTO 0);
           clk        : IN  std_logic;
           a_rst      : IN std_logic;
           s_rst      : IN  std_logic;
           en         : IN std_logic
          );
  END singleport_ram_be ;

  ARCHITECTURE rtl OF singleport_ram_be IS
    TYPE mem_type IS ARRAY ((words)-1 DOWNTO 0) OF
                        STD_LOGIC_VECTOR(width - 1 DOWNTO 0) ;
    SIGNAL mem : mem_type ;

    TYPE d_array IS ARRAY (integer RANGE <>) OF STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    TYPE addr_array IS ARRAY (integer RANGE <>) OF STD_LOGIC_VECTOR(addr_width-1 DOWNTO 0);
    TYPE en_array IS ARRAY (integer RANGE <>) OF STD_LOGIC_VECTOR(num_byte_enables - 1 DOWNTO 0);

    SIGNAL data_out_f : STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    SIGNAL data_in_f  : STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    SIGNAL addr_f     : STD_LOGIC_VECTOR(addr_width-1 DOWNTO 0);
    SIGNAL re_f       : STD_LOGIC_VECTOR(num_byte_enables - 1 DOWNTO 0);
    SIGNAL we_f       : STD_LOGIC_VECTOR(num_byte_enables - 1 DOWNTO 0);

    SIGNAL addr_reg   : STD_LOGIC_VECTOR(addr_width - 1 DOWNTO 0);
    SIGNAL re_reg     : STD_LOGIC_VECTOR(num_byte_enables - 1 DOWNTO 0);

    CONSTANT byte_width : integer := width / num_byte_enables;
    CONSTANT clock_edge_stdlogic : STD_LOGIC := conv_std_logic_vector(clock_edge,1)(0);

    FUNCTION cmp_ulogic_int(arg1 : STD_ULOGIC; arg2 : INTEGER) RETURN BOOLEAN IS
    BEGIN
      CASE arg2 IS
        WHEN 1 => RETURN arg1 = '1' OR arg1 = 'H';
        WHEN 0 => RETURN arg1 = '0' OR arg1 = 'L';
        WHEN OTHERS => ASSERT false
                       REPORT "Invalid integer value for phase - valid range is from 0 to 1"
                       SEVERITY FAILURE;
                       RETURN false;
      END CASE;
    END cmp_ulogic_int;
BEGIN

    N_INREG_GT_1 : IF (num_input_registers > 1) GENERATE
     SIGNAL data_in_inreg: d_array(num_input_registers-2 DOWNTO 0);
     SIGNAL addr_inreg: addr_array(num_input_registers-2 DOWNTO 0);
     SIGNAL re_inreg : en_array(num_input_registers-2 DOWNTO 0);
     SIGNAL we_inreg : en_array(num_input_registers-2 DOWNTO 0);

     CONSTANT PWR: integer RANGE 0 TO 1 := 1;
     CONSTANT GND: integer RANGE 0 TO 1 := 0;
     CONSTANT GND_sig: std_logic := '0';
    BEGIN
      pipe: FOR i_in IN num_input_registers - 3 DOWNTO 0 GENERATE
        i_data_in_inreg : work.mgc_comps.mgc_generic_reg
                      GENERIC MAP (width, clock_edge, enable_active, a_reset_active, s_reset_active, GND, GND, PWR)
                      PORT MAP (data_in_inreg(i_in), clk, en, a_rst, s_rst, data_in_inreg(i_in+1));
        i_addr_inreg : work.mgc_comps.mgc_generic_reg
                      GENERIC MAP (addr_width, clock_edge, enable_active, a_reset_active, s_reset_active, GND, GND, PWR)
                      PORT MAP (addr_inreg(i_in), clk, en, a_rst, s_rst, addr_inreg(i_in+1));
        i_re_inreg : work.mgc_comps.mgc_generic_reg
                      GENERIC MAP (num_byte_enables, clock_edge, enable_active, a_reset_active, s_reset_active, GND, GND, PWR)
                      PORT MAP (re_inreg(i_in), clk, en, a_rst, s_rst, re_inreg(i_in+1));
        i_we_inreg : work.mgc_comps.mgc_generic_reg
                      GENERIC MAP (num_byte_enables, clock_edge, enable_active, a_reset_active, s_reset_active, GND, GND, PWR)
                      PORT MAP (we_inreg(i_in), clk, en, a_rst, s_rst, we_inreg(i_in+1));
      END GENERATE pipe;

      i_data_in_inreg_i : work.mgc_comps.mgc_generic_reg
                    GENERIC MAP (width, clock_edge, enable_active, a_reset_active, s_reset_active, GND, GND, PWR)
                    PORT MAP (data_in, clk, en, a_rst, s_rst, data_in_inreg(0));
      i_addr_inreg_i : work.mgc_comps.mgc_generic_reg
                    GENERIC MAP (addr_width, clock_edge, enable_active, a_reset_active, s_reset_active, GND, GND, PWR)
                    PORT MAP (addr, clk, en, a_rst, s_rst, addr_inreg(0));
      i_re_inreg_i : work.mgc_comps.mgc_generic_reg
                    GENERIC MAP (num_byte_enables, clock_edge, enable_active, a_reset_active, s_reset_active, GND, GND, PWR)
                    PORT MAP (re, clk, en, a_rst, s_rst, re_inreg(0));
      i_we_inreg_i : work.mgc_comps.mgc_generic_reg
                    GENERIC MAP (num_byte_enables, clock_edge, enable_active, a_reset_active, s_reset_active, GND, GND, PWR)
                    PORT MAP (we, clk, en, a_rst, s_rst, we_inreg(0));


      data_in_f <= data_in_inreg(num_input_registers-2);
      addr_f <= addr_inreg(num_input_registers-2);
      re_f <= re_inreg(num_input_registers-2);
      we_f <= we_inreg(num_input_registers-2);

    END GENERATE N_INREG_GT_1;

    INREG_EQ_1: IF num_input_registers = 1 GENERATE
      data_in_f <= data_in;
      addr_f <= addr;
      re_f <= re;
      we_f <= we;

    END GENERATE INREG_EQ_1;
    	--pragma translate_off
    	CHECK_ADDR_DONTCARE: PROCESS(clk)
    	BEGIN
     	IF ( clk'event AND clk = clock_edge_stdlogic ) THEN
        IF (conv_integer(en) = enable_active) THEN
        		FOR i IN 0 TO addr_width-1 LOOP    
          		IF (addr_f(i) = 'X' OR addr_f(i) = 'Z') THEN    	
          		  FOR j IN 0 TO num_byte_enables - 1 LOOP
            			ASSERT cmp_ulogic_int(we_f(j), we_active) = false
            			  REPORT "Error: Dont-care address for pipelined singleport memory-write"
            			  SEVERITY FAILURE;
            			ASSERT cmp_ulogic_int(re_f(j), re_active) = false
            			  REPORT "Error: Dont-care or High-Impedance address for pipelined singleport memory-read"
            			  SEVERITY FAILURE;
          		  END LOOP;
          		END IF;
        		END LOOP;
        END IF;
      END IF;
    	END PROCESS;

    	--pragma translate_on
    MW : PROCESS (clk)
           VARIABLE addr_int : integer;
    BEGIN
      IF ( clk'event AND clk = clock_edge_stdlogic ) THEN
        IF (conv_integer(en) = enable_active) THEN
          addr_reg <= addr_f;
  	       re_reg   <= re_f;
          addr_int := conv_integer(addr_f);
          IF (addr_int < words AND addr_int >= 0) THEN
            FOR i IN 0 TO num_byte_enables - 1 LOOP
              IF cmp_ulogic_int(we_f(i), we_active) THEN
                mem(addr_int)(i*byte_width + byte_width - 1 DOWNTO i*byte_width) <= data_in_f(i*byte_width + byte_width - 1 DOWNTO i*byte_width);
              END IF;
            END LOOP;
          ELSE
            FOR i IN 0 TO num_byte_enables - 1 LOOP
              ASSERT cmp_ulogic_int(we_f(i), we_active) = false
                REPORT "Error: Out-of-bound pipelined singleport memory-write"
                SEVERITY FAILURE;
            END LOOP;
          END IF;
        END IF;
      END IF;
    END PROCESS;

    MR: PROCESS(mem, addr_reg, re_reg)
        VARIABLE addr_int: integer;
    BEGIN
        addr_int := conv_integer(addr_reg);
        IF (addr_int < words AND addr_int >= 0) THEN
          -- data_out_f <= mem(addr_int);
          FOR k IN 0 TO num_byte_enables - 1 LOOP
            IF cmp_ulogic_int(re_reg(k), re_active) THEN
              data_out_f(k*byte_width + byte_width - 1 DOWNTO k*byte_width) <= mem(addr_int)(k*byte_width + byte_width - 1 DOWNTO k*byte_width);
            ELSE
              data_out_f(k*byte_width + byte_width - 1 DOWNTO k*byte_width) <= (OTHERS => 'X');
            END IF;
          END LOOP;
        ELSE
          data_out_f <= (OTHERS => 'X');
        END IF;
    END PROCESS;

    -- REGISTER BANKS at the output
    N_OUTREG_GT_0: IF num_output_registers > 0 GENERATE
     SIGNAL data_out_outreg: d_array(num_output_registers-1 DOWNTO 0);

     CONSTANT PWR: integer RANGE 0 TO 1 := 1;
     CONSTANT GND: integer RANGE 0 TO 1 := 0;
     CONSTANT GND_sig: std_logic := '0';
    BEGIN
      N_OUTREG_SHIFT: FOR i_out IN num_output_registers - 2 DOWNTO 0 GENERATE
      BEGIN
        i_data_out_outreg : work.mgc_comps.mgc_generic_reg
                      GENERIC MAP (width, clock_edge, enable_active, a_reset_active, s_reset_active, GND, GND, PWR)
                      PORT MAP (data_out_outreg(i_out), clk, en, a_rst, s_rst, data_out_outreg(i_out+1));
      END GENERATE N_OUTREG_SHIFT;

      i_data_out_outreg_i : work.mgc_comps.mgc_generic_reg
                    GENERIC MAP (width, clock_edge, enable_active, a_reset_active, s_reset_active, GND, GND, PWR)
                    PORT MAP (data_out_f, clk, en, a_rst, s_rst, data_out_outreg(0));
      data_out <= data_out_outreg(num_output_registers-1);
    END GENERATE N_OUTREG_GT_0;

    N_OUTREG_EQ_0: IF num_output_registers = 0 GENERATE
      data_out <= data_out_f;
    END GENERATE N_OUTREG_EQ_0;
  END RTL ;

LIBRARY ieee;

use IEEE.std_logic_1164.all ;
use IEEE.std_logic_arith.all ;
use IEEE.std_logic_unsigned.all ;

USE work.singleport_ram_be_pkg.all;

  entity singleport_ram_be_port is
   generic (ram_id           : integer;
            words            : integer;
            width            : integer;
            addr_width       : integer;
            a_reset_active   : integer;
            s_reset_active   : integer;
            enable_active    : integer;
            re_active        : integer;
            we_active        : integer;
            num_byte_enables : integer;
            clock_edge       : integer;
            num_input_registers          : integer;
            num_output_registers         : integer;
            no_of_singleport_readwrite_port  : integer
           );
     port (
           data_in_d  : in  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * width) - 1 downto 0) ;
           addr_d     : in  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * addr_width) - 1 downto 0) ;
           re_d       : in  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port*num_byte_enables) - 1 downto 0);
           we_d       : in  STD_LOGIC_VECTOR((no_of_singleport_readwrite_port*num_byte_enables) - 1 downto 0);
           data_out_d : out STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * width) - 1 downto 0);
           data_in    : out STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * width) - 1 downto 0) ;
           addr       : out STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * addr_width) - 1 downto 0) ;
           re         : out STD_LOGIC_VECTOR((no_of_singleport_readwrite_port*num_byte_enables) - 1 downto 0);
           we         : out STD_LOGIC_VECTOR((no_of_singleport_readwrite_port*num_byte_enables) - 1 downto 0);
           data_out   : in STD_LOGIC_VECTOR((no_of_singleport_readwrite_port * width) - 1 downto 0);
           clk        : in std_logic;
           a_rst      : in std_logic;
           s_rst      : in std_logic;
           en         : in std_logic
          );
  end singleport_ram_be_port;

  architecture rtl of singleport_ram_be_port is
  begin
    data_in     <= data_in_d;
    addr        <= addr_d;
    re          <= re_d;
    we          <= we_d;
    data_out_d  <= data_out;
  end rtl;

--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.0a/269363 Production Release
--  HLS Date:       Wed Nov  9 17:38:00 PST 2016
-- 
--  Generated by:   xph3sei702@cimeld95
--  Generated date: Wed Jan 24 16:08:27 2018
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    ram_Xilinx_ARTIX_7_2_RAMSB_singleport_rwport_en_3_59292_10_16_0_1_0_0_0_1_1_1_0_59292_10_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps_v11.ALL;
USE work.singleport_ram_be_pkg.ALL;


ENTITY ram_Xilinx_ARTIX_7_2_RAMSB_singleport_rwport_en_3_59292_10_16_0_1_0_0_0_1_1_1_0_59292_10_1_gen
    IS
  PORT(
    en : OUT STD_LOGIC;
    data_out : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    we : OUT STD_LOGIC;
    re : OUT STD_LOGIC;
    addr : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    data_in : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    data_in_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    addr_d : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    re_d : IN STD_LOGIC;
    we_d : IN STD_LOGIC;
    data_out_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    en_d : IN STD_LOGIC
  );
END ram_Xilinx_ARTIX_7_2_RAMSB_singleport_rwport_en_3_59292_10_16_0_1_0_0_0_1_1_1_0_59292_10_1_gen;

ARCHITECTURE v2 OF ram_Xilinx_ARTIX_7_2_RAMSB_singleport_rwport_en_3_59292_10_16_0_1_0_0_0_1_1_1_0_59292_10_1_gen
    IS
  -- Default Constants

BEGIN
  -- Default Constant Signal Assignments

  en <= (en_d);
  data_out_d <= data_out;
  we <= (we_d);
  re <= (re_d);
  addr <= (addr_d);
  data_in <= (data_in_d);
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    ram_Xilinx_ARTIX_7_2_RAMSB_singleport_wport_2_57600_11_16_0_1_0_0_0_1_1_1_0_57600_11_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps_v11.ALL;
USE work.singleport_ram_be_pkg.ALL;


ENTITY ram_Xilinx_ARTIX_7_2_RAMSB_singleport_wport_2_57600_11_16_0_1_0_0_0_1_1_1_0_57600_11_1_gen
    IS
  PORT(
    we : OUT STD_LOGIC;
    addr : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    data_in : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    data_in_d : IN STD_LOGIC_VECTOR (10 DOWNTO 0);
    addr_d : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    we_d : IN STD_LOGIC
  );
END ram_Xilinx_ARTIX_7_2_RAMSB_singleport_wport_2_57600_11_16_0_1_0_0_0_1_1_1_0_57600_11_1_gen;

ARCHITECTURE v2 OF ram_Xilinx_ARTIX_7_2_RAMSB_singleport_wport_2_57600_11_16_0_1_0_0_0_1_1_1_0_57600_11_1_gen
    IS
  -- Default Constants

BEGIN
  -- Default Constant Signal Assignments

  we <= (we_d);
  addr <= (addr_d);
  data_in <= (data_in_d);
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    ram_Xilinx_ARTIX_7_2_RAMSB_singleport_rport_1_57600_10_16_0_1_0_0_0_1_1_1_0_57600_10_1_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps_v11.ALL;
USE work.singleport_ram_be_pkg.ALL;


ENTITY ram_Xilinx_ARTIX_7_2_RAMSB_singleport_rport_1_57600_10_16_0_1_0_0_0_1_1_1_0_57600_10_1_gen
    IS
  PORT(
    data_out : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    re : OUT STD_LOGIC;
    addr : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    addr_d : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    re_d : IN STD_LOGIC;
    data_out_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0)
  );
END ram_Xilinx_ARTIX_7_2_RAMSB_singleport_rport_1_57600_10_16_0_1_0_0_0_1_1_1_0_57600_10_1_gen;

ARCHITECTURE v2 OF ram_Xilinx_ARTIX_7_2_RAMSB_singleport_rport_1_57600_10_16_0_1_0_0_0_1_1_1_0_57600_10_1_gen
    IS
  -- Default Constants

BEGIN
  -- Default Constant Signal Assignments

  data_out_d <= data_out;
  re <= (re_d);
  addr <= (addr_d);
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    apply_conv_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps_v11.ALL;
USE work.singleport_ram_be_pkg.ALL;


ENTITY apply_conv_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (40 DOWNTO 0);
    PAD_for_for_C_3_tr0 : IN STD_LOGIC;
    PAD_for_C_0_tr0 : IN STD_LOGIC;
    PAD_C_0_tr0 : IN STD_LOGIC;
    CONV_H_SLIDE_C_30_tr0 : IN STD_LOGIC;
    CONV_V_SLIDE_C_0_tr0 : IN STD_LOGIC;
    CONV_NB_K_C_0_tr0 : IN STD_LOGIC
  );
END apply_conv_core_core_fsm;

ARCHITECTURE v2 OF apply_conv_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for apply_conv_core_core_fsm_1
  TYPE apply_conv_core_core_fsm_1_ST IS (main_C_0, PAD_for_for_C_0, PAD_for_for_C_1,
      PAD_for_for_C_2, PAD_for_for_C_3, PAD_for_C_0, PAD_C_0, CONV_H_SLIDE_C_0, CONV_H_SLIDE_C_1,
      CONV_H_SLIDE_C_2, CONV_H_SLIDE_C_3, CONV_H_SLIDE_C_4, CONV_H_SLIDE_C_5, CONV_H_SLIDE_C_6,
      CONV_H_SLIDE_C_7, CONV_H_SLIDE_C_8, CONV_H_SLIDE_C_9, CONV_H_SLIDE_C_10, CONV_H_SLIDE_C_11,
      CONV_H_SLIDE_C_12, CONV_H_SLIDE_C_13, CONV_H_SLIDE_C_14, CONV_H_SLIDE_C_15,
      CONV_H_SLIDE_C_16, CONV_H_SLIDE_C_17, CONV_H_SLIDE_C_18, CONV_H_SLIDE_C_19,
      CONV_H_SLIDE_C_20, CONV_H_SLIDE_C_21, CONV_H_SLIDE_C_22, CONV_H_SLIDE_C_23,
      CONV_H_SLIDE_C_24, CONV_H_SLIDE_C_25, CONV_H_SLIDE_C_26, CONV_H_SLIDE_C_27,
      CONV_H_SLIDE_C_28, CONV_H_SLIDE_C_29, CONV_H_SLIDE_C_30, CONV_V_SLIDE_C_0,
      CONV_NB_K_C_0, main_C_1);

  SIGNAL state_var : apply_conv_core_core_fsm_1_ST;
  SIGNAL state_var_NS : apply_conv_core_core_fsm_1_ST;

BEGIN
  -- Default Constant Signal Assignments

  apply_conv_core_core_fsm_1 : PROCESS (PAD_for_for_C_3_tr0, PAD_for_C_0_tr0, PAD_C_0_tr0,
      CONV_H_SLIDE_C_30_tr0, CONV_V_SLIDE_C_0_tr0, CONV_NB_K_C_0_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN PAD_for_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000010");
        state_var_NS <= PAD_for_for_C_1;
      WHEN PAD_for_for_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000100");
        state_var_NS <= PAD_for_for_C_2;
      WHEN PAD_for_for_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000001000");
        state_var_NS <= PAD_for_for_C_3;
      WHEN PAD_for_for_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000010000");
        IF ( PAD_for_for_C_3_tr0 = '1' ) THEN
          state_var_NS <= PAD_for_C_0;
        ELSE
          state_var_NS <= PAD_for_for_C_0;
        END IF;
      WHEN PAD_for_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000100000");
        IF ( PAD_for_C_0_tr0 = '1' ) THEN
          state_var_NS <= PAD_C_0;
        ELSE
          state_var_NS <= PAD_for_for_C_0;
        END IF;
      WHEN PAD_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000001000000");
        IF ( PAD_C_0_tr0 = '1' ) THEN
          state_var_NS <= CONV_H_SLIDE_C_0;
        ELSE
          state_var_NS <= PAD_for_for_C_0;
        END IF;
      WHEN CONV_H_SLIDE_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000010000000");
        state_var_NS <= CONV_H_SLIDE_C_1;
      WHEN CONV_H_SLIDE_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000100000000");
        state_var_NS <= CONV_H_SLIDE_C_2;
      WHEN CONV_H_SLIDE_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000001000000000");
        state_var_NS <= CONV_H_SLIDE_C_3;
      WHEN CONV_H_SLIDE_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000010000000000");
        state_var_NS <= CONV_H_SLIDE_C_4;
      WHEN CONV_H_SLIDE_C_4 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000100000000000");
        state_var_NS <= CONV_H_SLIDE_C_5;
      WHEN CONV_H_SLIDE_C_5 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000001000000000000");
        state_var_NS <= CONV_H_SLIDE_C_6;
      WHEN CONV_H_SLIDE_C_6 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000010000000000000");
        state_var_NS <= CONV_H_SLIDE_C_7;
      WHEN CONV_H_SLIDE_C_7 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000100000000000000");
        state_var_NS <= CONV_H_SLIDE_C_8;
      WHEN CONV_H_SLIDE_C_8 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000001000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_9;
      WHEN CONV_H_SLIDE_C_9 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000010000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_10;
      WHEN CONV_H_SLIDE_C_10 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000100000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_11;
      WHEN CONV_H_SLIDE_C_11 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000001000000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_12;
      WHEN CONV_H_SLIDE_C_12 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000010000000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_13;
      WHEN CONV_H_SLIDE_C_13 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000100000000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_14;
      WHEN CONV_H_SLIDE_C_14 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000001000000000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_15;
      WHEN CONV_H_SLIDE_C_15 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000010000000000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_16;
      WHEN CONV_H_SLIDE_C_16 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000100000000000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_17;
      WHEN CONV_H_SLIDE_C_17 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000001000000000000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_18;
      WHEN CONV_H_SLIDE_C_18 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000010000000000000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_19;
      WHEN CONV_H_SLIDE_C_19 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000100000000000000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_20;
      WHEN CONV_H_SLIDE_C_20 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000001000000000000000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_21;
      WHEN CONV_H_SLIDE_C_21 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000010000000000000000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_22;
      WHEN CONV_H_SLIDE_C_22 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000100000000000000000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_23;
      WHEN CONV_H_SLIDE_C_23 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000001000000000000000000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_24;
      WHEN CONV_H_SLIDE_C_24 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000010000000000000000000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_25;
      WHEN CONV_H_SLIDE_C_25 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000100000000000000000000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_26;
      WHEN CONV_H_SLIDE_C_26 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000001000000000000000000000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_27;
      WHEN CONV_H_SLIDE_C_27 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000010000000000000000000000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_28;
      WHEN CONV_H_SLIDE_C_28 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000100000000000000000000000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_29;
      WHEN CONV_H_SLIDE_C_29 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00001000000000000000000000000000000000000");
        state_var_NS <= CONV_H_SLIDE_C_30;
      WHEN CONV_H_SLIDE_C_30 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00010000000000000000000000000000000000000");
        IF ( CONV_H_SLIDE_C_30_tr0 = '1' ) THEN
          state_var_NS <= CONV_V_SLIDE_C_0;
        ELSE
          state_var_NS <= CONV_H_SLIDE_C_0;
        END IF;
      WHEN CONV_V_SLIDE_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "00100000000000000000000000000000000000000");
        IF ( CONV_V_SLIDE_C_0_tr0 = '1' ) THEN
          state_var_NS <= CONV_NB_K_C_0;
        ELSE
          state_var_NS <= CONV_H_SLIDE_C_0;
        END IF;
      WHEN CONV_NB_K_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "01000000000000000000000000000000000000000");
        IF ( CONV_NB_K_C_0_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= CONV_H_SLIDE_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10000000000000000000000000000000000000000");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000000000001");
        state_var_NS <= PAD_for_for_C_0;
    END CASE;
  END PROCESS apply_conv_core_core_fsm_1;

  apply_conv_core_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= main_C_0;
      ELSE
        state_var <= state_var_NS;
      END IF;
    END IF;
  END PROCESS apply_conv_core_core_fsm_1_REG;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    apply_conv_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps_v11.ALL;
USE work.singleport_ram_be_pkg.ALL;


ENTITY apply_conv_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    conv_in_rsc_triosy_lz : OUT STD_LOGIC;
    conv_out_rsc_triosy_lz : OUT STD_LOGIC;
    conv_in_rsci_addr_d : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    conv_in_rsci_re_d : OUT STD_LOGIC;
    conv_in_rsci_data_out_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    conv_out_rsci_data_in_d : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    conv_out_rsci_addr_d : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    conv_out_rsci_we_d : OUT STD_LOGIC;
    pad_input_rsci_data_in_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    pad_input_rsci_addr_d : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    pad_input_rsci_re_d : OUT STD_LOGIC;
    pad_input_rsci_we_d : OUT STD_LOGIC;
    pad_input_rsci_data_out_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0)
  );
END apply_conv_core;

ARCHITECTURE v2 OF apply_conv_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL fsm_output : STD_LOGIC_VECTOR (40 DOWNTO 0);
  SIGNAL and_dcpl_4 : STD_LOGIC;
  SIGNAL and_dcpl_28 : STD_LOGIC;
  SIGNAL and_dcpl_36 : STD_LOGIC;
  SIGNAL or_tmp_76 : STD_LOGIC;
  SIGNAL o_d_1_0_sva_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL PAD_d_1_0_sva_3 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL PAD_for_r_6_0_sva_4 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL PAD_for_for_c_7_0_sva_3 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL PAD_for_for_c_7_0_sva_4 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_NB_K_i_1_0_sva_3 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL o_r_6_0_lpi_4 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL CONV_V_SLIDE_j_6_0_sva_2 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL o_c_7_0_lpi_4 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_H_SLIDE_k_7_0_sva_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_K_W_acc_2_psp_5_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_K_H_1_CONV_K_W_acc_17_cse_1_sva : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL PAD_for_for_if_PAD_for_for_if_or_itm : STD_LOGIC;
  SIGNAL PAD_for_for_else_if_PAD_for_for_else_if_or_itm_1 : STD_LOGIC;
  SIGNAL PAD_for_for_c_slc_PAD_for_for_c_7_0_0_1_itm_1 : STD_LOGIC;
  SIGNAL PAD_for_for_else_else_slc_PAD_for_for_else_else_acc_5_psp_4_0_itm_3 : STD_LOGIC_VECTOR
      (4 DOWNTO 0);
  SIGNAL PAD_for_for_c_slc_PAD_for_for_c_7_0_0_2_itm : STD_LOGIC;
  SIGNAL PAD_for_for_slc_PAD_for_for_acc_7_itm : STD_LOGIC;
  SIGNAL CONV_K_D_1_CONV_K_W_acc_itm_1 : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL CONV_K_W_mux_itm : STD_LOGIC;
  SIGNAL CONV_K_D_1_CONV_K_H_3_CONV_K_W_1_acc_14_itm : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL CONV_K_W_mux_1_itm : STD_LOGIC;
  SIGNAL CONV_K_D_1_CONV_K_H_3_CONV_K_W_2_acc_14_itm : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL CONV_K_W_mux_2_itm : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_acc_14_itm : STD_LOGIC_VECTOR (13 DOWNTO
      0);
  SIGNAL CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_CONV_K_W_and_itm_1 : STD_LOGIC_VECTOR (10
      DOWNTO 0);
  SIGNAL CONV_K_W_acc_53_itm : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_acc_62_itm_1 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_mux_4_itm : STD_LOGIC;
  SIGNAL CONV_K_W_mux_5_itm : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL CONV_K_W_mux_7_itm : STD_LOGIC;
  SIGNAL CONV_K_W_acc_51_itm : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_acc_61_itm : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_mux_8_itm : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL CONV_K_D_2_CONV_K_H_2_CONV_K_W_3_CONV_K_W_and_itm_1 : STD_LOGIC_VECTOR (10
      DOWNTO 0);
  SIGNAL CONV_K_W_mux_10_itm : STD_LOGIC;
  SIGNAL CONV_K_W_mux_11_itm : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL CONV_K_W_acc_49_itm : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_mux_13_itm : STD_LOGIC;
  SIGNAL CONV_K_W_mux_14_itm : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL CONV_K_D_3_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm_1 : STD_LOGIC_VECTOR (10
      DOWNTO 0);
  SIGNAL CONV_K_W_acc_47_itm : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_acc_59_itm : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_acc_65_itm : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_mux_16_itm : STD_LOGIC;
  SIGNAL CONV_K_W_mux_17_itm : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL CONV_K_W_mux_19_itm : STD_LOGIC;
  SIGNAL CONV_K_W_acc_45_itm : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_acc_58_itm_1 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_mux_20_itm : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL CONV_K_D_3_CONV_K_H_3_CONV_K_W_3_CONV_K_W_and_itm_1 : STD_LOGIC_VECTOR (10
      DOWNTO 0);
  SIGNAL CONV_K_W_mux_22_itm : STD_LOGIC;
  SIGNAL CONV_K_D_1_CONV_K_H_1_CONV_K_W_1_CONV_K_W_and_itm : STD_LOGIC_VECTOR (10
      DOWNTO 0);
  SIGNAL CONV_K_W_acc_57_itm : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_mux_23_itm : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL CONV_K_D_1_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm_1 : STD_LOGIC_VECTOR (10
      DOWNTO 0);
  SIGNAL CONV_K_W_acc_56_itm_1 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_mux_26_itm : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL CONV_K_W_acc_55_itm : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_acc_63_itm : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_acc_67_itm : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_H_SLIDE_slc_CONV_H_SLIDE_acc_3_itm : STD_LOGIC;
  SIGNAL CONV_H_SLIDE_acc_5_itm_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_K_W_acc_29_sdt : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_K_W_acc_30_sdt : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_K_W_acc_26_sdt : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_K_W_acc_27_sdt : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_K_W_acc_28_sdt : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_K_W_acc_72_psp : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_K_W_acc_71_psp : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_K_W_acc_85_psp : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_K_W_acc_84_psp : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_K_W_acc_83_psp : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_H_SLIDE_acc_15_psp_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_K_W_acc_79_psp : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_K_W_acc_78_psp : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_K_W_acc_77_psp : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_K_W_acc_73_psp : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL PAD_for_for_if_acc_ncse_2 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL PAD_for_for_else_else_acc_itm_14_1_1 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL PAD_for_for_else_else_acc_itm_0_2 : STD_LOGIC;
  SIGNAL CONV_K_W_acc_82_psp_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL CONV_K_W_acc_81_psp_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL CONV_K_W_acc_80_psp_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL CONV_K_W_acc_76_psp_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL CONV_K_W_acc_75_psp_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL CONV_K_W_acc_74_psp_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL CONV_K_W_acc_88_psp_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL CONV_K_W_acc_87_psp_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL CONV_K_W_acc_86_psp_11_0 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL PAD_for_for_else_else_acc_5_psp_sva_2_7_5 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL CONV_K_D_3_CONV_K_H_2_CONV_K_W_CONV_K_W_conc_3_4_2 : STD_LOGIC_VECTOR (2
      DOWNTO 0);
  SIGNAL CONV_K_D_3_CONV_K_H_1_CONV_K_W_CONV_K_W_conc_4_4_1 : STD_LOGIC_VECTOR (3
      DOWNTO 0);
  SIGNAL CONV_K_W_conc_87_1 : STD_LOGIC;
  SIGNAL reg_CONV_H_SLIDE_acc_12_psp_tmp_5 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL reg_CONV_H_SLIDE_acc_14_sdt_tmp_7 : STD_LOGIC;
  SIGNAL CONV_K_W_acc_23_psp_sva : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL CONV_K_W_acc_69_psp : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL reg_conv_out_rsc_triosy_obj_ld_cse : STD_LOGIC;
  SIGNAL or_9_cse : STD_LOGIC;
  SIGNAL reg_o_c_7_o_c_or_cse : STD_LOGIC;
  SIGNAL reg_CONV_V_SLIDE_j_6_CONV_V_SLIDE_j_or_cse : STD_LOGIC;
  SIGNAL reg_PAD_d_1_PAD_d_or_cse : STD_LOGIC;
  SIGNAL PAD_for_for_if_acc_ncse : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL PAD_for_for_if_acc_3_ncse : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL z_out : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL z_out_4 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL z_out_5 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_6 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_7 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_8 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_9 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_10 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_11 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_12 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL z_out_13 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL z_out_14 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL z_out_15 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL z_out_16 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL PAD_for_for_else_else_acc_5_psp_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_K_D_1_CONV_K_H_2_CONV_K_W_1_acc_3 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL CONV_H_SLIDE_acc_14_sdt_mx0w0 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm_mx0w0 : STD_LOGIC_VECTOR (13
      DOWNTO 0);
  SIGNAL CONV_K_W_acc_2_psp_5_sva_mx0w0 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_K_W_acc_29_sdt_mx0w0 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_K_W_acc_30_sdt_mx0w0 : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL CONV_K_H_1_CONV_K_W_acc_17_cse_1_sva_mx0w0 : STD_LOGIC_VECTOR (6 DOWNTO
      0);
  SIGNAL CONV_K_D_1_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm : STD_LOGIC_VECTOR (10
      DOWNTO 0);
  SIGNAL CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_D_3_CONV_K_H_2_CONV_K_W_3_CONV_K_W_and_2 : STD_LOGIC_VECTOR (10 DOWNTO
      0);
  SIGNAL CONV_K_D_2_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_2 : STD_LOGIC_VECTOR (10 DOWNTO
      0);
  SIGNAL reg_CONV_K_D_1_CONV_K_H_2_CONV_K_W_2_mul_10_cse : STD_LOGIC_VECTOR (10 DOWNTO
      0);
  SIGNAL reg_CONV_K_W_acc_44_cse : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL reg_PAD_for_for_if_acc_3_ncse_cse : STD_LOGIC;
  SIGNAL or_dcpl : STD_LOGIC;
  SIGNAL or_dcpl_11 : STD_LOGIC;
  SIGNAL z_out_3_7_0 : STD_LOGIC_VECTOR (7 DOWNTO 0);

  SIGNAL PAD_for_for_c_nor_nl : STD_LOGIC;
  SIGNAL PAD_d_not_nl : STD_LOGIC;
  SIGNAL PAD_for_for_acc_1_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL PAD_for_for_oif_acc_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL or_nl : STD_LOGIC;
  SIGNAL PAD_for_for_else_acc_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL PAD_for_for_else_oif_acc_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL CONV_H_SLIDE_acc_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL PAD_for_for_if_mul_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL PAD_for_for_if_PAD_for_for_if_mul_nl : STD_LOGIC_VECTOR (13 DOWNTO 0);
  SIGNAL PAD_for_for_else_else_acc_10_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL PAD_for_for_else_else_acc_14_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL CONV_H_SLIDE_mux_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_H_SLIDE_and_nl : STD_LOGIC;
  SIGNAL CONV_H_SLIDE_else_if_acc_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL CONV_H_SLIDE_not_2_nl : STD_LOGIC;
  SIGNAL pad_input_or_nl : STD_LOGIC;
  SIGNAL pad_input_mux1h_nl : STD_LOGIC;
  SIGNAL pad_input_mux1h_2_nl : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL pad_input_mux1h_3_nl : STD_LOGIC;
  SIGNAL pad_input_or_1_nl : STD_LOGIC;
  SIGNAL pad_input_or_2_nl : STD_LOGIC;
  SIGNAL pad_input_or_3_nl : STD_LOGIC;
  SIGNAL pad_input_or_4_nl : STD_LOGIC;
  SIGNAL pad_input_or_5_nl : STD_LOGIC;
  SIGNAL pad_input_or_6_nl : STD_LOGIC;
  SIGNAL pad_input_or_7_nl : STD_LOGIC;
  SIGNAL pad_input_or_8_nl : STD_LOGIC;
  SIGNAL pad_input_or_9_nl : STD_LOGIC;
  SIGNAL pad_input_mux1h_4_nl : STD_LOGIC;
  SIGNAL pad_input_or_10_nl : STD_LOGIC;
  SIGNAL pad_input_or_11_nl : STD_LOGIC;
  SIGNAL pad_input_or_12_nl : STD_LOGIC;
  SIGNAL pad_input_or_13_nl : STD_LOGIC;
  SIGNAL pad_input_or_14_nl : STD_LOGIC;
  SIGNAL pad_input_or_15_nl : STD_LOGIC;
  SIGNAL pad_input_or_16_nl : STD_LOGIC;
  SIGNAL pad_input_or_17_nl : STD_LOGIC;
  SIGNAL pad_input_or_18_nl : STD_LOGIC;
  SIGNAL pad_input_mux1h_1_nl : STD_LOGIC;
  SIGNAL pad_input_or_19_nl : STD_LOGIC;
  SIGNAL pad_input_or_20_nl : STD_LOGIC;
  SIGNAL CONV_NB_K_CONV_NB_K_and_1_nl : STD_LOGIC;
  SIGNAL CONV_NB_K_mux1h_2_nl : STD_LOGIC;
  SIGNAL PAD_for_for_mux_2_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL PAD_for_for_mux_3_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL CONV_V_SLIDE_CONV_V_SLIDE_mux_1_nl : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL CONV_V_SLIDE_or_2_nl : STD_LOGIC;
  SIGNAL CONV_V_SLIDE_nor_1_nl : STD_LOGIC;
  SIGNAL CONV_V_SLIDE_mux1h_2_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL CONV_V_SLIDE_or_3_nl : STD_LOGIC;
  SIGNAL CONV_H_SLIDE_mux_10_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL CONV_H_SLIDE_mux_11_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL CONV_K_W_mux1h_10_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL and_325_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL mux_1_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_or_9_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_mux1h_11_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_acc_89_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_acc_90_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_or_10_nl : STD_LOGIC;
  SIGNAL CONV_K_W_or_11_nl : STD_LOGIC;
  SIGNAL or_148_nl : STD_LOGIC;
  SIGNAL nor_25_nl : STD_LOGIC;
  SIGNAL CONV_K_W_mux1h_12_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_or_12_nl : STD_LOGIC;
  SIGNAL CONV_K_W_CONV_K_W_mux_1_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_mux1h_13_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_mux1h_14_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_or_13_nl : STD_LOGIC;
  SIGNAL CONV_K_W_mux_92_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_or_14_nl : STD_LOGIC;
  SIGNAL CONV_K_W_mux_93_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_mux_94_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_mux_95_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_mux_96_nl : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL CONV_K_W_mux1h_15_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL CONV_K_W_mux1h_16_nl : STD_LOGIC;
  SIGNAL CONV_K_W_mux_97_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  COMPONENT apply_conv_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (40 DOWNTO 0);
      PAD_for_for_C_3_tr0 : IN STD_LOGIC;
      PAD_for_C_0_tr0 : IN STD_LOGIC;
      PAD_C_0_tr0 : IN STD_LOGIC;
      CONV_H_SLIDE_C_30_tr0 : IN STD_LOGIC;
      CONV_V_SLIDE_C_0_tr0 : IN STD_LOGIC;
      CONV_NB_K_C_0_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL apply_conv_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (40 DOWNTO 0);
  SIGNAL apply_conv_core_core_fsm_inst_PAD_for_for_C_3_tr0 : STD_LOGIC;
  SIGNAL apply_conv_core_core_fsm_inst_PAD_for_C_0_tr0 : STD_LOGIC;
  SIGNAL apply_conv_core_core_fsm_inst_PAD_C_0_tr0 : STD_LOGIC;
  SIGNAL apply_conv_core_core_fsm_inst_CONV_H_SLIDE_C_30_tr0 : STD_LOGIC;
  SIGNAL apply_conv_core_core_fsm_inst_CONV_V_SLIDE_C_0_tr0 : STD_LOGIC;
  SIGNAL apply_conv_core_core_fsm_inst_CONV_NB_K_C_0_tr0 : STD_LOGIC;

  FUNCTION MUX1HOT_s_1_12_2(input_11 : STD_LOGIC;
  input_10 : STD_LOGIC;
  input_9 : STD_LOGIC;
  input_8 : STD_LOGIC;
  input_7 : STD_LOGIC;
  input_6 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_4 : STD_LOGIC;
  input_3 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(11 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      tmp := sel(0);
      result := input_0 and tmp;
      tmp := sel(1);
      result := result or ( input_1 and tmp);
      tmp := sel(2);
      result := result or ( input_2 and tmp);
      tmp := sel(3);
      result := result or ( input_3 and tmp);
      tmp := sel(4);
      result := result or ( input_4 and tmp);
      tmp := sel(5);
      result := result or ( input_5 and tmp);
      tmp := sel(6);
      result := result or ( input_6 and tmp);
      tmp := sel(7);
      result := result or ( input_7 and tmp);
      tmp := sel(8);
      result := result or ( input_8 and tmp);
      tmp := sel(9);
      result := result or ( input_9 and tmp);
      tmp := sel(10);
      result := result or ( input_10 and tmp);
      tmp := sel(11);
      result := result or ( input_11 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_s_1_21_2(input_20 : STD_LOGIC;
  input_19 : STD_LOGIC;
  input_18 : STD_LOGIC;
  input_17 : STD_LOGIC;
  input_16 : STD_LOGIC;
  input_15 : STD_LOGIC;
  input_14 : STD_LOGIC;
  input_13 : STD_LOGIC;
  input_12 : STD_LOGIC;
  input_11 : STD_LOGIC;
  input_10 : STD_LOGIC;
  input_9 : STD_LOGIC;
  input_8 : STD_LOGIC;
  input_7 : STD_LOGIC;
  input_6 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_4 : STD_LOGIC;
  input_3 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(20 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      tmp := sel(0);
      result := input_0 and tmp;
      tmp := sel(1);
      result := result or ( input_1 and tmp);
      tmp := sel(2);
      result := result or ( input_2 and tmp);
      tmp := sel(3);
      result := result or ( input_3 and tmp);
      tmp := sel(4);
      result := result or ( input_4 and tmp);
      tmp := sel(5);
      result := result or ( input_5 and tmp);
      tmp := sel(6);
      result := result or ( input_6 and tmp);
      tmp := sel(7);
      result := result or ( input_7 and tmp);
      tmp := sel(8);
      result := result or ( input_8 and tmp);
      tmp := sel(9);
      result := result or ( input_9 and tmp);
      tmp := sel(10);
      result := result or ( input_10 and tmp);
      tmp := sel(11);
      result := result or ( input_11 and tmp);
      tmp := sel(12);
      result := result or ( input_12 and tmp);
      tmp := sel(13);
      result := result or ( input_13 and tmp);
      tmp := sel(14);
      result := result or ( input_14 and tmp);
      tmp := sel(15);
      result := result or ( input_15 and tmp);
      tmp := sel(16);
      result := result or ( input_16 and tmp);
      tmp := sel(17);
      result := result or ( input_17 and tmp);
      tmp := sel(18);
      result := result or ( input_18 and tmp);
      tmp := sel(19);
      result := result or ( input_19 and tmp);
      tmp := sel(20);
      result := result or ( input_20 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_s_1_3_2(input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      tmp := sel(0);
      result := input_0 and tmp;
      tmp := sel(1);
      result := result or ( input_1 and tmp);
      tmp := sel(2);
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_s_1_5_2(input_4 : STD_LOGIC;
  input_3 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      tmp := sel(0);
      result := input_0 and tmp;
      tmp := sel(1);
      result := result or ( input_1 and tmp);
      tmp := sel(2);
      result := result or ( input_2 and tmp);
      tmp := sel(3);
      result := result or ( input_3 and tmp);
      tmp := sel(4);
      result := result or ( input_4 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_11_3_2(input_2 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(10 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(10 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_11_6_2(input_5 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(5 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(10 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(10 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
      tmp := (OTHERS=>sel( 5));
      result := result or ( input_5 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_11_8_2(input_7 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(10 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(7 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(10 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(10 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
      tmp := (OTHERS=>sel( 5));
      result := result or ( input_5 and tmp);
      tmp := (OTHERS=>sel( 6));
      result := result or ( input_6 and tmp);
      tmp := (OTHERS=>sel( 7));
      result := result or ( input_7 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_12_30_2(input_29 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_28 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_27 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_26 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_25 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_24 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_23 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_22 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_21 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_20 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_19 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_18 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_17 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_16 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_15 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(11 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(29 DOWNTO 0))
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
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
      tmp := (OTHERS=>sel( 5));
      result := result or ( input_5 and tmp);
      tmp := (OTHERS=>sel( 6));
      result := result or ( input_6 and tmp);
      tmp := (OTHERS=>sel( 7));
      result := result or ( input_7 and tmp);
      tmp := (OTHERS=>sel( 8));
      result := result or ( input_8 and tmp);
      tmp := (OTHERS=>sel( 9));
      result := result or ( input_9 and tmp);
      tmp := (OTHERS=>sel( 10));
      result := result or ( input_10 and tmp);
      tmp := (OTHERS=>sel( 11));
      result := result or ( input_11 and tmp);
      tmp := (OTHERS=>sel( 12));
      result := result or ( input_12 and tmp);
      tmp := (OTHERS=>sel( 13));
      result := result or ( input_13 and tmp);
      tmp := (OTHERS=>sel( 14));
      result := result or ( input_14 and tmp);
      tmp := (OTHERS=>sel( 15));
      result := result or ( input_15 and tmp);
      tmp := (OTHERS=>sel( 16));
      result := result or ( input_16 and tmp);
      tmp := (OTHERS=>sel( 17));
      result := result or ( input_17 and tmp);
      tmp := (OTHERS=>sel( 18));
      result := result or ( input_18 and tmp);
      tmp := (OTHERS=>sel( 19));
      result := result or ( input_19 and tmp);
      tmp := (OTHERS=>sel( 20));
      result := result or ( input_20 and tmp);
      tmp := (OTHERS=>sel( 21));
      result := result or ( input_21 and tmp);
      tmp := (OTHERS=>sel( 22));
      result := result or ( input_22 and tmp);
      tmp := (OTHERS=>sel( 23));
      result := result or ( input_23 and tmp);
      tmp := (OTHERS=>sel( 24));
      result := result or ( input_24 and tmp);
      tmp := (OTHERS=>sel( 25));
      result := result or ( input_25 and tmp);
      tmp := (OTHERS=>sel( 26));
      result := result or ( input_26 and tmp);
      tmp := (OTHERS=>sel( 27));
      result := result or ( input_27 and tmp);
      tmp := (OTHERS=>sel( 28));
      result := result or ( input_28 and tmp);
      tmp := (OTHERS=>sel( 29));
      result := result or ( input_29 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_3_3_2(input_2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(2 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(2 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_4_9_2(input_8 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(8 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(3 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(3 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
      tmp := (OTHERS=>sel( 5));
      result := result or ( input_5 and tmp);
      tmp := (OTHERS=>sel( 6));
      result := result or ( input_6 and tmp);
      tmp := (OTHERS=>sel( 7));
      result := result or ( input_7 and tmp);
      tmp := (OTHERS=>sel( 8));
      result := result or ( input_8 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_6_3_2(input_2 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(5 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(5 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(5 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX_s_1_11_2x3x7(input_0 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_4 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_6 : STD_LOGIC;
  input_8 : STD_LOGIC;
  input_9 : STD_LOGIC;
  input_10 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      CASE sel IS
        WHEN "0000" =>
          result := input_0;
        WHEN "0001" =>
          result := input_1;
        WHEN "0010" =>
          result := input_2;
        WHEN "0100" =>
          result := input_4;
        WHEN "0101" =>
          result := input_5;
        WHEN "0110" =>
          result := input_6;
        WHEN "1000" =>
          result := input_8;
        WHEN "1001" =>
          result := input_9;
        WHEN others =>
          result := input_10;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_s_1_12_2(input_0 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_3 : STD_LOGIC;
  input_4 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_6 : STD_LOGIC;
  input_7 : STD_LOGIC;
  input_8 : STD_LOGIC;
  input_9 : STD_LOGIC;
  input_10 : STD_LOGIC;
  input_11 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      CASE sel IS
        WHEN "0000" =>
          result := input_0;
        WHEN "0001" =>
          result := input_1;
        WHEN "0010" =>
          result := input_2;
        WHEN "0011" =>
          result := input_3;
        WHEN "0100" =>
          result := input_4;
        WHEN "0101" =>
          result := input_5;
        WHEN "0110" =>
          result := input_6;
        WHEN "0111" =>
          result := input_7;
        WHEN "1000" =>
          result := input_8;
        WHEN "1001" =>
          result := input_9;
        WHEN "1010" =>
          result := input_10;
        WHEN others =>
          result := input_11;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_s_1_12_2x0x4x8(input_1 : STD_LOGIC;
  input_2 : STD_LOGIC;
  input_3 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_6 : STD_LOGIC;
  input_7 : STD_LOGIC;
  input_9 : STD_LOGIC;
  input_10 : STD_LOGIC;
  input_11 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      CASE sel IS
        WHEN "0001" =>
          result := input_1;
        WHEN "0010" =>
          result := input_2;
        WHEN "0011" =>
          result := input_3;
        WHEN "0101" =>
          result := input_5;
        WHEN "0110" =>
          result := input_6;
        WHEN "0111" =>
          result := input_7;
        WHEN "1001" =>
          result := input_9;
        WHEN "1010" =>
          result := input_10;
        WHEN others =>
          result := input_11;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_s_1_15_2x0x1x2x3x7x11(input_4 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_6 : STD_LOGIC;
  input_8 : STD_LOGIC;
  input_9 : STD_LOGIC;
  input_10 : STD_LOGIC;
  input_12 : STD_LOGIC;
  input_13 : STD_LOGIC;
  input_14 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      CASE sel IS
        WHEN "0100" =>
          result := input_4;
        WHEN "0101" =>
          result := input_5;
        WHEN "0110" =>
          result := input_6;
        WHEN "1000" =>
          result := input_8;
        WHEN "1001" =>
          result := input_9;
        WHEN "1010" =>
          result := input_10;
        WHEN "1100" =>
          result := input_12;
        WHEN "1101" =>
          result := input_13;
        WHEN others =>
          result := input_14;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_s_1_22_2x0x1x2x6x7x8x9x10x14x15x16x17x18(input_3 : STD_LOGIC;
  input_4 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_11 : STD_LOGIC;
  input_12 : STD_LOGIC;
  input_13 : STD_LOGIC;
  input_19 : STD_LOGIC;
  input_20 : STD_LOGIC;
  input_21 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      CASE sel IS
        WHEN "00011" =>
          result := input_3;
        WHEN "00100" =>
          result := input_4;
        WHEN "00101" =>
          result := input_5;
        WHEN "01011" =>
          result := input_11;
        WHEN "01100" =>
          result := input_12;
        WHEN "01101" =>
          result := input_13;
        WHEN "10011" =>
          result := input_19;
        WHEN "10100" =>
          result := input_20;
        WHEN others =>
          result := input_21;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_s_1_22_2x0x1x6x7x8x9x14x15x16x17(input_2 : STD_LOGIC;
  input_3 : STD_LOGIC;
  input_4 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_10 : STD_LOGIC;
  input_11 : STD_LOGIC;
  input_12 : STD_LOGIC;
  input_13 : STD_LOGIC;
  input_18 : STD_LOGIC;
  input_19 : STD_LOGIC;
  input_20 : STD_LOGIC;
  input_21 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      CASE sel IS
        WHEN "00010" =>
          result := input_2;
        WHEN "00011" =>
          result := input_3;
        WHEN "00100" =>
          result := input_4;
        WHEN "00101" =>
          result := input_5;
        WHEN "01010" =>
          result := input_10;
        WHEN "01011" =>
          result := input_11;
        WHEN "01100" =>
          result := input_12;
        WHEN "01101" =>
          result := input_13;
        WHEN "10010" =>
          result := input_18;
        WHEN "10011" =>
          result := input_19;
        WHEN "10100" =>
          result := input_20;
        WHEN others =>
          result := input_21;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_s_1_26_2x0x1x2x3x4x5x10x11x12x13x18x19x20x21(input_6 : STD_LOGIC;
  input_7 : STD_LOGIC;
  input_8 : STD_LOGIC;
  input_9 : STD_LOGIC;
  input_14 : STD_LOGIC;
  input_15 : STD_LOGIC;
  input_16 : STD_LOGIC;
  input_17 : STD_LOGIC;
  input_22 : STD_LOGIC;
  input_23 : STD_LOGIC;
  input_24 : STD_LOGIC;
  input_25 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      CASE sel IS
        WHEN "00110" =>
          result := input_6;
        WHEN "00111" =>
          result := input_7;
        WHEN "01000" =>
          result := input_8;
        WHEN "01001" =>
          result := input_9;
        WHEN "01110" =>
          result := input_14;
        WHEN "01111" =>
          result := input_15;
        WHEN "10000" =>
          result := input_16;
        WHEN "10001" =>
          result := input_17;
        WHEN "10110" =>
          result := input_22;
        WHEN "10111" =>
          result := input_23;
        WHEN "11000" =>
          result := input_24;
        WHEN others =>
          result := input_25;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_s_1_26_2x0x1x2x3x6x10x14x18x22(input_4 : STD_LOGIC;
  input_5 : STD_LOGIC;
  input_7 : STD_LOGIC;
  input_8 : STD_LOGIC;
  input_9 : STD_LOGIC;
  input_11 : STD_LOGIC;
  input_12 : STD_LOGIC;
  input_13 : STD_LOGIC;
  input_15 : STD_LOGIC;
  input_16 : STD_LOGIC;
  input_17 : STD_LOGIC;
  input_19 : STD_LOGIC;
  input_20 : STD_LOGIC;
  input_21 : STD_LOGIC;
  input_23 : STD_LOGIC;
  input_24 : STD_LOGIC;
  input_25 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      CASE sel IS
        WHEN "00100" =>
          result := input_4;
        WHEN "00101" =>
          result := input_5;
        WHEN "00111" =>
          result := input_7;
        WHEN "01000" =>
          result := input_8;
        WHEN "01001" =>
          result := input_9;
        WHEN "01011" =>
          result := input_11;
        WHEN "01100" =>
          result := input_12;
        WHEN "01101" =>
          result := input_13;
        WHEN "01111" =>
          result := input_15;
        WHEN "10000" =>
          result := input_16;
        WHEN "10001" =>
          result := input_17;
        WHEN "10011" =>
          result := input_19;
        WHEN "10100" =>
          result := input_20;
        WHEN "10101" =>
          result := input_21;
        WHEN "10111" =>
          result := input_23;
        WHEN "11000" =>
          result := input_24;
        WHEN others =>
          result := input_25;
      END CASE;
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

  FUNCTION MUX_v_10_2_2(input_0 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(9 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(9 DOWNTO 0);

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

  FUNCTION MUX_v_4_11_2x3x7(input_0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(3 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(3 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN "0000" =>
          result := input_0;
        WHEN "0001" =>
          result := input_1;
        WHEN "0010" =>
          result := input_2;
        WHEN "0100" =>
          result := input_4;
        WHEN "0101" =>
          result := input_5;
        WHEN "0110" =>
          result := input_6;
        WHEN "1000" =>
          result := input_8;
        WHEN "1001" =>
          result := input_9;
        WHEN others =>
          result := input_10;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_4_12_2(input_0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(3 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(3 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN "0000" =>
          result := input_0;
        WHEN "0001" =>
          result := input_1;
        WHEN "0010" =>
          result := input_2;
        WHEN "0011" =>
          result := input_3;
        WHEN "0100" =>
          result := input_4;
        WHEN "0101" =>
          result := input_5;
        WHEN "0110" =>
          result := input_6;
        WHEN "0111" =>
          result := input_7;
        WHEN "1000" =>
          result := input_8;
        WHEN "1001" =>
          result := input_9;
        WHEN "1010" =>
          result := input_10;
        WHEN others =>
          result := input_11;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_4_12_2x0x4x8(input_1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(3 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(3 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN "0001" =>
          result := input_1;
        WHEN "0010" =>
          result := input_2;
        WHEN "0011" =>
          result := input_3;
        WHEN "0101" =>
          result := input_5;
        WHEN "0110" =>
          result := input_6;
        WHEN "0111" =>
          result := input_7;
        WHEN "1001" =>
          result := input_9;
        WHEN "1010" =>
          result := input_10;
        WHEN others =>
          result := input_11;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_4_15_2x0x1x2x3x7x11(input_4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(3 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(3 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN "0100" =>
          result := input_4;
        WHEN "0101" =>
          result := input_5;
        WHEN "0110" =>
          result := input_6;
        WHEN "1000" =>
          result := input_8;
        WHEN "1001" =>
          result := input_9;
        WHEN "1010" =>
          result := input_10;
        WHEN "1100" =>
          result := input_12;
        WHEN "1101" =>
          result := input_13;
        WHEN others =>
          result := input_14;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_4_22_2x0x1x2x6x7x8x9x10x14x15x16x17x18(input_3 : STD_LOGIC_VECTOR(3
      DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_19 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_20 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_21 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(3 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(3 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN "00011" =>
          result := input_3;
        WHEN "00100" =>
          result := input_4;
        WHEN "00101" =>
          result := input_5;
        WHEN "01011" =>
          result := input_11;
        WHEN "01100" =>
          result := input_12;
        WHEN "01101" =>
          result := input_13;
        WHEN "10011" =>
          result := input_19;
        WHEN "10100" =>
          result := input_20;
        WHEN others =>
          result := input_21;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_4_22_2x0x1x6x7x8x9x14x15x16x17(input_2 : STD_LOGIC_VECTOR(3 DOWNTO
      0);
  input_3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_10 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_18 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_19 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_20 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_21 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(3 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(3 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN "00010" =>
          result := input_2;
        WHEN "00011" =>
          result := input_3;
        WHEN "00100" =>
          result := input_4;
        WHEN "00101" =>
          result := input_5;
        WHEN "01010" =>
          result := input_10;
        WHEN "01011" =>
          result := input_11;
        WHEN "01100" =>
          result := input_12;
        WHEN "01101" =>
          result := input_13;
        WHEN "10010" =>
          result := input_18;
        WHEN "10011" =>
          result := input_19;
        WHEN "10100" =>
          result := input_20;
        WHEN others =>
          result := input_21;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_4_26_2x0x1x2x3x4x5x10x11x12x13x18x19x20x21(input_6 : STD_LOGIC_VECTOR(3
      DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_14 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_15 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_16 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_17 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_22 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_23 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_24 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_25 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(3 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(3 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN "00110" =>
          result := input_6;
        WHEN "00111" =>
          result := input_7;
        WHEN "01000" =>
          result := input_8;
        WHEN "01001" =>
          result := input_9;
        WHEN "01110" =>
          result := input_14;
        WHEN "01111" =>
          result := input_15;
        WHEN "10000" =>
          result := input_16;
        WHEN "10001" =>
          result := input_17;
        WHEN "10110" =>
          result := input_22;
        WHEN "10111" =>
          result := input_23;
        WHEN "11000" =>
          result := input_24;
        WHEN others =>
          result := input_25;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_4_26_2x0x1x2x3x6x10x14x18x22(input_4 : STD_LOGIC_VECTOR(3 DOWNTO
      0);
  input_5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_8 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_9 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_11 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_12 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_13 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_15 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_16 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_17 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_19 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_20 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_21 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_23 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_24 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  input_25 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(3 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(3 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN "00100" =>
          result := input_4;
        WHEN "00101" =>
          result := input_5;
        WHEN "00111" =>
          result := input_7;
        WHEN "01000" =>
          result := input_8;
        WHEN "01001" =>
          result := input_9;
        WHEN "01011" =>
          result := input_11;
        WHEN "01100" =>
          result := input_12;
        WHEN "01101" =>
          result := input_13;
        WHEN "01111" =>
          result := input_15;
        WHEN "10000" =>
          result := input_16;
        WHEN "10001" =>
          result := input_17;
        WHEN "10011" =>
          result := input_19;
        WHEN "10100" =>
          result := input_20;
        WHEN "10101" =>
          result := input_21;
        WHEN "10111" =>
          result := input_23;
        WHEN "11000" =>
          result := input_24;
        WHEN others =>
          result := input_25;
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
      ld => reg_conv_out_rsc_triosy_obj_ld_cse,
      lz => conv_in_rsc_triosy_lz
    );
  conv_out_rsc_triosy_obj : work.mgc_ioport_comps_v11.mgc_io_sync_v1
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => reg_conv_out_rsc_triosy_obj_ld_cse,
      lz => conv_out_rsc_triosy_lz
    );
  apply_conv_core_core_fsm_inst : apply_conv_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => apply_conv_core_core_fsm_inst_fsm_output,
      PAD_for_for_C_3_tr0 => apply_conv_core_core_fsm_inst_PAD_for_for_C_3_tr0,
      PAD_for_C_0_tr0 => apply_conv_core_core_fsm_inst_PAD_for_C_0_tr0,
      PAD_C_0_tr0 => apply_conv_core_core_fsm_inst_PAD_C_0_tr0,
      CONV_H_SLIDE_C_30_tr0 => apply_conv_core_core_fsm_inst_CONV_H_SLIDE_C_30_tr0,
      CONV_V_SLIDE_C_0_tr0 => apply_conv_core_core_fsm_inst_CONV_V_SLIDE_C_0_tr0,
      CONV_NB_K_C_0_tr0 => apply_conv_core_core_fsm_inst_CONV_NB_K_C_0_tr0
    );
  fsm_output <= apply_conv_core_core_fsm_inst_fsm_output;
  apply_conv_core_core_fsm_inst_PAD_for_for_C_3_tr0 <= NOT PAD_for_for_slc_PAD_for_for_acc_7_itm;
  apply_conv_core_core_fsm_inst_PAD_for_C_0_tr0 <= NOT (readindex(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(z_out_2(6
      DOWNTO 1)), 6), 7) + SIGNED'( "1000011"), 7)), 6));
  apply_conv_core_core_fsm_inst_PAD_C_0_tr0 <= NOT((z_out(0)) XOR (z_out(1)));
  apply_conv_core_core_fsm_inst_CONV_H_SLIDE_C_30_tr0 <= CONV_H_SLIDE_slc_CONV_H_SLIDE_acc_3_itm;
  apply_conv_core_core_fsm_inst_CONV_V_SLIDE_C_0_tr0 <= readindex(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1'
      & (NOT (CONV_K_D_1_CONV_K_H_2_CONV_K_W_1_acc_3(6 DOWNTO 3)))) + SIGNED'( "01111"),
      5)), 4);
  apply_conv_core_core_fsm_inst_CONV_NB_K_C_0_tr0 <= NOT (z_out_16(2));

  reg_PAD_d_1_PAD_d_or_cse <= (fsm_output(0)) OR (fsm_output(6));
  PAD_for_for_acc_1_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(PAD_for_r_6_0_sva_4),
      7), 8) + SIGNED'( "11111111"), 8));
  PAD_for_for_oif_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(PAD_for_r_6_0_sva_4),
      7), 8) + SIGNED'( "10000111"), 8));
  or_9_cse <= (readindex(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(PAD_for_for_acc_1_nl),
      8)), 7)) OR (NOT (readindex(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(PAD_for_for_oif_acc_nl),
      8)), 7)));
  reg_CONV_V_SLIDE_j_6_CONV_V_SLIDE_j_or_cse <= (fsm_output(6)) OR (fsm_output(39))
      OR (fsm_output(38));
  reg_o_c_7_o_c_or_cse <= (fsm_output(38)) OR (fsm_output(6)) OR (fsm_output(39))
      OR (fsm_output(37));
  PAD_for_for_if_mul_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(PAD_d_1_0_sva_3)
      * UNSIGNED'( "1001101001101")), 14));
  PAD_for_for_if_acc_ncse <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(PAD_for_for_if_acc_3_ncse(13
      DOWNTO 1)), 13), 14) + CONV_UNSIGNED(UNSIGNED(PAD_for_for_if_mul_nl), 14),
      14));
  PAD_for_for_if_PAD_for_for_if_mul_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(
      UNSIGNED(PAD_for_r_6_0_sva_4) * UNSIGNED'( "1010001")), 14));
  PAD_for_for_if_acc_3_ncse <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(PAD_for_for_if_PAD_for_for_if_mul_nl),
      14) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(PAD_for_for_c_7_0_sva_3(7 DOWNTO
      1)), 7), 14), 14));
  PAD_for_for_else_else_acc_5_psp_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(PAD_for_for_c_7_0_sva_3)
      + UNSIGNED'( "11111111"), 8));
  CONV_K_W_acc_23_psp_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_NB_K_i_1_0_sva_3)
      + UNSIGNED'( "01"), 2));
  CONV_K_D_1_CONV_K_H_2_CONV_K_W_1_acc_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_V_SLIDE_j_6_0_sva_2)
      + UNSIGNED'( "0000001"), 7));
  CONV_H_SLIDE_acc_14_sdt_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(o_r_6_0_lpi_4),
      7), 8) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(z_out_2(6 DOWNTO 2)), 5), 8),
      8));
  CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_12)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_K_H_1_CONV_K_W_acc_17_cse_1_sva_mx0w0),
      7), 14), 14));
  CONV_K_W_acc_2_psp_5_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_H_SLIDE_k_7_0_sva_1)
      + UNSIGNED'( "00000001"), 8));
  CONV_K_W_acc_29_sdt_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_12)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_H_SLIDE_k_7_0_sva_1(7 DOWNTO 1)),
      7), 14), 14));
  CONV_K_W_acc_30_sdt_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_12)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_K_W_acc_2_psp_5_sva_mx0w0(7 DOWNTO
      1)), 7), 14), 14));
  CONV_K_H_1_CONV_K_W_acc_17_cse_1_sva_mx0w0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_H_SLIDE_k_7_0_sva_1(7
      DOWNTO 1)) + UNSIGNED'( "0000001"), 7));
  CONV_K_W_acc_69_psp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(z_out_16(2
      DOWNTO 1)), 2), 4) + UNSIGNED(CONV_NB_K_i_1_0_sva_3 & STD_LOGIC_VECTOR'( "01")),
      4));
  CONV_K_D_3_CONV_K_H_1_CONV_K_W_CONV_K_W_conc_4_4_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_NB_K_i_1_0_sva_3
      & STD_LOGIC_VECTOR'( "10")) + CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(CONV_NB_K_i_1_0_sva_3(1),
      1), 1), 4) + UNSIGNED'( "0001"), 4));
  CONV_K_W_conc_87_1 <= (CONV_NB_K_i_1_0_sva_3(0)) XOR (CONV_NB_K_i_1_0_sva_3(1));
  CONV_K_D_3_CONV_K_H_2_CONV_K_W_CONV_K_W_conc_3_4_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(z_out_16(2),
      1), 1), 3) + UNSIGNED(CONV_NB_K_i_1_0_sva_3 & '1'), 3));
  CONV_K_D_1_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm <= MUX_v_11_2_2(STD_LOGIC_VECTOR'("00000000000"),
      CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21, CONV_K_W_mux_22_itm);
  CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21 <= STD_LOGIC_VECTOR(CONV_SIGNED( -CONV_SIGNED(CONV_SIGNED(SIGNED(pad_input_rsci_data_out_d),
      10), 11), 11));
  CONV_K_D_3_CONV_K_H_2_CONV_K_W_3_CONV_K_W_and_2 <= MUX_v_11_2_2(STD_LOGIC_VECTOR'("00000000000"),
      CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21, CONV_K_W_mux_16_itm);
  CONV_K_D_2_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_2 <= MUX_v_11_2_2(STD_LOGIC_VECTOR'("00000000000"),
      CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21, CONV_K_W_mux_4_itm);
  and_dcpl_4 <= NOT(PAD_for_for_if_PAD_for_for_if_or_itm OR PAD_for_for_else_if_PAD_for_for_else_if_or_itm_1);
  and_dcpl_28 <= NOT((fsm_output(1)) OR (fsm_output(6)) OR (fsm_output(39)));
  and_dcpl_36 <= NOT((fsm_output(4)) OR (fsm_output(40)));
  or_tmp_76 <= NOT((NOT and_dcpl_36) OR (fsm_output(0)) OR (fsm_output(38)) OR (fsm_output(37))
      OR (fsm_output(7)) OR (fsm_output(5)) OR (fsm_output(3)) OR (fsm_output(2))
      OR (NOT and_dcpl_28));
  PAD_for_for_else_else_acc_14_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(PAD_for_r_6_0_sva_4),
      7), 9) + CONV_SIGNED(CONV_SIGNED(SIGNED(z_out_2(7 DOWNTO 2)), 6), 9), 9));
  PAD_for_for_else_else_acc_10_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(PAD_for_for_else_else_acc_14_nl),
      9)) & (z_out_2(1 DOWNTO 0))) + UNSIGNED(z_out_3_7_0 & STD_LOGIC_VECTOR'( "011")),
      11));
  conv_in_rsci_addr_d <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(PAD_for_for_else_else_acc_10_nl),
      11)) & PAD_for_for_else_else_slc_PAD_for_for_else_else_acc_5_psp_4_0_itm_3;
  conv_in_rsci_re_d <= NOT(and_dcpl_4 AND (fsm_output(2)));
  CONV_H_SLIDE_else_if_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (NOT (z_out_6(9
      DOWNTO 8)))) + SIGNED'( "001"), 3));
  CONV_H_SLIDE_and_nl <= (readindex(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(CONV_H_SLIDE_else_if_acc_nl),
      3)), 2)) AND (NOT (z_out_6(10)));
  CONV_H_SLIDE_mux_nl <= MUX_v_11_2_2(z_out_6, STD_LOGIC_VECTOR'( "00011111111"),
      CONV_H_SLIDE_and_nl);
  CONV_H_SLIDE_not_2_nl <= NOT (z_out_6(10));
  conv_out_rsci_data_in_d <= MUX_v_11_2_2(STD_LOGIC_VECTOR'("00000000000"), CONV_H_SLIDE_mux_nl,
      CONV_H_SLIDE_not_2_nl);
  conv_out_rsci_addr_d <= CONV_H_SLIDE_acc_15_psp_1 & reg_CONV_H_SLIDE_acc_14_sdt_tmp_7
      & reg_CONV_H_SLIDE_acc_12_psp_tmp_5 & (o_c_7_0_lpi_4(4 DOWNTO 0));
  conv_out_rsci_we_d <= NOT (fsm_output(36));
  pad_input_rsci_data_in_d <= MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"), conv_in_rsci_data_out_d,
      (fsm_output(3)));
  pad_input_mux1h_nl <= MUX1HOT_s_1_12_2((PAD_for_for_if_acc_ncse(13)), (PAD_for_for_if_acc_ncse_2(13)),
      (PAD_for_for_else_else_acc_itm_14_1_1(13)), (CONV_K_W_acc_79_psp(13)), (CONV_K_W_acc_78_psp(13)),
      (CONV_K_W_acc_77_psp(13)), (CONV_K_W_acc_73_psp(13)), (CONV_K_W_acc_72_psp(13)),
      (CONV_K_W_acc_71_psp(13)), (CONV_K_W_acc_85_psp(13)), (CONV_K_W_acc_84_psp(13)),
      (CONV_K_W_acc_83_psp(13)), STD_LOGIC_VECTOR'( (fsm_output(1)) & (fsm_output(2))
      & (fsm_output(3)) & (fsm_output(22)) & (fsm_output(23)) & (fsm_output(24))
      & (fsm_output(25)) & (fsm_output(26)) & (fsm_output(27)) & (fsm_output(28))
      & (fsm_output(29)) & (fsm_output(30))));
  pad_input_or_nl <= (pad_input_mux1h_nl AND (NOT((fsm_output(8)) OR (fsm_output(9))
      OR (fsm_output(10)) OR (fsm_output(11)) OR (fsm_output(12)) OR (fsm_output(31))
      OR (fsm_output(32)) OR (fsm_output(33)) OR (fsm_output(34))))) OR TO_STDLOGIC(fsm_output(21
      DOWNTO 13)/=STD_LOGIC_VECTOR'("000000000"));
  pad_input_mux1h_2_nl <= MUX1HOT_v_12_30_2((PAD_for_for_if_acc_ncse(12 DOWNTO 1)),
      (PAD_for_for_if_acc_ncse_2(12 DOWNTO 1)), (PAD_for_for_else_else_acc_itm_14_1_1(12
      DOWNTO 1)), (CONV_K_W_acc_30_sdt(13 DOWNTO 2)), (CONV_K_W_acc_29_sdt(13 DOWNTO
      2)), (CONV_K_W_acc_28_sdt(13 DOWNTO 2)), (CONV_K_W_acc_27_sdt(13 DOWNTO 2)),
      (CONV_K_W_acc_26_sdt(13 DOWNTO 2)), CONV_K_W_acc_82_psp_11_0, CONV_K_W_acc_81_psp_11_0,
      CONV_K_W_acc_80_psp_11_0, CONV_K_W_acc_76_psp_11_0, CONV_K_W_acc_75_psp_11_0,
      CONV_K_W_acc_74_psp_11_0, CONV_K_W_acc_88_psp_11_0, CONV_K_W_acc_87_psp_11_0,
      CONV_K_W_acc_86_psp_11_0, (CONV_K_W_acc_79_psp(12 DOWNTO 1)), (CONV_K_W_acc_78_psp(12
      DOWNTO 1)), (CONV_K_W_acc_77_psp(12 DOWNTO 1)), (CONV_K_W_acc_73_psp(12 DOWNTO
      1)), (CONV_K_W_acc_72_psp(12 DOWNTO 1)), (CONV_K_W_acc_71_psp(12 DOWNTO 1)),
      (CONV_K_W_acc_85_psp(12 DOWNTO 1)), (CONV_K_W_acc_84_psp(12 DOWNTO 1)), (CONV_K_W_acc_83_psp(12
      DOWNTO 1)), (CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_acc_14_itm(13 DOWNTO 2)), (CONV_K_D_1_CONV_K_H_3_CONV_K_W_2_acc_14_itm(13
      DOWNTO 2)), (CONV_K_D_1_CONV_K_H_3_CONV_K_W_1_acc_14_itm(13 DOWNTO 2)), (CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm(13
      DOWNTO 2)), STD_LOGIC_VECTOR'( (fsm_output(1)) & (fsm_output(2)) & (fsm_output(3))
      & (fsm_output(8)) & (fsm_output(9)) & (fsm_output(10)) & (fsm_output(11)) &
      (fsm_output(12)) & (fsm_output(13)) & (fsm_output(14)) & (fsm_output(15)) &
      (fsm_output(16)) & (fsm_output(17)) & (fsm_output(18)) & (fsm_output(19)) &
      (fsm_output(20)) & (fsm_output(21)) & (fsm_output(22)) & (fsm_output(23)) &
      (fsm_output(24)) & (fsm_output(25)) & (fsm_output(26)) & (fsm_output(27)) &
      (fsm_output(28)) & (fsm_output(29)) & (fsm_output(30)) & (fsm_output(31)) &
      (fsm_output(32)) & (fsm_output(33)) & (fsm_output(34))));
  pad_input_or_1_nl <= (fsm_output(8)) OR (fsm_output(17));
  pad_input_or_2_nl <= (fsm_output(9)) OR (fsm_output(18));
  pad_input_or_3_nl <= (fsm_output(10)) OR (fsm_output(19));
  pad_input_or_4_nl <= (fsm_output(11)) OR (fsm_output(20));
  pad_input_or_5_nl <= (fsm_output(12)) OR (fsm_output(21));
  pad_input_or_6_nl <= (fsm_output(13)) OR (fsm_output(31));
  pad_input_or_7_nl <= (fsm_output(14)) OR (fsm_output(32));
  pad_input_or_8_nl <= (fsm_output(15)) OR (fsm_output(33));
  pad_input_or_9_nl <= (fsm_output(16)) OR (fsm_output(34));
  pad_input_mux1h_3_nl <= MUX1HOT_s_1_21_2((PAD_for_for_if_acc_ncse(0)), (PAD_for_for_if_acc_ncse_2(0)),
      (PAD_for_for_else_else_acc_itm_14_1_1(0)), (CONV_K_W_acc_30_sdt(1)), (CONV_K_W_acc_29_sdt(1)),
      (CONV_K_W_acc_28_sdt(1)), (CONV_K_W_acc_27_sdt(1)), (CONV_K_W_acc_26_sdt(1)),
      (CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_acc_14_itm(1)), (CONV_K_D_1_CONV_K_H_3_CONV_K_W_2_acc_14_itm(1)),
      (CONV_K_D_1_CONV_K_H_3_CONV_K_W_1_acc_14_itm(1)), (CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm(1)),
      (CONV_K_W_acc_79_psp(0)), (CONV_K_W_acc_78_psp(0)), (CONV_K_W_acc_77_psp(0)),
      (CONV_K_W_acc_73_psp(0)), (CONV_K_W_acc_72_psp(0)), (CONV_K_W_acc_71_psp(0)),
      (CONV_K_W_acc_85_psp(0)), (CONV_K_W_acc_84_psp(0)), (CONV_K_W_acc_83_psp(0)),
      STD_LOGIC_VECTOR'( (fsm_output(1)) & (fsm_output(2)) & (fsm_output(3)) & pad_input_or_1_nl
      & pad_input_or_2_nl & pad_input_or_3_nl & pad_input_or_4_nl & pad_input_or_5_nl
      & pad_input_or_6_nl & pad_input_or_7_nl & pad_input_or_8_nl & pad_input_or_9_nl
      & (fsm_output(22)) & (fsm_output(23)) & (fsm_output(24)) & (fsm_output(25))
      & (fsm_output(26)) & (fsm_output(27)) & (fsm_output(28)) & (fsm_output(29))
      & (fsm_output(30))));
  pad_input_or_10_nl <= (fsm_output(8)) OR (fsm_output(17)) OR (fsm_output(26));
  pad_input_or_11_nl <= (fsm_output(9)) OR (fsm_output(18)) OR (fsm_output(27));
  pad_input_or_12_nl <= (fsm_output(10)) OR (fsm_output(19)) OR (fsm_output(28));
  pad_input_or_13_nl <= (fsm_output(11)) OR (fsm_output(20)) OR (fsm_output(29));
  pad_input_or_14_nl <= (fsm_output(12)) OR (fsm_output(21)) OR (fsm_output(30));
  pad_input_or_15_nl <= (fsm_output(13)) OR (fsm_output(22)) OR (fsm_output(31));
  pad_input_or_16_nl <= (fsm_output(14)) OR (fsm_output(23)) OR (fsm_output(32));
  pad_input_or_17_nl <= (fsm_output(15)) OR (fsm_output(24)) OR (fsm_output(33));
  pad_input_or_18_nl <= (fsm_output(16)) OR (fsm_output(25)) OR (fsm_output(34));
  pad_input_mux1h_4_nl <= MUX1HOT_s_1_12_2((PAD_for_for_if_acc_3_ncse(0)), reg_PAD_for_for_if_acc_3_ncse_cse,
      PAD_for_for_else_else_acc_itm_0_2, (CONV_K_W_acc_30_sdt(0)), (CONV_K_W_acc_29_sdt(0)),
      (CONV_K_W_acc_28_sdt(0)), (CONV_K_W_acc_27_sdt(0)), (CONV_K_W_acc_26_sdt(0)),
      (CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_acc_14_itm(0)), (CONV_K_D_1_CONV_K_H_3_CONV_K_W_2_acc_14_itm(0)),
      (CONV_K_D_1_CONV_K_H_3_CONV_K_W_1_acc_14_itm(0)), (CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm(0)),
      STD_LOGIC_VECTOR'( (fsm_output(1)) & (fsm_output(2)) & (fsm_output(3)) & pad_input_or_10_nl
      & pad_input_or_11_nl & pad_input_or_12_nl & pad_input_or_13_nl & pad_input_or_14_nl
      & pad_input_or_15_nl & pad_input_or_16_nl & pad_input_or_17_nl & pad_input_or_18_nl));
  pad_input_or_19_nl <= (fsm_output(8)) OR (fsm_output(11)) OR (fsm_output(14)) OR
      (fsm_output(17)) OR (fsm_output(20)) OR (fsm_output(23)) OR (fsm_output(26))
      OR (fsm_output(29)) OR (fsm_output(32));
  pad_input_or_20_nl <= (fsm_output(9)) OR (fsm_output(12)) OR (fsm_output(15)) OR
      (fsm_output(18)) OR (fsm_output(21)) OR (fsm_output(24)) OR (fsm_output(27))
      OR (fsm_output(30)) OR (fsm_output(33)) OR (fsm_output(10)) OR (fsm_output(13))
      OR (fsm_output(16)) OR (fsm_output(19)) OR (fsm_output(22)) OR (fsm_output(25))
      OR (fsm_output(28)) OR (fsm_output(31)) OR (fsm_output(34));
  pad_input_mux1h_1_nl <= MUX1HOT_s_1_5_2((PAD_for_for_c_7_0_sva_3(0)), PAD_for_for_c_slc_PAD_for_for_c_7_0_0_1_itm_1,
      PAD_for_for_c_slc_PAD_for_for_c_7_0_0_2_itm, (CONV_K_W_acc_2_psp_5_sva(0)),
      (CONV_H_SLIDE_k_7_0_sva_1(0)), STD_LOGIC_VECTOR'( (fsm_output(1)) & (fsm_output(2))
      & (fsm_output(3)) & pad_input_or_19_nl & pad_input_or_20_nl));
  pad_input_rsci_addr_d <= pad_input_or_nl & pad_input_mux1h_2_nl & pad_input_mux1h_3_nl
      & pad_input_mux1h_4_nl & pad_input_mux1h_1_nl;
  pad_input_rsci_re_d <= (NOT and_dcpl_36) OR (fsm_output(0)) OR (fsm_output(38))
      OR (fsm_output(37)) OR (fsm_output(36)) OR (fsm_output(35)) OR (fsm_output(7))
      OR (fsm_output(5)) OR (fsm_output(3)) OR (fsm_output(2)) OR (NOT and_dcpl_28);
  pad_input_rsci_we_d <= NOT((and_dcpl_4 AND (fsm_output(3))) OR (or_9_cse AND (fsm_output(1)))
      OR ((NOT PAD_for_for_if_PAD_for_for_if_or_itm) AND PAD_for_for_else_if_PAD_for_for_else_if_or_itm_1
      AND (fsm_output(2))));
  or_dcpl <= (fsm_output(23)) OR (fsm_output(25));
  or_dcpl_11 <= (fsm_output(10)) OR (fsm_output(35));
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        PAD_for_for_c_7_0_sva_3 <= STD_LOGIC_VECTOR'( "00000000");
        reg_conv_out_rsc_triosy_obj_ld_cse <= '0';
        PAD_for_for_if_acc_ncse_2 <= STD_LOGIC_VECTOR'( "00000000000000");
        reg_PAD_for_for_if_acc_3_ncse_cse <= '0';
        PAD_for_for_c_slc_PAD_for_for_c_7_0_0_1_itm_1 <= '0';
        PAD_for_for_c_slc_PAD_for_for_c_7_0_0_2_itm <= '0';
        PAD_for_for_else_else_slc_PAD_for_for_else_else_acc_5_psp_4_0_itm_3 <= STD_LOGIC_VECTOR'(
            "00000");
        PAD_for_for_else_else_acc_5_psp_sva_2_7_5 <= STD_LOGIC_VECTOR'( "000");
        PAD_for_for_else_if_PAD_for_for_else_if_or_itm_1 <= '0';
        PAD_for_for_else_else_acc_itm_14_1_1 <= STD_LOGIC_VECTOR'( "00000000000000");
        PAD_for_for_else_else_acc_itm_0_2 <= '0';
        CONV_K_W_acc_2_psp_5_sva <= STD_LOGIC_VECTOR'( "00000000");
        CONV_K_D_1_CONV_K_W_acc_itm_1 <= STD_LOGIC_VECTOR'( "000000");
        reg_CONV_K_D_1_CONV_K_H_2_CONV_K_W_2_mul_10_cse <= STD_LOGIC_VECTOR'( "00000000000");
        CONV_K_D_1_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm_1 <= STD_LOGIC_VECTOR'(
            "00000000000");
        CONV_K_W_acc_56_itm_1 <= STD_LOGIC_VECTOR'( "00000000000");
        CONV_K_D_3_CONV_K_H_3_CONV_K_W_3_CONV_K_W_and_itm_1 <= STD_LOGIC_VECTOR'(
            "00000000000");
        reg_CONV_K_W_acc_44_cse <= STD_LOGIC_VECTOR'( "00000000000");
        CONV_K_W_acc_58_itm_1 <= STD_LOGIC_VECTOR'( "00000000000");
        CONV_K_D_3_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm_1 <= STD_LOGIC_VECTOR'(
            "00000000000");
        CONV_K_D_2_CONV_K_H_2_CONV_K_W_3_CONV_K_W_and_itm_1 <= STD_LOGIC_VECTOR'(
            "00000000000");
        CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_CONV_K_W_and_itm_1 <= STD_LOGIC_VECTOR'(
            "00000000000");
        CONV_K_W_acc_62_itm_1 <= STD_LOGIC_VECTOR'( "00000000000");
      ELSE
        PAD_for_for_c_7_0_sva_3 <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), PAD_for_for_c_7_0_sva_4,
            PAD_for_for_c_nor_nl);
        reg_conv_out_rsc_triosy_obj_ld_cse <= (NOT (z_out_16(2))) AND (fsm_output(39));
        PAD_for_for_if_acc_ncse_2 <= PAD_for_for_if_acc_ncse;
        reg_PAD_for_for_if_acc_3_ncse_cse <= PAD_for_for_if_acc_3_ncse(0);
        PAD_for_for_c_slc_PAD_for_for_c_7_0_0_1_itm_1 <= PAD_for_for_c_7_0_sva_3(0);
        PAD_for_for_c_slc_PAD_for_for_c_7_0_0_2_itm <= MUX_s_1_2_2((PAD_for_for_c_7_0_sva_3(0)),
            PAD_for_for_c_slc_PAD_for_for_c_7_0_0_2_itm, fsm_output(2));
        PAD_for_for_else_else_slc_PAD_for_for_else_else_acc_5_psp_4_0_itm_3 <= PAD_for_for_else_else_acc_5_psp_sva(4
            DOWNTO 0);
        PAD_for_for_else_else_acc_5_psp_sva_2_7_5 <= PAD_for_for_else_else_acc_5_psp_sva(7
            DOWNTO 5);
        PAD_for_for_else_if_PAD_for_for_else_if_or_itm_1 <= MUX_s_1_2_2(or_nl, PAD_for_for_else_if_PAD_for_for_else_if_or_itm_1,
            fsm_output(2));
        PAD_for_for_else_else_acc_itm_14_1_1 <= PAD_for_for_if_acc_ncse_2;
        PAD_for_for_else_else_acc_itm_0_2 <= reg_PAD_for_for_if_acc_3_ncse_cse;
        CONV_K_W_acc_2_psp_5_sva <= MUX_v_8_2_2(CONV_K_W_acc_2_psp_5_sva_mx0w0, CONV_K_W_acc_2_psp_5_sva,
            or_tmp_76);
        CONV_K_D_1_CONV_K_W_acc_itm_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_V_SLIDE_j_6_0_sva_2(6
            DOWNTO 1)) + UNSIGNED'( "000001"), 6));
        reg_CONV_K_D_1_CONV_K_H_2_CONV_K_W_2_mul_10_cse <= z_out_5;
        CONV_K_D_1_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm_1 <= CONV_K_D_1_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm;
        CONV_K_W_acc_56_itm_1 <= z_out_7;
        CONV_K_D_3_CONV_K_H_3_CONV_K_W_3_CONV_K_W_and_itm_1 <= MUX_v_11_2_2(STD_LOGIC_VECTOR'("00000000000"),
            CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21, CONV_K_W_mux_19_itm);
        reg_CONV_K_W_acc_44_cse <= z_out_8;
        CONV_K_W_acc_58_itm_1 <= z_out_10;
        CONV_K_D_3_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm_1 <= MUX_v_11_2_2(STD_LOGIC_VECTOR'("00000000000"),
            CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21, CONV_K_W_mux_13_itm);
        CONV_K_D_2_CONV_K_H_2_CONV_K_W_3_CONV_K_W_and_itm_1 <= MUX_v_11_2_2(STD_LOGIC_VECTOR'("00000000000"),
            CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21, CONV_K_W_mux_7_itm);
        CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_CONV_K_W_and_itm_1 <= MUX_v_11_2_2(STD_LOGIC_VECTOR'("00000000000"),
            CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21, CONV_K_W_mux_1_itm);
        CONV_K_W_acc_62_itm_1 <= z_out_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        PAD_for_r_6_0_sva_4 <= STD_LOGIC_VECTOR'( "0000000");
      ELSIF ( ((fsm_output(5)) OR reg_PAD_d_1_PAD_d_or_cse) = '1' ) THEN
        PAD_for_r_6_0_sva_4 <= MUX_v_7_2_2(STD_LOGIC_VECTOR'("0000000"), (z_out_2(6
            DOWNTO 0)), PAD_d_not_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        PAD_d_1_0_sva_3 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( reg_PAD_d_1_PAD_d_or_cse = '1' ) THEN
        PAD_d_1_0_sva_3 <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), z_out, (fsm_output(6)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        o_d_1_0_sva_1 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( ((fsm_output(0)) OR (fsm_output(39))) = '1' ) THEN
        o_d_1_0_sva_1 <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), z_out, (fsm_output(39)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        PAD_for_for_slc_PAD_for_for_acc_7_itm <= '0';
      ELSIF ( (fsm_output(1)) = '1' ) THEN
        PAD_for_for_slc_PAD_for_for_acc_7_itm <= z_out_1(7);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        PAD_for_for_if_PAD_for_for_if_or_itm <= '0';
      ELSIF ( (fsm_output(1)) = '1' ) THEN
        PAD_for_for_if_PAD_for_for_if_or_itm <= or_9_cse;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        PAD_for_for_c_7_0_sva_4 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (fsm_output(1)) = '1' ) THEN
        PAD_for_for_c_7_0_sva_4 <= z_out_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_NB_K_i_1_0_sva_3 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( ((fsm_output(6)) OR (fsm_output(39))) = '1' ) THEN
        CONV_NB_K_i_1_0_sva_3 <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), CONV_K_W_acc_23_psp_sva,
            (fsm_output(39)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_V_SLIDE_j_6_0_sva_2 <= STD_LOGIC_VECTOR'( "0000000");
        o_r_6_0_lpi_4 <= STD_LOGIC_VECTOR'( "0000000");
      ELSIF ( reg_CONV_V_SLIDE_j_6_CONV_V_SLIDE_j_or_cse = '1' ) THEN
        CONV_V_SLIDE_j_6_0_sva_2 <= MUX_v_7_2_2(STD_LOGIC_VECTOR'("0000000"), CONV_K_D_1_CONV_K_H_2_CONV_K_W_1_acc_3,
            (fsm_output(38)));
        o_r_6_0_lpi_4 <= MUX_v_7_2_2(STD_LOGIC_VECTOR'("0000000"), (z_out_2(6 DOWNTO
            0)), (fsm_output(38)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        o_c_7_0_lpi_4 <= STD_LOGIC_VECTOR'( "00000000");
        CONV_H_SLIDE_k_7_0_sva_1 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( reg_o_c_7_o_c_or_cse = '1' ) THEN
        o_c_7_0_lpi_4 <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), CONV_H_SLIDE_acc_5_itm_1,
            (fsm_output(37)));
        CONV_H_SLIDE_k_7_0_sva_1 <= MUX_v_8_2_2(STD_LOGIC_VECTOR'("00000000"), CONV_K_W_acc_2_psp_5_sva,
            (fsm_output(37)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_H_SLIDE_slc_CONV_H_SLIDE_acc_3_itm <= '0';
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_H_SLIDE_slc_CONV_H_SLIDE_acc_3_itm <= readindex(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(CONV_H_SLIDE_acc_nl),
            4)), 3);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_H_SLIDE_acc_15_psp_1 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_H_SLIDE_acc_15_psp_1 <= z_out_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_mux_itm <= '0';
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_mux_itm <= MUX_s_1_12_2x0x4x8('1', '0', '0', '0', '0', '0', '0',
            '0', '0', CONV_NB_K_i_1_0_sva_3 & CONV_K_W_conc_87_1 & (NOT (CONV_NB_K_i_1_0_sva_3(0))));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_mux_1_itm <= '0';
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_mux_1_itm <= MUX_s_1_22_2x0x1x6x7x8x9x14x15x16x17('0', '0', '0',
            '0', '0', '0', '0', '1', '0', '0', '0', '0', CONV_NB_K_i_1_0_sva_3 &
            z_out & (CONV_NB_K_i_1_0_sva_3(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm <= STD_LOGIC_VECTOR'( "00000000000000");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm <= CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_mux_2_itm <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_mux_2_itm <= MUX_v_4_22_2x0x1x6x7x8x9x14x15x16x17(STD_LOGIC_VECTOR'(
            "1111"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "1111"), STD_LOGIC_VECTOR'( "0101"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'( "0000"), CONV_NB_K_i_1_0_sva_3
            & z_out & (CONV_NB_K_i_1_0_sva_3(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_mux_4_itm <= '0';
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_mux_4_itm <= MUX_s_1_22_2x0x1x2x6x7x8x9x10x14x15x16x17x18('0', '0',
            '0', '0', '0', '1', '0', '0', '0', CONV_NB_K_i_1_0_sva_3 & z_out_16);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_mux_5_itm <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_mux_5_itm <= MUX_v_4_22_2x0x1x2x6x7x8x9x10x14x15x16x17x18(STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "1111"), STD_LOGIC_VECTOR'( "0101"), STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'( "0000"), CONV_NB_K_i_1_0_sva_3
            & z_out_16);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_mux_7_itm <= '0';
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_mux_7_itm <= MUX_s_1_11_2x3x7('0', '0', '0', '0', '1', '0', '0',
            '0', '0', CONV_NB_K_i_1_0_sva_3 & CONV_NB_K_i_1_0_sva_3);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_mux_8_itm <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_mux_8_itm <= MUX_v_4_11_2x3x7(STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'( "1111"), STD_LOGIC_VECTOR'(
            "0101"), STD_LOGIC_VECTOR'( "1111"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "0000"), CONV_NB_K_i_1_0_sva_3 & CONV_NB_K_i_1_0_sva_3);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_71_psp <= STD_LOGIC_VECTOR'( "00000000000000");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_acc_71_psp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_K_W_acc_29_sdt_mx0w0(13
            DOWNTO 1)), 13), 14) + UNSIGNED'( "01001101001101"), 14));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_29_sdt <= STD_LOGIC_VECTOR'( "00000000000000");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_acc_29_sdt <= CONV_K_W_acc_29_sdt_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_72_psp <= STD_LOGIC_VECTOR'( "00000000000000");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_acc_72_psp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_K_W_acc_30_sdt_mx0w0(13
            DOWNTO 1)), 13), 14) + UNSIGNED'( "01001101001101"), 14));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_30_sdt <= STD_LOGIC_VECTOR'( "00000000000000");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_acc_30_sdt <= CONV_K_W_acc_30_sdt_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_mux_10_itm <= '0';
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_mux_10_itm <= MUX_s_1_12_2('0', '0', '0', '0', '0', '1', '0', '0',
            '0', '0', '0', '0', (CONV_K_W_acc_69_psp(3 DOWNTO 2)) & (CONV_K_W_acc_69_psp(0))
            & (z_out_16(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_73_psp <= STD_LOGIC_VECTOR'( "00000000000000");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_acc_73_psp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm_mx0w0(13
            DOWNTO 1)), 13), 14) + UNSIGNED'( "01001101001101"), 14));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_mux_11_itm <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_mux_11_itm <= MUX_v_4_12_2(STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "1111"), STD_LOGIC_VECTOR'( "0101"), STD_LOGIC_VECTOR'( "1111"), STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "0000"), (CONV_K_W_acc_69_psp(3 DOWNTO 2))
            & (CONV_K_W_acc_69_psp(0)) & (z_out_16(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_mux_13_itm <= '0';
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_mux_13_itm <= MUX_s_1_26_2x0x1x2x3x4x5x10x11x12x13x18x19x20x21('0',
            '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', CONV_K_D_3_CONV_K_H_1_CONV_K_W_CONV_K_W_conc_4_4_1
            & (CONV_NB_K_i_1_0_sva_3(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_mux_14_itm <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_mux_14_itm <= MUX_v_4_26_2x0x1x2x3x4x5x10x11x12x13x18x19x20x21(STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "1111"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "1111"), STD_LOGIC_VECTOR'( "0101"), CONV_K_D_3_CONV_K_H_1_CONV_K_W_CONV_K_W_conc_4_4_1
            & (CONV_NB_K_i_1_0_sva_3(0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_mux_16_itm <= '0';
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_mux_16_itm <= MUX_s_1_26_2x0x1x2x3x6x10x14x18x22('0', '0', '0',
            '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1',
            CONV_K_D_3_CONV_K_H_2_CONV_K_W_CONV_K_W_conc_3_4_2 & (z_out_16(1 DOWNTO
            0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_mux_17_itm <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_mux_17_itm <= MUX_v_4_26_2x0x1x2x3x6x10x14x18x22(STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "1111"), STD_LOGIC_VECTOR'( "0101"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "1111"), STD_LOGIC_VECTOR'( "0101"), CONV_K_D_3_CONV_K_H_2_CONV_K_W_CONV_K_W_conc_3_4_2
            & (z_out_16(1 DOWNTO 0)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_74_psp_11_0 <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_acc_74_psp_11_0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_K_W_acc_29_sdt_mx0w0(13
            DOWNTO 2)) + UNSIGNED'( "001101001101"), 12));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_75_psp_11_0 <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_acc_75_psp_11_0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_K_W_acc_30_sdt_mx0w0(13
            DOWNTO 2)) + UNSIGNED'( "001101001101"), 12));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_mux_19_itm <= '0';
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_mux_19_itm <= MUX_s_1_15_2x0x1x2x3x7x11('0', '0', '0', '0', '0',
            '0', '0', '1', '0', CONV_K_W_acc_23_psp_sva & CONV_NB_K_i_1_0_sva_3);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_76_psp_11_0 <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_acc_76_psp_11_0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_K_D_1_CONV_K_H_2_CONV_K_W_3_acc_14_itm_mx0w0(13
            DOWNTO 2)) + UNSIGNED'( "001101001101"), 12));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_mux_20_itm <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_mux_20_itm <= MUX_v_4_15_2x0x1x2x3x7x11(STD_LOGIC_VECTOR'( "0000"),
            STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "1111"), STD_LOGIC_VECTOR'( "0101"), STD_LOGIC_VECTOR'( "1111"), CONV_K_W_acc_23_psp_sva
            & CONV_NB_K_i_1_0_sva_3);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_mux_22_itm <= '0';
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_mux_22_itm <= MUX_s_1_11_2x3x7('0', '1', '0', '0', '0', '0', '0',
            '0', '0', CONV_NB_K_i_1_0_sva_3 & CONV_NB_K_i_1_0_sva_3);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_mux_23_itm <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_mux_23_itm <= MUX_v_4_11_2x3x7(STD_LOGIC_VECTOR'( "1111"), STD_LOGIC_VECTOR'(
            "0101"), STD_LOGIC_VECTOR'( "1111"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "0000"), CONV_NB_K_i_1_0_sva_3 & CONV_NB_K_i_1_0_sva_3);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_mux_26_itm <= STD_LOGIC_VECTOR'( "0000");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_W_mux_26_itm <= MUX_v_4_12_2x0x4x8(STD_LOGIC_VECTOR'( "0101"), STD_LOGIC_VECTOR'(
            "1111"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'( "0000"), STD_LOGIC_VECTOR'(
            "0000"), STD_LOGIC_VECTOR'( "0000"), CONV_NB_K_i_1_0_sva_3 & CONV_K_W_conc_87_1
            & (NOT (CONV_NB_K_i_1_0_sva_3(0))));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_H_1_CONV_K_W_acc_17_cse_1_sva <= STD_LOGIC_VECTOR'( "0000000");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        CONV_K_H_1_CONV_K_W_acc_17_cse_1_sva <= CONV_K_H_1_CONV_K_W_acc_17_cse_1_sva_mx0w0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_H_SLIDE_acc_5_itm_1 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( or_tmp_76 = '0' ) THEN
        CONV_H_SLIDE_acc_5_itm_1 <= z_out_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_D_1_CONV_K_H_3_CONV_K_W_1_acc_14_itm <= STD_LOGIC_VECTOR'( "00000000000000");
      ELSIF ( (fsm_output(8)) = '1' ) THEN
        CONV_K_D_1_CONV_K_H_3_CONV_K_W_1_acc_14_itm <= z_out_13;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_D_1_CONV_K_H_3_CONV_K_W_2_acc_14_itm <= STD_LOGIC_VECTOR'( "00000000000000");
      ELSIF ( (fsm_output(8)) = '1' ) THEN
        CONV_K_D_1_CONV_K_H_3_CONV_K_W_2_acc_14_itm <= z_out_14;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_acc_14_itm <= STD_LOGIC_VECTOR'( "00000000000000");
      ELSIF ( (fsm_output(8)) = '1' ) THEN
        CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_acc_14_itm <= z_out_15;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_77_psp <= STD_LOGIC_VECTOR'( "00000000000000");
      ELSIF ( (fsm_output(8)) = '1' ) THEN
        CONV_K_W_acc_77_psp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(z_out_13(13
            DOWNTO 1)), 13), 14) + UNSIGNED'( "01001101001101"), 14));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_78_psp <= STD_LOGIC_VECTOR'( "00000000000000");
      ELSIF ( (fsm_output(8)) = '1' ) THEN
        CONV_K_W_acc_78_psp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(z_out_14(13
            DOWNTO 1)), 13), 14) + UNSIGNED'( "01001101001101"), 14));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_79_psp <= STD_LOGIC_VECTOR'( "00000000000000");
      ELSIF ( (fsm_output(8)) = '1' ) THEN
        CONV_K_W_acc_79_psp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(z_out_15(13
            DOWNTO 1)), 13), 14) + UNSIGNED'( "01001101001101"), 14));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_80_psp_11_0 <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (fsm_output(8)) = '1' ) THEN
        CONV_K_W_acc_80_psp_11_0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_13(13
            DOWNTO 2)) + UNSIGNED'( "001101001101"), 12));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_81_psp_11_0 <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (fsm_output(8)) = '1' ) THEN
        CONV_K_W_acc_81_psp_11_0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_14(13
            DOWNTO 2)) + UNSIGNED'( "001101001101"), 12));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_82_psp_11_0 <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (fsm_output(8)) = '1' ) THEN
        CONV_K_W_acc_82_psp_11_0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_15(13
            DOWNTO 2)) + UNSIGNED'( "001101001101"), 12));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_83_psp <= STD_LOGIC_VECTOR'( "00000000000000");
      ELSIF ( (fsm_output(9)) = '1' ) THEN
        CONV_K_W_acc_83_psp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(z_out_13(13
            DOWNTO 1)), 13), 14) + UNSIGNED'( "01001101001101"), 14));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_26_sdt <= STD_LOGIC_VECTOR'( "00000000000000");
      ELSIF ( (fsm_output(9)) = '1' ) THEN
        CONV_K_W_acc_26_sdt <= z_out_13;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_84_psp <= STD_LOGIC_VECTOR'( "00000000000000");
      ELSIF ( (fsm_output(9)) = '1' ) THEN
        CONV_K_W_acc_84_psp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(z_out_14(13
            DOWNTO 1)), 13), 14) + UNSIGNED'( "01001101001101"), 14));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_27_sdt <= STD_LOGIC_VECTOR'( "00000000000000");
      ELSIF ( (fsm_output(9)) = '1' ) THEN
        CONV_K_W_acc_27_sdt <= z_out_14;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_85_psp <= STD_LOGIC_VECTOR'( "00000000000000");
      ELSIF ( (fsm_output(9)) = '1' ) THEN
        CONV_K_W_acc_85_psp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(z_out_15(13
            DOWNTO 1)), 13), 14) + UNSIGNED'( "01001101001101"), 14));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_28_sdt <= STD_LOGIC_VECTOR'( "00000000000000");
      ELSIF ( (fsm_output(9)) = '1' ) THEN
        CONV_K_W_acc_28_sdt <= z_out_15;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_86_psp_11_0 <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (fsm_output(9)) = '1' ) THEN
        CONV_K_W_acc_86_psp_11_0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_13(13
            DOWNTO 2)) + UNSIGNED'( "001101001101"), 12));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_87_psp_11_0 <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (fsm_output(9)) = '1' ) THEN
        CONV_K_W_acc_87_psp_11_0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_14(13
            DOWNTO 2)) + UNSIGNED'( "001101001101"), 12));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_88_psp_11_0 <= STD_LOGIC_VECTOR'( "000000000000");
      ELSIF ( (fsm_output(9)) = '1' ) THEN
        CONV_K_W_acc_88_psp_11_0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_15(13
            DOWNTO 2)) + UNSIGNED'( "001101001101"), 12));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_55_itm <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( (fsm_output(10)) = '1' ) THEN
        CONV_K_W_acc_55_itm <= z_out_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_63_itm <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( (fsm_output(13)) = '1' ) THEN
        CONV_K_W_acc_63_itm <= z_out_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_D_1_CONV_K_H_1_CONV_K_W_1_CONV_K_W_and_itm <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( (fsm_output(13)) = '1' ) THEN
        CONV_K_D_1_CONV_K_H_1_CONV_K_W_1_CONV_K_W_and_itm <= CONV_K_D_1_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_57_itm <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( (fsm_output(16)) = '1' ) THEN
        CONV_K_W_acc_57_itm <= z_out_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_45_itm <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( (fsm_output(17)) = '1' ) THEN
        CONV_K_W_acc_45_itm <= z_out_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_67_itm <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( (fsm_output(20)) = '1' ) THEN
        CONV_K_W_acc_67_itm <= z_out_11;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_47_itm <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( (fsm_output(21)) = '1' ) THEN
        CONV_K_W_acc_47_itm <= z_out_11;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_59_itm <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( (fsm_output(23)) = '1' ) THEN
        CONV_K_W_acc_59_itm <= z_out_9;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_49_itm <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( (fsm_output(25)) = '1' ) THEN
        CONV_K_W_acc_49_itm <= z_out_6;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_65_itm <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( (fsm_output(28)) = '1' ) THEN
        CONV_K_W_acc_65_itm <= z_out_10;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_51_itm <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( (fsm_output(29)) = '1' ) THEN
        CONV_K_W_acc_51_itm <= z_out_8;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_61_itm <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( (fsm_output(31)) = '1' ) THEN
        CONV_K_W_acc_61_itm <= z_out_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        CONV_K_W_acc_53_itm <= STD_LOGIC_VECTOR'( "00000000000");
      ELSIF ( (fsm_output(33)) = '1' ) THEN
        CONV_K_W_acc_53_itm <= z_out_7;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_CONV_H_SLIDE_acc_12_psp_tmp_5 <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        reg_CONV_H_SLIDE_acc_12_psp_tmp_5 <= z_out_2(1 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_CONV_H_SLIDE_acc_14_sdt_tmp_7 <= '0';
      ELSIF ( (fsm_output(7)) = '1' ) THEN
        reg_CONV_H_SLIDE_acc_14_sdt_tmp_7 <= CONV_H_SLIDE_acc_14_sdt_mx0w0(0);
      END IF;
    END IF;
  END PROCESS;
  PAD_for_for_c_nor_nl <= NOT((fsm_output(0)) OR (fsm_output(5)) OR (fsm_output(6)));
  PAD_for_for_else_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(PAD_for_for_c_7_0_sva_3),
      8), 9) + SIGNED'( "111111111"), 9));
  PAD_for_for_else_oif_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(PAD_for_for_c_7_0_sva_3),
      8), 9) + SIGNED'( "101011111"), 9));
  or_nl <= (readindex(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(PAD_for_for_else_acc_nl),
      9)), 8)) OR (NOT (readindex(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(PAD_for_for_else_oif_acc_nl),
      9)), 8)));
  PAD_d_not_nl <= NOT reg_PAD_d_1_PAD_d_or_cse;
  CONV_H_SLIDE_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED('1' & (NOT (CONV_K_W_acc_2_psp_5_sva_mx0w0(7
      DOWNTO 5)))) + SIGNED'( "0101"), 4));
  CONV_NB_K_CONV_NB_K_and_1_nl <= (PAD_d_1_0_sva_3(1)) AND (NOT((fsm_output(39))
      OR (fsm_output(7))));
  CONV_NB_K_mux1h_2_nl <= MUX1HOT_s_1_3_2((o_d_1_0_sva_1(0)), (PAD_d_1_0_sva_3(0)),
      (CONV_NB_K_i_1_0_sva_3(1)), STD_LOGIC_VECTOR'( (fsm_output(39)) & (fsm_output(6))
      & (fsm_output(7))));
  z_out <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( CONV_NB_K_CONV_NB_K_and_1_nl
      & CONV_NB_K_mux1h_2_nl) + UNSIGNED'( "01"), 2));
  PAD_for_for_mux_2_nl <= MUX_v_8_2_2(STD_LOGIC_VECTOR'( "10101111"), z_out_3_7_0,
      fsm_output(7));
  PAD_for_for_mux_3_nl <= MUX_v_7_2_2((z_out_4(7 DOWNTO 1)), (CONV_H_SLIDE_acc_14_sdt_mx0w0(7
      DOWNTO 1)), fsm_output(7));
  z_out_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(PAD_for_for_mux_2_nl) + CONV_UNSIGNED(UNSIGNED(PAD_for_for_mux_3_nl),
      8), 8));
  CONV_V_SLIDE_or_2_nl <= (fsm_output(5)) OR (fsm_output(2));
  CONV_V_SLIDE_CONV_V_SLIDE_mux_1_nl <= MUX_v_7_2_2(o_r_6_0_lpi_4, PAD_for_r_6_0_sva_4,
      CONV_V_SLIDE_or_2_nl);
  CONV_V_SLIDE_nor_1_nl <= NOT((fsm_output(38)) OR (fsm_output(5)) OR (fsm_output(7)));
  CONV_V_SLIDE_or_3_nl <= (fsm_output(38)) OR (fsm_output(5));
  CONV_V_SLIDE_mux1h_2_nl <= MUX1HOT_v_3_3_2(STD_LOGIC_VECTOR'( "001"), PAD_for_for_else_else_acc_5_psp_sva_2_7_5,
      (o_c_7_0_lpi_4(7 DOWNTO 5)), STD_LOGIC_VECTOR'( CONV_V_SLIDE_or_3_nl & (fsm_output(2))
      & (fsm_output(7))));
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_V_SLIDE_CONV_V_SLIDE_mux_1_nl),
      8) + CONV_UNSIGNED(CONV_SIGNED(SIGNED(CONV_V_SLIDE_nor_1_nl & CONV_V_SLIDE_mux1h_2_nl),
      4), 8), 8));
  CONV_H_SLIDE_mux_10_nl <= MUX_v_2_2_2(o_d_1_0_sva_1, PAD_d_1_0_sva_3, fsm_output(2));
  z_out_3_7_0 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(CONV_H_SLIDE_mux_10_nl)
      * UNSIGNED'( "1001011")), 8));
  CONV_H_SLIDE_mux_11_nl <= MUX_v_8_2_2(o_c_7_0_lpi_4, PAD_for_for_c_7_0_sva_3, fsm_output(1));
  z_out_4 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_H_SLIDE_mux_11_nl) + UNSIGNED'(
      "00000001"), 8));
  CONV_K_W_mux1h_10_nl <= MUX1HOT_v_4_9_2(CONV_K_W_mux_26_itm, CONV_K_W_mux_23_itm,
      CONV_K_W_mux_20_itm, CONV_K_W_mux_17_itm, CONV_K_W_mux_14_itm, CONV_K_W_mux_11_itm,
      CONV_K_W_mux_8_itm, CONV_K_W_mux_5_itm, CONV_K_W_mux_2_itm, STD_LOGIC_VECTOR'(
      (fsm_output(9)) & (fsm_output(12)) & (fsm_output(15)) & (fsm_output(18)) &
      (fsm_output(21)) & (fsm_output(24)) & (fsm_output(27)) & (fsm_output(30)) &
      (fsm_output(33))));
  z_out_5 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(SIGNED'( SIGNED(CONV_K_W_mux1h_10_nl)
      * SIGNED(pad_input_rsci_data_out_d)), 11));
  CONV_K_W_acc_90_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_K_W_acc_62_itm_1)
      + UNSIGNED(CONV_K_W_acc_61_itm), 11));
  CONV_K_W_acc_89_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_K_W_acc_90_nl),
      11) + UNSIGNED(CONV_K_W_acc_65_itm), 11));
  CONV_K_W_or_10_nl <= (fsm_output(16)) OR (fsm_output(28));
  CONV_K_W_mux1h_11_nl <= MUX1HOT_v_11_6_2(CONV_K_W_acc_56_itm_1, reg_CONV_K_W_acc_44_cse,
      CONV_K_D_3_CONV_K_H_2_CONV_K_W_3_CONV_K_W_and_2, CONV_K_W_acc_58_itm_1, CONV_K_D_2_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_2,
      STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_K_W_acc_89_nl), 11)), STD_LOGIC_VECTOR'(
      (fsm_output(13)) & CONV_K_W_or_10_nl & (fsm_output(19)) & (fsm_output(20))
      & (fsm_output(31)) & (fsm_output(36))));
  CONV_K_W_or_11_nl <= (fsm_output(10)) OR (fsm_output(35)) OR (fsm_output(23)) OR
      (fsm_output(25));
  CONV_K_W_or_9_nl <= MUX_v_11_2_2(CONV_K_W_mux1h_11_nl, STD_LOGIC_VECTOR'("11111111111"),
      CONV_K_W_or_11_nl);
  or_148_nl <= (CONV_K_W_mux_10_itm AND or_dcpl) OR (CONV_K_W_mux_itm AND or_dcpl_11);
  mux_1_nl <= MUX_v_11_2_2(CONV_K_W_or_9_nl, CONV_K_D_1_CONV_K_H_2_CONV_K_W_acc_21,
      or_148_nl);
  nor_25_nl <= NOT(((NOT CONV_K_W_mux_10_itm) AND or_dcpl) OR ((NOT CONV_K_W_mux_itm)
      AND or_dcpl_11));
  and_325_nl <= MUX_v_11_2_2(STD_LOGIC_VECTOR'("00000000000"), mux_1_nl, nor_25_nl);
  CONV_K_W_or_12_nl <= (fsm_output(10)) OR (fsm_output(19)) OR (fsm_output(25)) OR
      (fsm_output(31));
  CONV_K_W_mux1h_12_nl <= MUX1HOT_v_11_8_2(reg_CONV_K_D_1_CONV_K_H_2_CONV_K_W_2_mul_10_cse,
      CONV_K_W_acc_55_itm, CONV_K_D_1_CONV_K_H_1_CONV_K_W_1_CONV_K_W_and_itm, CONV_K_W_acc_57_itm,
      CONV_K_D_3_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm_1, CONV_K_W_acc_49_itm, CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_CONV_K_W_and_itm_1,
      CONV_K_W_acc_67_itm, STD_LOGIC_VECTOR'( CONV_K_W_or_12_nl & (fsm_output(13))
      & (fsm_output(16)) & (fsm_output(20)) & (fsm_output(23)) & (fsm_output(28))
      & (fsm_output(35)) & (fsm_output(36))));
  z_out_6 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(and_325_nl) + UNSIGNED(CONV_K_W_mux1h_12_nl),
      11));
  CONV_K_W_CONV_K_W_mux_1_nl <= MUX_v_11_2_2(z_out_5, z_out_6, fsm_output(31));
  CONV_K_W_mux1h_13_nl <= MUX1HOT_v_11_3_2(CONV_K_D_1_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm_1,
      CONV_K_W_acc_51_itm, CONV_K_D_1_CONV_K_H_3_CONV_K_W_3_CONV_K_W_and_itm_1, STD_LOGIC_VECTOR'(
      (fsm_output(12)) & (fsm_output(31)) & (fsm_output(33))));
  z_out_7 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_K_W_CONV_K_W_mux_1_nl)
      + UNSIGNED(CONV_K_W_mux1h_13_nl), 11));
  CONV_K_W_or_13_nl <= (fsm_output(15)) OR (fsm_output(27));
  CONV_K_W_mux1h_14_nl <= MUX1HOT_v_11_3_2(z_out_5, CONV_K_D_3_CONV_K_H_2_CONV_K_W_3_CONV_K_W_and_2,
      CONV_K_D_2_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_2, STD_LOGIC_VECTOR'( CONV_K_W_or_13_nl
      & (fsm_output(17)) & (fsm_output(29))));
  CONV_K_W_or_14_nl <= (fsm_output(27)) OR (fsm_output(29));
  CONV_K_W_mux_92_nl <= MUX_v_11_2_2(CONV_K_D_3_CONV_K_H_3_CONV_K_W_3_CONV_K_W_and_itm_1,
      CONV_K_D_2_CONV_K_H_2_CONV_K_W_3_CONV_K_W_and_itm_1, CONV_K_W_or_14_nl);
  z_out_8 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_K_W_mux1h_14_nl) + UNSIGNED(CONV_K_W_mux_92_nl),
      11));
  CONV_K_W_mux_93_nl <= MUX_v_11_2_2(CONV_K_W_acc_47_itm, CONV_K_W_acc_53_itm, fsm_output(35));
  z_out_9 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_6) + UNSIGNED(CONV_K_W_mux_93_nl),
      11));
  CONV_K_W_mux_94_nl <= MUX_v_11_2_2(CONV_K_W_acc_45_itm, CONV_K_W_acc_59_itm, fsm_output(28));
  z_out_10 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_6) + UNSIGNED(CONV_K_W_mux_94_nl),
      11));
  CONV_K_W_mux_95_nl <= MUX_v_11_2_2(z_out_6, z_out_5, fsm_output(21));
  CONV_K_W_mux_96_nl <= MUX_v_11_2_2(CONV_K_W_acc_63_itm, CONV_K_D_3_CONV_K_H_1_CONV_K_W_3_CONV_K_W_and_itm_1,
      fsm_output(21));
  z_out_11 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(CONV_K_W_mux_95_nl) + UNSIGNED(CONV_K_W_mux_96_nl),
      11));
  CONV_K_W_mux1h_15_nl <= MUX1HOT_v_6_3_2((CONV_K_D_1_CONV_K_H_2_CONV_K_W_1_acc_3(6
      DOWNTO 1)), CONV_K_D_1_CONV_K_W_acc_itm_1, (CONV_V_SLIDE_j_6_0_sva_2(6 DOWNTO
      1)), STD_LOGIC_VECTOR'( (fsm_output(7)) & (fsm_output(8)) & (fsm_output(9))));
  CONV_K_W_mux1h_16_nl <= MUX1HOT_s_1_3_2((CONV_K_D_1_CONV_K_H_2_CONV_K_W_1_acc_3(0)),
      (CONV_V_SLIDE_j_6_0_sva_2(0)), (CONV_V_SLIDE_j_6_0_sva_2(0)), STD_LOGIC_VECTOR'(
      (fsm_output(7)) & (fsm_output(8)) & (fsm_output(9))));
  z_out_12 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'( UNSIGNED(CONV_K_W_mux1h_15_nl
      & CONV_K_W_mux1h_16_nl) * UNSIGNED'( "1010001")), 14));
  z_out_13 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_12) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_H_SLIDE_k_7_0_sva_1(7
      DOWNTO 1)), 7), 14), 14));
  z_out_14 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_12) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_K_W_acc_2_psp_5_sva(7
      DOWNTO 1)), 7), 14), 14));
  z_out_15 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(z_out_12) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_K_H_1_CONV_K_W_acc_17_cse_1_sva),
      7), 14), 14));
  CONV_K_W_mux_97_nl <= MUX_v_2_2_2(CONV_NB_K_i_1_0_sva_3, CONV_K_W_acc_23_psp_sva,
      fsm_output(39));
  z_out_16 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(CONV_K_W_mux_97_nl),
      3) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED'( (fsm_output(39)) & '1'), 2), 3)
      + UNSIGNED'( "010"), 3));
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    apply_conv
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps_v11.ALL;
USE work.singleport_ram_be_pkg.ALL;


ENTITY apply_conv IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    conv_in_rsc_addr : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    conv_in_rsc_re : OUT STD_LOGIC;
    conv_in_rsc_data_out : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    conv_in_rsc_triosy_lz : OUT STD_LOGIC;
    conv_out_rsc_data_in : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
    conv_out_rsc_addr : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    conv_out_rsc_we : OUT STD_LOGIC;
    conv_out_rsc_triosy_lz : OUT STD_LOGIC
  );
END apply_conv;

ARCHITECTURE v2 OF apply_conv IS
  -- Default Constants
  SIGNAL PWR : STD_LOGIC;
  SIGNAL GND : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL conv_in_rsci_addr_d : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL conv_in_rsci_re_d : STD_LOGIC;
  SIGNAL conv_in_rsci_data_out_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL conv_out_rsci_data_in_d : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL conv_out_rsci_addr_d : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL conv_out_rsci_we_d : STD_LOGIC;
  SIGNAL pad_input_rsci_data_in_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL pad_input_rsci_addr_d : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL pad_input_rsci_re_d : STD_LOGIC;
  SIGNAL pad_input_rsci_we_d : STD_LOGIC;
  SIGNAL pad_input_rsci_data_out_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL pad_input_rsc_en : STD_LOGIC;
  SIGNAL pad_input_rsc_data_out : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL pad_input_rsc_we : STD_LOGIC;
  SIGNAL pad_input_rsc_re : STD_LOGIC;
  SIGNAL pad_input_rsc_addr : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL pad_input_rsc_data_in : STD_LOGIC_VECTOR (9 DOWNTO 0);

  SIGNAL pad_input_rsc_comp_data_in : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL pad_input_rsc_comp_addr : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL pad_input_rsc_comp_re : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL pad_input_rsc_comp_we : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL pad_input_rsc_comp_data_out : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT ram_Xilinx_ARTIX_7_2_RAMSB_singleport_rport_1_57600_10_16_0_1_0_0_0_1_1_1_0_57600_10_1_gen
    PORT(
      data_out : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      re : OUT STD_LOGIC;
      addr : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      addr_d : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      re_d : IN STD_LOGIC;
      data_out_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL conv_in_rsci_data_out : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL conv_in_rsci_addr : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL conv_in_rsci_addr_d_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL conv_in_rsci_data_out_d_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT ram_Xilinx_ARTIX_7_2_RAMSB_singleport_wport_2_57600_11_16_0_1_0_0_0_1_1_1_0_57600_11_1_gen
    PORT(
      we : OUT STD_LOGIC;
      addr : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      data_in : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      data_in_d : IN STD_LOGIC_VECTOR (10 DOWNTO 0);
      addr_d : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      we_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL conv_out_rsci_addr : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL conv_out_rsci_data_in : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL conv_out_rsci_data_in_d_1 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL conv_out_rsci_addr_d_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);

  COMPONENT ram_Xilinx_ARTIX_7_2_RAMSB_singleport_rwport_en_3_59292_10_16_0_1_0_0_0_1_1_1_0_59292_10_1_gen
    PORT(
      en : OUT STD_LOGIC;
      data_out : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      we : OUT STD_LOGIC;
      re : OUT STD_LOGIC;
      addr : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      data_in : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      data_in_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      addr_d : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      re_d : IN STD_LOGIC;
      we_d : IN STD_LOGIC;
      data_out_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      en_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL pad_input_rsci_data_out : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL pad_input_rsci_addr : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL pad_input_rsci_data_in : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL pad_input_rsci_data_in_d_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL pad_input_rsci_addr_d_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL pad_input_rsci_data_out_d_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);

  COMPONENT apply_conv_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      conv_in_rsc_triosy_lz : OUT STD_LOGIC;
      conv_out_rsc_triosy_lz : OUT STD_LOGIC;
      conv_in_rsci_addr_d : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      conv_in_rsci_re_d : OUT STD_LOGIC;
      conv_in_rsci_data_out_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      conv_out_rsci_data_in_d : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
      conv_out_rsci_addr_d : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      conv_out_rsci_we_d : OUT STD_LOGIC;
      pad_input_rsci_data_in_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      pad_input_rsci_addr_d : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
      pad_input_rsci_re_d : OUT STD_LOGIC;
      pad_input_rsci_we_d : OUT STD_LOGIC;
      pad_input_rsci_data_out_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL apply_conv_core_inst_conv_in_rsci_addr_d : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL apply_conv_core_inst_conv_in_rsci_data_out_d : STD_LOGIC_VECTOR (9 DOWNTO
      0);
  SIGNAL apply_conv_core_inst_conv_out_rsci_data_in_d : STD_LOGIC_VECTOR (10 DOWNTO
      0);
  SIGNAL apply_conv_core_inst_conv_out_rsci_addr_d : STD_LOGIC_VECTOR (15 DOWNTO
      0);
  SIGNAL apply_conv_core_inst_pad_input_rsci_data_in_d : STD_LOGIC_VECTOR (9 DOWNTO
      0);
  SIGNAL apply_conv_core_inst_pad_input_rsci_addr_d : STD_LOGIC_VECTOR (15 DOWNTO
      0);
  SIGNAL apply_conv_core_inst_pad_input_rsci_data_out_d : STD_LOGIC_VECTOR (9 DOWNTO
      0);

BEGIN
  -- Default Constant Signal Assignments
  PWR <= '1';
  GND <= '0';

  pad_input_rsc_comp : work.singleport_ram_be_pkg.singleport_ram_be
    GENERIC MAP(
      ram_id => 3,
      words => 59292,
      width => 10,
      addr_width => 16,
      a_reset_active => 0,
      s_reset_active => 1,
      enable_active => 0,
      re_active => 0,
      we_active => 0,
      num_byte_enables => 1,
      clock_edge => 1,
      num_input_registers => 1,
      num_output_registers => 0,
      no_of_singleport_readwrite_port => 1
      )
    PORT MAP(
      data_in => pad_input_rsc_comp_data_in,
      addr => pad_input_rsc_comp_addr,
      re => pad_input_rsc_comp_re,
      we => pad_input_rsc_comp_we,
      data_out => pad_input_rsc_comp_data_out,
      clk => clk,
      a_rst => PWR,
      s_rst => rst,
      en => pad_input_rsc_en
    );
  pad_input_rsc_comp_data_in <= pad_input_rsc_data_in;
  pad_input_rsc_comp_addr <= pad_input_rsc_addr;
  pad_input_rsc_comp_re(0) <= pad_input_rsc_re;
  pad_input_rsc_comp_we(0) <= pad_input_rsc_we;
  pad_input_rsc_data_out <= pad_input_rsc_comp_data_out;

  conv_in_rsci : ram_Xilinx_ARTIX_7_2_RAMSB_singleport_rport_1_57600_10_16_0_1_0_0_0_1_1_1_0_57600_10_1_gen
    PORT MAP(
      data_out => conv_in_rsci_data_out,
      re => conv_in_rsc_re,
      addr => conv_in_rsci_addr,
      addr_d => conv_in_rsci_addr_d_1,
      re_d => conv_in_rsci_re_d,
      data_out_d => conv_in_rsci_data_out_d_1
    );
  conv_in_rsci_data_out <= conv_in_rsc_data_out;
  conv_in_rsc_addr <= conv_in_rsci_addr;
  conv_in_rsci_addr_d_1 <= conv_in_rsci_addr_d;
  conv_in_rsci_data_out_d <= conv_in_rsci_data_out_d_1;

  conv_out_rsci : ram_Xilinx_ARTIX_7_2_RAMSB_singleport_wport_2_57600_11_16_0_1_0_0_0_1_1_1_0_57600_11_1_gen
    PORT MAP(
      we => conv_out_rsc_we,
      addr => conv_out_rsci_addr,
      data_in => conv_out_rsci_data_in,
      data_in_d => conv_out_rsci_data_in_d_1,
      addr_d => conv_out_rsci_addr_d_1,
      we_d => conv_out_rsci_we_d
    );
  conv_out_rsc_addr <= conv_out_rsci_addr;
  conv_out_rsc_data_in <= conv_out_rsci_data_in;
  conv_out_rsci_data_in_d_1 <= conv_out_rsci_data_in_d;
  conv_out_rsci_addr_d_1 <= conv_out_rsci_addr_d;

  pad_input_rsci : ram_Xilinx_ARTIX_7_2_RAMSB_singleport_rwport_en_3_59292_10_16_0_1_0_0_0_1_1_1_0_59292_10_1_gen
    PORT MAP(
      en => pad_input_rsc_en,
      data_out => pad_input_rsci_data_out,
      we => pad_input_rsc_we,
      re => pad_input_rsc_re,
      addr => pad_input_rsci_addr,
      data_in => pad_input_rsci_data_in,
      data_in_d => pad_input_rsci_data_in_d_1,
      addr_d => pad_input_rsci_addr_d_1,
      re_d => pad_input_rsci_re_d,
      we_d => pad_input_rsci_we_d,
      data_out_d => pad_input_rsci_data_out_d_1,
      en_d => GND
    );
  pad_input_rsci_data_out <= pad_input_rsc_data_out;
  pad_input_rsc_addr <= pad_input_rsci_addr;
  pad_input_rsc_data_in <= pad_input_rsci_data_in;
  pad_input_rsci_data_in_d_1 <= pad_input_rsci_data_in_d;
  pad_input_rsci_addr_d_1 <= pad_input_rsci_addr_d;
  pad_input_rsci_data_out_d <= pad_input_rsci_data_out_d_1;

  apply_conv_core_inst : apply_conv_core
    PORT MAP(
      clk => clk,
      rst => rst,
      conv_in_rsc_triosy_lz => conv_in_rsc_triosy_lz,
      conv_out_rsc_triosy_lz => conv_out_rsc_triosy_lz,
      conv_in_rsci_addr_d => apply_conv_core_inst_conv_in_rsci_addr_d,
      conv_in_rsci_re_d => conv_in_rsci_re_d,
      conv_in_rsci_data_out_d => apply_conv_core_inst_conv_in_rsci_data_out_d,
      conv_out_rsci_data_in_d => apply_conv_core_inst_conv_out_rsci_data_in_d,
      conv_out_rsci_addr_d => apply_conv_core_inst_conv_out_rsci_addr_d,
      conv_out_rsci_we_d => conv_out_rsci_we_d,
      pad_input_rsci_data_in_d => apply_conv_core_inst_pad_input_rsci_data_in_d,
      pad_input_rsci_addr_d => apply_conv_core_inst_pad_input_rsci_addr_d,
      pad_input_rsci_re_d => pad_input_rsci_re_d,
      pad_input_rsci_we_d => pad_input_rsci_we_d,
      pad_input_rsci_data_out_d => apply_conv_core_inst_pad_input_rsci_data_out_d
    );
  conv_in_rsci_addr_d <= apply_conv_core_inst_conv_in_rsci_addr_d;
  apply_conv_core_inst_conv_in_rsci_data_out_d <= conv_in_rsci_data_out_d;
  conv_out_rsci_data_in_d <= apply_conv_core_inst_conv_out_rsci_data_in_d;
  conv_out_rsci_addr_d <= apply_conv_core_inst_conv_out_rsci_addr_d;
  pad_input_rsci_data_in_d <= apply_conv_core_inst_pad_input_rsci_data_in_d;
  pad_input_rsci_addr_d <= apply_conv_core_inst_pad_input_rsci_addr_d;
  apply_conv_core_inst_pad_input_rsci_data_out_d <= pad_input_rsci_data_out_d;

END v2;



