-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity csc_enc_csc_enc_Pipeline_VITIS_LOOP_83_2 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    N : IN STD_LOGIC_VECTOR (31 downto 0);
    trunc_ln2 : IN STD_LOGIC_VECTOR (13 downto 0);
    trunc_ln81_2 : IN STD_LOGIC_VECTOR (13 downto 0);
    a_address0 : OUT STD_LOGIC_VECTOR (13 downto 0);
    a_ce0 : OUT STD_LOGIC;
    a_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    data_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    data_ce0 : OUT STD_LOGIC;
    data_we0 : OUT STD_LOGIC;
    data_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    trunc_ln : IN STD_LOGIC_VECTOR (11 downto 0);
    nnz_1_out_i : IN STD_LOGIC_VECTOR (31 downto 0);
    nnz_1_out_o : OUT STD_LOGIC_VECTOR (31 downto 0);
    nnz_1_out_o_ap_vld : OUT STD_LOGIC;
    grp_fu_139_p_din0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_139_p_dout0 : IN STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_139_p_ce : OUT STD_LOGIC;
    grp_fu_423_p_din0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_423_p_dout0 : IN STD_LOGIC_VECTOR (63 downto 0);
    grp_fu_423_p_ce : OUT STD_LOGIC;
    grp_fu_426_p_din0 : OUT STD_LOGIC_VECTOR (63 downto 0);
    grp_fu_426_p_din1 : OUT STD_LOGIC_VECTOR (63 downto 0);
    grp_fu_426_p_opcode : OUT STD_LOGIC_VECTOR (4 downto 0);
    grp_fu_426_p_dout0 : IN STD_LOGIC_VECTOR (0 downto 0);
    grp_fu_426_p_ce : OUT STD_LOGIC );
end;


