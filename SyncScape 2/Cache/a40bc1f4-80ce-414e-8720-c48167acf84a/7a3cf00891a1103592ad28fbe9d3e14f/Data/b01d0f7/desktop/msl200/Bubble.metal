#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
namespace SNAP_VS {
int sc_GetStereoViewIndex()
{
return 0;
}
}
#ifndef sc_TextureRenderingLayout_Regular
#define sc_TextureRenderingLayout_Regular 0
#define sc_TextureRenderingLayout_StereoInstancedClipped 1
#define sc_TextureRenderingLayout_StereoMultiview 2
#endif
// SCC_BACKEND_SHADER_FLAGS_BEGIN__
// SCC_BACKEND_SHADER_FLAG_DISABLE_FRUSTUM_CULLING
// SCC_BACKEND_SHADER_FLAGS_END__
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//output vec4 sc_FragData0 0
//sampler sampler Tweak_N115SmpSC 0:18
//sampler sampler Tweak_N74SmpSC 0:19
//sampler sampler intensityTextureSmpSC 0:20
//sampler sampler sc_ScreenTextureSmpSC 0:25
//texture texture2D Tweak_N115 0:1:0:18
//texture texture2D Tweak_N74 0:2:0:19
//texture texture2D intensityTexture 0:3:0:20
//texture texture2D sc_ScreenTexture 0:15:0:25
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[1]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:28:5168 {
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4x4 sc_ViewProjectionMatrixArray 1680:[2]:64
//float4x4 sc_ModelViewMatrixArray 1936:[2]:64
//float4x4 sc_ProjectionMatrixArray 2384:[2]:64
//float4x4 sc_ProjectionMatrixInverseArray 2512:[2]:64
//float4x4 sc_ViewMatrixArray 2640:[2]:64
//float4x4 sc_ViewMatrixInverseArray 2768:[2]:64
//float4x4 sc_PrevFrameViewProjectionMatrixArray 2896:[2]:64
//float4x4 sc_ModelMatrix 3024
//float4x4 sc_ModelMatrixInverse 3088
//float3x3 sc_NormalMatrix 3152
//float4x4 sc_PrevFrameModelMatrix 3248
//float4 sc_CurrentRenderTargetDims 3456
//sc_Camera_t sc_Camera 3472
//float3 sc_Camera.position 0
//float sc_Camera.aspect 16
//float2 sc_Camera.clipPlanes 24
//float sc_ShadowDensity 3504
//float4 sc_ShadowColor 3520
//float4x4 sc_ProjectorMatrix 3536
//float4 weights0 3616
//float4 weights1 3632
//float4 sc_StereoClipPlanes 3664:[2]:16
//float2 sc_TAAJitterOffset 3704
//float4 voxelization_params_0 3824
//float4 voxelization_params_frustum_lrbt 3840
//float4 voxelization_params_frustum_nf 3856
//float3 voxelization_params_camera_pos 3872
//float4x4 sc_ModelMatrixVoxelization 3888
//float correctedIntensity 3952
//float3x3 intensityTextureTransform 4016
//float4 intensityTextureUvMinMax 4064
//float4 intensityTextureBorderColor 4080
//int PreviewEnabled 4244
//float alphaTestThreshold 4252
//float3x3 Tweak_N74Transform 4304
//float4 Tweak_N74UvMinMax 4352
//float4 Tweak_N74BorderColor 4368
//float dissipation 4384
//int colorIndex 4388
//float4 Tweak_N9 4400
//float4 Tweak_N14 4416
//float4 Tweak_N16 4432
//float4 Tweak_N17 4448
//float4 Tweak_N18 4464
//float4 Tweak_N20 4480
//float4 Tweak_N21 4496
//float4 Tweak_N22 4512
//float4 Tweak_N23 4528
//float3x3 Tweak_N115Transform 4592
//float4 Tweak_N115UvMinMax 4640
//float4 Tweak_N115BorderColor 4656
//float radcentertransp 4672
//float alpha 4676
//float Port_Value_N155 4680
//float Port_Input1_N208 4704
//float Port_Multiplier_N082 4708
//float Port_Import_N209 4736
//float Port_Input1_N030 4740
//float Port_Input2_N030 4744
//float Port_Value_N083 4784
//float Port_RangeMinA_N006 4788
//float Port_RangeMaxA_N006 4792
//float Port_RangeMinB_N006 4796
//float Port_RangeMaxB_N006 4800
//float4 Port_Default_N011 4816
//float Port_Import_N124 4848
//float Port_RangeMinA_N125 4852
//float Port_RangeMaxA_N125 4856
//float Port_RangeMinB_N125 4860
//float Port_RangeMaxB_N125 4864
//float Port_Import_N126 4868
//float Port_Input1_N127 4872
//float Port_Import_N128 4876
//float Port_Input1_N129 4880
//float Port_Import_N163 4884
//float Port_Import_N165 4888
//float3 Port_Import_N166 4896
//float Port_Input1_N141 4912
//float Port_Input1_N117 4916
//float Port_Exponent_N134 4920
//float Port_Intensity_N134 4924
//float Port_RangeMinA_N027 4928
//float Port_RangeMaxA_N027 4932
//float Port_RangeMinB_N027 4936
//float Port_RangeMaxB_N027 4940
//float Port_RangeMinA_N028 4944
//float Port_RangeMaxA_N028 4948
//float Port_RangeMinB_N028 4952
//float Port_RangeMaxB_N028 4956
//float Port_Input1_N145 4960
//float4 Port_Input1_N142 4976
//float4 Port_Input2_N142 4992
//float Port_Input0_N098 5008
//float Port_Import_N097 5012
//float Port_Input0_N099 5016
//float3 Port_Import_N044 5024
//float Port_Input1_N045 5040
//float3 Port_Import_N046 5056
//float Port_Import_N047 5072
//float Port_Input1_N048 5076
//float Port_Input2_N048 5080
//float Port_Input1_N101 5124
//float Port_RangeMinA_N158 5128
//float Port_RangeMaxA_N158 5132
//float Port_RangeMinB_N158 5136
//float Port_RangeMaxB_N158 5140
//float Port_Input1_N103 5148
//float Port_Input1_N106 5152
//float Port_Input2_N106 5156
//float Port_Input1_N157 5160
//float Port_Input2_N157 5164
//}
//spec_const bool BLEND_MODE_AVERAGE 0 0
//spec_const bool BLEND_MODE_BRIGHT 1 0
//spec_const bool BLEND_MODE_COLOR_BURN 2 0
//spec_const bool BLEND_MODE_COLOR_DODGE 3 0
//spec_const bool BLEND_MODE_COLOR 4 0
//spec_const bool BLEND_MODE_DARKEN 5 0
//spec_const bool BLEND_MODE_DIFFERENCE 6 0
//spec_const bool BLEND_MODE_DIVIDE 7 0
//spec_const bool BLEND_MODE_DIVISION 8 0
//spec_const bool BLEND_MODE_EXCLUSION 9 0
//spec_const bool BLEND_MODE_FORGRAY 10 0
//spec_const bool BLEND_MODE_HARD_GLOW 11 0
//spec_const bool BLEND_MODE_HARD_LIGHT 12 0
//spec_const bool BLEND_MODE_HARD_MIX 13 0
//spec_const bool BLEND_MODE_HARD_PHOENIX 14 0
//spec_const bool BLEND_MODE_HARD_REFLECT 15 0
//spec_const bool BLEND_MODE_HUE 16 0
//spec_const bool BLEND_MODE_INTENSE 17 0
//spec_const bool BLEND_MODE_LIGHTEN 18 0
//spec_const bool BLEND_MODE_LINEAR_LIGHT 19 0
//spec_const bool BLEND_MODE_LUMINOSITY 20 0
//spec_const bool BLEND_MODE_NEGATION 21 0
//spec_const bool BLEND_MODE_NOTBRIGHT 22 0
//spec_const bool BLEND_MODE_OVERLAY 23 0
//spec_const bool BLEND_MODE_PIN_LIGHT 24 0
//spec_const bool BLEND_MODE_REALISTIC 25 0
//spec_const bool BLEND_MODE_SATURATION 26 0
//spec_const bool BLEND_MODE_SOFT_LIGHT 27 0
//spec_const bool BLEND_MODE_SUBTRACT 28 0
//spec_const bool BLEND_MODE_VIVID_LIGHT 29 0
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 30 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_Tweak_N115 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_Tweak_N74 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 33 0
//spec_const bool SC_USE_UV_MIN_MAX_Tweak_N115 34 0
//spec_const bool SC_USE_UV_MIN_MAX_Tweak_N74 35 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 36 0
//spec_const bool SC_USE_UV_TRANSFORM_Tweak_N115 37 0
//spec_const bool SC_USE_UV_TRANSFORM_Tweak_N74 38 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 39 0
//spec_const bool Tweak_N115HasSwappedViews 40 0
//spec_const bool Tweak_N74HasSwappedViews 41 0
//spec_const bool UseViewSpaceDepthVariant 42 1
//spec_const bool intensityTextureHasSwappedViews 43 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 44 0
//spec_const bool sc_BlendMode_Add 45 0
//spec_const bool sc_BlendMode_AlphaTest 46 0
//spec_const bool sc_BlendMode_AlphaToCoverage 47 0
//spec_const bool sc_BlendMode_ColoredGlass 48 0
//spec_const bool sc_BlendMode_Custom 49 0
//spec_const bool sc_BlendMode_Max 50 0
//spec_const bool sc_BlendMode_Min 51 0
//spec_const bool sc_BlendMode_MultiplyOriginal 52 0
//spec_const bool sc_BlendMode_Multiply 53 0
//spec_const bool sc_BlendMode_Normal 54 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 55 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 56 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 57 0
//spec_const bool sc_BlendMode_Screen 58 0
//spec_const bool sc_DepthOnly 59 0
//spec_const bool sc_FramebufferFetch 60 0
//spec_const bool sc_MotionVectorsPass 61 0
//spec_const bool sc_OITCompositingPass 62 0
//spec_const bool sc_OITDepthBoundsPass 63 0
//spec_const bool sc_OITDepthGatherPass 64 0
//spec_const bool sc_OutputBounds 65 0
//spec_const bool sc_ProjectiveShadowsCaster 66 0
//spec_const bool sc_ProjectiveShadowsReceiver 67 0
//spec_const bool sc_RenderAlphaToColor 68 0
//spec_const bool sc_ScreenTextureHasSwappedViews 69 0
//spec_const bool sc_TAAEnabled 70 0
//spec_const bool sc_VertexBlendingUseNormals 71 0
//spec_const bool sc_VertexBlending 72 0
//spec_const bool sc_Voxelization 73 0
//spec_const int SC_SOFTWARE_WRAP_MODE_U_Tweak_N115 74 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_Tweak_N74 75 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 76 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_Tweak_N115 77 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_Tweak_N74 78 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 79 -1
//spec_const int Tweak_N115Layout 80 0
//spec_const int Tweak_N74Layout 81 0
//spec_const int intensityTextureLayout 82 0
//spec_const int sc_DepthBufferMode 83 0
//spec_const int sc_RenderingSpace 84 -1
//spec_const int sc_ScreenTextureLayout 85 0
//spec_const int sc_ShaderCacheConstant 86 0
//spec_const int sc_SkinBonesCount 87 0
//spec_const int sc_StereoRenderingMode 88 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 89 0
//SG_REFLECTION_END
constant bool BLEND_MODE_AVERAGE [[function_constant(0)]];
constant bool BLEND_MODE_AVERAGE_tmp = is_function_constant_defined(BLEND_MODE_AVERAGE) ? BLEND_MODE_AVERAGE : false;
constant bool BLEND_MODE_BRIGHT [[function_constant(1)]];
constant bool BLEND_MODE_BRIGHT_tmp = is_function_constant_defined(BLEND_MODE_BRIGHT) ? BLEND_MODE_BRIGHT : false;
constant bool BLEND_MODE_COLOR_BURN [[function_constant(2)]];
constant bool BLEND_MODE_COLOR_BURN_tmp = is_function_constant_defined(BLEND_MODE_COLOR_BURN) ? BLEND_MODE_COLOR_BURN : false;
constant bool BLEND_MODE_COLOR_DODGE [[function_constant(3)]];
constant bool BLEND_MODE_COLOR_DODGE_tmp = is_function_constant_defined(BLEND_MODE_COLOR_DODGE) ? BLEND_MODE_COLOR_DODGE : false;
constant bool BLEND_MODE_COLOR [[function_constant(4)]];
constant bool BLEND_MODE_COLOR_tmp = is_function_constant_defined(BLEND_MODE_COLOR) ? BLEND_MODE_COLOR : false;
constant bool BLEND_MODE_DARKEN [[function_constant(5)]];
constant bool BLEND_MODE_DARKEN_tmp = is_function_constant_defined(BLEND_MODE_DARKEN) ? BLEND_MODE_DARKEN : false;
constant bool BLEND_MODE_DIFFERENCE [[function_constant(6)]];
constant bool BLEND_MODE_DIFFERENCE_tmp = is_function_constant_defined(BLEND_MODE_DIFFERENCE) ? BLEND_MODE_DIFFERENCE : false;
constant bool BLEND_MODE_DIVIDE [[function_constant(7)]];
constant bool BLEND_MODE_DIVIDE_tmp = is_function_constant_defined(BLEND_MODE_DIVIDE) ? BLEND_MODE_DIVIDE : false;
constant bool BLEND_MODE_DIVISION [[function_constant(8)]];
constant bool BLEND_MODE_DIVISION_tmp = is_function_constant_defined(BLEND_MODE_DIVISION) ? BLEND_MODE_DIVISION : false;
constant bool BLEND_MODE_EXCLUSION [[function_constant(9)]];
constant bool BLEND_MODE_EXCLUSION_tmp = is_function_constant_defined(BLEND_MODE_EXCLUSION) ? BLEND_MODE_EXCLUSION : false;
constant bool BLEND_MODE_FORGRAY [[function_constant(10)]];
constant bool BLEND_MODE_FORGRAY_tmp = is_function_constant_defined(BLEND_MODE_FORGRAY) ? BLEND_MODE_FORGRAY : false;
constant bool BLEND_MODE_HARD_GLOW [[function_constant(11)]];
constant bool BLEND_MODE_HARD_GLOW_tmp = is_function_constant_defined(BLEND_MODE_HARD_GLOW) ? BLEND_MODE_HARD_GLOW : false;
constant bool BLEND_MODE_HARD_LIGHT [[function_constant(12)]];
constant bool BLEND_MODE_HARD_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_HARD_LIGHT) ? BLEND_MODE_HARD_LIGHT : false;
constant bool BLEND_MODE_HARD_MIX [[function_constant(13)]];
constant bool BLEND_MODE_HARD_MIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_MIX) ? BLEND_MODE_HARD_MIX : false;
constant bool BLEND_MODE_HARD_PHOENIX [[function_constant(14)]];
constant bool BLEND_MODE_HARD_PHOENIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_PHOENIX) ? BLEND_MODE_HARD_PHOENIX : false;
constant bool BLEND_MODE_HARD_REFLECT [[function_constant(15)]];
constant bool BLEND_MODE_HARD_REFLECT_tmp = is_function_constant_defined(BLEND_MODE_HARD_REFLECT) ? BLEND_MODE_HARD_REFLECT : false;
constant bool BLEND_MODE_HUE [[function_constant(16)]];
constant bool BLEND_MODE_HUE_tmp = is_function_constant_defined(BLEND_MODE_HUE) ? BLEND_MODE_HUE : false;
constant bool BLEND_MODE_INTENSE [[function_constant(17)]];
constant bool BLEND_MODE_INTENSE_tmp = is_function_constant_defined(BLEND_MODE_INTENSE) ? BLEND_MODE_INTENSE : false;
constant bool BLEND_MODE_LIGHTEN [[function_constant(18)]];
constant bool BLEND_MODE_LIGHTEN_tmp = is_function_constant_defined(BLEND_MODE_LIGHTEN) ? BLEND_MODE_LIGHTEN : false;
constant bool BLEND_MODE_LINEAR_LIGHT [[function_constant(19)]];
constant bool BLEND_MODE_LINEAR_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_LINEAR_LIGHT) ? BLEND_MODE_LINEAR_LIGHT : false;
constant bool BLEND_MODE_LUMINOSITY [[function_constant(20)]];
constant bool BLEND_MODE_LUMINOSITY_tmp = is_function_constant_defined(BLEND_MODE_LUMINOSITY) ? BLEND_MODE_LUMINOSITY : false;
constant bool BLEND_MODE_NEGATION [[function_constant(21)]];
constant bool BLEND_MODE_NEGATION_tmp = is_function_constant_defined(BLEND_MODE_NEGATION) ? BLEND_MODE_NEGATION : false;
constant bool BLEND_MODE_NOTBRIGHT [[function_constant(22)]];
constant bool BLEND_MODE_NOTBRIGHT_tmp = is_function_constant_defined(BLEND_MODE_NOTBRIGHT) ? BLEND_MODE_NOTBRIGHT : false;
constant bool BLEND_MODE_OVERLAY [[function_constant(23)]];
constant bool BLEND_MODE_OVERLAY_tmp = is_function_constant_defined(BLEND_MODE_OVERLAY) ? BLEND_MODE_OVERLAY : false;
constant bool BLEND_MODE_PIN_LIGHT [[function_constant(24)]];
constant bool BLEND_MODE_PIN_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_PIN_LIGHT) ? BLEND_MODE_PIN_LIGHT : false;
constant bool BLEND_MODE_REALISTIC [[function_constant(25)]];
constant bool BLEND_MODE_REALISTIC_tmp = is_function_constant_defined(BLEND_MODE_REALISTIC) ? BLEND_MODE_REALISTIC : false;
constant bool BLEND_MODE_SATURATION [[function_constant(26)]];
constant bool BLEND_MODE_SATURATION_tmp = is_function_constant_defined(BLEND_MODE_SATURATION) ? BLEND_MODE_SATURATION : false;
constant bool BLEND_MODE_SOFT_LIGHT [[function_constant(27)]];
constant bool BLEND_MODE_SOFT_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_SOFT_LIGHT) ? BLEND_MODE_SOFT_LIGHT : false;
constant bool BLEND_MODE_SUBTRACT [[function_constant(28)]];
constant bool BLEND_MODE_SUBTRACT_tmp = is_function_constant_defined(BLEND_MODE_SUBTRACT) ? BLEND_MODE_SUBTRACT : false;
constant bool BLEND_MODE_VIVID_LIGHT [[function_constant(29)]];
constant bool BLEND_MODE_VIVID_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_VIVID_LIGHT) ? BLEND_MODE_VIVID_LIGHT : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(30)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool SC_USE_CLAMP_TO_BORDER_Tweak_N115 [[function_constant(31)]];
constant bool SC_USE_CLAMP_TO_BORDER_Tweak_N115_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_Tweak_N115) ? SC_USE_CLAMP_TO_BORDER_Tweak_N115 : false;
constant bool SC_USE_CLAMP_TO_BORDER_Tweak_N74 [[function_constant(32)]];
constant bool SC_USE_CLAMP_TO_BORDER_Tweak_N74_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_Tweak_N74) ? SC_USE_CLAMP_TO_BORDER_Tweak_N74 : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(33)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_Tweak_N115 [[function_constant(34)]];
constant bool SC_USE_UV_MIN_MAX_Tweak_N115_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_Tweak_N115) ? SC_USE_UV_MIN_MAX_Tweak_N115 : false;
constant bool SC_USE_UV_MIN_MAX_Tweak_N74 [[function_constant(35)]];
constant bool SC_USE_UV_MIN_MAX_Tweak_N74_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_Tweak_N74) ? SC_USE_UV_MIN_MAX_Tweak_N74 : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(36)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_Tweak_N115 [[function_constant(37)]];
constant bool SC_USE_UV_TRANSFORM_Tweak_N115_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_Tweak_N115) ? SC_USE_UV_TRANSFORM_Tweak_N115 : false;
constant bool SC_USE_UV_TRANSFORM_Tweak_N74 [[function_constant(38)]];
constant bool SC_USE_UV_TRANSFORM_Tweak_N74_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_Tweak_N74) ? SC_USE_UV_TRANSFORM_Tweak_N74 : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(39)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool Tweak_N115HasSwappedViews [[function_constant(40)]];
constant bool Tweak_N115HasSwappedViews_tmp = is_function_constant_defined(Tweak_N115HasSwappedViews) ? Tweak_N115HasSwappedViews : false;
constant bool Tweak_N74HasSwappedViews [[function_constant(41)]];
constant bool Tweak_N74HasSwappedViews_tmp = is_function_constant_defined(Tweak_N74HasSwappedViews) ? Tweak_N74HasSwappedViews : false;
constant bool UseViewSpaceDepthVariant [[function_constant(42)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool intensityTextureHasSwappedViews [[function_constant(43)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(44)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(45)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(46)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(47)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(48)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(49)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(50)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(51)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(52)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(53)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(54)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(55)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(56)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(57)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(58)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(59)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_FramebufferFetch [[function_constant(60)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_MotionVectorsPass [[function_constant(61)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(62)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(63)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(64)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_OutputBounds [[function_constant(65)]];
constant bool sc_OutputBounds_tmp = is_function_constant_defined(sc_OutputBounds) ? sc_OutputBounds : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(66)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(67)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RenderAlphaToColor [[function_constant(68)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(69)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_TAAEnabled [[function_constant(70)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(71)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(72)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool sc_Voxelization [[function_constant(73)]];
constant bool sc_Voxelization_tmp = is_function_constant_defined(sc_Voxelization) ? sc_Voxelization : false;
constant int SC_SOFTWARE_WRAP_MODE_U_Tweak_N115 [[function_constant(74)]];
constant int SC_SOFTWARE_WRAP_MODE_U_Tweak_N115_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_Tweak_N115) ? SC_SOFTWARE_WRAP_MODE_U_Tweak_N115 : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_Tweak_N74 [[function_constant(75)]];
constant int SC_SOFTWARE_WRAP_MODE_U_Tweak_N74_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_Tweak_N74) ? SC_SOFTWARE_WRAP_MODE_U_Tweak_N74 : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(76)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_Tweak_N115 [[function_constant(77)]];
constant int SC_SOFTWARE_WRAP_MODE_V_Tweak_N115_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_Tweak_N115) ? SC_SOFTWARE_WRAP_MODE_V_Tweak_N115 : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_Tweak_N74 [[function_constant(78)]];
constant int SC_SOFTWARE_WRAP_MODE_V_Tweak_N74_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_Tweak_N74) ? SC_SOFTWARE_WRAP_MODE_V_Tweak_N74 : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(79)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int Tweak_N115Layout [[function_constant(80)]];
constant int Tweak_N115Layout_tmp = is_function_constant_defined(Tweak_N115Layout) ? Tweak_N115Layout : 0;
constant int Tweak_N74Layout [[function_constant(81)]];
constant int Tweak_N74Layout_tmp = is_function_constant_defined(Tweak_N74Layout) ? Tweak_N74Layout : 0;
constant int intensityTextureLayout [[function_constant(82)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int sc_DepthBufferMode [[function_constant(83)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_RenderingSpace [[function_constant(84)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(85)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(86)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(87)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(88)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(89)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;

namespace SNAP_VS {
struct sc_Vertex_t
{
float4 position;
float3 normal;
float3 tangent;
float2 texture0;
float2 texture1;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 SurfacePosition_ObjectSpace;
float3 VertexNormal_WorldSpace;
float3 VertexNormal_ObjectSpace;
float2 gTriplanarCoords;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float shaderComplexityValue;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
float4 voxelization_params_0;
float4 voxelization_params_frustum_lrbt;
float4 voxelization_params_frustum_nf;
float3 voxelization_params_camera_pos;
float4x4 sc_ModelMatrixVoxelization;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float4 Tweak_N74Size;
float4 Tweak_N74Dims;
float4 Tweak_N74View;
float3x3 Tweak_N74Transform;
float4 Tweak_N74UvMinMax;
float4 Tweak_N74BorderColor;
float dissipation;
int colorIndex;
float4 Tweak_N9;
float4 Tweak_N14;
float4 Tweak_N16;
float4 Tweak_N17;
float4 Tweak_N18;
float4 Tweak_N20;
float4 Tweak_N21;
float4 Tweak_N22;
float4 Tweak_N23;
float4 Tweak_N115Size;
float4 Tweak_N115Dims;
float4 Tweak_N115View;
float3x3 Tweak_N115Transform;
float4 Tweak_N115UvMinMax;
float4 Tweak_N115BorderColor;
float radcentertransp;
float alpha;
float Port_Value_N155;
float3 Port_Import_N207;
float Port_Input1_N208;
float Port_Multiplier_N082;
float3 Port_Import_N206;
float Port_Import_N209;
float Port_Input1_N030;
float Port_Input2_N030;
float3 Port_Position_N210;
float3 Port_Normal_N210;
float Port_Value_N083;
float Port_RangeMinA_N006;
float Port_RangeMaxA_N006;
float Port_RangeMinB_N006;
float Port_RangeMaxB_N006;
float4 Port_Default_N011;
float4 Port_Import_N122;
float Port_Import_N124;
float Port_RangeMinA_N125;
float Port_RangeMaxA_N125;
float Port_RangeMinB_N125;
float Port_RangeMaxB_N125;
float Port_Import_N126;
float Port_Input1_N127;
float Port_Import_N128;
float Port_Input1_N129;
float Port_Import_N163;
float Port_Import_N165;
float3 Port_Import_N166;
float Port_Input1_N141;
float Port_Input1_N117;
float Port_Exponent_N134;
float Port_Intensity_N134;
float Port_RangeMinA_N027;
float Port_RangeMaxA_N027;
float Port_RangeMinB_N027;
float Port_RangeMaxB_N027;
float Port_RangeMinA_N028;
float Port_RangeMaxA_N028;
float Port_RangeMinB_N028;
float Port_RangeMaxB_N028;
float Port_Input1_N145;
float4 Port_Input1_N142;
float4 Port_Input2_N142;
float Port_Input0_N098;
float Port_Import_N097;
float Port_Input0_N099;
float3 Port_Import_N044;
float Port_Input1_N045;
float3 Port_Import_N046;
float Port_Import_N047;
float Port_Input1_N048;
float Port_Input2_N048;
float3 Port_Position_N052;
float3 Port_Normal_N052;
float Port_Import_N100;
float Port_Input1_N101;
float Port_RangeMinA_N158;
float Port_RangeMaxA_N158;
float Port_RangeMinB_N158;
float Port_RangeMaxB_N158;
float Port_Import_N102;
float Port_Input1_N103;
float Port_Input1_N106;
float Port_Input2_N106;
float Port_Input1_N157;
float Port_Input2_N157;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Set0
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> Tweak_N115 [[id(1)]];
texture2d<float> Tweak_N74 [[id(2)]];
texture2d<float> intensityTexture [[id(3)]];
texture2d<float> sc_ScreenTexture [[id(15)]];
sampler Tweak_N115SmpSC [[id(18)]];
sampler Tweak_N74SmpSC [[id(19)]];
sampler intensityTextureSmpSC [[id(20)]];
sampler sc_ScreenTextureSmpSC [[id(25)]];
constant userUniformsObj* UserUniforms [[id(28)]];
};
struct main_vert_out
{
float4 varPosAndMotion [[user(locn0)]];
float4 varNormalAndMotion [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varTex01 [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
float4 boneData [[attribute(5)]];
float3 blendShape0Pos [[attribute(6)]];
float3 blendShape1Pos [[attribute(7)]];
float3 blendShape2Pos [[attribute(8)]];
float3 blendShape3Pos [[attribute(9)]];
float3 blendShape4Pos [[attribute(10)]];
float3 blendShape5Pos [[attribute(11)]];
float3 blendShape0Normal [[attribute(12)]];
float3 blendShape1Normal [[attribute(13)]];
float3 blendShape2Normal [[attribute(14)]];
float3 positionNext [[attribute(15)]];
float3 positionPrevious [[attribute(16)]];
float4 strandProperties [[attribute(17)]];
float4 color [[attribute(18)]];
};
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_0;
l9_0.position=in.position;
l9_0.normal=in.normal;
l9_0.tangent=in.tangent.xyz;
l9_0.texture0=in.texture0;
l9_0.texture1=in.texture1;
sc_Vertex_t l9_1=l9_0;
sc_Vertex_t param=l9_1;
if ((int(sc_Voxelization_tmp)!=0))
{
sc_Vertex_t l9_2=param;
param=l9_2;
}
sc_Vertex_t l9_3=param;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_4=l9_3;
float3 l9_5=in.blendShape0Pos;
float3 l9_6=in.blendShape0Normal;
float l9_7=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_8=l9_4;
float3 l9_9=l9_5;
float l9_10=l9_7;
float3 l9_11=l9_8.position.xyz+(l9_9*l9_10);
l9_8.position=float4(l9_11.x,l9_11.y,l9_11.z,l9_8.position.w);
l9_4=l9_8;
l9_4.normal+=(l9_6*l9_7);
l9_3=l9_4;
sc_Vertex_t l9_12=l9_3;
float3 l9_13=in.blendShape1Pos;
float3 l9_14=in.blendShape1Normal;
float l9_15=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_16=l9_12;
float3 l9_17=l9_13;
float l9_18=l9_15;
float3 l9_19=l9_16.position.xyz+(l9_17*l9_18);
l9_16.position=float4(l9_19.x,l9_19.y,l9_19.z,l9_16.position.w);
l9_12=l9_16;
l9_12.normal+=(l9_14*l9_15);
l9_3=l9_12;
sc_Vertex_t l9_20=l9_3;
float3 l9_21=in.blendShape2Pos;
float3 l9_22=in.blendShape2Normal;
float l9_23=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_24=l9_20;
float3 l9_25=l9_21;
float l9_26=l9_23;
float3 l9_27=l9_24.position.xyz+(l9_25*l9_26);
l9_24.position=float4(l9_27.x,l9_27.y,l9_27.z,l9_24.position.w);
l9_20=l9_24;
l9_20.normal+=(l9_22*l9_23);
l9_3=l9_20;
}
else
{
sc_Vertex_t l9_28=l9_3;
float3 l9_29=in.blendShape0Pos;
float l9_30=(*sc_set0.UserUniforms).weights0.x;
float3 l9_31=l9_28.position.xyz+(l9_29*l9_30);
l9_28.position=float4(l9_31.x,l9_31.y,l9_31.z,l9_28.position.w);
l9_3=l9_28;
sc_Vertex_t l9_32=l9_3;
float3 l9_33=in.blendShape1Pos;
float l9_34=(*sc_set0.UserUniforms).weights0.y;
float3 l9_35=l9_32.position.xyz+(l9_33*l9_34);
l9_32.position=float4(l9_35.x,l9_35.y,l9_35.z,l9_32.position.w);
l9_3=l9_32;
sc_Vertex_t l9_36=l9_3;
float3 l9_37=in.blendShape2Pos;
float l9_38=(*sc_set0.UserUniforms).weights0.z;
float3 l9_39=l9_36.position.xyz+(l9_37*l9_38);
l9_36.position=float4(l9_39.x,l9_39.y,l9_39.z,l9_36.position.w);
l9_3=l9_36;
sc_Vertex_t l9_40=l9_3;
float3 l9_41=in.blendShape3Pos;
float l9_42=(*sc_set0.UserUniforms).weights0.w;
float3 l9_43=l9_40.position.xyz+(l9_41*l9_42);
l9_40.position=float4(l9_43.x,l9_43.y,l9_43.z,l9_40.position.w);
l9_3=l9_40;
sc_Vertex_t l9_44=l9_3;
float3 l9_45=in.blendShape4Pos;
float l9_46=(*sc_set0.UserUniforms).weights1.x;
float3 l9_47=l9_44.position.xyz+(l9_45*l9_46);
l9_44.position=float4(l9_47.x,l9_47.y,l9_47.z,l9_44.position.w);
l9_3=l9_44;
sc_Vertex_t l9_48=l9_3;
float3 l9_49=in.blendShape5Pos;
float l9_50=(*sc_set0.UserUniforms).weights1.y;
float3 l9_51=l9_48.position.xyz+(l9_49*l9_50);
l9_48.position=float4(l9_51.x,l9_51.y,l9_51.z,l9_48.position.w);
l9_3=l9_48;
}
}
param=l9_3;
sc_Vertex_t l9_52=param;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_53=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_53=float4(1.0,fract(in.boneData.yzw));
l9_53.x-=dot(l9_53.yzw,float3(1.0));
}
float4 l9_54=l9_53;
float4 l9_55=l9_54;
int l9_56=int(in.boneData.x);
int l9_57=int(in.boneData.y);
int l9_58=int(in.boneData.z);
int l9_59=int(in.boneData.w);
int l9_60=l9_56;
float4 l9_61=l9_52.position;
float3 l9_62=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_63=l9_60;
float4 l9_64=(*sc_set0.sc_BonesUBO).sc_Bones[l9_63].boneMatrix[0];
float4 l9_65=(*sc_set0.sc_BonesUBO).sc_Bones[l9_63].boneMatrix[1];
float4 l9_66=(*sc_set0.sc_BonesUBO).sc_Bones[l9_63].boneMatrix[2];
float4 l9_67[3];
l9_67[0]=l9_64;
l9_67[1]=l9_65;
l9_67[2]=l9_66;
l9_62=float3(dot(l9_61,l9_67[0]),dot(l9_61,l9_67[1]),dot(l9_61,l9_67[2]));
}
else
{
l9_62=l9_61.xyz;
}
float3 l9_68=l9_62;
float3 l9_69=l9_68;
float l9_70=l9_55.x;
int l9_71=l9_57;
float4 l9_72=l9_52.position;
float3 l9_73=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_74=l9_71;
float4 l9_75=(*sc_set0.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[0];
float4 l9_76=(*sc_set0.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[1];
float4 l9_77=(*sc_set0.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[2];
float4 l9_78[3];
l9_78[0]=l9_75;
l9_78[1]=l9_76;
l9_78[2]=l9_77;
l9_73=float3(dot(l9_72,l9_78[0]),dot(l9_72,l9_78[1]),dot(l9_72,l9_78[2]));
}
else
{
l9_73=l9_72.xyz;
}
float3 l9_79=l9_73;
float3 l9_80=l9_79;
float l9_81=l9_55.y;
int l9_82=l9_58;
float4 l9_83=l9_52.position;
float3 l9_84=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_85=l9_82;
float4 l9_86=(*sc_set0.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[0];
float4 l9_87=(*sc_set0.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[1];
float4 l9_88=(*sc_set0.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[2];
float4 l9_89[3];
l9_89[0]=l9_86;
l9_89[1]=l9_87;
l9_89[2]=l9_88;
l9_84=float3(dot(l9_83,l9_89[0]),dot(l9_83,l9_89[1]),dot(l9_83,l9_89[2]));
}
else
{
l9_84=l9_83.xyz;
}
float3 l9_90=l9_84;
float3 l9_91=l9_90;
float l9_92=l9_55.z;
int l9_93=l9_59;
float4 l9_94=l9_52.position;
float3 l9_95=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_96=l9_93;
float4 l9_97=(*sc_set0.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[0];
float4 l9_98=(*sc_set0.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[1];
float4 l9_99=(*sc_set0.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[2];
float4 l9_100[3];
l9_100[0]=l9_97;
l9_100[1]=l9_98;
l9_100[2]=l9_99;
l9_95=float3(dot(l9_94,l9_100[0]),dot(l9_94,l9_100[1]),dot(l9_94,l9_100[2]));
}
else
{
l9_95=l9_94.xyz;
}
float3 l9_101=l9_95;
float3 l9_102=(((l9_69*l9_70)+(l9_80*l9_81))+(l9_91*l9_92))+(l9_101*l9_55.w);
l9_52.position=float4(l9_102.x,l9_102.y,l9_102.z,l9_52.position.w);
int l9_103=l9_56;
float3x3 l9_104=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_103].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_103].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_103].normalMatrix[2].xyz));
float3x3 l9_105=l9_104;
float3x3 l9_106=l9_105;
int l9_107=l9_57;
float3x3 l9_108=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_107].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_107].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_107].normalMatrix[2].xyz));
float3x3 l9_109=l9_108;
float3x3 l9_110=l9_109;
int l9_111=l9_58;
float3x3 l9_112=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_111].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_111].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_111].normalMatrix[2].xyz));
float3x3 l9_113=l9_112;
float3x3 l9_114=l9_113;
int l9_115=l9_59;
float3x3 l9_116=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_115].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_115].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_115].normalMatrix[2].xyz));
float3x3 l9_117=l9_116;
float3x3 l9_118=l9_117;
l9_52.normal=((((l9_106*l9_52.normal)*l9_55.x)+((l9_110*l9_52.normal)*l9_55.y))+((l9_114*l9_52.normal)*l9_55.z))+((l9_118*l9_52.normal)*l9_55.w);
l9_52.tangent=((((l9_106*l9_52.tangent)*l9_55.x)+((l9_110*l9_52.tangent)*l9_55.y))+((l9_114*l9_52.tangent)*l9_55.z))+((l9_118*l9_52.tangent)*l9_55.w);
}
param=l9_52;
if (sc_RenderingSpace_tmp==3)
{
out.varPosAndMotion=float4(float3(0.0).x,float3(0.0).y,float3(0.0).z,out.varPosAndMotion.w);
out.varNormalAndMotion=float4(param.normal.x,param.normal.y,param.normal.z,out.varNormalAndMotion.w);
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPosAndMotion=float4(float3(0.0).x,float3(0.0).y,float3(0.0).z,out.varPosAndMotion.w);
out.varNormalAndMotion=float4(param.normal.x,param.normal.y,param.normal.z,out.varNormalAndMotion.w);
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPosAndMotion=float4(param.position.xyz.x,param.position.xyz.y,param.position.xyz.z,out.varPosAndMotion.w);
out.varNormalAndMotion=float4(param.normal.x,param.normal.y,param.normal.z,out.varNormalAndMotion.w);
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
float3 l9_119=((*sc_set0.UserUniforms).sc_ModelMatrix*param.position).xyz;
out.varPosAndMotion=float4(l9_119.x,l9_119.y,l9_119.z,out.varPosAndMotion.w);
float3 l9_120=(*sc_set0.UserUniforms).sc_NormalMatrix*param.normal;
out.varNormalAndMotion=float4(l9_120.x,l9_120.y,l9_120.z,out.varNormalAndMotion.w);
float3 l9_121=(*sc_set0.UserUniforms).sc_NormalMatrix*param.tangent;
out.varTangent=float4(l9_121.x,l9_121.y,l9_121.z,out.varTangent.w);
}
}
}
}
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
param.texture0.x=1.0-param.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param;
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.SurfacePosition_ObjectSpace=((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(out.varPosAndMotion.xyz,1.0)).xyz;
Globals.VertexNormal_WorldSpace=out.varNormalAndMotion.xyz;
Globals.VertexNormal_ObjectSpace=normalize(((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(Globals.VertexNormal_WorldSpace,0.0)).xyz);
Globals.gTriplanarCoords=float2(0.0);
float3 WorldPosition=out.varPosAndMotion.xyz;
float3 WorldNormal=out.varNormalAndMotion.xyz;
float3 WorldTangent=out.varTangent.xyz;
float3 Position_N88=float3(0.0);
Position_N88=Globals.SurfacePosition_ObjectSpace;
float3 Normal_N85=float3(0.0);
Normal_N85=Globals.VertexNormal_ObjectSpace;
float4 Output_N210=float4(0.0);
float4 param_1=float4(0.0);
float3 param_2=float3(1.0);
float3 param_3=float3(0.0);
float param_4=1.0;
ssGlobals param_6=Globals;
float l9_122=0.0;
float l9_123=(*sc_set0.UserUniforms).Port_Value_N155;
float l9_124=l9_123+0.001;
l9_124-=0.001;
l9_122=l9_124;
float3 l9_125=float3(0.0);
l9_125=float3(l9_122);
float3 l9_126=float3(0.0);
l9_126=l9_125*float3((*sc_set0.UserUniforms).Port_Input1_N208);
param_2=l9_126;
float l9_127=0.0;
l9_127=param_6.gTimeElapsed*(*sc_set0.UserUniforms).Port_Multiplier_N082;
float3 l9_128=float3(0.0);
l9_128=float3(l9_127);
param_3=l9_128;
float l9_129=0.0;
l9_129=(*sc_set0.UserUniforms).Port_Import_N209;
float l9_130=0.0;
l9_130=fast::clamp(l9_129+0.001,(*sc_set0.UserUniforms).Port_Input1_N030+0.001,(*sc_set0.UserUniforms).Port_Input2_N030+0.001)-0.001;
param_4=l9_130;
float3 l9_131=param_6.SurfacePosition_ObjectSpace;
float3 l9_132=param_6.VertexNormal_ObjectSpace;
l9_131+=param_3;
l9_131*=param_2;
l9_132=abs(l9_132);
param_6.gTriplanarCoords=l9_131.yz;
float2 l9_133=float2(0.0);
l9_133=param_6.gTriplanarCoords;
float4 l9_134=float4(0.0);
int l9_135;
if ((int(Tweak_N74HasSwappedViews_tmp)!=0))
{
int l9_136=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_136=0;
}
else
{
l9_136=gl_InstanceIndex%2;
}
int l9_137=l9_136;
l9_135=1-l9_137;
}
else
{
int l9_138=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_138=0;
}
else
{
l9_138=gl_InstanceIndex%2;
}
int l9_139=l9_138;
l9_135=l9_139;
}
int l9_140=l9_135;
int l9_141=Tweak_N74Layout_tmp;
int l9_142=l9_140;
float2 l9_143=l9_133;
bool l9_144=(int(SC_USE_UV_TRANSFORM_Tweak_N74_tmp)!=0);
float3x3 l9_145=(*sc_set0.UserUniforms).Tweak_N74Transform;
int2 l9_146=int2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N74_tmp,SC_SOFTWARE_WRAP_MODE_V_Tweak_N74_tmp);
bool l9_147=(int(SC_USE_UV_MIN_MAX_Tweak_N74_tmp)!=0);
float4 l9_148=(*sc_set0.UserUniforms).Tweak_N74UvMinMax;
bool l9_149=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N74_tmp)!=0);
float4 l9_150=(*sc_set0.UserUniforms).Tweak_N74BorderColor;
float l9_151=0.0;
bool l9_152=l9_149&&(!l9_147);
float l9_153=1.0;
float l9_154=l9_143.x;
int l9_155=l9_146.x;
if (l9_155==1)
{
l9_154=fract(l9_154);
}
else
{
if (l9_155==2)
{
float l9_156=fract(l9_154);
float l9_157=l9_154-l9_156;
float l9_158=step(0.25,fract(l9_157*0.5));
l9_154=mix(l9_156,1.0-l9_156,fast::clamp(l9_158,0.0,1.0));
}
}
l9_143.x=l9_154;
float l9_159=l9_143.y;
int l9_160=l9_146.y;
if (l9_160==1)
{
l9_159=fract(l9_159);
}
else
{
if (l9_160==2)
{
float l9_161=fract(l9_159);
float l9_162=l9_159-l9_161;
float l9_163=step(0.25,fract(l9_162*0.5));
l9_159=mix(l9_161,1.0-l9_161,fast::clamp(l9_163,0.0,1.0));
}
}
l9_143.y=l9_159;
if (l9_147)
{
bool l9_164=l9_149;
bool l9_165;
if (l9_164)
{
l9_165=l9_146.x==3;
}
else
{
l9_165=l9_164;
}
float l9_166=l9_143.x;
float l9_167=l9_148.x;
float l9_168=l9_148.z;
bool l9_169=l9_165;
float l9_170=l9_153;
float l9_171=fast::clamp(l9_166,l9_167,l9_168);
float l9_172=step(abs(l9_166-l9_171),9.9999997e-06);
l9_170*=(l9_172+((1.0-float(l9_169))*(1.0-l9_172)));
l9_166=l9_171;
l9_143.x=l9_166;
l9_153=l9_170;
bool l9_173=l9_149;
bool l9_174;
if (l9_173)
{
l9_174=l9_146.y==3;
}
else
{
l9_174=l9_173;
}
float l9_175=l9_143.y;
float l9_176=l9_148.y;
float l9_177=l9_148.w;
bool l9_178=l9_174;
float l9_179=l9_153;
float l9_180=fast::clamp(l9_175,l9_176,l9_177);
float l9_181=step(abs(l9_175-l9_180),9.9999997e-06);
l9_179*=(l9_181+((1.0-float(l9_178))*(1.0-l9_181)));
l9_175=l9_180;
l9_143.y=l9_175;
l9_153=l9_179;
}
float2 l9_182=l9_143;
bool l9_183=l9_144;
float3x3 l9_184=l9_145;
if (l9_183)
{
l9_182=float2((l9_184*float3(l9_182,1.0)).xy);
}
float2 l9_185=l9_182;
l9_143=l9_185;
float l9_186=l9_143.x;
int l9_187=l9_146.x;
bool l9_188=l9_152;
float l9_189=l9_153;
if ((l9_187==0)||(l9_187==3))
{
float l9_190=l9_186;
float l9_191=0.0;
float l9_192=1.0;
bool l9_193=l9_188;
float l9_194=l9_189;
float l9_195=fast::clamp(l9_190,l9_191,l9_192);
float l9_196=step(abs(l9_190-l9_195),9.9999997e-06);
l9_194*=(l9_196+((1.0-float(l9_193))*(1.0-l9_196)));
l9_190=l9_195;
l9_186=l9_190;
l9_189=l9_194;
}
l9_143.x=l9_186;
l9_153=l9_189;
float l9_197=l9_143.y;
int l9_198=l9_146.y;
bool l9_199=l9_152;
float l9_200=l9_153;
if ((l9_198==0)||(l9_198==3))
{
float l9_201=l9_197;
float l9_202=0.0;
float l9_203=1.0;
bool l9_204=l9_199;
float l9_205=l9_200;
float l9_206=fast::clamp(l9_201,l9_202,l9_203);
float l9_207=step(abs(l9_201-l9_206),9.9999997e-06);
l9_205*=(l9_207+((1.0-float(l9_204))*(1.0-l9_207)));
l9_201=l9_206;
l9_197=l9_201;
l9_200=l9_205;
}
l9_143.y=l9_197;
l9_153=l9_200;
float2 l9_208=l9_143;
int l9_209=l9_141;
int l9_210=l9_142;
float l9_211=l9_151;
float2 l9_212=l9_208;
int l9_213=l9_209;
int l9_214=l9_210;
float3 l9_215=float3(0.0);
if (l9_213==0)
{
l9_215=float3(l9_212,0.0);
}
else
{
if (l9_213==1)
{
l9_215=float3(l9_212.x,(l9_212.y*0.5)+(0.5-(float(l9_214)*0.5)),0.0);
}
else
{
l9_215=float3(l9_212,float(l9_214));
}
}
float3 l9_216=l9_215;
float3 l9_217=l9_216;
float4 l9_218=sc_set0.Tweak_N74.sample(sc_set0.Tweak_N74SmpSC,l9_217.xy,level(l9_211));
float4 l9_219=l9_218;
if (l9_149)
{
l9_219=mix(l9_150,l9_219,float4(l9_153));
}
float4 l9_220=l9_219;
l9_134=l9_220;
param_1=l9_134;
float4 l9_221=param_1;
param_6.gTriplanarCoords=l9_131.zx;
float2 l9_222=float2(0.0);
l9_222=param_6.gTriplanarCoords;
float4 l9_223=float4(0.0);
int l9_224;
if ((int(Tweak_N74HasSwappedViews_tmp)!=0))
{
int l9_225=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_225=0;
}
else
{
l9_225=gl_InstanceIndex%2;
}
int l9_226=l9_225;
l9_224=1-l9_226;
}
else
{
int l9_227=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_227=0;
}
else
{
l9_227=gl_InstanceIndex%2;
}
int l9_228=l9_227;
l9_224=l9_228;
}
int l9_229=l9_224;
int l9_230=Tweak_N74Layout_tmp;
int l9_231=l9_229;
float2 l9_232=l9_222;
bool l9_233=(int(SC_USE_UV_TRANSFORM_Tweak_N74_tmp)!=0);
float3x3 l9_234=(*sc_set0.UserUniforms).Tweak_N74Transform;
int2 l9_235=int2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N74_tmp,SC_SOFTWARE_WRAP_MODE_V_Tweak_N74_tmp);
bool l9_236=(int(SC_USE_UV_MIN_MAX_Tweak_N74_tmp)!=0);
float4 l9_237=(*sc_set0.UserUniforms).Tweak_N74UvMinMax;
bool l9_238=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N74_tmp)!=0);
float4 l9_239=(*sc_set0.UserUniforms).Tweak_N74BorderColor;
float l9_240=0.0;
bool l9_241=l9_238&&(!l9_236);
float l9_242=1.0;
float l9_243=l9_232.x;
int l9_244=l9_235.x;
if (l9_244==1)
{
l9_243=fract(l9_243);
}
else
{
if (l9_244==2)
{
float l9_245=fract(l9_243);
float l9_246=l9_243-l9_245;
float l9_247=step(0.25,fract(l9_246*0.5));
l9_243=mix(l9_245,1.0-l9_245,fast::clamp(l9_247,0.0,1.0));
}
}
l9_232.x=l9_243;
float l9_248=l9_232.y;
int l9_249=l9_235.y;
if (l9_249==1)
{
l9_248=fract(l9_248);
}
else
{
if (l9_249==2)
{
float l9_250=fract(l9_248);
float l9_251=l9_248-l9_250;
float l9_252=step(0.25,fract(l9_251*0.5));
l9_248=mix(l9_250,1.0-l9_250,fast::clamp(l9_252,0.0,1.0));
}
}
l9_232.y=l9_248;
if (l9_236)
{
bool l9_253=l9_238;
bool l9_254;
if (l9_253)
{
l9_254=l9_235.x==3;
}
else
{
l9_254=l9_253;
}
float l9_255=l9_232.x;
float l9_256=l9_237.x;
float l9_257=l9_237.z;
bool l9_258=l9_254;
float l9_259=l9_242;
float l9_260=fast::clamp(l9_255,l9_256,l9_257);
float l9_261=step(abs(l9_255-l9_260),9.9999997e-06);
l9_259*=(l9_261+((1.0-float(l9_258))*(1.0-l9_261)));
l9_255=l9_260;
l9_232.x=l9_255;
l9_242=l9_259;
bool l9_262=l9_238;
bool l9_263;
if (l9_262)
{
l9_263=l9_235.y==3;
}
else
{
l9_263=l9_262;
}
float l9_264=l9_232.y;
float l9_265=l9_237.y;
float l9_266=l9_237.w;
bool l9_267=l9_263;
float l9_268=l9_242;
float l9_269=fast::clamp(l9_264,l9_265,l9_266);
float l9_270=step(abs(l9_264-l9_269),9.9999997e-06);
l9_268*=(l9_270+((1.0-float(l9_267))*(1.0-l9_270)));
l9_264=l9_269;
l9_232.y=l9_264;
l9_242=l9_268;
}
float2 l9_271=l9_232;
bool l9_272=l9_233;
float3x3 l9_273=l9_234;
if (l9_272)
{
l9_271=float2((l9_273*float3(l9_271,1.0)).xy);
}
float2 l9_274=l9_271;
l9_232=l9_274;
float l9_275=l9_232.x;
int l9_276=l9_235.x;
bool l9_277=l9_241;
float l9_278=l9_242;
if ((l9_276==0)||(l9_276==3))
{
float l9_279=l9_275;
float l9_280=0.0;
float l9_281=1.0;
bool l9_282=l9_277;
float l9_283=l9_278;
float l9_284=fast::clamp(l9_279,l9_280,l9_281);
float l9_285=step(abs(l9_279-l9_284),9.9999997e-06);
l9_283*=(l9_285+((1.0-float(l9_282))*(1.0-l9_285)));
l9_279=l9_284;
l9_275=l9_279;
l9_278=l9_283;
}
l9_232.x=l9_275;
l9_242=l9_278;
float l9_286=l9_232.y;
int l9_287=l9_235.y;
bool l9_288=l9_241;
float l9_289=l9_242;
if ((l9_287==0)||(l9_287==3))
{
float l9_290=l9_286;
float l9_291=0.0;
float l9_292=1.0;
bool l9_293=l9_288;
float l9_294=l9_289;
float l9_295=fast::clamp(l9_290,l9_291,l9_292);
float l9_296=step(abs(l9_290-l9_295),9.9999997e-06);
l9_294*=(l9_296+((1.0-float(l9_293))*(1.0-l9_296)));
l9_290=l9_295;
l9_286=l9_290;
l9_289=l9_294;
}
l9_232.y=l9_286;
l9_242=l9_289;
float2 l9_297=l9_232;
int l9_298=l9_230;
int l9_299=l9_231;
float l9_300=l9_240;
float2 l9_301=l9_297;
int l9_302=l9_298;
int l9_303=l9_299;
float3 l9_304=float3(0.0);
if (l9_302==0)
{
l9_304=float3(l9_301,0.0);
}
else
{
if (l9_302==1)
{
l9_304=float3(l9_301.x,(l9_301.y*0.5)+(0.5-(float(l9_303)*0.5)),0.0);
}
else
{
l9_304=float3(l9_301,float(l9_303));
}
}
float3 l9_305=l9_304;
float3 l9_306=l9_305;
float4 l9_307=sc_set0.Tweak_N74.sample(sc_set0.Tweak_N74SmpSC,l9_306.xy,level(l9_300));
float4 l9_308=l9_307;
if (l9_238)
{
l9_308=mix(l9_239,l9_308,float4(l9_242));
}
float4 l9_309=l9_308;
l9_223=l9_309;
param_1=l9_223;
float4 l9_310=param_1;
param_6.gTriplanarCoords=l9_131.xy;
float2 l9_311=float2(0.0);
l9_311=param_6.gTriplanarCoords;
float4 l9_312=float4(0.0);
int l9_313;
if ((int(Tweak_N74HasSwappedViews_tmp)!=0))
{
int l9_314=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_314=0;
}
else
{
l9_314=gl_InstanceIndex%2;
}
int l9_315=l9_314;
l9_313=1-l9_315;
}
else
{
int l9_316=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_316=0;
}
else
{
l9_316=gl_InstanceIndex%2;
}
int l9_317=l9_316;
l9_313=l9_317;
}
int l9_318=l9_313;
int l9_319=Tweak_N74Layout_tmp;
int l9_320=l9_318;
float2 l9_321=l9_311;
bool l9_322=(int(SC_USE_UV_TRANSFORM_Tweak_N74_tmp)!=0);
float3x3 l9_323=(*sc_set0.UserUniforms).Tweak_N74Transform;
int2 l9_324=int2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N74_tmp,SC_SOFTWARE_WRAP_MODE_V_Tweak_N74_tmp);
bool l9_325=(int(SC_USE_UV_MIN_MAX_Tweak_N74_tmp)!=0);
float4 l9_326=(*sc_set0.UserUniforms).Tweak_N74UvMinMax;
bool l9_327=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N74_tmp)!=0);
float4 l9_328=(*sc_set0.UserUniforms).Tweak_N74BorderColor;
float l9_329=0.0;
bool l9_330=l9_327&&(!l9_325);
float l9_331=1.0;
float l9_332=l9_321.x;
int l9_333=l9_324.x;
if (l9_333==1)
{
l9_332=fract(l9_332);
}
else
{
if (l9_333==2)
{
float l9_334=fract(l9_332);
float l9_335=l9_332-l9_334;
float l9_336=step(0.25,fract(l9_335*0.5));
l9_332=mix(l9_334,1.0-l9_334,fast::clamp(l9_336,0.0,1.0));
}
}
l9_321.x=l9_332;
float l9_337=l9_321.y;
int l9_338=l9_324.y;
if (l9_338==1)
{
l9_337=fract(l9_337);
}
else
{
if (l9_338==2)
{
float l9_339=fract(l9_337);
float l9_340=l9_337-l9_339;
float l9_341=step(0.25,fract(l9_340*0.5));
l9_337=mix(l9_339,1.0-l9_339,fast::clamp(l9_341,0.0,1.0));
}
}
l9_321.y=l9_337;
if (l9_325)
{
bool l9_342=l9_327;
bool l9_343;
if (l9_342)
{
l9_343=l9_324.x==3;
}
else
{
l9_343=l9_342;
}
float l9_344=l9_321.x;
float l9_345=l9_326.x;
float l9_346=l9_326.z;
bool l9_347=l9_343;
float l9_348=l9_331;
float l9_349=fast::clamp(l9_344,l9_345,l9_346);
float l9_350=step(abs(l9_344-l9_349),9.9999997e-06);
l9_348*=(l9_350+((1.0-float(l9_347))*(1.0-l9_350)));
l9_344=l9_349;
l9_321.x=l9_344;
l9_331=l9_348;
bool l9_351=l9_327;
bool l9_352;
if (l9_351)
{
l9_352=l9_324.y==3;
}
else
{
l9_352=l9_351;
}
float l9_353=l9_321.y;
float l9_354=l9_326.y;
float l9_355=l9_326.w;
bool l9_356=l9_352;
float l9_357=l9_331;
float l9_358=fast::clamp(l9_353,l9_354,l9_355);
float l9_359=step(abs(l9_353-l9_358),9.9999997e-06);
l9_357*=(l9_359+((1.0-float(l9_356))*(1.0-l9_359)));
l9_353=l9_358;
l9_321.y=l9_353;
l9_331=l9_357;
}
float2 l9_360=l9_321;
bool l9_361=l9_322;
float3x3 l9_362=l9_323;
if (l9_361)
{
l9_360=float2((l9_362*float3(l9_360,1.0)).xy);
}
float2 l9_363=l9_360;
l9_321=l9_363;
float l9_364=l9_321.x;
int l9_365=l9_324.x;
bool l9_366=l9_330;
float l9_367=l9_331;
if ((l9_365==0)||(l9_365==3))
{
float l9_368=l9_364;
float l9_369=0.0;
float l9_370=1.0;
bool l9_371=l9_366;
float l9_372=l9_367;
float l9_373=fast::clamp(l9_368,l9_369,l9_370);
float l9_374=step(abs(l9_368-l9_373),9.9999997e-06);
l9_372*=(l9_374+((1.0-float(l9_371))*(1.0-l9_374)));
l9_368=l9_373;
l9_364=l9_368;
l9_367=l9_372;
}
l9_321.x=l9_364;
l9_331=l9_367;
float l9_375=l9_321.y;
int l9_376=l9_324.y;
bool l9_377=l9_330;
float l9_378=l9_331;
if ((l9_376==0)||(l9_376==3))
{
float l9_379=l9_375;
float l9_380=0.0;
float l9_381=1.0;
bool l9_382=l9_377;
float l9_383=l9_378;
float l9_384=fast::clamp(l9_379,l9_380,l9_381);
float l9_385=step(abs(l9_379-l9_384),9.9999997e-06);
l9_383*=(l9_385+((1.0-float(l9_382))*(1.0-l9_385)));
l9_379=l9_384;
l9_375=l9_379;
l9_378=l9_383;
}
l9_321.y=l9_375;
l9_331=l9_378;
float2 l9_386=l9_321;
int l9_387=l9_319;
int l9_388=l9_320;
float l9_389=l9_329;
float2 l9_390=l9_386;
int l9_391=l9_387;
int l9_392=l9_388;
float3 l9_393=float3(0.0);
if (l9_391==0)
{
l9_393=float3(l9_390,0.0);
}
else
{
if (l9_391==1)
{
l9_393=float3(l9_390.x,(l9_390.y*0.5)+(0.5-(float(l9_392)*0.5)),0.0);
}
else
{
l9_393=float3(l9_390,float(l9_392));
}
}
float3 l9_394=l9_393;
float3 l9_395=l9_394;
float4 l9_396=sc_set0.Tweak_N74.sample(sc_set0.Tweak_N74SmpSC,l9_395.xy,level(l9_389));
float4 l9_397=l9_396;
if (l9_327)
{
l9_397=mix(l9_328,l9_397,float4(l9_331));
}
float4 l9_398=l9_397;
l9_312=l9_398;
param_1=l9_312;
float4 l9_399=param_1;
float3 l9_400=l9_132;
l9_400=pow(l9_400,float3(1.0/(1.0-(param_4*0.99000001))));
float4 param_5=(((l9_221*l9_400.x)+(l9_310*l9_400.y))+(l9_399*l9_400.z))/float4((l9_400.x+l9_400.y)+l9_400.z);
Output_N210=param_5;
float4 Export_N211=float4(0.0);
Export_N211=Output_N210;
float Output_N150=0.0;
Output_N150=Export_N211.x;
float3 Output_N93=float3(0.0);
Output_N93=Normal_N85*float3(Output_N150);
float Output_N83=0.0;
float param_7=(*sc_set0.UserUniforms).Port_Value_N083;
float param_8=param_7+0.001;
param_8-=0.001;
Output_N83=param_8;
float3 Scale_N153=float3(0.0);
float4x4 l9_401=(*sc_set0.UserUniforms).sc_ModelMatrix;
float3 param_9=float3(length(l9_401[0].xyz),length(l9_401[1].xyz),length(l9_401[2].xyz));
Scale_N153=param_9;
float Output_N160=0.0;
float param_10=(*sc_set0.UserUniforms).dissipation;
Output_N160=param_10;
float ValueOut_N6=0.0;
float param_11=Output_N160;
float param_13=(*sc_set0.UserUniforms).Port_RangeMinA_N006;
float param_14=(*sc_set0.UserUniforms).Port_RangeMaxA_N006;
float param_15=(*sc_set0.UserUniforms).Port_RangeMinB_N006;
float param_16=(*sc_set0.UserUniforms).Port_RangeMaxB_N006;
float param_12=(((param_11-param_13)/((param_14-param_13)+1e-06))*(param_16-param_15))+param_15;
float l9_402;
if (param_16>param_15)
{
l9_402=fast::clamp(param_12,param_15,param_16);
}
else
{
l9_402=fast::clamp(param_12,param_16,param_15);
}
param_12=l9_402;
ValueOut_N6=param_12;
float3 Output_N119=float3(0.0);
Output_N119=((Output_N93*float3(Output_N83))*Scale_N153)*float3(ValueOut_N6);
float3 Output_N92=float3(0.0);
Output_N92=Position_N88+Output_N119;
float3 VectorOut_N147=float3(0.0);
VectorOut_N147=((*sc_set0.UserUniforms).sc_ModelMatrix*float4(Output_N92,1.0)).xyz;
WorldPosition=VectorOut_N147;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPosAndMotion.xyz;
WorldNormal=out.varNormalAndMotion.xyz;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_17=v;
float3 param_18=WorldPosition;
float3 param_19=WorldNormal;
float3 param_20=WorldTangent;
float4 param_21=v.position;
out.varPosAndMotion=float4(param_18.x,param_18.y,param_18.z,out.varPosAndMotion.w);
float3 l9_403=normalize(param_19);
out.varNormalAndMotion=float4(l9_403.x,l9_403.y,l9_403.z,out.varNormalAndMotion.w);
float3 l9_404=normalize(param_20);
out.varTangent=float4(l9_404.x,l9_404.y,l9_404.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_405=param_17.position;
float4 l9_406=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_407=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_407=0;
}
else
{
l9_407=gl_InstanceIndex%2;
}
int l9_408=l9_407;
l9_406=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_408]*l9_405;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_409=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_409=0;
}
else
{
l9_409=gl_InstanceIndex%2;
}
int l9_410=l9_409;
l9_406=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_410]*l9_405;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_411=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_411=0;
}
else
{
l9_411=gl_InstanceIndex%2;
}
int l9_412=l9_411;
l9_406=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_412]*l9_405;
}
else
{
l9_406=l9_405;
}
}
}
float4 l9_413=l9_406;
out.varViewSpaceDepth=-l9_413.z;
}
float4 l9_414=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_414=param_21;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_415=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_415=0;
}
else
{
l9_415=gl_InstanceIndex%2;
}
int l9_416=l9_415;
l9_414=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_416]*param_17.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_417=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_417=0;
}
else
{
l9_417=gl_InstanceIndex%2;
}
int l9_418=l9_417;
l9_414=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_418]*float4(out.varPosAndMotion.xyz,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_419=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_419=0;
}
else
{
l9_419=gl_InstanceIndex%2;
}
int l9_420=l9_419;
l9_414=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_420]*float4(out.varPosAndMotion.xyz,1.0);
}
}
}
}
out.varTex01=float4(param_17.texture0,param_17.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_421=param_17.position;
float4 l9_422=l9_421;
if (sc_RenderingSpace_tmp==1)
{
l9_422=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_421;
}
float4 l9_423=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_422;
float2 l9_424=((l9_423.xy/float2(l9_423.w))*0.5)+float2(0.5);
out.varShadowTex=l9_424;
}
float4 l9_425=l9_414;
if (sc_DepthBufferMode_tmp==1)
{
int l9_426=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_426=0;
}
else
{
l9_426=gl_InstanceIndex%2;
}
int l9_427=l9_426;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_427][2].w!=0.0)
{
float l9_428=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_425.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_425.w))*l9_428)-1.0)*l9_425.w;
}
}
float4 l9_429=l9_425;
l9_414=l9_429;
float4 l9_430=l9_414;
if ((int(sc_TAAEnabled_tmp)!=0))
{
float2 l9_431=l9_430.xy+((*sc_set0.UserUniforms).sc_TAAJitterOffset*l9_430.w);
l9_430=float4(l9_431.x,l9_431.y,l9_430.z,l9_430.w);
}
float4 l9_432=l9_430;
l9_414=l9_432;
float4 l9_433=l9_414;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_433.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_434=l9_433;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_435=dot(l9_434,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_436=l9_435;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_436;
}
}
float4 l9_437=float4(l9_433.x,-l9_433.y,(l9_433.z*0.5)+(l9_433.w*0.5),l9_433.w);
out.gl_Position=l9_437;
if ((int(sc_Voxelization_tmp)!=0))
{
sc_Vertex_t l9_439=param_17;
sc_Vertex_t l9_440=l9_439;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_441=l9_440;
float3 l9_442=in.blendShape0Pos;
float3 l9_443=in.blendShape0Normal;
float l9_444=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_445=l9_441;
float3 l9_446=l9_442;
float l9_447=l9_444;
float3 l9_448=l9_445.position.xyz+(l9_446*l9_447);
l9_445.position=float4(l9_448.x,l9_448.y,l9_448.z,l9_445.position.w);
l9_441=l9_445;
l9_441.normal+=(l9_443*l9_444);
l9_440=l9_441;
sc_Vertex_t l9_449=l9_440;
float3 l9_450=in.blendShape1Pos;
float3 l9_451=in.blendShape1Normal;
float l9_452=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_453=l9_449;
float3 l9_454=l9_450;
float l9_455=l9_452;
float3 l9_456=l9_453.position.xyz+(l9_454*l9_455);
l9_453.position=float4(l9_456.x,l9_456.y,l9_456.z,l9_453.position.w);
l9_449=l9_453;
l9_449.normal+=(l9_451*l9_452);
l9_440=l9_449;
sc_Vertex_t l9_457=l9_440;
float3 l9_458=in.blendShape2Pos;
float3 l9_459=in.blendShape2Normal;
float l9_460=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_461=l9_457;
float3 l9_462=l9_458;
float l9_463=l9_460;
float3 l9_464=l9_461.position.xyz+(l9_462*l9_463);
l9_461.position=float4(l9_464.x,l9_464.y,l9_464.z,l9_461.position.w);
l9_457=l9_461;
l9_457.normal+=(l9_459*l9_460);
l9_440=l9_457;
}
else
{
sc_Vertex_t l9_465=l9_440;
float3 l9_466=in.blendShape0Pos;
float l9_467=(*sc_set0.UserUniforms).weights0.x;
float3 l9_468=l9_465.position.xyz+(l9_466*l9_467);
l9_465.position=float4(l9_468.x,l9_468.y,l9_468.z,l9_465.position.w);
l9_440=l9_465;
sc_Vertex_t l9_469=l9_440;
float3 l9_470=in.blendShape1Pos;
float l9_471=(*sc_set0.UserUniforms).weights0.y;
float3 l9_472=l9_469.position.xyz+(l9_470*l9_471);
l9_469.position=float4(l9_472.x,l9_472.y,l9_472.z,l9_469.position.w);
l9_440=l9_469;
sc_Vertex_t l9_473=l9_440;
float3 l9_474=in.blendShape2Pos;
float l9_475=(*sc_set0.UserUniforms).weights0.z;
float3 l9_476=l9_473.position.xyz+(l9_474*l9_475);
l9_473.position=float4(l9_476.x,l9_476.y,l9_476.z,l9_473.position.w);
l9_440=l9_473;
sc_Vertex_t l9_477=l9_440;
float3 l9_478=in.blendShape3Pos;
float l9_479=(*sc_set0.UserUniforms).weights0.w;
float3 l9_480=l9_477.position.xyz+(l9_478*l9_479);
l9_477.position=float4(l9_480.x,l9_480.y,l9_480.z,l9_477.position.w);
l9_440=l9_477;
sc_Vertex_t l9_481=l9_440;
float3 l9_482=in.blendShape4Pos;
float l9_483=(*sc_set0.UserUniforms).weights1.x;
float3 l9_484=l9_481.position.xyz+(l9_482*l9_483);
l9_481.position=float4(l9_484.x,l9_484.y,l9_484.z,l9_481.position.w);
l9_440=l9_481;
sc_Vertex_t l9_485=l9_440;
float3 l9_486=in.blendShape5Pos;
float l9_487=(*sc_set0.UserUniforms).weights1.y;
float3 l9_488=l9_485.position.xyz+(l9_486*l9_487);
l9_485.position=float4(l9_488.x,l9_488.y,l9_488.z,l9_485.position.w);
l9_440=l9_485;
}
}
l9_439=l9_440;
sc_Vertex_t l9_489=l9_439;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_490=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_490=float4(1.0,fract(in.boneData.yzw));
l9_490.x-=dot(l9_490.yzw,float3(1.0));
}
float4 l9_491=l9_490;
float4 l9_492=l9_491;
int l9_493=int(in.boneData.x);
int l9_494=int(in.boneData.y);
int l9_495=int(in.boneData.z);
int l9_496=int(in.boneData.w);
int l9_497=l9_493;
float4 l9_498=l9_489.position;
float3 l9_499=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_500=l9_497;
float4 l9_501=(*sc_set0.sc_BonesUBO).sc_Bones[l9_500].boneMatrix[0];
float4 l9_502=(*sc_set0.sc_BonesUBO).sc_Bones[l9_500].boneMatrix[1];
float4 l9_503=(*sc_set0.sc_BonesUBO).sc_Bones[l9_500].boneMatrix[2];
float4 l9_504[3];
l9_504[0]=l9_501;
l9_504[1]=l9_502;
l9_504[2]=l9_503;
l9_499=float3(dot(l9_498,l9_504[0]),dot(l9_498,l9_504[1]),dot(l9_498,l9_504[2]));
}
else
{
l9_499=l9_498.xyz;
}
float3 l9_505=l9_499;
float3 l9_506=l9_505;
float l9_507=l9_492.x;
int l9_508=l9_494;
float4 l9_509=l9_489.position;
float3 l9_510=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_511=l9_508;
float4 l9_512=(*sc_set0.sc_BonesUBO).sc_Bones[l9_511].boneMatrix[0];
float4 l9_513=(*sc_set0.sc_BonesUBO).sc_Bones[l9_511].boneMatrix[1];
float4 l9_514=(*sc_set0.sc_BonesUBO).sc_Bones[l9_511].boneMatrix[2];
float4 l9_515[3];
l9_515[0]=l9_512;
l9_515[1]=l9_513;
l9_515[2]=l9_514;
l9_510=float3(dot(l9_509,l9_515[0]),dot(l9_509,l9_515[1]),dot(l9_509,l9_515[2]));
}
else
{
l9_510=l9_509.xyz;
}
float3 l9_516=l9_510;
float3 l9_517=l9_516;
float l9_518=l9_492.y;
int l9_519=l9_495;
float4 l9_520=l9_489.position;
float3 l9_521=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_522=l9_519;
float4 l9_523=(*sc_set0.sc_BonesUBO).sc_Bones[l9_522].boneMatrix[0];
float4 l9_524=(*sc_set0.sc_BonesUBO).sc_Bones[l9_522].boneMatrix[1];
float4 l9_525=(*sc_set0.sc_BonesUBO).sc_Bones[l9_522].boneMatrix[2];
float4 l9_526[3];
l9_526[0]=l9_523;
l9_526[1]=l9_524;
l9_526[2]=l9_525;
l9_521=float3(dot(l9_520,l9_526[0]),dot(l9_520,l9_526[1]),dot(l9_520,l9_526[2]));
}
else
{
l9_521=l9_520.xyz;
}
float3 l9_527=l9_521;
float3 l9_528=l9_527;
float l9_529=l9_492.z;
int l9_530=l9_496;
float4 l9_531=l9_489.position;
float3 l9_532=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_533=l9_530;
float4 l9_534=(*sc_set0.sc_BonesUBO).sc_Bones[l9_533].boneMatrix[0];
float4 l9_535=(*sc_set0.sc_BonesUBO).sc_Bones[l9_533].boneMatrix[1];
float4 l9_536=(*sc_set0.sc_BonesUBO).sc_Bones[l9_533].boneMatrix[2];
float4 l9_537[3];
l9_537[0]=l9_534;
l9_537[1]=l9_535;
l9_537[2]=l9_536;
l9_532=float3(dot(l9_531,l9_537[0]),dot(l9_531,l9_537[1]),dot(l9_531,l9_537[2]));
}
else
{
l9_532=l9_531.xyz;
}
float3 l9_538=l9_532;
float3 l9_539=(((l9_506*l9_507)+(l9_517*l9_518))+(l9_528*l9_529))+(l9_538*l9_492.w);
l9_489.position=float4(l9_539.x,l9_539.y,l9_539.z,l9_489.position.w);
int l9_540=l9_493;
float3x3 l9_541=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_540].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_540].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_540].normalMatrix[2].xyz));
float3x3 l9_542=l9_541;
float3x3 l9_543=l9_542;
int l9_544=l9_494;
float3x3 l9_545=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_544].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_544].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_544].normalMatrix[2].xyz));
float3x3 l9_546=l9_545;
float3x3 l9_547=l9_546;
int l9_548=l9_495;
float3x3 l9_549=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_548].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_548].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_548].normalMatrix[2].xyz));
float3x3 l9_550=l9_549;
float3x3 l9_551=l9_550;
int l9_552=l9_496;
float3x3 l9_553=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_552].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_552].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_552].normalMatrix[2].xyz));
float3x3 l9_554=l9_553;
float3x3 l9_555=l9_554;
l9_489.normal=((((l9_543*l9_489.normal)*l9_492.x)+((l9_547*l9_489.normal)*l9_492.y))+((l9_551*l9_489.normal)*l9_492.z))+((l9_555*l9_489.normal)*l9_492.w);
l9_489.tangent=((((l9_543*l9_489.tangent)*l9_492.x)+((l9_547*l9_489.tangent)*l9_492.y))+((l9_551*l9_489.tangent)*l9_492.z))+((l9_555*l9_489.tangent)*l9_492.w);
}
l9_439=l9_489;
float l9_556=(*sc_set0.UserUniforms).voxelization_params_0.y;
float l9_557=(*sc_set0.UserUniforms).voxelization_params_0.z;
float l9_558=(*sc_set0.UserUniforms).voxelization_params_0.w;
float l9_559=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.x;
float l9_560=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.y;
float l9_561=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.z;
float l9_562=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.w;
float l9_563=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.x;
float l9_564=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.y;
float3 l9_565=(*sc_set0.UserUniforms).voxelization_params_camera_pos;
float l9_566=l9_556/l9_557;
int l9_567=gl_InstanceIndex;
int l9_568=l9_567;
l9_439.position=(*sc_set0.UserUniforms).sc_ModelMatrixVoxelization*l9_439.position;
float3 l9_569=l9_439.position.xyz;
float3 l9_570=float3(float(l9_568%int(l9_558))*l9_556,float(l9_568/int(l9_558))*l9_556,(float(l9_568)*l9_566)+l9_563);
float3 l9_571=l9_569+l9_570;
float4 l9_572=float4(l9_571-l9_565,1.0);
float l9_573=l9_559;
float l9_574=l9_560;
float l9_575=l9_561;
float l9_576=l9_562;
float l9_577=l9_563;
float l9_578=l9_564;
float4x4 l9_579=float4x4(float4(2.0/(l9_574-l9_573),0.0,0.0,(-(l9_574+l9_573))/(l9_574-l9_573)),float4(0.0,2.0/(l9_576-l9_575),0.0,(-(l9_576+l9_575))/(l9_576-l9_575)),float4(0.0,0.0,(-2.0)/(l9_578-l9_577),(-(l9_578+l9_577))/(l9_578-l9_577)),float4(0.0,0.0,0.0,1.0));
float4x4 l9_580=l9_579;
float4 l9_581=l9_580*l9_572;
l9_581.w=1.0;
out.varScreenPos=l9_581;
float4 l9_582=l9_581*1.0;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_582.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_583=l9_582;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_584=dot(l9_583,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_585=l9_584;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_585;
}
}
float4 l9_586=float4(l9_582.x,-l9_582.y,(l9_582.z*0.5)+(l9_582.w*0.5),l9_582.w);
out.gl_Position=l9_586;
param_17=l9_439;
}
else
{
if ((int(sc_OutputBounds_tmp)!=0))
{
sc_Vertex_t l9_587=param_17;
sc_Vertex_t l9_588=l9_587;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_589=l9_588;
float3 l9_590=in.blendShape0Pos;
float3 l9_591=in.blendShape0Normal;
float l9_592=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_593=l9_589;
float3 l9_594=l9_590;
float l9_595=l9_592;
float3 l9_596=l9_593.position.xyz+(l9_594*l9_595);
l9_593.position=float4(l9_596.x,l9_596.y,l9_596.z,l9_593.position.w);
l9_589=l9_593;
l9_589.normal+=(l9_591*l9_592);
l9_588=l9_589;
sc_Vertex_t l9_597=l9_588;
float3 l9_598=in.blendShape1Pos;
float3 l9_599=in.blendShape1Normal;
float l9_600=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_601=l9_597;
float3 l9_602=l9_598;
float l9_603=l9_600;
float3 l9_604=l9_601.position.xyz+(l9_602*l9_603);
l9_601.position=float4(l9_604.x,l9_604.y,l9_604.z,l9_601.position.w);
l9_597=l9_601;
l9_597.normal+=(l9_599*l9_600);
l9_588=l9_597;
sc_Vertex_t l9_605=l9_588;
float3 l9_606=in.blendShape2Pos;
float3 l9_607=in.blendShape2Normal;
float l9_608=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_609=l9_605;
float3 l9_610=l9_606;
float l9_611=l9_608;
float3 l9_612=l9_609.position.xyz+(l9_610*l9_611);
l9_609.position=float4(l9_612.x,l9_612.y,l9_612.z,l9_609.position.w);
l9_605=l9_609;
l9_605.normal+=(l9_607*l9_608);
l9_588=l9_605;
}
else
{
sc_Vertex_t l9_613=l9_588;
float3 l9_614=in.blendShape0Pos;
float l9_615=(*sc_set0.UserUniforms).weights0.x;
float3 l9_616=l9_613.position.xyz+(l9_614*l9_615);
l9_613.position=float4(l9_616.x,l9_616.y,l9_616.z,l9_613.position.w);
l9_588=l9_613;
sc_Vertex_t l9_617=l9_588;
float3 l9_618=in.blendShape1Pos;
float l9_619=(*sc_set0.UserUniforms).weights0.y;
float3 l9_620=l9_617.position.xyz+(l9_618*l9_619);
l9_617.position=float4(l9_620.x,l9_620.y,l9_620.z,l9_617.position.w);
l9_588=l9_617;
sc_Vertex_t l9_621=l9_588;
float3 l9_622=in.blendShape2Pos;
float l9_623=(*sc_set0.UserUniforms).weights0.z;
float3 l9_624=l9_621.position.xyz+(l9_622*l9_623);
l9_621.position=float4(l9_624.x,l9_624.y,l9_624.z,l9_621.position.w);
l9_588=l9_621;
sc_Vertex_t l9_625=l9_588;
float3 l9_626=in.blendShape3Pos;
float l9_627=(*sc_set0.UserUniforms).weights0.w;
float3 l9_628=l9_625.position.xyz+(l9_626*l9_627);
l9_625.position=float4(l9_628.x,l9_628.y,l9_628.z,l9_625.position.w);
l9_588=l9_625;
sc_Vertex_t l9_629=l9_588;
float3 l9_630=in.blendShape4Pos;
float l9_631=(*sc_set0.UserUniforms).weights1.x;
float3 l9_632=l9_629.position.xyz+(l9_630*l9_631);
l9_629.position=float4(l9_632.x,l9_632.y,l9_632.z,l9_629.position.w);
l9_588=l9_629;
sc_Vertex_t l9_633=l9_588;
float3 l9_634=in.blendShape5Pos;
float l9_635=(*sc_set0.UserUniforms).weights1.y;
float3 l9_636=l9_633.position.xyz+(l9_634*l9_635);
l9_633.position=float4(l9_636.x,l9_636.y,l9_636.z,l9_633.position.w);
l9_588=l9_633;
}
}
l9_587=l9_588;
sc_Vertex_t l9_637=l9_587;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_638=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_638=float4(1.0,fract(in.boneData.yzw));
l9_638.x-=dot(l9_638.yzw,float3(1.0));
}
float4 l9_639=l9_638;
float4 l9_640=l9_639;
int l9_641=int(in.boneData.x);
int l9_642=int(in.boneData.y);
int l9_643=int(in.boneData.z);
int l9_644=int(in.boneData.w);
int l9_645=l9_641;
float4 l9_646=l9_637.position;
float3 l9_647=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_648=l9_645;
float4 l9_649=(*sc_set0.sc_BonesUBO).sc_Bones[l9_648].boneMatrix[0];
float4 l9_650=(*sc_set0.sc_BonesUBO).sc_Bones[l9_648].boneMatrix[1];
float4 l9_651=(*sc_set0.sc_BonesUBO).sc_Bones[l9_648].boneMatrix[2];
float4 l9_652[3];
l9_652[0]=l9_649;
l9_652[1]=l9_650;
l9_652[2]=l9_651;
l9_647=float3(dot(l9_646,l9_652[0]),dot(l9_646,l9_652[1]),dot(l9_646,l9_652[2]));
}
else
{
l9_647=l9_646.xyz;
}
float3 l9_653=l9_647;
float3 l9_654=l9_653;
float l9_655=l9_640.x;
int l9_656=l9_642;
float4 l9_657=l9_637.position;
float3 l9_658=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_659=l9_656;
float4 l9_660=(*sc_set0.sc_BonesUBO).sc_Bones[l9_659].boneMatrix[0];
float4 l9_661=(*sc_set0.sc_BonesUBO).sc_Bones[l9_659].boneMatrix[1];
float4 l9_662=(*sc_set0.sc_BonesUBO).sc_Bones[l9_659].boneMatrix[2];
float4 l9_663[3];
l9_663[0]=l9_660;
l9_663[1]=l9_661;
l9_663[2]=l9_662;
l9_658=float3(dot(l9_657,l9_663[0]),dot(l9_657,l9_663[1]),dot(l9_657,l9_663[2]));
}
else
{
l9_658=l9_657.xyz;
}
float3 l9_664=l9_658;
float3 l9_665=l9_664;
float l9_666=l9_640.y;
int l9_667=l9_643;
float4 l9_668=l9_637.position;
float3 l9_669=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_670=l9_667;
float4 l9_671=(*sc_set0.sc_BonesUBO).sc_Bones[l9_670].boneMatrix[0];
float4 l9_672=(*sc_set0.sc_BonesUBO).sc_Bones[l9_670].boneMatrix[1];
float4 l9_673=(*sc_set0.sc_BonesUBO).sc_Bones[l9_670].boneMatrix[2];
float4 l9_674[3];
l9_674[0]=l9_671;
l9_674[1]=l9_672;
l9_674[2]=l9_673;
l9_669=float3(dot(l9_668,l9_674[0]),dot(l9_668,l9_674[1]),dot(l9_668,l9_674[2]));
}
else
{
l9_669=l9_668.xyz;
}
float3 l9_675=l9_669;
float3 l9_676=l9_675;
float l9_677=l9_640.z;
int l9_678=l9_644;
float4 l9_679=l9_637.position;
float3 l9_680=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_681=l9_678;
float4 l9_682=(*sc_set0.sc_BonesUBO).sc_Bones[l9_681].boneMatrix[0];
float4 l9_683=(*sc_set0.sc_BonesUBO).sc_Bones[l9_681].boneMatrix[1];
float4 l9_684=(*sc_set0.sc_BonesUBO).sc_Bones[l9_681].boneMatrix[2];
float4 l9_685[3];
l9_685[0]=l9_682;
l9_685[1]=l9_683;
l9_685[2]=l9_684;
l9_680=float3(dot(l9_679,l9_685[0]),dot(l9_679,l9_685[1]),dot(l9_679,l9_685[2]));
}
else
{
l9_680=l9_679.xyz;
}
float3 l9_686=l9_680;
float3 l9_687=(((l9_654*l9_655)+(l9_665*l9_666))+(l9_676*l9_677))+(l9_686*l9_640.w);
l9_637.position=float4(l9_687.x,l9_687.y,l9_687.z,l9_637.position.w);
int l9_688=l9_641;
float3x3 l9_689=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_688].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_688].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_688].normalMatrix[2].xyz));
float3x3 l9_690=l9_689;
float3x3 l9_691=l9_690;
int l9_692=l9_642;
float3x3 l9_693=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_692].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_692].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_692].normalMatrix[2].xyz));
float3x3 l9_694=l9_693;
float3x3 l9_695=l9_694;
int l9_696=l9_643;
float3x3 l9_697=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_696].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_696].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_696].normalMatrix[2].xyz));
float3x3 l9_698=l9_697;
float3x3 l9_699=l9_698;
int l9_700=l9_644;
float3x3 l9_701=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_700].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_700].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_700].normalMatrix[2].xyz));
float3x3 l9_702=l9_701;
float3x3 l9_703=l9_702;
l9_637.normal=((((l9_691*l9_637.normal)*l9_640.x)+((l9_695*l9_637.normal)*l9_640.y))+((l9_699*l9_637.normal)*l9_640.z))+((l9_703*l9_637.normal)*l9_640.w);
l9_637.tangent=((((l9_691*l9_637.tangent)*l9_640.x)+((l9_695*l9_637.tangent)*l9_640.y))+((l9_699*l9_637.tangent)*l9_640.z))+((l9_703*l9_637.tangent)*l9_640.w);
}
l9_587=l9_637;
float3 l9_704=(*sc_set0.UserUniforms).voxelization_params_camera_pos;
float2 l9_705=((l9_587.position.xy/float2(l9_587.position.w))*0.5)+float2(0.5);
out.varTex01=float4(l9_705.x,l9_705.y,out.varTex01.z,out.varTex01.w);
l9_587.position=(*sc_set0.UserUniforms).sc_ModelMatrixVoxelization*l9_587.position;
float3 l9_706=l9_587.position.xyz-l9_704;
l9_587.position=float4(l9_706.x,l9_706.y,l9_706.z,l9_587.position.w);
out.varPosAndMotion=float4(l9_587.position.xyz.x,l9_587.position.xyz.y,l9_587.position.xyz.z,out.varPosAndMotion.w);
float3 l9_707=normalize(l9_587.normal);
out.varNormalAndMotion=float4(l9_707.x,l9_707.y,l9_707.z,out.varNormalAndMotion.w);
float l9_708=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.x;
float l9_709=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.y;
float l9_710=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.z;
float l9_711=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.w;
float l9_712=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.x;
float l9_713=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.y;
float l9_714=l9_708;
float l9_715=l9_709;
float l9_716=l9_710;
float l9_717=l9_711;
float l9_718=l9_712;
float l9_719=l9_713;
float4x4 l9_720=float4x4(float4(2.0/(l9_715-l9_714),0.0,0.0,(-(l9_715+l9_714))/(l9_715-l9_714)),float4(0.0,2.0/(l9_717-l9_716),0.0,(-(l9_717+l9_716))/(l9_717-l9_716)),float4(0.0,0.0,(-2.0)/(l9_719-l9_718),(-(l9_719+l9_718))/(l9_719-l9_718)),float4(0.0,0.0,0.0,1.0));
float4x4 l9_721=l9_720;
float4 l9_722=float4(0.0);
float3 l9_723=(l9_721*l9_587.position).xyz;
l9_722=float4(l9_723.x,l9_723.y,l9_723.z,l9_722.w);
l9_722.w=1.0;
out.varScreenPos=l9_722;
float4 l9_724=l9_722*1.0;
float4 l9_725=l9_724;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_725.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_726=l9_725;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_727=dot(l9_726,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_728=l9_727;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_728;
}
}
float4 l9_729=float4(l9_725.x,-l9_725.y,(l9_725.z*0.5)+(l9_725.w*0.5),l9_725.w);
out.gl_Position=l9_729;
param_17=l9_587;
}
}
v=param_17;
float3 param_22=out.varPosAndMotion.xyz;
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float4 l9_730=((*sc_set0.UserUniforms).sc_PrevFrameModelMatrix*(*sc_set0.UserUniforms).sc_ModelMatrixInverse)*float4(param_22,1.0);
float3 l9_731=param_22;
float3 l9_732=l9_730.xyz;
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
int l9_733=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_733=0;
}
else
{
l9_733=gl_InstanceIndex%2;
}
int l9_734=l9_733;
float4 l9_735=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_734]*float4(l9_731,1.0);
float2 l9_736=l9_735.xy/float2(l9_735.w);
l9_735=float4(l9_736.x,l9_736.y,l9_735.z,l9_735.w);
int l9_737=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_737=0;
}
else
{
l9_737=gl_InstanceIndex%2;
}
int l9_738=l9_737;
float4 l9_739=(*sc_set0.UserUniforms).sc_PrevFrameViewProjectionMatrixArray[l9_738]*float4(l9_732,1.0);
float2 l9_740=l9_739.xy/float2(l9_739.w);
l9_739=float4(l9_740.x,l9_740.y,l9_739.z,l9_739.w);
float2 l9_741=(l9_735.xy-l9_739.xy)*0.5;
out.varPosAndMotion.w=l9_741.x;
out.varNormalAndMotion.w=l9_741.y;
}
}
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 VertexNormal_WorldSpace;
float3 VertexTangent_WorldSpace;
float3 VertexBinormal_WorldSpace;
float3 ViewDirWS;
float3 SurfacePosition_WorldSpace;
float3 SurfacePosition_ObjectSpace;
float3 VertexNormal_ObjectSpace;
float2 gTriplanarCoords;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float shaderComplexityValue;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
float4 voxelization_params_0;
float4 voxelization_params_frustum_lrbt;
float4 voxelization_params_frustum_nf;
float3 voxelization_params_camera_pos;
float4x4 sc_ModelMatrixVoxelization;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float4 Tweak_N74Size;
float4 Tweak_N74Dims;
float4 Tweak_N74View;
float3x3 Tweak_N74Transform;
float4 Tweak_N74UvMinMax;
float4 Tweak_N74BorderColor;
float dissipation;
int colorIndex;
float4 Tweak_N9;
float4 Tweak_N14;
float4 Tweak_N16;
float4 Tweak_N17;
float4 Tweak_N18;
float4 Tweak_N20;
float4 Tweak_N21;
float4 Tweak_N22;
float4 Tweak_N23;
float4 Tweak_N115Size;
float4 Tweak_N115Dims;
float4 Tweak_N115View;
float3x3 Tweak_N115Transform;
float4 Tweak_N115UvMinMax;
float4 Tweak_N115BorderColor;
float radcentertransp;
float alpha;
float Port_Value_N155;
float3 Port_Import_N207;
float Port_Input1_N208;
float Port_Multiplier_N082;
float3 Port_Import_N206;
float Port_Import_N209;
float Port_Input1_N030;
float Port_Input2_N030;
float3 Port_Position_N210;
float3 Port_Normal_N210;
float Port_Value_N083;
float Port_RangeMinA_N006;
float Port_RangeMaxA_N006;
float Port_RangeMinB_N006;
float Port_RangeMaxB_N006;
float4 Port_Default_N011;
float4 Port_Import_N122;
float Port_Import_N124;
float Port_RangeMinA_N125;
float Port_RangeMaxA_N125;
float Port_RangeMinB_N125;
float Port_RangeMaxB_N125;
float Port_Import_N126;
float Port_Input1_N127;
float Port_Import_N128;
float Port_Input1_N129;
float Port_Import_N163;
float Port_Import_N165;
float3 Port_Import_N166;
float Port_Input1_N141;
float Port_Input1_N117;
float Port_Exponent_N134;
float Port_Intensity_N134;
float Port_RangeMinA_N027;
float Port_RangeMaxA_N027;
float Port_RangeMinB_N027;
float Port_RangeMaxB_N027;
float Port_RangeMinA_N028;
float Port_RangeMaxA_N028;
float Port_RangeMinB_N028;
float Port_RangeMaxB_N028;
float Port_Input1_N145;
float4 Port_Input1_N142;
float4 Port_Input2_N142;
float Port_Input0_N098;
float Port_Import_N097;
float Port_Input0_N099;
float3 Port_Import_N044;
float Port_Input1_N045;
float3 Port_Import_N046;
float Port_Import_N047;
float Port_Input1_N048;
float Port_Input2_N048;
float3 Port_Position_N052;
float3 Port_Normal_N052;
float Port_Import_N100;
float Port_Input1_N101;
float Port_RangeMinA_N158;
float Port_RangeMaxA_N158;
float Port_RangeMinB_N158;
float Port_RangeMaxB_N158;
float Port_Import_N102;
float Port_Input1_N103;
float Port_Input1_N106;
float Port_Input2_N106;
float Port_Input1_N157;
float Port_Input2_N157;
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_Set0
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> Tweak_N115 [[id(1)]];
texture2d<float> Tweak_N74 [[id(2)]];
texture2d<float> intensityTexture [[id(3)]];
texture2d<float> sc_ScreenTexture [[id(15)]];
sampler Tweak_N115SmpSC [[id(18)]];
sampler Tweak_N74SmpSC [[id(19)]];
sampler intensityTextureSmpSC [[id(20)]];
sampler sc_ScreenTextureSmpSC [[id(25)]];
constant userUniformsObj* UserUniforms [[id(28)]];
};
struct main_frag_out
{
float4 sc_FragData0 [[color(0)]];
};
struct main_frag_in
{
float4 varPosAndMotion [[user(locn0)]];
float4 varNormalAndMotion [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varTex01 [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
float transformSingleColor(thread const float& original,thread const float& intMap,thread const float& target)
{
if (((int(BLEND_MODE_REALISTIC_tmp)!=0)||(int(BLEND_MODE_FORGRAY_tmp)!=0))||(int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
return original/pow(1.0-target,intMap);
}
else
{
if ((int(BLEND_MODE_DIVISION_tmp)!=0))
{
return original/(1.0-target);
}
else
{
if ((int(BLEND_MODE_BRIGHT_tmp)!=0))
{
return original/pow(1.0-target,2.0-(2.0*original));
}
}
}
return 0.0;
}
float3 transformColor(thread const float& yValue,thread const float3& original,thread const float3& target,thread const float& weight,thread const float& intMap)
{
if ((int(BLEND_MODE_INTENSE_tmp)!=0))
{
float3 param=original;
float3 l9_0=param;
float4 l9_1;
if (l9_0.y<l9_0.z)
{
l9_1=float4(l9_0.zy,-1.0,0.66666669);
}
else
{
l9_1=float4(l9_0.yz,0.0,-0.33333334);
}
float4 l9_2=l9_1;
float4 l9_3;
if (l9_0.x<l9_2.x)
{
l9_3=float4(l9_2.xyw,l9_0.x);
}
else
{
l9_3=float4(l9_0.x,l9_2.yzx);
}
float4 l9_4=l9_3;
float l9_5=l9_4.x-fast::min(l9_4.w,l9_4.y);
float l9_6=abs(((l9_4.w-l9_4.y)/((6.0*l9_5)+1e-07))+l9_4.z);
float l9_7=l9_4.x;
float3 l9_8=float3(l9_6,l9_5,l9_7);
float3 l9_9=l9_8;
float l9_10=l9_9.z-(l9_9.y*0.5);
float l9_11=l9_9.y/((1.0-abs((2.0*l9_10)-1.0))+1e-07);
float3 l9_12=float3(l9_9.x,l9_11,l9_10);
float3 hslOrig=l9_12;
float3 res=float3(0.0);
res.x=target.x;
res.y=target.y;
res.z=hslOrig.z;
float3 param_1=res;
float l9_13=param_1.x;
float l9_14=abs((6.0*l9_13)-3.0)-1.0;
float l9_15=2.0-abs((6.0*l9_13)-2.0);
float l9_16=2.0-abs((6.0*l9_13)-4.0);
float3 l9_17=fast::clamp(float3(l9_14,l9_15,l9_16),float3(0.0),float3(1.0));
float3 l9_18=l9_17;
float l9_19=(1.0-abs((2.0*param_1.z)-1.0))*param_1.y;
l9_18=((l9_18-float3(0.5))*l9_19)+float3(param_1.z);
float3 l9_20=l9_18;
res=l9_20;
float3 resColor=mix(original,res,float3(weight));
return resColor;
}
else
{
float3 tmpColor=float3(0.0);
float param_2=yValue;
float param_3=intMap;
float param_4=target.x;
tmpColor.x=transformSingleColor(param_2,param_3,param_4);
float param_5=yValue;
float param_6=intMap;
float param_7=target.y;
tmpColor.y=transformSingleColor(param_5,param_6,param_7);
float param_8=yValue;
float param_9=intMap;
float param_10=target.z;
tmpColor.z=transformSingleColor(param_8,param_9,param_10);
tmpColor=fast::clamp(tmpColor,float3(0.0),float3(1.0));
float3 resColor_1=mix(original,tmpColor,float3(weight));
return resColor_1;
}
}
float3 definedBlend(thread const float3& a,thread const float3& b,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> intensityTexture,thread sampler intensityTextureSmpSC)
{
if ((int(BLEND_MODE_LIGHTEN_tmp)!=0))
{
return fast::max(a,b);
}
else
{
if ((int(BLEND_MODE_DARKEN_tmp)!=0))
{
return fast::min(a,b);
}
else
{
if ((int(BLEND_MODE_DIVIDE_tmp)!=0))
{
return b/a;
}
else
{
if ((int(BLEND_MODE_AVERAGE_tmp)!=0))
{
return (a+b)*0.5;
}
else
{
if ((int(BLEND_MODE_SUBTRACT_tmp)!=0))
{
return fast::max((a+b)-float3(1.0),float3(0.0));
}
else
{
if ((int(BLEND_MODE_DIFFERENCE_tmp)!=0))
{
return abs(a-b);
}
else
{
if ((int(BLEND_MODE_NEGATION_tmp)!=0))
{
return float3(1.0)-abs((float3(1.0)-a)-b);
}
else
{
if ((int(BLEND_MODE_EXCLUSION_tmp)!=0))
{
return (a+b)-((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_OVERLAY_tmp)!=0))
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1=l9_0;
float l9_2;
if (a.y<0.5)
{
l9_2=(2.0*a.y)*b.y;
}
else
{
l9_2=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_3=l9_2;
float l9_4;
if (a.z<0.5)
{
l9_4=(2.0*a.z)*b.z;
}
else
{
l9_4=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return float3(l9_1,l9_3,l9_4);
}
else
{
if ((int(BLEND_MODE_SOFT_LIGHT_tmp)!=0))
{
return (((float3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_HARD_LIGHT_tmp)!=0))
{
float l9_5;
if (b.x<0.5)
{
l9_5=(2.0*b.x)*a.x;
}
else
{
l9_5=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_6=l9_5;
float l9_7;
if (b.y<0.5)
{
l9_7=(2.0*b.y)*a.y;
}
else
{
l9_7=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_8=l9_7;
float l9_9;
if (b.z<0.5)
{
l9_9=(2.0*b.z)*a.z;
}
else
{
l9_9=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return float3(l9_6,l9_8,l9_9);
}
else
{
if ((int(BLEND_MODE_COLOR_DODGE_tmp)!=0))
{
float l9_10;
if (b.x==1.0)
{
l9_10=b.x;
}
else
{
l9_10=fast::min(a.x/(1.0-b.x),1.0);
}
float l9_11=l9_10;
float l9_12;
if (b.y==1.0)
{
l9_12=b.y;
}
else
{
l9_12=fast::min(a.y/(1.0-b.y),1.0);
}
float l9_13=l9_12;
float l9_14;
if (b.z==1.0)
{
l9_14=b.z;
}
else
{
l9_14=fast::min(a.z/(1.0-b.z),1.0);
}
return float3(l9_11,l9_13,l9_14);
}
else
{
if ((int(BLEND_MODE_COLOR_BURN_tmp)!=0))
{
float l9_15;
if (b.x==0.0)
{
l9_15=b.x;
}
else
{
l9_15=fast::max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_16=l9_15;
float l9_17;
if (b.y==0.0)
{
l9_17=b.y;
}
else
{
l9_17=fast::max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_18=l9_17;
float l9_19;
if (b.z==0.0)
{
l9_19=b.z;
}
else
{
l9_19=fast::max(1.0-((1.0-a.z)/b.z),0.0);
}
return float3(l9_16,l9_18,l9_19);
}
else
{
if ((int(BLEND_MODE_LINEAR_LIGHT_tmp)!=0))
{
float l9_20;
if (b.x<0.5)
{
l9_20=fast::max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_20=fast::min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_21=l9_20;
float l9_22;
if (b.y<0.5)
{
l9_22=fast::max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_22=fast::min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_23=l9_22;
float l9_24;
if (b.z<0.5)
{
l9_24=fast::max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_24=fast::min(a.z+(2.0*(b.z-0.5)),1.0);
}
return float3(l9_21,l9_23,l9_24);
}
else
{
if ((int(BLEND_MODE_VIVID_LIGHT_tmp)!=0))
{
float l9_25;
if (b.x<0.5)
{
float l9_26;
if ((2.0*b.x)==0.0)
{
l9_26=2.0*b.x;
}
else
{
l9_26=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_25=l9_26;
}
else
{
float l9_27;
if ((2.0*(b.x-0.5))==1.0)
{
l9_27=2.0*(b.x-0.5);
}
else
{
l9_27=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_25=l9_27;
}
float l9_28=l9_25;
float l9_29;
if (b.y<0.5)
{
float l9_30;
if ((2.0*b.y)==0.0)
{
l9_30=2.0*b.y;
}
else
{
l9_30=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_29=l9_30;
}
else
{
float l9_31;
if ((2.0*(b.y-0.5))==1.0)
{
l9_31=2.0*(b.y-0.5);
}
else
{
l9_31=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_29=l9_31;
}
float l9_32=l9_29;
float l9_33;
if (b.z<0.5)
{
float l9_34;
if ((2.0*b.z)==0.0)
{
l9_34=2.0*b.z;
}
else
{
l9_34=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_33=l9_34;
}
else
{
float l9_35;
if ((2.0*(b.z-0.5))==1.0)
{
l9_35=2.0*(b.z-0.5);
}
else
{
l9_35=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_33=l9_35;
}
return float3(l9_28,l9_32,l9_33);
}
else
{
if ((int(BLEND_MODE_PIN_LIGHT_tmp)!=0))
{
float l9_36;
if (b.x<0.5)
{
l9_36=fast::min(a.x,2.0*b.x);
}
else
{
l9_36=fast::max(a.x,2.0*(b.x-0.5));
}
float l9_37=l9_36;
float l9_38;
if (b.y<0.5)
{
l9_38=fast::min(a.y,2.0*b.y);
}
else
{
l9_38=fast::max(a.y,2.0*(b.y-0.5));
}
float l9_39=l9_38;
float l9_40;
if (b.z<0.5)
{
l9_40=fast::min(a.z,2.0*b.z);
}
else
{
l9_40=fast::max(a.z,2.0*(b.z-0.5));
}
return float3(l9_37,l9_39,l9_40);
}
else
{
if ((int(BLEND_MODE_HARD_MIX_tmp)!=0))
{
float l9_41;
if (b.x<0.5)
{
float l9_42;
if ((2.0*b.x)==0.0)
{
l9_42=2.0*b.x;
}
else
{
l9_42=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_41=l9_42;
}
else
{
float l9_43;
if ((2.0*(b.x-0.5))==1.0)
{
l9_43=2.0*(b.x-0.5);
}
else
{
l9_43=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_41=l9_43;
}
float l9_44=l9_41;
float l9_45;
if (b.y<0.5)
{
float l9_46;
if ((2.0*b.y)==0.0)
{
l9_46=2.0*b.y;
}
else
{
l9_46=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_45=l9_46;
}
else
{
float l9_47;
if ((2.0*(b.y-0.5))==1.0)
{
l9_47=2.0*(b.y-0.5);
}
else
{
l9_47=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_45=l9_47;
}
float l9_48=l9_45;
float l9_49;
if (b.z<0.5)
{
float l9_50;
if ((2.0*b.z)==0.0)
{
l9_50=2.0*b.z;
}
else
{
l9_50=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_49=l9_50;
}
else
{
float l9_51;
if ((2.0*(b.z-0.5))==1.0)
{
l9_51=2.0*(b.z-0.5);
}
else
{
l9_51=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_49=l9_51;
}
return float3((l9_44<0.5) ? 0.0 : 1.0,(l9_48<0.5) ? 0.0 : 1.0,(l9_49<0.5) ? 0.0 : 1.0);
}
else
{
if ((int(BLEND_MODE_HARD_REFLECT_tmp)!=0))
{
float l9_52;
if (b.x==1.0)
{
l9_52=b.x;
}
else
{
l9_52=fast::min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_53=l9_52;
float l9_54;
if (b.y==1.0)
{
l9_54=b.y;
}
else
{
l9_54=fast::min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_55=l9_54;
float l9_56;
if (b.z==1.0)
{
l9_56=b.z;
}
else
{
l9_56=fast::min((a.z*a.z)/(1.0-b.z),1.0);
}
return float3(l9_53,l9_55,l9_56);
}
else
{
if ((int(BLEND_MODE_HARD_GLOW_tmp)!=0))
{
float l9_57;
if (a.x==1.0)
{
l9_57=a.x;
}
else
{
l9_57=fast::min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_58=l9_57;
float l9_59;
if (a.y==1.0)
{
l9_59=a.y;
}
else
{
l9_59=fast::min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_60=l9_59;
float l9_61;
if (a.z==1.0)
{
l9_61=a.z;
}
else
{
l9_61=fast::min((b.z*b.z)/(1.0-a.z),1.0);
}
return float3(l9_58,l9_60,l9_61);
}
else
{
if ((int(BLEND_MODE_HARD_PHOENIX_tmp)!=0))
{
return (fast::min(a,b)-fast::max(a,b))+float3(1.0);
}
else
{
if ((int(BLEND_MODE_HUE_tmp)!=0))
{
float3 param=a;
float3 param_1=b;
float3 l9_62=param;
float3 l9_63=l9_62;
float4 l9_64;
if (l9_63.y<l9_63.z)
{
l9_64=float4(l9_63.zy,-1.0,0.66666669);
}
else
{
l9_64=float4(l9_63.yz,0.0,-0.33333334);
}
float4 l9_65=l9_64;
float4 l9_66;
if (l9_63.x<l9_65.x)
{
l9_66=float4(l9_65.xyw,l9_63.x);
}
else
{
l9_66=float4(l9_63.x,l9_65.yzx);
}
float4 l9_67=l9_66;
float l9_68=l9_67.x-fast::min(l9_67.w,l9_67.y);
float l9_69=abs(((l9_67.w-l9_67.y)/((6.0*l9_68)+1e-07))+l9_67.z);
float l9_70=l9_67.x;
float3 l9_71=float3(l9_69,l9_68,l9_70);
float3 l9_72=l9_71;
float l9_73=l9_72.z-(l9_72.y*0.5);
float l9_74=l9_72.y/((1.0-abs((2.0*l9_73)-1.0))+1e-07);
float3 l9_75=float3(l9_72.x,l9_74,l9_73);
float3 l9_76=l9_75;
float3 l9_77=param_1;
float3 l9_78=l9_77;
float4 l9_79;
if (l9_78.y<l9_78.z)
{
l9_79=float4(l9_78.zy,-1.0,0.66666669);
}
else
{
l9_79=float4(l9_78.yz,0.0,-0.33333334);
}
float4 l9_80=l9_79;
float4 l9_81;
if (l9_78.x<l9_80.x)
{
l9_81=float4(l9_80.xyw,l9_78.x);
}
else
{
l9_81=float4(l9_78.x,l9_80.yzx);
}
float4 l9_82=l9_81;
float l9_83=l9_82.x-fast::min(l9_82.w,l9_82.y);
float l9_84=abs(((l9_82.w-l9_82.y)/((6.0*l9_83)+1e-07))+l9_82.z);
float l9_85=l9_82.x;
float3 l9_86=float3(l9_84,l9_83,l9_85);
float3 l9_87=l9_86;
float l9_88=l9_87.z-(l9_87.y*0.5);
float l9_89=l9_87.y/((1.0-abs((2.0*l9_88)-1.0))+1e-07);
float3 l9_90=float3(l9_87.x,l9_89,l9_88);
float3 l9_91=float3(l9_90.x,l9_76.y,l9_76.z);
float l9_92=l9_91.x;
float l9_93=abs((6.0*l9_92)-3.0)-1.0;
float l9_94=2.0-abs((6.0*l9_92)-2.0);
float l9_95=2.0-abs((6.0*l9_92)-4.0);
float3 l9_96=fast::clamp(float3(l9_93,l9_94,l9_95),float3(0.0),float3(1.0));
float3 l9_97=l9_96;
float l9_98=(1.0-abs((2.0*l9_91.z)-1.0))*l9_91.y;
l9_97=((l9_97-float3(0.5))*l9_98)+float3(l9_91.z);
float3 l9_99=l9_97;
float3 l9_100=l9_99;
return l9_100;
}
else
{
if ((int(BLEND_MODE_SATURATION_tmp)!=0))
{
float3 param_2=a;
float3 param_3=b;
float3 l9_101=param_2;
float3 l9_102=l9_101;
float4 l9_103;
if (l9_102.y<l9_102.z)
{
l9_103=float4(l9_102.zy,-1.0,0.66666669);
}
else
{
l9_103=float4(l9_102.yz,0.0,-0.33333334);
}
float4 l9_104=l9_103;
float4 l9_105;
if (l9_102.x<l9_104.x)
{
l9_105=float4(l9_104.xyw,l9_102.x);
}
else
{
l9_105=float4(l9_102.x,l9_104.yzx);
}
float4 l9_106=l9_105;
float l9_107=l9_106.x-fast::min(l9_106.w,l9_106.y);
float l9_108=abs(((l9_106.w-l9_106.y)/((6.0*l9_107)+1e-07))+l9_106.z);
float l9_109=l9_106.x;
float3 l9_110=float3(l9_108,l9_107,l9_109);
float3 l9_111=l9_110;
float l9_112=l9_111.z-(l9_111.y*0.5);
float l9_113=l9_111.y/((1.0-abs((2.0*l9_112)-1.0))+1e-07);
float3 l9_114=float3(l9_111.x,l9_113,l9_112);
float3 l9_115=l9_114;
float l9_116=l9_115.x;
float3 l9_117=param_3;
float3 l9_118=l9_117;
float4 l9_119;
if (l9_118.y<l9_118.z)
{
l9_119=float4(l9_118.zy,-1.0,0.66666669);
}
else
{
l9_119=float4(l9_118.yz,0.0,-0.33333334);
}
float4 l9_120=l9_119;
float4 l9_121;
if (l9_118.x<l9_120.x)
{
l9_121=float4(l9_120.xyw,l9_118.x);
}
else
{
l9_121=float4(l9_118.x,l9_120.yzx);
}
float4 l9_122=l9_121;
float l9_123=l9_122.x-fast::min(l9_122.w,l9_122.y);
float l9_124=abs(((l9_122.w-l9_122.y)/((6.0*l9_123)+1e-07))+l9_122.z);
float l9_125=l9_122.x;
float3 l9_126=float3(l9_124,l9_123,l9_125);
float3 l9_127=l9_126;
float l9_128=l9_127.z-(l9_127.y*0.5);
float l9_129=l9_127.y/((1.0-abs((2.0*l9_128)-1.0))+1e-07);
float3 l9_130=float3(l9_127.x,l9_129,l9_128);
float3 l9_131=float3(l9_116,l9_130.y,l9_115.z);
float l9_132=l9_131.x;
float l9_133=abs((6.0*l9_132)-3.0)-1.0;
float l9_134=2.0-abs((6.0*l9_132)-2.0);
float l9_135=2.0-abs((6.0*l9_132)-4.0);
float3 l9_136=fast::clamp(float3(l9_133,l9_134,l9_135),float3(0.0),float3(1.0));
float3 l9_137=l9_136;
float l9_138=(1.0-abs((2.0*l9_131.z)-1.0))*l9_131.y;
l9_137=((l9_137-float3(0.5))*l9_138)+float3(l9_131.z);
float3 l9_139=l9_137;
float3 l9_140=l9_139;
return l9_140;
}
else
{
if ((int(BLEND_MODE_COLOR_tmp)!=0))
{
float3 param_4=a;
float3 param_5=b;
float3 l9_141=param_5;
float3 l9_142=l9_141;
float4 l9_143;
if (l9_142.y<l9_142.z)
{
l9_143=float4(l9_142.zy,-1.0,0.66666669);
}
else
{
l9_143=float4(l9_142.yz,0.0,-0.33333334);
}
float4 l9_144=l9_143;
float4 l9_145;
if (l9_142.x<l9_144.x)
{
l9_145=float4(l9_144.xyw,l9_142.x);
}
else
{
l9_145=float4(l9_142.x,l9_144.yzx);
}
float4 l9_146=l9_145;
float l9_147=l9_146.x-fast::min(l9_146.w,l9_146.y);
float l9_148=abs(((l9_146.w-l9_146.y)/((6.0*l9_147)+1e-07))+l9_146.z);
float l9_149=l9_146.x;
float3 l9_150=float3(l9_148,l9_147,l9_149);
float3 l9_151=l9_150;
float l9_152=l9_151.z-(l9_151.y*0.5);
float l9_153=l9_151.y/((1.0-abs((2.0*l9_152)-1.0))+1e-07);
float3 l9_154=float3(l9_151.x,l9_153,l9_152);
float3 l9_155=l9_154;
float l9_156=l9_155.x;
float l9_157=l9_155.y;
float3 l9_158=param_4;
float3 l9_159=l9_158;
float4 l9_160;
if (l9_159.y<l9_159.z)
{
l9_160=float4(l9_159.zy,-1.0,0.66666669);
}
else
{
l9_160=float4(l9_159.yz,0.0,-0.33333334);
}
float4 l9_161=l9_160;
float4 l9_162;
if (l9_159.x<l9_161.x)
{
l9_162=float4(l9_161.xyw,l9_159.x);
}
else
{
l9_162=float4(l9_159.x,l9_161.yzx);
}
float4 l9_163=l9_162;
float l9_164=l9_163.x-fast::min(l9_163.w,l9_163.y);
float l9_165=abs(((l9_163.w-l9_163.y)/((6.0*l9_164)+1e-07))+l9_163.z);
float l9_166=l9_163.x;
float3 l9_167=float3(l9_165,l9_164,l9_166);
float3 l9_168=l9_167;
float l9_169=l9_168.z-(l9_168.y*0.5);
float l9_170=l9_168.y/((1.0-abs((2.0*l9_169)-1.0))+1e-07);
float3 l9_171=float3(l9_168.x,l9_170,l9_169);
float3 l9_172=float3(l9_156,l9_157,l9_171.z);
float l9_173=l9_172.x;
float l9_174=abs((6.0*l9_173)-3.0)-1.0;
float l9_175=2.0-abs((6.0*l9_173)-2.0);
float l9_176=2.0-abs((6.0*l9_173)-4.0);
float3 l9_177=fast::clamp(float3(l9_174,l9_175,l9_176),float3(0.0),float3(1.0));
float3 l9_178=l9_177;
float l9_179=(1.0-abs((2.0*l9_172.z)-1.0))*l9_172.y;
l9_178=((l9_178-float3(0.5))*l9_179)+float3(l9_172.z);
float3 l9_180=l9_178;
float3 l9_181=l9_180;
return l9_181;
}
else
{
if ((int(BLEND_MODE_LUMINOSITY_tmp)!=0))
{
float3 param_6=a;
float3 param_7=b;
float3 l9_182=param_6;
float3 l9_183=l9_182;
float4 l9_184;
if (l9_183.y<l9_183.z)
{
l9_184=float4(l9_183.zy,-1.0,0.66666669);
}
else
{
l9_184=float4(l9_183.yz,0.0,-0.33333334);
}
float4 l9_185=l9_184;
float4 l9_186;
if (l9_183.x<l9_185.x)
{
l9_186=float4(l9_185.xyw,l9_183.x);
}
else
{
l9_186=float4(l9_183.x,l9_185.yzx);
}
float4 l9_187=l9_186;
float l9_188=l9_187.x-fast::min(l9_187.w,l9_187.y);
float l9_189=abs(((l9_187.w-l9_187.y)/((6.0*l9_188)+1e-07))+l9_187.z);
float l9_190=l9_187.x;
float3 l9_191=float3(l9_189,l9_188,l9_190);
float3 l9_192=l9_191;
float l9_193=l9_192.z-(l9_192.y*0.5);
float l9_194=l9_192.y/((1.0-abs((2.0*l9_193)-1.0))+1e-07);
float3 l9_195=float3(l9_192.x,l9_194,l9_193);
float3 l9_196=l9_195;
float l9_197=l9_196.x;
float l9_198=l9_196.y;
float3 l9_199=param_7;
float3 l9_200=l9_199;
float4 l9_201;
if (l9_200.y<l9_200.z)
{
l9_201=float4(l9_200.zy,-1.0,0.66666669);
}
else
{
l9_201=float4(l9_200.yz,0.0,-0.33333334);
}
float4 l9_202=l9_201;
float4 l9_203;
if (l9_200.x<l9_202.x)
{
l9_203=float4(l9_202.xyw,l9_200.x);
}
else
{
l9_203=float4(l9_200.x,l9_202.yzx);
}
float4 l9_204=l9_203;
float l9_205=l9_204.x-fast::min(l9_204.w,l9_204.y);
float l9_206=abs(((l9_204.w-l9_204.y)/((6.0*l9_205)+1e-07))+l9_204.z);
float l9_207=l9_204.x;
float3 l9_208=float3(l9_206,l9_205,l9_207);
float3 l9_209=l9_208;
float l9_210=l9_209.z-(l9_209.y*0.5);
float l9_211=l9_209.y/((1.0-abs((2.0*l9_210)-1.0))+1e-07);
float3 l9_212=float3(l9_209.x,l9_211,l9_210);
float3 l9_213=float3(l9_197,l9_198,l9_212.z);
float l9_214=l9_213.x;
float l9_215=abs((6.0*l9_214)-3.0)-1.0;
float l9_216=2.0-abs((6.0*l9_214)-2.0);
float l9_217=2.0-abs((6.0*l9_214)-4.0);
float3 l9_218=fast::clamp(float3(l9_215,l9_216,l9_217),float3(0.0),float3(1.0));
float3 l9_219=l9_218;
float l9_220=(1.0-abs((2.0*l9_213.z)-1.0))*l9_213.y;
l9_219=((l9_219-float3(0.5))*l9_220)+float3(l9_213.z);
float3 l9_221=l9_219;
float3 l9_222=l9_221;
return l9_222;
}
else
{
float3 param_8=a;
float3 param_9=b;
float3 l9_223=param_8;
float l9_224=((0.29899999*l9_223.x)+(0.58700001*l9_223.y))+(0.114*l9_223.z);
float l9_225=l9_224;
float l9_226=1.0;
float l9_227=pow(l9_225,1.0/UserUniforms.correctedIntensity);
int l9_228;
if ((int(intensityTextureHasSwappedViews_tmp)!=0))
{
int l9_229=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_229=0;
}
else
{
l9_229=varStereoViewID;
}
int l9_230=l9_229;
l9_228=1-l9_230;
}
else
{
int l9_231=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=varStereoViewID;
}
int l9_232=l9_231;
l9_228=l9_232;
}
int l9_233=l9_228;
int l9_234=intensityTextureLayout_tmp;
int l9_235=l9_233;
float2 l9_236=float2(l9_227,0.5);
bool l9_237=(int(SC_USE_UV_TRANSFORM_intensityTexture_tmp)!=0);
float3x3 l9_238=UserUniforms.intensityTextureTransform;
int2 l9_239=int2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp);
bool l9_240=(int(SC_USE_UV_MIN_MAX_intensityTexture_tmp)!=0);
float4 l9_241=UserUniforms.intensityTextureUvMinMax;
bool l9_242=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp)!=0);
float4 l9_243=UserUniforms.intensityTextureBorderColor;
float l9_244=0.0;
bool l9_245=l9_242&&(!l9_240);
float l9_246=1.0;
float l9_247=l9_236.x;
int l9_248=l9_239.x;
if (l9_248==1)
{
l9_247=fract(l9_247);
}
else
{
if (l9_248==2)
{
float l9_249=fract(l9_247);
float l9_250=l9_247-l9_249;
float l9_251=step(0.25,fract(l9_250*0.5));
l9_247=mix(l9_249,1.0-l9_249,fast::clamp(l9_251,0.0,1.0));
}
}
l9_236.x=l9_247;
float l9_252=l9_236.y;
int l9_253=l9_239.y;
if (l9_253==1)
{
l9_252=fract(l9_252);
}
else
{
if (l9_253==2)
{
float l9_254=fract(l9_252);
float l9_255=l9_252-l9_254;
float l9_256=step(0.25,fract(l9_255*0.5));
l9_252=mix(l9_254,1.0-l9_254,fast::clamp(l9_256,0.0,1.0));
}
}
l9_236.y=l9_252;
if (l9_240)
{
bool l9_257=l9_242;
bool l9_258;
if (l9_257)
{
l9_258=l9_239.x==3;
}
else
{
l9_258=l9_257;
}
float l9_259=l9_236.x;
float l9_260=l9_241.x;
float l9_261=l9_241.z;
bool l9_262=l9_258;
float l9_263=l9_246;
float l9_264=fast::clamp(l9_259,l9_260,l9_261);
float l9_265=step(abs(l9_259-l9_264),9.9999997e-06);
l9_263*=(l9_265+((1.0-float(l9_262))*(1.0-l9_265)));
l9_259=l9_264;
l9_236.x=l9_259;
l9_246=l9_263;
bool l9_266=l9_242;
bool l9_267;
if (l9_266)
{
l9_267=l9_239.y==3;
}
else
{
l9_267=l9_266;
}
float l9_268=l9_236.y;
float l9_269=l9_241.y;
float l9_270=l9_241.w;
bool l9_271=l9_267;
float l9_272=l9_246;
float l9_273=fast::clamp(l9_268,l9_269,l9_270);
float l9_274=step(abs(l9_268-l9_273),9.9999997e-06);
l9_272*=(l9_274+((1.0-float(l9_271))*(1.0-l9_274)));
l9_268=l9_273;
l9_236.y=l9_268;
l9_246=l9_272;
}
float2 l9_275=l9_236;
bool l9_276=l9_237;
float3x3 l9_277=l9_238;
if (l9_276)
{
l9_275=float2((l9_277*float3(l9_275,1.0)).xy);
}
float2 l9_278=l9_275;
l9_236=l9_278;
float l9_279=l9_236.x;
int l9_280=l9_239.x;
bool l9_281=l9_245;
float l9_282=l9_246;
if ((l9_280==0)||(l9_280==3))
{
float l9_283=l9_279;
float l9_284=0.0;
float l9_285=1.0;
bool l9_286=l9_281;
float l9_287=l9_282;
float l9_288=fast::clamp(l9_283,l9_284,l9_285);
float l9_289=step(abs(l9_283-l9_288),9.9999997e-06);
l9_287*=(l9_289+((1.0-float(l9_286))*(1.0-l9_289)));
l9_283=l9_288;
l9_279=l9_283;
l9_282=l9_287;
}
l9_236.x=l9_279;
l9_246=l9_282;
float l9_290=l9_236.y;
int l9_291=l9_239.y;
bool l9_292=l9_245;
float l9_293=l9_246;
if ((l9_291==0)||(l9_291==3))
{
float l9_294=l9_290;
float l9_295=0.0;
float l9_296=1.0;
bool l9_297=l9_292;
float l9_298=l9_293;
float l9_299=fast::clamp(l9_294,l9_295,l9_296);
float l9_300=step(abs(l9_294-l9_299),9.9999997e-06);
l9_298*=(l9_300+((1.0-float(l9_297))*(1.0-l9_300)));
l9_294=l9_299;
l9_290=l9_294;
l9_293=l9_298;
}
l9_236.y=l9_290;
l9_246=l9_293;
float2 l9_301=l9_236;
int l9_302=l9_234;
int l9_303=l9_235;
float l9_304=l9_244;
float2 l9_305=l9_301;
int l9_306=l9_302;
int l9_307=l9_303;
float3 l9_308=float3(0.0);
if (l9_306==0)
{
l9_308=float3(l9_305,0.0);
}
else
{
if (l9_306==1)
{
l9_308=float3(l9_305.x,(l9_305.y*0.5)+(0.5-(float(l9_307)*0.5)),0.0);
}
else
{
l9_308=float3(l9_305,float(l9_307));
}
}
float3 l9_309=l9_308;
float3 l9_310=l9_309;
float4 l9_311=intensityTexture.sample(intensityTextureSmpSC,l9_310.xy,bias(l9_304));
float4 l9_312=l9_311;
if (l9_242)
{
l9_312=mix(l9_243,l9_312,float4(l9_246));
}
float4 l9_313=l9_312;
float3 l9_314=l9_313.xyz;
float3 l9_315=l9_314;
float l9_316=16.0;
float l9_317=((((l9_315.x*256.0)+l9_315.y)+(l9_315.z/256.0))/257.00391)*l9_316;
float l9_318=l9_317;
if ((int(BLEND_MODE_FORGRAY_tmp)!=0))
{
l9_318=fast::max(l9_318,1.0);
}
if ((int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
l9_318=fast::min(l9_318,1.0);
}
float l9_319=l9_225;
float3 l9_320=param_8;
float3 l9_321=param_9;
float l9_322=l9_226;
float l9_323=l9_318;
float3 l9_324=transformColor(l9_319,l9_320,l9_321,l9_322,l9_323);
return l9_324;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
float4 sc_OutputMotionVectorIfNeeded(thread const float4& finalColor,thread float4& varPosAndMotion,thread float4& varNormalAndMotion)
{
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float2 param=float2(varPosAndMotion.w,varNormalAndMotion.w);
float l9_0=(param.x*5.0)+0.5;
float l9_1=floor(l9_0*65535.0);
float l9_2=floor(l9_1*0.00390625);
float2 l9_3=float2(l9_2/255.0,(l9_1-(l9_2*256.0))/255.0);
float l9_4=(param.y*5.0)+0.5;
float l9_5=floor(l9_4*65535.0);
float l9_6=floor(l9_5*0.00390625);
float2 l9_7=float2(l9_6/255.0,(l9_5-(l9_6*256.0))/255.0);
float4 l9_8=float4(l9_3,l9_7);
return l9_8;
}
else
{
return finalColor;
}
}
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_frag_out out={};
bool N168_LockRollRotationToWorld=false;
int N168_NormalSpace=0;
float3 N168_Normal=float3(0.0);
float2 N168_ReflectionUV=float2(0.0);
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=in.PreviewVertexColor;
PreviewInfo.Saved=((in.PreviewVertexSaved*1.0)!=0.0) ? true : false;
float4 FinalColor=float4(1.0);
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.VertexNormal_WorldSpace=normalize(in.varNormalAndMotion.xyz);
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.SurfacePosition_WorldSpace=in.varPosAndMotion.xyz;
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
Globals.SurfacePosition_ObjectSpace=((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(in.varPosAndMotion.xyz,1.0)).xyz;
Globals.VertexNormal_ObjectSpace=normalize(((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(Globals.VertexNormal_WorldSpace,0.0)).xyz);
Globals.gTriplanarCoords=float2(0.0);
float4 Result_N11=float4(0.0);
float param=0.0;
float4 param_1=float4(0.0);
float4 param_2=float4(0.0);
float4 param_3=float4(0.0);
float4 param_4=float4(0.0);
float4 param_5=float4(0.0);
float4 param_6=float4(0.0);
float4 param_7=float4(0.0);
float4 param_8=float4(0.0);
float4 param_9=float4(0.0);
float4 param_10=(*sc_set0.UserUniforms).Port_Default_N011;
float l9_0=0.0;
float l9_1=float((*sc_set0.UserUniforms).colorIndex);
l9_0=l9_1;
param=l9_0;
param=floor(param);
float4 param_11;
if (param==0.0)
{
float4 l9_2=float4(0.0);
float4 l9_3=(*sc_set0.UserUniforms).Tweak_N9;
l9_2=l9_3;
param_1=l9_2;
param_11=param_1;
}
else
{
if (param==1.0)
{
float4 l9_4=float4(0.0);
float4 l9_5=(*sc_set0.UserUniforms).Tweak_N14;
l9_4=l9_5;
param_2=l9_4;
param_11=param_2;
}
else
{
if (param==2.0)
{
float4 l9_6=float4(0.0);
float4 l9_7=(*sc_set0.UserUniforms).Tweak_N16;
l9_6=l9_7;
param_3=l9_6;
param_11=param_3;
}
else
{
if (param==3.0)
{
float4 l9_8=float4(0.0);
float4 l9_9=(*sc_set0.UserUniforms).Tweak_N17;
l9_8=l9_9;
param_4=l9_8;
param_11=param_4;
}
else
{
if (param==4.0)
{
float4 l9_10=float4(0.0);
float4 l9_11=(*sc_set0.UserUniforms).Tweak_N18;
l9_10=l9_11;
param_5=l9_10;
param_11=param_5;
}
else
{
if (param==5.0)
{
float4 l9_12=float4(0.0);
float4 l9_13=(*sc_set0.UserUniforms).Tweak_N20;
l9_12=l9_13;
param_6=l9_12;
param_11=param_6;
}
else
{
if (param==6.0)
{
float4 l9_14=float4(0.0);
float4 l9_15=(*sc_set0.UserUniforms).Tweak_N21;
l9_14=l9_15;
param_7=l9_14;
param_11=param_7;
}
else
{
if (param==7.0)
{
float4 l9_16=float4(0.0);
float4 l9_17=(*sc_set0.UserUniforms).Tweak_N22;
l9_16=l9_17;
param_8=l9_16;
param_11=param_8;
}
else
{
if (param==8.0)
{
float4 l9_18=float4(0.0);
float4 l9_19=(*sc_set0.UserUniforms).Tweak_N23;
l9_18=l9_19;
param_9=l9_18;
param_11=param_9;
}
else
{
param_11=param_10;
}
}
}
}
}
}
}
}
}
Result_N11=param_11;
float4 Value_N122=float4(0.0);
Value_N122=Result_N11;
float4 HSV_N123=float4(0.0);
float3 param_12=Value_N122.xyz;
float3 l9_20=float3(0.0);
float3 l9_21=param_12;
float3 l9_22=fast::clamp(l9_21,float3(0.0),float3(1.0));
param_12=l9_22;
float l9_23=fast::max(fast::max(param_12.x,param_12.y),param_12.z);
l9_20.z=l9_23;
float l9_24=l9_23-fast::min(fast::min(param_12.x,param_12.y),param_12.z);
float3 l9_25=float3(0.0,0.33333334,0.66666669)+(((param_12.yzx-param_12.zxy)*0.16666667)/float3(l9_24));
float2 l9_26;
if (l9_24==0.0)
{
l9_26=float2(0.0);
}
else
{
float l9_27;
if (l9_23==param_12.x)
{
l9_27=l9_25.x;
}
else
{
float l9_28;
if (l9_23==param_12.y)
{
l9_28=l9_25.y;
}
else
{
l9_28=l9_25.z;
}
l9_27=l9_28;
}
l9_26=float2(l9_27,l9_24/l9_23);
}
l9_20=float3(l9_26.x,l9_26.y,l9_20.z);
float3 l9_29=l9_20;
HSV_N123=float4(l9_29,Value_N122.w);
float Value_N124=0.0;
Value_N124=fast::clamp((*sc_set0.UserUniforms).Port_Import_N124,-180.0,180.0);
float ValueOut_N125=0.0;
ValueOut_N125=(((Value_N124-(*sc_set0.UserUniforms).Port_RangeMinA_N125)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N125-(*sc_set0.UserUniforms).Port_RangeMinA_N125)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N125-(*sc_set0.UserUniforms).Port_RangeMinB_N125))+(*sc_set0.UserUniforms).Port_RangeMinB_N125;
float Value_N126=0.0;
Value_N126=fast::clamp((*sc_set0.UserUniforms).Port_Import_N126,-100.0,100.0);
float Output_N127=0.0;
Output_N127=Value_N126*(*sc_set0.UserUniforms).Port_Input1_N127;
float Value_N128=0.0;
Value_N128=fast::clamp((*sc_set0.UserUniforms).Port_Import_N128,-100.0,100.0);
float Output_N129=0.0;
Output_N129=Value_N128*(*sc_set0.UserUniforms).Port_Input1_N129;
float3 Value_N130=float3(0.0);
Value_N130.x=ValueOut_N125;
Value_N130.y=Output_N127;
Value_N130.z=Output_N129;
float4 Output_N131=float4(0.0);
Output_N131=HSV_N123+float4(Value_N130,0.0);
float4 RGB_N132=float4(0.0);
float3 param_13=Output_N131.xyz;
float3 l9_30=param_13.zzz;
float l9_31=3.0*fract(param_13.x+0.16666667);
float l9_32=2.0*fract(l9_31);
float l9_33=param_13.y;
float l9_34=fast::clamp(l9_33,0.0,1.0);
float2 l9_35=l9_30.yz-((float2(1.0,l9_32)-float2(fast::max(0.0,l9_32-1.0)))*(param_13.z*l9_34));
l9_30=float3(l9_30.x,l9_35.x,l9_35.y);
if (l9_31>=1.0)
{
l9_30=l9_30.zxy;
}
if (l9_31>=2.0)
{
l9_30=l9_30.zxy;
}
float3 l9_36=l9_30;
RGB_N132=float4(l9_36,Output_N131.w);
float4 Export_N133=float4(0.0);
Export_N133=RGB_N132;
float Value_N163=0.0;
Value_N163=(*sc_set0.UserUniforms).Port_Import_N163;
float Value_N165=0.0;
Value_N165=fast::clamp((*sc_set0.UserUniforms).Port_Import_N165,0.0,1.0);
float Value_N167=0.0;
Value_N167=1.0;
float3 Value_N166=float3(0.0);
Value_N166=(*sc_set0.UserUniforms).Port_Import_N166;
float2 ReflectionUV_N168=float2(0.0);
float param_14=Value_N165;
float param_15=Value_N167;
float3 param_16=Value_N166;
ssGlobals param_18=Globals;
ssGlobals tempGlobals=param_18;
float2 param_17=float2(0.0);
N168_LockRollRotationToWorld=param_14!=0.0;
N168_NormalSpace=int(param_15);
N168_Normal=param_16;
float3 l9_37=N168_Normal;
if (N168_NormalSpace==1)
{
float3 l9_38=tempGlobals.VertexTangent_WorldSpace;
float3 l9_39=tempGlobals.VertexBinormal_WorldSpace;
float3 l9_40=tempGlobals.VertexNormal_WorldSpace;
float3x3 l9_41=float3x3(float3(l9_38),float3(l9_39),float3(l9_40));
l9_37=normalize(l9_41*l9_37);
}
float3 l9_42=tempGlobals.ViewDirWS;
float3 l9_43=normalize(-l9_42);
int l9_44=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_44=0;
}
else
{
l9_44=in.varStereoViewID;
}
int l9_45=l9_44;
float3 l9_46=(*sc_set0.UserUniforms).sc_ViewMatrixInverseArray[l9_45][1].xyz;
float3 l9_47=l9_46;
if (N168_LockRollRotationToWorld)
{
int l9_48=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_48=0;
}
else
{
l9_48=in.varStereoViewID;
}
int l9_49=l9_48;
float4x4 l9_50=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_49];
l9_47=float3x3(l9_50[0].xyz,l9_50[1].xyz,l9_50[2].xyz)*l9_47;
}
float3 l9_51=normalize(cross(l9_43,l9_47));
float3 l9_52=cross(l9_51,l9_43);
float3x3 l9_53=float3x3(float3(l9_51.x,l9_52.x,l9_43.x),float3(l9_51.y,l9_52.y,l9_43.y),float3(l9_51.z,l9_52.z,l9_43.z));
l9_37=l9_53*l9_37;
N168_ReflectionUV=(l9_37.xy*0.5)+float2(0.5);
param_17=N168_ReflectionUV;
ReflectionUV_N168=param_17;
float4 Color_N169=float4(0.0);
int l9_54;
if ((int(Tweak_N115HasSwappedViews_tmp)!=0))
{
int l9_55=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_55=0;
}
else
{
l9_55=in.varStereoViewID;
}
int l9_56=l9_55;
l9_54=1-l9_56;
}
else
{
int l9_57=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_57=0;
}
else
{
l9_57=in.varStereoViewID;
}
int l9_58=l9_57;
l9_54=l9_58;
}
int l9_59=l9_54;
int param_19=Tweak_N115Layout_tmp;
int param_20=l9_59;
float2 param_21=ReflectionUV_N168;
bool param_22=(int(SC_USE_UV_TRANSFORM_Tweak_N115_tmp)!=0);
float3x3 param_23=(*sc_set0.UserUniforms).Tweak_N115Transform;
int2 param_24=int2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N115_tmp,SC_SOFTWARE_WRAP_MODE_V_Tweak_N115_tmp);
bool param_25=(int(SC_USE_UV_MIN_MAX_Tweak_N115_tmp)!=0);
float4 param_26=(*sc_set0.UserUniforms).Tweak_N115UvMinMax;
bool param_27=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N115_tmp)!=0);
float4 param_28=(*sc_set0.UserUniforms).Tweak_N115BorderColor;
float param_29=0.0;
bool l9_60=param_27&&(!param_25);
float l9_61=1.0;
float l9_62=param_21.x;
int l9_63=param_24.x;
if (l9_63==1)
{
l9_62=fract(l9_62);
}
else
{
if (l9_63==2)
{
float l9_64=fract(l9_62);
float l9_65=l9_62-l9_64;
float l9_66=step(0.25,fract(l9_65*0.5));
l9_62=mix(l9_64,1.0-l9_64,fast::clamp(l9_66,0.0,1.0));
}
}
param_21.x=l9_62;
float l9_67=param_21.y;
int l9_68=param_24.y;
if (l9_68==1)
{
l9_67=fract(l9_67);
}
else
{
if (l9_68==2)
{
float l9_69=fract(l9_67);
float l9_70=l9_67-l9_69;
float l9_71=step(0.25,fract(l9_70*0.5));
l9_67=mix(l9_69,1.0-l9_69,fast::clamp(l9_71,0.0,1.0));
}
}
param_21.y=l9_67;
if (param_25)
{
bool l9_72=param_27;
bool l9_73;
if (l9_72)
{
l9_73=param_24.x==3;
}
else
{
l9_73=l9_72;
}
float l9_74=param_21.x;
float l9_75=param_26.x;
float l9_76=param_26.z;
bool l9_77=l9_73;
float l9_78=l9_61;
float l9_79=fast::clamp(l9_74,l9_75,l9_76);
float l9_80=step(abs(l9_74-l9_79),9.9999997e-06);
l9_78*=(l9_80+((1.0-float(l9_77))*(1.0-l9_80)));
l9_74=l9_79;
param_21.x=l9_74;
l9_61=l9_78;
bool l9_81=param_27;
bool l9_82;
if (l9_81)
{
l9_82=param_24.y==3;
}
else
{
l9_82=l9_81;
}
float l9_83=param_21.y;
float l9_84=param_26.y;
float l9_85=param_26.w;
bool l9_86=l9_82;
float l9_87=l9_61;
float l9_88=fast::clamp(l9_83,l9_84,l9_85);
float l9_89=step(abs(l9_83-l9_88),9.9999997e-06);
l9_87*=(l9_89+((1.0-float(l9_86))*(1.0-l9_89)));
l9_83=l9_88;
param_21.y=l9_83;
l9_61=l9_87;
}
float2 l9_90=param_21;
bool l9_91=param_22;
float3x3 l9_92=param_23;
if (l9_91)
{
l9_90=float2((l9_92*float3(l9_90,1.0)).xy);
}
float2 l9_93=l9_90;
param_21=l9_93;
float l9_94=param_21.x;
int l9_95=param_24.x;
bool l9_96=l9_60;
float l9_97=l9_61;
if ((l9_95==0)||(l9_95==3))
{
float l9_98=l9_94;
float l9_99=0.0;
float l9_100=1.0;
bool l9_101=l9_96;
float l9_102=l9_97;
float l9_103=fast::clamp(l9_98,l9_99,l9_100);
float l9_104=step(abs(l9_98-l9_103),9.9999997e-06);
l9_102*=(l9_104+((1.0-float(l9_101))*(1.0-l9_104)));
l9_98=l9_103;
l9_94=l9_98;
l9_97=l9_102;
}
param_21.x=l9_94;
l9_61=l9_97;
float l9_105=param_21.y;
int l9_106=param_24.y;
bool l9_107=l9_60;
float l9_108=l9_61;
if ((l9_106==0)||(l9_106==3))
{
float l9_109=l9_105;
float l9_110=0.0;
float l9_111=1.0;
bool l9_112=l9_107;
float l9_113=l9_108;
float l9_114=fast::clamp(l9_109,l9_110,l9_111);
float l9_115=step(abs(l9_109-l9_114),9.9999997e-06);
l9_113*=(l9_115+((1.0-float(l9_112))*(1.0-l9_115)));
l9_109=l9_114;
l9_105=l9_109;
l9_108=l9_113;
}
param_21.y=l9_105;
l9_61=l9_108;
float2 l9_116=param_21;
int l9_117=param_19;
int l9_118=param_20;
float l9_119=param_29;
float2 l9_120=l9_116;
int l9_121=l9_117;
int l9_122=l9_118;
float3 l9_123=float3(0.0);
if (l9_121==0)
{
l9_123=float3(l9_120,0.0);
}
else
{
if (l9_121==1)
{
l9_123=float3(l9_120.x,(l9_120.y*0.5)+(0.5-(float(l9_122)*0.5)),0.0);
}
else
{
l9_123=float3(l9_120,float(l9_122));
}
}
float3 l9_124=l9_123;
float3 l9_125=l9_124;
float4 l9_126=sc_set0.Tweak_N115.sample(sc_set0.Tweak_N115SmpSC,l9_125.xy,bias(l9_119));
float4 l9_127=l9_126;
if (param_27)
{
l9_127=mix(param_28,l9_127,float4(l9_61));
}
float4 l9_128=l9_127;
Color_N169=l9_128;
float4 Output_N170=float4(0.0);
Output_N170=float4(Value_N163)*Color_N169;
float4 Export_N171=float4(0.0);
Export_N171=Output_N170;
float Output_N116=0.0;
Output_N116=Export_N171.x;
float4 Output_N118=float4(0.0);
Output_N118=mix(Export_N133,Result_N11,float4(Output_N116));
float4 Output_N141=float4(0.0);
Output_N141=Output_N118*float4((*sc_set0.UserUniforms).Port_Input1_N141);
float Output_N117=0.0;
float l9_129;
if (Output_N116<=0.0)
{
l9_129=0.0;
}
else
{
l9_129=pow(Output_N116,(*sc_set0.UserUniforms).Port_Input1_N117);
}
Output_N117=l9_129;
float Rim_N134=0.0;
float param_30=(*sc_set0.UserUniforms).Port_Exponent_N134;
float param_31=(*sc_set0.UserUniforms).Port_Intensity_N134;
ssGlobals param_33=Globals;
float l9_130=abs(dot(-param_33.ViewDirWS,param_33.VertexNormal_WorldSpace));
float param_32=pow(1.0-l9_130,param_30);
param_32=fast::max(param_32,0.0);
param_32*=param_31;
Rim_N134=param_32;
float Output_N143=0.0;
Output_N143=Output_N117+Rim_N134;
float Output_N1=0.0;
float param_34=(*sc_set0.UserUniforms).radcentertransp;
Output_N1=param_34;
float Output_N25=0.0;
Output_N25=1.0-Output_N1;
float ValueOut_N27=0.0;
float param_35=Output_N25;
float param_37=(*sc_set0.UserUniforms).Port_RangeMinA_N027;
float param_38=(*sc_set0.UserUniforms).Port_RangeMaxA_N027;
float param_39=(*sc_set0.UserUniforms).Port_RangeMinB_N027;
float param_40=(*sc_set0.UserUniforms).Port_RangeMaxB_N027;
float param_36=(((param_35-param_37)/((param_38-param_37)+1e-06))*(param_40-param_39))+param_39;
float l9_131;
if (param_40>param_39)
{
l9_131=fast::clamp(param_36,param_39,param_40);
}
else
{
l9_131=fast::clamp(param_36,param_40,param_39);
}
param_36=l9_131;
ValueOut_N27=param_36;
float ValueOut_N28=0.0;
float param_41=Output_N25;
float param_43=(*sc_set0.UserUniforms).Port_RangeMinA_N028;
float param_44=(*sc_set0.UserUniforms).Port_RangeMaxA_N028;
float param_45=(*sc_set0.UserUniforms).Port_RangeMinB_N028;
float param_46=(*sc_set0.UserUniforms).Port_RangeMaxB_N028;
float param_42=(((param_41-param_43)/((param_44-param_43)+1e-06))*(param_46-param_45))+param_45;
float l9_132;
if (param_46>param_45)
{
l9_132=fast::clamp(param_42,param_45,param_46);
}
else
{
l9_132=fast::clamp(param_42,param_46,param_45);
}
param_42=l9_132;
ValueOut_N28=param_42;
float Rim_N136=0.0;
float param_47=ValueOut_N27;
float param_48=ValueOut_N28;
ssGlobals param_50=Globals;
float l9_133=abs(dot(-param_50.ViewDirWS,param_50.VertexNormal_WorldSpace));
float param_49=pow(1.0-l9_133,param_47);
param_49=fast::max(param_49,0.0);
param_49*=param_48;
Rim_N136=param_49;
float Output_N138=0.0;
Output_N138=Output_N143*Rim_N136;
float4 Value_N121=float4(0.0);
Value_N121=float4(Output_N141.xyz.x,Output_N141.xyz.y,Output_N141.xyz.z,Value_N121.w);
Value_N121.w=Output_N138;
float Output_N145=0.0;
float l9_134;
if (Output_N116<=0.0)
{
l9_134=0.0;
}
else
{
l9_134=pow(Output_N116,(*sc_set0.UserUniforms).Port_Input1_N145);
}
Output_N145=l9_134;
float4 Output_N144=float4(0.0);
float4 param_51=Value_N121;
float4 param_52=float4(Output_N145);
float3 l9_135=float3(1.0)-((float3(1.0)-param_51.xyz)*(float3(1.0)-param_52.xyz));
float4 param_53;
param_53=float4(l9_135.x,l9_135.y,l9_135.z,param_53.w);
float3 l9_136=mix(param_51.xyz,param_53.xyz,float3(param_52.w));
param_53=float4(l9_136.x,l9_136.y,l9_136.z,param_53.w);
param_53.w=param_51.w;
Output_N144=param_53;
float4 Output_N142=float4(0.0);
Output_N142=fast::clamp(Output_N144+float4(0.001),(*sc_set0.UserUniforms).Port_Input1_N142+float4(0.001),(*sc_set0.UserUniforms).Port_Input2_N142+float4(0.001))-float4(0.001);
float Output_N24=0.0;
float param_54=(*sc_set0.UserUniforms).alpha;
Output_N24=param_54;
float Value_N97=0.0;
Value_N97=(*sc_set0.UserUniforms).Port_Import_N097;
float Output_N98=0.0;
Output_N98=(*sc_set0.UserUniforms).Port_Input0_N098-Value_N97;
float Output_N99=0.0;
Output_N99=(*sc_set0.UserUniforms).Port_Input0_N099+Value_N97;
float4 Output_N52=float4(0.0);
float4 param_55=float4(0.0);
float3 param_56=float3(1.0);
float3 param_57=float3(0.0);
float param_58=1.0;
ssGlobals param_60=Globals;
float3 l9_137=float3(0.0);
l9_137=(*sc_set0.UserUniforms).Port_Import_N044;
float3 l9_138=float3(0.0);
l9_138=l9_137*float3((*sc_set0.UserUniforms).Port_Input1_N045);
param_56=l9_138;
float3 l9_139=float3(0.0);
l9_139=(*sc_set0.UserUniforms).Port_Import_N046;
param_57=l9_139;
float l9_140=0.0;
l9_140=(*sc_set0.UserUniforms).Port_Import_N047;
float l9_141=0.0;
l9_141=fast::clamp(l9_140+0.001,(*sc_set0.UserUniforms).Port_Input1_N048+0.001,(*sc_set0.UserUniforms).Port_Input2_N048+0.001)-0.001;
param_58=l9_141;
float3 l9_142=param_60.SurfacePosition_ObjectSpace;
float3 l9_143=param_60.VertexNormal_ObjectSpace;
l9_142+=param_57;
l9_142*=param_56;
l9_143=abs(l9_143);
param_60.gTriplanarCoords=l9_142.yz;
float2 l9_144=float2(0.0);
l9_144=param_60.gTriplanarCoords;
float4 l9_145=float4(0.0);
int l9_146;
if ((int(Tweak_N74HasSwappedViews_tmp)!=0))
{
int l9_147=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_147=0;
}
else
{
l9_147=in.varStereoViewID;
}
int l9_148=l9_147;
l9_146=1-l9_148;
}
else
{
int l9_149=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_149=0;
}
else
{
l9_149=in.varStereoViewID;
}
int l9_150=l9_149;
l9_146=l9_150;
}
int l9_151=l9_146;
int l9_152=Tweak_N74Layout_tmp;
int l9_153=l9_151;
float2 l9_154=l9_144;
bool l9_155=(int(SC_USE_UV_TRANSFORM_Tweak_N74_tmp)!=0);
float3x3 l9_156=(*sc_set0.UserUniforms).Tweak_N74Transform;
int2 l9_157=int2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N74_tmp,SC_SOFTWARE_WRAP_MODE_V_Tweak_N74_tmp);
bool l9_158=(int(SC_USE_UV_MIN_MAX_Tweak_N74_tmp)!=0);
float4 l9_159=(*sc_set0.UserUniforms).Tweak_N74UvMinMax;
bool l9_160=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N74_tmp)!=0);
float4 l9_161=(*sc_set0.UserUniforms).Tweak_N74BorderColor;
float l9_162=0.0;
bool l9_163=l9_160&&(!l9_158);
float l9_164=1.0;
float l9_165=l9_154.x;
int l9_166=l9_157.x;
if (l9_166==1)
{
l9_165=fract(l9_165);
}
else
{
if (l9_166==2)
{
float l9_167=fract(l9_165);
float l9_168=l9_165-l9_167;
float l9_169=step(0.25,fract(l9_168*0.5));
l9_165=mix(l9_167,1.0-l9_167,fast::clamp(l9_169,0.0,1.0));
}
}
l9_154.x=l9_165;
float l9_170=l9_154.y;
int l9_171=l9_157.y;
if (l9_171==1)
{
l9_170=fract(l9_170);
}
else
{
if (l9_171==2)
{
float l9_172=fract(l9_170);
float l9_173=l9_170-l9_172;
float l9_174=step(0.25,fract(l9_173*0.5));
l9_170=mix(l9_172,1.0-l9_172,fast::clamp(l9_174,0.0,1.0));
}
}
l9_154.y=l9_170;
if (l9_158)
{
bool l9_175=l9_160;
bool l9_176;
if (l9_175)
{
l9_176=l9_157.x==3;
}
else
{
l9_176=l9_175;
}
float l9_177=l9_154.x;
float l9_178=l9_159.x;
float l9_179=l9_159.z;
bool l9_180=l9_176;
float l9_181=l9_164;
float l9_182=fast::clamp(l9_177,l9_178,l9_179);
float l9_183=step(abs(l9_177-l9_182),9.9999997e-06);
l9_181*=(l9_183+((1.0-float(l9_180))*(1.0-l9_183)));
l9_177=l9_182;
l9_154.x=l9_177;
l9_164=l9_181;
bool l9_184=l9_160;
bool l9_185;
if (l9_184)
{
l9_185=l9_157.y==3;
}
else
{
l9_185=l9_184;
}
float l9_186=l9_154.y;
float l9_187=l9_159.y;
float l9_188=l9_159.w;
bool l9_189=l9_185;
float l9_190=l9_164;
float l9_191=fast::clamp(l9_186,l9_187,l9_188);
float l9_192=step(abs(l9_186-l9_191),9.9999997e-06);
l9_190*=(l9_192+((1.0-float(l9_189))*(1.0-l9_192)));
l9_186=l9_191;
l9_154.y=l9_186;
l9_164=l9_190;
}
float2 l9_193=l9_154;
bool l9_194=l9_155;
float3x3 l9_195=l9_156;
if (l9_194)
{
l9_193=float2((l9_195*float3(l9_193,1.0)).xy);
}
float2 l9_196=l9_193;
l9_154=l9_196;
float l9_197=l9_154.x;
int l9_198=l9_157.x;
bool l9_199=l9_163;
float l9_200=l9_164;
if ((l9_198==0)||(l9_198==3))
{
float l9_201=l9_197;
float l9_202=0.0;
float l9_203=1.0;
bool l9_204=l9_199;
float l9_205=l9_200;
float l9_206=fast::clamp(l9_201,l9_202,l9_203);
float l9_207=step(abs(l9_201-l9_206),9.9999997e-06);
l9_205*=(l9_207+((1.0-float(l9_204))*(1.0-l9_207)));
l9_201=l9_206;
l9_197=l9_201;
l9_200=l9_205;
}
l9_154.x=l9_197;
l9_164=l9_200;
float l9_208=l9_154.y;
int l9_209=l9_157.y;
bool l9_210=l9_163;
float l9_211=l9_164;
if ((l9_209==0)||(l9_209==3))
{
float l9_212=l9_208;
float l9_213=0.0;
float l9_214=1.0;
bool l9_215=l9_210;
float l9_216=l9_211;
float l9_217=fast::clamp(l9_212,l9_213,l9_214);
float l9_218=step(abs(l9_212-l9_217),9.9999997e-06);
l9_216*=(l9_218+((1.0-float(l9_215))*(1.0-l9_218)));
l9_212=l9_217;
l9_208=l9_212;
l9_211=l9_216;
}
l9_154.y=l9_208;
l9_164=l9_211;
float2 l9_219=l9_154;
int l9_220=l9_152;
int l9_221=l9_153;
float l9_222=l9_162;
float2 l9_223=l9_219;
int l9_224=l9_220;
int l9_225=l9_221;
float3 l9_226=float3(0.0);
if (l9_224==0)
{
l9_226=float3(l9_223,0.0);
}
else
{
if (l9_224==1)
{
l9_226=float3(l9_223.x,(l9_223.y*0.5)+(0.5-(float(l9_225)*0.5)),0.0);
}
else
{
l9_226=float3(l9_223,float(l9_225));
}
}
float3 l9_227=l9_226;
float3 l9_228=l9_227;
float4 l9_229=sc_set0.Tweak_N74.sample(sc_set0.Tweak_N74SmpSC,l9_228.xy,bias(l9_222));
float4 l9_230=l9_229;
if (l9_160)
{
l9_230=mix(l9_161,l9_230,float4(l9_164));
}
float4 l9_231=l9_230;
l9_145=l9_231;
param_55=l9_145;
float4 l9_232=param_55;
param_60.gTriplanarCoords=l9_142.zx;
float2 l9_233=float2(0.0);
l9_233=param_60.gTriplanarCoords;
float4 l9_234=float4(0.0);
int l9_235;
if ((int(Tweak_N74HasSwappedViews_tmp)!=0))
{
int l9_236=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_236=0;
}
else
{
l9_236=in.varStereoViewID;
}
int l9_237=l9_236;
l9_235=1-l9_237;
}
else
{
int l9_238=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_238=0;
}
else
{
l9_238=in.varStereoViewID;
}
int l9_239=l9_238;
l9_235=l9_239;
}
int l9_240=l9_235;
int l9_241=Tweak_N74Layout_tmp;
int l9_242=l9_240;
float2 l9_243=l9_233;
bool l9_244=(int(SC_USE_UV_TRANSFORM_Tweak_N74_tmp)!=0);
float3x3 l9_245=(*sc_set0.UserUniforms).Tweak_N74Transform;
int2 l9_246=int2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N74_tmp,SC_SOFTWARE_WRAP_MODE_V_Tweak_N74_tmp);
bool l9_247=(int(SC_USE_UV_MIN_MAX_Tweak_N74_tmp)!=0);
float4 l9_248=(*sc_set0.UserUniforms).Tweak_N74UvMinMax;
bool l9_249=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N74_tmp)!=0);
float4 l9_250=(*sc_set0.UserUniforms).Tweak_N74BorderColor;
float l9_251=0.0;
bool l9_252=l9_249&&(!l9_247);
float l9_253=1.0;
float l9_254=l9_243.x;
int l9_255=l9_246.x;
if (l9_255==1)
{
l9_254=fract(l9_254);
}
else
{
if (l9_255==2)
{
float l9_256=fract(l9_254);
float l9_257=l9_254-l9_256;
float l9_258=step(0.25,fract(l9_257*0.5));
l9_254=mix(l9_256,1.0-l9_256,fast::clamp(l9_258,0.0,1.0));
}
}
l9_243.x=l9_254;
float l9_259=l9_243.y;
int l9_260=l9_246.y;
if (l9_260==1)
{
l9_259=fract(l9_259);
}
else
{
if (l9_260==2)
{
float l9_261=fract(l9_259);
float l9_262=l9_259-l9_261;
float l9_263=step(0.25,fract(l9_262*0.5));
l9_259=mix(l9_261,1.0-l9_261,fast::clamp(l9_263,0.0,1.0));
}
}
l9_243.y=l9_259;
if (l9_247)
{
bool l9_264=l9_249;
bool l9_265;
if (l9_264)
{
l9_265=l9_246.x==3;
}
else
{
l9_265=l9_264;
}
float l9_266=l9_243.x;
float l9_267=l9_248.x;
float l9_268=l9_248.z;
bool l9_269=l9_265;
float l9_270=l9_253;
float l9_271=fast::clamp(l9_266,l9_267,l9_268);
float l9_272=step(abs(l9_266-l9_271),9.9999997e-06);
l9_270*=(l9_272+((1.0-float(l9_269))*(1.0-l9_272)));
l9_266=l9_271;
l9_243.x=l9_266;
l9_253=l9_270;
bool l9_273=l9_249;
bool l9_274;
if (l9_273)
{
l9_274=l9_246.y==3;
}
else
{
l9_274=l9_273;
}
float l9_275=l9_243.y;
float l9_276=l9_248.y;
float l9_277=l9_248.w;
bool l9_278=l9_274;
float l9_279=l9_253;
float l9_280=fast::clamp(l9_275,l9_276,l9_277);
float l9_281=step(abs(l9_275-l9_280),9.9999997e-06);
l9_279*=(l9_281+((1.0-float(l9_278))*(1.0-l9_281)));
l9_275=l9_280;
l9_243.y=l9_275;
l9_253=l9_279;
}
float2 l9_282=l9_243;
bool l9_283=l9_244;
float3x3 l9_284=l9_245;
if (l9_283)
{
l9_282=float2((l9_284*float3(l9_282,1.0)).xy);
}
float2 l9_285=l9_282;
l9_243=l9_285;
float l9_286=l9_243.x;
int l9_287=l9_246.x;
bool l9_288=l9_252;
float l9_289=l9_253;
if ((l9_287==0)||(l9_287==3))
{
float l9_290=l9_286;
float l9_291=0.0;
float l9_292=1.0;
bool l9_293=l9_288;
float l9_294=l9_289;
float l9_295=fast::clamp(l9_290,l9_291,l9_292);
float l9_296=step(abs(l9_290-l9_295),9.9999997e-06);
l9_294*=(l9_296+((1.0-float(l9_293))*(1.0-l9_296)));
l9_290=l9_295;
l9_286=l9_290;
l9_289=l9_294;
}
l9_243.x=l9_286;
l9_253=l9_289;
float l9_297=l9_243.y;
int l9_298=l9_246.y;
bool l9_299=l9_252;
float l9_300=l9_253;
if ((l9_298==0)||(l9_298==3))
{
float l9_301=l9_297;
float l9_302=0.0;
float l9_303=1.0;
bool l9_304=l9_299;
float l9_305=l9_300;
float l9_306=fast::clamp(l9_301,l9_302,l9_303);
float l9_307=step(abs(l9_301-l9_306),9.9999997e-06);
l9_305*=(l9_307+((1.0-float(l9_304))*(1.0-l9_307)));
l9_301=l9_306;
l9_297=l9_301;
l9_300=l9_305;
}
l9_243.y=l9_297;
l9_253=l9_300;
float2 l9_308=l9_243;
int l9_309=l9_241;
int l9_310=l9_242;
float l9_311=l9_251;
float2 l9_312=l9_308;
int l9_313=l9_309;
int l9_314=l9_310;
float3 l9_315=float3(0.0);
if (l9_313==0)
{
l9_315=float3(l9_312,0.0);
}
else
{
if (l9_313==1)
{
l9_315=float3(l9_312.x,(l9_312.y*0.5)+(0.5-(float(l9_314)*0.5)),0.0);
}
else
{
l9_315=float3(l9_312,float(l9_314));
}
}
float3 l9_316=l9_315;
float3 l9_317=l9_316;
float4 l9_318=sc_set0.Tweak_N74.sample(sc_set0.Tweak_N74SmpSC,l9_317.xy,bias(l9_311));
float4 l9_319=l9_318;
if (l9_249)
{
l9_319=mix(l9_250,l9_319,float4(l9_253));
}
float4 l9_320=l9_319;
l9_234=l9_320;
param_55=l9_234;
float4 l9_321=param_55;
param_60.gTriplanarCoords=l9_142.xy;
float2 l9_322=float2(0.0);
l9_322=param_60.gTriplanarCoords;
float4 l9_323=float4(0.0);
int l9_324;
if ((int(Tweak_N74HasSwappedViews_tmp)!=0))
{
int l9_325=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_325=0;
}
else
{
l9_325=in.varStereoViewID;
}
int l9_326=l9_325;
l9_324=1-l9_326;
}
else
{
int l9_327=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_327=0;
}
else
{
l9_327=in.varStereoViewID;
}
int l9_328=l9_327;
l9_324=l9_328;
}
int l9_329=l9_324;
int l9_330=Tweak_N74Layout_tmp;
int l9_331=l9_329;
float2 l9_332=l9_322;
bool l9_333=(int(SC_USE_UV_TRANSFORM_Tweak_N74_tmp)!=0);
float3x3 l9_334=(*sc_set0.UserUniforms).Tweak_N74Transform;
int2 l9_335=int2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N74_tmp,SC_SOFTWARE_WRAP_MODE_V_Tweak_N74_tmp);
bool l9_336=(int(SC_USE_UV_MIN_MAX_Tweak_N74_tmp)!=0);
float4 l9_337=(*sc_set0.UserUniforms).Tweak_N74UvMinMax;
bool l9_338=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N74_tmp)!=0);
float4 l9_339=(*sc_set0.UserUniforms).Tweak_N74BorderColor;
float l9_340=0.0;
bool l9_341=l9_338&&(!l9_336);
float l9_342=1.0;
float l9_343=l9_332.x;
int l9_344=l9_335.x;
if (l9_344==1)
{
l9_343=fract(l9_343);
}
else
{
if (l9_344==2)
{
float l9_345=fract(l9_343);
float l9_346=l9_343-l9_345;
float l9_347=step(0.25,fract(l9_346*0.5));
l9_343=mix(l9_345,1.0-l9_345,fast::clamp(l9_347,0.0,1.0));
}
}
l9_332.x=l9_343;
float l9_348=l9_332.y;
int l9_349=l9_335.y;
if (l9_349==1)
{
l9_348=fract(l9_348);
}
else
{
if (l9_349==2)
{
float l9_350=fract(l9_348);
float l9_351=l9_348-l9_350;
float l9_352=step(0.25,fract(l9_351*0.5));
l9_348=mix(l9_350,1.0-l9_350,fast::clamp(l9_352,0.0,1.0));
}
}
l9_332.y=l9_348;
if (l9_336)
{
bool l9_353=l9_338;
bool l9_354;
if (l9_353)
{
l9_354=l9_335.x==3;
}
else
{
l9_354=l9_353;
}
float l9_355=l9_332.x;
float l9_356=l9_337.x;
float l9_357=l9_337.z;
bool l9_358=l9_354;
float l9_359=l9_342;
float l9_360=fast::clamp(l9_355,l9_356,l9_357);
float l9_361=step(abs(l9_355-l9_360),9.9999997e-06);
l9_359*=(l9_361+((1.0-float(l9_358))*(1.0-l9_361)));
l9_355=l9_360;
l9_332.x=l9_355;
l9_342=l9_359;
bool l9_362=l9_338;
bool l9_363;
if (l9_362)
{
l9_363=l9_335.y==3;
}
else
{
l9_363=l9_362;
}
float l9_364=l9_332.y;
float l9_365=l9_337.y;
float l9_366=l9_337.w;
bool l9_367=l9_363;
float l9_368=l9_342;
float l9_369=fast::clamp(l9_364,l9_365,l9_366);
float l9_370=step(abs(l9_364-l9_369),9.9999997e-06);
l9_368*=(l9_370+((1.0-float(l9_367))*(1.0-l9_370)));
l9_364=l9_369;
l9_332.y=l9_364;
l9_342=l9_368;
}
float2 l9_371=l9_332;
bool l9_372=l9_333;
float3x3 l9_373=l9_334;
if (l9_372)
{
l9_371=float2((l9_373*float3(l9_371,1.0)).xy);
}
float2 l9_374=l9_371;
l9_332=l9_374;
float l9_375=l9_332.x;
int l9_376=l9_335.x;
bool l9_377=l9_341;
float l9_378=l9_342;
if ((l9_376==0)||(l9_376==3))
{
float l9_379=l9_375;
float l9_380=0.0;
float l9_381=1.0;
bool l9_382=l9_377;
float l9_383=l9_378;
float l9_384=fast::clamp(l9_379,l9_380,l9_381);
float l9_385=step(abs(l9_379-l9_384),9.9999997e-06);
l9_383*=(l9_385+((1.0-float(l9_382))*(1.0-l9_385)));
l9_379=l9_384;
l9_375=l9_379;
l9_378=l9_383;
}
l9_332.x=l9_375;
l9_342=l9_378;
float l9_386=l9_332.y;
int l9_387=l9_335.y;
bool l9_388=l9_341;
float l9_389=l9_342;
if ((l9_387==0)||(l9_387==3))
{
float l9_390=l9_386;
float l9_391=0.0;
float l9_392=1.0;
bool l9_393=l9_388;
float l9_394=l9_389;
float l9_395=fast::clamp(l9_390,l9_391,l9_392);
float l9_396=step(abs(l9_390-l9_395),9.9999997e-06);
l9_394*=(l9_396+((1.0-float(l9_393))*(1.0-l9_396)));
l9_390=l9_395;
l9_386=l9_390;
l9_389=l9_394;
}
l9_332.y=l9_386;
l9_342=l9_389;
float2 l9_397=l9_332;
int l9_398=l9_330;
int l9_399=l9_331;
float l9_400=l9_340;
float2 l9_401=l9_397;
int l9_402=l9_398;
int l9_403=l9_399;
float3 l9_404=float3(0.0);
if (l9_402==0)
{
l9_404=float3(l9_401,0.0);
}
else
{
if (l9_402==1)
{
l9_404=float3(l9_401.x,(l9_401.y*0.5)+(0.5-(float(l9_403)*0.5)),0.0);
}
else
{
l9_404=float3(l9_401,float(l9_403));
}
}
float3 l9_405=l9_404;
float3 l9_406=l9_405;
float4 l9_407=sc_set0.Tweak_N74.sample(sc_set0.Tweak_N74SmpSC,l9_406.xy,bias(l9_400));
float4 l9_408=l9_407;
if (l9_338)
{
l9_408=mix(l9_339,l9_408,float4(l9_342));
}
float4 l9_409=l9_408;
l9_323=l9_409;
param_55=l9_323;
float4 l9_410=param_55;
float3 l9_411=l9_143;
l9_411=pow(l9_411,float3(1.0/(1.0-(param_58*0.99000001))));
float4 param_59=(((l9_232*l9_411.x)+(l9_321*l9_411.y))+(l9_410*l9_411.z))/float4((l9_411.x+l9_411.y)+l9_411.z);
Output_N52=param_59;
float4 Export_N53=float4(0.0);
Export_N53=Output_N52;
float Output_N50=0.0;
Output_N50=Export_N53.x;
float Value_N100=0.0;
Value_N100=Output_N50;
float Output_N101=0.0;
Output_N101=Value_N100-(*sc_set0.UserUniforms).Port_Input1_N101;
float Output_N160=0.0;
float param_61=(*sc_set0.UserUniforms).dissipation;
Output_N160=param_61;
float ValueOut_N158=0.0;
float param_62=Output_N160;
float param_64=(*sc_set0.UserUniforms).Port_RangeMinA_N158;
float param_65=(*sc_set0.UserUniforms).Port_RangeMaxA_N158;
float param_66=(*sc_set0.UserUniforms).Port_RangeMinB_N158;
float param_67=(*sc_set0.UserUniforms).Port_RangeMaxB_N158;
float param_63=(((param_62-param_64)/((param_65-param_64)+1e-06))*(param_67-param_66))+param_66;
float l9_412;
if (param_67>param_66)
{
l9_412=fast::clamp(param_63,param_66,param_67);
}
else
{
l9_412=fast::clamp(param_63,param_67,param_66);
}
param_63=l9_412;
ValueOut_N158=param_63;
float Value_N102=0.0;
Value_N102=ValueOut_N158;
float Output_N103=0.0;
Output_N103=Value_N102*(*sc_set0.UserUniforms).Port_Input1_N103;
float Output_N104=0.0;
Output_N104=Output_N101+Output_N103;
float Output_N105=0.0;
Output_N105=smoothstep(Output_N98,Output_N99,Output_N104);
float Output_N106=0.0;
Output_N106=fast::clamp(Output_N105+0.001,(*sc_set0.UserUniforms).Port_Input1_N106+0.001,(*sc_set0.UserUniforms).Port_Input2_N106+0.001)-0.001;
float Export_N107=0.0;
Export_N107=Output_N106;
float Output_N157=0.0;
Output_N157=fast::clamp(Export_N107+0.001,(*sc_set0.UserUniforms).Port_Input1_N157+0.001,(*sc_set0.UserUniforms).Port_Input2_N157+0.001)-0.001;
float Output_N156=0.0;
Output_N156=Output_N24*Output_N157;
float4 Output_N59=float4(0.0);
Output_N59=float4(1.0,1.0,1.0,Output_N156);
float4 Output_N26=float4(0.0);
Output_N26=Output_N142*Output_N59;
FinalColor=Output_N26;
float param_68=FinalColor.w;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (param_68<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_413=gl_FragCoord;
float2 l9_414=floor(mod(l9_413.xy,float2(4.0)));
float l9_415=(mod(dot(l9_414,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (param_68<l9_415)
{
discard_fragment();
}
}
float4 param_69=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_416=param_69;
float4 l9_417=l9_416;
float l9_418=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_418=l9_417.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_418=fast::clamp(l9_417.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_418=fast::clamp(dot(l9_417.xyz,float3(l9_417.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_418=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_418=(1.0-dot(l9_417.xyz,float3(0.33333001)))*l9_417.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_418=(1.0-fast::clamp(dot(l9_417.xyz,float3(1.0)),0.0,1.0))*l9_417.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_418=fast::clamp(dot(l9_417.xyz,float3(1.0)),0.0,1.0)*l9_417.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_418=fast::clamp(dot(l9_417.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_418=fast::clamp(dot(l9_417.xyz,float3(1.0)),0.0,1.0)*l9_417.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_418=dot(l9_417.xyz,float3(0.33333001))*l9_417.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_418=1.0-fast::clamp(dot(l9_417.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_418=fast::clamp(dot(l9_417.xyz,float3(1.0)),0.0,1.0);
}
}
}
}
}
}
}
}
}
}
}
}
float l9_419=l9_418;
float l9_420=l9_419;
float l9_421=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_420;
float3 l9_422=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_416.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_423=float4(l9_422.x,l9_422.y,l9_422.z,l9_421);
param_69=l9_423;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_69=float4(param_69.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_424=param_69;
float4 l9_425=float4(0.0);
float4 l9_426=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_427=out.sc_FragData0;
l9_426=l9_427;
}
else
{
float4 l9_428=gl_FragCoord;
float2 l9_429=l9_428.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_430=l9_429;
float2 l9_431=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_432=1;
int l9_433=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_433=0;
}
else
{
l9_433=in.varStereoViewID;
}
int l9_434=l9_433;
int l9_435=l9_434;
float3 l9_436=float3(l9_430,0.0);
int l9_437=l9_432;
int l9_438=l9_435;
if (l9_437==1)
{
l9_436.y=((2.0*l9_436.y)+float(l9_438))-1.0;
}
float2 l9_439=l9_436.xy;
l9_431=l9_439;
}
else
{
l9_431=l9_430;
}
float2 l9_440=l9_431;
float2 l9_441=l9_440;
float2 l9_442=l9_441;
float2 l9_443=l9_442;
float l9_444=0.0;
int l9_445;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_446=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_446=0;
}
else
{
l9_446=in.varStereoViewID;
}
int l9_447=l9_446;
l9_445=1-l9_447;
}
else
{
int l9_448=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_448=0;
}
else
{
l9_448=in.varStereoViewID;
}
int l9_449=l9_448;
l9_445=l9_449;
}
int l9_450=l9_445;
float2 l9_451=l9_443;
int l9_452=sc_ScreenTextureLayout_tmp;
int l9_453=l9_450;
float l9_454=l9_444;
float2 l9_455=l9_451;
int l9_456=l9_452;
int l9_457=l9_453;
float3 l9_458=float3(0.0);
if (l9_456==0)
{
l9_458=float3(l9_455,0.0);
}
else
{
if (l9_456==1)
{
l9_458=float3(l9_455.x,(l9_455.y*0.5)+(0.5-(float(l9_457)*0.5)),0.0);
}
else
{
l9_458=float3(l9_455,float(l9_457));
}
}
float3 l9_459=l9_458;
float3 l9_460=l9_459;
float4 l9_461=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_460.xy,bias(l9_454));
float4 l9_462=l9_461;
float4 l9_463=l9_462;
l9_426=l9_463;
}
float4 l9_464=l9_426;
float3 l9_465=l9_464.xyz;
float3 l9_466=l9_465;
float3 l9_467=l9_424.xyz;
float3 l9_468=definedBlend(l9_466,l9_467,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_425=float4(l9_468.x,l9_468.y,l9_468.z,l9_425.w);
float3 l9_469=mix(l9_465,l9_425.xyz,float3(l9_424.w));
l9_425=float4(l9_469.x,l9_469.y,l9_469.z,l9_425.w);
l9_425.w=1.0;
float4 l9_470=l9_425;
param_69=l9_470;
}
else
{
if ((int(sc_Voxelization_tmp)!=0))
{
float4 l9_471=float4(in.varScreenPos.xyz,1.0);
param_69=l9_471;
}
else
{
if ((int(sc_OutputBounds_tmp)!=0))
{
float4 l9_472=gl_FragCoord;
float l9_473=fast::clamp(abs(l9_472.z),0.0,1.0);
float4 l9_474=float4(l9_473,1.0-l9_473,1.0,1.0);
param_69=l9_474;
}
else
{
float4 l9_475=param_69;
float4 l9_476=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_476=float4(mix(float3(1.0),l9_475.xyz,float3(l9_475.w)),l9_475.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_477=l9_475.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_477=fast::clamp(l9_477,0.0,1.0);
}
l9_476=float4(l9_475.xyz*l9_477,l9_477);
}
else
{
l9_476=l9_475;
}
}
float4 l9_478=l9_476;
param_69=l9_478;
}
}
}
}
}
float4 l9_479=param_69;
FinalColor=l9_479;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
if (PreviewInfo.Saved)
{
FinalColor=float4(PreviewInfo.Color);
}
else
{
FinalColor=float4(0.0);
}
}
float4 l9_480=float4(0.0);
l9_480=float4(0.0);
float4 l9_481=l9_480;
float4 Cost=l9_481;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float4 param_70=FinalColor;
FinalColor=sc_OutputMotionVectorIfNeeded(param_70,in.varPosAndMotion,in.varNormalAndMotion);
float4 param_71=FinalColor;
float4 l9_482=param_71;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_482.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.sc_FragData0=l9_482;
return out;
}
} // FRAGMENT SHADER
