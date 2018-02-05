-- vivado_top.vhdl
-- Top level VHDL file to test Convolution+ReLU layer with VGA display.
--
-- authors: Rafael COSTA SALES
--          Duc Huy DAO
--


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



entity Zybo_VGA_Proc_RAM  is
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
end Zybo_VGA_Proc_RAM;

architecture STRUCTURE of Zybo_VGA_Proc_RAM is
  component clk_wiz_0 
    port (
      clk_out1 : out  STD_LOGIC;
      clk_in1: in  std_logic
      );
  end component clk_wiz_0;
  component display_VGA_memory_read is
    generic (
      vga_cfg : VGA_config;
      mem_cfg : Video_mem_config    
      );
    Port (
      clk : in  std_logic;
      rst : in  std_logic;
      mem_ctl : out SinglePortRam_Control;
      mem_data : in std_logic_vector(mem_cfg.canal_n*mem_cfg.data_n-1 downto 0);
      vga_out : out Display_vga_e
      );
  end component display_VGA_memory_read;
  component blk_mem_mire IS
    PORT (
      clka : IN STD_LOGIC;
      wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      addra : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
      );
  END component blk_mem_mire;
component blk_mem_mire_out IS
    PORT (
      clka : IN STD_LOGIC;
      wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      addra : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
      dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
   
      clkb : IN STD_LOGIC;
      enb : IN  STD_LOGIC;
      addrb : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
      doutb : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
      );
  END component blk_mem_mire_out;

  component apply_conv IS
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
  END component apply_conv;

  -- ! Standard VGA setup
  constant VGA_cfg: VGA_config := (
    sync => VGA_sync_640_480_base,
    canal_n => 3
    ); 
  constant  mem_cfg : Video_mem_config :=  (
    image_size => (160, 120),
    factor => (4,4),
    addr_n => 15, -- 15
    data_n => 8, -- 8
    canal_n => 3, -- 3
    data_pad => 0
    );
  
  signal vga_clk  : STD_LOGIC;
  signal vga_mem_ctl :  SinglePortRam_Control;
  signal vga_mem_addr : std_logic_vector(mem_cfg.addr_n-1 downto 0);
  --signal vga_mem_data : std_logic_vector(mem_cfg.canal_n*mem_cfg.data_n-1 downto 0);
  signal vga_mem_data : std_logic_vector(31 downto 0);  
  signal vga_out  : Display_vga_e;

  signal VGA_Bo :  STD_LOGIC_VECTOR ( 7 downto 0 );
  signal VGA_Go :  STD_LOGIC_VECTOR ( 7 downto 0 );
  signal VGA_Ro :  STD_LOGIC_VECTOR ( 7 downto 0 );
  signal swu :  unsigned ( 3 downto 0 );
  
  signal proc_clk : STD_LOGIC;
  
  signal proc_in_mem_we :  STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
  signal proc_in_mem_addr :  STD_LOGIC_VECTOR (15 DOWNTO 0);
  signal proc_in_mem_data_in :  STD_LOGIC_VECTOR (7 DOWNTO 0) := (others => '0');
  signal proc_in_mem_data_out : STD_LOGIC_VECTOR (7 DOWNTO 0);
  signal in_rsc_triosy_lz : STD_LOGIC;
  signal proc_in_re : STD_LOGIC;

  signal proc_out_mem_we : STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal proc_out_mem_addr : STD_LOGIC_VECTOR (16 DOWNTO 0); -- (15 DOWNTO 0)
  --signal proc_out_mem_addr_m : STD_LOGIC_VECTOR (16 DOWNTO 0);
  signal proc_out_mem_data_in : STD_LOGIC_VECTOR (7 DOWNTO 0);
  signal proc_out_mem_data_out : STD_LOGIC_VECTOR (31 DOWNTO 0);
  signal out_rsc_triosy_lz : STD_LOGIC;

begin
    ck : clk_wiz_0 
    port map(
      clk_out1 => vga_clk,
      clk_in1 => pl_clk
      );
-- ICI, ajouter processing HW
-- Regler   
   conv: apply_conv
    PORT map (
         clk => vga_clk,
         rst => '0',
         conv_in_rsc_radr => proc_in_mem_addr,
         conv_in_rsc_re => proc_in_re,
         conv_in_rsc_q => proc_in_mem_data_out,
         conv_in_rsc_triosy_lz => in_rsc_triosy_lz,
         conv_out_rsc_d => proc_out_mem_data_in,
         conv_out_rsc_wadr => proc_out_mem_addr,
         conv_out_rsc_we =>  proc_out_mem_we(0),
         conv_out_rsc_triosy_lz => out_rsc_triosy_lz 
    );
    
  mem_input: blk_mem_mire
    PORT map (
      clka => vga_clk, -- proc_clk
      wea => proc_in_mem_we,
      addra => proc_in_mem_addr,
      dina => proc_in_mem_data_in,
      douta => proc_in_mem_data_out
    );
  mem_output: blk_mem_mire_out
    PORT map (
      clka => vga_clk, -- proc_clk
      wea => proc_out_mem_we,
      addra => proc_out_mem_addr, --proc_out_mem_addr,
      dina => proc_out_mem_data_in,
  
      clkb => vga_clk,
      enb => '1', -- 0
      addrb => vga_mem_addr,
      doutb => vga_mem_data
      );
  
   rd : display_VGA_memory_read 
    generic map (
      vga_cfg => VGA_cfg,
      mem_cfg => mem_cfg    
      )
    port map(
      clk => vga_clk,
      rst => '0',
      mem_ctl => vga_mem_ctl,
      mem_data => vga_mem_data(23 downto 0),  -- RGB pixels
      vga_out => vga_out
      );
  vga_mem_addr <= std_logic_vector(to_unsigned(vga_mem_ctl.addr, mem_cfg.addr_n));

 swu <= unsigned(sw);
 sync_pattern: process(vga_clk)
    variable vga, vga_dbg : Display_vga_e;
  begin
    if rising_edge(vga_clk) then
      vga_io(vga_Ro, vga_Go, vga_Bo, vga_HS, vga_VS,
             vga_dbg);  
      vga_dbg := vga_debug(vga_out, swu);
    end if;
  end process sync_pattern;

  VGA_B <= VGA_Bo(7 downto 3 );
  VGA_G <= VGA_Go( 7 downto 2 );
  VGA_R  <= VGA_Ro( 7 downto 3);
end STRUCTURE;
