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
static const char *ng0 = "C:/Users/jnwad_000/Documents/School/Project Lab 1/TeamFury/DirectionControl.v";
static unsigned int ng1[] = {15U, 0U};
static int ng2[] = {0, 0};
static int ng3[] = {1, 0};
static int ng4[] = {2, 0};
static int ng5[] = {3, 0};
static int ng6[] = {4, 0};
static int ng7[] = {5, 0};
static unsigned int ng8[] = {1U, 0U};
static unsigned int ng9[] = {0U, 0U};
static unsigned int ng10[] = {2U, 0U};
static unsigned int ng11[] = {3U, 0U};
static unsigned int ng12[] = {10U, 0U};
static unsigned int ng13[] = {6U, 0U};
static unsigned int ng14[] = {7U, 0U};
static unsigned int ng15[] = {11U, 0U};



static void Initial_53_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(53, ng0);

LAB2:    xsi_set_current_line(54, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 4744);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 4);

LAB1:    return;
}

static void Always_57_1(char *t0)
{
    char t8[8];
    char t22[8];
    char t43[8];
    char t55[8];
    char t71[8];
    char t88[8];
    char t104[8];
    char t112[8];
    char t148[8];
    char t149[8];
    char t187[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t9;
    unsigned int t10;
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
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    unsigned int t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    char *t56;
    char *t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    char *t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t78;
    char *t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;
    char *t85;
    char *t86;
    char *t87;
    char *t89;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;
    char *t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    char *t111;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    char *t116;
    char *t117;
    char *t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    unsigned int t124;
    unsigned int t125;
    char *t126;
    char *t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    int t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    int t135;
    unsigned int t136;
    unsigned int t137;
    unsigned int t138;
    unsigned int t139;
    char *t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    unsigned int t145;
    char *t146;
    char *t147;
    unsigned int t150;
    unsigned int t151;
    unsigned int t152;
    unsigned int t153;
    unsigned int t154;
    unsigned int t155;
    unsigned int t156;
    unsigned int t157;
    unsigned int t158;
    unsigned int t159;
    char *t160;
    unsigned int t161;
    unsigned int t162;
    unsigned int t163;
    unsigned int t164;
    unsigned int t165;
    unsigned int t166;
    unsigned int t167;
    unsigned int t168;
    int t169;
    unsigned int t170;
    unsigned int t171;
    unsigned int t172;
    unsigned int t173;
    unsigned int t174;
    unsigned int t175;
    char *t176;
    unsigned int t177;
    unsigned int t178;
    unsigned int t179;
    unsigned int t180;
    unsigned int t181;
    char *t182;
    char *t183;
    char *t184;
    char *t185;
    char *t186;
    char *t188;

LAB0:    t1 = (t0 + 7512U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 7832);
    *((int *)t2) = 1;
    t3 = (t0 + 7544);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(57, ng0);

LAB5:    xsi_set_current_line(60, ng0);
    t4 = (t0 + 5384);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 5704);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 6, 0LL);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 5544);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5384);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 6, 0LL);
    xsi_set_current_line(62, ng0);
    t2 = (t0 + 5224);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5544);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 6, 0LL);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 4184U);
    t3 = *((char **)t2);
    memset(t8, 0, 8);
    t2 = (t3 + 4);
    t9 = *((unsigned int *)t2);
    t10 = (~(t9));
    t11 = *((unsigned int *)t3);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t2) == 0)
        goto LAB6;

LAB8:    t4 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t4) = 1;

LAB9:    t5 = (t8 + 4);
    t6 = (t3 + 4);
    t14 = *((unsigned int *)t3);
    t15 = (~(t14));
    *((unsigned int *)t8) = t15;
    *((unsigned int *)t5) = 0;
    if (*((unsigned int *)t6) != 0)
        goto LAB11;

LAB10:    t20 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t20 & 1U);
    t21 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t21 & 1U);
    t7 = (t0 + 5224);
    t23 = (t0 + 5224);
    t24 = (t23 + 72U);
    t25 = *((char **)t24);
    t26 = ((char*)((ng2)));
    xsi_vlog_generic_convert_bit_index(t22, t25, 2, t26, 32, 1);
    t27 = (t22 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (!(t28));
    if (t29 == 1)
        goto LAB12;

LAB13:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 3544U);
    t3 = *((char **)t2);
    memset(t8, 0, 8);
    t2 = (t3 + 4);
    t9 = *((unsigned int *)t2);
    t10 = (~(t9));
    t11 = *((unsigned int *)t3);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB17;

LAB15:    if (*((unsigned int *)t2) == 0)
        goto LAB14;

LAB16:    t4 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t4) = 1;

LAB17:    t5 = (t8 + 4);
    t6 = (t3 + 4);
    t14 = *((unsigned int *)t3);
    t15 = (~(t14));
    *((unsigned int *)t8) = t15;
    *((unsigned int *)t5) = 0;
    if (*((unsigned int *)t6) != 0)
        goto LAB19;

LAB18:    t20 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t20 & 1U);
    t21 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t21 & 1U);
    t7 = (t0 + 5224);
    t23 = (t0 + 5224);
    t24 = (t23 + 72U);
    t25 = *((char **)t24);
    t26 = ((char*)((ng3)));
    xsi_vlog_generic_convert_bit_index(t22, t25, 2, t26, 32, 1);
    t27 = (t22 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (!(t28));
    if (t29 == 1)
        goto LAB20;

LAB21:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 3864U);
    t3 = *((char **)t2);
    memset(t8, 0, 8);
    t2 = (t3 + 4);
    t9 = *((unsigned int *)t2);
    t10 = (~(t9));
    t11 = *((unsigned int *)t3);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB25;

LAB23:    if (*((unsigned int *)t2) == 0)
        goto LAB22;

LAB24:    t4 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t4) = 1;

LAB25:    t5 = (t8 + 4);
    t6 = (t3 + 4);
    t14 = *((unsigned int *)t3);
    t15 = (~(t14));
    *((unsigned int *)t8) = t15;
    *((unsigned int *)t5) = 0;
    if (*((unsigned int *)t6) != 0)
        goto LAB27;

LAB26:    t20 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t20 & 1U);
    t21 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t21 & 1U);
    t7 = (t0 + 5224);
    t23 = (t0 + 5224);
    t24 = (t23 + 72U);
    t25 = *((char **)t24);
    t26 = ((char*)((ng4)));
    xsi_vlog_generic_convert_bit_index(t22, t25, 2, t26, 32, 1);
    t27 = (t22 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (!(t28));
    if (t29 == 1)
        goto LAB28;

LAB29:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 3704U);
    t3 = *((char **)t2);
    memset(t8, 0, 8);
    t2 = (t3 + 4);
    t9 = *((unsigned int *)t2);
    t10 = (~(t9));
    t11 = *((unsigned int *)t3);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB33;

LAB31:    if (*((unsigned int *)t2) == 0)
        goto LAB30;

LAB32:    t4 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t4) = 1;

LAB33:    t5 = (t8 + 4);
    t6 = (t3 + 4);
    t14 = *((unsigned int *)t3);
    t15 = (~(t14));
    *((unsigned int *)t8) = t15;
    *((unsigned int *)t5) = 0;
    if (*((unsigned int *)t6) != 0)
        goto LAB35;

LAB34:    t20 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t20 & 1U);
    t21 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t21 & 1U);
    t7 = (t0 + 5224);
    t23 = (t0 + 5224);
    t24 = (t23 + 72U);
    t25 = *((char **)t24);
    t26 = ((char*)((ng5)));
    xsi_vlog_generic_convert_bit_index(t22, t25, 2, t26, 32, 1);
    t27 = (t22 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (!(t28));
    if (t29 == 1)
        goto LAB36;

LAB37:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 4024U);
    t3 = *((char **)t2);
    memset(t8, 0, 8);
    t2 = (t3 + 4);
    t9 = *((unsigned int *)t2);
    t10 = (~(t9));
    t11 = *((unsigned int *)t3);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB41;

LAB39:    if (*((unsigned int *)t2) == 0)
        goto LAB38;

LAB40:    t4 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t4) = 1;

LAB41:    t5 = (t8 + 4);
    t6 = (t3 + 4);
    t14 = *((unsigned int *)t3);
    t15 = (~(t14));
    *((unsigned int *)t8) = t15;
    *((unsigned int *)t5) = 0;
    if (*((unsigned int *)t6) != 0)
        goto LAB43;

LAB42:    t20 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t20 & 1U);
    t21 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t21 & 1U);
    t7 = (t0 + 5224);
    t23 = (t0 + 5224);
    t24 = (t23 + 72U);
    t25 = *((char **)t24);
    t26 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t22, t25, 2, t26, 32, 1);
    t27 = (t22 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (!(t28));
    if (t29 == 1)
        goto LAB44;

LAB45:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 3384U);
    t3 = *((char **)t2);
    memset(t8, 0, 8);
    t2 = (t3 + 4);
    t9 = *((unsigned int *)t2);
    t10 = (~(t9));
    t11 = *((unsigned int *)t3);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB49;

LAB47:    if (*((unsigned int *)t2) == 0)
        goto LAB46;

LAB48:    t4 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t4) = 1;

LAB49:    t5 = (t8 + 4);
    t6 = (t3 + 4);
    t14 = *((unsigned int *)t3);
    t15 = (~(t14));
    *((unsigned int *)t8) = t15;
    *((unsigned int *)t5) = 0;
    if (*((unsigned int *)t6) != 0)
        goto LAB51;

