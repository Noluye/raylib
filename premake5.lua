-- written by heyulong
-- ref: https://github.com/raylib-extras/game-premake/blob/main/premake5.lua
project "raylib"
	language "C"
	kind "StaticLib"
	staticruntime "On"
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	defines{
		"PLATFORM_DESKTOP",
		"GRAPHICS_API_OPENGL_43"
	}

	includedirs { "src", "src/external/glfw/include"}

	files {"src/*.h", "src/*.c"}

	filter "action:vs*"
		defines{"_WINSOCK_DEPRECATED_NO_WARNINGS", "_CRT_SECURE_NO_WARNINGS"}
		characterset ("MBCS")
	
	filter "system:windows"
		defines{"_WIN32"}
		links {"winmm", "kernel32", "opengl32", "gdi32"}
		
	filter "system:linux"
		links {"pthread", "GL", "m", "dl", "rt", "X11"}
		
	filter{}