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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Denton/ownCloud/School/EE/ProjectLab1/Varalog/TeamFury/ToneDetection.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {0, 0};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {1U, 0U};
static int ng5[] = {12500000, 0};
static unsigned int ng6[] = {2U, 0U};
static unsigned int ng7[] = {3U, 0U};
static int ng8[] = {25000000, 0};
static unsigned int ng9[] = {4U, 0U};



static void Cont_69_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 7272U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(69, ng0);
    t2 = (t0 + 4272);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7936);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 7U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 2);
    t18 = (t0 + 7840);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Always_72_1(char *t0)
{
    char t11[8];
    char t33[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t34;

LAB0:    t1 = (t0 + 7520U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 7856);
    *((int *)t2) = 1;
    t3 = (t0 + 7552);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(72, ng0);

LAB5:    xsi_set_current_line(73, ng0);
    t4 = (t0 + 5552);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t7, 2);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng4)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng6)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng7)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t8 == 1)
        goto LAB13;

LAB14:
LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(74, ng0);

LAB16:    xsi_set_current_line(75, ng0);
    t9 = ((char*)((ng2)));
    t10 = (t0 + 4592);
    xsi_vlogvar_wait_assign_value(t10, t9, 0, 0, 32, 0LL);
    xsi_set_current_line(76, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4752);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(77, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4912);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(78, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 5072);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(79, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 5232);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 3232U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t11, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t12 = *((unsigned int *)t3);
    t13 = *((unsigned int *)t2);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t5);
    t17 = (t15 ^ t16);
    t18 = (t14 | t17);
    t19 = *((unsigned int *)t4);
    t20 = *((unsigned int *)t5);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB20;

LAB17:    if (t21 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t11) = 1;

LAB20:    t9 = (t11 + 4);
    t24 = *((unsigned int *)t9);
    t25 = (~(t24));
    t26 = *((unsigned int *)t11);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB21;

LAB22:    xsi_set_current_line(93, ng0);
    t2 = (t0 + 3392U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t11, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t12 = *((unsigned int *)t3);
    t13 = *((unsigned int *)t2);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t5);
    t17 = (t15 ^ t16);
    t18 = (t14 | t17);
    t19 = *((unsigned int *)t4);
    t20 = *((unsigned int *)t5);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB28;

LAB25:    if (t21 != 0)
        goto LAB27;

LAB26:    *((unsigned int *)t11) = 1;

LAB28:    t9 = (t11 + 4);
    t24 = *((unsigned int *)t9);
    t25 = (~(t24));
    t26 = *((unsigned int *)t11);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB29;

LAB30:    xsi_set_current_line(101, ng0);
    t2 = (t0 + 3552U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t11, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t12 = *((unsigned int *)t3);
    t13 = *((unsigned int *)t2);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t5);
    t17 = (t15 ^ t16);
    t18 = (t14 | t17);
    t19 = *((unsigned int *)t4);
    t20 = *((unsigned int *)t5);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB36;

LAB33:    if (t21 != 0)
        goto LAB35;

LAB34:    *((unsigned int *)t11) = 1;

LAB36:    t9 = (t11 + 4);
    t24 = *((unsigned int *)t9);
    t25 = (~(t24));
    t26 = *((unsigned int *)t11);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB37;

LAB38:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 3712U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t11, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t12 = *((unsigned int *)t3);
    t13 = *((unsigned int *)t2);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t5);
    t17 = (t15 ^ t16);
    t18 = (t14 | t17);
    t19 = *((unsigned int *)t4);
    t20 = *((unsigned int *)t5);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB44;

LAB41:    if (t21 != 0)
        goto LAB43;

LAB42:    *((unsigned int *)t11) = 1;

LAB44:    t9 = (t11 + 4);
    t24 = *((unsigned int *)t9);
    t25 = (~(t24));
    t26 = *((unsigned int *)t11);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB45;

LAB46:
LAB47:
LAB39:
LAB31:
LAB23:    goto LAB15;

LAB9:    xsi_set_current_line(118, ng0);

