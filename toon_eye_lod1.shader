// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:Unlit/Texture,iptp:0,cusa:False,bamd:0,cgin:,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:False,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:True,atwp:False,stva:2,stmr:255,stmw:255,stcp:6,stps:2,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33321,y:33170,varname:node_4013,prsc:2|custl-3561-OUT,alpha-1853-OUT;n:type:ShaderForge.SFN_Tex2d,id:6883,x:31073,y:32514,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_6883,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-4573-UVOUT;n:type:ShaderForge.SFN_Color,id:1589,x:31496,y:33005,ptovrint:False,ptlb:shadowcolor,ptin:_shadowcolor,varname:node_1589,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.63,c2:0.64,c3:0.747,c4:1;n:type:ShaderForge.SFN_TexCoord,id:9641,x:30195,y:32559,varname:node_9641,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Blend,id:2043,x:32488,y:33862,cmnt:blend1,varname:node_2043,prsc:2,blmd:10,clmp:True|SRC-7234-RGB,DST-9234-OUT;n:type:ShaderForge.SFN_RemapRange,id:9234,x:32288,y:33951,varname:node_9234,prsc:2,frmn:0,frmx:1,tomn:0.5,tomx:1|IN-7234-A;n:type:ShaderForge.SFN_Blend,id:5576,x:31679,y:32953,cmnt:blend2,varname:node_5576,prsc:2,blmd:10,clmp:True|SRC-1553-OUT,DST-1589-RGB;n:type:ShaderForge.SFN_Set,id:604,x:32663,y:33883,varname:blend1,prsc:2|IN-2043-OUT;n:type:ShaderForge.SFN_Get,id:1553,x:31402,y:32902,varname:node_1553,prsc:2|IN-604-OUT;n:type:ShaderForge.SFN_NormalVector,id:3217,x:30928,y:33598,prsc:2,pt:True;n:type:ShaderForge.SFN_LightVector,id:2569,x:30928,y:33422,varname:node_2569,prsc:2;n:type:ShaderForge.SFN_Dot,id:8228,x:31418,y:33506,varname:node_8228,prsc:2,dt:0|A-2569-OUT,B-3217-OUT;n:type:ShaderForge.SFN_LightColor,id:7086,x:32072,y:33578,varname:node_7086,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:4065,x:32276,y:33578,varname:node_4065,prsc:2,frmn:0,frmx:1,tomn:0.4,tomx:1|IN-7086-RGB;n:type:ShaderForge.SFN_Max,id:8111,x:32552,y:33642,varname:node_8111,prsc:2|A-4065-OUT,B-7234-RGB;n:type:ShaderForge.SFN_Color,id:7234,x:32084,y:33888,ptovrint:False,ptlb:ambientshadowG,ptin:_ambientshadowG,varname:node_7234,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:3561,x:33029,y:33403,varname:node_3561,prsc:2|A-6793-OUT,B-8111-OUT;n:type:ShaderForge.SFN_Slider,id:2095,x:30096,y:32807,ptovrint:False,ptlb:_rotation,ptin:__rotation,varname:node_2095,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:864,x:30475,y:32852,varname:node_864,prsc:2|A-2095-OUT,B-7282-OUT;n:type:ShaderForge.SFN_Vector1,id:7282,x:30240,y:32896,varname:node_7282,prsc:2,v1:6.283185;n:type:ShaderForge.SFN_Rotator,id:4573,x:30727,y:32775,varname:node_4573,prsc:2|UVIN-9641-UVOUT,ANG-864-OUT;n:type:ShaderForge.SFN_TexCoord,id:1962,x:30471,y:32323,varname:node_1962,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:4334,x:30471,y:32182,varname:node_4334,prsc:2|A-5585-OUT,B-5474-OUT;n:type:ShaderForge.SFN_Vector1,id:5474,x:30192,y:32266,varname:node_5474,prsc:2,v1:-0.06;n:type:ShaderForge.SFN_Add,id:3391,x:30693,y:32303,varname:node_3391,prsc:2|A-4334-OUT,B-1962-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:6375,x:31061,y:32294,ptovrint:False,ptlb:expression,ptin:_expression,varname:node_6375,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-3391-OUT;n:type:ShaderForge.SFN_Lerp,id:311,x:31590,y:32387,varname:node_311,prsc:2|A-6883-RGB,B-6375-RGB,T-6240-OUT;n:type:ShaderForge.SFN_Slider,id:6816,x:30960,y:32775,ptovrint:False,ptlb:exppower,ptin:_exppower,varname:node_6816,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:6240,x:31333,y:32535,varname:node_6240,prsc:2|A-6375-A,B-6816-OUT;n:type:ShaderForge.SFN_Tex2d,id:4461,x:31611,y:31779,ptovrint:False,ptlb:overtex2,ptin:_overtex2,varname:node_4461,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-7769-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:7769,x:31373,y:31779,varname:node_7769,prsc:2,uv:2,uaff:False;n:type:ShaderForge.SFN_Color,id:6898,x:31611,y:31614,ptovrint:False,ptlb:overcolor2,ptin:_overcolor2,varname:node_6898,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:1990,x:32108,y:31763,varname:node_1990,prsc:2|A-82-OUT,B-4461-A;n:type:ShaderForge.SFN_Tex2d,id:548,x:31612,y:32120,ptovrint:False,ptlb:overtex1,ptin:_overtex1,varname:node_548,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-7420-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:7420,x:31354,y:32112,varname:node_7420,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Color,id:4629,x:31612,y:31975,ptovrint:False,ptlb:overcolor,ptin:_overcolor,varname:node_4629,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:2245,x:32105,y:32091,varname:node_2245,prsc:2|A-1726-OUT,B-548-A;n:type:ShaderForge.SFN_Max,id:2547,x:32326,y:31916,varname:node_2547,prsc:2|A-1990-OUT,B-2245-OUT;n:type:ShaderForge.SFN_Append,id:82,x:31876,y:31636,varname:node_82,prsc:2|A-6898-RGB,B-6898-A;n:type:ShaderForge.SFN_Append,id:1726,x:31824,y:31975,varname:node_1726,prsc:2|A-4629-RGB,B-4629-A;n:type:ShaderForge.SFN_ComponentMask,id:2946,x:32548,y:31870,varname:node_2946,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-2547-OUT;n:type:ShaderForge.SFN_ComponentMask,id:8921,x:32548,y:32020,varname:node_8921,prsc:2,cc1:3,cc2:-1,cc3:-1,cc4:-1|IN-2547-OUT;n:type:ShaderForge.SFN_Lerp,id:201,x:32897,y:31923,varname:node_201,prsc:2|A-311-OUT,B-2946-OUT,T-3265-OUT;n:type:ShaderForge.SFN_ToggleProperty,id:7265,x:32483,y:32217,ptovrint:False,ptlb:isHighLight,ptin:_isHighLight,varname:node_7265,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False;n:type:ShaderForge.SFN_Multiply,id:3265,x:32737,y:32097,varname:node_3265,prsc:2|A-8921-OUT,B-7265-OUT;n:type:ShaderForge.SFN_Max,id:2723,x:31595,y:32645,varname:node_2723,prsc:2|A-6240-OUT,B-6883-A;n:type:ShaderForge.SFN_Max,id:1853,x:33091,y:32428,varname:node_1853,prsc:2|A-3265-OUT,B-2723-OUT;n:type:ShaderForge.SFN_Max,id:8634,x:31715,y:33560,varname:node_8634,prsc:2|A-8228-OUT,B-9716-OUT;n:type:ShaderForge.SFN_Vector1,id:9716,x:31393,y:33672,varname:node_9716,prsc:2,v1:0;n:type:ShaderForge.SFN_Add,id:5690,x:32086,y:33034,varname:node_5690,prsc:2|A-6240-OUT,B-8634-OUT;n:type:ShaderForge.SFN_Add,id:6656,x:32283,y:32982,varname:node_6656,prsc:2|A-3265-OUT,B-5690-OUT;n:type:ShaderForge.SFN_Clamp01,id:2641,x:32497,y:32982,varname:node_2641,prsc:2|IN-6656-OUT;n:type:ShaderForge.SFN_Lerp,id:6793,x:32775,y:32851,varname:node_6793,prsc:2|A-5562-OUT,B-201-OUT,T-2641-OUT;n:type:ShaderForge.SFN_Multiply,id:5562,x:32387,y:32765,varname:node_5562,prsc:2|A-201-OUT,B-5576-OUT;n:type:ShaderForge.SFN_Tangent,id:1349,x:29348,y:31932,varname:node_1349,prsc:2;n:type:ShaderForge.SFN_Bitangent,id:5240,x:29348,y:32086,varname:node_5240,prsc:2;n:type:ShaderForge.SFN_Dot,id:2128,x:29663,y:32007,varname:node_2128,prsc:2,dt:0|A-1349-OUT,B-950-OUT;n:type:ShaderForge.SFN_ViewVector,id:950,x:29348,y:32229,varname:node_950,prsc:2;n:type:ShaderForge.SFN_Dot,id:2778,x:29663,y:32197,varname:node_2778,prsc:2,dt:0|A-5240-OUT,B-950-OUT;n:type:ShaderForge.SFN_Append,id:5585,x:30192,y:32119,varname:node_5585,prsc:2|A-2128-OUT,B-2778-OUT;proporder:6883-1589-7234-2095-6375-6816-4461-6898-548-4629-7265;pass:END;sub:END;*/