LAB50:    t20 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t20 & 1U);
    t21 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t21 & 1U);
    t7 = (t0 + 5224);
    t23 = (t0 + 5224);
    t24 = (t23 + 72U);
    t25 = *((char **)t24);
    t26 = ((char*)((ng7)));
    xsi_vlog_generic_convert_bit_index(t22, t25, 2, t26, 32, 1);
    t27 = (t22 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (!(t28));
    if (t29 == 1)
        goto LAB52;

LAB53:    xsi_set_current_line(71, ng0);
    t2 = (t0 + 4344U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng8)));
    memset(t8, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB57;

LAB54:    if (t18 != 0)
        goto LAB56;

LAB55:    *((unsigned int *)t8) = 1;

LAB57:    t7 = (t8 + 4);
    t21 = *((unsigned int *)t7);
    t28 = (~(t21));
    t30 = *((unsigned int *)t8);
    t31 = (t30 & t28);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB58;

LAB59:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 4344U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng9)));
    memset(t8, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB65;

LAB62:    if (t18 != 0)
        goto LAB64;

LAB63:    *((unsigned int *)t8) = 1;

LAB65:    t7 = (t8 + 4);
    t21 = *((unsigned int *)t7);
    t28 = (~(t21));
    t30 = *((unsigned int *)t8);
    t31 = (t30 & t28);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB66;

LAB67:
LAB68:
LAB60:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 6024);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB70:    t5 = ((char*)((ng9)));
    t29 = xsi_vlog_unsigned_case_compare(t4, 2, t5, 2);
    if (t29 == 1)
        goto LAB71;

LAB72:    t2 = ((char*)((ng8)));
    t29 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t29 == 1)
        goto LAB73;

LAB74:    t2 = ((char*)((ng10)));
    t29 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t29 == 1)
        goto LAB75;

LAB76:    t2 = ((char*)((ng11)));
    t29 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t29 == 1)
        goto LAB77;

LAB78:
LAB79:    goto LAB2;

LAB6:    *((unsigned int *)t8) = 1;
    goto LAB9;

LAB11:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t6);
    *((unsigned int *)t8) = (t16 | t17);
    t18 = *((unsigned int *)t5);
    t19 = *((unsigned int *)t6);
    *((unsigned int *)t5) = (t18 | t19);
    goto LAB10;

LAB12:    xsi_vlogvar_wait_assign_value(t7, t8, 0, *((unsigned int *)t22), 1, 0LL);
    goto LAB13;

LAB14:    *((unsigned int *)t8) = 1;
    goto LAB17;

LAB19:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t6);
    *((unsigned int *)t8) = (t16 | t17);
    t18 = *((unsigned int *)t5);
    t19 = *((unsigned int *)t6);
    *((unsigned int *)t5) = (t18 | t19);
    goto LAB18;

LAB20:    xsi_vlogvar_wait_assign_value(t7, t8, 0, *((unsigned int *)t22), 1, 0LL);
    goto LAB21;

LAB22:    *((unsigned int *)t8) = 1;
    goto LAB25;

LAB27:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t6);
    *((unsigned int *)t8) = (t16 | t17);
    t18 = *((unsigned int *)t5);
    t19 = *((unsigned int *)t6);
    *((unsigned int *)t5) = (t18 | t19);
    goto LAB26;

LAB28:    xsi_vlogvar_wait_assign_value(t7, t8, 0, *((unsigned int *)t22), 1, 0LL);
    goto LAB29;

LAB30:    *((unsigned int *)t8) = 1;
    goto LAB33;

LAB35:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t6);
    *((unsigned int *)t8) = (t16 | t17);
    t18 = *((unsigned int *)t5);
    t19 = *((unsigned int *)t6);
    *((unsigned int *)t5) = (t18 | t19);
    goto LAB34;

LAB36:    xsi_vlogvar_wait_assign_value(t7, t8, 0, *((unsigned int *)t22), 1, 0LL);
    goto LAB37;

LAB38:    *((unsigned int *)t8) = 1;
    goto LAB41;

LAB43:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t6);
    *((unsigned int *)t8) = (t16 | t17);
    t18 = *((unsigned int *)t5);
    t19 = *((unsigned int *)t6);
    *((unsigned int *)t5) = (t18 | t19);
    goto LAB42;

LAB44:    xsi_vlogvar_wait_assign_value(t7, t8, 0, *((unsigned int *)t22), 1, 0LL);
    goto LAB45;

LAB46:    *((unsigned int *)t8) = 1;
    goto LAB49;

LAB51:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t6);
    *((unsigned int *)t8) = (t16 | t17);
    t18 = *((unsigned int *)t5);
    t19 = *((unsigned int *)t6);
    *((unsigned int *)t5) = (t18 | t19);
    goto LAB50;

LAB52:    xsi_vlogvar_wait_assign_value(t7, t8, 0, *((unsigned int *)t22), 1, 0LL);
    goto LAB53;

LAB56:    t6 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t6) = 1;
    goto LAB57;

LAB58:    xsi_set_current_line(71, ng0);

LAB61:    xsi_set_current_line(72, ng0);
    t23 = ((char*)((ng8)));
    t24 = (t0 + 6344);
    xsi_vlogvar_assign_value(t24, t23, 0, 0, 1);
    xsi_set_current_line(73, ng0);
    t2 = (t0 + 5384);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 4);
    *((unsigned int *)t8) = t10;
    t11 = *((unsigned int *)t6);
    t12 = (t11 >> 4);
    *((unsigned int *)t5) = t12;
    t13 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t13 & 3U);
    t14 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t14 & 3U);
    t7 = (t0 + 6184);
    xsi_vlogvar_assign_value(t7, t8, 0, 0, 2);
    goto LAB60;

LAB64:    t6 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t6) = 1;
    goto LAB65;

LAB66:    xsi_set_current_line(75, ng0);

LAB69:    xsi_set_current_line(76, ng0);
    t23 = ((char*)((ng9)));
    t24 = (t0 + 6344);
    xsi_vlogvar_assign_value(t24, t23, 0, 0, 1);
    xsi_set_current_line(77, ng0);
    t2 = (t0 + 5384);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 0);
    *((unsigned int *)t8) = t10;
    t11 = *((unsigned int *)t6);
    t12 = (t11 >> 0);
    *((unsigned int *)t5) = t12;
    t13 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t13 & 3U);
    t14 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t14 & 3U);
    t7 = (t0 + 6184);
    xsi_vlogvar_assign_value(t7, t8, 0, 0, 2);
    goto LAB68;

LAB71:    xsi_set_current_line(84, ng0);

LAB80:    xsi_set_current_line(85, ng0);
    t6 = (t0 + 4344U);
    t7 = *((char **)t6);
    t6 = ((char*)((ng8)));
    memset(t8, 0, 8);
    t23 = (t7 + 4);
    t24 = (t6 + 4);
    t9 = *((unsigned int *)t7);
    t10 = *((unsigned int *)t6);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t23);
    t13 = *((unsigned int *)t24);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t23);
    t17 = *((unsigned int *)t24);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB84;

LAB81:    if (t18 != 0)
        goto LAB83;

LAB82:    *((unsigned int *)t8) = 1;

LAB84:    t26 = (t8 + 4);
    t21 = *((unsigned int *)t26);
    t28 = (~(t21));
    t30 = *((unsigned int *)t8);
    t31 = (t30 & t28);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB85;

LAB86:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 4344U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng9)));
    memset(t8, 0, 8);
    t5 = (t3 + 4);
    t6 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t5);
    t13 = *((unsigned int *)t6);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t5);
    t17 = *((unsigned int *)t6);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB118;

LAB115:    if (t18 != 0)
        goto LAB117;

LAB116:    *((unsigned int *)t8) = 1;

LAB118:    t23 = (t8 + 4);
    t21 = *((unsigned int *)t23);
    t28 = (~(t21));
    t30 = *((unsigned int *)t8);
    t31 = (t30 & t28);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB119;

LAB120:
LAB121:
LAB87:    goto LAB79;

LAB73:    xsi_set_current_line(103, ng0);

LAB149:    xsi_set_current_line(105, ng0);
    t3 = (t0 + 4904);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng3)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 32, t6, 25, t7, 32);
    t23 = (t0 + 4904);
    xsi_vlogvar_assign_value(t23, t8, 0, 0, 25);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 5384);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t8, 0, 8);
    t6 = (t8 + 4);
    t7 = (t5 + 4);
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 2);
    *((unsigned int *)t8) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 2);
    *((unsigned int *)t6) = t12;
    t13 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t13 & 15U);
    t14 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t14 & 15U);
    t23 = (t0 + 5864);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memset(t22, 0, 8);
    t26 = (t8 + 4);
    t27 = (t25 + 4);
    t15 = *((unsigned int *)t8);
    t16 = *((unsigned int *)t25);
    t17 = (t15 ^ t16);
    t18 = *((unsigned int *)t26);
    t19 = *((unsigned int *)t27);
    t20 = (t18 ^ t19);
    t21 = (t17 | t20);
    t28 = *((unsigned int *)t26);
    t30 = *((unsigned int *)t27);
    t31 = (t28 | t30);
    t32 = (~(t31));
    t37 = (t21 & t32);
    if (t37 != 0)
        goto LAB153;

LAB150:    if (t31 != 0)
        goto LAB152;

LAB151:    *((unsigned int *)t22) = 1;

LAB153:    memset(t43, 0, 8);
    t34 = (t22 + 4);
    t38 = *((unsigned int *)t34);
    t39 = (~(t38));
    t40 = *((unsigned int *)t22);
    t41 = (t40 & t39);
    t42 = (t41 & 1U);
    if (t42 != 0)
        goto LAB154;

LAB155:    if (*((unsigned int *)t34) != 0)
        goto LAB156;

LAB157:    t36 = (t43 + 4);
    t49 = *((unsigned int *)t43);
    t50 = *((unsigned int *)t36);
    t51 = (t49 || t50);
    if (t51 > 0)
        goto LAB158;

