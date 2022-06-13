project "raylib"
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	-- ================================================================
	-- ref: https://github.com/raylib-extras/game-premake/blob/main/premake5.lua
	filter "configurations:Debug.DLL OR Release.DLL"
		kind "SharedLib"
		defines {"BUILD_LIBTYPE_SHARED"}
		
	filter "configurations:Debug OR Release OR Dist"
		kind "StaticLib"
		
	filter "action:vs*"
		defines{"_WINSOCK_DEPRECATED_NO_WARNINGS", "_CRT_SECURE_NO_WARNINGS"}
		characterset ("MBCS")
	
	filter "system:windows"
		defines{"_WIN32"}
		links {"winmm", "kernel32", "opengl32", "gdi32"}
		
	filter "system:linux"
		links {"pthread", "GL", "m", "dl", "rt", "X11"}
		
	filter{}
	
	defines{"PLATFORM_DESKTOP"}
	defines{"GRAPHICS_API_OPENGL_43"}
	--if (_OPTIONS["opengl43"]) then
		--defines{"GRAPHICS_API_OPENGL_43"}
	--else
		--defines{"GRAPHICS_API_OPENGL_33"}
	--end
	language "C"
	
	includedirs { "src", "src/external/glfw/include"}
	vpaths 
	{
		["Header Files"] = { "raylib/src/**.h"},
		["Source Files/*"] = {"raylib/src/**.c"},
	}
	files {"src/*.h", "src/*.c"}
	-- ================================================================
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
	filter "configurations:Release"
		runtime "Release"
		optimize "on"
	filter "configurations:Dist"
		runtime "Release"
		optimize "on"