LAB49:    xsi_set_current_line(121, ng0);
    t3 = (t0 + 3232U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng3)));
    memset(t11, 0, 8);
    t5 = (t4 + 4);
    t7 = (t3 + 4);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t3);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t5);
    t16 = *((unsigned int *)t7);
    t17 = (t15 ^ t16);
    t18 = (t14 | t17);
    t19 = *((unsigned int *)t5);
    t20 = *((unsigned int *)t7);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB53;

LAB50:    if (t21 != 0)
        goto LAB52;

LAB51:    *((unsigned int *)t11) = 1;

LAB53:    t10 = (t11 + 4);
    t24 = *((unsigned int *)t10);
    t25 = (~(t24));
    t26 = *((unsigned int *)t11);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB54;

LAB55:    xsi_set_current_line(129, ng0);
    t2 = (t0 + 3392U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t11, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t12 = *((unsigned int *)t3);
    t13 = *((unsigned int *)t2);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t5);
    t17 = (t15 ^ t16);
    t18 = (t14 | t17);
    t19 = *((unsigned int *)t4);
    t20 = *((unsigned int *)t5);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB70;

LAB67:    if (t21 != 0)
        goto LAB69;

LAB68:    *((unsigned int *)t11) = 1;

LAB70:    t9 = (t11 + 4);
    t24 = *((unsigned int *)t9);
    t25 = (~(t24));
    t26 = *((unsigned int *)t11);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB71;

LAB72:    xsi_set_current_line(137, ng0);
    t2 = (t0 + 3552U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t11, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t12 = *((unsigned int *)t3);
    t13 = *((unsigned int *)t2);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t5);
    t17 = (t15 ^ t16);
    t18 = (t14 | t17);
    t19 = *((unsigned int *)t4);
    t20 = *((unsigned int *)t5);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB87;

LAB84:    if (t21 != 0)
        goto LAB86;

LAB85:    *((unsigned int *)t11) = 1;

LAB87:    t9 = (t11 + 4);
    t24 = *((unsigned int *)t9);
    t25 = (~(t24));
    t26 = *((unsigned int *)t11);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB88;

LAB89:    xsi_set_current_line(145, ng0);
    t2 = (t0 + 3712U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t11, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t12 = *((unsigned int *)t3);
    t13 = *((unsigned int *)t2);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t5);
    t17 = (t15 ^ t16);
    t18 = (t14 | t17);
    t19 = *((unsigned int *)t4);
    t20 = *((unsigned int *)t5);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB104;

LAB101:    if (t21 != 0)
        goto LAB103;

LAB102:    *((unsigned int *)t11) = 1;

LAB104:    t9 = (t11 + 4);
    t24 = *((unsigned int *)t9);
    t25 = (~(t24));
    t26 = *((unsigned int *)t11);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB105;

LAB106:    xsi_set_current_line(152, ng0);

LAB118:    xsi_set_current_line(153, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4592);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(154, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4752);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(155, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4912);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(156, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 5072);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(157, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 5232);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(159, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5552);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);

LAB107:
LAB90:
LAB73:
LAB56:    goto LAB15;

LAB11:    xsi_set_current_line(163, ng0);

LAB119:    xsi_set_current_line(164, ng0);
    t3 = (t0 + 5872);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng3)));
    memset(t11, 0, 8);
    t9 = (t5 + 4);
    t10 = (t7 + 4);
    t12 = *((unsigned int *)t5);
    t13 = *((unsigned int *)t7);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t9);
    t16 = *((unsigned int *)t10);
    t17 = (t15 ^ t16);
    t18 = (t14 | t17);
    t19 = *((unsigned int *)t9);
    t20 = *((unsigned int *)t10);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB123;

LAB120:    if (t21 != 0)
        goto LAB122;

LAB121:    *((unsigned int *)t11) = 1;

LAB123:    t30 = (t11 + 4);
    t24 = *((unsigned int *)t30);
    t25 = (~(t24));
    t26 = *((unsigned int *)t11);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB124;

