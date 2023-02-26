project "zlib"
	kind "StaticLib"
	language "C"
	staticruntime "Off"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"*.h",
		"*.c"
	}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"
		symbols "Off"

	filter "configurations:Dist"
		runtime "Release"
		optimize "On"
		symbols "Off"

	filter { "configurations:Release", "system:windows" }
		flags
		{
			"LinkTimeOptimization"
		}

	filter { "configurations:Dist", "system:windows" }
		flags
		{
			"LinkTimeOptimization"
		}