architecture behav of csc_enc_csc_enc_Pipeline_VITIS_LOOP_83_2 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_pp0_stage1 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv14_0 : STD_LOGIC_VECTOR (13 downto 0) := "00000000000000";
    constant ap_const_lv64_3EB0C6F7A0B5ED8D : STD_LOGIC_VECTOR (63 downto 0) := "0011111010110000110001101111011110100000101101011110110110001101";
    constant ap_const_lv32_34 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110100";
    constant ap_const_lv32_3E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111110";
    constant ap_const_lv11_7FF : STD_LOGIC_VECTOR (10 downto 0) := "11111111111";
    constant ap_const_lv52_0 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    constant ap_const_lv5_2 : STD_LOGIC_VECTOR (4 downto 0) := "00010";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage1 : signal is "none";
    signal ap_block_state2_pp0_stage1_iter0 : BOOLEAN;
    signal ap_block_state4_pp0_stage1_iter1 : BOOLEAN;
    signal ap_block_state6_pp0_stage1_iter2 : BOOLEAN;
    signal ap_block_state8_pp0_stage1_iter3 : BOOLEAN;
    signal ap_block_pp0_stage1_subdone : BOOLEAN;
    signal icmp_ln83_fu_146_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage1 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state7_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal j_1_reg_314 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage1_11001 : BOOLEAN;
    signal j_1_reg_314_pp0_iter1_reg : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln83_reg_319 : STD_LOGIC_VECTOR (0 downto 0);
    signal num_reg_328 : STD_LOGIC_VECTOR (31 downto 0);
    signal num_reg_328_pp0_iter2_reg : STD_LOGIC_VECTOR (31 downto 0);
    signal bitcast_ln356_fu_201_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln85_fu_224_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln85_reg_343 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln85_1_fu_230_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln85_1_reg_348 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln85_fu_240_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln85_reg_353 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln85_reg_353_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln87_fu_259_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal add_ln87_reg_357 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_enable_reg_pp0_iter0_reg : STD_LOGIC := '0';
    signal zext_ln84_fu_170_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage1 : BOOLEAN;
    signal zext_ln86_fu_250_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal zext_ln87_fu_276_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal nnz_fu_264_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal phi_mul_fu_54 : STD_LOGIC_VECTOR (13 downto 0);
    signal add_ln84_1_fu_160_p2 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal j_fu_58 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln83_fu_151_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln84_fu_165_p2 : STD_LOGIC_VECTOR (13 downto 0);
    signal data_V_fu_185_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln368_fu_189_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal p_Result_s_fu_193_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bitcast_ln85_fu_206_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_s_fu_210_p4 : STD_LOGIC_VECTOR (10 downto 0);
    signal trunc_ln85_fu_220_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal or_ln85_fu_236_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln86_fu_255_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_block_pp0_stage1_00001 : BOOLEAN;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_idle_pp0_1to3 : STD_LOGIC;
    signal ap_done_pending_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component csc_enc_sitofp_32ns_32_4_no_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component csc_enc_fpext_32ns_64_2_no_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component csc_enc_dcmp_64ns_64ns_1_2_no_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (63 downto 0);
        din1 : IN STD_LOGIC_VECTOR (63 downto 0);
        ce : IN STD_LOGIC;
        opcode : IN STD_LOGIC_VECTOR (4 downto 0);
        dout : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;


    component csc_enc_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    flow_control_loop_pipe_sequential_init_U : component csc_enc_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage1,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then 
                    ap_enable_reg_pp0_iter0_reg <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage1)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                end if; 
            end if;
        end if;
    end process;


    j_fu_58_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                j_fu_58 <= ap_const_lv32_0;
            elsif (((icmp_ln83_fu_146_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                j_fu_58 <= add_ln83_fu_151_p2;
            end if; 
        end if;
    end process;

    phi_mul_fu_54_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                phi_mul_fu_54 <= ap_const_lv14_0;
            elsif (((icmp_ln83_fu_146_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                phi_mul_fu_54 <= add_ln84_1_fu_160_p2;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln85_reg_353) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                add_ln87_reg_357 <= add_ln87_fu_259_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                and_ln85_reg_353 <= and_ln85_fu_240_p2;
                and_ln85_reg_353_pp0_iter3_reg <= and_ln85_reg_353;
                num_reg_328_pp0_iter2_reg <= num_reg_328;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
                icmp_ln83_reg_319 <= icmp_ln83_fu_146_p2;
                icmp_ln85_1_reg_348 <= icmp_ln85_1_fu_230_p2;
                icmp_ln85_reg_343 <= icmp_ln85_fu_224_p2;
                j_1_reg_314 <= j_fu_58;
                j_1_reg_314_pp0_iter1_reg <= j_1_reg_314;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln83_reg_319 = ap_const_lv1_0))) then
                num_reg_328 <= a_q0;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_block_pp0_stage1_subdone, ap_block_pp0_stage0_subdone, ap_idle_pp0_1to3, ap_done_pending_pp0, ap_start_int)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((ap_start_int = ap_const_logic_0) and (ap_done_pending_pp0 = ap_const_logic_0) and (ap_idle_pp0_1to3 = ap_const_logic_1))) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage1 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage1_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    a_address0 <= zext_ln84_fu_170_p1(14 - 1 downto 0);

    a_ce0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            a_ce0 <= ap_const_logic_1;
        else 
            a_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    add_ln83_fu_151_p2 <= std_logic_vector(unsigned(j_fu_58) + unsigned(ap_const_lv32_1));
    add_ln84_1_fu_160_p2 <= std_logic_vector(unsigned(phi_mul_fu_54) + unsigned(trunc_ln2));
    add_ln84_fu_165_p2 <= std_logic_vector(unsigned(phi_mul_fu_54) + unsigned(trunc_ln81_2));
    add_ln87_fu_259_p2 <= std_logic_vector(unsigned(trunc_ln86_fu_255_p1) + unsigned(trunc_ln));
    and_ln85_fu_240_p2 <= (or_ln85_fu_236_p2 and grp_fu_426_p_dout0);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
    ap_CS_fsm_pp0_stage1 <= ap_CS_fsm(1);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_00001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage1_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage1_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state6_pp0_stage1_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state7_pp0_stage0_iter3 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state8_pp0_stage1_iter3 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage1_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_subdone, icmp_ln83_fu_146_p2)
    begin
        if (((icmp_ln83_fu_146_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            ap_condition_exit_pp0_iter0_stage1 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage1 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;


    ap_done_pending_pp0_assign_proc : process(ap_loop_exit_ready, ap_loop_exit_ready_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (not(((ap_loop_exit_ready = ap_const_logic_0) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_0) and (ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_0)))) then 
            ap_done_pending_pp0 <= ap_const_logic_1;
        else 
            ap_done_pending_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_enable_reg_pp0_iter0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0_reg, ap_start_int)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then 
            ap_enable_reg_pp0_iter0 <= ap_start_int;
        else 
            ap_enable_reg_pp0_iter0 <= ap_enable_reg_pp0_iter0_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3)
    begin
        if (((ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_1to3_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3)
    begin
        if (((ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then 
            ap_idle_pp0_1to3 <= ap_const_logic_1;
        else 
            ap_idle_pp0_1to3 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage1;

    ap_ready_int_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;

    bitcast_ln356_fu_201_p1 <= p_Result_s_fu_193_p3;
    bitcast_ln85_fu_206_p1 <= grp_fu_423_p_dout0;
    data_V_fu_185_p1 <= a_q0;

    data_address0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter3, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1, zext_ln86_fu_250_p1, ap_block_pp0_stage0, zext_ln87_fu_276_p1)
    begin
        if ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                data_address0 <= zext_ln87_fu_276_p1(12 - 1 downto 0);
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                data_address0 <= zext_ln86_fu_250_p1(12 - 1 downto 0);
            else 
                data_address0 <= "XXXXXXXXXXXX";
            end if;
        else 
            data_address0 <= "XXXXXXXXXXXX";
        end if; 
    end process;


    data_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter3, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage0_11001, ap_block_pp0_stage1_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1)))) then 
            data_ce0 <= ap_const_logic_1;
        else 
            data_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    data_d0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter3, ap_CS_fsm_pp0_stage1, num_reg_328_pp0_iter2_reg, ap_block_pp0_stage1, ap_block_pp0_stage0, grp_fu_139_p_dout0)
    begin
        if ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                data_d0 <= grp_fu_139_p_dout0;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                data_d0 <= num_reg_328_pp0_iter2_reg;
            else 
                data_d0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            data_d0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    data_we0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter3, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage0_11001, ap_block_pp0_stage1_11001, and_ln85_reg_353, and_ln85_reg_353_pp0_iter3_reg)
    begin
        if ((((ap_const_lv1_1 = and_ln85_reg_353_pp0_iter3_reg) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1)) or ((ap_const_lv1_1 = and_ln85_reg_353) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            data_we0 <= ap_const_logic_1;
        else 
            data_we0 <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_139_p_ce <= ap_const_logic_1;
    grp_fu_139_p_din0 <= j_1_reg_314_pp0_iter1_reg;
    grp_fu_423_p_ce <= ap_const_logic_1;
    grp_fu_423_p_din0 <= bitcast_ln356_fu_201_p1;
    grp_fu_426_p_ce <= ap_const_logic_1;
    grp_fu_426_p_din0 <= grp_fu_423_p_dout0;
    grp_fu_426_p_din1 <= ap_const_lv64_3EB0C6F7A0B5ED8D;
    grp_fu_426_p_opcode <= ap_const_lv5_2;
    icmp_ln83_fu_146_p2 <= "1" when (j_fu_58 = N) else "0";
    icmp_ln85_1_fu_230_p2 <= "1" when (trunc_ln85_fu_220_p1 = ap_const_lv52_0) else "0";
    icmp_ln85_fu_224_p2 <= "0" when (tmp_s_fu_210_p4 = ap_const_lv11_7FF) else "1";

    nnz_1_out_o_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter3, nnz_1_out_i, and_ln85_reg_353, ap_block_pp0_stage0, nnz_fu_264_p2)
    begin
        if (((ap_const_lv1_1 = and_ln85_reg_353) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            nnz_1_out_o <= nnz_fu_264_p2;
        else 
            nnz_1_out_o <= nnz_1_out_i;
        end if; 
    end process;


    nnz_1_out_o_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter3, ap_block_pp0_stage0_11001, and_ln85_reg_353)
    begin
        if (((ap_const_lv1_1 = and_ln85_reg_353) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            nnz_1_out_o_ap_vld <= ap_const_logic_1;
        else 
            nnz_1_out_o_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    nnz_fu_264_p2 <= std_logic_vector(unsigned(nnz_1_out_i) + unsigned(ap_const_lv32_1));
    or_ln85_fu_236_p2 <= (icmp_ln85_reg_343 or icmp_ln85_1_reg_348);
    p_Result_s_fu_193_p3 <= (ap_const_lv1_0 & trunc_ln368_fu_189_p1);
    tmp_s_fu_210_p4 <= bitcast_ln85_fu_206_p1(62 downto 52);
    trunc_ln368_fu_189_p1 <= data_V_fu_185_p1(31 - 1 downto 0);
    trunc_ln85_fu_220_p1 <= bitcast_ln85_fu_206_p1(52 - 1 downto 0);
    trunc_ln86_fu_255_p1 <= nnz_1_out_i(12 - 1 downto 0);
    zext_ln84_fu_170_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln84_fu_165_p2),64));
    zext_ln86_fu_250_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(nnz_1_out_i),64));
    zext_ln87_fu_276_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln87_reg_357),64));
end behav;