LAB159:    memcpy(t88, t43, 8);

LAB160:    memset(t104, 0, 8);
    t87 = (t88 + 4);
    t113 = *((unsigned int *)t87);
    t114 = (~(t113));
    t115 = *((unsigned int *)t88);
    t119 = (t115 & t114);
    t120 = (t119 & 1U);
    if (t120 != 0)
        goto LAB172;

LAB173:    if (*((unsigned int *)t87) != 0)
        goto LAB174;

LAB175:    t90 = (t104 + 4);
    t121 = *((unsigned int *)t104);
    t122 = *((unsigned int *)t90);
    t123 = (t121 || t122);
    if (t123 > 0)
        goto LAB176;

LAB177:    memcpy(t149, t104, 8);

LAB178:    t176 = (t149 + 4);
    t177 = *((unsigned int *)t176);
    t178 = (~(t177));
    t179 = *((unsigned int *)t149);
    t180 = (t179 & t178);
    t181 = (t180 != 0);
    if (t181 > 0)
        goto LAB190;

LAB191:    xsi_set_current_line(111, ng0);
    t2 = (t0 + 5384);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t8, 0, 8);
    t6 = (t8 + 4);
    t7 = (t5 + 4);
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 0);
    *((unsigned int *)t8) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    *((unsigned int *)t6) = t12;
    t13 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t13 & 15U);
    t14 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t14 & 15U);
    t23 = (t0 + 5864);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memset(t22, 0, 8);
    t26 = (t8 + 4);
    t27 = (t25 + 4);
    t15 = *((unsigned int *)t8);
    t16 = *((unsigned int *)t25);
    t17 = (t15 ^ t16);
    t18 = *((unsigned int *)t26);
    t19 = *((unsigned int *)t27);
    t20 = (t18 ^ t19);
    t21 = (t17 | t20);
    t28 = *((unsigned int *)t26);
    t30 = *((unsigned int *)t27);
    t31 = (t28 | t30);
    t32 = (~(t31));
    t37 = (t21 & t32);
    if (t37 != 0)
        goto LAB197;

LAB194:    if (t31 != 0)
        goto LAB196;

LAB195:    *((unsigned int *)t22) = 1;

LAB197:    memset(t43, 0, 8);
    t34 = (t22 + 4);
    t38 = *((unsigned int *)t34);
    t39 = (~(t38));
    t40 = *((unsigned int *)t22);
    t41 = (t40 & t39);
    t42 = (t41 & 1U);
    if (t42 != 0)
        goto LAB198;

LAB199:    if (*((unsigned int *)t34) != 0)
        goto LAB200;

LAB201:    t36 = (t43 + 4);
    t49 = *((unsigned int *)t43);
    t50 = *((unsigned int *)t36);
    t51 = (t49 || t50);
    if (t51 > 0)
        goto LAB202;

LAB203:    memcpy(t88, t43, 8);

LAB204:    memset(t104, 0, 8);
    t87 = (t88 + 4);
    t113 = *((unsigned int *)t87);
    t114 = (~(t113));
    t115 = *((unsigned int *)t88);
    t119 = (t115 & t114);
    t120 = (t119 & 1U);
    if (t120 != 0)
        goto LAB216;

LAB217:    if (*((unsigned int *)t87) != 0)
        goto LAB218;

LAB219:    t90 = (t104 + 4);
    t121 = *((unsigned int *)t104);
    t122 = *((unsigned int *)t90);
    t123 = (t121 || t122);
    if (t123 > 0)
        goto LAB220;

LAB221:    memcpy(t149, t104, 8);

LAB222:    t176 = (t149 + 4);
    t177 = *((unsigned int *)t176);
    t178 = (~(t177));
    t179 = *((unsigned int *)t149);
    t180 = (t179 & t178);
    t181 = (t180 != 0);
    if (t181 > 0)
        goto LAB234;

LAB235:    xsi_set_current_line(115, ng0);
    t2 = (t0 + 4904);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 472);
    t7 = *((char **)t6);
    memset(t8, 0, 8);
    t6 = (t5 + 4);
    t23 = (t7 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t7);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t6);
    t13 = *((unsigned int *)t23);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t6);
    t17 = *((unsigned int *)t23);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB241;

LAB238:    if (t18 != 0)
        goto LAB240;

LAB239:    *((unsigned int *)t8) = 1;

LAB241:    t25 = (t8 + 4);
    t21 = *((unsigned int *)t25);
    t28 = (~(t21));
    t30 = *((unsigned int *)t8);
    t31 = (t30 & t28);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB242;

LAB243:
LAB244:
LAB236:
LAB192:    goto LAB79;

LAB75:    xsi_set_current_line(122, ng0);

LAB246:    xsi_set_current_line(123, ng0);
    t3 = (t0 + 6184);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);

LAB247:    t7 = ((char*)((ng11)));
    t131 = xsi_vlog_unsigned_case_compare(t6, 2, t7, 2);
    if (t131 == 1)
        goto LAB248;

LAB249:    t2 = ((char*)((ng10)));
    t29 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t29 == 1)
        goto LAB250;

LAB251:    t2 = ((char*)((ng8)));
    t29 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t29 == 1)
        goto LAB252;

LAB253:    t2 = ((char*)((ng9)));
    t29 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t29 == 1)
        goto LAB254;

LAB255:
LAB257:
LAB256:    xsi_set_current_line(144, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4744);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB258:    goto LAB79;

LAB77:    xsi_set_current_line(149, ng0);

LAB263:    xsi_set_current_line(151, ng0);
    t3 = (t0 + 5064);
    t5 = (t3 + 56U);
    t7 = *((char **)t5);
    t23 = (t0 + 608);
    t24 = *((char **)t23);
    memset(t8, 0, 8);
    t23 = (t7 + 4);
    t25 = (t24 + 4);
    t9 = *((unsigned int *)t7);
    t10 = *((unsigned int *)t24);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t23);
    t13 = *((unsigned int *)t25);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t23);
    t17 = *((unsigned int *)t25);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB267;

LAB264:    if (t18 != 0)
        goto LAB266;

LAB265:    *((unsigned int *)t8) = 1;

LAB267:    memset(t22, 0, 8);
    t27 = (t8 + 4);
    t21 = *((unsigned int *)t27);
    t28 = (~(t21));
    t30 = *((unsigned int *)t8);
    t31 = (t30 & t28);
    t32 = (t31 & 1U);
    if (t32 != 0)
        goto LAB268;

LAB269:    if (*((unsigned int *)t27) != 0)
        goto LAB270;

LAB271:    t34 = (t22 + 4);
    t37 = *((unsigned int *)t22);
    t38 = (!(t37));
    t39 = *((unsigned int *)t34);
    t40 = (t38 || t39);
    if (t40 > 0)
        goto LAB272;

LAB273:    memcpy(t88, t22, 8);

LAB274:    t87 = (t88 + 4);
    t108 = *((unsigned int *)t87);
    t109 = (~(t108));
    t110 = *((unsigned int *)t88);
    t113 = (t110 & t109);
    t114 = (t113 != 0);
    if (t114 > 0)
        goto LAB286;

LAB287:    xsi_set_current_line(156, ng0);

LAB290:    xsi_set_current_line(158, ng0);
    t2 = (t0 + 5384);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t8, 0, 8);
    t7 = (t8 + 4);
    t23 = (t5 + 4);
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 2);
    *((unsigned int *)t8) = t10;
    t11 = *((unsigned int *)t23);
    t12 = (t11 >> 2);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t13 & 3U);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 & 3U);
    t24 = ((char*)((ng8)));
    memset(t22, 0, 8);
    t25 = (t8 + 4);
    t26 = (t24 + 4);
    t15 = *((unsigned int *)t8);
    t16 = *((unsigned int *)t24);
    t17 = (t15 ^ t16);
    t18 = *((unsigned int *)t25);
    t19 = *((unsigned int *)t26);
    t20 = (t18 ^ t19);
    t21 = (t17 | t20);
    t28 = *((unsigned int *)t25);
    t30 = *((unsigned int *)t26);
    t31 = (t28 | t30);
    t32 = (~(t31));
    t37 = (t21 & t32);
    if (t37 != 0)
        goto LAB294;

LAB291:    if (t31 != 0)
        goto LAB293;

LAB292:    *((unsigned int *)t22) = 1;

LAB294:    t33 = (t22 + 4);
    t38 = *((unsigned int *)t33);
    t39 = (~(t38));
    t40 = *((unsigned int *)t22);
    t41 = (t40 & t39);
    t42 = (t41 != 0);
    if (t42 > 0)
        goto LAB295;

LAB296:    xsi_set_current_line(162, ng0);
    t2 = (t0 + 5384);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t8, 0, 8);
    t7 = (t8 + 4);
    t23 = (t5 + 4);
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 2);
    *((unsigned int *)t8) = t10;
    t11 = *((unsigned int *)t23);
    t12 = (t11 >> 2);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t13 & 3U);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 & 3U);
    t24 = ((char*)((ng10)));
    memset(t22, 0, 8);
    t25 = (t8 + 4);
    t26 = (t24 + 4);
    t15 = *((unsigned int *)t8);
    t16 = *((unsigned int *)t24);
    t17 = (t15 ^ t16);
    t18 = *((unsigned int *)t25);
    t19 = *((unsigned int *)t26);
    t20 = (t18 ^ t19);
    t21 = (t17 | t20);
    t28 = *((unsigned int *)t25);
    t30 = *((unsigned int *)t26);
    t31 = (t28 | t30);
    t32 = (~(t31));
    t37 = (t21 & t32);
    if (t37 != 0)
        goto LAB302;

LAB299:    if (t31 != 0)
        goto LAB301;

