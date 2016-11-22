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
static const char *ng0 = "C:/Users/jnwad_000/Documents/School/Project Lab 1/TeamFury/TxUART.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static int ng3[] = {9, 0};
static int ng4[] = {8, 0};



static void Cont_66_0(char *t0)
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

LAB0:    t1 = (t0 + 5424U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 3544);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6352);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
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
    xsi_driver_vfirst_trans(t5, 0, 0);
    t18 = (t0 + 6240);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Always_68_1(char *t0)
{
    char t9[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t10;
    unsigned int t11;
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
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;

LAB0:    t1 = (t0 + 5672U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 6256);
    *((int *)t2) = 1;
    t3 = (t0 + 5704);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(68, ng0);

LAB5:    xsi_set_current_line(70, ng0);
    t4 = (t0 + 3704);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 608);
    t8 = *((char **)t7);
    memset(t9, 0, 8);
    t7 = (t6 + 4);
    t10 = (t8 + 4);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t8);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t7);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = (t13 | t16);
    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t10);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB9;

LAB6:    if (t20 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t9) = 1;

LAB9:    t24 = (t9 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t9);
    t28 = (t27 & t26);
    t29 = (t28 != 0);
    if (t29 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(74, ng0);

LAB20:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 3704);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 32, t4, 13, t5, 32);
    t6 = (t0 + 3704);
    xsi_vlogvar_wait_assign_value(t6, t9, 0, 0, 13, 0LL);

LAB12:    goto LAB2;

LAB8:    t23 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(70, ng0);

LAB13:    xsi_set_current_line(71, ng0);
    t30 = ((char*)((ng1)));
    t31 = (t0 + 3704);
    xsi_vlogvar_wait_assign_value(t31, t30, 0, 0, 13, 0LL);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 3224);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t9, 0, 8);
    t5 = (t4 + 4);
    t11 = *((unsigned int *)t5);
    t12 = (~(t11));
    t13 = *((unsigned int *)t4);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB17;

LAB15:    if (*((unsigned int *)t5) == 0)
        goto LAB14;

LAB16:    t6 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t6) = 1;

LAB17:    t7 = (t9 + 4);
    t8 = (t4 + 4);
    t16 = *((unsigned int *)t4);
    t17 = (~(t16));
    *((unsigned int *)t9) = t17;
    *((unsigned int *)t7) = 0;
    if (*((unsigned int *)t8) != 0)
        goto LAB19;

LAB18:    t22 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t22 & 1U);
    t25 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t25 & 1U);
    t10 = (t0 + 3224);
    xsi_vlogvar_wait_assign_value(t10, t9, 0, 0, 1, 0LL);
    goto LAB12;

LAB14:    *((unsigned int *)t9) = 1;
    goto LAB17;

LAB19:    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t8);
    *((unsigned int *)t9) = (t18 | t19);
    t20 = *((unsigned int *)t7);
    t21 = *((unsigned int *)t8);
    *((unsigned int *)t7) = (t20 | t21);
    goto LAB18;

}

static void Always_80_2(char *t0)
{
    char t18[8];
    char t19[8];
    char t20[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    int t21;
    int t22;
    char *t23;
    int t24;
    int t25;
    int t26;
    unsigned int t27;
    int t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;

LAB0:    t1 = (t0 + 5920U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 6272);
    *((int *)t2) = 1;
    t3 = (t0 + 5952);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(80, ng0);

LAB5:    xsi_set_current_line(81, ng0);
    t4 = (t0 + 2024U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(88, ng0);

LAB10:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 3864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB11:    t5 = (t0 + 744);
    t11 = *((char **)t5);
    t13 = xsi_vlog_unsigned_case_compare(t4, 3, t11, 32);
    if (t13 == 1)
        goto LAB12;

LAB13:    t2 = (t0 + 880);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t4, 3, t3, 32);
    if (t13 == 1)
        goto LAB14;

LAB15:    t2 = (t0 + 1016);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t4, 3, t3, 32);
    if (t13 == 1)
        goto LAB16;

LAB17:
LAB18:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(81, ng0);

LAB9:    xsi_set_current_line(82, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 3384);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 744);
    t3 = *((char **)t2);
    t2 = (t0 + 3864);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 3, 0LL);
    xsi_set_current_line(84, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4184);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 10, 0LL);
    xsi_set_current_line(85, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3544);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(86, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4024);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    goto LAB8;

