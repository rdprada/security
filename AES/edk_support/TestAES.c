#include "xparameters.h"
#include "stdio.h"
#include "xbasic_types.h"
#include "xio.h"

// from xparameters
// #define XPAR_AES_DDR_0_BASEADDR .....


// Test cases
#define PLAIN_1_HI   0x3243f6a8
#define PLAIN_1_MH   0x885a308d
#define PLAIN_1_ML   0x313198a2
#define PLAIN_1_LO   0xe0370734
#define IVIN_1_HI    0x00000000
#define IVIN_1_MH    0x00000000
#define IVIN_1_ML    0x00000000
#define IVIN_1_LO    0x00000000
#define KEYIN_1_HI   0x2b7e1516
#define KEYIN_1_MH   0x28aed2a6
#define KEYIN_1_ML   0xabf71588
#define KEYIN_1_LO   0x09cf4f3c
#define CRYPT_1_HI   0x3925841d
#define CRYPT_1_MH   0x02dc09fb
#define CRYPT_1_ML   0xdc118597
#define CRYPT_1_LO   0x196a0b32


//  signal slv_reg0                       : std_logic_vector(0 to C_SLV_DWIDTH-1); -- commands
//  signal slv_reg1                       : std_logic_vector(0 to C_SLV_DWIDTH-1); -- din LSW
//  signal slv_reg2                       : std_logic_vector(0 to C_SLV_DWIDTH-1); -- din 1
//  signal slv_reg3                       : std_logic_vector(0 to C_SLV_DWIDTH-1); -- din 2
//  signal slv_reg4                       : std_logic_vector(0 to C_SLV_DWIDTH-1); -- din MSW
//  signal slv_reg5                       : std_logic_vector(0 to C_SLV_DWIDTH-1); -- key LSW
//  signal slv_reg6                       : std_logic_vector(0 to C_SLV_DWIDTH-1); -- key 1
//  signal slv_reg7                       : std_logic_vector(0 to C_SLV_DWIDTH-1); -- key 2
//  signal slv_reg8                       : std_logic_vector(0 to C_SLV_DWIDTH-1); -- key MSW
//  signal slv_reg9                       : std_logic_vector(0 to C_SLV_DWIDTH-1); -- dout LSW
//  signal slv_reg10                      : std_logic_vector(0 to C_SLV_DWIDTH-1); -- dout 1
//  signal slv_reg11                      : std_logic_vector(0 to C_SLV_DWIDTH-1); -- dout 2
//  signal slv_reg12                      : std_logic_vector(0 to C_SLV_DWIDTH-1); -- dout MSW
//  signal slv_reg13                      : std_logic_vector(0 to C_SLV_DWIDTH-1); -- out state


void WriteSlaveReg( Xuint32 reg_idx, Xuint32 data )
{
  XIo_Out32( (void*) XPAR_AES_DDR_0_BASEADDR+0x4*reg_idx, data );
}



void ReadSlaveReg( Xuint32 reg_idx, Xuint32 * data )
{
  *data = XIo_In32( (void*) XPAR_AES_DDR_0_BASEADDR+0x4*reg_idx );
}

int main()
{
  WriteSlaveReg( 0, 0 );

  WriteSlaveReg( 1, PLAIN_1_LO );  WriteSlaveReg( 2, PLAIN_1_ML );   WriteSlaveReg( 3, PLAIN_1_MH );   WriteSlaveReg( 4, PLAIN_1_HI ); 
  WriteSlaveReg( 5, KEYIN_1_LO );  WriteSlaveReg( 6, KEYIN_1_ML );   WriteSlaveReg( 7, KEYIN_1_MH );   WriteSlaveReg( 8, KEYIN_1_HI ); 
  WriteSlaveReg( 0, 0x40000000 );
  WriteSlaveReg( 0, 0 );
  WriteSlaveReg( 0, 0x80000000 );
  WriteSlaveReg( 0, 0 );
  
}



