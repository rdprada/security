-- Library Declaration
library IEEE;
    use IEEE.std_logic_1164.all;
library WORK;
    use WORK.globals.all;

-- Component Declaration
entity sbox is port (
    b_in : in std_logic_vector (7 downto 0);
    ctrl_dec : T_ENCDEC;
    clock, reset : in std_logic;
    b_out : out std_logic_vector (7 downto 0)   );
    end sbox;

-- Architecture of the Component
architecture a_sbox of sbox is
  component DDR_register is
    generic( SIZE : integer := 8 );
    port( 
      din_hi, din_lo : in std_logic_vector( SIZE-1 downto 0 ); --  
      dout_hi, dout_lo : out std_logic_vector( SIZE-1 downto 0 ); 
      rst, clk : in std_logic );
    end component;
  component aff_trans port (
    a : in std_logic_vector (7 downto 0);
    b_out : out std_logic_vector (7 downto 0)    );
    end component;
  component aff_trans_inv port (
    a : in std_logic_vector (7 downto 0);
    b_out : out std_logic_vector (7 downto 0)    );
    end component;
  component gfmap port (
    a : in std_logic_vector (7 downto 0);
    ah, al : out std_logic_vector (3 downto 0));
    end component;
  component quadrato port (
    a : in std_logic_vector (3 downto 0);
    d : out std_logic_vector (3 downto 0));
    end component;
  component x_e is port (
    a : in std_logic_vector (3 downto 0);
    d : out std_logic_vector (3 downto 0) );
    end component;
  component gf_molt is port (
    a, b: in std_logic_vector (3 downto 0);
    d : out std_logic_vector (3 downto 0));
    end component;
  component gf_inv is port (
    a_in : std_logic_vector (3 downto 0);
    d : out std_logic_vector (3 downto 0));
    end component;
  component gfmapinv is port (
    ah, al : in std_logic_vector (3 downto 0);
    a : out std_logic_vector (7 downto 0)    );
    end component;
   -- Internal Signal (4 std_logic)
   signal ah, a1h, al, a1l, o, n, m, l, i, g, f,  
          p, p_hi, p_lo, q, d, d_hi, d_lo, r, r_hi, r_lo : std_logic_vector (3 downto 0);
   -- Internal Signal (8 bit)
   signal s, t, v, z : std_logic_vector (7 downto 0);
   signal s_enc_buffer : T_ENCDEC;
begin
    
    -- Affine Trasnformation
    gen000e : if ( not C_INCLUDE_DECODING_LOGIC ) generate
      v <= b_in;
      end generate;
    gen000d : if ( C_INCLUDE_DECODING_LOGIC ) generate
      ati:aff_trans_inv port map (b_in, s);
      v <= s when (ctrl_dec = C_DEC) else b_in;
      end generate;

    -- Map
    mp:gfmap port map (v, ah, al);

    -- First Square
    qua1:quadrato port map (ah, o);

    -- Second Square
    qua2:quadrato port map (al, n);

    -- X [e]
    xe:x_e port map (o, m);

    -- First Moltiplicator
    molt1:gf_molt port map (ah, al, l);

    f <= ah xor al;
    i <= m xor n;
    g <= i xor l;

    -- Inverter
    --inv:gf_inv port map (q, d);
    inv:gf_inv port map (g, q);

    temp_reg_p : DDR_register generic map ( SIZE=>4 ) 
                              port map( din_hi=>ah, din_lo=>ah, --dout=>p, 
                                        dout_hi=>p_hi, dout_lo=>p_lo,
                                        rst=>reset, clk=>clock );
    p <= p_hi when ( clock = '1' ) else p_lo;
    --temp_reg_q : DDR_register generic map ( SIZE=>4 ) port map(  g, q, reset, clock );
    temp_reg_q : DDR_register generic map ( SIZE=>4 ) 
                              port map( din_hi=>q, din_lo=>q, --dout=>d, 
                                        dout_hi=>d_hi, dout_lo=>d_lo,
                                        rst=>reset, clk=>clock );
    d <= d_hi when ( clock = '1' ) else d_lo;
    temp_reg_r : DDR_register generic map ( SIZE=>4 ) 
                              port map( din_hi=>f, din_lo=>f, --dout=>r, 
                                        dout_hi=>r_hi, dout_lo=>r_lo,
                                        rst=>reset, clk=>clock );
    r <= r_hi when ( clock = '1' ) else r_lo;
    
    gen002e : if ( not C_INCLUDE_DECODING_LOGIC ) generate
      s_enc_buffer <= C_ENC;
      end generate; -- gen002e : if ( not C_INCLUDE_DECODING_LOGIC ) 
    gen002d : if ( C_INCLUDE_DECODING_LOGIC ) generate
      S_ENC_PROC : process( reset, clock )
      begin
        if ( reset=RESET_ACTIVE ) then
          s_enc_buffer <= C_ENC;
        elsif ( clock'event and clock='1' ) then
          s_enc_buffer <= ctrl_dec;
          end if;
        end process S_ENC_PROC;
      end generate; -- gen002d : if ( C_INCLUDE_DECODING_LOGIC ) 
    
    -- Second Moltiplicator
    molt2:gf_molt port map (p, d, a1h);

    -- Third Moltiplicator
    molt3:gf_molt port map (d, r, a1l);

    -- Inverse Map
    mapinv:gfmapinv port map (a1h, a1l, z);

    -- Inverse Affine Transformation
    at:aff_trans port map (z, t);
   
    gen001e : if ( not C_INCLUDE_DECODING_LOGIC ) generate
      b_out <= t;
      end generate;
    gen001d : if ( C_INCLUDE_DECODING_LOGIC ) generate
      b_out <= z when ( s_enc_buffer=C_DEC ) else t;
      end generate;
  end a_sbox;
