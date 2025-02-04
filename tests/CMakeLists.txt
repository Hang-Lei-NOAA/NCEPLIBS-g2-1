# This is the CMake file for the test directory in the NCEPLIBS-g2
# project.
#
# Ed Hartnett

# This is needed for macos to work on GitHub CI.
link_directories("/usr/local/lib")

add_executable(test_g2 test_g2.f90)
target_link_libraries(test_g2 g2_d ${PNG_LIBRARIES})
add_test(test_g2 test_g2)

add_executable(test_g2_encode test_g2_encode.f90)
target_link_libraries(test_g2_encode g2_d ${PNG_LIBRARIES})
add_test(test_g2_encode test_g2_encode)

add_executable(test_gridtemplates test_gridtemplates.f90)
target_link_libraries(test_gridtemplates g2_d ${PNG_LIBRARIES})
add_test(test_gridtemplates test_gridtemplates)

add_executable(test_drstemplates test_drstemplates.f90)
target_link_libraries(test_drstemplates g2_d ${PNG_LIBRARIES})
add_test(test_drstemplates test_drstemplates)

add_executable(test_params test_params.f90)
target_link_libraries(test_params g2_d ${PNG_LIBRARIES})
add_test(test_params test_params)

add_executable(test_params_ecmwf test_params_ecmwf.f90)
target_link_libraries(test_params_ecmwf g2_d ${PNG_LIBRARIES})
add_test(test_params_ecmwf test_params_ecmwf)

add_executable(test_pngpack test_pngpack.f90)
target_link_libraries(test_pngpack g2_d ${PNG_LIBRARIES})
add_test(test_pngpack test_pngpack)

add_executable(test_pdstemplates test_pdstemplates.f90)
target_link_libraries(test_pdstemplates g2_d)
add_test(test_pdstemplates test_pdstemplates)

add_executable(test_simpack test_simpack.f90)
target_link_libraries(test_simpack g2_4 ${PNG_LIBRARIES})
add_test(test_simpack test_simpack)

add_executable(test_gbytec test_gbytec.f90)
target_link_libraries(test_gbytec g2_4)
add_test(test_gbytec test_gbytec)

add_executable(test_gribcreate test_gribcreate.f90)
target_link_libraries(test_gribcreate g2_4)
add_test(test_gribcreate test_gribcreate)

add_executable(test_getfield test_getfield.f90)
target_link_libraries(test_getfield g2_4)
add_test(test_getfield test_getfield)

#add_executable(test_compack test_compack.f90)
#target_link_libraries(test_compack g2_d)
#add_test(test_compack test_compack)

#add_executable(test_jpcpack test_jpcpack.f90)
#target_link_libraries(test_jpcpack g2_d)
#add_test(test_jpcpack test_jpcpack)

add_executable(creategrib creategrib.f90)
target_link_libraries(creategrib g2_d)
add_test(creategrib creategrib)

add_executable(test_getgb2 test_getgb2.f90)
target_link_libraries(test_getgb2 g2_d)
add_test(test_getgb2 test_getgb2)

add_executable(test_getdim test_getdim.f90)
target_link_libraries(test_getdim g2_d)
add_test(test_getdim test_getdim)