LAB12:    xsi_set_current_line(90, ng0);

LAB19:    xsi_set_current_line(92, ng0);
    t5 = (t0 + 3384);
    t12 = (t5 + 56U);
    t14 = *((char **)t12);
    t15 = (t14 + 4);
    t6 = *((unsigned int *)t15);
    t7 = (~(t6));
    t8 = *((unsigned int *)t14);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB20;

LAB21:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 2664U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB24;

LAB25:
LAB26:
LAB22:    goto LAB18;

LAB14:    xsi_set_current_line(101, ng0);

LAB28:    xsi_set_current_line(102, ng0);
    t2 = ((char*)((ng1)));
    t5 = (t0 + 3384);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(103, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4184);
    t5 = (t0 + 4184);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng3)));
    xsi_vlog_generic_convert_bit_index(t18, t12, 2, t14, 32, 1);
    t15 = (t18 + 4);
    t6 = *((unsigned int *)t15);
    t13 = (!(t6));
    if (t13 == 1)
        goto LAB29;

LAB30:    xsi_set_current_line(104, ng0);
    t2 = (t0 + 2184U);
    t3 = *((char **)t2);
    t2 = (t0 + 4184);
    t5 = (t0 + 4184);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng4)));
    t15 = ((char*)((ng2)));
    xsi_vlog_convert_partindices(t18, t19, t20, ((int*)(t12)), 2, t14, 32, 1, t15, 32, 1);
    t16 = (t18 + 4);
    t6 = *((unsigned int *)t16);
    t13 = (!(t6));
    t17 = (t19 + 4);
    t7 = *((unsigned int *)t17);
    t21 = (!(t7));
    t22 = (t13 && t21);
    t23 = (t20 + 4);
    t8 = *((unsigned int *)t23);
    t24 = (!(t8));
    t25 = (t22 && t24);
    if (t25 == 1)
        goto LAB31;

LAB32:    xsi_set_current_line(105, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4184);
    t5 = (t0 + 4184);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng1)));
    xsi_vlog_generic_convert_bit_index(t18, t12, 2, t14, 32, 1);
    t15 = (t18 + 4);
    t6 = *((unsigned int *)t15);
    t13 = (!(t6));
    if (t13 == 1)
        goto LAB33;

LAB34:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 1016);
    t3 = *((char **)t2);
    t2 = (t0 + 3864);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 3, 0LL);
    goto LAB18;

LAB16:    xsi_set_current_line(109, ng0);

LAB35:    xsi_set_current_line(110, ng0);
    t2 = (t0 + 4184);
    t5 = (t2 + 56U);
    t11 = *((char **)t5);
    memset(t18, 0, 8);
    t12 = (t18 + 4);
    t14 = (t11 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (t6 >> 0);
    t8 = (t7 & 1);
    *((unsigned int *)t18) = t8;
    t9 = *((unsigned int *)t14);
    t10 = (t9 >> 0);
    t27 = (t10 & 1);
    *((unsigned int *)t12) = t27;
    t15 = (t0 + 3544);
    xsi_vlogvar_wait_assign_value(t15, t18, 0, 0, 1, 0LL);
    xsi_set_current_line(111, ng0);
    t2 = (t0 + 4184);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng2)));
    memset(t18, 0, 8);
    xsi_vlog_unsigned_rshift(t18, 10, t5, 10, t11, 32);
    t12 = (t0 + 4184);
    xsi_vlogvar_wait_assign_value(t12, t18, 0, 0, 10, 0LL);
    xsi_set_current_line(112, ng0);
    t2 = (t0 + 4024);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng2)));
    memset(t18, 0, 8);
    xsi_vlog_unsigned_add(t18, 32, t5, 4, t11, 32);
    t12 = (t0 + 4024);
    xsi_vlogvar_wait_assign_value(t12, t18, 0, 0, 4, 0LL);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 4024);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t0 + 1152);
    t12 = *((char **)t11);
    memset(t18, 0, 8);
    t11 = (t5 + 4);
    t14 = (t12 + 4);
    t6 = *((unsigned int *)t5);
    t7 = *((unsigned int *)t12);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t14);
    t27 = (t9 ^ t10);
    t30 = (t8 | t27);
    t31 = *((unsigned int *)t11);
    t32 = *((unsigned int *)t14);
    t33 = (t31 | t32);
    t34 = (~(t33));
    t35 = (t30 & t34);
    if (t35 != 0)
        goto LAB39;

