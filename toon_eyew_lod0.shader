// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:Unlit/Texture,iptp:0,cusa:False,bamd:0,cgin:,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:False,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:True,atwp:False,stva:2,stmr:255,stmw:255,stcp:6,stps:2,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33321,y:33170,varname:node_4013,prsc:2|custl-3561-OUT,alpha-6883-A,clip-6883-A;n:type:ShaderForge.SFN_Color,id:1304,x:31834,y:32567,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:6883,x:31834,y:32796,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_6883,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-9641-UVOUT;n:type:ShaderForge.SFN_Multiply,id:812,x:32124,y:32714,varname:node_812,prsc:2|A-1304-RGB,B-6883-RGB;n:type:ShaderForge.SFN_Color,id:1589,x:31423,y:32978,ptovrint:False,ptlb:shadowcolor,ptin:_shadowcolor,varname:node_1589,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.63,c2:0.64,c3:0.747,c4:1;n:type:ShaderForge.SFN_TexCoord,id:9641,x:31565,y:32698,varname:node_9641,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Blend,id:2043,x:32488,y:33862,cmnt:blend1,varname:node_2043,prsc:2,blmd:10,clmp:True|SRC-7234-RGB,DST-9234-OUT;n:type:ShaderForge.SFN_RemapRange,id:9234,x:32288,y:33951,varname:node_9234,prsc:2,frmn:0,frmx:1,tomn:0.5,tomx:1|IN-7234-A;n:type:ShaderForge.SFN_Blend,id:5576,x:31679,y:32953,cmnt:blend2,varname:node_5576,prsc:2,blmd:10,clmp:True|SRC-1553-OUT,DST-1589-RGB;n:type:ShaderForge.SFN_Set,id:604,x:32663,y:33883,varname:blend1,prsc:2|IN-2043-OUT;n:type:ShaderForge.SFN_Get,id:1553,x:31402,y:32902,varname:node_1553,prsc:2|IN-604-OUT;n:type:ShaderForge.SFN_Multiply,id:3307,x:32390,y:32855,varname:node_3307,prsc:2|A-812-OUT,B-5576-OUT;n:type:ShaderForge.SFN_NormalVector,id:3217,x:30928,y:33598,prsc:2,pt:True;n:type:ShaderForge.SFN_LightVector,id:2569,x:30928,y:33422,varname:node_2569,prsc:2;n:type:ShaderForge.SFN_Dot,id:8228,x:31418,y:33506,varname:node_8228,prsc:2,dt:0|A-2569-OUT,B-3217-OUT;n:type:ShaderForge.SFN_Tex2d,id:6767,x:31850,y:33506,ptovrint:False,ptlb:rampG,ptin:_rampG,varname:node_6767,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1532-OUT;n:type:ShaderForge.SFN_Append,id:1532,x:31638,y:33506,varname:node_1532,prsc:2|A-8228-OUT,B-8228-OUT;n:type:ShaderForge.SFN_Multiply,id:7100,x:32565,y:33287,varname:node_7100,prsc:2|A-9658-OUT,B-6767-R;n:type:ShaderForge.SFN_Subtract,id:9658,x:32404,y:33103,varname:node_9658,prsc:2|A-812-OUT,B-5576-OUT;n:type:ShaderForge.SFN_Add,id:3038,x:32771,y:33084,varname:node_3038,prsc:2|A-3307-OUT,B-7100-OUT;n:type:ShaderForge.SFN_LightColor,id:7086,x:32072,y:33578,varname:node_7086,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:4065,x:32355,y:33478,varname:node_4065,prsc:2,frmn:0,frmx:1,tomn:0.4,tomx:1|IN-7086-RGB;n:type:ShaderForge.SFN_Max,id:8111,x:32552,y:33642,varname:node_8111,prsc:2|A-4065-OUT,B-7234-RGB;n:type:ShaderForge.SFN_Color,id:7234,x:32084,y:33888,ptovrint:False,ptlb:ambientshadowG,ptin:_ambientshadowG,varname:node_7234,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:3561,x:33025,y:33247,varname:node_3561,prsc:2|A-3038-OUT,B-8111-OUT;proporder:1304-6883-1589-6767-7234;pass:END;sub:END;*/

Shader "Shader Forge/toon_eyew_lod0" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("MainTex", 2D) = "white" {}
        _shadowcolor ("shadowcolor", Color) = (0.63,0.64,0.747,1)
        _rampG ("rampG", 2D) = "white" {}
        _ambientshadowG ("ambientshadowG", Color) = (0.5,0.5,0.5,1)
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
            uniform float4 _Color;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _shadowcolor;
            uniform sampler2D _rampG; uniform float4 _rampG_ST;
            uniform float4 _ambientshadowG;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip(_MainTex_var.a - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float3 node_812 = (_Color.rgb*_MainTex_var.rgb);
                float3 blend1 = saturate(( (_ambientshadowG.a*0.5+0.5) > 0.5 ? (1.0-(1.0-2.0*((_ambientshadowG.a*0.5+0.5)-0.5))*(1.0-_ambientshadowG.rgb)) : (2.0*(_ambientshadowG.a*0.5+0.5)*_ambientshadowG.rgb) ));
                float3 node_5576 = saturate(( _shadowcolor.rgb > 0.5 ? (1.0-(1.0-2.0*(_shadowcolor.rgb-0.5))*(1.0-blend1)) : (2.0*_shadowcolor.rgb*blend1) )); // blend2
                float node_8228 = dot(lightDirection,normalDirection);
                float2 node_1532 = float2(node_8228,node_8228);
                float4 _rampG_var = tex2D(_rampG,TRANSFORM_TEX(node_1532, _rampG));
                float3 finalColor = (((node_812*node_5576)+((node_812-node_5576)*_rampG_var.r))*max((_LightColor0.rgb*0.6+0.4),_ambientshadowG.rgb));
                return fixed4(finalColor,_MainTex_var.a);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip(_MainTex_var.a - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Unlit/Texture"
    CustomEditor "ShaderForgeMaterialInspector"
}