LAB300:    *((unsigned int *)t22) = 1;

LAB302:    t33 = (t22 + 4);
    t38 = *((unsigned int *)t33);
    t39 = (~(t38));
    t40 = *((unsigned int *)t22);
    t41 = (t40 & t39);
    t42 = (t41 != 0);
    if (t42 > 0)
        goto LAB303;

LAB304:
LAB305:
LAB297:    xsi_set_current_line(166, ng0);
    t2 = (t0 + 6184);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t7 = ((char*)((ng9)));
    memset(t8, 0, 8);
    t23 = (t5 + 4);
    t24 = (t7 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t7);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t23);
    t13 = *((unsigned int *)t24);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t23);
    t17 = *((unsigned int *)t24);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB308;

LAB307:    if (t18 != 0)
        goto LAB309;

LAB310:    t26 = (t8 + 4);
    t21 = *((unsigned int *)t26);
    t28 = (~(t21));
    t30 = *((unsigned int *)t8);
    t31 = (t30 & t28);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB311;

LAB312:    xsi_set_current_line(170, ng0);
    t2 = (t0 + 4744);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t7 = ((char*)((ng15)));
    memset(t8, 0, 8);
    t23 = (t5 + 4);
    t24 = (t7 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t7);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t23);
    t13 = *((unsigned int *)t24);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t23);
    t17 = *((unsigned int *)t24);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB316;

LAB315:    if (t18 != 0)
        goto LAB317;

LAB318:    memset(t22, 0, 8);
    t26 = (t8 + 4);
    t21 = *((unsigned int *)t26);
    t28 = (~(t21));
    t30 = *((unsigned int *)t8);
    t31 = (t30 & t28);
    t32 = (t31 & 1U);
    if (t32 != 0)
        goto LAB319;

LAB320:    if (*((unsigned int *)t26) != 0)
        goto LAB321;

LAB322:    t33 = (t22 + 4);
    t37 = *((unsigned int *)t22);
    t38 = *((unsigned int *)t33);
    t39 = (t37 || t38);
    if (t39 > 0)
        goto LAB323;

LAB324:    memcpy(t71, t22, 8);

LAB325:    memset(t88, 0, 8);
    t84 = (t71 + 4);
    t102 = *((unsigned int *)t84);
    t106 = (~(t102));
    t107 = *((unsigned int *)t71);
    t108 = (t107 & t106);
    t109 = (t108 & 1U);
    if (t109 != 0)
        goto LAB337;

LAB338:    if (*((unsigned int *)t84) != 0)
        goto LAB339;

LAB340:    t86 = (t88 + 4);
    t110 = *((unsigned int *)t88);
    t113 = *((unsigned int *)t86);
    t114 = (t110 || t113);
    if (t114 > 0)
        goto LAB341;

LAB342:    memcpy(t149, t88, 8);

LAB343:    t182 = (t149 + 4);
    t177 = *((unsigned int *)t182);
    t178 = (~(t177));
    t179 = *((unsigned int *)t149);
    t180 = (t179 & t178);
    t181 = (t180 != 0);
    if (t181 > 0)
        goto LAB355;

LAB356:
LAB357:
LAB313:
LAB288:    goto LAB79;

LAB83:    t25 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t25) = 1;
    goto LAB84;

LAB85:    xsi_set_current_line(85, ng0);

LAB88:    xsi_set_current_line(87, ng0);
    t27 = (t0 + 5704);
    t33 = (t27 + 56U);
    t34 = *((char **)t33);
    memset(t22, 0, 8);
    t35 = (t22 + 4);
    t36 = (t34 + 4);
    t37 = *((unsigned int *)t34);
    t38 = (t37 >> 2);
    *((unsigned int *)t22) = t38;
    t39 = *((unsigned int *)t36);
    t40 = (t39 >> 2);
    *((unsigned int *)t35) = t40;
    t41 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t41 & 15U);
    t42 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t42 & 15U);
    t44 = (t0 + 5384);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    memset(t43, 0, 8);
    t47 = (t43 + 4);
    t48 = (t46 + 4);
    t49 = *((unsigned int *)t46);
    t50 = (t49 >> 2);
    *((unsigned int *)t43) = t50;
    t51 = *((unsigned int *)t48);
    t52 = (t51 >> 2);
    *((unsigned int *)t47) = t52;
    t53 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t53 & 15U);
    t54 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t54 & 15U);
    memset(t55, 0, 8);
    t56 = (t22 + 4);
    t57 = (t43 + 4);
    t58 = *((unsigned int *)t22);
    t59 = *((unsigned int *)t43);
    t60 = (t58 ^ t59);
    t61 = *((unsigned int *)t56);
    t62 = *((unsigned int *)t57);
    t63 = (t61 ^ t62);
    t64 = (t60 | t63);
    t65 = *((unsigned int *)t56);
    t66 = *((unsigned int *)t57);
    t67 = (t65 | t66);
    t68 = (~(t67));
    t69 = (t64 & t68);
    if (t69 != 0)
        goto LAB90;

LAB89:    if (t67 != 0)
        goto LAB91;

LAB92:    memset(t71, 0, 8);
    t72 = (t55 + 4);
    t73 = *((unsigned int *)t72);
    t74 = (~(t73));
    t75 = *((unsigned int *)t55);
    t76 = (t75 & t74);
    t77 = (t76 & 1U);
    if (t77 != 0)
        goto LAB93;

LAB94:    if (*((unsigned int *)t72) != 0)
        goto LAB95;

LAB96:    t79 = (t71 + 4);
    t80 = *((unsigned int *)t71);
    t81 = (!(t80));
    t82 = *((unsigned int *)t79);
    t83 = (t81 || t82);
    if (t83 > 0)
        goto LAB97;

LAB98:    memcpy(t112, t71, 8);

LAB99:    t140 = (t112 + 4);
    t141 = *((unsigned int *)t140);
    t142 = (~(t141));
    t143 = *((unsigned int *)t112);
    t144 = (t143 & t142);
    t145 = (t144 != 0);
    if (t145 > 0)
        goto LAB111;

LAB112:
LAB113:    goto LAB87;

LAB90:    *((unsigned int *)t55) = 1;
    goto LAB92;

LAB91:    t70 = (t55 + 4);
    *((unsigned int *)t55) = 1;
    *((unsigned int *)t70) = 1;
    goto LAB92;

LAB93:    *((unsigned int *)t71) = 1;
    goto LAB96;

LAB95:    t78 = (t71 + 4);
    *((unsigned int *)t71) = 1;
    *((unsigned int *)t78) = 1;
    goto LAB96;

LAB97:    t84 = (t0 + 4344U);
    t85 = *((char **)t84);
    t84 = (t0 + 6344);
    t86 = (t84 + 56U);
    t87 = *((char **)t86);
    memset(t88, 0, 8);
    t89 = (t85 + 4);
    t90 = (t87 + 4);
    t91 = *((unsigned int *)t85);
    t92 = *((unsigned int *)t87);
    t93 = (t91 ^ t92);
    t94 = *((unsigned int *)t89);
    t95 = *((unsigned int *)t90);
    t96 = (t94 ^ t95);
    t97 = (t93 | t96);
    t98 = *((unsigned int *)t89);
    t99 = *((unsigned int *)t90);
    t100 = (t98 | t99);
    t101 = (~(t100));
    t102 = (t97 & t101);
    if (t102 != 0)
        goto LAB101;

LAB100:    if (t100 != 0)
        goto LAB102;

LAB103:    memset(t104, 0, 8);
    t105 = (t88 + 4);
    t106 = *((unsigned int *)t105);
    t107 = (~(t106));
    t108 = *((unsigned int *)t88);
    t109 = (t108 & t107);
    t110 = (t109 & 1U);
    if (t110 != 0)
        goto LAB104;

LAB105:    if (*((unsigned int *)t105) != 0)
        goto LAB106;

LAB107:    t113 = *((unsigned int *)t71);
    t114 = *((unsigned int *)t104);
    t115 = (t113 | t114);
    *((unsigned int *)t112) = t115;
    t116 = (t71 + 4);
    t117 = (t104 + 4);
    t118 = (t112 + 4);
    t119 = *((unsigned int *)t116);
    t120 = *((unsigned int *)t117);
    t121 = (t119 | t120);
    *((unsigned int *)t118) = t121;
    t122 = *((unsigned int *)t118);
    t123 = (t122 != 0);
    if (t123 == 1)
        goto LAB108;

LAB109:
LAB110:    goto LAB99;

LAB101:    *((unsigned int *)t88) = 1;
    goto LAB103;

LAB102:    t103 = (t88 + 4);
    *((unsigned int *)t88) = 1;
    *((unsigned int *)t103) = 1;
    goto LAB103;

LAB104:    *((unsigned int *)t104) = 1;
    goto LAB107;

LAB106:    t111 = (t104 + 4);
    *((unsigned int *)t104) = 1;
    *((unsigned int *)t111) = 1;
    goto LAB107;

LAB108:    t124 = *((unsigned int *)t112);
    t125 = *((unsigned int *)t118);
    *((unsigned int *)t112) = (t124 | t125);
    t126 = (t71 + 4);
    t127 = (t104 + 4);
    t128 = *((unsigned int *)t126);
    t129 = (~(t128));
    t130 = *((unsigned int *)t71);
    t131 = (t130 & t129);
    t132 = *((unsigned int *)t127);
    t133 = (~(t132));
    t134 = *((unsigned int *)t104);
    t135 = (t134 & t133);
    t136 = (~(t131));
    t137 = (~(t135));
    t138 = *((unsigned int *)t118);
    *((unsigned int *)t118) = (t138 & t136);
    t139 = *((unsigned int *)t118);
    *((unsigned int *)t118) = (t139 & t137);
    goto LAB110;

