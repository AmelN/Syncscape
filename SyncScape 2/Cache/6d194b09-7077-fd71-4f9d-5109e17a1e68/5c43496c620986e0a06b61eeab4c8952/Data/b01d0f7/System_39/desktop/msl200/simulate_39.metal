#pragma clang diagnostic ignored "-Wmissing-prototypes"
#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#define SC_ENABLE_INSTANCED_RENDERING
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
//SG_REFLECTION_BEGIN(200)
//attribute vec4 position 0
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec3 normal 1
//attribute vec4 tangent 2
//output vec4 sc_FragData0 0
//output vec4 sc_FragData1 1
//output vec4 sc_FragData2 2
//output vec4 sc_FragData3 3
//sampler sampler renderTarget0SmpSC 0:22
//sampler sampler renderTarget1SmpSC 0:23
//sampler sampler renderTarget2SmpSC 0:24
//sampler sampler renderTarget3SmpSC 0:25
//texture texture2D renderTarget0 0:1:0:22
//texture texture2D renderTarget1 0:2:0:23
//texture texture2D renderTarget2 0:3:0:24
//texture texture2D renderTarget3 0:4:0:25
//ubo int UserUniforms 0:35:7632 {
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4 sc_StereoClipPlanes 3664:[2]:16
//int overrideTimeEnabled 4108
//float overrideTimeElapsed 4112:[32]:4
//float overrideTimeDelta 4240
//bool vfxBatchEnable 4248:[32]:4
//bool vfxEmitParticle 4376:[32]:4
//float3 vfxLocalAabbMin 6848
//float3 vfxLocalAabbMax 6864
//int vfxOffsetInstancesRead 7348
//int vfxOffsetInstancesWrite 7352
//float2 vfxTargetSizeRead 7360
//float2 vfxTargetSizeWrite 7368
//int vfxTargetWidth 7376
//float4 partColor 7392
//float Port_SpawnRate_N013 7416
//float Port_Import_N046 7420
//float Port_Import_N049 7424
//float Port_Import_N050 7428
//float Port_Import_N132 7432
//float Port_Import_N133 7436
//float Port_Min_N119 7472
//float Port_Max_N119 7476
//float Port_Value_N014 7480
//float Port_Import_N095 7484
//float3 Port_Import_N028 7488
//float3 Port_Import_N090 7504
//float Port_Import_N093 7520
//float Port_Import_N004 7524
//float Port_Import_N017 7528
//float Port_Import_N185 7532
//float Port_Import_N188 7536
//float Port_Import_N267 7540
//float Port_Import_N268 7544
//float Port_Import_N269 7548
//float Port_Min_N033 7552
//float Port_Max_N033 7556
//float Port_Import_N308 7584
//float3 Port_Import_N309 7600
//}
//spec_const bool renderTarget0HasSwappedViews 0 0
//spec_const bool renderTarget1HasSwappedViews 1 0
//spec_const bool renderTarget2HasSwappedViews 2 0
//spec_const bool renderTarget3HasSwappedViews 3 0
//spec_const int renderTarget0Layout 4 0
//spec_const int renderTarget1Layout 5 0
//spec_const int renderTarget2Layout 6 0
//spec_const int renderTarget3Layout 7 0
//spec_const int sc_ShaderCacheConstant 8 0
//spec_const int sc_StereoRenderingMode 9 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 10 0
//SG_REFLECTION_END
constant bool renderTarget0HasSwappedViews [[function_constant(0)]];
constant bool renderTarget0HasSwappedViews_tmp = is_function_constant_defined(renderTarget0HasSwappedViews) ? renderTarget0HasSwappedViews : false;
constant bool renderTarget1HasSwappedViews [[function_constant(1)]];
constant bool renderTarget1HasSwappedViews_tmp = is_function_constant_defined(renderTarget1HasSwappedViews) ? renderTarget1HasSwappedViews : false;
constant bool renderTarget2HasSwappedViews [[function_constant(2)]];
constant bool renderTarget2HasSwappedViews_tmp = is_function_constant_defined(renderTarget2HasSwappedViews) ? renderTarget2HasSwappedViews : false;
constant bool renderTarget3HasSwappedViews [[function_constant(3)]];
constant bool renderTarget3HasSwappedViews_tmp = is_function_constant_defined(renderTarget3HasSwappedViews) ? renderTarget3HasSwappedViews : false;
constant int renderTarget0Layout [[function_constant(4)]];
constant int renderTarget0Layout_tmp = is_function_constant_defined(renderTarget0Layout) ? renderTarget0Layout : 0;
constant int renderTarget1Layout [[function_constant(5)]];
constant int renderTarget1Layout_tmp = is_function_constant_defined(renderTarget1Layout) ? renderTarget1Layout : 0;
constant int renderTarget2Layout [[function_constant(6)]];
constant int renderTarget2Layout_tmp = is_function_constant_defined(renderTarget2Layout) ? renderTarget2Layout : 0;
constant int renderTarget3Layout [[function_constant(7)]];
constant int renderTarget3Layout_tmp = is_function_constant_defined(renderTarget3Layout) ? renderTarget3Layout : 0;
constant int sc_ShaderCacheConstant [[function_constant(8)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_StereoRenderingMode [[function_constant(9)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(10)]];
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
struct ssParticle
{
float3 Position;
float3 Velocity;
float4 Color;
float Size;
float Age;
float Life;
float Mass;
float3x3 Matrix;
bool Dead;
float4 Quaternion;
float SpawnIndex;
float SpawnIndexRemainder;
float NextBurstTime;
float SpawnOffset;
float Seed;
float2 Seed2000;
float TimeShift;
int Index1D;
int Index1DPerCopy;
float Index1DPerCopyF;
int StateID;
float Coord1D;
float Ratio1D;
float Ratio1DPerCopy;
int2 Index2D;
float2 Coord2D;
float2 Ratio2D;
float3 Force;
bool Spawned;
float CopyId;
float SpawnAmount;
float BurstAmount;
float BurstPeriod;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float gComponentTime;
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
int vfxNumCopies;
int vfxBatchEnable[32];
int vfxEmitParticle[32];
float4x4 vfxModelMatrix[32];
float4 renderTarget0Size;
float4 renderTarget0Dims;
float4 renderTarget0View;
float4 renderTarget1Size;
float4 renderTarget1Dims;
float4 renderTarget1View;
float4 renderTarget2Size;
float4 renderTarget2Dims;
float4 renderTarget2View;
float4 renderTarget3Size;
float4 renderTarget3Dims;
float4 renderTarget3View;
float4 sortRenderTarget0Size;
float4 sortRenderTarget0Dims;
float4 sortRenderTarget0View;
float4 sortRenderTarget1Size;
float4 sortRenderTarget1Dims;
float4 sortRenderTarget1View;
float3 vfxLocalAabbMin;
float3 vfxLocalAabbMax;
float vfxCameraAspect;
float vfxCameraNear;
float vfxCameraFar;
float4x4 vfxProjectionMatrix;
float4x4 vfxProjectionMatrixInverse;
float4x4 vfxViewMatrix;
float4x4 vfxViewMatrixInverse;
float4x4 vfxViewProjectionMatrix;
float4x4 vfxViewProjectionMatrixInverse;
float3 vfxCameraPosition;
float3 vfxCameraUp;
float3 vfxCameraForward;
float3 vfxCameraRight;
int vfxFrame;
int vfxOffsetInstancesRead;
int vfxOffsetInstancesWrite;
float2 vfxTargetSizeRead;
float2 vfxTargetSizeWrite;
int vfxTargetWidth;
float2 ssSORT_RENDER_TARGET_SIZE;
float4 partColor;
float Intensity;
float Tweak_N36;
float Port_SpawnRate_N013;
float Port_Import_N046;
float Port_Import_N049;
float Port_Import_N050;
float Port_Import_N132;
float Port_Import_N133;
float4 Port_Import_N117;
float4 Port_Import_N118;
float Port_Min_N119;
float Port_Max_N119;
float Port_Value_N014;
float Port_Import_N095;
float3 Port_Import_N028;
float3 Port_Import_N090;
float Port_Import_N093;
float Port_Import_N004;
float Port_Import_N017;
float Port_Import_N185;
float Port_Import_N188;
float Port_Import_N267;
float Port_Import_N268;
float Port_Import_N269;
float Port_Min_N033;
float Port_Max_N033;
float3 Port_Import_N172;
float Port_Import_N308;
float3 Port_Import_N309;
float Port_Enabled_N000;
};
struct sc_Set0
{
texture2d<float> renderTarget0 [[id(1)]];
texture2d<float> renderTarget1 [[id(2)]];
texture2d<float> renderTarget2 [[id(3)]];
texture2d<float> renderTarget3 [[id(4)]];
sampler renderTarget0SmpSC [[id(22)]];
sampler renderTarget1SmpSC [[id(23)]];
sampler renderTarget2SmpSC [[id(24)]];
sampler renderTarget3SmpSC [[id(25)]];
constant userUniformsObj* UserUniforms [[id(35)]];
};
struct main_vert_out
{
float4 varPosAndMotion [[user(locn0)]];
float4 varNormalAndMotion [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varTex01 [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float2 varShadowTex [[user(locn6)]];
int varStereoViewID [[user(locn7)]];
float varClipDistance [[user(locn8)]];
float4 varColor [[user(locn9)]];
int Interp_Particle_Index [[user(locn10)]];
float3 Interp_Particle_Force [[user(locn11)]];
float2 Interp_Particle_Coord [[user(locn12)]];
float Interp_Particle_SpawnIndex [[user(locn13)]];
float Interp_Particle_NextBurstTime [[user(locn14)]];
float3 Interp_Particle_Position [[user(locn15)]];
float3 Interp_Particle_Velocity [[user(locn16)]];
float Interp_Particle_Life [[user(locn17)]];
float Interp_Particle_Age [[user(locn18)]];
float Interp_Particle_Size [[user(locn19)]];
float4 Interp_Particle_Color [[user(locn20)]];
float4 Interp_Particle_Quaternion [[user(locn21)]];
float Interp_Particle_Mass [[user(locn22)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
// Implementation of the GLSL radians() function
template<typename T>
T radians(T d)
{
return d*T(0.01745329251);
}
bool ssDecodeParticle(thread const int& InstanceID,thread uint& gl_InstanceIndex,constant userUniformsObj& UserUniforms,thread texture2d<float> renderTarget0,thread sampler renderTarget0SmpSC,thread texture2d<float> renderTarget1,thread sampler renderTarget1SmpSC,thread texture2d<float> renderTarget2,thread sampler renderTarget2SmpSC,thread texture2d<float> renderTarget3,thread sampler renderTarget3SmpSC,thread ssParticle& gParticle)
{
ssParticle param=gParticle;
int param_1=InstanceID;
param.Position=float3(0.0);
param.Velocity=float3(0.0);
param.Color=float4(0.0);
param.Size=0.0;
param.Age=0.0;
param.Life=0.0;
param.Mass=1.0;
param.Matrix=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(0.0,0.0,1.0));
param.Quaternion=float4(0.0,0.0,0.0,1.0);
param.CopyId=float(param_1/2001);
param.SpawnIndex=-1.0;
param.SpawnIndexRemainder=-1.0;
param.SpawnAmount=0.0;
param.BurstAmount=0.0;
param.BurstPeriod=0.0;
param.NextBurstTime=0.0;
gParticle=param;
int param_2=InstanceID;
ssParticle param_3=gParticle;
int l9_0=param_2/2001;
param_3.Spawned=false;
param_3.Dead=false;
param_3.Force=float3(0.0);
param_3.Index1D=param_2;
param_3.Index1DPerCopy=param_2%2001;
param_3.Index1DPerCopyF=float(param_3.Index1DPerCopy);
param_3.StateID=(2001*((param_2/2001)+1))-1;
int l9_1=param_3.Index1D;
int2 l9_2=int2(l9_1%682,l9_1/682);
param_3.Index2D=l9_2;
int l9_3=param_3.Index1D;
float l9_4=(float(l9_3)+0.5)/2001.0;
param_3.Coord1D=l9_4;
int2 l9_5=param_3.Index2D;
float2 l9_6=(float2(l9_5)+float2(0.5))/float2(682.0,3.0);
param_3.Coord2D=l9_6;
int l9_7=param_3.Index1D;
float l9_8=float(l9_7)/2000.0;
param_3.Ratio1D=l9_8;
int l9_9=param_3.Index1DPerCopy;
float l9_10=float(l9_9)/2000.0;
param_3.Ratio1DPerCopy=l9_10;
int2 l9_11=param_3.Index2D;
float2 l9_12=float2(l9_11)/float2(681.0,2.0);
param_3.Ratio2D=l9_12;
param_3.Seed=0.0;
int l9_13=param_3.Index1D;
int l9_14=l9_13;
int l9_15=((l9_14*((l9_14*1471343)+101146501))+1559861749)&2147483647;
int l9_16=l9_15;
float l9_17=float(l9_16)*4.6566129e-10;
float l9_18=l9_17;
param_3.TimeShift=l9_18;
param_3.SpawnOffset=param_3.Ratio1D*3600.0;
ssParticle l9_19=param_3;
int l9_20=l9_0;
float l9_21;
if (UserUniforms.overrideTimeEnabled==1)
{
l9_21=UserUniforms.overrideTimeElapsed[l9_20];
}
else
{
l9_21=UserUniforms.sc_Time.x;
}
float l9_22=l9_21;
l9_19.Seed=(l9_19.Ratio1D*0.97637898)+0.151235;
l9_19.Seed+=(floor(((((l9_22-l9_19.SpawnOffset)-0.0)+1.0)+7200.0)/3600.0)*4.32723);
l9_19.Seed=fract(abs(l9_19.Seed));
int2 l9_23=int2(l9_19.Index1D%400,l9_19.Index1D/400);
l9_19.Seed2000=(float2(l9_23)+float2(1.0))/float2(399.0);
param_3=l9_19;
gParticle=param_3;
int offsetPixelId=(UserUniforms.vfxOffsetInstancesRead+InstanceID)*3;
int param_4=offsetPixelId;
int param_5=UserUniforms.vfxTargetWidth;
int l9_24=param_4-((param_4/param_5)*param_5);
int2 Index2D=int2(l9_24,offsetPixelId/UserUniforms.vfxTargetWidth);
float2 Coord=(float2(Index2D)+float2(0.5))/float2(2048.0,UserUniforms.vfxTargetSizeRead.y);
float2 Offset=float2(0.00048828125,0.0);
float2 uv=float2(0.0);
float Scalar0=0.0;
float Scalar1=0.0;
float Scalar2=0.0;
float Scalar3=0.0;
float Scalar4=0.0;
float Scalar5=0.0;
float Scalar6=0.0;
float Scalar7=0.0;
float Scalar8=0.0;
float Scalar9=0.0;
float Scalar10=0.0;
float Scalar11=0.0;
float Scalar12=0.0;
float Scalar13=0.0;
float Scalar14=0.0;
float Scalar15=0.0;
uv=Coord+(Offset*0.0);
float2 param_6=uv;
float2 l9_25=param_6;
int l9_26;
if ((int(renderTarget0HasSwappedViews_tmp)!=0))
{
int l9_27=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_27=0;
}
else
{
l9_27=gl_InstanceIndex%2;
}
int l9_28=l9_27;
l9_26=1-l9_28;
}
else
{
int l9_29=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_29=0;
}
else
{
l9_29=gl_InstanceIndex%2;
}
int l9_30=l9_29;
l9_26=l9_30;
}
int l9_31=l9_26;
float2 l9_32=l9_25;
int l9_33=renderTarget0Layout_tmp;
int l9_34=l9_31;
float2 l9_35=l9_32;
int l9_36=l9_33;
int l9_37=l9_34;
float3 l9_38=float3(0.0);
if (l9_36==0)
{
l9_38=float3(l9_35,0.0);
}
else
{
if (l9_36==1)
{
l9_38=float3(l9_35.x,(l9_35.y*0.5)+(0.5-(float(l9_37)*0.5)),0.0);
}
else
{
l9_38=float3(l9_35,float(l9_37));
}
}
float3 l9_39=l9_38;
float3 l9_40=l9_39;
float4 l9_41=renderTarget0.sample(renderTarget0SmpSC,l9_40.xy,level(0.0));
float4 l9_42=l9_41;
float4 l9_43=l9_42;
float4 renderTarget0Sample=l9_43;
float4 l9_44=renderTarget0Sample;
bool l9_45=dot(abs(l9_44),float4(1.0))<9.9999997e-06;
bool l9_46;
if (!l9_45)
{
int l9_47=gl_InstanceIndex;
l9_46=!(UserUniforms.vfxBatchEnable[l9_47/2001]!=0);
}
else
{
l9_46=l9_45;
}
if (l9_46)
{
return false;
}
Scalar0=renderTarget0Sample.x;
Scalar1=renderTarget0Sample.y;
Scalar2=renderTarget0Sample.z;
Scalar3=renderTarget0Sample.w;
float2 param_7=uv;
float2 l9_48=param_7;
int l9_49;
if ((int(renderTarget1HasSwappedViews_tmp)!=0))
{
int l9_50=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_50=0;
}
else
{
l9_50=gl_InstanceIndex%2;
}
int l9_51=l9_50;
l9_49=1-l9_51;
}
else
{
int l9_52=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_52=0;
}
else
{
l9_52=gl_InstanceIndex%2;
}
int l9_53=l9_52;
l9_49=l9_53;
}
int l9_54=l9_49;
float2 l9_55=l9_48;
int l9_56=renderTarget1Layout_tmp;
int l9_57=l9_54;
float2 l9_58=l9_55;
int l9_59=l9_56;
int l9_60=l9_57;
float3 l9_61=float3(0.0);
if (l9_59==0)
{
l9_61=float3(l9_58,0.0);
}
else
{
if (l9_59==1)
{
l9_61=float3(l9_58.x,(l9_58.y*0.5)+(0.5-(float(l9_60)*0.5)),0.0);
}
else
{
l9_61=float3(l9_58,float(l9_60));
}
}
float3 l9_62=l9_61;
float3 l9_63=l9_62;
float4 l9_64=renderTarget1.sample(renderTarget1SmpSC,l9_63.xy,level(0.0));
float4 l9_65=l9_64;
float4 l9_66=l9_65;
float4 renderTarget1Sample=l9_66;
Scalar4=renderTarget1Sample.x;
Scalar5=renderTarget1Sample.y;
Scalar6=renderTarget1Sample.z;
Scalar7=renderTarget1Sample.w;
float2 param_8=uv;
float2 l9_67=param_8;
int l9_68;
if ((int(renderTarget2HasSwappedViews_tmp)!=0))
{
int l9_69=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_69=0;
}
else
{
l9_69=gl_InstanceIndex%2;
}
int l9_70=l9_69;
l9_68=1-l9_70;
}
else
{
int l9_71=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_71=0;
}
else
{
l9_71=gl_InstanceIndex%2;
}
int l9_72=l9_71;
l9_68=l9_72;
}
int l9_73=l9_68;
float2 l9_74=l9_67;
int l9_75=renderTarget2Layout_tmp;
int l9_76=l9_73;
float2 l9_77=l9_74;
int l9_78=l9_75;
int l9_79=l9_76;
float3 l9_80=float3(0.0);
if (l9_78==0)
{
l9_80=float3(l9_77,0.0);
}
else
{
if (l9_78==1)
{
l9_80=float3(l9_77.x,(l9_77.y*0.5)+(0.5-(float(l9_79)*0.5)),0.0);
}
else
{
l9_80=float3(l9_77,float(l9_79));
}
}
float3 l9_81=l9_80;
float3 l9_82=l9_81;
float4 l9_83=renderTarget2.sample(renderTarget2SmpSC,l9_82.xy,level(0.0));
float4 l9_84=l9_83;
float4 l9_85=l9_84;
float4 renderTarget2Sample=l9_85;
Scalar8=renderTarget2Sample.x;
Scalar9=renderTarget2Sample.y;
Scalar10=renderTarget2Sample.z;
Scalar11=renderTarget2Sample.w;
float2 param_9=uv;
float2 l9_86=param_9;
int l9_87;
if ((int(renderTarget3HasSwappedViews_tmp)!=0))
{
int l9_88=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_88=0;
}
else
{
l9_88=gl_InstanceIndex%2;
}
int l9_89=l9_88;
l9_87=1-l9_89;
}
else
{
int l9_90=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_90=0;
}
else
{
l9_90=gl_InstanceIndex%2;
}
int l9_91=l9_90;
l9_87=l9_91;
}
int l9_92=l9_87;
float2 l9_93=l9_86;
int l9_94=renderTarget3Layout_tmp;
int l9_95=l9_92;
float2 l9_96=l9_93;
int l9_97=l9_94;
int l9_98=l9_95;
float3 l9_99=float3(0.0);
if (l9_97==0)
{
l9_99=float3(l9_96,0.0);
}
else
{
if (l9_97==1)
{
l9_99=float3(l9_96.x,(l9_96.y*0.5)+(0.5-(float(l9_98)*0.5)),0.0);
}
else
{
l9_99=float3(l9_96,float(l9_98));
}
}
float3 l9_100=l9_99;
float3 l9_101=l9_100;
float4 l9_102=renderTarget3.sample(renderTarget3SmpSC,l9_101.xy,level(0.0));
float4 l9_103=l9_102;
float4 l9_104=l9_103;
float4 renderTarget3Sample=l9_104;
Scalar12=renderTarget3Sample.x;
Scalar13=renderTarget3Sample.y;
Scalar14=renderTarget3Sample.z;
Scalar15=renderTarget3Sample.w;
float4 param_10=float4(Scalar0,Scalar1,Scalar2,Scalar3);
float param_11=-1000.0;
float param_12=1000.0;
float4 l9_105=param_10;
float l9_106=param_11;
float l9_107=param_12;
float l9_108=0.99998999;
float4 l9_109=l9_105;
#if (1)
{
l9_109=floor((l9_109*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_110=dot(l9_109,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_111=l9_110;
float l9_112=0.0;
float l9_113=l9_108;
float l9_114=l9_106;
float l9_115=l9_107;
float l9_116=l9_114+(((l9_111-l9_112)*(l9_115-l9_114))/(l9_113-l9_112));
float l9_117=l9_116;
float l9_118=l9_117;
gParticle.Position.x=l9_118;
float4 param_13=float4(Scalar4,Scalar5,Scalar6,Scalar7);
float param_14=-1000.0;
float param_15=1000.0;
float4 l9_119=param_13;
float l9_120=param_14;
float l9_121=param_15;
float l9_122=0.99998999;
float4 l9_123=l9_119;
#if (1)
{
l9_123=floor((l9_123*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_124=dot(l9_123,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_125=l9_124;
float l9_126=0.0;
float l9_127=l9_122;
float l9_128=l9_120;
float l9_129=l9_121;
float l9_130=l9_128+(((l9_125-l9_126)*(l9_129-l9_128))/(l9_127-l9_126));
float l9_131=l9_130;
float l9_132=l9_131;
gParticle.Position.y=l9_132;
float4 param_16=float4(Scalar8,Scalar9,Scalar10,Scalar11);
float param_17=-1000.0;
float param_18=1000.0;
float4 l9_133=param_16;
float l9_134=param_17;
float l9_135=param_18;
float l9_136=0.99998999;
float4 l9_137=l9_133;
#if (1)
{
l9_137=floor((l9_137*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_138=dot(l9_137,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_139=l9_138;
float l9_140=0.0;
float l9_141=l9_136;
float l9_142=l9_134;
float l9_143=l9_135;
float l9_144=l9_142+(((l9_139-l9_140)*(l9_143-l9_142))/(l9_141-l9_140));
float l9_145=l9_144;
float l9_146=l9_145;
gParticle.Position.z=l9_146;
float4 param_19=float4(Scalar12,Scalar13,Scalar14,Scalar15);
float param_20=-1000.0;
float param_21=1000.0;
float4 l9_147=param_19;
float l9_148=param_20;
float l9_149=param_21;
float l9_150=0.99998999;
float4 l9_151=l9_147;
#if (1)
{
l9_151=floor((l9_151*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_152=dot(l9_151,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_153=l9_152;
float l9_154=0.0;
float l9_155=l9_150;
float l9_156=l9_148;
float l9_157=l9_149;
float l9_158=l9_156+(((l9_153-l9_154)*(l9_157-l9_156))/(l9_155-l9_154));
float l9_159=l9_158;
float l9_160=l9_159;
gParticle.Velocity.x=l9_160;
uv=Coord+(Offset*1.0);
float2 param_22=uv;
float2 l9_161=param_22;
int l9_162;
if ((int(renderTarget0HasSwappedViews_tmp)!=0))
{
int l9_163=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_163=0;
}
else
{
l9_163=gl_InstanceIndex%2;
}
int l9_164=l9_163;
l9_162=1-l9_164;
}
else
{
int l9_165=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_165=0;
}
else
{
l9_165=gl_InstanceIndex%2;
}
int l9_166=l9_165;
l9_162=l9_166;
}
int l9_167=l9_162;
float2 l9_168=l9_161;
int l9_169=renderTarget0Layout_tmp;
int l9_170=l9_167;
float2 l9_171=l9_168;
int l9_172=l9_169;
int l9_173=l9_170;
float3 l9_174=float3(0.0);
if (l9_172==0)
{
l9_174=float3(l9_171,0.0);
}
else
{
if (l9_172==1)
{
l9_174=float3(l9_171.x,(l9_171.y*0.5)+(0.5-(float(l9_173)*0.5)),0.0);
}
else
{
l9_174=float3(l9_171,float(l9_173));
}
}
float3 l9_175=l9_174;
float3 l9_176=l9_175;
float4 l9_177=renderTarget0.sample(renderTarget0SmpSC,l9_176.xy,level(0.0));
float4 l9_178=l9_177;
float4 l9_179=l9_178;
float4 renderTarget0Sample_1=l9_179;
Scalar0=renderTarget0Sample_1.x;
Scalar1=renderTarget0Sample_1.y;
Scalar2=renderTarget0Sample_1.z;
Scalar3=renderTarget0Sample_1.w;
float2 param_23=uv;
float2 l9_180=param_23;
int l9_181;
if ((int(renderTarget1HasSwappedViews_tmp)!=0))
{
int l9_182=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_182=0;
}
else
{
l9_182=gl_InstanceIndex%2;
}
int l9_183=l9_182;
l9_181=1-l9_183;
}
else
{
int l9_184=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_184=0;
}
else
{
l9_184=gl_InstanceIndex%2;
}
int l9_185=l9_184;
l9_181=l9_185;
}
int l9_186=l9_181;
float2 l9_187=l9_180;
int l9_188=renderTarget1Layout_tmp;
int l9_189=l9_186;
float2 l9_190=l9_187;
int l9_191=l9_188;
int l9_192=l9_189;
float3 l9_193=float3(0.0);
if (l9_191==0)
{
l9_193=float3(l9_190,0.0);
}
else
{
if (l9_191==1)
{
l9_193=float3(l9_190.x,(l9_190.y*0.5)+(0.5-(float(l9_192)*0.5)),0.0);
}
else
{
l9_193=float3(l9_190,float(l9_192));
}
}
float3 l9_194=l9_193;
float3 l9_195=l9_194;
float4 l9_196=renderTarget1.sample(renderTarget1SmpSC,l9_195.xy,level(0.0));
float4 l9_197=l9_196;
float4 l9_198=l9_197;
float4 renderTarget1Sample_1=l9_198;
Scalar4=renderTarget1Sample_1.x;
Scalar5=renderTarget1Sample_1.y;
Scalar6=renderTarget1Sample_1.z;
Scalar7=renderTarget1Sample_1.w;
float2 param_24=uv;
float2 l9_199=param_24;
int l9_200;
if ((int(renderTarget2HasSwappedViews_tmp)!=0))
{
int l9_201=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_201=0;
}
else
{
l9_201=gl_InstanceIndex%2;
}
int l9_202=l9_201;
l9_200=1-l9_202;
}
else
{
int l9_203=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_203=0;
}
else
{
l9_203=gl_InstanceIndex%2;
}
int l9_204=l9_203;
l9_200=l9_204;
}
int l9_205=l9_200;
float2 l9_206=l9_199;
int l9_207=renderTarget2Layout_tmp;
int l9_208=l9_205;
float2 l9_209=l9_206;
int l9_210=l9_207;
int l9_211=l9_208;
float3 l9_212=float3(0.0);
if (l9_210==0)
{
l9_212=float3(l9_209,0.0);
}
else
{
if (l9_210==1)
{
l9_212=float3(l9_209.x,(l9_209.y*0.5)+(0.5-(float(l9_211)*0.5)),0.0);
}
else
{
l9_212=float3(l9_209,float(l9_211));
}
}
float3 l9_213=l9_212;
float3 l9_214=l9_213;
float4 l9_215=renderTarget2.sample(renderTarget2SmpSC,l9_214.xy,level(0.0));
float4 l9_216=l9_215;
float4 l9_217=l9_216;
float4 renderTarget2Sample_1=l9_217;
Scalar8=renderTarget2Sample_1.x;
Scalar9=renderTarget2Sample_1.y;
Scalar10=renderTarget2Sample_1.z;
Scalar11=renderTarget2Sample_1.w;
float2 param_25=uv;
float2 l9_218=param_25;
int l9_219;
if ((int(renderTarget3HasSwappedViews_tmp)!=0))
{
int l9_220=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_220=0;
}
else
{
l9_220=gl_InstanceIndex%2;
}
int l9_221=l9_220;
l9_219=1-l9_221;
}
else
{
int l9_222=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_222=0;
}
else
{
l9_222=gl_InstanceIndex%2;
}
int l9_223=l9_222;
l9_219=l9_223;
}
int l9_224=l9_219;
float2 l9_225=l9_218;
int l9_226=renderTarget3Layout_tmp;
int l9_227=l9_224;
float2 l9_228=l9_225;
int l9_229=l9_226;
int l9_230=l9_227;
float3 l9_231=float3(0.0);
if (l9_229==0)
{
l9_231=float3(l9_228,0.0);
}
else
{
if (l9_229==1)
{
l9_231=float3(l9_228.x,(l9_228.y*0.5)+(0.5-(float(l9_230)*0.5)),0.0);
}
else
{
l9_231=float3(l9_228,float(l9_230));
}
}
float3 l9_232=l9_231;
float3 l9_233=l9_232;
float4 l9_234=renderTarget3.sample(renderTarget3SmpSC,l9_233.xy,level(0.0));
float4 l9_235=l9_234;
float4 l9_236=l9_235;
float4 renderTarget3Sample_1=l9_236;
Scalar12=renderTarget3Sample_1.x;
Scalar13=renderTarget3Sample_1.y;
Scalar14=renderTarget3Sample_1.z;
Scalar15=renderTarget3Sample_1.w;
float4 param_26=float4(Scalar0,Scalar1,Scalar2,Scalar3);
float param_27=-1000.0;
float param_28=1000.0;
float4 l9_237=param_26;
float l9_238=param_27;
float l9_239=param_28;
float l9_240=0.99998999;
float4 l9_241=l9_237;
#if (1)
{
l9_241=floor((l9_241*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_242=dot(l9_241,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_243=l9_242;
float l9_244=0.0;
float l9_245=l9_240;
float l9_246=l9_238;
float l9_247=l9_239;
float l9_248=l9_246+(((l9_243-l9_244)*(l9_247-l9_246))/(l9_245-l9_244));
float l9_249=l9_248;
float l9_250=l9_249;
gParticle.Velocity.y=l9_250;
float4 param_29=float4(Scalar4,Scalar5,Scalar6,Scalar7);
float param_30=-1000.0;
float param_31=1000.0;
float4 l9_251=param_29;
float l9_252=param_30;
float l9_253=param_31;
float l9_254=0.99998999;
float4 l9_255=l9_251;
#if (1)
{
l9_255=floor((l9_255*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_256=dot(l9_255,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_257=l9_256;
float l9_258=0.0;
float l9_259=l9_254;
float l9_260=l9_252;
float l9_261=l9_253;
float l9_262=l9_260+(((l9_257-l9_258)*(l9_261-l9_260))/(l9_259-l9_258));
float l9_263=l9_262;
float l9_264=l9_263;
gParticle.Velocity.z=l9_264;
float4 param_32=float4(Scalar8,Scalar9,Scalar10,Scalar11);
float param_33=0.0;
float param_34=3600.0;
float4 l9_265=param_32;
float l9_266=param_33;
float l9_267=param_34;
float l9_268=0.99998999;
float4 l9_269=l9_265;
#if (1)
{
l9_269=floor((l9_269*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_270=dot(l9_269,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_271=l9_270;
float l9_272=0.0;
float l9_273=l9_268;
float l9_274=l9_266;
float l9_275=l9_267;
float l9_276=l9_274+(((l9_271-l9_272)*(l9_275-l9_274))/(l9_273-l9_272));
float l9_277=l9_276;
float l9_278=l9_277;
gParticle.Life=l9_278;
float4 param_35=float4(Scalar12,Scalar13,Scalar14,Scalar15);
float param_36=0.0;
float param_37=3600.0;
float4 l9_279=param_35;
float l9_280=param_36;
float l9_281=param_37;
float l9_282=0.99998999;
float4 l9_283=l9_279;
#if (1)
{
l9_283=floor((l9_283*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_284=dot(l9_283,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_285=l9_284;
float l9_286=0.0;
float l9_287=l9_282;
float l9_288=l9_280;
float l9_289=l9_281;
float l9_290=l9_288+(((l9_285-l9_286)*(l9_289-l9_288))/(l9_287-l9_286));
float l9_291=l9_290;
float l9_292=l9_291;
gParticle.Age=l9_292;
uv=Coord+(Offset*2.0);
float2 param_38=uv;
float2 l9_293=param_38;
int l9_294;
if ((int(renderTarget0HasSwappedViews_tmp)!=0))
{
int l9_295=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_295=0;
}
else
{
l9_295=gl_InstanceIndex%2;
}
int l9_296=l9_295;
l9_294=1-l9_296;
}
else
{
int l9_297=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_297=0;
}
else
{
l9_297=gl_InstanceIndex%2;
}
int l9_298=l9_297;
l9_294=l9_298;
}
int l9_299=l9_294;
float2 l9_300=l9_293;
int l9_301=renderTarget0Layout_tmp;
int l9_302=l9_299;
float2 l9_303=l9_300;
int l9_304=l9_301;
int l9_305=l9_302;
float3 l9_306=float3(0.0);
if (l9_304==0)
{
l9_306=float3(l9_303,0.0);
}
else
{
if (l9_304==1)
{
l9_306=float3(l9_303.x,(l9_303.y*0.5)+(0.5-(float(l9_305)*0.5)),0.0);
}
else
{
l9_306=float3(l9_303,float(l9_305));
}
}
float3 l9_307=l9_306;
float3 l9_308=l9_307;
float4 l9_309=renderTarget0.sample(renderTarget0SmpSC,l9_308.xy,level(0.0));
float4 l9_310=l9_309;
float4 l9_311=l9_310;
float4 renderTarget0Sample_2=l9_311;
Scalar0=renderTarget0Sample_2.x;
Scalar1=renderTarget0Sample_2.y;
Scalar2=renderTarget0Sample_2.z;
Scalar3=renderTarget0Sample_2.w;
float2 param_39=uv;
float2 l9_312=param_39;
int l9_313;
if ((int(renderTarget1HasSwappedViews_tmp)!=0))
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
float2 l9_319=l9_312;
int l9_320=renderTarget1Layout_tmp;
int l9_321=l9_318;
float2 l9_322=l9_319;
int l9_323=l9_320;
int l9_324=l9_321;
float3 l9_325=float3(0.0);
if (l9_323==0)
{
l9_325=float3(l9_322,0.0);
}
else
{
if (l9_323==1)
{
l9_325=float3(l9_322.x,(l9_322.y*0.5)+(0.5-(float(l9_324)*0.5)),0.0);
}
else
{
l9_325=float3(l9_322,float(l9_324));
}
}
float3 l9_326=l9_325;
float3 l9_327=l9_326;
float4 l9_328=renderTarget1.sample(renderTarget1SmpSC,l9_327.xy,level(0.0));
float4 l9_329=l9_328;
float4 l9_330=l9_329;
float4 renderTarget1Sample_2=l9_330;
Scalar4=renderTarget1Sample_2.x;
Scalar5=renderTarget1Sample_2.y;
Scalar6=renderTarget1Sample_2.z;
Scalar7=renderTarget1Sample_2.w;
float2 param_40=uv;
float2 l9_331=param_40;
int l9_332;
if ((int(renderTarget2HasSwappedViews_tmp)!=0))
{
int l9_333=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_333=0;
}
else
{
l9_333=gl_InstanceIndex%2;
}
int l9_334=l9_333;
l9_332=1-l9_334;
}
else
{
int l9_335=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_335=0;
}
else
{
l9_335=gl_InstanceIndex%2;
}
int l9_336=l9_335;
l9_332=l9_336;
}
int l9_337=l9_332;
float2 l9_338=l9_331;
int l9_339=renderTarget2Layout_tmp;
int l9_340=l9_337;
float2 l9_341=l9_338;
int l9_342=l9_339;
int l9_343=l9_340;
float3 l9_344=float3(0.0);
if (l9_342==0)
{
l9_344=float3(l9_341,0.0);
}
else
{
if (l9_342==1)
{
l9_344=float3(l9_341.x,(l9_341.y*0.5)+(0.5-(float(l9_343)*0.5)),0.0);
}
else
{
l9_344=float3(l9_341,float(l9_343));
}
}
float3 l9_345=l9_344;
float3 l9_346=l9_345;
float4 l9_347=renderTarget2.sample(renderTarget2SmpSC,l9_346.xy,level(0.0));
float4 l9_348=l9_347;
float4 l9_349=l9_348;
float4 renderTarget2Sample_2=l9_349;
Scalar8=renderTarget2Sample_2.x;
Scalar9=renderTarget2Sample_2.y;
Scalar10=renderTarget2Sample_2.z;
Scalar11=renderTarget2Sample_2.w;
float2 param_41=uv;
float2 l9_350=param_41;
int l9_351;
if ((int(renderTarget3HasSwappedViews_tmp)!=0))
{
int l9_352=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_352=0;
}
else
{
l9_352=gl_InstanceIndex%2;
}
int l9_353=l9_352;
l9_351=1-l9_353;
}
else
{
int l9_354=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_354=0;
}
else
{
l9_354=gl_InstanceIndex%2;
}
int l9_355=l9_354;
l9_351=l9_355;
}
int l9_356=l9_351;
float2 l9_357=l9_350;
int l9_358=renderTarget3Layout_tmp;
int l9_359=l9_356;
float2 l9_360=l9_357;
int l9_361=l9_358;
int l9_362=l9_359;
float3 l9_363=float3(0.0);
if (l9_361==0)
{
l9_363=float3(l9_360,0.0);
}
else
{
if (l9_361==1)
{
l9_363=float3(l9_360.x,(l9_360.y*0.5)+(0.5-(float(l9_362)*0.5)),0.0);
}
else
{
l9_363=float3(l9_360,float(l9_362));
}
}
float3 l9_364=l9_363;
float3 l9_365=l9_364;
float4 l9_366=renderTarget3.sample(renderTarget3SmpSC,l9_365.xy,level(0.0));
float4 l9_367=l9_366;
float4 l9_368=l9_367;
float4 renderTarget3Sample_2=l9_368;
Scalar12=renderTarget3Sample_2.x;
Scalar13=renderTarget3Sample_2.y;
Scalar14=renderTarget3Sample_2.z;
Scalar15=renderTarget3Sample_2.w;
float2 param_42=float2(Scalar0,Scalar1);
float param_43=0.0;
float param_44=100.0;
float2 l9_369=param_42;
float l9_370=param_43;
float l9_371=param_44;
float l9_372=0.99998999;
float2 l9_373=l9_369;
#if (1)
{
l9_373=floor((l9_373*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_374=dot(l9_373,float2(1.0,0.0039215689));
float l9_375=l9_374;
float l9_376=0.0;
float l9_377=l9_372;
float l9_378=l9_370;
float l9_379=l9_371;
float l9_380=l9_378+(((l9_375-l9_376)*(l9_379-l9_378))/(l9_377-l9_376));
float l9_381=l9_380;
float l9_382=l9_381;
gParticle.Size=l9_382;
float2 param_45=float2(Scalar2,Scalar3);
float param_46=-1.0;
float param_47=1.0;
float2 l9_383=param_45;
float l9_384=param_46;
float l9_385=param_47;
float l9_386=0.99998999;
float2 l9_387=l9_383;
#if (1)
{
l9_387=floor((l9_387*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_388=dot(l9_387,float2(1.0,0.0039215689));
float l9_389=l9_388;
float l9_390=0.0;
float l9_391=l9_386;
float l9_392=l9_384;
float l9_393=l9_385;
float l9_394=l9_392+(((l9_389-l9_390)*(l9_393-l9_392))/(l9_391-l9_390));
float l9_395=l9_394;
float l9_396=l9_395;
gParticle.Quaternion.x=l9_396;
float2 param_48=float2(Scalar4,Scalar5);
float param_49=-1.0;
float param_50=1.0;
float2 l9_397=param_48;
float l9_398=param_49;
float l9_399=param_50;
float l9_400=0.99998999;
float2 l9_401=l9_397;
#if (1)
{
l9_401=floor((l9_401*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_402=dot(l9_401,float2(1.0,0.0039215689));
float l9_403=l9_402;
float l9_404=0.0;
float l9_405=l9_400;
float l9_406=l9_398;
float l9_407=l9_399;
float l9_408=l9_406+(((l9_403-l9_404)*(l9_407-l9_406))/(l9_405-l9_404));
float l9_409=l9_408;
float l9_410=l9_409;
gParticle.Quaternion.y=l9_410;
float2 param_51=float2(Scalar6,Scalar7);
float param_52=-1.0;
float param_53=1.0;
float2 l9_411=param_51;
float l9_412=param_52;
float l9_413=param_53;
float l9_414=0.99998999;
float2 l9_415=l9_411;
#if (1)
{
l9_415=floor((l9_415*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_416=dot(l9_415,float2(1.0,0.0039215689));
float l9_417=l9_416;
float l9_418=0.0;
float l9_419=l9_414;
float l9_420=l9_412;
float l9_421=l9_413;
float l9_422=l9_420+(((l9_417-l9_418)*(l9_421-l9_420))/(l9_419-l9_418));
float l9_423=l9_422;
float l9_424=l9_423;
gParticle.Quaternion.z=l9_424;
float2 param_54=float2(Scalar8,Scalar9);
float param_55=-1.0;
float param_56=1.0;
float2 l9_425=param_54;
float l9_426=param_55;
float l9_427=param_56;
float l9_428=0.99998999;
float2 l9_429=l9_425;
#if (1)
{
l9_429=floor((l9_429*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_430=dot(l9_429,float2(1.0,0.0039215689));
float l9_431=l9_430;
float l9_432=0.0;
float l9_433=l9_428;
float l9_434=l9_426;
float l9_435=l9_427;
float l9_436=l9_434+(((l9_431-l9_432)*(l9_435-l9_434))/(l9_433-l9_432));
float l9_437=l9_436;
float l9_438=l9_437;
gParticle.Quaternion.w=l9_438;
float2 param_57=float2(Scalar10,Scalar11);
float param_58=0.0;
float param_59=100.0;
float2 l9_439=param_57;
float l9_440=param_58;
float l9_441=param_59;
float l9_442=0.99998999;
float2 l9_443=l9_439;
#if (1)
{
l9_443=floor((l9_443*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_444=dot(l9_443,float2(1.0,0.0039215689));
float l9_445=l9_444;
float l9_446=0.0;
float l9_447=l9_442;
float l9_448=l9_440;
float l9_449=l9_441;
float l9_450=l9_448+(((l9_445-l9_446)*(l9_449-l9_448))/(l9_447-l9_446));
float l9_451=l9_450;
float l9_452=l9_451;
gParticle.Mass=l9_452;
float param_60=Scalar12;
float param_61=0.0;
float param_62=1.00001;
float l9_453=param_60;
float l9_454=param_61;
float l9_455=param_62;
float l9_456=1.0;
float l9_457=l9_453;
#if (1)
{
l9_457=floor((l9_457*255.0)+0.5)/255.0;
}
#endif
float l9_458=l9_457;
float l9_459=l9_458;
float l9_460=0.0;
float l9_461=l9_456;
float l9_462=l9_454;
float l9_463=l9_455;
float l9_464=l9_462+(((l9_459-l9_460)*(l9_463-l9_462))/(l9_461-l9_460));
float l9_465=l9_464;
float l9_466=l9_465;
gParticle.Color.x=l9_466;
float param_63=Scalar13;
float param_64=0.0;
float param_65=1.00001;
float l9_467=param_63;
float l9_468=param_64;
float l9_469=param_65;
float l9_470=1.0;
float l9_471=l9_467;
#if (1)
{
l9_471=floor((l9_471*255.0)+0.5)/255.0;
}
#endif
float l9_472=l9_471;
float l9_473=l9_472;
float l9_474=0.0;
float l9_475=l9_470;
float l9_476=l9_468;
float l9_477=l9_469;
float l9_478=l9_476+(((l9_473-l9_474)*(l9_477-l9_476))/(l9_475-l9_474));
float l9_479=l9_478;
float l9_480=l9_479;
gParticle.Color.y=l9_480;
float param_66=Scalar14;
float param_67=0.0;
float param_68=1.00001;
float l9_481=param_66;
float l9_482=param_67;
float l9_483=param_68;
float l9_484=1.0;
float l9_485=l9_481;
#if (1)
{
l9_485=floor((l9_485*255.0)+0.5)/255.0;
}
#endif
float l9_486=l9_485;
float l9_487=l9_486;
float l9_488=0.0;
float l9_489=l9_484;
float l9_490=l9_482;
float l9_491=l9_483;
float l9_492=l9_490+(((l9_487-l9_488)*(l9_491-l9_490))/(l9_489-l9_488));
float l9_493=l9_492;
float l9_494=l9_493;
gParticle.Color.z=l9_494;
float param_69=Scalar15;
float param_70=0.0;
float param_71=1.00001;
float l9_495=param_69;
float l9_496=param_70;
float l9_497=param_71;
float l9_498=1.0;
float l9_499=l9_495;
#if (1)
{
l9_499=floor((l9_499*255.0)+0.5)/255.0;
}
#endif
float l9_500=l9_499;
float l9_501=l9_500;
float l9_502=0.0;
float l9_503=l9_498;
float l9_504=l9_496;
float l9_505=l9_497;
float l9_506=l9_504+(((l9_501-l9_502)*(l9_505-l9_504))/(l9_503-l9_502));
float l9_507=l9_506;
float l9_508=l9_507;
gParticle.Color.w=l9_508;
float4 param_72=gParticle.Quaternion;
param_72=normalize(param_72.yzwx);
float l9_509=param_72.x*param_72.x;
float l9_510=param_72.y*param_72.y;
float l9_511=param_72.z*param_72.z;
float l9_512=param_72.x*param_72.z;
float l9_513=param_72.x*param_72.y;
float l9_514=param_72.y*param_72.z;
float l9_515=param_72.w*param_72.x;
float l9_516=param_72.w*param_72.y;
float l9_517=param_72.w*param_72.z;
float3x3 l9_518=float3x3(float3(1.0-(2.0*(l9_510+l9_511)),2.0*(l9_513+l9_517),2.0*(l9_512-l9_516)),float3(2.0*(l9_513-l9_517),1.0-(2.0*(l9_509+l9_511)),2.0*(l9_514+l9_515)),float3(2.0*(l9_512+l9_516),2.0*(l9_514-l9_515),1.0-(2.0*(l9_509+l9_510))));
gParticle.Matrix=l9_518;
gParticle.Velocity=floor((gParticle.Velocity*2000.0)+float3(0.5))*0.00050000002;
gParticle.Position=floor((gParticle.Position*2000.0)+float3(0.5))*0.00050000002;
gParticle.Color=floor((gParticle.Color*2000.0)+float4(0.5))*0.00050000002;
gParticle.Size=floor((gParticle.Size*2000.0)+0.5)*0.00050000002;
gParticle.Mass=floor((gParticle.Mass*2000.0)+0.5)*0.00050000002;
gParticle.Life=floor((gParticle.Life*2000.0)+0.5)*0.00050000002;
return true;
}
float4 matrixToQuaternion(thread const float3x3& m)
{
float fourXSquaredMinus1=(m[0].x-m[1].y)-m[2].z;
float fourYSquaredMinus1=(m[1].y-m[0].x)-m[2].z;
float fourZSquaredMinus1=(m[2].z-m[0].x)-m[1].y;
float fourWSquaredMinus1=(m[0].x+m[1].y)+m[2].z;
int biggestIndex=0;
float fourBiggestSquaredMinus1=fourWSquaredMinus1;
if (fourXSquaredMinus1>fourBiggestSquaredMinus1)
{
fourBiggestSquaredMinus1=fourXSquaredMinus1;
biggestIndex=1;
}
if (fourYSquaredMinus1>fourBiggestSquaredMinus1)
{
fourBiggestSquaredMinus1=fourYSquaredMinus1;
biggestIndex=2;
}
if (fourZSquaredMinus1>fourBiggestSquaredMinus1)
{
fourBiggestSquaredMinus1=fourZSquaredMinus1;
biggestIndex=3;
}
float biggestVal=sqrt(fourBiggestSquaredMinus1+1.0)*0.5;
float mult=0.25/biggestVal;
if (biggestIndex==0)
{
return float4(biggestVal,(m[1].z-m[2].y)*mult,(m[2].x-m[0].z)*mult,(m[0].y-m[1].x)*mult);
}
else
{
if (biggestIndex==1)
{
return float4((m[1].z-m[2].y)*mult,biggestVal,(m[0].y+m[1].x)*mult,(m[2].x+m[0].z)*mult);
}
else
{
if (biggestIndex==2)
{
return float4((m[2].x-m[0].z)*mult,(m[0].y+m[1].x)*mult,biggestVal,(m[1].z+m[2].y)*mult);
}
else
{
if (biggestIndex==3)
{
return float4((m[0].y-m[1].x)*mult,(m[2].x+m[0].z)*mult,(m[1].z+m[2].y)*mult,biggestVal);
}
else
{
return float4(1.0,0.0,0.0,0.0);
}
}
}
}
}
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
int ssInstanceID=0;
bool N51_SizeMode=false;
float N51_SizeMin=0.0;
float N51_SizeMax=0.0;
float N51_SizeMul=0.0;
int N32_Axis=0;
float N32_Radius=0.0;
float3 N32_Scale=float3(0.0);
float3 N32_Center=float3(0.0);
float N32_EdgeFill=0.0;
float N73_AlphaMin=0.0;
float N73_AlphaMax=0.0;
float N73_FadeInTime=0.0;
float N73_FadeOutTime=0.0;
float N9_DragCoefficient=0.0;
float N9_Density=0.0;
float N9_Area=0.0;
sc_Vertex_t l9_0;
l9_0.position=in.position;
l9_0.texture0=in.texture0;
l9_0.texture1=in.texture1;
sc_Vertex_t l9_1=l9_0;
sc_Vertex_t v=l9_1;
int l9_2=gl_InstanceIndex;
ssInstanceID=l9_2;
int param=ssInstanceID;
ssParticle gParticle;
bool l9_3=ssDecodeParticle(param,gl_InstanceIndex,(*sc_set0.UserUniforms),sc_set0.renderTarget0,sc_set0.renderTarget0SmpSC,sc_set0.renderTarget1,sc_set0.renderTarget1SmpSC,sc_set0.renderTarget2,sc_set0.renderTarget2SmpSC,sc_set0.renderTarget3,sc_set0.renderTarget3SmpSC,gParticle);
int l9_4=((*sc_set0.UserUniforms).vfxOffsetInstancesRead+gParticle.StateID)*3;
int l9_5=l9_4;
int l9_6=(*sc_set0.UserUniforms).vfxTargetWidth;
int l9_7=l9_5-((l9_5/l9_6)*l9_6);
int2 l9_8=int2(l9_7,l9_4/(*sc_set0.UserUniforms).vfxTargetWidth);
float2 l9_9=(float2(l9_8)+float2(0.5))/float2(2048.0,(*sc_set0.UserUniforms).vfxTargetSizeRead.y);
float2 l9_10=float2(0.00048828125,0.0);
float2 l9_11=l9_9+l9_10;
float2 l9_12=l9_11;
float2 l9_13=l9_12;
int l9_14;
if ((int(renderTarget0HasSwappedViews_tmp)!=0))
{
int l9_15=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_15=0;
}
else
{
l9_15=gl_InstanceIndex%2;
}
int l9_16=l9_15;
l9_14=1-l9_16;
}
else
{
int l9_17=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_17=0;
}
else
{
l9_17=gl_InstanceIndex%2;
}
int l9_18=l9_17;
l9_14=l9_18;
}
int l9_19=l9_14;
float2 l9_20=l9_13;
int l9_21=renderTarget0Layout_tmp;
int l9_22=l9_19;
float2 l9_23=l9_20;
int l9_24=l9_21;
int l9_25=l9_22;
float3 l9_26=float3(0.0);
if (l9_24==0)
{
l9_26=float3(l9_23,0.0);
}
else
{
if (l9_24==1)
{
l9_26=float3(l9_23.x,(l9_23.y*0.5)+(0.5-(float(l9_25)*0.5)),0.0);
}
else
{
l9_26=float3(l9_23,float(l9_25));
}
}
float3 l9_27=l9_26;
float3 l9_28=l9_27;
float4 l9_29=sc_set0.renderTarget0.sample(sc_set0.renderTarget0SmpSC,l9_28.xy,level(0.0));
float4 l9_30=l9_29;
float4 l9_31=l9_30;
float4 l9_32=l9_31;
float2 l9_33=l9_11;
float2 l9_34=l9_33;
int l9_35;
if ((int(renderTarget1HasSwappedViews_tmp)!=0))
{
int l9_36=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_36=0;
}
else
{
l9_36=gl_InstanceIndex%2;
}
int l9_37=l9_36;
l9_35=1-l9_37;
}
else
{
int l9_38=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_38=0;
}
else
{
l9_38=gl_InstanceIndex%2;
}
int l9_39=l9_38;
l9_35=l9_39;
}
int l9_40=l9_35;
float2 l9_41=l9_34;
int l9_42=renderTarget1Layout_tmp;
int l9_43=l9_40;
float2 l9_44=l9_41;
int l9_45=l9_42;
int l9_46=l9_43;
float3 l9_47=float3(0.0);
if (l9_45==0)
{
l9_47=float3(l9_44,0.0);
}
else
{
if (l9_45==1)
{
l9_47=float3(l9_44.x,(l9_44.y*0.5)+(0.5-(float(l9_46)*0.5)),0.0);
}
else
{
l9_47=float3(l9_44,float(l9_46));
}
}
float3 l9_48=l9_47;
float3 l9_49=l9_48;
float4 l9_50=sc_set0.renderTarget1.sample(sc_set0.renderTarget1SmpSC,l9_49.xy,level(0.0));
float4 l9_51=l9_50;
float4 l9_52=l9_51;
float4 l9_53=l9_52;
float4 l9_54=l9_32;
float l9_55=-1.0;
float l9_56=500000.0;
float4 l9_57=l9_54;
float l9_58=l9_55;
float l9_59=l9_56;
float l9_60=0.99998999;
float4 l9_61=l9_57;
#if (1)
{
l9_61=floor((l9_61*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_62=dot(l9_61,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_63=l9_62;
float l9_64=0.0;
float l9_65=l9_60;
float l9_66=l9_58;
float l9_67=l9_59;
float l9_68=l9_66+(((l9_63-l9_64)*(l9_67-l9_66))/(l9_65-l9_64));
float l9_69=l9_68;
float l9_70=l9_69;
gParticle.SpawnIndex=l9_70;
float2 l9_71=l9_53.xy;
float l9_72=0.0;
float l9_73=300.0;
float2 l9_74=l9_71;
float l9_75=l9_72;
float l9_76=l9_73;
float l9_77=0.99998999;
float2 l9_78=l9_74;
#if (1)
{
l9_78=floor((l9_78*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_79=dot(l9_78,float2(1.0,0.0039215689));
float l9_80=l9_79;
float l9_81=0.0;
float l9_82=l9_77;
float l9_83=l9_75;
float l9_84=l9_76;
float l9_85=l9_83+(((l9_80-l9_81)*(l9_84-l9_83))/(l9_82-l9_81));
float l9_86=l9_85;
float l9_87=l9_86;
gParticle.NextBurstTime=l9_87;
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
int l9_88=gl_InstanceIndex;
Globals.gComponentTime=(*sc_set0.UserUniforms).overrideTimeElapsed[l9_88/2001];
Globals.gTimeDelta=fast::min((*sc_set0.UserUniforms).overrideTimeDelta,0.5);
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
int WarmupCount=1;
int l9_89=gl_InstanceIndex;
if ((*sc_set0.UserUniforms).overrideTimeElapsed[l9_89/2001]<=0.0)
{
Globals.gTimeDelta=0.033333302;
Globals.gTimeElapsed-=1.0;
Globals.gTimeElapsedShifted-=1.0;
Globals.gComponentTime=-1.0;
gParticle.NextBurstTime=-1.0;
WarmupCount=30;
}
ssGlobals tempGlobals;
float l9_90;
float l9_91;
float l9_92;
float l9_93;
float l9_94;
float l9_95;
float l9_96;
float l9_97;
float l9_98;
float l9_99;
int i=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (i<WarmupCount)
{
int l9_100=gl_InstanceIndex;
if ((*sc_set0.UserUniforms).vfxEmitParticle[l9_100/2001]!=0)
{
ssGlobals param_1=Globals;
gParticle.SpawnAmount+=fast::max((*sc_set0.UserUniforms).Port_SpawnRate_N013*param_1.gTimeDelta,0.0);
if (param_1.gTimeElapsed>=gParticle.NextBurstTime)
{
gParticle.NextBurstTime+=gParticle.BurstPeriod;
gParticle.SpawnAmount+=gParticle.BurstAmount;
}
gParticle.SpawnIndex+=gParticle.SpawnAmount;
gParticle.SpawnIndex=floor((gParticle.SpawnIndex*2000.0)+0.5)*0.00050000002;
if (gParticle.SpawnIndex>=2000.0)
{
gParticle.SpawnIndexRemainder=mod(gParticle.SpawnIndex,2000.0);
}
}
float l9_101=gParticle.Age;
bool l9_102=l9_101<=9.9999997e-05;
bool l9_103;
if (!l9_102)
{
l9_103=gParticle.Age>=(gParticle.Life-Globals.gTimeDelta);
}
else
{
l9_103=l9_102;
}
bool isSpawnCandidate=l9_103;
bool spawnWindowMin=gParticle.Index1DPerCopyF<=gParticle.SpawnIndex;
bool spawnWindowMax=gParticle.Index1DPerCopyF>=(gParticle.SpawnIndex-gParticle.SpawnAmount);
bool spawnRemainder=gParticle.Index1DPerCopyF<=gParticle.SpawnIndexRemainder;
bool l9_104=isSpawnCandidate;
bool l9_105;
if (l9_104)
{
l9_105=(spawnWindowMin&&spawnWindowMax)||spawnRemainder;
}
else
{
l9_105=l9_104;
}
if (l9_105)
{
ssGlobals param_2=Globals;
float l9_106=0.0;
l9_106=(*sc_set0.UserUniforms).Port_Import_N095;
float3 l9_107=float3(0.0);
l9_107=(*sc_set0.UserUniforms).Port_Import_N028;
float3 l9_108=float3(0.0);
l9_108=(*sc_set0.UserUniforms).Port_Import_N090;
float l9_109=0.0;
l9_109=fast::clamp((*sc_set0.UserUniforms).Port_Import_N093,0.0,1.0);
float l9_110=0.0;
l9_110=1.0;
float l9_111=l9_106;
float3 l9_112=l9_107;
float3 l9_113=l9_108;
float l9_114=l9_109;
float l9_115=l9_110;
ssGlobals l9_116=param_2;
float l9_117=0.0;
l9_117=1.0;
float l9_118=0.0;
l9_118=(*sc_set0.UserUniforms).Port_Import_N046;
float l9_119=0.0;
l9_119=(*sc_set0.UserUniforms).Port_Import_N049;
float l9_120=0.0;
l9_120=fast::max((*sc_set0.UserUniforms).Port_Import_N050,0.0099999998);
float l9_121=l9_117;
float l9_122=l9_118;
float l9_123=l9_119;
float l9_124=l9_120;
ssGlobals l9_125=l9_116;
ssParticle l9_126=gParticle;
int l9_127=int(gParticle.CopyId);
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_96=(*sc_set0.UserUniforms).overrideTimeElapsed[l9_127];
}
else
{
l9_96=(*sc_set0.UserUniforms).sc_Time.x;
}
float l9_128=l9_96;
l9_126.Seed=(l9_126.Ratio1D*0.97637898)+0.151235;
l9_126.Seed+=(floor(((((l9_128-l9_126.SpawnOffset)-0.0)+1.0)+7200.0)/3600.0)*4.32723);
l9_126.Seed=fract(abs(l9_126.Seed));
int2 l9_129=int2(l9_126.Index1D%400,l9_126.Index1D/400);
l9_126.Seed2000=(float2(l9_129)+float2(1.0))/float2(399.0);
gParticle=l9_126;
float l9_130=44.0;
gParticle.Position=(float3(((floor(mod(gParticle.Index1DPerCopyF,floor(l9_130)))/l9_130)*2.0)-1.0,((floor(gParticle.Index1DPerCopyF/floor(l9_130))/l9_130)*2.0)-1.0,0.0)*20.0)+float3(1.0,1.0,0.0);
gParticle.Velocity=float3(0.0);
gParticle.Color=float4(1.0);
gParticle.Age=0.0;
gParticle.Life=16.0;
gParticle.Size=1.0;
gParticle.Mass=1.0;
gParticle.Matrix=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(0.0,0.0,1.0));
gParticle.Quaternion=float4(0.0,0.0,0.0,1.0);
tempGlobals=l9_125;
N51_SizeMode=l9_121!=0.0;
N51_SizeMin=l9_122;
N51_SizeMax=l9_123;
N51_SizeMul=l9_124;
bool l9_131=true;
bool l9_132=true;
bool l9_133=true;
float l9_134=20.0;
float l9_135=0.0;
int l9_136=1;
bool l9_137=l9_133;
bool l9_138=l9_132;
bool l9_139=l9_131;
float l9_140=51.0;
ssParticle l9_141=gParticle;
float l9_142=l9_134;
float l9_143=tempGlobals.gTimeElapsed;
float4 l9_144=float4(0.0);
float4 l9_145=float4(0.0);
if (l9_137)
{
l9_145.x=floor(fract(l9_143)*1000.0);
}
if (l9_139)
{
l9_145.y=float(l9_141.Index1D^((l9_141.Index1D*15299)+l9_141.Index1D));
}
if (l9_138)
{
l9_145.z=l9_140;
}
l9_145.w=l9_142*1000.0;
int l9_146=int(l9_145.x);
int l9_147=int(l9_145.y);
int l9_148=int(l9_145.z);
int l9_149=int(l9_145.w);
int l9_150=(((l9_146*15299)^(l9_147*30133))^(l9_148*17539))^(l9_149*12113);
int l9_151=l9_150;
if (l9_136==1)
{
int l9_152=l9_151;
int l9_153=l9_152;
int l9_154=((l9_153*((l9_153*1471343)+101146501))+1559861749)&2147483647;
int l9_155=l9_154;
float l9_156=float(l9_155)*4.6566129e-10;
float l9_157=l9_156;
l9_144.x=l9_157;
}
else
{
if (l9_136==2)
{
int l9_158=l9_151;
int l9_159=l9_158;
int l9_160=((l9_159*((l9_159*1471343)+101146501))+1559861749)&2147483647;
int l9_161=l9_160;
int l9_162=l9_158*1399;
int l9_163=((l9_162*((l9_162*1471343)+101146501))+1559861749)&2147483647;
int l9_164=l9_163;
int l9_165=l9_161;
float l9_166=float(l9_165)*4.6566129e-10;
int l9_167=l9_164;
float l9_168=float(l9_167)*4.6566129e-10;
float2 l9_169=float2(l9_166,l9_168);
l9_144=float4(l9_169.x,l9_169.y,l9_144.z,l9_144.w);
}
else
{
if (l9_136==3)
{
int l9_170=l9_151;
int l9_171=l9_170;
int l9_172=((l9_171*((l9_171*1471343)+101146501))+1559861749)&2147483647;
int l9_173=l9_172;
int l9_174=l9_170*1399;
int l9_175=((l9_174*((l9_174*1471343)+101146501))+1559861749)&2147483647;
int l9_176=l9_175;
int l9_177=l9_170*7177;
int l9_178=((l9_177*((l9_177*1471343)+101146501))+1559861749)&2147483647;
int l9_179=l9_178;
int l9_180=l9_173;
float l9_181=float(l9_180)*4.6566129e-10;
int l9_182=l9_176;
float l9_183=float(l9_182)*4.6566129e-10;
int l9_184=l9_179;
float l9_185=float(l9_184)*4.6566129e-10;
float3 l9_186=float3(l9_181,l9_183,l9_185);
l9_144=float4(l9_186.x,l9_186.y,l9_186.z,l9_144.w);
}
else
{
int l9_187=l9_151;
int l9_188=l9_187;
int l9_189=((l9_188*((l9_188*1471343)+101146501))+1559861749)&2147483647;
int l9_190=l9_189;
int l9_191=l9_187*1399;
int l9_192=((l9_191*((l9_191*1471343)+101146501))+1559861749)&2147483647;
int l9_193=l9_192;
int l9_194=l9_187*7177;
int l9_195=((l9_194*((l9_194*1471343)+101146501))+1559861749)&2147483647;
int l9_196=l9_195;
int l9_197=l9_187*18919;
int l9_198=((l9_197*((l9_197*1471343)+101146501))+1559861749)&2147483647;
int l9_199=l9_198;
int l9_200=l9_190;
float l9_201=float(l9_200)*4.6566129e-10;
int l9_202=l9_193;
float l9_203=float(l9_202)*4.6566129e-10;
int l9_204=l9_196;
float l9_205=float(l9_204)*4.6566129e-10;
int l9_206=l9_199;
float l9_207=float(l9_206)*4.6566129e-10;
float4 l9_208=float4(l9_201,l9_203,l9_205,l9_207);
l9_144=l9_208;
}
}
}
float4 l9_209=l9_144;
l9_135=l9_209.x;
float l9_210=l9_135;
float l9_211=l9_210;
l9_211=mix(N51_SizeMin*N51_SizeMul,N51_SizeMax*N51_SizeMul,l9_211);
float3 l9_212=(*sc_set0.UserUniforms).vfxLocalAabbMax;
float3 l9_213=(*sc_set0.UserUniforms).vfxLocalAabbMin;
float l9_214=length(l9_212-l9_213);
float l9_215=N51_SizeMode ? (l9_211/l9_214) : l9_211;
gParticle.Size=l9_215;
float l9_216=0.0;
l9_216=(*sc_set0.UserUniforms).Port_Import_N132;
float l9_217=0.0;
l9_217=(*sc_set0.UserUniforms).Port_Import_N133;
float l9_218=0.0;
float l9_219=l9_216;
float l9_220=l9_217;
ssGlobals l9_221=l9_116;
int l9_222=1;
bool l9_223=true;
bool l9_224=true;
bool l9_225=true;
float l9_226=134.0;
ssParticle l9_227=gParticle;
float l9_228=0.0;
float l9_229=l9_221.gTimeElapsed;
float4 l9_230=float4(0.0);
float4 l9_231=float4(0.0);
if (l9_223)
{
l9_231.x=floor(fract(l9_229)*1000.0);
}
if (l9_225)
{
l9_231.y=float(l9_227.Index1D^((l9_227.Index1D*15299)+l9_227.Index1D));
}
if (l9_224)
{
l9_231.z=l9_226;
}
l9_231.w=l9_228*1000.0;
int l9_232=int(l9_231.x);
int l9_233=int(l9_231.y);
int l9_234=int(l9_231.z);
int l9_235=int(l9_231.w);
int l9_236=(((l9_232*15299)^(l9_233*30133))^(l9_234*17539))^(l9_235*12113);
int l9_237=l9_236;
if (l9_222==1)
{
int l9_238=l9_237;
int l9_239=l9_238;
int l9_240=((l9_239*((l9_239*1471343)+101146501))+1559861749)&2147483647;
int l9_241=l9_240;
float l9_242=float(l9_241)*4.6566129e-10;
float l9_243=l9_242;
l9_230.x=l9_243;
}
else
{
if (l9_222==2)
{
int l9_244=l9_237;
int l9_245=l9_244;
int l9_246=((l9_245*((l9_245*1471343)+101146501))+1559861749)&2147483647;
int l9_247=l9_246;
int l9_248=l9_244*1399;
int l9_249=((l9_248*((l9_248*1471343)+101146501))+1559861749)&2147483647;
int l9_250=l9_249;
int l9_251=l9_247;
float l9_252=float(l9_251)*4.6566129e-10;
int l9_253=l9_250;
float l9_254=float(l9_253)*4.6566129e-10;
float2 l9_255=float2(l9_252,l9_254);
l9_230=float4(l9_255.x,l9_255.y,l9_230.z,l9_230.w);
}
else
{
if (l9_222==3)
{
int l9_256=l9_237;
int l9_257=l9_256;
int l9_258=((l9_257*((l9_257*1471343)+101146501))+1559861749)&2147483647;
int l9_259=l9_258;
int l9_260=l9_256*1399;
int l9_261=((l9_260*((l9_260*1471343)+101146501))+1559861749)&2147483647;
int l9_262=l9_261;
int l9_263=l9_256*7177;
int l9_264=((l9_263*((l9_263*1471343)+101146501))+1559861749)&2147483647;
int l9_265=l9_264;
int l9_266=l9_259;
float l9_267=float(l9_266)*4.6566129e-10;
int l9_268=l9_262;
float l9_269=float(l9_268)*4.6566129e-10;
int l9_270=l9_265;
float l9_271=float(l9_270)*4.6566129e-10;
float3 l9_272=float3(l9_267,l9_269,l9_271);
l9_230=float4(l9_272.x,l9_272.y,l9_272.z,l9_230.w);
}
else
{
int l9_273=l9_237;
int l9_274=l9_273;
int l9_275=((l9_274*((l9_274*1471343)+101146501))+1559861749)&2147483647;
int l9_276=l9_275;
int l9_277=l9_273*1399;
int l9_278=((l9_277*((l9_277*1471343)+101146501))+1559861749)&2147483647;
int l9_279=l9_278;
int l9_280=l9_273*7177;
int l9_281=((l9_280*((l9_280*1471343)+101146501))+1559861749)&2147483647;
int l9_282=l9_281;
int l9_283=l9_273*18919;
int l9_284=((l9_283*((l9_283*1471343)+101146501))+1559861749)&2147483647;
int l9_285=l9_284;
int l9_286=l9_276;
float l9_287=float(l9_286)*4.6566129e-10;
int l9_288=l9_279;
float l9_289=float(l9_288)*4.6566129e-10;
int l9_290=l9_282;
float l9_291=float(l9_290)*4.6566129e-10;
int l9_292=l9_285;
float l9_293=float(l9_292)*4.6566129e-10;
float4 l9_294=float4(l9_287,l9_289,l9_291,l9_293);
l9_230=l9_294;
}
}
}
float4 l9_295=l9_230;
float4 l9_296=l9_295;
float l9_297=mix(l9_219,l9_220,l9_296.x);
l9_218=l9_297;
float l9_298=l9_218;
gParticle.Mass=l9_298;
gParticle.Mass=fast::max(9.9999997e-06,gParticle.Mass);
float4 l9_299=float4(0.0);
float4 l9_300=(*sc_set0.UserUniforms).partColor;
l9_299=l9_300;
float4 l9_301=float4(0.0);
l9_301=float4(l9_299.x,l9_299.y,l9_299.z,1.0);
float4 l9_302=float4(0.0);
l9_302=l9_301;
float4 l9_303=float4(0.0);
l9_303=l9_301;
float l9_304=0.0;
float l9_305=(*sc_set0.UserUniforms).Port_Min_N119;
float l9_306=(*sc_set0.UserUniforms).Port_Max_N119;
ssGlobals l9_307=l9_116;
int l9_308=1;
bool l9_309=true;
bool l9_310=true;
bool l9_311=true;
float l9_312=119.0;
ssParticle l9_313=gParticle;
float l9_314=0.0;
float l9_315=l9_307.gTimeElapsed;
float4 l9_316=float4(0.0);
float4 l9_317=float4(0.0);
if (l9_309)
{
l9_317.x=floor(fract(l9_315)*1000.0);
}
if (l9_311)
{
l9_317.y=float(l9_313.Index1D^((l9_313.Index1D*15299)+l9_313.Index1D));
}
if (l9_310)
{
l9_317.z=l9_312;
}
l9_317.w=l9_314*1000.0;
int l9_318=int(l9_317.x);
int l9_319=int(l9_317.y);
int l9_320=int(l9_317.z);
int l9_321=int(l9_317.w);
int l9_322=(((l9_318*15299)^(l9_319*30133))^(l9_320*17539))^(l9_321*12113);
int l9_323=l9_322;
if (l9_308==1)
{
int l9_324=l9_323;
int l9_325=l9_324;
int l9_326=((l9_325*((l9_325*1471343)+101146501))+1559861749)&2147483647;
int l9_327=l9_326;
float l9_328=float(l9_327)*4.6566129e-10;
float l9_329=l9_328;
l9_316.x=l9_329;
}
else
{
if (l9_308==2)
{
int l9_330=l9_323;
int l9_331=l9_330;
int l9_332=((l9_331*((l9_331*1471343)+101146501))+1559861749)&2147483647;
int l9_333=l9_332;
int l9_334=l9_330*1399;
int l9_335=((l9_334*((l9_334*1471343)+101146501))+1559861749)&2147483647;
int l9_336=l9_335;
int l9_337=l9_333;
float l9_338=float(l9_337)*4.6566129e-10;
int l9_339=l9_336;
float l9_340=float(l9_339)*4.6566129e-10;
float2 l9_341=float2(l9_338,l9_340);
l9_316=float4(l9_341.x,l9_341.y,l9_316.z,l9_316.w);
}
else
{
if (l9_308==3)
{
int l9_342=l9_323;
int l9_343=l9_342;
int l9_344=((l9_343*((l9_343*1471343)+101146501))+1559861749)&2147483647;
int l9_345=l9_344;
int l9_346=l9_342*1399;
int l9_347=((l9_346*((l9_346*1471343)+101146501))+1559861749)&2147483647;
int l9_348=l9_347;
int l9_349=l9_342*7177;
int l9_350=((l9_349*((l9_349*1471343)+101146501))+1559861749)&2147483647;
int l9_351=l9_350;
int l9_352=l9_345;
float l9_353=float(l9_352)*4.6566129e-10;
int l9_354=l9_348;
float l9_355=float(l9_354)*4.6566129e-10;
int l9_356=l9_351;
float l9_357=float(l9_356)*4.6566129e-10;
float3 l9_358=float3(l9_353,l9_355,l9_357);
l9_316=float4(l9_358.x,l9_358.y,l9_358.z,l9_316.w);
}
else
{
int l9_359=l9_323;
int l9_360=l9_359;
int l9_361=((l9_360*((l9_360*1471343)+101146501))+1559861749)&2147483647;
int l9_362=l9_361;
int l9_363=l9_359*1399;
int l9_364=((l9_363*((l9_363*1471343)+101146501))+1559861749)&2147483647;
int l9_365=l9_364;
int l9_366=l9_359*7177;
int l9_367=((l9_366*((l9_366*1471343)+101146501))+1559861749)&2147483647;
int l9_368=l9_367;
int l9_369=l9_359*18919;
int l9_370=((l9_369*((l9_369*1471343)+101146501))+1559861749)&2147483647;
int l9_371=l9_370;
int l9_372=l9_362;
float l9_373=float(l9_372)*4.6566129e-10;
int l9_374=l9_365;
float l9_375=float(l9_374)*4.6566129e-10;
int l9_376=l9_368;
float l9_377=float(l9_376)*4.6566129e-10;
int l9_378=l9_371;
float l9_379=float(l9_378)*4.6566129e-10;
float4 l9_380=float4(l9_373,l9_375,l9_377,l9_379);
l9_316=l9_380;
}
}
}
float4 l9_381=l9_316;
float4 l9_382=l9_381;
float l9_383=mix(l9_305,l9_306,l9_382.x);
l9_304=l9_383;
float4 l9_384=float4(0.0);
l9_384=mix(l9_302,l9_303,float4(l9_304));
gParticle.Color=l9_384;
float l9_385=(*sc_set0.UserUniforms).Port_Value_N014;
gParticle.Life=l9_385;
gParticle.Life=fast::clamp(gParticle.Life,0.1,3600.0);
tempGlobals=l9_116;
N32_Radius=l9_111;
N32_Scale=l9_112;
N32_Center=l9_113;
N32_EdgeFill=l9_114;
N32_Axis=int(l9_115);
bool l9_386=true;
bool l9_387=true;
bool l9_388=true;
float l9_389=0.0;
float3 l9_390=float3(0.0);
int l9_391=3;
bool l9_392=l9_388;
bool l9_393=l9_387;
bool l9_394=l9_386;
float l9_395=32.0;
ssParticle l9_396=gParticle;
float l9_397=l9_389;
float l9_398=tempGlobals.gTimeElapsed;
float4 l9_399=float4(0.0);
float4 l9_400=float4(0.0);
if (l9_392)
{
l9_400.x=floor(fract(l9_398)*1000.0);
}
if (l9_394)
{
l9_400.y=float(l9_396.Index1D^((l9_396.Index1D*15299)+l9_396.Index1D));
}
if (l9_393)
{
l9_400.z=l9_395;
}
l9_400.w=l9_397*1000.0;
int l9_401=int(l9_400.x);
int l9_402=int(l9_400.y);
int l9_403=int(l9_400.z);
int l9_404=int(l9_400.w);
int l9_405=(((l9_401*15299)^(l9_402*30133))^(l9_403*17539))^(l9_404*12113);
int l9_406=l9_405;
if (l9_391==1)
{
int l9_407=l9_406;
int l9_408=l9_407;
int l9_409=((l9_408*((l9_408*1471343)+101146501))+1559861749)&2147483647;
int l9_410=l9_409;
float l9_411=float(l9_410)*4.6566129e-10;
float l9_412=l9_411;
l9_399.x=l9_412;
}
else
{
if (l9_391==2)
{
int l9_413=l9_406;
int l9_414=l9_413;
int l9_415=((l9_414*((l9_414*1471343)+101146501))+1559861749)&2147483647;
int l9_416=l9_415;
int l9_417=l9_413*1399;
int l9_418=((l9_417*((l9_417*1471343)+101146501))+1559861749)&2147483647;
int l9_419=l9_418;
int l9_420=l9_416;
float l9_421=float(l9_420)*4.6566129e-10;
int l9_422=l9_419;
float l9_423=float(l9_422)*4.6566129e-10;
float2 l9_424=float2(l9_421,l9_423);
l9_399=float4(l9_424.x,l9_424.y,l9_399.z,l9_399.w);
}
else
{
if (l9_391==3)
{
int l9_425=l9_406;
int l9_426=l9_425;
int l9_427=((l9_426*((l9_426*1471343)+101146501))+1559861749)&2147483647;
int l9_428=l9_427;
int l9_429=l9_425*1399;
int l9_430=((l9_429*((l9_429*1471343)+101146501))+1559861749)&2147483647;
int l9_431=l9_430;
int l9_432=l9_425*7177;
int l9_433=((l9_432*((l9_432*1471343)+101146501))+1559861749)&2147483647;
int l9_434=l9_433;
int l9_435=l9_428;
float l9_436=float(l9_435)*4.6566129e-10;
int l9_437=l9_431;
float l9_438=float(l9_437)*4.6566129e-10;
int l9_439=l9_434;
float l9_440=float(l9_439)*4.6566129e-10;
float3 l9_441=float3(l9_436,l9_438,l9_440);
l9_399=float4(l9_441.x,l9_441.y,l9_441.z,l9_399.w);
}
else
{
int l9_442=l9_406;
int l9_443=l9_442;
int l9_444=((l9_443*((l9_443*1471343)+101146501))+1559861749)&2147483647;
int l9_445=l9_444;
int l9_446=l9_442*1399;
int l9_447=((l9_446*((l9_446*1471343)+101146501))+1559861749)&2147483647;
int l9_448=l9_447;
int l9_449=l9_442*7177;
int l9_450=((l9_449*((l9_449*1471343)+101146501))+1559861749)&2147483647;
int l9_451=l9_450;
int l9_452=l9_442*18919;
int l9_453=((l9_452*((l9_452*1471343)+101146501))+1559861749)&2147483647;
int l9_454=l9_453;
int l9_455=l9_445;
float l9_456=float(l9_455)*4.6566129e-10;
int l9_457=l9_448;
float l9_458=float(l9_457)*4.6566129e-10;
int l9_459=l9_451;
float l9_460=float(l9_459)*4.6566129e-10;
int l9_461=l9_454;
float l9_462=float(l9_461)*4.6566129e-10;
float4 l9_463=float4(l9_456,l9_458,l9_460,l9_462);
l9_399=l9_463;
}
}
}
float4 l9_464=l9_399;
l9_390=l9_464.xyz;
float3 l9_465=l9_390;
float3 l9_466=l9_465;
float2 l9_467=mix(float2(-1.0),float2(1.0),l9_466.xy);
l9_466=float3(l9_467.x,l9_467.y,l9_466.z);
float2 l9_468=normalize(l9_466.xy);
l9_466=float3(l9_468.x,l9_468.y,l9_466.z);
float l9_469=1.0-N32_EdgeFill;
float l9_470=2.0;
if (l9_469<=0.0)
{
l9_97=0.0;
}
else
{
l9_97=pow(l9_469,l9_470);
}
float l9_471=l9_97;
float l9_472=l9_471;
l9_472=mix(l9_472,1.0,l9_466.z);
float l9_473=l9_472;
if (l9_473<=0.0)
{
l9_98=0.0;
}
else
{
l9_98=sqrt(l9_473);
}
float l9_474=l9_98;
l9_472=l9_474;
float2 l9_475=l9_466.xy*(N32_Radius*l9_472);
l9_466=float3(l9_475.x,l9_475.y,l9_466.z);
if (N32_Axis==0)
{
l9_466=float3(l9_466.xy,0.0);
}
else
{
if (N32_Axis==1)
{
l9_466=float3(l9_466.y,0.0,l9_466.x);
}
else
{
l9_466=float3(0.0,l9_466.yx);
}
}
l9_466+=N32_Center;
l9_466*=N32_Scale;
float3 l9_476=l9_466;
gParticle.Position=l9_476;
gParticle.Velocity+=((gParticle.Force/float3(gParticle.Mass))*0.033330001);
gParticle.Force=float3(0.0);
gParticle.Spawned=true;
}
if (gParticle.SpawnIndexRemainder>(-1.0))
{
gParticle.SpawnIndex=gParticle.SpawnIndexRemainder;
}
if (gParticle.Index1D==gParticle.StateID)
{
gParticle.Dead=false;
}
if (gParticle.Dead)
{
float4 param_3=float4(4334.0,4334.0,4334.0,0.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_3.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_477=param_3;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_478=dot(l9_477,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_479=l9_478;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_479;
}
}
float4 l9_480=float4(param_3.x,-param_3.y,(param_3.z*0.5)+(param_3.w*0.5),param_3.w);
out.gl_Position=l9_480;
}
float Value_N267=0.0;
Value_N267=(*sc_set0.UserUniforms).Port_Import_N267;
float Value_N268=0.0;
Value_N268=(*sc_set0.UserUniforms).Port_Import_N268;
float Value_N269=0.0;
Value_N269=(*sc_set0.UserUniforms).Port_Import_N269;
float param_4=Value_N267;
float param_5=Value_N268;
float param_6=Value_N269;
ssGlobals param_7=Globals;
float l9_482=0.0;
l9_482=(*sc_set0.UserUniforms).Port_Import_N004;
float l9_483=0.0;
l9_483=(*sc_set0.UserUniforms).Port_Import_N017;
float l9_484=0.0;
l9_484=(*sc_set0.UserUniforms).Port_Import_N185;
float l9_485=0.0;
l9_485=(*sc_set0.UserUniforms).Port_Import_N188;
float l9_486=l9_482;
float l9_487=l9_483;
float l9_488=l9_484;
float l9_489=l9_485;
ssGlobals l9_490=param_7;
tempGlobals=l9_490;
N73_AlphaMin=l9_486;
N73_AlphaMax=l9_487;
N73_FadeInTime=l9_488;
N73_FadeOutTime=l9_489;
float l9_491=fast::clamp(gParticle.Age/gParticle.Life,0.0,1.0);
float l9_492=l9_491;
float l9_493=gParticle.Life;
float l9_494=l9_493;
float4 l9_495=gParticle.Color;
float4 l9_496=l9_495;
float l9_497=l9_492;
float l9_498=N73_FadeInTime/l9_494;
float l9_499=N73_FadeOutTime/l9_494;
float l9_500=fast::clamp(l9_497/l9_498,0.0,1.0);
float l9_501=fast::clamp((1.0-l9_497)/l9_499,0.0,1.0);
float l9_502=l9_500*l9_501;
float l9_503=l9_502;
l9_496.w=mix(N73_AlphaMin,N73_AlphaMax,l9_503);
float4 l9_504=l9_496;
gParticle.Color=l9_504;
tempGlobals=param_7;
N9_DragCoefficient=param_4;
N9_Density=param_5;
N9_Area=param_6;
float3 l9_505=gParticle.Velocity;
float3 l9_506=l9_505;
float l9_507=gParticle.Mass;
float l9_508=l9_507;
float3 l9_509=(((((-l9_506)*length(l9_506))*N9_DragCoefficient)*N9_Density)*N9_Area)*0.5;
float l9_510=tempGlobals.gTimeDelta;
float3 l9_511=abs(l9_506*l9_508)/float3(l9_510);
l9_509=fast::clamp(l9_509,-l9_511,l9_511);
float3 l9_512=gParticle.Force;
float3 l9_513=l9_512+l9_509;
float3 l9_514=l9_513;
gParticle.Force=l9_514;
float Random_N33=0.0;
float param_8=(*sc_set0.UserUniforms).Port_Min_N033;
float param_9=(*sc_set0.UserUniforms).Port_Max_N033;
ssGlobals param_11=Globals;
int l9_515=1;
bool l9_516=false;
bool l9_517=true;
bool l9_518=true;
float l9_519=33.0;
ssParticle l9_520=gParticle;
float l9_521=0.0;
float l9_522=param_11.gTimeElapsed;
float4 l9_523=float4(0.0);
float4 l9_524=float4(0.0);
if (l9_516)
{
l9_524.x=floor(fract(l9_522)*1000.0);
}
if (l9_518)
{
l9_524.y=float(l9_520.Index1D^((l9_520.Index1D*15299)+l9_520.Index1D));
}
if (l9_517)
{
l9_524.z=l9_519;
}
l9_524.w=l9_521*1000.0;
int l9_525=int(l9_524.x);
int l9_526=int(l9_524.y);
int l9_527=int(l9_524.z);
int l9_528=int(l9_524.w);
int l9_529=(((l9_525*15299)^(l9_526*30133))^(l9_527*17539))^(l9_528*12113);
int l9_530=l9_529;
if (l9_515==1)
{
int l9_531=l9_530;
int l9_532=l9_531;
int l9_533=((l9_532*((l9_532*1471343)+101146501))+1559861749)&2147483647;
int l9_534=l9_533;
float l9_535=float(l9_534)*4.6566129e-10;
float l9_536=l9_535;
l9_523.x=l9_536;
}
else
{
if (l9_515==2)
{
int l9_537=l9_530;
int l9_538=l9_537;
int l9_539=((l9_538*((l9_538*1471343)+101146501))+1559861749)&2147483647;
int l9_540=l9_539;
int l9_541=l9_537*1399;
int l9_542=((l9_541*((l9_541*1471343)+101146501))+1559861749)&2147483647;
int l9_543=l9_542;
int l9_544=l9_540;
float l9_545=float(l9_544)*4.6566129e-10;
int l9_546=l9_543;
float l9_547=float(l9_546)*4.6566129e-10;
float2 l9_548=float2(l9_545,l9_547);
l9_523=float4(l9_548.x,l9_548.y,l9_523.z,l9_523.w);
}
else
{
if (l9_515==3)
{
int l9_549=l9_530;
int l9_550=l9_549;
int l9_551=((l9_550*((l9_550*1471343)+101146501))+1559861749)&2147483647;
int l9_552=l9_551;
int l9_553=l9_549*1399;
int l9_554=((l9_553*((l9_553*1471343)+101146501))+1559861749)&2147483647;
int l9_555=l9_554;
int l9_556=l9_549*7177;
int l9_557=((l9_556*((l9_556*1471343)+101146501))+1559861749)&2147483647;
int l9_558=l9_557;
int l9_559=l9_552;
float l9_560=float(l9_559)*4.6566129e-10;
int l9_561=l9_555;
float l9_562=float(l9_561)*4.6566129e-10;
int l9_563=l9_558;
float l9_564=float(l9_563)*4.6566129e-10;
float3 l9_565=float3(l9_560,l9_562,l9_564);
l9_523=float4(l9_565.x,l9_565.y,l9_565.z,l9_523.w);
}
else
{
int l9_566=l9_530;
int l9_567=l9_566;
int l9_568=((l9_567*((l9_567*1471343)+101146501))+1559861749)&2147483647;
int l9_569=l9_568;
int l9_570=l9_566*1399;
int l9_571=((l9_570*((l9_570*1471343)+101146501))+1559861749)&2147483647;
int l9_572=l9_571;
int l9_573=l9_566*7177;
int l9_574=((l9_573*((l9_573*1471343)+101146501))+1559861749)&2147483647;
int l9_575=l9_574;
int l9_576=l9_566*18919;
int l9_577=((l9_576*((l9_576*1471343)+101146501))+1559861749)&2147483647;
int l9_578=l9_577;
int l9_579=l9_569;
float l9_580=float(l9_579)*4.6566129e-10;
int l9_581=l9_572;
float l9_582=float(l9_581)*4.6566129e-10;
int l9_583=l9_575;
float l9_584=float(l9_583)*4.6566129e-10;
int l9_585=l9_578;
float l9_586=float(l9_585)*4.6566129e-10;
float4 l9_587=float4(l9_580,l9_582,l9_584,l9_586);
l9_523=l9_587;
}
}
}
float4 l9_588=l9_523;
float4 l9_589=l9_588;
float param_10=mix(param_8,param_9,l9_589.x);
Random_N33=param_10;
float3 Value_N172=float3(0.0);
Value_N172=float3(Random_N33);
float3x3 Matrix_N173=float3x3(float3(0.0),float3(0.0),float3(0.0));
float3 param_12=Value_N172;
float l9_590=cos(radians(param_12.x));
float l9_591=sin(radians(param_12.x));
float l9_592=cos(radians(param_12.y));
float l9_593=sin(radians(param_12.y));
float l9_594=cos(radians(param_12.z));
float l9_595=sin(radians(param_12.z));
float3x3 param_13=float3x3(float3(l9_592*l9_594,(l9_590*l9_595)+((l9_591*l9_593)*l9_594),(l9_591*l9_595)-((l9_590*l9_593)*l9_594)),float3((-l9_592)*l9_595,(l9_590*l9_594)-((l9_591*l9_593)*l9_595),(l9_591*l9_594)+((l9_590*l9_593)*l9_595)),float3(l9_593,(-l9_591)*l9_592,l9_590*l9_592));
Matrix_N173=param_13;
gParticle.Matrix=Matrix_N173;
float Value_N308=0.0;
Value_N308=(*sc_set0.UserUniforms).Port_Import_N308;
float3 Value_N309=float3(0.0);
Value_N309=(*sc_set0.UserUniforms).Port_Import_N309;
float3 Value_N310=float3(0.0);
Value_N310=gParticle.Position;
float3 Output_N311=float3(0.0);
Output_N311=Value_N309-Value_N310;
float3 Output_N312=float3(0.0);
float3 param_14=Output_N311;
float l9_596=dot(param_14,param_14);
if (l9_596>0.0)
{
l9_99=1.0/sqrt(l9_596);
}
else
{
l9_99=0.0;
}
float l9_597=l9_99;
float3 param_15=param_14*l9_597;
Output_N312=param_15;
float3 Output_N313=float3(0.0);
Output_N313=float3(Value_N308)*Output_N312;
gParticle.Force+=Output_N313;
float3x3 param_16=gParticle.Matrix;
gParticle.Quaternion=matrixToQuaternion(param_16);
float Drift=0.0049999999;
gParticle.Age+=Globals.gTimeDelta;
if (gParticle.Age>=gParticle.Life)
{
gParticle.Dead=true;
}
if (gParticle.Index1D==gParticle.StateID)
{
gParticle.Dead=false;
}
if (gParticle.Dead)
{
float4 param_17=float4(4334.0,4334.0,4334.0,0.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_17.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_598=param_17;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_599=dot(l9_598,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_600=l9_599;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_600;
}
}
float4 l9_601=float4(param_17.x,-param_17.y,(param_17.z*0.5)+(param_17.w*0.5),param_17.w);
out.gl_Position=l9_601;
}
if (abs(gParticle.Force.x)<Drift)
{
l9_90=0.0;
}
else
{
l9_90=gParticle.Force.x;
}
gParticle.Force.x=l9_90;
if (abs(gParticle.Force.y)<Drift)
{
l9_91=0.0;
}
else
{
l9_91=gParticle.Force.y;
}
gParticle.Force.y=l9_91;
if (abs(gParticle.Force.z)<Drift)
{
l9_92=0.0;
}
else
{
l9_92=gParticle.Force.z;
}
gParticle.Force.z=l9_92;
gParticle.Mass=fast::max(Drift,gParticle.Mass);
if (Globals.gTimeDelta!=0.0)
{
gParticle.Velocity+=((gParticle.Force/float3(gParticle.Mass))*Globals.gTimeDelta);
}
if (abs(gParticle.Velocity.x)<Drift)
{
l9_93=0.0;
}
else
{
l9_93=gParticle.Velocity.x;
}
gParticle.Velocity.x=l9_93;
if (abs(gParticle.Velocity.y)<Drift)
{
l9_94=0.0;
}
else
{
l9_94=gParticle.Velocity.y;
}
gParticle.Velocity.y=l9_94;
if (abs(gParticle.Velocity.z)<Drift)
{
l9_95=0.0;
}
else
{
l9_95=gParticle.Velocity.z;
}
gParticle.Velocity.z=l9_95;
gParticle.Position+=(gParticle.Velocity*Globals.gTimeDelta);
int l9_602=gl_InstanceIndex;
if ((*sc_set0.UserUniforms).overrideTimeElapsed[l9_602/2001]<=0.0)
{
Globals.gTimeElapsed+=Globals.gTimeDelta;
Globals.gTimeElapsedShifted+=Globals.gTimeDelta;
Globals.gComponentTime+=Globals.gTimeDelta;
gParticle.Spawned=false;
gParticle.Dead=false;
gParticle.SpawnAmount=0.0;
gParticle.SpawnIndexRemainder=-1.0;
gParticle.Force=float3(0.0);
gParticle.BurstAmount=0.0;
gParticle.BurstPeriod=0.0;
}
i++;
continue;
}
else
{
break;
}
}
float2 QuadSize=float2(3.0,1.0)/float2(2048.0,(*sc_set0.UserUniforms).vfxTargetSizeWrite.y);
float2 Offset=float2(0.0);
int offsetID=(*sc_set0.UserUniforms).vfxOffsetInstancesWrite+ssInstanceID;
int particleRow=682;
Offset.x=float(offsetID%particleRow);
Offset.y=float(offsetID/particleRow);
Offset*=QuadSize;
float2 Vertex=float2(0.0);
float l9_603;
if (v.texture0.x<0.5)
{
l9_603=0.0;
}
else
{
l9_603=QuadSize.x;
}
Vertex.x=l9_603;
float l9_604;
if (v.texture0.y<0.5)
{
l9_604=0.0;
}
else
{
l9_604=QuadSize.y;
}
Vertex.y=l9_604;
Vertex+=Offset;
float4 param_18=float4((Vertex*2.0)-float2(1.0),1.0,1.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_18.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_605=param_18;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_606=dot(l9_605,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_607=l9_606;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_607;
}
}
float4 l9_608=float4(param_18.x,-param_18.y,(param_18.z*0.5)+(param_18.w*0.5),param_18.w);
out.gl_Position=l9_608;
out.Interp_Particle_Index=ssInstanceID;
out.Interp_Particle_Coord=v.texture0;
out.Interp_Particle_Force=gParticle.Force;
out.Interp_Particle_SpawnIndex=gParticle.SpawnIndex;
out.Interp_Particle_NextBurstTime=gParticle.NextBurstTime;
out.Interp_Particle_Position=gParticle.Position;
out.Interp_Particle_Velocity=gParticle.Velocity;
out.Interp_Particle_Life=gParticle.Life;
out.Interp_Particle_Age=gParticle.Age;
out.Interp_Particle_Size=gParticle.Size;
out.Interp_Particle_Color=gParticle.Color;
out.Interp_Particle_Quaternion=gParticle.Quaternion;
out.Interp_Particle_Mass=gParticle.Mass;
if (gParticle.Index1D==gParticle.StateID)
{
gParticle.Dead=false;
}
if (gParticle.Dead)
{
float4 param_19=float4(4334.0,4334.0,4334.0,0.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_19.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_609=param_19;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_610=dot(l9_609,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_611=l9_610;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_611;
}
}
float4 l9_612=float4(param_19.x,-param_19.y,(param_19.z*0.5)+(param_19.w*0.5),param_19.w);
out.gl_Position=l9_612;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
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
int vfxNumCopies;
int vfxBatchEnable[32];
int vfxEmitParticle[32];
float4x4 vfxModelMatrix[32];
float4 renderTarget0Size;
float4 renderTarget0Dims;
float4 renderTarget0View;
float4 renderTarget1Size;
float4 renderTarget1Dims;
float4 renderTarget1View;
float4 renderTarget2Size;
float4 renderTarget2Dims;
float4 renderTarget2View;
float4 renderTarget3Size;
float4 renderTarget3Dims;
float4 renderTarget3View;
float4 sortRenderTarget0Size;
float4 sortRenderTarget0Dims;
float4 sortRenderTarget0View;
float4 sortRenderTarget1Size;
float4 sortRenderTarget1Dims;
float4 sortRenderTarget1View;
float3 vfxLocalAabbMin;
float3 vfxLocalAabbMax;
float vfxCameraAspect;
float vfxCameraNear;
float vfxCameraFar;
float4x4 vfxProjectionMatrix;
float4x4 vfxProjectionMatrixInverse;
float4x4 vfxViewMatrix;
float4x4 vfxViewMatrixInverse;
float4x4 vfxViewProjectionMatrix;
float4x4 vfxViewProjectionMatrixInverse;
float3 vfxCameraPosition;
float3 vfxCameraUp;
float3 vfxCameraForward;
float3 vfxCameraRight;
int vfxFrame;
int vfxOffsetInstancesRead;
int vfxOffsetInstancesWrite;
float2 vfxTargetSizeRead;
float2 vfxTargetSizeWrite;
int vfxTargetWidth;
float2 ssSORT_RENDER_TARGET_SIZE;
float4 partColor;
float Intensity;
float Tweak_N36;
float Port_SpawnRate_N013;
float Port_Import_N046;
float Port_Import_N049;
float Port_Import_N050;
float Port_Import_N132;
float Port_Import_N133;
float4 Port_Import_N117;
float4 Port_Import_N118;
float Port_Min_N119;
float Port_Max_N119;
float Port_Value_N014;
float Port_Import_N095;
float3 Port_Import_N028;
float3 Port_Import_N090;
float Port_Import_N093;
float Port_Import_N004;
float Port_Import_N017;
float Port_Import_N185;
float Port_Import_N188;
float Port_Import_N267;
float Port_Import_N268;
float Port_Import_N269;
float Port_Min_N033;
float Port_Max_N033;
float3 Port_Import_N172;
float Port_Import_N308;
float3 Port_Import_N309;
float Port_Enabled_N000;
};
struct ssParticle
{
float3 Position;
float3 Velocity;
float4 Color;
float Size;
float Age;
float Life;
float Mass;
float3x3 Matrix;
bool Dead;
float4 Quaternion;
float SpawnIndex;
float SpawnIndexRemainder;
float NextBurstTime;
float SpawnOffset;
float Seed;
float2 Seed2000;
float TimeShift;
int Index1D;
int Index1DPerCopy;
float Index1DPerCopyF;
int StateID;
float Coord1D;
float Ratio1D;
float Ratio1DPerCopy;
int2 Index2D;
float2 Coord2D;
float2 Ratio2D;
float3 Force;
bool Spawned;
float CopyId;
float SpawnAmount;
float BurstAmount;
float BurstPeriod;
};
struct sc_Set0
{
texture2d<float> renderTarget0 [[id(1)]];
texture2d<float> renderTarget1 [[id(2)]];
texture2d<float> renderTarget2 [[id(3)]];
texture2d<float> renderTarget3 [[id(4)]];
sampler renderTarget0SmpSC [[id(22)]];
sampler renderTarget1SmpSC [[id(23)]];
sampler renderTarget2SmpSC [[id(24)]];
sampler renderTarget3SmpSC [[id(25)]];
constant userUniformsObj* UserUniforms [[id(35)]];
};
struct main_frag_out
{
float4 sc_FragData0 [[color(0)]];
float4 sc_FragData1 [[color(1)]];
float4 sc_FragData2 [[color(2)]];
float4 sc_FragData3 [[color(3)]];
};
struct main_frag_in
{
float4 varPosAndMotion [[user(locn0)]];
float4 varNormalAndMotion [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varTex01 [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float2 varShadowTex [[user(locn6)]];
int varStereoViewID [[user(locn7)]];
float varClipDistance [[user(locn8)]];
float4 varColor [[user(locn9)]];
int Interp_Particle_Index [[user(locn10)]];
float3 Interp_Particle_Force [[user(locn11)]];
float2 Interp_Particle_Coord [[user(locn12)]];
float Interp_Particle_SpawnIndex [[user(locn13)]];
float Interp_Particle_NextBurstTime [[user(locn14)]];
float3 Interp_Particle_Position [[user(locn15)]];
float3 Interp_Particle_Velocity [[user(locn16)]];
float Interp_Particle_Life [[user(locn17)]];
float Interp_Particle_Age [[user(locn18)]];
float Interp_Particle_Size [[user(locn19)]];
float4 Interp_Particle_Color [[user(locn20)]];
float4 Interp_Particle_Quaternion [[user(locn21)]];
float Interp_Particle_Mass [[user(locn22)]];
};
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]])
{
main_frag_out out={};
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
float4 Data0=float4(0.0);
float4 Data1=float4(0.0);
float4 Data2=float4(0.0);
float4 Data3=float4(0.0);
ssParticle gParticle;
gParticle.Position=in.Interp_Particle_Position;
gParticle.Velocity=in.Interp_Particle_Velocity;
gParticle.Life=in.Interp_Particle_Life;
gParticle.Age=in.Interp_Particle_Age;
gParticle.Size=in.Interp_Particle_Size;
gParticle.Color=in.Interp_Particle_Color;
gParticle.Quaternion=in.Interp_Particle_Quaternion;
gParticle.Mass=in.Interp_Particle_Mass;
gParticle.SpawnIndex=in.Interp_Particle_SpawnIndex;
gParticle.NextBurstTime=in.Interp_Particle_NextBurstTime;
float2 param=in.Interp_Particle_Coord;
int l9_0=int(floor(param.x*3.0));
float4 l9_1=float4(0.0);
float l9_2=0.0;
float l9_3=0.0;
float l9_4=0.0;
float l9_5=0.0;
float l9_6=0.0;
float l9_7=0.0;
float l9_8=0.0;
float l9_9=0.0;
float l9_10=0.0;
float l9_11=0.0;
float l9_12=0.0;
float l9_13=0.0;
float l9_14=0.0;
float l9_15=0.0;
float l9_16=0.0;
float l9_17=0.0;
if (l9_0==0)
{
float l9_18=gParticle.Position.x;
float l9_19=-1000.0;
float l9_20=1000.0;
float l9_21=l9_18;
float l9_22=l9_19;
float l9_23=l9_20;
float l9_24=0.99998999;
float l9_25=fast::clamp(l9_21,l9_22,l9_23);
float l9_26=l9_22;
float l9_27=l9_23;
float l9_28=0.0;
float l9_29=l9_24;
float l9_30=l9_28+(((l9_25-l9_26)*(l9_29-l9_28))/(l9_27-l9_26));
float l9_31=l9_30;
float4 l9_32=float4(1.0,255.0,65025.0,16581375.0)*l9_31;
l9_32=fract(l9_32);
l9_32-=(l9_32.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_33=l9_32;
float4 l9_34=l9_33;
float4 l9_35=l9_34;
l9_1=l9_35;
l9_2=l9_1.x;
l9_3=l9_1.y;
l9_4=l9_1.z;
l9_5=l9_1.w;
float l9_36=gParticle.Position.y;
float l9_37=-1000.0;
float l9_38=1000.0;
float l9_39=l9_36;
float l9_40=l9_37;
float l9_41=l9_38;
float l9_42=0.99998999;
float l9_43=fast::clamp(l9_39,l9_40,l9_41);
float l9_44=l9_40;
float l9_45=l9_41;
float l9_46=0.0;
float l9_47=l9_42;
float l9_48=l9_46+(((l9_43-l9_44)*(l9_47-l9_46))/(l9_45-l9_44));
float l9_49=l9_48;
float4 l9_50=float4(1.0,255.0,65025.0,16581375.0)*l9_49;
l9_50=fract(l9_50);
l9_50-=(l9_50.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_51=l9_50;
float4 l9_52=l9_51;
float4 l9_53=l9_52;
l9_1=l9_53;
l9_6=l9_1.x;
l9_7=l9_1.y;
l9_8=l9_1.z;
l9_9=l9_1.w;
float l9_54=gParticle.Position.z;
float l9_55=-1000.0;
float l9_56=1000.0;
float l9_57=l9_54;
float l9_58=l9_55;
float l9_59=l9_56;
float l9_60=0.99998999;
float l9_61=fast::clamp(l9_57,l9_58,l9_59);
float l9_62=l9_58;
float l9_63=l9_59;
float l9_64=0.0;
float l9_65=l9_60;
float l9_66=l9_64+(((l9_61-l9_62)*(l9_65-l9_64))/(l9_63-l9_62));
float l9_67=l9_66;
float4 l9_68=float4(1.0,255.0,65025.0,16581375.0)*l9_67;
l9_68=fract(l9_68);
l9_68-=(l9_68.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_69=l9_68;
float4 l9_70=l9_69;
float4 l9_71=l9_70;
l9_1=l9_71;
l9_10=l9_1.x;
l9_11=l9_1.y;
l9_12=l9_1.z;
l9_13=l9_1.w;
float l9_72=gParticle.Velocity.x;
float l9_73=-1000.0;
float l9_74=1000.0;
float l9_75=l9_72;
float l9_76=l9_73;
float l9_77=l9_74;
float l9_78=0.99998999;
float l9_79=fast::clamp(l9_75,l9_76,l9_77);
float l9_80=l9_76;
float l9_81=l9_77;
float l9_82=0.0;
float l9_83=l9_78;
float l9_84=l9_82+(((l9_79-l9_80)*(l9_83-l9_82))/(l9_81-l9_80));
float l9_85=l9_84;
float4 l9_86=float4(1.0,255.0,65025.0,16581375.0)*l9_85;
l9_86=fract(l9_86);
l9_86-=(l9_86.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_87=l9_86;
float4 l9_88=l9_87;
float4 l9_89=l9_88;
l9_1=l9_89;
l9_14=l9_1.x;
l9_15=l9_1.y;
l9_16=l9_1.z;
l9_17=l9_1.w;
}
else
{
if (l9_0==1)
{
float l9_90=gParticle.Velocity.y;
float l9_91=-1000.0;
float l9_92=1000.0;
float l9_93=l9_90;
float l9_94=l9_91;
float l9_95=l9_92;
float l9_96=0.99998999;
float l9_97=fast::clamp(l9_93,l9_94,l9_95);
float l9_98=l9_94;
float l9_99=l9_95;
float l9_100=0.0;
float l9_101=l9_96;
float l9_102=l9_100+(((l9_97-l9_98)*(l9_101-l9_100))/(l9_99-l9_98));
float l9_103=l9_102;
float4 l9_104=float4(1.0,255.0,65025.0,16581375.0)*l9_103;
l9_104=fract(l9_104);
l9_104-=(l9_104.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_105=l9_104;
float4 l9_106=l9_105;
float4 l9_107=l9_106;
l9_1=l9_107;
l9_2=l9_1.x;
l9_3=l9_1.y;
l9_4=l9_1.z;
l9_5=l9_1.w;
float l9_108=gParticle.Velocity.z;
float l9_109=-1000.0;
float l9_110=1000.0;
float l9_111=l9_108;
float l9_112=l9_109;
float l9_113=l9_110;
float l9_114=0.99998999;
float l9_115=fast::clamp(l9_111,l9_112,l9_113);
float l9_116=l9_112;
float l9_117=l9_113;
float l9_118=0.0;
float l9_119=l9_114;
float l9_120=l9_118+(((l9_115-l9_116)*(l9_119-l9_118))/(l9_117-l9_116));
float l9_121=l9_120;
float4 l9_122=float4(1.0,255.0,65025.0,16581375.0)*l9_121;
l9_122=fract(l9_122);
l9_122-=(l9_122.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_123=l9_122;
float4 l9_124=l9_123;
float4 l9_125=l9_124;
l9_1=l9_125;
l9_6=l9_1.x;
l9_7=l9_1.y;
l9_8=l9_1.z;
l9_9=l9_1.w;
float l9_126=gParticle.Life;
float l9_127=0.0;
float l9_128=3600.0;
float l9_129=l9_126;
float l9_130=l9_127;
float l9_131=l9_128;
float l9_132=0.99998999;
float l9_133=fast::clamp(l9_129,l9_130,l9_131);
float l9_134=l9_130;
float l9_135=l9_131;
float l9_136=0.0;
float l9_137=l9_132;
float l9_138=l9_136+(((l9_133-l9_134)*(l9_137-l9_136))/(l9_135-l9_134));
float l9_139=l9_138;
float4 l9_140=float4(1.0,255.0,65025.0,16581375.0)*l9_139;
l9_140=fract(l9_140);
l9_140-=(l9_140.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_141=l9_140;
float4 l9_142=l9_141;
float4 l9_143=l9_142;
l9_1=l9_143;
l9_10=l9_1.x;
l9_11=l9_1.y;
l9_12=l9_1.z;
l9_13=l9_1.w;
float l9_144=gParticle.Age;
float l9_145=0.0;
float l9_146=3600.0;
float l9_147=l9_144;
float l9_148=l9_145;
float l9_149=l9_146;
float l9_150=0.99998999;
float l9_151=fast::clamp(l9_147,l9_148,l9_149);
float l9_152=l9_148;
float l9_153=l9_149;
float l9_154=0.0;
float l9_155=l9_150;
float l9_156=l9_154+(((l9_151-l9_152)*(l9_155-l9_154))/(l9_153-l9_152));
float l9_157=l9_156;
float4 l9_158=float4(1.0,255.0,65025.0,16581375.0)*l9_157;
l9_158=fract(l9_158);
l9_158-=(l9_158.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_159=l9_158;
float4 l9_160=l9_159;
float4 l9_161=l9_160;
l9_1=l9_161;
l9_14=l9_1.x;
l9_15=l9_1.y;
l9_16=l9_1.z;
l9_17=l9_1.w;
}
else
{
if (l9_0==2)
{
float l9_162=gParticle.Size;
float l9_163=0.0;
float l9_164=100.0;
float l9_165=l9_162;
float l9_166=l9_163;
float l9_167=l9_164;
float l9_168=0.99998999;
float l9_169=fast::clamp(l9_165,l9_166,l9_167);
float l9_170=l9_166;
float l9_171=l9_167;
float l9_172=0.0;
float l9_173=l9_168;
float l9_174=l9_172+(((l9_169-l9_170)*(l9_173-l9_172))/(l9_171-l9_170));
float l9_175=l9_174;
float4 l9_176=float4(1.0,255.0,65025.0,16581375.0)*l9_175;
l9_176=fract(l9_176);
l9_176-=(l9_176.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float2 l9_177=l9_176.xy;
float2 l9_178=l9_177;
float2 l9_179=l9_178;
l9_1=float4(l9_179.x,l9_179.y,l9_1.z,l9_1.w);
l9_2=l9_1.x;
l9_3=l9_1.y;
float l9_180=gParticle.Quaternion.x;
float l9_181=-1.0;
float l9_182=1.0;
float l9_183=l9_180;
float l9_184=l9_181;
float l9_185=l9_182;
float l9_186=0.99998999;
float l9_187=fast::clamp(l9_183,l9_184,l9_185);
float l9_188=l9_184;
float l9_189=l9_185;
float l9_190=0.0;
float l9_191=l9_186;
float l9_192=l9_190+(((l9_187-l9_188)*(l9_191-l9_190))/(l9_189-l9_188));
float l9_193=l9_192;
float4 l9_194=float4(1.0,255.0,65025.0,16581375.0)*l9_193;
l9_194=fract(l9_194);
l9_194-=(l9_194.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float2 l9_195=l9_194.xy;
float2 l9_196=l9_195;
float2 l9_197=l9_196;
l9_1=float4(l9_197.x,l9_197.y,l9_1.z,l9_1.w);
l9_4=l9_1.x;
l9_5=l9_1.y;
float l9_198=gParticle.Quaternion.y;
float l9_199=-1.0;
float l9_200=1.0;
float l9_201=l9_198;
float l9_202=l9_199;
float l9_203=l9_200;
float l9_204=0.99998999;
float l9_205=fast::clamp(l9_201,l9_202,l9_203);
float l9_206=l9_202;
float l9_207=l9_203;
float l9_208=0.0;
float l9_209=l9_204;
float l9_210=l9_208+(((l9_205-l9_206)*(l9_209-l9_208))/(l9_207-l9_206));
float l9_211=l9_210;
float4 l9_212=float4(1.0,255.0,65025.0,16581375.0)*l9_211;
l9_212=fract(l9_212);
l9_212-=(l9_212.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float2 l9_213=l9_212.xy;
float2 l9_214=l9_213;
float2 l9_215=l9_214;
l9_1=float4(l9_215.x,l9_215.y,l9_1.z,l9_1.w);
l9_6=l9_1.x;
l9_7=l9_1.y;
float l9_216=gParticle.Quaternion.z;
float l9_217=-1.0;
float l9_218=1.0;
float l9_219=l9_216;
float l9_220=l9_217;
float l9_221=l9_218;
float l9_222=0.99998999;
float l9_223=fast::clamp(l9_219,l9_220,l9_221);
float l9_224=l9_220;
float l9_225=l9_221;
float l9_226=0.0;
float l9_227=l9_222;
float l9_228=l9_226+(((l9_223-l9_224)*(l9_227-l9_226))/(l9_225-l9_224));
float l9_229=l9_228;
float4 l9_230=float4(1.0,255.0,65025.0,16581375.0)*l9_229;
l9_230=fract(l9_230);
l9_230-=(l9_230.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float2 l9_231=l9_230.xy;
float2 l9_232=l9_231;
float2 l9_233=l9_232;
l9_1=float4(l9_233.x,l9_233.y,l9_1.z,l9_1.w);
l9_8=l9_1.x;
l9_9=l9_1.y;
float l9_234=gParticle.Quaternion.w;
float l9_235=-1.0;
float l9_236=1.0;
float l9_237=l9_234;
float l9_238=l9_235;
float l9_239=l9_236;
float l9_240=0.99998999;
float l9_241=fast::clamp(l9_237,l9_238,l9_239);
float l9_242=l9_238;
float l9_243=l9_239;
float l9_244=0.0;
float l9_245=l9_240;
float l9_246=l9_244+(((l9_241-l9_242)*(l9_245-l9_244))/(l9_243-l9_242));
float l9_247=l9_246;
float4 l9_248=float4(1.0,255.0,65025.0,16581375.0)*l9_247;
l9_248=fract(l9_248);
l9_248-=(l9_248.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float2 l9_249=l9_248.xy;
float2 l9_250=l9_249;
float2 l9_251=l9_250;
l9_1=float4(l9_251.x,l9_251.y,l9_1.z,l9_1.w);
l9_10=l9_1.x;
l9_11=l9_1.y;
float l9_252=gParticle.Mass;
float l9_253=0.0;
float l9_254=100.0;
float l9_255=l9_252;
float l9_256=l9_253;
float l9_257=l9_254;
float l9_258=0.99998999;
float l9_259=fast::clamp(l9_255,l9_256,l9_257);
float l9_260=l9_256;
float l9_261=l9_257;
float l9_262=0.0;
float l9_263=l9_258;
float l9_264=l9_262+(((l9_259-l9_260)*(l9_263-l9_262))/(l9_261-l9_260));
float l9_265=l9_264;
float4 l9_266=float4(1.0,255.0,65025.0,16581375.0)*l9_265;
l9_266=fract(l9_266);
l9_266-=(l9_266.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float2 l9_267=l9_266.xy;
float2 l9_268=l9_267;
float2 l9_269=l9_268;
l9_1=float4(l9_269.x,l9_269.y,l9_1.z,l9_1.w);
l9_12=l9_1.x;
l9_13=l9_1.y;
float l9_270=gParticle.Color.x;
float l9_271=0.0;
float l9_272=1.00001;
float l9_273=fast::clamp(l9_270,l9_271,l9_272);
float l9_274=l9_271;
float l9_275=l9_272;
float l9_276=0.0;
float l9_277=1.0;
float l9_278=l9_276+(((l9_273-l9_274)*(l9_277-l9_276))/(l9_275-l9_274));
float l9_279=l9_278;
l9_1.x=l9_279;
l9_14=l9_1.x;
float l9_280=gParticle.Color.y;
float l9_281=0.0;
float l9_282=1.00001;
float l9_283=fast::clamp(l9_280,l9_281,l9_282);
float l9_284=l9_281;
float l9_285=l9_282;
float l9_286=0.0;
float l9_287=1.0;
float l9_288=l9_286+(((l9_283-l9_284)*(l9_287-l9_286))/(l9_285-l9_284));
float l9_289=l9_288;
l9_1.x=l9_289;
l9_15=l9_1.x;
float l9_290=gParticle.Color.z;
float l9_291=0.0;
float l9_292=1.00001;
float l9_293=fast::clamp(l9_290,l9_291,l9_292);
float l9_294=l9_291;
float l9_295=l9_292;
float l9_296=0.0;
float l9_297=1.0;
float l9_298=l9_296+(((l9_293-l9_294)*(l9_297-l9_296))/(l9_295-l9_294));
float l9_299=l9_298;
l9_1.x=l9_299;
l9_16=l9_1.x;
float l9_300=gParticle.Color.w;
float l9_301=0.0;
float l9_302=1.00001;
float l9_303=fast::clamp(l9_300,l9_301,l9_302);
float l9_304=l9_301;
float l9_305=l9_302;
float l9_306=0.0;
float l9_307=1.0;
float l9_308=l9_306+(((l9_303-l9_304)*(l9_307-l9_306))/(l9_305-l9_304));
float l9_309=l9_308;
l9_1.x=l9_309;
l9_17=l9_1.x;
}
}
}
float4 param_1=float4(l9_2,l9_3,l9_4,l9_5);
float4 param_2=float4(l9_6,l9_7,l9_8,l9_9);
float4 param_3=float4(l9_10,l9_11,l9_12,l9_13);
float4 param_4=float4(l9_14,l9_15,l9_16,l9_17);
Data0=param_1;
Data1=param_2;
Data2=param_3;
Data3=param_4;
float4 param_5=Data0;
float4 param_6=Data1;
int l9_310=(2001*((in.Interp_Particle_Index/2001)+1))-1;
if (in.Interp_Particle_Index==l9_310)
{
float l9_311=gParticle.SpawnIndex;
float l9_312=-1.0;
float l9_313=500000.0;
float l9_314=l9_311;
float l9_315=l9_312;
float l9_316=l9_313;
float l9_317=0.99998999;
float l9_318=fast::clamp(l9_314,l9_315,l9_316);
float l9_319=l9_315;
float l9_320=l9_316;
float l9_321=0.0;
float l9_322=l9_317;
float l9_323=l9_321+(((l9_318-l9_319)*(l9_322-l9_321))/(l9_320-l9_319));
float l9_324=l9_323;
float4 l9_325=float4(1.0,255.0,65025.0,16581375.0)*l9_324;
l9_325=fract(l9_325);
l9_325-=(l9_325.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_326=l9_325;
float4 l9_327=l9_326;
float4 l9_328=l9_327;
param_5=l9_328;
float l9_329=gParticle.NextBurstTime;
float l9_330=0.0;
float l9_331=300.0;
float l9_332=l9_329;
float l9_333=l9_330;
float l9_334=l9_331;
float l9_335=0.99998999;
float l9_336=fast::clamp(l9_332,l9_333,l9_334);
float l9_337=l9_333;
float l9_338=l9_334;
float l9_339=0.0;
float l9_340=l9_335;
float l9_341=l9_339+(((l9_336-l9_337)*(l9_340-l9_339))/(l9_338-l9_337));
float l9_342=l9_341;
float4 l9_343=float4(1.0,255.0,65025.0,16581375.0)*l9_342;
l9_343=fract(l9_343);
l9_343-=(l9_343.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float2 l9_344=l9_343.xy;
float2 l9_345=l9_344;
float2 l9_346=l9_345;
param_6=float4(l9_346.x,l9_346.y,param_6.z,param_6.w);
}
Data0=param_5;
Data1=param_6;
if (dot(((Data0+Data1)+Data2)+Data3,float4(0.23454))==0.34231836)
{
Data0+=float4(1e-06);
}
float4 param_7=Data0;
if (sc_ShaderCacheConstant_tmp!=0)
{
param_7.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.sc_FragData0=param_7;
float4 param_8=Data1;
out.sc_FragData1=param_8;
float4 param_9=Data2;
out.sc_FragData2=param_9;
float4 param_10=Data3;
out.sc_FragData3=param_10;
return out;
}
} // FRAGMENT SHADER
