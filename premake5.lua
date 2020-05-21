workspace "OpenGL_Path_Tracer"
    architecture "x64"
    startproject "Path_Tracer"

    configurations {
        "Debug",
        "Release"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"


project "Path_Tracer"
    location "Path_Tracer"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
    
    files {
		"%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs {
        "%{prj.name}/src",
    }

    links {
        "Glad"
    }

    filter "system:windows"
        systemversion "latest"

        filter "configurations:Debug"
            defines "DEBUG"
            symbols "on"

        filter "configurations:Release"
            defines "RELEASE"
            optimize "on"

        filter "configurations:Dist"
            defines "DIST"
            optimize "on"