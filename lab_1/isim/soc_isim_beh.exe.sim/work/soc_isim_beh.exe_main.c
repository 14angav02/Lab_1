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
    work_m_00000000004095922733_2511408442_init();
    work_m_00000000002996917082_3712834111_init();
    work_m_00000000003713385367_3258266500_init();
    work_m_00000000003373745115_3505899711_init();
    work_m_00000000000973766991_3335238582_init();
    work_m_00000000001795331690_1647259610_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001795331690_1647259610");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