LAB111:    xsi_set_current_line(87, ng0);

LAB114:    xsi_set_current_line(88, ng0);
    t146 = ((char*)((ng8)));
    t147 = (t0 + 6024);
    xsi_vlogvar_assign_value(t147, t146, 0, 0, 2);
    xsi_set_current_line(89, ng0);
    t2 = (t0 + 5704);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t8, 0, 8);
    t6 = (t8 + 4);
    t7 = (t5 + 4);
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 2);
    *((unsigned int *)t8) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 2);
    *((unsigned int *)t6) = t12;
    t13 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t13 & 15U);
    t14 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t14 & 15U);
    t23 = (t0 + 5864);
    xsi_vlogvar_assign_value(t23, t8, 0, 0, 4);
    goto LAB113;

LAB117:    t7 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB118;

LAB119:    xsi_set_current_line(92, ng0);

LAB122:    xsi_set_current_line(94, ng0);
    t24 = (t0 + 5704);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memset(t22, 0, 8);
    t27 = (t22 + 4);
    t33 = (t26 + 4);
    t37 = *((unsigned int *)t26);
    t38 = (t37 >> 0);
    *((unsigned int *)t22) = t38;
    t39 = *((unsigned int *)t33);
    t40 = (t39 >> 0);
    *((unsigned int *)t27) = t40;
    t41 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t41 & 15U);
    t42 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t42 & 15U);
    t34 = (t0 + 5384);
    t35 = (t34 + 56U);
    t36 = *((char **)t35);
    memset(t43, 0, 8);
    t44 = (t43 + 4);
    t45 = (t36 + 4);
    t49 = *((unsigned int *)t36);
    t50 = (t49 >> 0);
    *((unsigned int *)t43) = t50;
    t51 = *((unsigned int *)t45);
    t52 = (t51 >> 0);
    *((unsigned int *)t44) = t52;
    t53 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t53 & 15U);
    t54 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t54 & 15U);
    memset(t55, 0, 8);
    t46 = (t22 + 4);
    t47 = (t43 + 4);
    t58 = *((unsigned int *)t22);
    t59 = *((unsigned int *)t43);
    t60 = (t58 ^ t59);
    t61 = *((unsigned int *)t46);
    t62 = *((unsigned int *)t47);
    t63 = (t61 ^ t62);
    t64 = (t60 | t63);
    t65 = *((unsigned int *)t46);
    t66 = *((unsigned int *)t47);
    t67 = (t65 | t66);
    t68 = (~(t67));
    t69 = (t64 & t68);
    if (t69 != 0)
        goto LAB124;

LAB123:    if (t67 != 0)
        goto LAB125;

LAB126:    memset(t71, 0, 8);
    t56 = (t55 + 4);
    t73 = *((unsigned int *)t56);
    t74 = (~(t73));
    t75 = *((unsigned int *)t55);
    t76 = (t75 & t74);
    t77 = (t76 & 1U);
    if (t77 != 0)
        goto LAB127;

LAB128:    if (*((unsigned int *)t56) != 0)
        goto LAB129;

LAB130:    t70 = (t71 + 4);
    t80 = *((unsigned int *)t71);
    t81 = (!(t80));
    t82 = *((unsigned int *)t70);
    t83 = (t81 || t82);
    if (t83 > 0)
        goto LAB131;

LAB132:    memcpy(t112, t71, 8);

LAB133:    t118 = (t112 + 4);
    t141 = *((unsigned int *)t118);
    t142 = (~(t141));
    t143 = *((unsigned int *)t112);
    t144 = (t143 & t142);
    t145 = (t144 != 0);
    if (t145 > 0)
        goto LAB145;

LAB146:
LAB147:    goto LAB121;

LAB124:    *((unsigned int *)t55) = 1;
    goto LAB126;

LAB125:    t48 = (t55 + 4);
    *((unsigned int *)t55) = 1;
    *((unsigned int *)t48) = 1;
    goto LAB126;

LAB127:    *((unsigned int *)t71) = 1;
    goto LAB130;

LAB129:    t57 = (t71 + 4);
    *((unsigned int *)t71) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB130;

LAB131:    t72 = (t0 + 4344U);
    t78 = *((char **)t72);
    t72 = (t0 + 6344);
    t79 = (t72 + 56U);
    t84 = *((char **)t79);
    memset(t88, 0, 8);
    t85 = (t78 + 4);
    t86 = (t84 + 4);
    t91 = *((unsigned int *)t78);
    t92 = *((unsigned int *)t84);
    t93 = (t91 ^ t92);
    t94 = *((unsigned int *)t85);
    t95 = *((unsigned int *)t86);
    t96 = (t94 ^ t95);
    t97 = (t93 | t96);
    t98 = *((unsigned int *)t85);
    t99 = *((unsigned int *)t86);
    t100 = (t98 | t99);
    t101 = (~(t100));
    t102 = (t97 & t101);
    if (t102 != 0)
        goto LAB135;

LAB134:    if (t100 != 0)
        goto LAB136;

LAB137:    memset(t104, 0, 8);
    t89 = (t88 + 4);
    t106 = *((unsigned int *)t89);
    t107 = (~(t106));
    t108 = *((unsigned int *)t88);
    t109 = (t108 & t107);
    t110 = (t109 & 1U);
    if (t110 != 0)
        goto LAB138;

LAB139:    if (*((unsigned int *)t89) != 0)
        goto LAB140;

LAB141:    t113 = *((unsigned int *)t71);
    t114 = *((unsigned int *)t104);
    t115 = (t113 | t114);
    *((unsigned int *)t112) = t115;
    t103 = (t71 + 4);
    t105 = (t104 + 4);
    t111 = (t112 + 4);
    t119 = *((unsigned int *)t103);
    t120 = *((unsigned int *)t105);
    t121 = (t119 | t120);
    *((unsigned int *)t111) = t121;
    t122 = *((unsigned int *)t111);
    t123 = (t122 != 0);
    if (t123 == 1)
        goto LAB142;

LAB143:
LAB144:    goto LAB133;

LAB135:    *((unsigned int *)t88) = 1;
    goto LAB137;

LAB136:    t87 = (t88 + 4);
    *((unsigned int *)t88) = 1;
    *((unsigned int *)t87) = 1;
    goto LAB137;

LAB138:    *((unsigned int *)t104) = 1;
    goto LAB141;

LAB140:    t90 = (t104 + 4);
    *((unsigned int *)t104) = 1;
    *((unsigned int *)t90) = 1;
    goto LAB141;

LAB142:    t124 = *((unsigned int *)t112);
    t125 = *((unsigned int *)t111);
    *((unsigned int *)t112) = (t124 | t125);
    t116 = (t71 + 4);
    t117 = (t104 + 4);
    t128 = *((unsigned int *)t116);
    t129 = (~(t128));
    t130 = *((unsigned int *)t71);
    t29 = (t130 & t129);
    t132 = *((unsigned int *)t117);
    t133 = (~(t132));
    t134 = *((unsigned int *)t104);
    t131 = (t134 & t133);
    t136 = (~(t29));
    t137 = (~(t131));
    t138 = *((unsigned int *)t111);
    *((unsigned int *)t111) = (t138 & t136);
    t139 = *((unsigned int *)t111);
    *((unsigned int *)t111) = (t139 & t137);
    goto LAB144;

LAB145:    xsi_set_current_line(94, ng0);

LAB148:    xsi_set_current_line(95, ng0);
    t126 = ((char*)((ng8)));
    t127 = (t0 + 6024);
    xsi_vlogvar_assign_value(t127, t126, 0, 0, 2);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 5704);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t8, 0, 8);
    t6 = (t8 + 4);
    t7 = (t5 + 4);
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 0);
    *((unsigned int *)t8) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    *((unsigned int *)t6) = t12;
    t13 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t13 & 15U);
    t14 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t14 & 15U);
    t23 = (t0 + 5864);
    xsi_vlogvar_assign_value(t23, t8, 0, 0, 4);
    goto LAB147;

LAB152:    t33 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t33) = 1;
    goto LAB153;

LAB154:    *((unsigned int *)t43) = 1;
    goto LAB157;

LAB156:    t35 = (t43 + 4);
    *((unsigned int *)t43) = 1;
    *((unsigned int *)t35) = 1;
    goto LAB157;

LAB158:    t44 = (t0 + 4344U);
    t45 = *((char **)t44);
    t44 = (t0 + 6344);
    t46 = (t44 + 56U);
    t47 = *((char **)t46);
    memset(t55, 0, 8);
    t48 = (t45 + 4);
    t56 = (t47 + 4);
    t52 = *((unsigned int *)t45);
    t53 = *((unsigned int *)t47);
    t54 = (t52 ^ t53);
    t58 = *((unsigned int *)t48);
    t59 = *((unsigned int *)t56);
    t60 = (t58 ^ t59);
    t61 = (t54 | t60);
    t62 = *((unsigned int *)t48);
    t63 = *((unsigned int *)t56);
    t64 = (t62 | t63);
    t65 = (~(t64));
    t66 = (t61 & t65);
    if (t66 != 0)
        goto LAB164;

LAB161:    if (t64 != 0)
        goto LAB163;

LAB162:    *((unsigned int *)t55) = 1;

LAB164:    memset(t71, 0, 8);
    t70 = (t55 + 4);
    t67 = *((unsigned int *)t70);
    t68 = (~(t67));
    t69 = *((unsigned int *)t55);
    t73 = (t69 & t68);
    t74 = (t73 & 1U);
    if (t74 != 0)
        goto LAB165;

LAB166:    if (*((unsigned int *)t70) != 0)
        goto LAB167;

