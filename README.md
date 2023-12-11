# RuntimeVideoRecorder Documentation

## How to use Runtime Video Recorder (Unreal plugin)

Go to any Blueprint, grab reference to RuntimeVideoRecorder and call Start/Stop recording. You can provide desired width, height and fps if needed. Example:

![bp_nodes](https://github.com/UnrealSolutionsLtd/RuntimeVideoRecorderLibs/assets/2128080/cf886712-fa30-4579-8f22-48d9458dc2ce)


## Libraries

This repository also provides `x264` and `l-smash` static libraries for popular platforms (Windows, Linux, Mac and Android). If you have corresponding license for x264 and willing to fully open-source your Unreal project code you can probably use x264. However, this is not a legal advice, ask experts.

How to use:
1) Buy & dwnload RuntimeVideoRecorder from Unreal Marketplace: https://www.unrealengine.com/marketplace/en-US/product/runtime-video-recorder/
2) Go to `<ENGINE_DIR>/Plugins/Marketplace/RuntimeVideoRecorder/Source/ThirdParty/RuntimeVideoRecorderLibrary` and paste all files from the repository so it looks like this:

![image](https://github.com/UnrealSolutionsLtd/RuntimeVideoRecorderLibs/assets/2128080/92b1be72-38f6-4d0a-8166-7edd6a101391)

3) Ready to go!


