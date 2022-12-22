
  #include "73x_map.h"

/* Functions Prototypes-------------------------------------------------------*/
void Delay(u32 Xtime);

/* Variables------------------------------------------------------------------*/

/*----------------------------------------------------------------------------*/
/*---------------------------------main---------------------------------------*/
/*----------------------------------------------------------------------------*/
void main()
{
  int bouton0 = 0;
  int chenillard = 0x0001;
  /* GPIO4 Clcok Enable */
  CFG->PCGR0 |= 0x00140000;
  /* GPIO0 Configuration in Push-Pull output */
  GPIO0->PC0 = 0xFFFF;
  GPIO0->PC1 = 0x0000;
  GPIO0->PC2 = 0xFFFF;
  GPIO0->PD  = 0x0000;

   /* GPIO2 Configuration in Push-Pull intput */
  GPIO2->PC0 = 0xFFFF;
  GPIO2->PC1 = 0x0000;
  GPIO2->PC2 = 0x0000;
  GPIO2->PD  = 0x0000;


  while (1)
  {
    bouton0 = ((GPIO2->PD & 0x0400) == 0x0400);
    if(bouton0 == 1)
    {
        chenillard = (chenillard >> 1 | chenillard << 15) & 0xffff;
        GPIO0->PD = chenillard;
        Delay(69000);

    }
    else
    {
        chenillard = (chenillard << 1 | chenillard >> 15) & 0xffff;
        GPIO0->PD = chenillard;
        Delay(69000);
    }
  }


}

/* Private functions ---------------------------------------------------------*/

/*******************************************************************************
Function name : void Delay(u32 Xtime)
Description   : Add a dealy
Input param   : u32 Xtime
Output param  : None
*******************************************************************************/
void Delay(u32 Xtime)
{
  u32 j;

  for(j=Xtime;j!=0;j--);
}

