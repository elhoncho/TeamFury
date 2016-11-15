/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000003200922173_4119678636_init();
    work_m_00000000004055579883_2771536710_init();
    work_m_00000000000539240572_2407062305_init();
    work_m_00000000001179310519_3334352152_init();
    xilinxcorelib_ver_m_00000000000200492576_0710032684_init();
    xilinxcorelib_ver_m_00000000000754301097_1316695880_init();
    xilinxcorelib_ver_m_00000000001159543956_0657262104_init();
    xilinxcorelib_ver_m_00000000001291582275_2501796371_init();
    work_m_00000000003420487832_2228339529_init();
    work_m_00000000003180242623_2308961611_init();
    work_m_00000000002438594085_1787306144_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002438594085_1787306144");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
