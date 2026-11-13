help([[
  This module loads libraries required for building and running UFS Weather Model 
  on the NOAA RDHPC machine Gaea C7 using Intel oneAPI-2025.3.1.
]])

whatis([===[Loads libraries needed for building the UFS Weather Model on Gaea C6]===])

prepend_path("MODULEPATH", "/ncrc/proj/oar-reanalysis/usw/c7/modulefiles")
prepend_path("MODULEPATH", "/ncrc/proj/epic/spack-stack/c7/spack-stack-2.1.1/envs/ue-oneapi-2025.3.1/modules/Core")

stack_oneapi_ver=os.getenv("stack_oneapi_ver") or "2025.3.1"
load(pathJoin("stack-intel-oneapi-compilers", stack_oneapi_ver))

stack_cray_mpich_ver=os.getenv("stack_cray_mpich_ver") or "9.2.0"
load(pathJoin("cray-mpich", stack_cray_mpich_ver))
load(pathJoin("stack-cray-mpich", stack_cray_mpich_ver))

load("python/3.11.11")

cmake_ver=os.getenv("cmake_ver") or "3.31.11"
load(pathJoin("cmake", cmake_ver))

load("ufs_common")
load("zlib/1.2.13")

nccmp_ver=os.getenv("nccmp_ver") or "1.9.0.1"
load(pathJoin("nccmp", nccmp_ver))

setenv("CC","mpicc")
setenv("CXX","mpicxx")
setenv("FC","mpifort")
setenv("CMAKE_Platform","gaeac7.oneapi")