LAB168:    t75 = *((unsigned int *)t43);
    t76 = *((unsigned int *)t71);
    t77 = (t75 & t76);
    *((unsigned int *)t88) = t77;
    t78 = (t43 + 4);
    t79 = (t71 + 4);
    t84 = (t88 + 4);
    t80 = *((unsigned int *)t78);
    t81 = *((unsigned int *)t79);
    t82 = (t80 | t81);
    *((unsigned int *)t84) = t82;
    t83 = *((unsigned int *)t84);
    t91 = (t83 != 0);
    if (t91 == 1)
        goto LAB169;

LAB170:
LAB171:    goto LAB160;

LAB163:    t57 = (t55 + 4);
    *((unsigned int *)t55) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB164;

LAB165:    *((unsigned int *)t71) = 1;
    goto LAB168;

LAB167:    t72 = (t71 + 4);
    *((unsigned int *)t71) = 1;
    *((unsigned int *)t72) = 1;
    goto LAB168;

LAB169:    t92 = *((unsigned int *)t88);
    t93 = *((unsigned int *)t84);
    *((unsigned int *)t88) = (t92 | t93);
    t85 = (t43 + 4);
    t86 = (t71 + 4);
    t94 = *((unsigned int *)t43);
    t95 = (~(t94));
    t96 = *((unsigned int *)t85);
    t97 = (~(t96));
    t98 = *((unsigned int *)t71);
    t99 = (~(t98));
    t100 = *((unsigned int *)t86);
    t101 = (~(t100));
    t29 = (t95 & t97);
    t131 = (t99 & t101);
    t102 = (~(t29));
    t106 = (~(t131));
    t107 = *((unsigned int *)t84);
    *((unsigned int *)t84) = (t107 & t102);
    t108 = *((unsigned int *)t84);
    *((unsigned int *)t84) = (t108 & t106);
    t109 = *((unsigned int *)t88);
    *((unsigned int *)t88) = (t109 & t102);
    t110 = *((unsigned int *)t88);
    *((unsigned int *)t88) = (t110 & t106);
    goto LAB171;

LAB172:    *((unsigned int *)t104) = 1;
    goto LAB175;

LAB174:    t89 = (t104 + 4);
    *((unsigned int *)t104) = 1;
    *((unsigned int *)t89) = 1;
    goto LAB175;

LAB176:    t103 = (t0 + 4344U);
    t105 = *((char **)t103);
    t103 = ((char*)((ng8)));
    memset(t112, 0, 8);
    t111 = (t105 + 4);
    t116 = (t103 + 4);
    t124 = *((unsigned int *)t105);
    t125 = *((unsigned int *)t103);
    t128 = (t124 ^ t125);
    t129 = *((unsigned int *)t111);
    t130 = *((unsigned int *)t116);
    t132 = (t129 ^ t130);
    t133 = (t128 | t132);
    t134 = *((unsigned int *)t111);
    t136 = *((unsigned int *)t116);
    t137 = (t134 | t136);
    t138 = (~(t137));
    t139 = (t133 & t138);
    if (t139 != 0)
        goto LAB182;

LAB179:    if (t137 != 0)
        goto LAB181;

LAB180:    *((unsigned int *)t112) = 1;

LAB182:    memset(t148, 0, 8);
    t118 = (t112 + 4);
    t141 = *((unsigned int *)t118);
    t142 = (~(t141));
    t143 = *((unsigned int *)t112);
    t144 = (t143 & t142);
    t145 = (t144 & 1U);
    if (t145 != 0)
        goto LAB183;

LAB184:    if (*((unsigned int *)t118) != 0)
        goto LAB185;

LAB186:    t150 = *((unsigned int *)t104);
    t151 = *((unsigned int *)t148);
    t152 = (t150 & t151);
    *((unsigned int *)t149) = t152;
    t127 = (t104 + 4);
    t140 = (t148 + 4);
    t146 = (t149 + 4);
    t153 = *((unsigned int *)t127);
    t154 = *((unsigned int *)t140);
    t155 = (t153 | t154);
    *((unsigned int *)t146) = t155;
    t156 = *((unsigned int *)t146);
    t157 = (t156 != 0);
    if (t157 == 1)
        goto LAB187;

LAB188:
LAB189:    goto LAB178;

LAB181:    t117 = (t112 + 4);
    *((unsigned int *)t112) = 1;
    *((unsigned int *)t117) = 1;
    goto LAB182;

LAB183:    *((unsigned int *)t148) = 1;
    goto LAB186;

LAB185:    t126 = (t148 + 4);
    *((unsigned int *)t148) = 1;
    *((unsigned int *)t126) = 1;
    goto LAB186;

LAB187:    t158 = *((unsigned int *)t149);
    t159 = *((unsigned int *)t146);
    *((unsigned int *)t149) = (t158 | t159);
    t147 = (t104 + 4);
    t160 = (t148 + 4);
    t161 = *((unsigned int *)t104);
    t162 = (~(t161));
    t163 = *((unsigned int *)t147);
    t164 = (~(t163));
    t165 = *((unsigned int *)t148);
    t166 = (~(t165));
    t167 = *((unsigned int *)t160);
    t168 = (~(t167));
    t135 = (t162 & t164);
    t169 = (t166 & t168);
    t170 = (~(t135));
    t171 = (~(t169));
    t172 = *((unsigned int *)t146);
    *((unsigned int *)t146) = (t172 & t170);
    t173 = *((unsigned int *)t146);
    *((unsigned int *)t146) = (t173 & t171);
    t174 = *((unsigned int *)t149);
    *((unsigned int *)t149) = (t174 & t170);
    t175 = *((unsigned int *)t149);
    *((unsigned int *)t149) = (t175 & t171);
    goto LAB189;

LAB190:    xsi_set_current_line(108, ng0);

LAB193:    xsi_set_current_line(109, ng0);
    t182 = ((char*)((ng9)));
    t183 = (t0 + 6024);
    xsi_vlogvar_assign_value(t183, t182, 0, 0, 2);
    goto LAB192;

LAB196:    t33 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t33) = 1;
    goto LAB197;

LAB198:    *((unsigned int *)t43) = 1;
    goto LAB201;

LAB200:    t35 = (t43 + 4);
    *((unsigned int *)t43) = 1;
    *((unsigned int *)t35) = 1;
    goto LAB201;

LAB202:    t44 = (t0 + 4344U);
    t45 = *((char **)t44);
    t44 = (t0 + 6344);
    t46 = (t44 + 56U);
    t47 = *((char **)t46);
    memset(t55, 0, 8);
    t48 = (t45 + 4);
    t56 = (t47 + 4);
    t52 = *((unsigned int *)t45);
    t53 = *((unsigned int *)t47);
    t54 = (t52 ^ t53);
    t58 = *((unsigned int *)t48);
    t59 = *((unsigned int *)t56);
    t60 = (t58 ^ t59);
    t61 = (t54 | t60);
    t62 = *((unsigned int *)t48);
    t63 = *((unsigned int *)t56);
    t64 = (t62 | t63);
    t65 = (~(t64));
    t66 = (t61 & t65);
    if (t66 != 0)
        goto LAB208;

LAB205:    if (t64 != 0)
        goto LAB207;

LAB206:    *((unsigned int *)t55) = 1;

LAB208:    memset(t71, 0, 8);
    t70 = (t55 + 4);
    t67 = *((unsigned int *)t70);
    t68 = (~(t67));
    t69 = *((unsigned int *)t55);
    t73 = (t69 & t68);
    t74 = (t73 & 1U);
    if (t74 != 0)
        goto LAB209;

LAB210:    if (*((unsigned int *)t70) != 0)
        goto LAB211;

LAB212:    t75 = *((unsigned int *)t43);
    t76 = *((unsigned int *)t71);
    t77 = (t75 & t76);
    *((unsigned int *)t88) = t77;
    t78 = (t43 + 4);
    t79 = (t71 + 4);
    t84 = (t88 + 4);
    t80 = *((unsigned int *)t78);
    t81 = *((unsigned int *)t79);
    t82 = (t80 | t81);
    *((unsigned int *)t84) = t82;
    t83 = *((unsigned int *)t84);
    t91 = (t83 != 0);
    if (t91 == 1)
        goto LAB213;

LAB214:
LAB215:    goto LAB204;

LAB207:    t57 = (t55 + 4);
    *((unsigned int *)t55) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB208;

LAB209:    *((unsigned int *)t71) = 1;
    goto LAB212;

LAB211:    t72 = (t71 + 4);
    *((unsigned int *)t71) = 1;
    *((unsigned int *)t72) = 1;
    goto LAB212;

LAB213:    t92 = *((unsigned int *)t88);
    t93 = *((unsigned int *)t84);
    *((unsigned int *)t88) = (t92 | t93);
    t85 = (t43 + 4);
    t86 = (t71 + 4);
    t94 = *((unsigned int *)t43);
    t95 = (~(t94));
    t96 = *((unsigned int *)t85);
    t97 = (~(t96));
    t98 = *((unsigned int *)t71);
    t99 = (~(t98));
    t100 = *((unsigned int *)t86);
    t101 = (~(t100));
    t29 = (t95 & t97);
    t131 = (t99 & t101);
    t102 = (~(t29));
    t106 = (~(t131));
    t107 = *((unsigned int *)t84);
    *((unsigned int *)t84) = (t107 & t102);
    t108 = *((unsigned int *)t84);
    *((unsigned int *)t84) = (t108 & t106);
    t109 = *((unsigned int *)t88);
    *((unsigned int *)t88) = (t109 & t102);
    t110 = *((unsigned int *)t88);
    *((unsigned int *)t88) = (t110 & t106);
    goto LAB215;

LAB216:    *((unsigned int *)t104) = 1;
    goto LAB219;

