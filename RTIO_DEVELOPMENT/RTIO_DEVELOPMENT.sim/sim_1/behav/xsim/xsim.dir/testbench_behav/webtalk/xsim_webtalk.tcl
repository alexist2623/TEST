webtalk_init -webtalk_dir C:/M-labs/TEST/RTIO_DEVELOPMENT/RTIO_DEVELOPMENT.sim/sim_1/behav/xsim/xsim.dir/testbench_behav/webtalk/
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "Sun Jul 26 13:59:09 2020" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "XSIM v2019.2 (64-bit)" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "2708876" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "WIN64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "xsim_vivado" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "fb2a9511-9c3f-4db6-af60-6455dc646444" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "395c664dffea4885906cb80ad46cc47e" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "64" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Windows Server 2016 or Windows 10" -context "user_environment"
webtalk_add_data -client project -key os_release -value "major release  (build 9200)" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Core(TM) i5-8500 CPU @ 3.00GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "3000 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "8.000 GB" -context "user_environment"
webtalk_register_client -client xsim
webtalk_add_data -client xsim -key Command -value "xsim" -context "xsim\\command_line_options"
webtalk_add_data -client xsim -key trace_waveform -value "true" -context "xsim\\usage"
webtalk_add_data -client xsim -key runtime -value "200 ns" -context "xsim\\usage"
webtalk_add_data -client xsim -key iteration -value "0" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Time -value "0.03_sec" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Memory -value "6680_KB" -context "xsim\\usage"
webtalk_transmit -clientid 192414387 -regid "" -xml C:/M-labs/TEST/RTIO_DEVELOPMENT/RTIO_DEVELOPMENT.sim/sim_1/behav/xsim/xsim.dir/testbench_behav/webtalk/usage_statistics_ext_xsim.xml -html C:/M-labs/TEST/RTIO_DEVELOPMENT/RTIO_DEVELOPMENT.sim/sim_1/behav/xsim/xsim.dir/testbench_behav/webtalk/usage_statistics_ext_xsim.html -wdm C:/M-labs/TEST/RTIO_DEVELOPMENT/RTIO_DEVELOPMENT.sim/sim_1/behav/xsim/xsim.dir/testbench_behav/webtalk/usage_statistics_ext_xsim.wdm -intro "<H3>XSIM Usage Report</H3><BR>"
webtalk_terminate
