
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name TeamFury -dir "C:/Users/jnwad_000/Documents/School/Project Lab 1/TeamFury/planAhead_run_3" -part xc3s100ecp132-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/jnwad_000/Documents/School/Project Lab 1/TeamFury/MainModule.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/jnwad_000/Documents/School/Project Lab 1/TeamFury} }
set_property target_constrs_file "ConstraintsFile.ucf" [current_fileset -constrset]
add_files [list {ConstraintsFile.ucf}] -fileset [get_property constrset [current_run]]
link_design