Shader "Shader Forge/toon_eye_lod0" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _shadowcolor ("shadowcolor", Color) = (0.63,0.64,0.747,1)
        _ambientshadowG ("ambientshadowG", Color) = (0.5,0.5,0.5,1)
        __rotation ("_rotation", Range(0, 1)) = 0
        _expression ("expression", 2D) = "white" {}
        _exppower ("exppower", Range(0, 1)) = 0
        _overtex2 ("overtex2", 2D) = "white" {}
        _overcolor2 ("overcolor2", Color) = (0.5,0.5,0.5,1)
        _overtex1 ("overtex1", 2D) = "white" {}
        _overcolor ("overcolor", Color) = (0.5,0.5,0.5,1)
        [MaterialToggle] _isHighLight ("isHighLight", Float ) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 600
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            Stencil {
                Ref 2
                Pass Replace
            }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _shadowcolor;
            uniform float4 _ambientshadowG;
            uniform float __rotation;
            uniform sampler2D _expression; uniform float4 _expression_ST;
            uniform float _exppower;
            uniform sampler2D _overtex2; uniform float4 _overtex2_ST;
            uniform float4 _overcolor2;
            uniform sampler2D _overtex1; uniform float4 _overtex1_ST;
            uniform float4 _overcolor;
            uniform fixed _isHighLight;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float node_4573_ang = (__rotation*6.283185);
                float node_4573_spd = 1.0;
                float node_4573_cos = cos(node_4573_spd*node_4573_ang);
                float node_4573_sin = sin(node_4573_spd*node_4573_ang);
                float2 node_4573_piv = float2(0.5,0.5);
                float2 node_4573 = (mul(i.uv0-node_4573_piv,float2x2( node_4573_cos, -node_4573_sin, node_4573_sin, node_4573_cos))+node_4573_piv);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_4573, _MainTex));
                float2 node_3391 = ((float2(dot(i.tangentDir,viewDirection),dot(i.bitangentDir,viewDirection))*(-0.06))+i.uv0);
                float4 _expression_var = tex2D(_expression,TRANSFORM_TEX(node_3391, _expression));
                float node_6240 = (_expression_var.a*_exppower);
                float4 _overtex2_var = tex2D(_overtex2,TRANSFORM_TEX(i.uv2, _overtex2));
                float4 _overtex1_var = tex2D(_overtex1,TRANSFORM_TEX(i.uv1, _overtex1));
                float4 node_2547 = max((float4(_overcolor2.rgb,_overcolor2.a)*_overtex2_var.a),(float4(_overcolor.rgb,_overcolor.a)*_overtex1_var.a));
                float node_3265 = (node_2547.a*_isHighLight);
                float3 node_201 = lerp(lerp(_MainTex_var.rgb,_expression_var.rgb,node_6240),node_2547.rgb,node_3265);
                float3 blend1 = saturate(( (_ambientshadowG.a*0.5+0.5) > 0.5 ? (1.0-(1.0-2.0*((_ambientshadowG.a*0.5+0.5)-0.5))*(1.0-_ambientshadowG.rgb)) : (2.0*(_ambientshadowG.a*0.5+0.5)*_ambientshadowG.rgb) ));
                float3 finalColor = (lerp((node_201*saturate(( _shadowcolor.rgb > 0.5 ? (1.0-(1.0-2.0*(_shadowcolor.rgb-0.5))*(1.0-blend1)) : (2.0*_shadowcolor.rgb*blend1) ))),node_201,saturate((node_3265+(node_6240+max(dot(lightDirection,normalDirection),0.0)))))*max((_LightColor0.rgb*0.6+0.4),_ambientshadowG.rgb));
                return fixed4(finalColor,max(node_3265,max(node_6240,_MainTex_var.a)));
            }
            ENDCG
        }
    }
    FallBack "Unlit/Texture"
    CustomEditor "ShaderForgeMaterialInspector"
}