LAB218:    t89 = (t104 + 4);
    *((unsigned int *)t104) = 1;
    *((unsigned int *)t89) = 1;
    goto LAB219;

LAB220:    t103 = (t0 + 4344U);
    t105 = *((char **)t103);
    t103 = ((char*)((ng9)));
    memset(t112, 0, 8);
    t111 = (t105 + 4);
    t116 = (t103 + 4);
    t124 = *((unsigned int *)t105);
    t125 = *((unsigned int *)t103);
    t128 = (t124 ^ t125);
    t129 = *((unsigned int *)t111);
    t130 = *((unsigned int *)t116);
    t132 = (t129 ^ t130);
    t133 = (t128 | t132);
    t134 = *((unsigned int *)t111);
    t136 = *((unsigned int *)t116);
    t137 = (t134 | t136);
    t138 = (~(t137));
    t139 = (t133 & t138);
    if (t139 != 0)
        goto LAB226;

LAB223:    if (t137 != 0)
        goto LAB225;

LAB224:    *((unsigned int *)t112) = 1;

LAB226:    memset(t148, 0, 8);
    t118 = (t112 + 4);
    t141 = *((unsigned int *)t118);
    t142 = (~(t141));
    t143 = *((unsigned int *)t112);
    t144 = (t143 & t142);
    t145 = (t144 & 1U);
    if (t145 != 0)
        goto LAB227;

LAB228:    if (*((unsigned int *)t118) != 0)
        goto LAB229;

LAB230:    t150 = *((unsigned int *)t104);
    t151 = *((unsigned int *)t148);
    t152 = (t150 & t151);
    *((unsigned int *)t149) = t152;
    t127 = (t104 + 4);
    t140 = (t148 + 4);
    t146 = (t149 + 4);
    t153 = *((unsigned int *)t127);
    t154 = *((unsigned int *)t140);
    t155 = (t153 | t154);
    *((unsigned int *)t146) = t155;
    t156 = *((unsigned int *)t146);
    t157 = (t156 != 0);
    if (t157 == 1)
        goto LAB231;

LAB232:
LAB233:    goto LAB222;

LAB225:    t117 = (t112 + 4);
    *((unsigned int *)t112) = 1;
    *((unsigned int *)t117) = 1;
    goto LAB226;

LAB227:    *((unsigned int *)t148) = 1;
    goto LAB230;

LAB229:    t126 = (t148 + 4);
    *((unsigned int *)t148) = 1;
    *((unsigned int *)t126) = 1;
    goto LAB230;

LAB231:    t158 = *((unsigned int *)t149);
    t159 = *((unsigned int *)t146);
    *((unsigned int *)t149) = (t158 | t159);
    t147 = (t104 + 4);
    t160 = (t148 + 4);
    t161 = *((unsigned int *)t104);
    t162 = (~(t161));
    t163 = *((unsigned int *)t147);
    t164 = (~(t163));
    t165 = *((unsigned int *)t148);
    t166 = (~(t165));
    t167 = *((unsigned int *)t160);
    t168 = (~(t167));
    t135 = (t162 & t164);
    t169 = (t166 & t168);
    t170 = (~(t135));
    t171 = (~(t169));
    t172 = *((unsigned int *)t146);
    *((unsigned int *)t146) = (t172 & t170);
    t173 = *((unsigned int *)t146);
    *((unsigned int *)t146) = (t173 & t171);
    t174 = *((unsigned int *)t149);
    *((unsigned int *)t149) = (t174 & t170);
    t175 = *((unsigned int *)t149);
    *((unsigned int *)t149) = (t175 & t171);
    goto LAB233;

LAB234:    xsi_set_current_line(111, ng0);

LAB237:    xsi_set_current_line(112, ng0);
    t182 = ((char*)((ng9)));
    t183 = (t0 + 6024);
    xsi_vlogvar_assign_value(t183, t182, 0, 0, 2);
    goto LAB236;

LAB240:    t24 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB241;

LAB242:    xsi_set_current_line(115, ng0);

LAB245:    xsi_set_current_line(116, ng0);
    t26 = ((char*)((ng10)));
    t27 = (t0 + 6024);
    xsi_vlogvar_assign_value(t27, t26, 0, 0, 2);
    xsi_set_current_line(117, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4904);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 25);
    goto LAB244;

LAB248:    xsi_set_current_line(125, ng0);

LAB259:    xsi_set_current_line(126, ng0);
    t23 = ((char*)((ng9)));
    t24 = (t0 + 4744);
    xsi_vlogvar_assign_value(t24, t23, 0, 0, 4);
    xsi_set_current_line(127, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 6024);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    goto LAB258;

LAB250:    xsi_set_current_line(130, ng0);

LAB260:    xsi_set_current_line(131, ng0);
    t3 = ((char*)((ng12)));
    t5 = (t0 + 4744);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    xsi_set_current_line(132, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 6024);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    goto LAB258;

LAB252:    xsi_set_current_line(135, ng0);

LAB261:    xsi_set_current_line(136, ng0);
    t3 = ((char*)((ng13)));
    t5 = (t0 + 4744);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    xsi_set_current_line(137, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 6024);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    goto LAB258;

LAB254:    xsi_set_current_line(140, ng0);

LAB262:    xsi_set_current_line(141, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 5064);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 28);
    xsi_set_current_line(142, ng0);
    t2 = ((char*)((ng11)));
    t3 = (t0 + 6024);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    goto LAB258;

LAB266:    t26 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB267;

LAB268:    *((unsigned int *)t22) = 1;
    goto LAB271;

LAB270:    t33 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t33) = 1;
    goto LAB271;

LAB272:    t35 = (t0 + 5384);
    t36 = (t35 + 56U);
    t44 = *((char **)t36);
    memset(t43, 0, 8);
    t45 = (t43 + 4);
    t46 = (t44 + 4);
    t41 = *((unsigned int *)t44);
    t42 = (t41 >> 2);
    *((unsigned int *)t43) = t42;
    t49 = *((unsigned int *)t46);
    t50 = (t49 >> 2);
    *((unsigned int *)t45) = t50;
    t51 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t51 & 3U);
    t52 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t52 & 3U);
    t47 = ((char*)((ng11)));
    memset(t55, 0, 8);
    t48 = (t43 + 4);
    t56 = (t47 + 4);
    t53 = *((unsigned int *)t43);
    t54 = *((unsigned int *)t47);
    t58 = (t53 ^ t54);
    t59 = *((unsigned int *)t48);
    t60 = *((unsigned int *)t56);
    t61 = (t59 ^ t60);
    t62 = (t58 | t61);
    t63 = *((unsigned int *)t48);
    t64 = *((unsigned int *)t56);
    t65 = (t63 | t64);
    t66 = (~(t65));
    t67 = (t62 & t66);
    if (t67 != 0)
        goto LAB278;

LAB275:    if (t65 != 0)
        goto LAB277;

LAB276:    *((unsigned int *)t55) = 1;

LAB278:    memset(t71, 0, 8);
    t70 = (t55 + 4);
    t68 = *((unsigned int *)t70);
    t69 = (~(t68));
    t73 = *((unsigned int *)t55);
    t74 = (t73 & t69);
    t75 = (t74 & 1U);
    if (t75 != 0)
        goto LAB279;

LAB280:    if (*((unsigned int *)t70) != 0)
        goto LAB281;

LAB282:    t76 = *((unsigned int *)t22);
    t77 = *((unsigned int *)t71);
    t80 = (t76 | t77);
    *((unsigned int *)t88) = t80;
    t78 = (t22 + 4);
    t79 = (t71 + 4);
    t84 = (t88 + 4);
    t81 = *((unsigned int *)t78);
    t82 = *((unsigned int *)t79);
    t83 = (t81 | t82);
    *((unsigned int *)t84) = t83;
    t91 = *((unsigned int *)t84);
    t92 = (t91 != 0);
    if (t92 == 1)
        goto LAB283;

LAB284:
LAB285:    goto LAB274;

LAB277:    t57 = (t55 + 4);
    *((unsigned int *)t55) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB278;

LAB279:    *((unsigned int *)t71) = 1;
    goto LAB282;

LAB281:    t72 = (t71 + 4);
    *((unsigned int *)t71) = 1;
    *((unsigned int *)t72) = 1;
    goto LAB282;

LAB283:    t93 = *((unsigned int *)t88);
    t94 = *((unsigned int *)t84);
    *((unsigned int *)t88) = (t93 | t94);
    t85 = (t22 + 4);
    t86 = (t71 + 4);
    t95 = *((unsigned int *)t85);
    t96 = (~(t95));
    t97 = *((unsigned int *)t22);
    t131 = (t97 & t96);
    t98 = *((unsigned int *)t86);
    t99 = (~(t98));
    t100 = *((unsigned int *)t71);
    t135 = (t100 & t99);
    t101 = (~(t131));
    t102 = (~(t135));
    t106 = *((unsigned int *)t84);
    *((unsigned int *)t84) = (t106 & t101);
    t107 = *((unsigned int *)t84);
    *((unsigned int *)t84) = (t107 & t102);
    goto LAB285;

LAB286:    xsi_set_current_line(151, ng0);

LAB289:    xsi_set_current_line(152, ng0);
    t89 = ((char*)((ng1)));
    t90 = (t0 + 4744);
    xsi_vlogvar_assign_value(t90, t89, 0, 0, 4);
    xsi_set_current_line(153, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 6024);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    goto LAB288;

LAB293:    t27 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB294;

LAB295:    xsi_set_current_line(158, ng0);

LAB298:    xsi_set_current_line(159, ng0);
    t34 = ((char*)((ng14)));
    t35 = (t0 + 4744);
    xsi_vlogvar_assign_value(t35, t34, 0, 0, 4);
    goto LAB297;

