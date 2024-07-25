function(target_set_warnings TARGET ENABLE ENABLE_AS_ERRORS)
    if(NOT ${ENABLED})
        message(STATUS "Warnings disabled for: ${TARGET}")
        return()
    endif()

    message(STATUS "Warnings Active for ${TARGET}: ${ENABLE}")
    message(STATUS "Warnings as Errors ${TARGET}: ${ENABLE_AS_ERRORS}")


    set(MSVC_WARNINGS
        # Baseline
        /W4 # Baseline reasonable warnings
        /permissive- # standards conformance mode for MSVC compiler
        # C and C++ Warnings
        /w14242 # conversion from 'type1' to 'type1', possible loss of data
        /w14254 # 'operator': conversion from 't1:field_bits' to 't2:field_bits'
        /w14287 # unsigned/negative constant mismatch
        /w14296 # expression is always 'boolean_value'
        /w14311 # pointer truncation from 'type1' to 'type2'
        /w44062 # enumerator in a switch of enum 'enumeration' is not handled
        /w44242 # conversion from 'type1' to 'type2', possible loss of data
        /w14826 # Conversion from 'type1' to 'type_2' is sign-extended
        /w14905 # wide string literal cast to 'LPSTR'
        /w14906 # string literal cast to 'LPWSTR'
        # C++ Only
        /w14263 # function does not override any base class virtual function
        /w14265 # class has virtual functions, but destructor is not virtual
        /w14640 # Enable warning on thread un-safe static member initialization
        /w14928 # more than one implicitly user-defined conversion
        /we4289 # nonstandard extension used: 'variable'
    )

    set(CLANG_WARNINGS
        -Wall
        -Wextra
        -Wpedantic
    )

    set(GCC_WARNINGS ${CLANG_WARNINGS})

    if(${ENABLE_AS_ERRORS})
        set(MSVC_WARNINGS ${MSVC_WARNINGS} /WX)
        set(CLANG_WARNINGS ${CLANG_WARNINGS} -Werror)
        set(GCC_WARNINGS ${GCC_WARNINGS} -Werror)
    endif()

    if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
        set(WARNINGS ${MSVC_WARNINGS})
    elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
        set(WARNINGS ${CLANG_WARNINGS})
    elseif(CMAKE_CXX_COMPILER_ID MATCHES "GCC")
        set(WARNINGS ${GCC_WARNINGS})
    endif()

    target_compile_options(${TARGET} PRIVATE ${WARNINGS})
    message(STATUS ${WARNINGS})
endfunction()