LAB36:    if (t33 != 0)
        goto LAB38;

LAB37:    *((unsigned int *)t18) = 1;

LAB39:    t16 = (t18 + 4);
    t36 = *((unsigned int *)t16);
    t37 = (~(t36));
    t38 = *((unsigned int *)t18);
    t39 = (t38 & t37);
    t40 = (t39 != 0);
    if (t40 > 0)
        goto LAB40;

LAB41:    xsi_set_current_line(123, ng0);

LAB53:    xsi_set_current_line(124, ng0);
    t2 = (t0 + 4024);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng2)));
    memset(t18, 0, 8);
    xsi_vlog_unsigned_add(t18, 32, t5, 4, t11, 32);
    t12 = (t0 + 4024);
    xsi_vlogvar_wait_assign_value(t12, t18, 0, 0, 4, 0LL);

LAB42:    goto LAB18;

LAB20:    xsi_set_current_line(92, ng0);

LAB23:    xsi_set_current_line(93, ng0);
    t16 = (t0 + 880);
    t17 = *((char **)t16);
    t16 = (t0 + 3864);
    xsi_vlogvar_wait_assign_value(t16, t17, 0, 0, 3, 0LL);
    xsi_set_current_line(94, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3384);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB22;

LAB24:    xsi_set_current_line(96, ng0);

LAB27:    xsi_set_current_line(97, ng0);
    t5 = ((char*)((ng2)));
    t11 = (t0 + 3384);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 1, 0LL);
    goto LAB26;

LAB29:    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t18), 1, 0LL);
    goto LAB30;

LAB31:    t9 = *((unsigned int *)t20);
    t26 = (t9 + 0);
    t10 = *((unsigned int *)t18);
    t27 = *((unsigned int *)t19);
    t28 = (t10 - t27);
    t29 = (t28 + 1);
    xsi_vlogvar_wait_assign_value(t2, t3, t26, *((unsigned int *)t19), t29, 0LL);
    goto LAB32;

LAB33:    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t18), 1, 0LL);
    goto LAB34;

LAB38:    t15 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t15) = 1;
    goto LAB39;

LAB40:    xsi_set_current_line(113, ng0);

LAB43:    xsi_set_current_line(114, ng0);
    t17 = ((char*)((ng1)));
    t23 = (t0 + 4024);
    xsi_vlogvar_wait_assign_value(t23, t17, 0, 0, 4, 0LL);
    xsi_set_current_line(115, ng0);
    t2 = (t0 + 2664U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t18, 0, 8);
    t5 = (t3 + 4);
    t11 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t11);
    t27 = (t9 ^ t10);
    t30 = (t8 | t27);
    t31 = *((unsigned int *)t5);
    t32 = *((unsigned int *)t11);
    t33 = (t31 | t32);
    t34 = (~(t33));
    t35 = (t30 & t34);
    if (t35 != 0)
        goto LAB47;

LAB44:    if (t33 != 0)
        goto LAB46;

LAB45:    *((unsigned int *)t18) = 1;

LAB47:    t14 = (t18 + 4);
    t36 = *((unsigned int *)t14);
    t37 = (~(t36));
    t38 = *((unsigned int *)t18);
    t39 = (t38 & t37);
    t40 = (t39 != 0);
    if (t40 > 0)
        goto LAB48;

LAB49:    xsi_set_current_line(118, ng0);

LAB52:    xsi_set_current_line(119, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3384);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 744);
    t3 = *((char **)t2);
    t2 = (t0 + 3864);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 3, 0LL);

LAB50:    goto LAB42;

LAB46:    t12 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB47;

LAB48:    xsi_set_current_line(115, ng0);

LAB51:    xsi_set_current_line(116, ng0);
    t15 = (t0 + 744);
    t16 = *((char **)t15);
    t15 = (t0 + 3864);
    xsi_vlogvar_wait_assign_value(t15, t16, 0, 0, 3, 0LL);
    goto LAB50;

}


extern void work_m_00000000001179310519_3334352152_init()
{
	static char *pe[] = {(void *)Cont_66_0,(void *)Always_68_1,(void *)Always_80_2};
	xsi_register_didat("work_m_00000000001179310519_3334352152", "isim/TestFixture_isim_beh.exe.sim/work/m_00000000001179310519_3334352152.didat");
	xsi_register_executes(pe);
}