LAB125:    xsi_set_current_line(168, ng0);
    t2 = (t0 + 6032);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t11, 0, 8);
    t7 = (t4 + 4);
    t9 = (t5 + 4);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t7);
    t16 = *((unsigned int *)t9);
    t17 = (t15 ^ t16);
    t18 = (t14 | t17);
    t19 = *((unsigned int *)t7);
    t20 = *((unsigned int *)t9);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB131;

LAB128:    if (t21 != 0)
        goto LAB130;

LAB129:    *((unsigned int *)t11) = 1;

LAB131:    t29 = (t11 + 4);
    t24 = *((unsigned int *)t29);
    t25 = (~(t24));
    t26 = *((unsigned int *)t11);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB132;

LAB133:    xsi_set_current_line(172, ng0);
    t2 = (t0 + 6192);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t11, 0, 8);
    t7 = (t4 + 4);
    t9 = (t5 + 4);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t7);
    t16 = *((unsigned int *)t9);
    t17 = (t15 ^ t16);
    t18 = (t14 | t17);
    t19 = *((unsigned int *)t7);
    t20 = *((unsigned int *)t9);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB139;

LAB136:    if (t21 != 0)
        goto LAB138;

LAB137:    *((unsigned int *)t11) = 1;

LAB139:    t29 = (t11 + 4);
    t24 = *((unsigned int *)t29);
    t25 = (~(t24));
    t26 = *((unsigned int *)t11);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB140;

LAB141:    xsi_set_current_line(176, ng0);

LAB144:    xsi_set_current_line(177, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 4272);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(178, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 5552);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);

LAB142:
LAB134:
LAB126:    goto LAB15;

LAB13:    xsi_set_current_line(182, ng0);

LAB145:    xsi_set_current_line(183, ng0);
    t3 = (t0 + 5392);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng3)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 32, t5, 32, t7, 32);
    t9 = (t0 + 5392);
    xsi_vlogvar_wait_assign_value(t9, t11, 0, 0, 32, 0LL);
    xsi_set_current_line(184, ng0);
    t2 = (t0 + 5392);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng8)));
    memset(t11, 0, 8);
    t7 = (t4 + 4);
    t9 = (t5 + 4);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t7);
    t16 = *((unsigned int *)t9);
    t17 = (t15 ^ t16);
    t18 = (t14 | t17);
    t19 = *((unsigned int *)t7);
    t20 = *((unsigned int *)t9);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB149;

LAB146:    if (t21 != 0)
        goto LAB148;

LAB147:    *((unsigned int *)t11) = 1;

LAB149:    t29 = (t11 + 4);
    t24 = *((unsigned int *)t29);
    t25 = (~(t24));
    t26 = *((unsigned int *)t11);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB150;

LAB151:
LAB152:    goto LAB15;

LAB19:    t7 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB20;

LAB21:    xsi_set_current_line(84, ng0);

LAB24:    xsi_set_current_line(85, ng0);
    t10 = ((char*)((ng4)));
    t29 = (t0 + 5552);
    xsi_vlogvar_wait_assign_value(t29, t10, 0, 0, 2, 0LL);
    goto LAB23;

LAB27:    t7 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB28;

LAB29:    xsi_set_current_line(93, ng0);

LAB32:    xsi_set_current_line(94, ng0);
    t10 = ((char*)((ng4)));
    t29 = (t0 + 5552);
    xsi_vlogvar_wait_assign_value(t29, t10, 0, 0, 2, 0LL);
    goto LAB31;

LAB35:    t7 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB36;

LAB37:    xsi_set_current_line(101, ng0);

LAB40:    xsi_set_current_line(102, ng0);
    t10 = ((char*)((ng4)));
    t29 = (t0 + 5552);
    xsi_vlogvar_wait_assign_value(t29, t10, 0, 0, 2, 0LL);
    goto LAB39;

LAB43:    t7 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB44;

LAB45:    xsi_set_current_line(109, ng0);

