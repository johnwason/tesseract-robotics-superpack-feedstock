set CXXFLAGS="%CXXFLAGS% -D_ENABLE_EXTENDED_ALIGNED_STORAGE=1"

call colcon build --merge-install --install-base="%PREFIX%\opt\tesseract_robotics" ^
   --cmake-args -DCMAKE_BUILD_TYPE=Release ^
   -DBUILD_SHARED_LIBS=ON ^
   -DUSE_MSVC_RUNTIME_LIBRARY_DLL=ON ^
   -DBUILD_IPOPT=OFF ^
   -DBUILD_SNOPT=OFF ^
   -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
   -DTESSERACT_ENABLE_CLANG_TIDY=OFF ^
   -DTESSERACT_ENABLE_CODE_COVERAGE=OFF

setlocal EnableDelayedExpansion

:: Copy the [de]activate scripts to %PREFIX%\etc\conda\[de]activate.d.
:: This will allow them to be run on environment activation.
for %%F in (activate deactivate) DO (
    if not exist %PREFIX%\etc\conda\%%F.d mkdir %PREFIX%\etc\conda\%%F.d
    copy %RECIPE_DIR%\%%F.bat %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.bat
)