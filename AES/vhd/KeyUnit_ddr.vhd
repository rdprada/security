------------------------------------------------------
			-- next_key(127 downto 96) = Subword(RotWord(prev_key(32 downto 0)) XOR rcon
			-- next_key(95 downto 64) = prev_key(95 downto 64) XOR next_key(127 downto 96)
			-- next_key(63 downto 32) = prev_key(63 downto 32) XOR next_key(95 downto 64)
			-- next_key(31 downto 0) = prev_key(31 downto 0) XOR next_key(63 downto 32)

library IEEE;
    use IEEE.std_logic_1164.all;
library WORK;
   use WORK.globals.all;

entity keyunit is port (
  key_in : in std_logic_vector (127 downto 0);
  in_ready : in T_READY;
  load_key : in std_logic;
  advance_key : in T_ENABLE; -- store the next round key
  reset_key : in T_ENABLE; -- rewind the first round key 
  save_key : in T_ENABLE; -- checkpoint: saved key for later rewind
  ctrl_dec : in T_ENCDEC;
  next_rcon : in T_ENABLE; -- next_step for RCon constant
  reset, clk : in std_logic;
  data_to_sbox : out std_logic_vector (31 downto 0); -- data to DU's Sboxes
  data_from_sbox: in std_logic_vector (31 downto 0); --- data from DU's Sboxes
  key_out : out std_logic_vector (127 downto 0) ); -- ROUND KEY
  end keyunit;

architecture a_keyunit of keyunit is
  component rcon port (
    next_value : in T_ENABLE;
    ctrl_dec : in T_ENCDEC;
    reset, clock : in std_logic;
    rcon_byte : out std_logic_vector (7 downto 0);
    reset_key: in T_ENABLE ;
    last_key : in T_ENABLE);
    end component;
  signal regs_out, next_key, s_1st_round_key : std_logic_vector( 127 downto 0 );
  signal rcon_in, rcon_out : std_logic_vector( 31 downto 0 );
  signal RCon_byte : std_logic_vector( 7 downto 0 );
begin    
  key_out <= regs_out;

  rcon_in <= data_from_sbox; -- data coming from the SBoxes in the DataUnit
  RCon_inst : RCon port map ( next_RCon, ctrl_dec, reset, clk, RCon_byte, reset_key, save_key  );
  rcon_out <= rcon_in xor ( RCon_byte & X"000000");
  next_key( 127 downto 96 ) <= regs_out( 127 downto 96 ) xor rcon_out;
    
  save_key_proc : process( reset, clk )
  begin
    if ( reset=RESET_ACTIVE ) then  
      s_1st_round_key <= ( others=>'0');
    elsif ( clk'event and clk='1' ) then
      if ( save_key=C_ENABLE ) then
        s_1st_round_key <= regs_out; 
        end if;  -- save_key
      end if; -- reset, clock
    end process save_key_proc;
  
  key_reg_pr : process( reset, clk )
  begin
    if ( reset=RESET_ACTIVE ) then  
      regs_out <= ( others=>'0' );
    elsif ( clk'event and clk='1' ) then -- not reset, hence if clock 
      if ( advance_key/=C_DISABLE ) then 
        regs_out <= next_key;
      elsif ( in_ready=C_READY ) then	-- device ready for loading
        if ( load_key='1' ) then	-- valid key
          regs_out <= key_in;
          end if; -- load_key
      -- device busy computing
      elsif ( reset_key=C_ENABLE ) then -- rewinding key
        regs_out <= s_1st_round_key;
        end if; -- in_ready, reset_key, advance_key
      end if; -- reset, clock
    end process;

  g002e : if ( not C_INCLUDE_DECODING_LOGIC ) generate 
    data_to_sbox <= ( regs_out( 23 downto 0 ) & regs_out( 31 downto 24 ) );
    next_key(  95 downto 64 ) <= regs_out(  95 downto 64 ) xor next_key( 127 downto 96 );
    next_key(  63 downto 32 ) <= regs_out(  63 downto 32 ) xor next_key(  95 downto 64 );
    next_key(  31 downto  0 ) <= regs_out(  31 downto  0 ) xor next_key(  63 downto 32 );
    end generate; -- not C_INCLUDE_DECODING_LOGIC
   
  g002d : if ( C_INCLUDE_DECODING_LOGIC ) generate 
    data_to_sbox <= ( regs_out( 23 downto 0 ) & regs_out( 31 downto 24 ) ) when ( ctrl_dec = C_ENC ) 
      else ( next_key( 23 downto 0 ) & next_key( 31 downto 24 ) ); 
    next_key(  95 downto 64 ) <= ( regs_out(  95 downto 64 ) xor next_key( 127 downto 96 ) ) when ( ctrl_dec=C_ENC ) 
      else ( regs_out(  95 downto 64 ) xor regs_out( 127 downto 96 ) );
    next_key(  63 downto 32 ) <= ( regs_out(  63 downto 32 ) xor next_key(  95 downto 64 ) ) when ( ctrl_dec=C_ENC ) 
      else ( regs_out(  63 downto 32 ) xor regs_out(  95 downto 64 ) );
    next_key(  31 downto  0 ) <= ( regs_out(  31 downto  0 ) xor next_key(  63 downto 32 ) ) when ( ctrl_dec=C_ENC ) 
      else ( regs_out(  31 downto  0 ) xor regs_out(  63 downto 32 ) );
    end generate; -- C_INCLUDE_DECODING_LOGIC
  end a_keyunit;