LAB48:    xsi_set_current_line(110, ng0);
    t10 = ((char*)((ng4)));
    t29 = (t0 + 5552);
    xsi_vlogvar_wait_assign_value(t29, t10, 0, 0, 2, 0LL);
    goto LAB47;

LAB52:    t9 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB53;

LAB54:    xsi_set_current_line(121, ng0);

LAB57:    xsi_set_current_line(122, ng0);
    t29 = (t0 + 4752);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = ((char*)((ng3)));
    memset(t33, 0, 8);
    xsi_vlog_unsigned_add(t33, 32, t31, 32, t32, 32);
    t34 = (t0 + 4752);
    xsi_vlogvar_wait_assign_value(t34, t33, 0, 0, 32, 0LL);
    xsi_set_current_line(123, ng0);
    t2 = (t0 + 4752);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t11, 0, 8);
    t7 = (t4 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB59;

LAB58:    t9 = (t5 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB59;

LAB62:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB61;

LAB60:    *((unsigned int *)t11) = 1;

LAB61:    t29 = (t11 + 4);
    t12 = *((unsigned int *)t29);
    t13 = (~(t12));
    t14 = *((unsigned int *)t11);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB63;

LAB64:
LAB65:    goto LAB56;

LAB59:    t10 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB61;

LAB63:    xsi_set_current_line(123, ng0);

LAB66:    xsi_set_current_line(124, ng0);
    t30 = ((char*)((ng3)));
    t31 = (t0 + 5872);
    xsi_vlogvar_wait_assign_value(t31, t30, 0, 0, 1, 0LL);
    xsi_set_current_line(125, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 5552);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    goto LAB65;

LAB69:    t7 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB70;

LAB71:    xsi_set_current_line(129, ng0);

LAB74:    xsi_set_current_line(130, ng0);
    t10 = (t0 + 4912);
    t29 = (t10 + 56U);
    t30 = *((char **)t29);
    t31 = ((char*)((ng3)));
    memset(t33, 0, 8);
    xsi_vlog_unsigned_add(t33, 32, t30, 32, t31, 32);
    t32 = (t0 + 4912);
    xsi_vlogvar_wait_assign_value(t32, t33, 0, 0, 32, 0LL);
    xsi_set_current_line(131, ng0);
    t2 = (t0 + 4912);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t11, 0, 8);
    t7 = (t4 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB76;

LAB75:    t9 = (t5 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB76;

LAB79:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB78;

LAB77:    *((unsigned int *)t11) = 1;

LAB78:    t29 = (t11 + 4);
    t12 = *((unsigned int *)t29);
    t13 = (~(t12));
    t14 = *((unsigned int *)t11);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB80;

LAB81:
LAB82:    goto LAB73;

LAB76:    t10 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB78;

LAB80:    xsi_set_current_line(131, ng0);

LAB83:    xsi_set_current_line(132, ng0);
    t30 = ((char*)((ng3)));
    t31 = (t0 + 6032);
    xsi_vlogvar_wait_assign_value(t31, t30, 0, 0, 1, 0LL);
    xsi_set_current_line(133, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 5552);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    goto LAB82;

LAB86:    t7 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB87;

LAB88:    xsi_set_current_line(137, ng0);

LAB91:    xsi_set_current_line(138, ng0);
    t10 = (t0 + 5072);
    t29 = (t10 + 56U);
    t30 = *((char **)t29);
    t31 = ((char*)((ng3)));
    memset(t33, 0, 8);
    xsi_vlog_unsigned_add(t33, 32, t30, 32, t31, 32);
    t32 = (t0 + 5072);
    xsi_vlogvar_wait_assign_value(t32, t33, 0, 0, 32, 0LL);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 5072);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t11, 0, 8);
    t7 = (t4 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB93;

LAB92:    t9 = (t5 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB93;

LAB96:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB95;

LAB94:    *((unsigned int *)t11) = 1;

LAB95:    t29 = (t11 + 4);
    t12 = *((unsigned int *)t29);
    t13 = (~(t12));
    t14 = *((unsigned int *)t11);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB97;

LAB98:
LAB99:    goto LAB90;

LAB93:    t10 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB95;

LAB97:    xsi_set_current_line(139, ng0);

LAB100:    xsi_set_current_line(140, ng0);
    t30 = ((char*)((ng3)));
    t31 = (t0 + 6192);
    xsi_vlogvar_wait_assign_value(t31, t30, 0, 0, 1, 0LL);
    xsi_set_current_line(141, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 5552);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    goto LAB99;

LAB103:    t7 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB104;

LAB105:    xsi_set_current_line(145, ng0);

LAB108:    xsi_set_current_line(146, ng0);
    t10 = (t0 + 5232);
    t29 = (t10 + 56U);
    t30 = *((char **)t29);
    t31 = ((char*)((ng3)));
    memset(t33, 0, 8);
    xsi_vlog_unsigned_add(t33, 32, t30, 32, t31, 32);
    t32 = (t0 + 5232);
    xsi_vlogvar_wait_assign_value(t32, t33, 0, 0, 32, 0LL);
    xsi_set_current_line(147, ng0);
    t2 = (t0 + 5232);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t11, 0, 8);
    t7 = (t4 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB110;

LAB109:    t9 = (t5 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB110;

LAB113:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB112;

LAB111:    *((unsigned int *)t11) = 1;

LAB112:    t29 = (t11 + 4);
    t12 = *((unsigned int *)t29);
    t13 = (~(t12));
    t14 = *((unsigned int *)t11);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB114;

LAB115:
LAB116:    goto LAB107;

LAB110:    t10 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB112;

LAB114:    xsi_set_current_line(147, ng0);

LAB117:    xsi_set_current_line(148, ng0);
    t30 = ((char*)((ng3)));
    t31 = (t0 + 6352);
    xsi_vlogvar_wait_assign_value(t31, t30, 0, 0, 1, 0LL);
    xsi_set_current_line(149, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 5552);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    goto LAB116;

LAB122:    t29 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB123;

LAB124:    xsi_set_current_line(164, ng0);

LAB127:    xsi_set_current_line(165, ng0);
    t31 = ((char*)((ng1)));
    t32 = (t0 + 4272);
    xsi_vlogvar_wait_assign_value(t32, t31, 0, 0, 3, 0LL);
    xsi_set_current_line(166, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 5552);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    goto LAB126;

LAB130:    t10 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB131;

LAB132:    xsi_set_current_line(168, ng0);

LAB135:    xsi_set_current_line(169, ng0);
    t30 = ((char*)((ng4)));
    t31 = (t0 + 4272);
    xsi_vlogvar_wait_assign_value(t31, t30, 0, 0, 3, 0LL);
    xsi_set_current_line(170, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 5552);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    goto LAB134;

LAB138:    t10 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB139;

LAB140:    xsi_set_current_line(172, ng0);

LAB143:    xsi_set_current_line(173, ng0);
    t30 = ((char*)((ng6)));
    t31 = (t0 + 4272);
    xsi_vlogvar_wait_assign_value(t31, t30, 0, 0, 3, 0LL);
    xsi_set_current_line(174, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 5552);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    goto LAB142;

LAB148:    t10 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB149;

LAB150:    xsi_set_current_line(184, ng0);

LAB153:    xsi_set_current_line(185, ng0);
    t30 = ((char*)((ng9)));
    t31 = (t0 + 4272);
    xsi_vlogvar_wait_assign_value(t31, t30, 0, 0, 3, 0LL);
    xsi_set_current_line(186, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5552);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(187, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 5872);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(188, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6032);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(189, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6192);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(190, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6352);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(191, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 5392);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    goto LAB152;

}


extern void work_m_00000000000539240572_2407062305_init()
{
	static char *pe[] = {(void *)Cont_69_0,(void *)Always_72_1};
	xsi_register_didat("work_m_00000000000539240572_2407062305", "isim/TestFixture_isim_beh.exe.sim/work/m_00000000000539240572_2407062305.didat");
	xsi_register_executes(pe);
}
