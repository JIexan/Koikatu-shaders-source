Shader "Shader Forge/main_skin" {
    Properties {
		_MainTex("MainTex", 2D) = "white" {}
		_overcolor1("Over Color1", Color) = (1,1,1,1)
		_overtex1("Over Tex1", 2D) = "black" {}
		_overcolor2("Over Color2", Color) = (1,1,1,1)
		_overtex2("Over Tex2", 2D) = "black" {}
		_overcolor3("Over Color3", Color) = (1,1,1,1)
		_overtex3("Over Tex3", 2D) = "black" {}
		_NormalMap("Normal Map", 2D) = "bump" {}
		_NormalMapDetail("Normal Map Detail", 2D) = "bump" {}
		_DetailMask("Detail Mask", 2D) = "black" {}
		_NormalMask("NormalMask", 2D) = "black" {}
		_LineMask("Line Mask", 2D) = "black" {}
		_AlphaMask("Alpha Mask", 2D) = "white" {}
		_ShadowColor("Shadow Color", Color) = (0.628,0.628,0.628,1)
		_SpecularColor("Specular Color", Color) = (1,1,1,0)
		_DetailNormalMapScale("DetailNormalMapScale", Range(0, 1)) = 0
		_SpeclarHeight("Speclar Height", Range(0, 1)) = 0.98
		_SpecularPower("Specular Power", Range(0, 1)) = 0
		_SpecularPowerNail("Specular Power Nail", Range(0, 1)) = 0
		_ShadowExtend("Shadow Extend", Range(0, 1)) = 1
		_rimpower("Rim Width", Range(0, 1)) = 0.5
		_rimV("Rim Strength", Range(0, 1)) = 0
		_nipsize("nipsize", Range(0, 1)) = 0.5
		[MaterialToggle] _alpha_a("alpha_a", Float) = 1
		[MaterialToggle] _alpha_b("alpha_b", Float) = 1
		[MaterialToggle] _linetexon("Line Tex On", Float) = 1
		[MaterialToggle] _notusetexspecular("not use tex specular", Float) = 0
		[MaterialToggle] _nip("nip?", Float) = 0
		_liquidmask("Liquid Mask", 2D) = "black" {}
		_Texture2("Liquid Tex", 2D) = "black" {}
		_Texture3("Liquid Normal", 2D) = "bump" {}
		_LiquidTiling("Liquid Tiling (u/v/us/vs)", Vector) = (0,0,2,2)
		_liquidftop("liquidftop", Range(0, 2)) = 0
		_liquidfbot("liquidfbot", Range(0, 2)) = 0
		_liquidbtop("liquidbtop", Range(0, 2)) = 0
		_liquidbbot("liquidbbot", Range(0, 2)) = 0
		_liquidface("liquidface", Range(0, 2)) = 0
		_nip_specular("nip_specular", Range(0, 1)) = 0.5
		_tex1mask("tex1 mask(1=yes)", Float) = 0
		[HideInInspector] _Cutoff("Alpha cutoff", Range(0, 1)) = 0.5
		//Global variables
		_FaceNormalG("FaceNormalG", Float) = 1
		_FaceShadowG("FaceShadowG", Float) = 1
		_ambientshadowG("AmbientshadowG", Color) = (1,1,1,1)
		_RampG("RampG", 2D) = "white" {}
		_LineColorG("LineColorG", Color) = (0,0,0,1)
		_linewidthG("linewidthG", Float) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
			#include "UnityLightingCommon.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
			float4 _LineColorG;
			float4 u_xlat0;
			float4 u_xlat1;
			float3 u_xlat2;
			float2 u_xlat3;
			float _linewidthG;
			uniform sampler2D _DetailMask; uniform float4 _DetailMask_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
				float4 color : COLOR0;
				float2 tex0 : TEXCOORD0;
				float2 tex1 : TEXCOORD1;
				float2 tex2 : TEXCOORD2;
				float2 tex3 : TEXCOORD3;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
				float4 color : COLOR0;
				float2 tex0 : TEXCOORD0;
				float2 tex1 : TEXCOORD1;
				float2 tex2 : TEXCOORD2;
				float2 tex3 : TEXCOORD3;
				float2 tex4 : TEXCOORD4;
            };
            
			VertexOutput vert (VertexInput v) {
				VertexOutput o = (VertexOutput)0;
				float4 worldPos = mul(unity_ObjectToWorld, v.vertex);
				o.tex4 = worldPos;

				float3 worldSpaceViewDir = _WorldSpaceCameraPos.xyz - worldPos.xyz;
				float distanceToCamera = length(worldSpaceViewDir);

				u_xlat3.xy = v.tex0.xy * _DetailMask_ST.xy + _DetailMask_ST.zw;
				u_xlat1 = tex2Dlod(_DetailMask, float4(u_xlat3.xy, 0.0,0.0));
				float normalOffset = ((1.0 - u_xlat1.z) * (distanceToCamera * 0.1 + 0.3) * _linewidthG * 0.005);

				float3 recipObjScale = float3( length(unity_WorldToObject[0].xyz), length(unity_WorldToObject[1].xyz), length(unity_WorldToObject[2].xyz) );
				float3 objScale = 1.0/recipObjScale;
				normalOffset /= objScale;

				u_xlat0.xyz = v.normal.xyz * normalOffset + v.vertex.xyz;
				o.pos = UnityObjectToClipPos(u_xlat0.xyz);
				o.tex0 = v.tex0;
				o.tex1 = v.tex1;
				o.tex2 = v.tex2;
				o.tex3 = v.tex3;
				o.color = v.color;
				return o;
			}

			int4 lessThan(float4 a, float4 b) {
				int4 res;
				res.x = a.x < b.x;
				res.y = a.y < b.y;
				res.z = a.z < b.z;
				res.w = a.w < b.w;
				return res;
			}

			uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
			uniform sampler2D _AlphaMask; uniform float4 _AlphaMask_ST;
			uniform sampler2D _overtex1; uniform float4 _overtex1_ST;
			uniform sampler2D _overtex2; uniform float4 _overtex2_ST;
			uniform sampler2D _overtex3; uniform float4 _overtex3_ST;
			float _alpha_a;
			float _alpha_b;
			uniform float _nipsize;
			uniform fixed _nip;
			uniform float _nip_specular;
			uniform float4 _overcolor1;
			uniform float4 _overcolor2;
			uniform float4 _overcolor3;
			uniform float _tex1mask;

			float4 _ambientshadowG;

			float3 xlat0;
			float4 xlat10_0;
			int xlatb0;
			float4 xlat1;
			float4 xlat10_1;
			float4 xlat2;
			int3 xlatb2;
			float3 xlat3;
			float4 xlat4;
			float3 xlat5;
			float2 xlat6;
			float xlat7;
			float2 xlat12;
			float xlat18;
			float xlat16_18;
			bool xlatb18;
			float xlat19;
            float4 frag(VertexOutput i) : COLOR {
            	return float4(0,0,0,0);

				float4 alphaColor = tex2D(_AlphaMask, TRANSFORM_TEX(i.tex0.xy, _AlphaMask));
				alphaColor.xy = max(1 - float2(_alpha_a, _alpha_b), alphaColor.rg);
				float alpha = min(alphaColor.y, alphaColor.x);
				clip(alpha - 0.5);
				/*if(alpha < 0.0)
					xlatb0 = 1;
				else
					xlatb0 = 0;

				if (((xlatb0 * int(0xffffffffu))) != 0) { discard; }*/

				xlat0.xy = i.tex1.xy - 0.5;
				xlat0.x = length(xlat0.xy);
				xlat0.x = xlat0.x * 16.6666698 - 1.0;
				xlat0.x = clamp(xlat0.x, 0.0, 1.0);
				xlat6.xy = _nipsize * float2(-1.39999998, 0.699999988) + float2(2.0, -0.5);
				xlat6.xy = i.tex1.xy * xlat6.x + xlat6.y;
				xlat6.xy = xlat6.xy - i.tex1.xy;
				xlat0.xy = xlat0.xx * xlat6.xy + i.tex1.xy;
				xlat12.xy = i.tex1.xy * i.color.xx;
				xlat0.xy = xlat0.xy * i.color.xx - xlat12.xy;
				xlat0.xy = _nip * xlat0.xy + xlat12.xy;
				xlat0.xy = xlat0.xy * _overtex1_ST.xy + _overtex1_ST.zw;
				xlat10_0 = tex2D(_overtex1, xlat0.xy);
				xlat1.x = xlat10_0.y * _nip_specular;
				xlat1.xyz = xlat1.x * 0.33 + _overcolor1.xyz;
				xlat2 = xlat10_0 * _overcolor1;
				xlat0.xyz = xlat10_0.x * xlat1.xyz - xlat2.xyz;
				xlat18 = _tex1mask;
				xlat18 = clamp(xlat18, 0.0, 1.0);
				xlat0.xyz = xlat18 * xlat0.xyz + xlat2.xyz;
				xlat1.xy = i.tex0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				xlat10_1 = tex2D(_MainTex, xlat1.xy);
				xlat0.xyz = xlat0.xyz - xlat10_1.xyz;
				xlat0.xyz = xlat2.www * xlat0.xyz + xlat10_1.xyz;
				xlat1.xy = i.tex2.xy * i.color.zz;
				xlat1.xy = xlat1.xy * _overtex2_ST.xy + _overtex2_ST.zw;
				xlat10_1 = tex2D(_overtex2, xlat1.xy);
				xlat1.xyz = _overcolor2.xyz * xlat10_1.xyz - xlat0.xyz;
				xlat18 = xlat10_1.w * _overcolor2.w;
				xlat0.xyz = xlat18 * xlat1.xyz + xlat0.xyz;
				xlat1.xy = i.tex3.xy * _overtex3_ST.xy + _overtex3_ST.zw;
				xlat10_1 = tex2D(_overtex3, xlat1.xy);
				xlat1.xyz = xlat10_1.xyz * _overcolor3.xyz - xlat0.xyz;
				xlat18 = xlat10_1.w * _overcolor3.w;
				xlat0.xyz = xlat18 * xlat1.xyz + xlat0.xyz;
				//xlatb18 = xlat0.y >= xlat0.z;
				if(xlat0.y >= xlat0.z)
					xlat18 = 1.0;
				else
					xlat18 = 0.0;
				xlat1.xy = xlat0.zy;
				xlat2.xy = xlat0.yz - xlat1.xy;
				xlat1.z = float(-1.0);
				xlat1.w = float(0.666666687);
				xlat2.z = float(1.0);
				xlat2.w = float(-1.0);
				xlat1 = xlat18 * xlat2.xywz + xlat1.xywz;
				//xlatb18 = xlat0.x >= xlat1.x;
				if(xlat0.x >= xlat1.x)
					xlat18 = 1.0;
				else
					xlat18 = 0.0;

				xlat2.z = xlat1.w;
				xlat1.w = xlat0.x;
				xlat0.xyz = xlat0.xyz * _LineColorG.xyz;
				xlat2.xyw = xlat1.wyx;
				xlat2 = xlat2 - xlat1;
				xlat1 = xlat18 * xlat2 + xlat1;
				xlat18 = min(xlat1.y, xlat1.w);
				xlat18 = xlat1.x - xlat18;
				xlat2.x = xlat18 * 6.0 + 1.00000001e-10;
				xlat7 = xlat1.w - xlat1.y;
				xlat7 = xlat7 / xlat2.x;
				xlat7 = xlat7 + xlat1.z;
				xlat1.x = xlat1.x + 1.00000001e-10;
				xlat18 = xlat18 / xlat1.x;
				xlat18 = xlat18 * 0.660000026;
				xlat1.xyz = abs(xlat7) + float3(0.0, -0.333333343, 0.333333343);
				xlat1.xyz = frac(xlat1.xyz);
				xlat1.xyz = 1.0 - xlat1.xyz * 2.0;
				xlat1.xyz = abs(xlat1.xyz) * 3.0 - 1.0;
				xlat1.xyz = clamp(xlat1.xyz, 0.0, 1.0);
				xlat1.xyz = xlat1.xyz - 1.0;
				xlat1.xyz = xlat18 * xlat1.xyz + 1.0;
				xlatb2.xyz = lessThan(float4(0.555555582, 0.555555582, 0.555555582, 0.0), xlat1.xyzx).xyz;
				xlat3.xyz = xlat1.xyz * 0.9 - 0.5;
				xlat3.xyz = 1.0 - xlat3.xyz * 2.0;
				xlat4 = 1 - _ambientshadowG.wxyz;
				xlat4.xyz = 1.0 - xlat4.xxx * xlat4.yzw;
				xlat18 = _ambientshadowG.w * 0.5 + 0.5;
				xlat19 = xlat18 + xlat18;
				//xlatb18 = 0.5 < xlat18;
				xlat5.xyz = xlat19 * _ambientshadowG.xyz;
				if(0.5 < xlat18)
					xlat4.xyz = xlat4.xyz;
				else
					xlat4.xyz = xlat5.xyz;
				xlat4.xyz = clamp(xlat4.xyz, 0.0, 1.0);
				xlat5.xyz = 1.0 - xlat4.xyz;
				xlat1.xyz = xlat1.xyz * xlat4.xyz;
				xlat1.xyz = xlat1.xyz * 1.8;
				xlat3.xyz = 1.0 - xlat3.xyz * xlat5.xyz;
				{
					float4 hlslcc_movcTemp = xlat1;
					hlslcc_movcTemp.x = (xlatb2.x) ? xlat3.x : xlat1.x;
					hlslcc_movcTemp.y = (xlatb2.y) ? xlat3.y : xlat1.y;
					hlslcc_movcTemp.z = (xlatb2.z) ? xlat3.z : xlat1.z;
					xlat1 = hlslcc_movcTemp;
				}
				xlat1.xyz = clamp(xlat1.xyz, 0.0, 1.0);
				xlat0.xyz = xlat0.xyz * xlat1.xyz;
				xlat1.xy = i.tex0.xy * _DetailMask_ST.xy + _DetailMask_ST.zw;
				xlat10_1 = tex2D(_DetailMask, xlat1.xy);
				xlat16_18 = 1.0 - xlat10_1.y;
				xlat16_18 = xlat16_18 * 0.5 + 0.5;
				xlat1.xyz = 1.0 - xlat0.xyz * xlat16_18;
				xlat0.xyz = xlat16_18 * xlat0.xyz;
				xlat18 = _LineColorG.w - 0.5;
				xlat18 = 1.0 - xlat18 * 2.0;
				xlat1.xyz = 1.0 -xlat18 * xlat1.xyz;
				xlat18 = _LineColorG.w + _LineColorG.w;
				xlat0.xyz = xlat0.xyz * xlat18;
				//xlatb18 = 0.5 < _LineColorG.w;
				if(0.5 < _LineColorG.w)
					xlat0.xyz = xlat1.xyz;
				else
					xlat0.xyz = xlat0.xyz;
				xlat0.xyz = clamp(xlat0.xyz, 0.0, 1.0);
				xlat1.xyz = _LightColor0.xyz * 0.6 + 0.4;
				return fixed4(xlat0.xyz * xlat1.xyz, 0);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
                "QUEUE" = "AlphaTest-100" 
                "RenderType" = "TransparentCutout" 
                "SHADOWSUPPORT" = "true"
            }
			Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
			Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            //#define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
			#include "UnityLightingCommon.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0

            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _overtex1; uniform float4 _overtex1_ST;
			uniform sampler2D _overtex2; uniform float4 _overtex2_ST;
			uniform sampler2D _overtex3; uniform float4 _overtex3_ST;
			uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
			uniform sampler2D _NormalMapDetail; uniform float4 _NormalMapDetail_ST;
			uniform sampler2D _Texture2; uniform float4 _Texture2_ST;
			uniform sampler2D _Texture3; uniform float4 _Texture3_ST;
			uniform sampler2D _liquidmask; uniform float4 _liquidmask_ST;
			uniform sampler2D _NormalMask; uniform float4 _NormalMask_ST;
			uniform sampler2D _LineMask; uniform float4 _LineMask_ST;
			uniform sampler2D _DetailMask; uniform float4 _DetailMask_ST;

			uniform sampler2D _AlphaMask; uniform float4 _AlphaMask_ST;
			uniform sampler2D _RampG; uniform float4 _RampG_ST;
            uniform float _nipsize;
            uniform float _nip_specular;
            uniform float4 _overcolor1;
			uniform float4 _overcolor2;
			uniform float4 _overcolor3;
            uniform float _tex1mask;
			uniform float _alpha_a;
			uniform float _alpha_b;
			uniform float _DetailNormalMapScale;
			uniform float4 _LiquidTiling;
			uniform float _liquidftop;
			uniform float _liquidfbot;
			uniform float _liquidbtop;
			uniform float _liquidbbot;
			uniform float _liquidface;
			uniform float _ShadowExtend;
			uniform float _SpeclarHeight;
			uniform float4 _SpecularColor;
			uniform float _SpecularPower;
			uniform float _SpecularPowerNail;
			uniform float _notusetexspecular;
			uniform float _rimpower;
			uniform float _rimV;
			uniform float _linewidthG;
			uniform float _linetexon;

			uniform float _FaceNormalG;
			uniform float _FaceShadowG;
			uniform float4 _LineColorG;
			uniform float4 _ambientshadowG;
            uniform fixed _nip;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
				float4 tangent : TANGENT;
				float4 vertexColor : COLOR;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
				float2 texcoord2 : TEXCOORD2;
				float2 texcoord3 : TEXCOORD3;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
				float4 vertexColor : COLOR;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
				float2 uv2 : TEXCOORD2;
				float2 uv3 : TEXCOORD3;
				float4 posWorld : TEXCOORD4;
				float3 normalDir : TEXCOORD5;
				float3 tangentDir : TEXCOORD6;
				float3 bitangentDir : TEXCOORD7;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
				o.uv0 = v.texcoord0;
				o.uv1 = v.texcoord1;
				o.uv2 = v.texcoord2;
				o.uv3 = v.texcoord3;
				
				o.posWorld = mul(unity_ObjectToWorld, v.vertex);
				float4 pos = UnityObjectToClipPos(v.vertex);
				o.pos = pos;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);

				o.vertexColor = v.vertexColor;

                return o;
            }

			float4 lessThan(float4 a, float4 b) { return float4(1, 1, 1, 1)-step(b, a); }

			float3 normalBlend(float3 base, float3 detail) {
			    float3 node_3430_nrm_base = base + float3(0,0,1);
                float3 node_3430_nrm_detail = detail * float3(-1,-1,1);
                return node_3430_nrm_base*dot(node_3430_nrm_base, node_3430_nrm_detail)/node_3430_nrm_base.z - node_3430_nrm_detail;
            }


			float3 u_xlat0;
			float4 u_xlat10_0;
			int u_xlatb0;
			float4 u_xlat1;
			float4 u_xlat10_1;
			float4 u_xlat2;
			float4 u_xlat3;
			float4 u_xlat10_3;
			float4 u_xlat4;
			float2 u_xlat16_4;
			float3 u_xlat5;
			float3 u_xlat16_5;
			float4 u_xlat10_5;
			float4 u_xlat6;
			float4 u_xlat10_6;
			bool u_xlatb6;
			float3 u_xlat7;
			float3 u_xlat16_7;
			float4 u_xlat8;
			float3 u_xlat16_8;
			float4 u_xlat10_8;
			float4 u_xlat9;
			float4 u_xlat10_9;
			float2 u_xlat10;
			float u_xlat11;
			float3 u_xlat13;
			int3 u_xlatb13;
			float3 u_xlat14;
			float u_xlat16_14;
			float2 u_xlat20;
			float u_xlat16_24;
			float2 u_xlat25;
			float u_xlat26;
			float u_xlat30;
			float u_xlat16_30;
			bool u_xlatb30;
			float u_xlat31;
			float u_xlat16_31;
			float u_xlat32;
			float u_xlat33;
			float u_xlat16_33;
			float u_xlat34;
			float u_xlat35;
            float4 frag(VertexOutput i, fixed faceDir : VFACE) : COLOR {
				/*u_xlat0.xy = i.uv0.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
				u_xlat10_0 = tex2D(_AlphaMask, u_xlat0.xy);
				u_xlat20.xy = (-float2(_alpha_a, _alpha_b)) + float2(1.0, 1.0);
				u_xlat0.xy = max(u_xlat20.xy, u_xlat10_0.xy);
				u_xlat0.x = min(u_xlat0.y, u_xlat0.x);
				u_xlat0.x = u_xlat0.x + -0.5;
				if(u_xlat0.x < 0.0)
					u_xlatb0 = 1;
				else
					u_xlatb0 = 0;
				if (((int(u_xlatb0) * int(0xffffffffu))) != 0) { discard; }*/

				float nipAlpha = saturate(length(i.uv1.xy - 0.5) * 16.7 - 1.0);
				//u_xlat10.xy = _nipsize * float2(-1.4, 0.7) + float2(2.0, -0.5);
				u_xlat10.xy = i.uv1.xy * (_nipsize * -1.4 + 2.0) + (_nipsize * 0.7 - 0.5);
				float2 nipUV = lerp(i.uv1.xy, u_xlat10.xy, nipAlpha);//(nipAlpha * (u_xlat10.xy - i.uv1.xy)) + i.uv1.xy;
				nipUV = _nip * nipUV * i.vertexColor.r;

				float4 nipColor = tex2D(_overtex1, nipUV * _overtex1_ST.xy + _overtex1_ST.zw);
				float3 nipSpecular = nipColor.g * _nip_specular * 0.33 + _overcolor1.rgb;
				nipColor.xyz = lerp(nipColor * _overcolor1, nipColor.r * nipSpecular, saturate(_tex1mask));

				float4 mainColor = tex2D(_MainTex, i.uv0.xy * _MainTex_ST.xy + _MainTex_ST.zw);
				mainColor.rgb = lerp(mainColor.rgb, nipColor.rgb, nipColor.a);

				float4 overtex2Color = tex2D(_overtex2, i.uv2.xy * i.vertexColor.b * _overtex2_ST.xy + _overtex2_ST.zw);
				mainColor.rgb = lerp(mainColor.rgb, overtex2Color.rgb * _overcolor2.rgb, overtex2Color.a * _overcolor2.a);

				float4 overtex3Color = tex2D(_overtex3, i.uv3.xy * _overtex3_ST.xy + _overtex3_ST.zw);
				mainColor.rgb = lerp(mainColor.rgb, overtex3Color.rgb * _overcolor3.rgb, overtex3Color.a * _overcolor3.a);
				u_xlat0.rgb = mainColor.rgb;

				//magic begins
				u_xlat1 = float4(mainColor.zy, 0.67, -1);
				if(mainColor.g >= mainColor.b)
					u_xlat1 += float4(mainColor.yz - mainColor.zy, -1, 1);

				u_xlat2 = float4(mainColor.x, u_xlat1.ywx);
				u_xlat1.w = mainColor.x;

				if(mainColor.x >= u_xlat1.x)
					u_xlat1 = u_xlat2;

				u_xlat30 = u_xlat1.x - min(u_xlat1.y, u_xlat1.w);
				u_xlat2.x = u_xlat30 * 6.0;// + 1e-10;

				u_xlat30 = (u_xlat30 / u_xlat1.x) * 0.66;

				u_xlat11 = abs(((u_xlat1.w - u_xlat1.y) / u_xlat2.x) + u_xlat1.z);
				u_xlat1.xzw = u_xlat11 + float3(-0.08, -0.41, 0.25);
				u_xlat2.xyz = u_xlat11 + float3(0.0, -0.33, 0.33);

				u_xlat2.xyz = 1.0 - frac(u_xlat2.xyz) * 2.0;

				u_xlat2.xyz = lerp(1.0, saturate(abs(u_xlat2.xyz) * 3.0 - 1.0), u_xlat30);
				u_xlat1.xyz = abs(1.0 - frac(u_xlat1.xzw) * 2.0) * 3.0 - 1.0;
				u_xlat1.xyz = 0.97 * lerp(1.0, saturate(u_xlat1.xyz), 0.4) - 1.0;

				float3 normalDetail = UnpackNormal(tex2D(_NormalMapDetail, TRANSFORM_TEX(i.uv0.xy, _NormalMapDetail)));
				float3 mainNormal = UnpackNormal(tex2D(_NormalMap, TRANSFORM_TEX(i.uv0.xy, _NormalMap)));
				u_xlat3.xyz = lerp(mainNormal, normalBlend(mainNormal,normalDetail), _DetailNormalMapScale);//_DetailNormalMapScale * (u_xlat3.xyz - u_xlat6.xyz) + u_xlat6.xyz;

				float2 liquidUV = i.uv0.xy * _LiquidTiling.zw + _LiquidTiling.xy;
				float3 liguidSplatMask = tex2D(_Texture2, TRANSFORM_TEX(liquidUV.xy, _Texture2));
				float3 liqidNormal = UnpackNormal(tex2D(_Texture3, TRANSFORM_TEX(liquidUV.xy, _Texture3))); //liquid normal
				u_xlat4.xyz = normalBlend(u_xlat3.xyz, liqidNormal);

				u_xlat30 = saturate(_liquidftop - 1.0) * liguidSplatMask.y;
				u_xlat31 = saturate(_liquidftop) * liguidSplatMask.x;
				u_xlat30 = max(u_xlat30, u_xlat31);

				float3 liquidMaskColor = u_xlat10_5 = tex2D(_liquidmask, TRANSFORM_TEX(i.uv0.xy, _liquidmask));
				u_xlat16_7.xyz = liquidMaskColor.xyz - max(liquidMaskColor.zzy, liquidMaskColor.yxx);
				u_xlat16_5.xy = min(liquidMaskColor.yz, liquidMaskColor.xy) * 1.11 - 0.11;
				u_xlat30 = min(u_xlat30, u_xlat16_7.x);
				float4 liquid = float4(_liquidfbot, _liquidbtop, _liquidbbot, _liquidface);
				u_xlat8 = liguidSplatMask.y * saturate(liquid - 1.0);
				u_xlat6 = liguidSplatMask.x * saturate(liquid);
				u_xlat6 = max(u_xlat6, u_xlat8);

				u_xlat25.xy = min(u_xlat16_7.yz, u_xlat6.xy);
				u_xlat5.xy = min(u_xlat16_5.xy, u_xlat6.zw);
				u_xlat30 = max(u_xlat25.x, u_xlat30);
				u_xlat30 = max(u_xlat25.y, u_xlat30);
				u_xlat30 = max(u_xlat5.x, u_xlat30);
				u_xlat30 = max(u_xlat5.y, u_xlat30);
				u_xlat30 = clamp(u_xlat30, 0.0, 1.0);

				u_xlat3.xyz = lerp(u_xlat3.xyz, u_xlat4.xyz, u_xlat30);
				float3 normal = normalize(i.normalDir.xyz) * faceDir;
				float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, normal);
				float3 normalDirection = normalize(mul(u_xlat3, tangentTransform));
				u_xlat3.xyz = normalDirection;
				float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);

				u_xlat10_6 = tex2D(_NormalMask, TRANSFORM_TEX(i.uv0.xy, _NormalMask)); //this branch doesn't do anything
				u_xlat6.xy = u_xlat10_6.yz * float2(_FaceNormalG, _FaceShadowG);
				u_xlat5.xyz = lerp(normalDirection, viewDirection, u_xlat6.x);//it will always be normalDirection

				u_xlat32 = max(u_xlat6.y, 1.0);

				float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
				float3 LdotN = dot(lightDirection,u_xlat5.xyz);
				float3 halfDirection = normalize(viewDirection + lightDirection);
				u_xlat4.xyz = viewDirection;

				u_xlat31 = max(LdotN, 0.0);
				float2 rampUV = u_xlat31 * _RampG_ST.xy + _RampG_ST.zw;
				u_xlat31 = u_xlat31 + 0.5;
				u_xlat7.xyz = u_xlat31 * float3(0.15, 0.2, 0.3) + float3(0.85, 0.8, 0.7);
				u_xlat10_6 = tex2D(_RampG, rampUV);
				u_xlat31 = u_xlat32 * u_xlat10_6.x;
				

				u_xlat32 = 1.0 - _ShadowExtend * 1.2;

				u_xlat10_6 = tex2D(_LineMask, TRANSFORM_TEX(i.uv0.xy, _LineMask));
				u_xlat6.xz =  1.0 - u_xlat10_6.zx * _DetailNormalMapScale;

				u_xlat10_8 = tex2D(_DetailMask, TRANSFORM_TEX(i.uv0.xy, _DetailMask));
				u_xlat16_8.xyz = 1.0 - u_xlat10_8.gab;

				float lineMaskR = (1.0 - u_xlat10_6.x * _DetailNormalMapScale) * 0.5 + 0.5;
				u_xlat32 = lerp(u_xlat32, 1.0, min(u_xlat6.x, u_xlat16_8.x));
				u_xlat31 = u_xlat31 * u_xlat32;

				u_xlat9.x = dot(i.tangentDir.xyz, viewDirection);
				u_xlat9.y = dot(i.bitangentDir.xyz, viewDirection);

				float fresnel = 1.0 - max(0.0, dot(normalDirection, viewDirection));

				float2 specularOffset = ((_SpeclarHeight - 1.0) * 0.8) * u_xlat9.xy + i.uv0.xy;
				u_xlat10_9 = tex2D(_DetailMask, TRANSFORM_TEX(specularOffset, _DetailMask));

				float detailMaskR = saturate(u_xlat10_9.x * 1.67);
				float specularPower = max(u_xlat10_8.w * _SpecularPower, (1 - u_xlat10_8.w) * _SpecularPowerNail);
				u_xlat14.x = (detailMaskR - pow(detailMaskR,3)) * specularPower;

				float3 specularColor = specularPower * pow(detailMaskR,3) * _SpecularColor.xyz;
				
				u_xlat33 = min(dot(_SpecularColor.xyz, float3(0.3, 0.59, 0.11)), u_xlat14.x);
				u_xlat33 = min(u_xlat31, u_xlat33);
				u_xlat33 = min(u_xlat10_8.w, u_xlat33);
				u_xlat1.xyz = mainColor.xyz * (u_xlat33 * u_xlat1.xyz + 1.0) + specularColor;

				u_xlat3.x = pow(max(0.0, dot(normalDirection, halfDirection)), 256.0) * 0.5;

				float specular = saturate(pow(max(0.0, dot(normalDirection, halfDirection)), 256.0 * _SpecularPower) * _SpecularPower * _SpecularColor.w);
				u_xlat13.xyz = _SpecularColor.xyz * specular + mainColor.rgb;

				u_xlat1.xyz = saturate(lerp(u_xlat1.xyz, u_xlat13.xyz, _notusetexspecular));

				u_xlatb13.xyz = lessThan(float4(0.56, 0.56, 0.56, 0.56), u_xlat2.xyzz).xyz;
				u_xlat14.xyz = u_xlat2.xyz * 0.9 - 0.5;
				u_xlat14.xyz = 1.0 - u_xlat14.xyz * 2.0;

				u_xlat5.xyz = saturate(( _ambientshadowG.w > 0.5 ? (1.0-(1.0-2.0*(_ambientshadowG.w-0.5))*(1.0-_ambientshadowG.xyz)) : (2.0*_ambientshadowG.w*_ambientshadowG.xyz))); //blend _ambientshadowG.w,_ambientshadowG.xyz mode: overlay

				u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz * 1.8; // possibly blend between u_xlat2 and u_xlat5
				u_xlat14.xyz = (1.0 - u_xlat14.xyz) * (1.0 - u_xlat5.xyz);
				{
					float4 hlslcc_movcTemp = u_xlat2;
					hlslcc_movcTemp.x = (u_xlatb13.x) ? u_xlat14.x : u_xlat2.x;
					hlslcc_movcTemp.y = (u_xlatb13.y) ? u_xlat14.y : u_xlat2.y;
					hlslcc_movcTemp.z = (u_xlatb13.z) ? u_xlat14.z : u_xlat2.z;
					u_xlat2 = hlslcc_movcTemp;
				}
				u_xlat2.xyz = saturate(u_xlat2.xyz);

				u_xlat1.xyz = lerp((u_xlat1.xyz * u_xlat2.xyz),u_xlat1.xyz,u_xlat31);

				u_xlat13.xyz = u_xlat30 * float3(0.35, 0.45, 0.6) + float3(0.5, 0.4, 0.24);
				u_xlat3.xyz = u_xlat13.xyz * u_xlat7.xyz + u_xlat3.x;

				u_xlat31 = exp2(fresnel * _rimpower * 9.0 + 1.0) * 5.0 - 2.0;
				u_xlat16_4.xy = u_xlat16_8.xz * float2(0.5, 2.5) + float2(0.5, -1.5);
				
				u_xlat31 = u_xlat16_8.x * saturate(min(u_xlat31, u_xlat16_4.y));
				u_xlat3.xyz = u_xlat31 * _rimV + u_xlat3.xyz;

				u_xlat1.xyz = lerp(u_xlat1.xyz, u_xlat3.xyz, u_xlat30);//u_xlat30 * (u_xlat3.xyz - u_xlat1.xyz) + u_xlat1.xyz;
				//u_xlat3.xyz = _LightColor0.xyz * 0.6 + 0.4;
				u_xlat14.xyz = max(_LightColor0.xyz * 0.6 + 0.4, _ambientshadowG.xyz);
				u_xlat1.xyz = u_xlat1.xyz * u_xlat14.xyz;

				float3 var2 = u_xlat16_4.x * mainColor.rgb * _LineColorG.xyz * u_xlat2.xyz;

				u_xlat0.xyz = saturate(_LineColorG.w > 0.5 ? ( 1.0 - (1.0 - 2.0 * (_LineColorG.w - 0.5)) * (1.0 - var2)) : (2 * var2 * _LineColorG.w));//blend var2, _LineColorG.w, mode: overlay

				u_xlat0.xyz = u_xlat3.xyz * u_xlat0.xyz;

				u_xlat2.xyz = lerp(u_xlat2.xyz, 1.0, u_xlat32);

				u_xlat30 = pow((1.0 - _linewidthG) * 0.8 + 0.2, u_xlat10_6.y);
				//u_xlat30 = min(u_xlat35, u_xlat30);
				u_xlat30 = lerp(1.0, min(lineMaskR, u_xlat30), _linetexon);

				float3 resCol = lerp(u_xlat0.xyz, u_xlat1.xyz * u_xlat2.xyz, u_xlat30);
				float4 res = float4(resCol, 1.0);
                return res;
            }
            ENDCG
        }
    }
    FallBack "Mobile/Diffuse"
}
