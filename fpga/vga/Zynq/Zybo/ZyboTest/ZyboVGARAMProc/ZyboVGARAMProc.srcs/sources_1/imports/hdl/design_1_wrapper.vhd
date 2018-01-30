--Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
--Date        : Wed Sep 20 17:23:43 2017
--Host        : meleze running 64-bit unknown
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;



library vfixe ;
use vfixe.vfixe.all;
use vfixe.reduce_pack.all;
use vfixe.reduce_pack_boolean.all;

library divers;
use divers.data_pkg.all;

library RAM;
use RAM.RAM_pkg.all;

library img;
use img.vecteur_pkg.all;
use img.image_pkg.all;

library io_video;
use io_video.io_video_pkg.all;



entity design_1_wrapper is
  port (
    VGA_R : out STD_LOGIC_VECTOR ( 4 downto 0 );  
    VGA_B : out STD_LOGIC_VECTOR ( 4 downto 0 );
    VGA_G : out STD_LOGIC_VECTOR ( 5 downto 0 );
    VGA_VS : out STD_LOGIC;
    VGA_HS : out STD_LOGIC;

    btn: in STD_LOGIC_VECTOR ( 3 downto 0 );
    sw : in STD_LOGIC_VECTOR ( 3 downto 0 );

    led : out STD_LOGIC_VECTOR ( 3 downto 0 );
    
    pl_clk : in STD_LOGIC
    );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is



component Zybo_VGA_Proc_RAM  is
  port (
    VGA_R : out STD_LOGIC_VECTOR ( 4 downto 0 );  
    VGA_B : out STD_LOGIC_VECTOR ( 4 downto 0 );
    VGA_G : out STD_LOGIC_VECTOR ( 5 downto 0 );
    VGA_VS : out STD_LOGIC;
    VGA_HS : out STD_LOGIC;

    btn: in STD_LOGIC_VECTOR ( 3 downto 0 );
    sw : in STD_LOGIC_VECTOR ( 3 downto 0 );

    led : out STD_LOGIC_VECTOR ( 3 downto 0 );
    
    pl_clk : in STD_LOGIC
    );
end component Zybo_VGA_Proc_RAM;
begin
  mire : Zybo_VGA_Proc_RAM 
  port map (
    VGA_R => VGA_R,
    VGA_B => VGA_B,
    VGA_G => VGA_G,
    VGA_VS  => VGA_VS,
    VGA_HS   => VGA_HS,
    
    btn  =>  btn,
    sw   => sw,

    led  =>  led,
    
    pl_clk =>  pl_clk
    );
end STRUCTURE;