LAB301:    t27 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB302;

LAB303:    xsi_set_current_line(162, ng0);

LAB306:    xsi_set_current_line(163, ng0);
    t34 = ((char*)((ng15)));
    t35 = (t0 + 4744);
    xsi_vlogvar_assign_value(t35, t34, 0, 0, 4);
    goto LAB305;

LAB308:    *((unsigned int *)t8) = 1;
    goto LAB310;

LAB309:    t25 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t25) = 1;
    goto LAB310;

LAB311:    xsi_set_current_line(166, ng0);

LAB314:    xsi_set_current_line(167, ng0);
    t27 = ((char*)((ng10)));
    t33 = (t0 + 6024);
    xsi_vlogvar_assign_value(t33, t27, 0, 0, 2);
    goto LAB313;

LAB316:    *((unsigned int *)t8) = 1;
    goto LAB318;

LAB317:    t25 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t25) = 1;
    goto LAB318;

LAB319:    *((unsigned int *)t22) = 1;
    goto LAB322;

LAB321:    t27 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB322;

LAB323:    t34 = (t0 + 4744);
    t35 = (t34 + 56U);
    t36 = *((char **)t35);
    t44 = ((char*)((ng14)));
    memset(t43, 0, 8);
    t45 = (t36 + 4);
    t46 = (t44 + 4);
    t40 = *((unsigned int *)t36);
    t41 = *((unsigned int *)t44);
    t42 = (t40 ^ t41);
    t49 = *((unsigned int *)t45);
    t50 = *((unsigned int *)t46);
    t51 = (t49 ^ t50);
    t52 = (t42 | t51);
    t53 = *((unsigned int *)t45);
    t54 = *((unsigned int *)t46);
    t58 = (t53 | t54);
    t59 = (~(t58));
    t60 = (t52 & t59);
    if (t60 != 0)
        goto LAB327;

LAB326:    if (t58 != 0)
        goto LAB328;

LAB329:    memset(t55, 0, 8);
    t48 = (t43 + 4);
    t61 = *((unsigned int *)t48);
    t62 = (~(t61));
    t63 = *((unsigned int *)t43);
    t64 = (t63 & t62);
    t65 = (t64 & 1U);
    if (t65 != 0)
        goto LAB330;

LAB331:    if (*((unsigned int *)t48) != 0)
        goto LAB332;

LAB333:    t66 = *((unsigned int *)t22);
    t67 = *((unsigned int *)t55);
    t68 = (t66 & t67);
    *((unsigned int *)t71) = t68;
    t57 = (t22 + 4);
    t70 = (t55 + 4);
    t72 = (t71 + 4);
    t69 = *((unsigned int *)t57);
    t73 = *((unsigned int *)t70);
    t74 = (t69 | t73);
    *((unsigned int *)t72) = t74;
    t75 = *((unsigned int *)t72);
    t76 = (t75 != 0);
    if (t76 == 1)
        goto LAB334;

LAB335:
LAB336:    goto LAB325;

LAB327:    *((unsigned int *)t43) = 1;
    goto LAB329;

LAB328:    t47 = (t43 + 4);
    *((unsigned int *)t43) = 1;
    *((unsigned int *)t47) = 1;
    goto LAB329;

LAB330:    *((unsigned int *)t55) = 1;
    goto LAB333;

LAB332:    t56 = (t55 + 4);
    *((unsigned int *)t55) = 1;
    *((unsigned int *)t56) = 1;
    goto LAB333;

LAB334:    t77 = *((unsigned int *)t71);
    t80 = *((unsigned int *)t72);
    *((unsigned int *)t71) = (t77 | t80);
    t78 = (t22 + 4);
    t79 = (t55 + 4);
    t81 = *((unsigned int *)t22);
    t82 = (~(t81));
    t83 = *((unsigned int *)t78);
    t91 = (~(t83));
    t92 = *((unsigned int *)t55);
    t93 = (~(t92));
    t94 = *((unsigned int *)t79);
    t95 = (~(t94));
    t29 = (t82 & t91);
    t131 = (t93 & t95);
    t96 = (~(t29));
    t97 = (~(t131));
    t98 = *((unsigned int *)t72);
    *((unsigned int *)t72) = (t98 & t96);
    t99 = *((unsigned int *)t72);
    *((unsigned int *)t72) = (t99 & t97);
    t100 = *((unsigned int *)t71);
    *((unsigned int *)t71) = (t100 & t96);
    t101 = *((unsigned int *)t71);
    *((unsigned int *)t71) = (t101 & t97);
    goto LAB336;

LAB337:    *((unsigned int *)t88) = 1;
    goto LAB340;

LAB339:    t85 = (t88 + 4);
    *((unsigned int *)t88) = 1;
    *((unsigned int *)t85) = 1;
    goto LAB340;

LAB341:    t87 = (t0 + 5384);
    t89 = (t87 + 56U);
    t90 = *((char **)t89);
    memset(t104, 0, 8);
    t103 = (t104 + 4);
    t105 = (t90 + 4);
    t115 = *((unsigned int *)t90);
    t119 = (t115 >> 2);
    *((unsigned int *)t104) = t119;
    t120 = *((unsigned int *)t105);
    t121 = (t120 >> 2);
    *((unsigned int *)t103) = t121;
    t122 = *((unsigned int *)t104);
    *((unsigned int *)t104) = (t122 & 3U);
    t123 = *((unsigned int *)t103);
    *((unsigned int *)t103) = (t123 & 3U);
    t111 = ((char*)((ng9)));
    memset(t112, 0, 8);
    t116 = (t104 + 4);
    t117 = (t111 + 4);
    t124 = *((unsigned int *)t104);
    t125 = *((unsigned int *)t111);
    t128 = (t124 ^ t125);
    t129 = *((unsigned int *)t116);
    t130 = *((unsigned int *)t117);
    t132 = (t129 ^ t130);
    t133 = (t128 | t132);
    t134 = *((unsigned int *)t116);
    t136 = *((unsigned int *)t117);
    t137 = (t134 | t136);
    t138 = (~(t137));
    t139 = (t133 & t138);
    if (t139 != 0)
        goto LAB347;

LAB344:    if (t137 != 0)
        goto LAB346;

LAB345:    *((unsigned int *)t112) = 1;

LAB347:    memset(t148, 0, 8);
    t126 = (t112 + 4);
    t141 = *((unsigned int *)t126);
    t142 = (~(t141));
    t143 = *((unsigned int *)t112);
    t144 = (t143 & t142);
    t145 = (t144 & 1U);
    if (t145 != 0)
        goto LAB348;

LAB349:    if (*((unsigned int *)t126) != 0)
        goto LAB350;

LAB351:    t150 = *((unsigned int *)t88);
    t151 = *((unsigned int *)t148);
    t152 = (t150 & t151);
    *((unsigned int *)t149) = t152;
    t140 = (t88 + 4);
    t146 = (t148 + 4);
    t147 = (t149 + 4);
    t153 = *((unsigned int *)t140);
    t154 = *((unsigned int *)t146);
    t155 = (t153 | t154);
    *((unsigned int *)t147) = t155;
    t156 = *((unsigned int *)t147);
    t157 = (t156 != 0);
    if (t157 == 1)
        goto LAB352;

LAB353:
LAB354:    goto LAB343;

LAB346:    t118 = (t112 + 4);
    *((unsigned int *)t112) = 1;
    *((unsigned int *)t118) = 1;
    goto LAB347;

LAB348:    *((unsigned int *)t148) = 1;
    goto LAB351;

LAB350:    t127 = (t148 + 4);
    *((unsigned int *)t148) = 1;
    *((unsigned int *)t127) = 1;
    goto LAB351;

LAB352:    t158 = *((unsigned int *)t149);
    t159 = *((unsigned int *)t147);
    *((unsigned int *)t149) = (t158 | t159);
    t160 = (t88 + 4);
    t176 = (t148 + 4);
    t161 = *((unsigned int *)t88);
    t162 = (~(t161));
    t163 = *((unsigned int *)t160);
    t164 = (~(t163));
    t165 = *((unsigned int *)t148);
    t166 = (~(t165));
    t167 = *((unsigned int *)t176);
    t168 = (~(t167));
    t135 = (t162 & t164);
    t169 = (t166 & t168);
    t170 = (~(t135));
    t171 = (~(t169));
    t172 = *((unsigned int *)t147);
    *((unsigned int *)t147) = (t172 & t170);
    t173 = *((unsigned int *)t147);
    *((unsigned int *)t147) = (t173 & t171);
    t174 = *((unsigned int *)t149);
    *((unsigned int *)t149) = (t174 & t170);
    t175 = *((unsigned int *)t149);
    *((unsigned int *)t149) = (t175 & t171);
    goto LAB354;

LAB355:    xsi_set_current_line(170, ng0);

LAB358:    xsi_set_current_line(171, ng0);
    t183 = (t0 + 5064);
    t184 = (t183 + 56U);
    t185 = *((char **)t184);
    t186 = ((char*)((ng3)));
    memset(t187, 0, 8);
    xsi_vlog_unsigned_add(t187, 32, t185, 28, t186, 32);
    t188 = (t0 + 5064);
    xsi_vlogvar_assign_value(t188, t187, 0, 0, 28);
    xsi_set_current_line(172, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 4744);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    goto LAB357;

}


extern void work_m_00000000003200922173_4119678636_init()
{
	static char *pe[] = {(void *)Initial_53_0,(void *)Always_57_1};
	xsi_register_didat("work_m_00000000003200922173_4119678636", "isim/TestingJunction_isim_beh.exe.sim/work/m_00000000003200922173_4119678636.didat");
	xsi_register_executes(pe);
}
