-- ManualAPI.lua

-- Declares the Manually-exported API symbols.
-- Note that this is only a one-time export of the API and may be old; use the ManualApiDump plugin to get a fresh file.
-- https://github.com/madmaxoft/ManualApiDump
-- For production-grade plugin testing, you should obtain the ManualAPI.lua file from an official Cuberite builds server (https://builds.cuberite.org)





return
{
	Classes =
	{
		HTTPFormData =
		{
			Variables =
			{
				Name =
				{
					Name = "Name",
				},
				Type =
				{
					Name = "Type",
				},
				Value =
				{
					Name = "Value",
				},
			},
		},
		HTTPRequest =
		{
			Constants =
			{
				FormData =
				{
					Name = "FormData",
				},
				Params =
				{
					Name = "Params",
				},
				PostParams =
				{
					Name = "PostParams",
				},
			},
			Variables =
			{
				Method =
				{
					Name = "Method",
				},
				Path =
				{
					Name = "Path",
				},
				URL =
				{
					Name = "URL",
				},
				Username =
				{
					Name = "Username",
				},
			},
		},
		HTTPTemplateRequest =
		{
			Variables =
			{
				Request =
				{
					Name = "Request",
				},
			},
		},
		ItemCategory =
		{
			Functions =
			{
				IsArmor =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "ItemType",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				IsAxe =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "ItemType",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				IsBoots =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "ItemType",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				IsChestPlate =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "ItemType",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				IsHelmet =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "ItemType",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				IsHoe =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "ItemType",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				IsLeggings =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "ItemType",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				IsMinecart =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "ItemType",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				IsPickaxe =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "ItemType",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				IsShovel =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "ItemType",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				IsSword =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "ItemType",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				IsTool =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "ItemType",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
			},
		},
		TakeDamageInfo =
		{
			Variables =
			{
				Attacker =
				{
					Name = "Attacker",
				},
				DamageType =
				{
					Name = "DamageType",
				},
				FinalDamage =
				{
					Name = "FinalDamage",
				},
				Knockback =
				{
					Name = "Knockback",
				},
				RawDamage =
				{
					Name = "RawDamage",
				},
			},
		},
		Vector3d =
		{
			Constants =
			{
				EPS =
				{
					Name = "EPS",
					Type = "number",
					Value = 1e-006,
				},
				NO_INTERSECTION =
				{
					Name = "NO_INTERSECTION",
					Type = "number",
					Value = 1e+070,
				},
			},
			Functions =
			{
				clamp =
				{
					{
						Params =
						{
							{
								Name = "min",
								Type = "number",
							},
							{
								Name = "max",
								Type = "number",
							},
						},
					},
				},
				constructor =
				{
					{
						Params =
						{
							{
								Name = "Vector",
								Type = "Vector3f",
							},
						},
						Returns =
						{
							{
								Type = "Vector3d",
							},
						},
					},
					{
						Returns =
						{
							{
								Type = "Vector3d",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "X",
								Type = "number",
							},
							{
								Name = "Y",
								Type = "number",
							},
							{
								Name = "Z",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "Vector3d",
							},
						},
					},
				},
				operator_div =
				{
					{
						Params =
						{
							{
								Name = "ParCoordDivisors",
								Type = "Vector3d",
							},
						},
						Returns =
						{
							{
								Type = "Vector3d",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "Divisor",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "Vector3d",
							},
						},
					},
				},
				operator_mul =
				{
					{
						Params =
						{
							{
								Name = "PerCoordMultiplier",
								Type = "Vector3d",
							},
						},
						Returns =
						{
							{
								Type = "Vector3d",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "Multiplier",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "Vector3d",
							},
						},
					},
				},
				operator_plus =
				{
					{
						Params =
						{
							{
								Name = "Addend",
								Type = "Vector3d",
							},
						},
						Returns =
						{
							{
								Type = "Vector3d",
							},
						},
					},
				},
				operator_sub =
				{
					{
						Params =
						{
							{
								Name = "Subtrahend",
								Type = "Vector3d",
							},
						},
						Returns =
						{
							{
								Type = "Vector3d",
							},
						},
					},
					{
						Returns =
						{
							{
								Type = "Vector3d",
							},
						},
					},
				},
			},
			Variables =
			{
				x =
				{
					Name = "x",
					Type = "number",
				},
				y =
				{
					Name = "y",
					Type = "number",
				},
				z =
				{
					Name = "z",
					Type = "number",
				},
			},
		},
		Vector3f =
		{
			Constants =
			{
				EPS =
				{
					Name = "EPS",
					Type = "number",
					Value = 1e-006,
				},
				NO_INTERSECTION =
				{
					Name = "NO_INTERSECTION",
					Type = "number",
					Value = 1e+070,
				},
			},
			Functions =
			{
				clamp =
				{
					{
						Params =
						{
							{
								Name = "min",
								Type = "number",
							},
							{
								Name = "max",
								Type = "number",
							},
						},
					},
				},
				constructor =
				{
					{
						Returns =
						{
							{
								Type = "Vector3f",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "x",
								Type = "number",
							},
							{
								Name = "y",
								Type = "number",
							},
							{
								Name = "z",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "Vector3f",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "Vector3f",
								Type = "Vector3f",
							},
						},
						Returns =
						{
							{
								Type = "Vector3f",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "Vector3d",
								Type = "Vector3d",
							},
						},
						Returns =
						{
							{
								Type = "Vector3f",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "Vector3i",
								Type = "Vector3i",
							},
						},
						Returns =
						{
							{
								Type = "Vector3f",
							},
						},
					},
				},
				operator_div =
				{
					{
						Params =
						{
							{
								Name = "PerCoordDivisor",
								Type = "Vector3f",
							},
						},
						Returns =
						{
							{
								Type = "Vector3f",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "Divisor",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "Vector3f",
							},
						},
					},
				},
				operator_mul =
				{
					{
						Params =
						{
							{
								Name = "PerCoordMultiplier",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "Vector3f",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "Multiplier",
								Type = "Vector3f",
							},
						},
						Returns =
						{
							{
								Type = "Vector3f",
							},
						},
					},
				},
				operator_plus =
				{
					{
						Params =
						{
							{
								Name = "Other",
								Type = "Vector3f",
							},
						},
						Returns =
						{
							{
								Type = "Vector3f",
							},
						},
					},
				},
				operator_sub =
				{
					{
						Params =
						{
							{
								Name = "Subtrahend",
								Type = "Vector3f",
							},
						},
						Returns =
						{
							{
								Type = "Vector3f",
							},
						},
					},
					{
						Returns =
						{
							{
								Type = "Vector3f",
							},
						},
					},
				},
			},
			Variables =
			{
				x =
				{
					Name = "x",
					Type = "number",
				},
				y =
				{
					Name = "y",
					Type = "number",
				},
				z =
				{
					Name = "z",
					Type = "number",
				},
			},
		},
		Vector3i =
		{
			Constants =
			{
				EPS =
				{
					Name = "EPS",
					Type = "number",
					Value = 1e-006,
				},
				NO_INTERSECTION =
				{
					Name = "NO_INTERSECTION",
					Type = "number",
					Value = 1e+070,
				},
			},
			Functions =
			{
				clamp =
				{
					{
						Params =
						{
							{
								Name = "min",
								Type = "number",
							},
							{
								Name = "max",
								Type = "number",
							},
						},
					},
				},
				constructor =
				{
					{
						Returns =
						{
							{
								Type = "Vector3i",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "x",
								Type = "number",
							},
							{
								Name = "y",
								Type = "number",
							},
							{
								Name = "z",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "Vector3i",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "Vector3d",
								Type = "Vector3d",
							},
						},
						Returns =
						{
							{
								Type = "Vector3i",
							},
						},
					},
				},
				operator_div =
				{
					{
						Params =
						{
							{
								Name = "Divisor",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "Vector3i",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "PerCoordDivisors",
								Type = "Vector3i",
							},
						},
						Returns =
						{
							{
								Type = "Vector3i",
							},
						},
					},
				},
				operator_mul =
				{
					{
						Params =
						{
							{
								Name = "Multiplier",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "Vector3i",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "PerCoordMultipliers",
								Type = "Vector3i",
							},
						},
						Returns =
						{
							{
								Type = "Vector3i",
							},
						},
					},
				},
				operator_plus =
				{
					{
						Params =
						{
							{
								Name = "Addend",
								Type = "Vector3i",
							},
						},
						Returns =
						{
							{
								Type = "Vector3i",
							},
						},
					},
				},
				operator_sub =
				{
					{
						Params =
						{
							{
								Name = "Subtrahend",
								Type = "Vector3i",
							},
						},
						Returns =
						{
							{
								Type = "Vector3i",
							},
						},
					},
					{
						Returns =
						{
							{
								Type = "Vector3i",
							},
						},
					},
				},
			},
			Variables =
			{
				x =
				{
					Name = "x",
					Type = "number",
				},
				y =
				{
					Name = "y",
					Type = "number",
				},
				z =
				{
					Name = "z",
					Type = "number",
				},
			},
		},
		cArrowEntity =
		{
			Constants =
			{
				psInCreative =
				{
					Type = "number",
					Value = 2,
				},
				psInSurvivalOrCreative =
				{
					Type = "number",
					Value = 1,
				},
				psNoPickup =
				{
					Type = "number",
					Value = 0,
				},
			},
			Enums =
			{
				ePickupState =
				{
					{
						Name = "psInCreative",
					},
					{
						Name = "psInSurvivalOrCreative",
					},
					{
						Name = "psNoPickup",
					},
				},
			},
		},
		cBlockArea =
		{
			Constants =
			{
				baLight =
				{
					Type = "number",
					Value = 4,
				},
				baMetas =
				{
					Type = "number",
					Value = 2,
				},
				baSkyLight =
				{
					Type = "number",
					Value = 8,
				},
				baTypes =
				{
					Type = "number",
					Value = 1,
				},
				msDifference =
				{
					Type = "number",
					Value = 5,
				},
				msFillAir =
				{
					Type = "number",
					Value = 1,
				},
				msImprint =
				{
					Type = "number",
					Value = 2,
				},
				msLake =
				{
					Type = "number",
					Value = 3,
				},
				msMask =
				{
					Type = "number",
					Value = 7,
				},
				msOverwrite =
				{
					Type = "number",
					Value = 0,
				},
				msSimpleCompare =
				{
					Type = "number",
					Value = 6,
				},
				msSpongePrint =
				{
					Type = "number",
					Value = 4,
				},
			},
			Enums =
			{
				BATypes =
				{
					{
						Name = "baSkyLight",
					},
					{
						Name = "baTypes",
					},
					{
						Name = "baLight",
					},
					{
						Name = "baMetas",
					},
				},
				eMergeStrategy =
				{
					{
						Name = "msSimpleCompare",
					},
					{
						Name = "msSpongePrint",
					},
					{
						Name = "msImprint",
					},
					{
						Name = "msFillAir",
					},
					{
						Name = "msLake",
					},
					{
						Name = "msMask",
					},
					{
						Name = "msOverwrite",
					},
					{
						Name = "msDifference",
					},
				},
			},
			Functions =
			{
				GetBlockTypeMeta =
				{
					{
						Params =
						{
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockY",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Name = "BLOCKTYPE",
								Type = "number",
							},
							{
								Name = "NIBBLETYPE",
								Type = "number",
							},
						},
					},
				},
				GetCoordRange =
				{
					{
						Returns =
						{
							{
								Name = "MaxX",
								Type = "number",
							},
							{
								Name = "MaxY",
								Type = "number",
							},
							{
								Name = "MaxZ",
								Type = "number",
							},
						},
					},
				},
				GetNonAirCropRelCoords =
				{
					{
						Params =
						{
							{
								IsOptional = true,
								Name = "IgnoredBlockType",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Name = "MinRelX",
								Type = "number",
							},
							{
								Name = "MinRelY",
								Type = "number",
							},
							{
								Name = "MinRelZ",
								Type = "number",
							},
							{
								Name = "MaxRelX",
								Type = "number",
							},
							{
								Name = "MaxRelY",
								Type = "number",
							},
							{
								Name = "MaxRelZ",
								Type = "number",
							},
						},
					},
				},
				GetOrigin =
				{
					{
						Returns =
						{
							{
								Name = "OriginX",
								Type = "number",
							},
							{
								Name = "OriginY",
								Type = "number",
							},
							{
								Name = "OriginZ",
								Type = "number",
							},
						},
					},
				},
				GetRelBlockTypeMeta =
				{
					{
						Params =
						{
							{
								Name = "RelBlockX",
								Type = "number",
							},
							{
								Name = "RelBlockY",
								Type = "number",
							},
							{
								Name = "RelBlockZ",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Name = "BLOCKTYPE",
								Type = "number",
							},
							{
								Name = "NIBBLETYPE",
								Type = "number",
							},
						},
					},
				},
				GetSize =
				{
					{
						Returns =
						{
							{
								Name = "SizeX",
								Type = "number",
							},
							{
								Name = "SizeY",
								Type = "number",
							},
							{
								Name = "SizeZ",
								Type = "number",
							},
						},
					},
				},
				LoadFromSchematicFile =
				{
					{
						Params =
						{
							{
								Name = "FileName",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				LoadFromSchematicString =
				{
					{
						Params =
						{
							{
								Name = "SchematicData",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				SaveToSchematicFile =
				{
					{
						Params =
						{
							{
								Name = "FileName",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				SaveToSchematicString =
				{
					{
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
				constructor =
				{
					{
						Returns =
						{
							{
								Type = "cBlockArea",
							},
						},
					},
				},
			},
		},
		cBlockEntityWithItems =
		{
			Constants =
			{
				__cBlockEntityWindowOwner__ =
				{
					Name = "__cBlockEntityWindowOwner__",
				},
			},
		},
		cBlockInfo =
		{
			Functions =
			{
				RequiresSpecialTool =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "BlockType",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
			},
			Variables =
			{
				m_BlockHeight =
				{
					Name = "m_BlockHeight",
				},
				m_CanBeTerraformed =
				{
					Name = "m_CanBeTerraformed",
				},
				m_FullyOccupiesVoxel =
				{
					Name = "m_FullyOccupiesVoxel",
				},
				m_IsSnowable =
				{
					Name = "m_IsSnowable",
				},
				m_IsSolid =
				{
					Name = "m_IsSolid",
				},
				m_LightValue =
				{
					Name = "m_LightValue",
				},
				m_OneHitDig =
				{
					Name = "m_OneHitDig",
				},
				m_PistonBreakable =
				{
					Name = "m_PistonBreakable",
				},
				m_PlaceSound =
				{
					Name = "m_PlaceSound",
				},
				m_SpreadLightFalloff =
				{
					Name = "m_SpreadLightFalloff",
				},
				m_Transparent =
				{
					Name = "m_Transparent",
				},
			},
		},
		cBoundingBox =
		{
			Functions =
			{
				CalcLineIntersection =
				{
					{
						Params =
						{
							{
								Name = "LineStart",
								Type = "Vector3d",
							},
							{
								Name = "LinePt2",
								Type = "Vector3d",
							},
						},
						Returns =
						{
							{
								Name = "DoesIntersect",
								Type = "boolean",
							},
							{
								IsOptional = true,
								Name = "LineCoeff",
								Type = "number",
							},
							{
								IsOptional = true,
								Name = "Face",
								Type = "eBlockFace",
							},
						},
					},
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "BoxMin",
								Type = "number",
							},
							{
								Name = "BoxMax",
								Type = "number",
							},
							{
								Name = "LineStart",
								Type = "Vector3d",
							},
							{
								Name = "LinePt2",
								Type = "Vector3d",
							},
						},
						Returns =
						{
							{
								Name = "DoesIntersect",
								Type = "boolean",
							},
							{
								IsOptional = true,
								Name = "LineCoeff",
								Type = "number",
							},
							{
								IsOptional = true,
								Name = "Face",
								Type = "eBlockFace",
							},
						},
					},
				},
				Intersect =
				{
					{
						Params =
						{
							{
								Name = "OtherBbox",
								Type = "cBoundingBox",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
							{
								IsOptional = true,
								Name = "Intersection",
								Type = "cBoundingBox",
							},
						},
					},
				},
				constructor =
				{
					{
						Params =
						{
							{
								Name = "MinX",
								Type = "number",
							},
							{
								Name = "MaxX",
								Type = "number",
							},
							{
								Name = "MinY",
								Type = "number",
							},
							{
								Name = "MaxY",
								Type = "number",
							},
							{
								Name = "MinZ",
								Type = "number",
							},
							{
								Name = "MaxZ",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "cBoundingBox",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "Min",
								Type = "number",
							},
							{
								Name = "Max",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "cBoundingBox",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "Pos",
								Type = "Vector3d",
							},
							{
								Name = "Radius",
								Type = "number",
							},
							{
								Name = "Height",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "cBoundingBox",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "OtherBoundingBox",
								Type = "cBoundingBox",
							},
						},
						Returns =
						{
							{
								Type = "cBoundingBox",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "Pos",
								Type = "Vector3d",
							},
							{
								Name = "CubeSideLength",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "cBoundingBox",
							},
						},
					},
				},
			},
		},
		cBrewingstandEntity =
		{
			Constants =
			{
				ContentsHeight =
				{
					Type = "number",
					Value = 1,
				},
				ContentsWidth =
				{
					Type = "number",
					Value = 4,
				},
				bsIngredient =
				{
					Type = "number",
					Value = 3,
				},
				bsLeftBottle =
				{
					Type = "number",
					Value = 0,
				},
				bsMiddleBottle =
				{
					Type = "number",
					Value = 1,
				},
				bsRightBottle =
				{
					Type = "number",
					Value = 2,
				},
			},
			Enums =
			{
				SlotIndices =
				{
					{
						Name = "bsLeftBottle",
					},
					{
						Name = "bsRightBottle",
					},
					{
						Name = "bsMiddleBottle",
					},
					{
						Name = "bsIngredient",
					},
				},
			},
		},
		cChatColor =
		{
			Constants =
			{
				Black =
				{
					Name = "Black",
					Type = "string",
					Value = "§0",
				},
				Blue =
				{
					Name = "Blue",
					Type = "string",
					Value = "§3",
				},
				Bold =
				{
					Name = "Bold",
					Type = "string",
					Value = "§l",
				},
				Color =
				{
					Name = "Color",
					Type = "string",
					Value = "§",
				},
				DarkPurple =
				{
					Name = "DarkPurple",
					Type = "string",
					Value = "§9",
				},
				Delimiter =
				{
					Name = "Delimiter",
					Type = "string",
					Value = "§",
				},
				Gold =
				{
					Name = "Gold",
					Type = "string",
					Value = "§6",
				},
				Gray =
				{
					Name = "Gray",
					Type = "string",
					Value = "§8",
				},
				Green =
				{
					Name = "Green",
					Type = "string",
					Value = "§2",
				},
				Italic =
				{
					Name = "Italic",
					Type = "string",
					Value = "§o",
				},
				LightBlue =
				{
					Name = "LightBlue",
					Type = "string",
					Value = "§b",
				},
				LightGray =
				{
					Name = "LightGray",
					Type = "string",
					Value = "§7",
				},
				LightGreen =
				{
					Name = "LightGreen",
					Type = "string",
					Value = "§a",
				},
				LightPurple =
				{
					Name = "LightPurple",
					Type = "string",
					Value = "§d",
				},
				Navy =
				{
					Name = "Navy",
					Type = "string",
					Value = "§1",
				},
				Plain =
				{
					Name = "Plain",
					Type = "string",
					Value = "§r",
				},
				Purple =
				{
					Name = "Purple",
					Type = "string",
					Value = "§5",
				},
				Random =
				{
					Name = "Random",
					Type = "string",
					Value = "§k",
				},
				Red =
				{
					Name = "Red",
					Type = "string",
					Value = "§4",
				},
				Rose =
				{
					Name = "Rose",
					Type = "string",
					Value = "§c",
				},
				Strikethrough =
				{
					Name = "Strikethrough",
					Type = "string",
					Value = "§m",
				},
				Underlined =
				{
					Name = "Underlined",
					Type = "string",
					Value = "§n",
				},
				White =
				{
					Name = "White",
					Type = "string",
					Value = "§f",
				},
				Yellow =
				{
					Name = "Yellow",
					Type = "string",
					Value = "§e",
				},
			},
		},
		cChestEntity =
		{
			Constants =
			{
				ContentsHeight =
				{
					Type = "number",
					Value = 3,
				},
				ContentsWidth =
				{
					Type = "number",
					Value = 9,
				},
			},
		},
		cChunkDesc =
		{
			Functions =
			{
				GetBlockTypeMeta =
				{
					{
						Params =
						{
							{
								Name = "RelX",
								Type = "number",
							},
							{
								Name = "RelY",
								Type = "number",
							},
							{
								Name = "RelZ",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Name = "BLOCKTYPE",
								Type = "number",
							},
							{
								Name = "NIBBLETYPE",
								Type = "number",
							},
						},
					},
				},
				IsUsingDefaultStructures =
				{
					{
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				SetUseDefaultStructures =
				{
					{
						Params =
						{
							{
								Name = "ShouldUseDefaultStructures",
								Type = "boolean",
							},
						},
					},
				},
			},
		},
		cClientHandle =
		{
			Constants =
			{
				MAX_VIEW_DISTANCE =
				{
					Type = "number",
					Value = 32,
				},
				MIN_VIEW_DISTANCE =
				{
					Type = "number",
					Value = 1,
				},
			},
			Functions =
			{
				SendPluginMessage =
				{
					{
						Params =
						{
							{
								Name = "Channel",
								Type = "string",
							},
							{
								Name = "Message",
								Type = "string",
							},
						},
					},
				},
			},
		},
		cCompositeChat =
		{
			Functions =
			{
				AddRunCommandPart =
				{
					{
						Params =
						{
							{
								Name = "Text",
								Type = "string",
							},
							{
								Name = "Command",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "Style",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "self",
							},
						},
					},
				},
				AddShowAchievementPart =
				{
					{
						Params =
						{
							{
								Name = "PlayerName",
								Type = "string",
							},
							{
								Name = "AchievementName",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "Style",
								Type = "string",
							},
						},
					},
				},
				AddSuggestCommandPart =
				{
					{
						Params =
						{
							{
								Name = "Text",
								Type = "string",
							},
							{
								Name = "Command",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "Style",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "self",
							},
						},
					},
				},
				AddTextPart =
				{
					{
						Params =
						{
							{
								Name = "Text",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "Style",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "self",
							},
						},
					},
				},
				AddUrlPart =
				{
					{
						Params =
						{
							{
								Name = "Text",
								Type = "string",
							},
							{
								Name = "Url",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "Style",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "self",
							},
						},
					},
				},
				Clear =
				{
					{
						Returns =
						{
							{
								Type = "self",
							},
						},
					},
				},
				ParseText =
				{
					{
						Params =
						{
							{
								Name = "Text",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "self",
							},
						},
					},
				},
				SetMessageType =
				{
					{
						Params =
						{
							{
								Name = "MessageType",
								Type = "eMessageType",
							},
							{
								IsOptional = true,
								Name = "AdditionalData",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "self",
							},
						},
					},
				},
				UnderlineUrls =
				{
					{
						Returns =
						{
							{
								Type = "self",
							},
						},
					},
				},
				constructor =
				{
					{
						Returns =
						{
							{
								Type = "cCompositeChat",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "Text",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "MessageType",
								Type = "eMessageType",
							},
						},
						Returns =
						{
							{
								Type = "cCompositeChat",
							},
						},
					},
				},
			},
		},
		cCraftingGrid =
		{
			Functions =
			{
				constructor =
				{
					{
						Params =
						{
							{
								Name = "Width",
								Type = "number",
							},
							{
								Name = "Height",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "cCraftingGrid",
							},
						},
					},
				},
			},
		},
		cCryptoHash =
		{
			Functions =
			{
				md5 =
				{
					{
						IsGlobal = true,
						IsStatic = true,
						Params =
						{
							{
								Name = "Data",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
				md5HexString =
				{
					{
						IsGlobal = true,
						IsStatic = true,
						Params =
						{
							{
								Name = "Data",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
				sha1 =
				{
					{
						IsGlobal = true,
						IsStatic = true,
						Params =
						{
							{
								Name = "Data",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
				sha1HexString =
				{
					{
						IsGlobal = true,
						IsStatic = true,
						Params =
						{
							{
								Name = "Data",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
			},
		},
		cCuboid =
		{
			Functions =
			{
				constructor =
				{
					{
						Returns =
						{
							{
								Type = "cCuboid",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "OtherCuboid",
								Type = "cCuboid",
							},
						},
						Returns =
						{
							{
								Type = "cCuboid",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "Point1",
								Type = "Vector3i",
							},
							{
								Name = "Point2",
								Type = "Vector3i",
							},
						},
						Returns =
						{
							{
								Type = "cCuboid",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "X",
								Type = "number",
							},
							{
								Name = "Y",
								Type = "number",
							},
							{
								Name = "Z",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "cCuboid",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "X1",
								Type = "number",
							},
							{
								Name = "Y1",
								Type = "number",
							},
							{
								Name = "Z1",
								Type = "number",
							},
							{
								Name = "X2",
								Type = "number",
							},
							{
								Name = "Y2",
								Type = "number",
							},
							{
								Name = "Z2",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "cCuboid",
							},
						},
					},
				},
			},
			Variables =
			{
				p1 =
				{
					Name = "p1",
					Type = "Vector3<int>",
				},
				p2 =
				{
					Name = "p2",
					Type = "Vector3<int>",
				},
			},
		},
		cDropSpenserEntity =
		{
			Constants =
			{
				ContentsHeight =
				{
					Type = "number",
					Value = 3,
				},
				ContentsWidth =
				{
					Type = "number",
					Value = 3,
				},
			},
			Functions =
			{
				SetRedstonePower =
				{
					{
						Params =
						{
							{
								Name = "IsPowered",
								Type = "boolean",
							},
						},
					},
				},
			},
		},
		cEnchantments =
		{
			Constants =
			{
				enchAquaAffinity =
				{
					Type = "number",
					Value = 6,
				},
				enchBaneOfArthropods =
				{
					Type = "number",
					Value = 18,
				},
				enchBlastProtection =
				{
					Type = "number",
					Value = 3,
				},
				enchDepthStrider =
				{
					Type = "number",
					Value = 8,
				},
				enchEfficiency =
				{
					Type = "number",
					Value = 32,
				},
				enchFeatherFalling =
				{
					Type = "number",
					Value = 2,
				},
				enchFireAspect =
				{
					Type = "number",
					Value = 20,
				},
				enchFireProtection =
				{
					Type = "number",
					Value = 1,
				},
				enchFlame =
				{
					Type = "number",
					Value = 50,
				},
				enchFortune =
				{
					Type = "number",
					Value = 35,
				},
				enchInfinity =
				{
					Type = "number",
					Value = 51,
				},
				enchKnockback =
				{
					Type = "number",
					Value = 19,
				},
				enchLooting =
				{
					Type = "number",
					Value = 21,
				},
				enchLuckOfTheSea =
				{
					Type = "number",
					Value = 61,
				},
				enchLure =
				{
					Type = "number",
					Value = 62,
				},
				enchPower =
				{
					Type = "number",
					Value = 48,
				},
				enchProjectileProtection =
				{
					Type = "number",
					Value = 4,
				},
				enchProtection =
				{
					Type = "number",
					Value = 0,
				},
				enchPunch =
				{
					Type = "number",
					Value = 49,
				},
				enchRespiration =
				{
					Type = "number",
					Value = 5,
				},
				enchSharpness =
				{
					Type = "number",
					Value = 16,
				},
				enchSilkTouch =
				{
					Type = "number",
					Value = 33,
				},
				enchSmite =
				{
					Type = "number",
					Value = 17,
				},
				enchThorns =
				{
					Type = "number",
					Value = 7,
				},
				enchUnbreaking =
				{
					Type = "number",
					Value = 34,
				},
			},
			Functions =
			{
				constructor =
				{
					{
						Returns =
						{
							{
								Type = "cEnchantments",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "StringSpec",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "cEnchantments",
							},
						},
					},
				},
				operator_eq =
				{
					{
						Params =
						{
							{
								Name = "OtherEnchantments",
								Type = "cEnchantments",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
			},
		},
		cEntity =
		{
			Constants =
			{
				INVALID_ID =
				{
					Type = "number",
					Value = 0,
				},
				etBoat =
				{
					Type = "number",
					Value = 7,
				},
				etEnderCrystal =
				{
					Type = "number",
					Value = 1,
				},
				etEntity =
				{
					Type = "number",
					Value = 0,
				},
				etExpOrb =
				{
					Type = "number",
					Value = 10,
				},
				etFallingBlock =
				{
					Type = "number",
					Value = 5,
				},
				etFloater =
				{
					Type = "number",
					Value = 11,
				},
				etItemFrame =
				{
					Type = "number",
					Value = 12,
				},
				etMinecart =
				{
					Type = "number",
					Value = 6,
				},
				etMob =
				{
					Type = "number",
					Value = 4,
				},
				etMonster =
				{
					Type = "number",
					Value = 4,
				},
				etPainting =
				{
					Type = "number",
					Value = 13,
				},
				etPickup =
				{
					Type = "number",
					Value = 3,
				},
				etPlayer =
				{
					Type = "number",
					Value = 2,
				},
				etProjectile =
				{
					Type = "number",
					Value = 9,
				},
				etTNT =
				{
					Type = "number",
					Value = 8,
				},
			},
			Enums =
			{
				eEntityType =
				{
					{
						Name = "etProjectile",
					},
					{
						Name = "etBoat",
					},
					{
						Name = "etItemFrame",
					},
					{
						Name = "etEntity",
					},
					{
						Name = "etMonster",
					},
					{
						Name = "etTNT",
					},
					{
						Name = "etPlayer",
					},
					{
						Name = "etExpOrb",
					},
					{
						Name = "etFloater",
					},
					{
						Name = "etPainting",
					},
					{
						Name = "etMinecart",
					},
					{
						Name = "etFallingBlock",
					},
					{
						Name = "etMob",
					},
					{
						Name = "etEnderCrystal",
					},
					{
						Name = "etPickup",
					},
				},
			},
			Functions =
			{
				GetRot =
				{
					{
						Returns =
						{
							{
								Type = "Vector3f",
							},
						},
					},
				},
				SetRot =
				{
					{
						Params =
						{
							{
								Name = "Rotation",
								Type = "Vector3f",
							},
						},
					},
				},
			},
		},
		cEntityEffect =
		{
			Constants =
			{
				effAbsorption =
				{
					Type = "number",
					Value = 22,
				},
				effBlindness =
				{
					Type = "number",
					Value = 15,
				},
				effFireResistance =
				{
					Type = "number",
					Value = 12,
				},
				effHaste =
				{
					Type = "number",
					Value = 3,
				},
				effHealthBoost =
				{
					Type = "number",
					Value = 21,
				},
				effHunger =
				{
					Type = "number",
					Value = 17,
				},
				effInstantDamage =
				{
					Type = "number",
					Value = 7,
				},
				effInstantHealth =
				{
					Type = "number",
					Value = 6,
				},
				effInvisibility =
				{
					Type = "number",
					Value = 14,
				},
				effJumpBoost =
				{
					Type = "number",
					Value = 8,
				},
				effMiningFatigue =
				{
					Type = "number",
					Value = 4,
				},
				effNausea =
				{
					Type = "number",
					Value = 9,
				},
				effNightVision =
				{
					Type = "number",
					Value = 16,
				},
				effNoEffect =
				{
					Type = "number",
					Value = 0,
				},
				effPoison =
				{
					Type = "number",
					Value = 19,
				},
				effRegeneration =
				{
					Type = "number",
					Value = 10,
				},
				effResistance =
				{
					Type = "number",
					Value = 11,
				},
				effSaturation =
				{
					Type = "number",
					Value = 23,
				},
				effSlowness =
				{
					Type = "number",
					Value = 2,
				},
				effSpeed =
				{
					Type = "number",
					Value = 1,
				},
				effStrength =
				{
					Type = "number",
					Value = 5,
				},
				effWaterBreathing =
				{
					Type = "number",
					Value = 13,
				},
				effWeakness =
				{
					Type = "number",
					Value = 18,
				},
				effWither =
				{
					Type = "number",
					Value = 20,
				},
			},
			Enums =
			{
				eType =
				{
					{
						Name = "effSlowness",
					},
					{
						Name = "effNoEffect",
					},
					{
						Name = "effHaste",
					},
					{
						Name = "effInstantHealth",
					},
					{
						Name = "effHealthBoost",
					},
					{
						Name = "effNightVision",
					},
					{
						Name = "effFireResistance",
					},
					{
						Name = "effHunger",
					},
					{
						Name = "effRegeneration",
					},
					{
						Name = "effMiningFatigue",
					},
					{
						Name = "effInvisibility",
					},
					{
						Name = "effStrength",
					},
					{
						Name = "effPoison",
					},
					{
						Name = "effInstantDamage",
					},
					{
						Name = "effBlindness",
					},
					{
						Name = "effSaturation",
					},
					{
						Name = "effWaterBreathing",
					},
					{
						Name = "effJumpBoost",
					},
					{
						Name = "effAbsorption",
					},
					{
						Name = "effResistance",
					},
					{
						Name = "effWeakness",
					},
					{
						Name = "effSpeed",
					},
					{
						Name = "effWither",
					},
					{
						Name = "effNausea",
					},
				},
			},
		},
		cFile =
		{
			Functions =
			{
				ChangeFileExt =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "FileName",
								Type = "string",
							},
							{
								Name = "NewExt",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
				Copy =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "SrcFileName",
								Type = "string",
							},
							{
								Name = "DstFileName",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "IsSuccess",
								Type = "boolean",
							},
						},
					},
				},
				CreateFolder =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "FolderPath",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "IsSuccess",
								Type = "boolean",
							},
						},
					},
				},
				CreateFolderRecursive =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "FolderPath",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "IsSuccess",
								Type = "boolean",
							},
						},
					},
				},
				Delete =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Path",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "IsSuccess",
								Type = "boolean",
							},
						},
					},
				},
				DeleteFile =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "FilePath",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "IsSuccess",
								Type = "boolean",
							},
						},
					},
				},
				DeleteFolder =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "FolderPath",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "IsSuccess",
								Type = "boolean",
							},
						},
					},
				},
				DeleteFolderContents =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "FolderPath",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "IsSuccess",
								Type = "boolean",
							},
						},
					},
				},
				Exists =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Path",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "Exists",
								Type = "boolean",
							},
						},
					},
				},
				GetFolderContents =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "FolderName",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "table",
							},
						},
					},
				},
				GetLastModificationTime =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Path",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "number",
							},
						},
					},
				},
				GetSize =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "FileName",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "number",
							},
						},
					},
				},
				IsFile =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Path",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				IsFolder =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Path",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				ReadWholeFile =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "FileName",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
				Rename =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "OrigPath",
								Type = "string",
							},
							{
								Name = "NewPath",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "IsSuccess",
								Type = "boolean",
							},
						},
					},
				},
			},
		},
		cFurnaceEntity =
		{
			Constants =
			{
				ContentsHeight =
				{
					Type = "number",
					Value = 1,
				},
				ContentsWidth =
				{
					Type = "number",
					Value = 3,
				},
				fsFuel =
				{
					Type = "number",
					Value = 1,
				},
				fsInput =
				{
					Type = "number",
					Value = 0,
				},
				fsOutput =
				{
					Type = "number",
					Value = 2,
				},
			},
			Enums =
			{
				SlotIndices =
				{
					{
						Name = "fsFuel",
					},
					{
						Name = "fsOutput",
					},
					{
						Name = "fsInput",
					},
				},
			},
		},
		cHopperEntity =
		{
			Constants =
			{
				ContentsHeight =
				{
					Type = "number",
					Value = 1,
				},
				ContentsWidth =
				{
					Type = "number",
					Value = 5,
				},
				TICKS_PER_TRANSFER =
				{
					Type = "number",
					Value = 8,
				},
			},
			Functions =
			{
				GetOutputBlockPos =
				{
					{
						Params =
						{
							{
								Name = "BlockMeta",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Name = "IsAttached",
								Type = "boolean",
							},
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockY",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
						},
					},
				},
			},
		},
		cIniFile =
		{
			Constants =
			{
				noID =
				{
					Type = "number",
					Value = -1,
				},
			},
			Functions =
			{
				constructor =
				{
					{
						Returns =
						{
							{
								Type = "cIniFile",
							},
						},
					},
				},
			},
		},
		cInventory =
		{
			Constants =
			{
				invArmorCount =
				{
					Type = "number",
					Value = 4,
				},
				invArmorOffset =
				{
					Type = "number",
					Value = 0,
				},
				invHotbarCount =
				{
					Type = "number",
					Value = 9,
				},
				invHotbarOffset =
				{
					Type = "number",
					Value = 31,
				},
				invInventoryCount =
				{
					Type = "number",
					Value = 27,
				},
				invInventoryOffset =
				{
					Type = "number",
					Value = 4,
				},
				invNumSlots =
				{
					Type = "number",
					Value = 40,
				},
			},
			Enums =
			{
				SlotIndices =
				{
					{
						Name = "invNumSlots",
					},
					{
						Name = "invInventoryCount",
					},
					{
						Name = "invHotbarCount",
					},
					{
						Name = "invArmorCount",
					},
					{
						Name = "invArmorOffset",
					},
					{
						Name = "invHotbarOffset",
					},
					{
						Name = "invInventoryOffset",
					},
				},
			},
		},
		cItem =
		{
			Functions =
			{
				constructor =
				{
					{
						Returns =
						{
							{
								Type = "cItem",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "ItemType",
								Type = "number",
							},
							{
								IsOptional = true,
								Name = "Count",
								Type = "number",
							},
							{
								IsOptional = true,
								Name = "Damage",
								Type = "number",
							},
							{
								IsOptional = true,
								Name = "EnchantmentString",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "CustomName",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "Lore",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "cItem",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "cItem",
								Type = "cItem",
							},
						},
						Returns =
						{
							{
								Type = "cItem",
							},
						},
					},
				},
			},
			Variables =
			{
				m_CustomName =
				{
					Name = "m_CustomName",
					Type = "string",
				},
				m_Enchantments =
				{
					Name = "m_Enchantments",
					Type = "cEnchantments",
				},
				m_FireworkItem =
				{
					Name = "m_FireworkItem",
					Type = "cFireworkItem",
				},
				m_ItemColor =
				{
					Name = "m_ItemColor",
					Type = "cColor",
				},
				m_ItemCount =
				{
					Name = "m_ItemCount",
					Type = "number",
				},
				m_ItemDamage =
				{
					Name = "m_ItemDamage",
					Type = "number",
				},
				m_ItemType =
				{
					Name = "m_ItemType",
					Type = "number",
				},
				m_Lore =
				{
					Name = "m_Lore",
					Type = "string",
				},
				m_RepairCost =
				{
					Name = "m_RepairCost",
					Type = "number",
				},
			},
		},
		cItemGrid =
		{
			Functions =
			{
				GetSlotCoords =
				{
					{
						Params =
						{
							{
								Name = "SlotNum",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "number",
							},
							{
								Type = "number",
							},
						},
					},
				},
			},
		},
		cItems =
		{
			Functions =
			{
				constructor =
				{
					{
						Returns =
						{
							{
								Type = "cItems",
							},
						},
					},
				},
			},
		},
		cJson =
		{
			Functions =
			{
				Parse =
				{
					{
						Params =
						{
							{
								Name = "InputString",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "table",
							},
						},
					},
				},
				Serialize =
				{
					{
						Params =
						{
							{
								Name = "table",
								Type = "table",
							},
							{
								IsOptional = true,
								Name = "options",
								Type = "table",
							},
						},
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
			},
		},
		cLineBlockTracer =
		{
			Functions =
			{
				Trace =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "World",
								Type = "cWorld",
							},
							{
								Name = "Callbacks",
								Type = "table",
							},
							{
								Name = "StartX",
								Type = "number",
							},
							{
								Name = "StartY",
								Type = "number",
							},
							{
								Name = "StartZ",
								Type = "number",
							},
							{
								Name = "EndX",
								Type = "number",
							},
							{
								Name = "EndY",
								Type = "number",
							},
							{
								Name = "EndZ",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
			},
		},
		cLuaWindow =
		{
			Functions =
			{
				SetOnClosing =
				{
					{
						Params =
						{
							{
								Name = "OnClosingCallback",
								Type = "function",
							},
						},
					},
				},
				SetOnSlotChanged =
				{
					{
						Params =
						{
							{
								Name = "OnSlotChangedCallback",
								Type = "function",
							},
						},
					},
				},
				constructor =
				{
					{
						Params =
						{
							{
								Name = "WindowType",
								Type = "cWindow#WindowType",
							},
							{
								Name = "ContentsWidth",
								Type = "number",
							},
							{
								Name = "ContentsHeight",
								Type = "number",
							},
							{
								Name = "Title",
								Type = "string",
							},
						},
					},
				},
			},
		},
		cMap =
		{
			Constants =
			{
				E_BASE_COLOR_BLUE =
				{
					Type = "number",
					Value = 48,
				},
				E_BASE_COLOR_BROWN =
				{
					Type = "number",
					Value = 40,
				},
				E_BASE_COLOR_DARK_BROWN =
				{
					Type = "number",
					Value = 52,
				},
				E_BASE_COLOR_DARK_GRAY =
				{
					Type = "number",
					Value = 44,
				},
				E_BASE_COLOR_DARK_GREEN =
				{
					Type = "number",
					Value = 28,
				},
				E_BASE_COLOR_GRAY_1 =
				{
					Type = "number",
					Value = 12,
				},
				E_BASE_COLOR_GRAY_2 =
				{
					Type = "number",
					Value = 24,
				},
				E_BASE_COLOR_LIGHT_BLUE =
				{
					Type = "number",
					Value = 5,
				},
				E_BASE_COLOR_LIGHT_BROWN =
				{
					Type = "number",
					Value = 8,
				},
				E_BASE_COLOR_LIGHT_GRAY =
				{
					Type = "number",
					Value = 36,
				},
				E_BASE_COLOR_LIGHT_GREEN =
				{
					Type = "number",
					Value = 4,
				},
				E_BASE_COLOR_PALE_BLUE =
				{
					Type = "number",
					Value = 20,
				},
				E_BASE_COLOR_RED =
				{
					Type = "number",
					Value = 16,
				},
				E_BASE_COLOR_TRANSPARENT =
				{
					Type = "number",
					Value = 0,
				},
				E_BASE_COLOR_WHITE =
				{
					Type = "number",
					Value = 32,
				},
			},
		},
		cMapManager =
		{
			Functions =
			{
				DoWithMap =
				{
					{
						Params =
						{
							{
								Name = "MapID",
								Type = "number",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				GetNumMaps =
				{
					{
						Returns =
						{
							{
								Type = "number",
							},
						},
					},
				},
			},
		},
		cMojangAPI =
		{
			Functions =
			{
				AddPlayerNameToUUIDMapping =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "PlayerName",
								Type = "string",
							},
							{
								Name = "UUID",
								Type = "string",
							},
						},
					},
				},
				GetPlayerNameFromUUID =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "UUID",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "UseOnlyCached",
								Type = "boolean",
							},
						},
						Returns =
						{
							{
								Name = "PlayerName",
								Type = "string",
							},
						},
					},
				},
				GetUUIDFromPlayerName =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "PlayerName",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "UseOnlyCached",
								Type = "boolean",
							},
						},
						Returns =
						{
							{
								Name = "UUID",
								Type = "string",
							},
						},
					},
				},
				GetUUIDsFromPlayerNames =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "PlayerNames",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "UseOnlyCached",
								Type = "boolean",
							},
						},
						Returns =
						{
							{
								Type = "table",
							},
						},
					},
				},
				MakeUUIDDashed =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "UUID",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "DashedUUID",
								Type = "string",
							},
						},
					},
				},
				MakeUUIDShort =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "UUID",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "ShortUUID",
								Type = "string",
							},
						},
					},
				},
			},
		},
		cMonster =
		{
			Constants =
			{
				mfAmbient =
				{
					Type = "number",
					Value = 2,
				},
				mfHostile =
				{
					Type = "number",
					Value = 0,
				},
				mfNoSpawn =
				{
					Type = "number",
					Value = 4,
				},
				mfPassive =
				{
					Type = "number",
					Value = 1,
				},
				mfUnhandled =
				{
					Type = "number",
					Value = 5,
				},
				mfWater =
				{
					Type = "number",
					Value = 3,
				},
			},
			Enums =
			{
				eFamily =
				{
					{
						Name = "mfNoSpawn",
					},
					{
						Name = "mfUnhandled",
					},
					{
						Name = "mfPassive",
					},
					{
						Name = "mfAmbient",
					},
					{
						Name = "mfWater",
					},
					{
						Name = "mfHostile",
					},
				},
			},
		},
		cNetwork =
		{
			Functions =
			{
				Connect =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Host",
								Type = "string",
							},
							{
								Name = "Port",
								Type = "number",
							},
							{
								Name = "LinkCallbacks",
								Type = "table",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				CreateUDPEndpoint =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Port",
								Type = "number",
							},
							{
								Name = "UDPCallbacks",
								Type = "table",
							},
						},
						Returns =
						{
							{
								Type = "cUDPEndpoint",
							},
						},
					},
				},
				EnumLocalIPAddresses =
				{
					{
						IsStatic = true,
						Returns =
						{
							{
								Type = "table",
							},
						},
					},
				},
				HostnameToIP =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Host",
								Type = "string",
							},
							{
								Name = "LookupCallbacks",
								Type = "table",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				IPToHostname =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Address",
								Type = "string",
							},
							{
								Name = "LookupCallbacks",
								Type = "table",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				Listen =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Port",
								Type = "number",
							},
							{
								Name = "ListenCallbacks",
								Type = "table",
							},
						},
						Returns =
						{
							{
								Type = "cServerHandle",
							},
						},
					},
				},
			},
		},
		cObjective =
		{
			Constants =
			{
				otAchievement =
				{
					Type = "number",
					Value = 5,
				},
				otDeathCount =
				{
					Type = "number",
					Value = 1,
				},
				otDummy =
				{
					Type = "number",
					Value = 0,
				},
				otHealth =
				{
					Type = "number",
					Value = 4,
				},
				otPlayerKillCount =
				{
					Type = "number",
					Value = 2,
				},
				otStat =
				{
					Type = "number",
					Value = 6,
				},
				otStatBlockMine =
				{
					Type = "number",
					Value = 10,
				},
				otStatEntityKill =
				{
					Type = "number",
					Value = 11,
				},
				otStatEntityKilledBy =
				{
					Type = "number",
					Value = 12,
				},
				otStatItemBreak =
				{
					Type = "number",
					Value = 9,
				},
				otStatItemCraft =
				{
					Type = "number",
					Value = 7,
				},
				otStatItemUse =
				{
					Type = "number",
					Value = 8,
				},
				otTotalKillCount =
				{
					Type = "number",
					Value = 3,
				},
			},
		},
		cPainting =
		{
			Functions =
			{
				GetDirection =
				{
					{
						Returns =
						{
							{
								Type = "number",
							},
						},
					},
				},
			},
		},
		cPawn =
		{
			Functions =
			{
				GetHealth =
				{
					{
						Returns =
						{
							{
								Type = "number",
							},
						},
					},
				},
			},
		},
		cPlayer =
		{
			Constants =
			{
				EATING_TICKS =
				{
					Name = "EATING_TICKS",
					Type = "number",
					Value = 30,
				},
				MAX_FOOD_LEVEL =
				{
					Name = "MAX_FOOD_LEVEL",
					Type = "number",
					Value = 20,
				},
				MAX_HEALTH =
				{
					Name = "MAX_HEALTH",
					Type = "number",
					Value = 20,
				},
			},
			Functions =
			{
				FoodPoison =
				{
					{
						Params =
						{
							{
								Name = "NumTicks",
								Type = "number",
							},
						},
					},
				},
				GetPermissions =
				{
					{
						Returns =
						{
							{
								Type = "table",
							},
						},
					},
				},
				GetResolvedPermissions =
				{
					{
						Returns =
						{
							{
								Type = "table",
							},
						},
					},
				},
				MoveTo =
				{
					{
						Params =
						{
							{
								Name = "NewPosition",
								Type = "Vector3d",
							},
						},
					},
				},
				PermissionMatches =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Permission",
								Type = "string",
							},
							{
								Name = "Template",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				SetFoodPoisonedTicksRemaining =
				{
					{
						Params =
						{
							{
								Name = "FoodPoisonedTicksRemaining",
								Type = "number",
							},
						},
					},
				},
			},
		},
		cPlugin =
		{
			Functions =
			{
				GetDirectory =
				{
					{
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
			},
		},
		cPluginLua =
		{
			Functions =
			{
				AddWebTab =
				{
					{
						Params =
						{
							{
								Name = "Title",
								Type = "string",
							},
							{
								Name = "HandlerFn",
								Type = "function",
							},
						},
					},
				},
			},
		},
		cPluginManager =
		{
			Constants =
			{
				HOOK_BLOCK_SPREAD =
				{
					Type = "number",
					Value = 0,
				},
				HOOK_BLOCK_TO_PICKUPS =
				{
					Type = "number",
					Value = 1,
				},
				HOOK_BREWING_COMPLETED =
				{
					Type = "number",
					Value = 3,
				},
				HOOK_BREWING_COMPLETING =
				{
					Type = "number",
					Value = 2,
				},
				HOOK_CHAT =
				{
					Type = "number",
					Value = 4,
				},
				HOOK_CHUNK_AVAILABLE =
				{
					Type = "number",
					Value = 5,
				},
				HOOK_CHUNK_GENERATED =
				{
					Type = "number",
					Value = 6,
				},
				HOOK_CHUNK_GENERATING =
				{
					Type = "number",
					Value = 7,
				},
				HOOK_CHUNK_UNLOADED =
				{
					Type = "number",
					Value = 8,
				},
				HOOK_CHUNK_UNLOADING =
				{
					Type = "number",
					Value = 9,
				},
				HOOK_COLLECTING_PICKUP =
				{
					Type = "number",
					Value = 10,
				},
				HOOK_CRAFTING_NO_RECIPE =
				{
					Type = "number",
					Value = 11,
				},
				HOOK_DISCONNECT =
				{
					Type = "number",
					Value = 12,
				},
				HOOK_ENTITY_ADD_EFFECT =
				{
					Type = "number",
					Value = 14,
				},
				HOOK_ENTITY_CHANGED_WORLD =
				{
					Type = "number",
					Value = 16,
				},
				HOOK_ENTITY_CHANGING_WORLD =
				{
					Type = "number",
					Value = 15,
				},
				HOOK_ENTITY_TELEPORT =
				{
					Type = "number",
					Value = 42,
				},
				HOOK_EXECUTE_COMMAND =
				{
					Type = "number",
					Value = 17,
				},
				HOOK_EXPLODED =
				{
					Type = "number",
					Value = 18,
				},
				HOOK_EXPLODING =
				{
					Type = "number",
					Value = 19,
				},
				HOOK_HANDSHAKE =
				{
					Type = "number",
					Value = 20,
				},
				HOOK_HOPPER_PULLING_ITEM =
				{
					Type = "number",
					Value = 21,
				},
				HOOK_HOPPER_PUSHING_ITEM =
				{
					Type = "number",
					Value = 22,
				},
				HOOK_KILLED =
				{
					Type = "number",
					Value = 23,
				},
				HOOK_KILLING =
				{
					Type = "number",
					Value = 24,
				},
				HOOK_LOGIN =
				{
					Type = "number",
					Value = 25,
				},
				HOOK_PLAYER_ANIMATION =
				{
					Type = "number",
					Value = 13,
				},
				HOOK_PLAYER_BREAKING_BLOCK =
				{
					Type = "number",
					Value = 26,
				},
				HOOK_PLAYER_BROKEN_BLOCK =
				{
					Type = "number",
					Value = 27,
				},
				HOOK_PLAYER_DESTROYED =
				{
					Type = "number",
					Value = 28,
				},
				HOOK_PLAYER_EATING =
				{
					Type = "number",
					Value = 29,
				},
				HOOK_PLAYER_FISHED =
				{
					Type = "number",
					Value = 30,
				},
				HOOK_PLAYER_FISHING =
				{
					Type = "number",
					Value = 31,
				},
				HOOK_PLAYER_FOOD_LEVEL_CHANGE =
				{
					Type = "number",
					Value = 32,
				},
				HOOK_PLAYER_JOINED =
				{
					Type = "number",
					Value = 33,
				},
				HOOK_PLAYER_LEFT_CLICK =
				{
					Type = "number",
					Value = 34,
				},
				HOOK_PLAYER_MOVING =
				{
					Type = "number",
					Value = 35,
				},
				HOOK_PLAYER_PLACED_BLOCK =
				{
					Type = "number",
					Value = 36,
				},
				HOOK_PLAYER_PLACING_BLOCK =
				{
					Type = "number",
					Value = 37,
				},
				HOOK_PLAYER_RIGHT_CLICK =
				{
					Type = "number",
					Value = 38,
				},
				HOOK_PLAYER_RIGHT_CLICKING_ENTITY =
				{
					Type = "number",
					Value = 39,
				},
				HOOK_PLAYER_SHOOTING =
				{
					Type = "number",
					Value = 40,
				},
				HOOK_PLAYER_SPAWNED =
				{
					Type = "number",
					Value = 41,
				},
				HOOK_PLAYER_TOSSING_ITEM =
				{
					Type = "number",
					Value = 43,
				},
				HOOK_PLAYER_USED_BLOCK =
				{
					Type = "number",
					Value = 44,
				},
				HOOK_PLAYER_USED_ITEM =
				{
					Type = "number",
					Value = 45,
				},
				HOOK_PLAYER_USING_BLOCK =
				{
					Type = "number",
					Value = 46,
				},
				HOOK_PLAYER_USING_ITEM =
				{
					Type = "number",
					Value = 47,
				},
				HOOK_PLUGINS_LOADED =
				{
					Type = "number",
					Value = 49,
				},
				HOOK_PLUGIN_MESSAGE =
				{
					Type = "number",
					Value = 48,
				},
				HOOK_POST_CRAFTING =
				{
					Type = "number",
					Value = 50,
				},
				HOOK_PRE_CRAFTING =
				{
					Type = "number",
					Value = 51,
				},
				HOOK_PROJECTILE_HIT_BLOCK =
				{
					Type = "number",
					Value = 52,
				},
				HOOK_PROJECTILE_HIT_ENTITY =
				{
					Type = "number",
					Value = 53,
				},
				HOOK_SERVER_PING =
				{
					Type = "number",
					Value = 54,
				},
				HOOK_SPAWNED_ENTITY =
				{
					Type = "number",
					Value = 55,
				},
				HOOK_SPAWNED_MONSTER =
				{
					Type = "number",
					Value = 56,
				},
				HOOK_SPAWNING_ENTITY =
				{
					Type = "number",
					Value = 57,
				},
				HOOK_SPAWNING_MONSTER =
				{
					Type = "number",
					Value = 58,
				},
				HOOK_TAKE_DAMAGE =
				{
					Type = "number",
					Value = 59,
				},
				HOOK_TICK =
				{
					Type = "number",
					Value = 60,
				},
				HOOK_UPDATED_SIGN =
				{
					Type = "number",
					Value = 61,
				},
				HOOK_UPDATING_SIGN =
				{
					Type = "number",
					Value = 62,
				},
				HOOK_WEATHER_CHANGED =
				{
					Type = "number",
					Value = 63,
				},
				HOOK_WEATHER_CHANGING =
				{
					Type = "number",
					Value = 64,
				},
				HOOK_WORLD_STARTED =
				{
					Type = "number",
					Value = 65,
				},
				HOOK_WORLD_TICK =
				{
					Type = "number",
					Value = 66,
				},
				crBlocked =
				{
					Type = "number",
					Value = 3,
				},
				crError =
				{
					Type = "number",
					Value = 2,
				},
				crExecuted =
				{
					Type = "number",
					Value = 0,
				},
				crNoPermission =
				{
					Type = "number",
					Value = 4,
				},
				crUnknownCommand =
				{
					Type = "number",
					Value = 1,
				},
				psDisabled =
				{
					Type = "number",
					Value = 1,
				},
				psError =
				{
					Type = "number",
					Value = 3,
				},
				psLoaded =
				{
					Type = "number",
					Value = 0,
				},
				psNotFound =
				{
					Type = "number",
					Value = 4,
				},
				psUnloaded =
				{
					Type = "number",
					Value = 2,
				},
			},
			Enums =
			{
				CommandResult =
				{
					{
						Name = "crError",
					},
					{
						Name = "crBlocked",
					},
					{
						Name = "crNoPermission",
					},
					{
						Name = "crExecuted",
					},
					{
						Name = "crUnknownCommand",
					},
				},
				PluginHook =
				{
					{
						Name = "HOOK_CHUNK_GENERATED",
					},
					{
						Name = "HOOK_UPDATING_SIGN",
					},
					{
						Name = "HOOK_PLAYER_FISHING",
					},
					{
						Name = "HOOK_PLAYER_BROKEN_BLOCK",
					},
					{
						Name = "HOOK_HOPPER_PUSHING_ITEM",
					},
					{
						Name = "HOOK_SPAWNED_MONSTER",
					},
					{
						Name = "HOOK_WORLD_STARTED",
					},
					{
						Name = "HOOK_PLAYER_BREAKING_BLOCK",
					},
					{
						Name = "HOOK_HANDSHAKE",
					},
					{
						Name = "HOOK_PLAYER_PLACING_BLOCK",
					},
					{
						Name = "HOOK_BLOCK_SPREAD",
					},
					{
						Name = "HOOK_PLAYER_USED_BLOCK",
					},
					{
						Name = "HOOK_PLAYER_EATING",
					},
					{
						Name = "HOOK_BREWING_COMPLETING",
					},
					{
						Name = "HOOK_COLLECTING_PICKUP",
					},
					{
						Name = "HOOK_CHUNK_GENERATING",
					},
					{
						Name = "HOOK_WEATHER_CHANGING",
					},
					{
						Name = "HOOK_PLAYER_SPAWNED",
					},
					{
						Name = "HOOK_PLAYER_SHOOTING",
					},
					{
						Name = "HOOK_PRE_CRAFTING",
					},
					{
						Name = "HOOK_PLAYER_USING_BLOCK",
					},
					{
						Name = "HOOK_ENTITY_CHANGED_WORLD",
					},
					{
						Name = "HOOK_SPAWNING_ENTITY",
					},
					{
						Name = "HOOK_BREWING_COMPLETED",
					},
					{
						Name = "HOOK_PLAYER_USED_ITEM",
					},
					{
						Name = "HOOK_BLOCK_TO_PICKUPS",
					},
					{
						Name = "HOOK_CHUNK_UNLOADING",
					},
					{
						Name = "HOOK_TAKE_DAMAGE",
					},
					{
						Name = "HOOK_ENTITY_ADD_EFFECT",
					},
					{
						Name = "HOOK_EXPLODED",
					},
					{
						Name = "HOOK_PROJECTILE_HIT_BLOCK",
					},
					{
						Name = "HOOK_CHUNK_AVAILABLE",
					},
					{
						Name = "HOOK_SPAWNING_MONSTER",
					},
					{
						Name = "HOOK_KILLING",
					},
					{
						Name = "HOOK_PLAYER_USING_ITEM",
					},
					{
						Name = "HOOK_PLAYER_LEFT_CLICK",
					},
					{
						Name = "HOOK_PROJECTILE_HIT_ENTITY",
					},
					{
						Name = "HOOK_PLAYER_DESTROYED",
					},
					{
						Name = "HOOK_DISCONNECT",
					},
					{
						Name = "HOOK_EXPLODING",
					},
					{
						Name = "HOOK_POST_CRAFTING",
					},
					{
						Name = "HOOK_CHUNK_UNLOADED",
					},
					{
						Name = "HOOK_HOPPER_PULLING_ITEM",
					},
					{
						Name = "HOOK_ENTITY_TELEPORT",
					},
					{
						Name = "HOOK_PLAYER_RIGHT_CLICK",
					},
					{
						Name = "HOOK_EXECUTE_COMMAND",
					},
					{
						Name = "HOOK_PLAYER_FISHED",
					},
					{
						Name = "HOOK_SERVER_PING",
					},
					{
						Name = "HOOK_UPDATED_SIGN",
					},
					{
						Name = "HOOK_CRAFTING_NO_RECIPE",
					},
					{
						Name = "HOOK_LOGIN",
					},
					{
						Name = "HOOK_PLAYER_FOOD_LEVEL_CHANGE",
					},
					{
						Name = "HOOK_PLAYER_JOINED",
					},
					{
						Name = "HOOK_PLAYER_RIGHT_CLICKING_ENTITY",
					},
					{
						Name = "HOOK_CHAT",
					},
					{
						Name = "HOOK_PLUGINS_LOADED",
					},
					{
						Name = "HOOK_SPAWNED_ENTITY",
					},
					{
						Name = "HOOK_WEATHER_CHANGED",
					},
					{
						Name = "HOOK_TICK",
					},
					{
						Name = "HOOK_PLAYER_PLACED_BLOCK",
					},
					{
						Name = "HOOK_KILLED",
					},
					{
						Name = "HOOK_PLAYER_ANIMATION",
					},
					{
						Name = "HOOK_PLAYER_TOSSING_ITEM",
					},
					{
						Name = "HOOK_PLUGIN_MESSAGE",
					},
					{
						Name = "HOOK_PLAYER_MOVING",
					},
					{
						Name = "HOOK_ENTITY_CHANGING_WORLD",
					},
					{
						Name = "HOOK_WORLD_TICK",
					},
				},
				ePluginStatus =
				{
					{
						Name = "psDisabled",
					},
					{
						Name = "psLoaded",
					},
					{
						Name = "psUnloaded",
					},
					{
						Name = "psError",
					},
					{
						Name = "psNotFound",
					},
				},
			},
			Functions =
			{
				AddHook =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "HookType",
								Type = "cPluginManager#PluginHook",
							},
							{
								IsOptional = true,
								Name = "Callback",
								Type = "function",
							},
						},
					},
				},
				BindCommand =
				{
					{
						Params =
						{
							{
								Name = "Command",
								Type = "string",
							},
							{
								Name = "Permission",
								Type = "string",
							},
							{
								Name = "Callback",
								Type = "function",
							},
							{
								Name = "HelpString",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Command",
								Type = "string",
							},
							{
								Name = "Permission",
								Type = "string",
							},
							{
								Name = "Callback",
								Type = "function",
							},
							{
								Name = "HelpString",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				BindConsoleCommand =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Command",
								Type = "string",
							},
							{
								Name = "Callback",
								Type = "function",
							},
							{
								Name = "HelpString",
								Type = "string",
							},
						},
						Returns =
						{
							{
								IsOptional = true,
								Type = "boolean",
							},
						},
					},
					{
						Params =
						{
							{
								Name = "Command",
								Type = "string",
							},
							{
								Name = "Callback",
								Type = "function",
							},
							{
								Name = "HelpString",
								Type = "string",
							},
						},
						Returns =
						{
							{
								IsOptional = true,
								Type = "boolean",
							},
						},
					},
				},
				CallPlugin =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "PluginName",
								Type = "string",
							},
							{
								Name = "FunctionName",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "FunctionArgs...",
								Type = "...",
							},
						},
						Returns =
						{
							{
								IsOptional = true,
								Name = "FunctionRets",
								Type = "...",
							},
						},
					},
				},
				DoWithPlugin =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "PluginName",
								Type = "string",
							},
							{
								Name = "CallbackFn",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				ExecuteConsoleCommand =
				{
					{
						Params =
						{
							{
								Name = "CommandStr",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
							{
								Type = "string",
							},
						},
					},
				},
				ForEachCommand =
				{
					{
						Params =
						{
							{
								Name = "CallbackFn",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				ForEachConsoleCommand =
				{
					{
						Params =
						{
							{
								Name = "CallbackFn",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				ForEachPlugin =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "CallbackFn",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				GetAllPlugins =
				{
					{
						Returns =
						{
							{
								Type = "table",
							},
						},
					},
				},
				GetCurrentPlugin =
				{
					{
						Returns =
						{
							{
								Type = "cPlugin",
							},
						},
					},
				},
				GetPlugin =
				{
					{
						Params =
						{
							{
								Name = "PluginName",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "cPlugin",
							},
						},
					},
				},
				LogStackTrace =
				{
					{
						IsStatic = true,
					},
				},
			},
		},
		cProjectileEntity =
		{
			Constants =
			{
				pkArrow =
				{
					Type = "number",
					Value = 60,
				},
				pkEgg =
				{
					Type = "number",
					Value = 62,
				},
				pkEnderPearl =
				{
					Type = "number",
					Value = 65,
				},
				pkExpBottle =
				{
					Type = "number",
					Value = 75,
				},
				pkFireCharge =
				{
					Type = "number",
					Value = 64,
				},
				pkFirework =
				{
					Type = "number",
					Value = 76,
				},
				pkFishingFloat =
				{
					Type = "number",
					Value = 90,
				},
				pkGhastFireball =
				{
					Type = "number",
					Value = 63,
				},
				pkSnowball =
				{
					Type = "number",
					Value = 61,
				},
				pkSplashPotion =
				{
					Type = "number",
					Value = 73,
				},
				pkWitherSkull =
				{
					Type = "number",
					Value = 66,
				},
			},
			Enums =
			{
				eKind =
				{
					{
						Name = "pkArrow",
					},
					{
						Name = "pkFirework",
					},
					{
						Name = "pkEnderPearl",
					},
					{
						Name = "pkFishingFloat",
					},
					{
						Name = "pkEgg",
					},
					{
						Name = "pkFireCharge",
					},
					{
						Name = "pkSnowball",
					},
					{
						Name = "pkExpBottle",
					},
					{
						Name = "pkWitherSkull",
					},
					{
						Name = "pkSplashPotion",
					},
					{
						Name = "pkGhastFireball",
					},
				},
			},
			Functions =
			{
				GetCreator =
				{
					{
						Returns =
						{
							{
								Type = "cEntity",
							},
						},
					},
				},
			},
		},
		cRankManager =
		{
			Functions =
			{
				AddGroup =
				{
					{
						Params =
						{
							{
								Name = "GroupName",
								Type = "string",
							},
						},
					},
				},
				AddGroupToRank =
				{
					{
						Params =
						{
							{
								Name = "GroupName",
								Type = "string",
							},
							{
								Name = "RankName",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				AddPermissionToGroup =
				{
					{
						Params =
						{
							{
								Name = "Permission",
								Type = "string",
							},
							{
								Name = "GroupName",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				AddRank =
				{
					{
						Params =
						{
							{
								Name = "RankName",
								Type = "string",
							},
							{
								Name = "MsgPrefix",
								Type = "string",
							},
							{
								Name = "MsgSuffix",
								Type = "string",
							},
							{
								Name = "MsgNameColorCode",
								Type = "string",
							},
						},
					},
				},
				GetAllGroups =
				{
					{
						Returns =
						{
							{
								Type = "table",
							},
						},
					},
				},
				GetAllPermissions =
				{
					{
						Returns =
						{
							{
								Type = "table",
							},
						},
					},
				},
				GetAllPlayerUUIDs =
				{
					{
						Returns =
						{
							{
								Type = "table",
							},
						},
					},
				},
				GetAllRanks =
				{
					{
						Returns =
						{
							{
								Type = "table",
							},
						},
					},
				},
				GetDefaultRank =
				{
					{
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
				GetGroupPermissions =
				{
					{
						Params =
						{
							{
								Name = "GroupName",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "table",
							},
						},
					},
				},
				GetPlayerGroups =
				{
					{
						Params =
						{
							{
								Name = "PlayerUUID",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "table",
							},
						},
					},
				},
				GetPlayerMsgVisuals =
				{
					{
						Params =
						{
							{
								Name = "PlayerUUID",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "MsgPrefix",
								Type = "string",
							},
							{
								Name = "MsgSuffix",
								Type = "string",
							},
							{
								Name = "MsgNameColorCode",
								Type = "string",
							},
						},
					},
				},
				GetPlayerName =
				{
					{
						Params =
						{
							{
								Name = "PlayerUUID",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "PlayerName",
								Type = "string",
							},
						},
					},
				},
				GetPlayerPermissions =
				{
					{
						Params =
						{
							{
								Name = "PlayerUUID",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "table",
							},
						},
					},
				},
				GetPlayerRankName =
				{
					{
						Params =
						{
							{
								Name = "PlayerUUID",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "RankName",
								Type = "string",
							},
						},
					},
				},
				GetRankGroups =
				{
					{
						Params =
						{
							{
								Name = "RankName",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "table",
							},
						},
					},
				},
				GetRankPermissions =
				{
					{
						Params =
						{
							{
								Name = "RankName",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "table",
							},
						},
					},
				},
				GetRankVisuals =
				{
					{
						Params =
						{
							{
								Name = "RankName",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "MsgPrefix",
								Type = "string",
							},
							{
								Name = "MsgSuffix",
								Type = "string",
							},
							{
								Name = "MsgNameColorCode",
								Type = "string",
							},
						},
					},
				},
				GroupExists =
				{
					{
						Params =
						{
							{
								Name = "GroupName",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				IsGroupInRank =
				{
					{
						Params =
						{
							{
								Name = "GroupName",
								Type = "string",
							},
							{
								Name = "RankName",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				IsPermissionInGroup =
				{
					{
						Params =
						{
							{
								Name = "Permission",
								Type = "string",
							},
							{
								Name = "GroupName",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				IsPlayerRankSet =
				{
					{
						Params =
						{
							{
								Name = "PlayerUUID",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				RankExists =
				{
					{
						Params =
						{
							{
								Name = "RankName",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				RemoveGroup =
				{
					{
						Params =
						{
							{
								Name = "GroupName",
								Type = "string",
							},
						},
					},
				},
				RemoveGroupFromRank =
				{
					{
						Params =
						{
							{
								Name = "GroupName",
								Type = "string",
							},
							{
								Name = "RankName",
								Type = "string",
							},
						},
					},
				},
				RemovePermissionFromGroup =
				{
					{
						Params =
						{
							{
								Name = "Permission",
								Type = "string",
							},
							{
								Name = "GroupName",
								Type = "string",
							},
						},
					},
				},
				RemovePlayerRank =
				{
					{
						Params =
						{
							{
								Name = "PlayerUUID",
								Type = "string",
							},
						},
					},
				},
				RemoveRank =
				{
					{
						Params =
						{
							{
								Name = "RankName",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "ReplacementRankName",
								Type = "string",
							},
						},
					},
				},
				RenameGroup =
				{
					{
						Params =
						{
							{
								Name = "OldName",
								Type = "string",
							},
							{
								Name = "NewName",
								Type = "string",
							},
						},
					},
				},
				RenameRank =
				{
					{
						Params =
						{
							{
								Name = "OldName",
								Type = "string",
							},
							{
								Name = "NewName",
								Type = "string",
							},
						},
					},
				},
				SetDefaultRank =
				{
					{
						Params =
						{
							{
								Name = "RankName",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				SetPlayerRank =
				{
					{
						Params =
						{
							{
								Name = "PlayerUUID",
								Type = "string",
							},
							{
								Name = "PlayerName",
								Type = "string",
							},
							{
								Name = "RankName",
								Type = "string",
							},
						},
					},
				},
				SetRankVisuals =
				{
					{
						Params =
						{
							{
								Name = "RankName",
								Type = "string",
							},
							{
								Name = "MsgPrefix",
								Type = "string",
							},
							{
								Name = "MsgSuffix",
								Type = "string",
							},
							{
								Name = "MsgNameColorCode",
								Type = "string",
							},
						},
					},
				},
			},
		},
		cRoot =
		{
			Functions =
			{
				DoWithPlayerByUUID =
				{
					{
						Params =
						{
							{
								Name = "PlayerUUID",
								Type = "string",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				FindAndDoWithPlayer =
				{
					{
						Params =
						{
							{
								Name = "PlayerName",
								Type = "string",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				ForEachPlayer =
				{
					{
						Params =
						{
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
					},
				},
				ForEachWorld =
				{
					{
						Params =
						{
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
					},
				},
				GetBrewingRecipe =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Bottle",
								Type = "cItem",
							},
							{
								Name = "Ingredient",
								Type = "cItem",
							},
						},
						Returns =
						{
							{
								Type = "cItem",
							},
						},
					},
				},
				GetBuildCommitID =
				{
					{
						IsStatic = true,
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
				GetBuildDateTime =
				{
					{
						IsStatic = true,
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
				GetBuildID =
				{
					{
						IsStatic = true,
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
				GetBuildSeriesName =
				{
					{
						IsStatic = true,
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
				GetFurnaceRecipe =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "InItem",
								Type = "cItem",
							},
						},
						Returns =
						{
							{
								Name = "OutItem",
								Type = "cItem",
							},
							{
								Name = "NumTicks",
								Type = "number",
							},
							{
								Name = "InItem",
								Type = "cItem",
							},
						},
					},
				},
				GetPrimaryServerVersion =
				{
					{
						Returns =
						{
							{
								Type = "number",
							},
						},
					},
				},
				SetPrimaryServerVersion =
				{
					{
						Params =
						{
							{
								Name = "Protocol Version",
								Type = "number",
							},
						},
					},
				},
			},
		},
		cScoreboard =
		{
			Constants =
			{
				dsCount =
				{
					Type = "number",
					Value = 3,
				},
				dsList =
				{
					Type = "number",
					Value = 0,
				},
				dsName =
				{
					Type = "number",
					Value = 2,
				},
				dsSidebar =
				{
					Type = "number",
					Value = 1,
				},
			},
			Functions =
			{
				ForEachObjective =
				{
					{
						Params =
						{
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				ForEachTeam =
				{
					{
						Params =
						{
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				GetTeamNames =
				{
					{
						Returns =
						{
							{
								Type = "table",
							},
						},
					},
				},
			},
		},
		cServerHandle =
		{
			Functions =
			{
				IsListening =
				{
					{
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
			},
		},
		cStringCompression =
		{
			Functions =
			{
				CompressStringGZIP =
				{
					{
						Params =
						{
							{
								Name = "Data",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
				CompressStringZLIB =
				{
					{
						Params =
						{
							{
								Name = "Data",
								Type = "string",
							},
							{
								Name = "factor",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
				InflateString =
				{
					{
						Params =
						{
							{
								Name = "Data",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
				UncompressStringGZIP =
				{
					{
						Params =
						{
							{
								Name = "Data",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
				UncompressStringZLIB =
				{
					{
						Params =
						{
							{
								Name = "Data",
								Type = "string",
							},
							{
								Name = "UncompressedLength",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
			},
		},
		cTCPLink =
		{
			Functions =
			{
				GetLocalIP =
				{
					{
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
				GetLocalPort =
				{
					{
						Returns =
						{
							{
								Type = "number",
							},
						},
					},
				},
				GetRemoteIP =
				{
					{
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
				GetRemotePort =
				{
					{
						Returns =
						{
							{
								Type = "number",
							},
						},
					},
				},
				Send =
				{
					{
						Params =
						{
							{
								Name = "Data",
								Type = "string",
							},
						},
					},
				},
				StartTLSClient =
				{
					{
						Params =
						{
							{
								Name = "OwnCert",
								Type = "string",
							},
							{
								Name = "OwnPrivateKey",
								Type = "string",
							},
							{
								Name = "OwnPrivateKeyPassword",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "IsSuccess",
								Type = "boolean",
							},
							{
								IsOptional = true,
								Name = "ErrorMessage",
								Type = "string",
							},
						},
					},
				},
				StartTLSServer =
				{
					{
						Params =
						{
							{
								Name = "Certificate",
								Type = "string",
							},
							{
								Name = "PrivateKey",
								Type = "string",
							},
							{
								Name = "PrivateKeyPassword",
								Type = "string",
							},
							{
								Name = "StartTLSData",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "IsSuccess",
								Type = "boolean",
							},
							{
								IsOptional = true,
								Name = "ErrorMessage",
								Type = "string",
							},
						},
					},
				},
			},
		},
		cTracer =
		{
			Variables =
			{
				BlockHitPosition =
				{
					Name = "BlockHitPosition",
				},
				HitNormal =
				{
					Name = "HitNormal",
				},
				RealHit =
				{
					Name = "RealHit",
				},
			},
		},
		cUDPEndpoint =
		{
			Functions =
			{
				GetPort =
				{
					{
						Returns =
						{
							{
								Type = "number",
							},
						},
					},
				},
				IsOpen =
				{
					{
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				Send =
				{
					{
						Params =
						{
							{
								Name = "RawData",
								Type = "string",
							},
							{
								Name = "RemoteHost",
								Type = "string",
							},
							{
								Name = "RemotePort",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
			},
		},
		cUrlClient =
		{
			Functions =
			{
				Delete =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "URL",
								Type = "string",
							},
							{
								Name = "Callbacks",
								Type = "table",
							},
							{
								IsOptional = true,
								Name = "Headers",
								Type = "table",
							},
							{
								IsOptional = true,
								Name = "RequestBody",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "Options",
								Type = "table",
							},
						},
						Returns =
						{
							{
								Name = "IsSuccess",
								Type = "boolean",
							},
							{
								IsOptional = true,
								Name = "ErrorMessagge",
								Type = "string",
							},
						},
					},
				},
				Get =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "URL",
								Type = "string",
							},
							{
								Name = "Callbacks",
								Type = "table",
							},
							{
								IsOptional = true,
								Name = "Headers",
								Type = "table",
							},
							{
								IsOptional = true,
								Name = "RequestBody",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "Options",
								Type = "table",
							},
						},
						Returns =
						{
							{
								Name = "IsSuccess",
								Type = "boolean",
							},
							{
								IsOptional = true,
								Name = "ErrMsg",
								Type = "string",
							},
						},
					},
				},
				Post =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "URL",
								Type = "string",
							},
							{
								Name = "Callbacks",
								Type = "table",
							},
							{
								IsOptional = true,
								Name = "Headers",
								Type = "table",
							},
							{
								IsOptional = true,
								Name = "RequestBody",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "Options",
								Type = "table",
							},
						},
						Returns =
						{
							{
								Name = "IsSuccess",
								Type = "boolean",
							},
							{
								IsOptional = true,
								Name = "ErrMsg",
								Type = "string",
							},
						},
					},
				},
				Put =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "URL",
								Type = "string",
							},
							{
								Name = "Callbacks",
								Type = "table",
							},
							{
								IsOptional = true,
								Name = "Headers",
								Type = "table",
							},
							{
								IsOptional = true,
								Name = "RequestBody",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "Options",
								Type = "table",
							},
						},
						Returns =
						{
							{
								Name = "IsSuccess",
								Type = "boolean",
							},
							{
								IsOptional = true,
								Name = "ErrMsg",
								Type = "string",
							},
						},
					},
				},
				Request =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Method",
								Type = "string",
							},
							{
								Name = "URL",
								Type = "string",
							},
							{
								Name = "Callbacks",
								Type = "table",
							},
							{
								IsOptional = true,
								Name = "Headers",
								Type = "table",
							},
							{
								IsOptional = true,
								Name = "RequestBody",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "Options",
								Type = "table",
							},
						},
						Returns =
						{
							{
								Name = "IsSuccess",
								Type = "boolean",
							},
							{
								IsOptional = true,
								Name = "ErrMsg",
								Type = "string",
							},
						},
					},
				},
			},
		},
		cUrlParser =
		{
			Functions =
			{
				GetDefaultPort =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Scheme",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "number",
							},
						},
					},
				},
				IsKnownScheme =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Scheme",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				Parse =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "URL",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "Scheme",
								Type = "string",
							},
							{
								Name = "Username",
								Type = "string",
							},
							{
								Name = "Password",
								Type = "string",
							},
							{
								Name = "Host",
								Type = "string",
							},
							{
								Name = "Port",
								Type = "string",
							},
							{
								Name = "Path",
								Type = "string",
							},
							{
								Name = "Query",
								Type = "string",
							},
							{
								Name = "Fragment",
								Type = "string",
							},
						},
					},
				},
				ParseAuthorityPart =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "AuthPart",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "Username",
								Type = "string",
							},
							{
								Name = "Password",
								Type = "string",
							},
							{
								Name = "Host",
								Type = "string",
							},
							{
								Name = "Port",
								Type = "string",
							},
						},
					},
				},
			},
		},
		cWebAdmin =
		{
			Functions =
			{
				AddWebTab =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Title",
								Type = "string",
							},
							{
								Name = "UrlPath",
								Type = "string",
							},
							{
								Name = "HandlerFn",
								Type = "function",
							},
						},
					},
				},
				GetAllWebTabs =
				{
					{
						IsStatic = true,
						Returns =
						{
							{
								Type = "table",
							},
						},
					},
				},
				GetBaseURL =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "URL",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
				GetContentTypeFromFileExt =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "FileExt",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
				GetHTMLEscapedString =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Input",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
				GetPage =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Request",
								Type = "HTTPRequest",
							},
						},
						Returns =
						{
							{
								Type = "table",
							},
						},
					},
				},
				GetURLEncodedString =
				{
					{
						IsStatic = true,
						Params =
						{
							{
								Name = "Input",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
			},
		},
		cWindow =
		{
			Constants =
			{
				wtAnimalChest =
				{
					Type = "number",
					Value = 11,
				},
				wtAnvil =
				{
					Type = "number",
					Value = 8,
				},
				wtBeacon =
				{
					Type = "number",
					Value = 7,
				},
				wtBrewery =
				{
					Type = "number",
					Value = 5,
				},
				wtChest =
				{
					Type = "number",
					Value = 0,
				},
				wtDropSpenser =
				{
					Type = "number",
					Value = 3,
				},
				wtDropper =
				{
					Type = "number",
					Value = 10,
				},
				wtEnchantment =
				{
					Type = "number",
					Value = 4,
				},
				wtFurnace =
				{
					Type = "number",
					Value = 2,
				},
				wtHopper =
				{
					Type = "number",
					Value = 9,
				},
				wtInventory =
				{
					Type = "number",
					Value = -1,
				},
				wtNPCTrade =
				{
					Type = "number",
					Value = 6,
				},
				wtWorkbench =
				{
					Type = "number",
					Value = 1,
				},
			},
			Enums =
			{
				WindowType =
				{
					{
						Name = "wtFurnace",
					},
					{
						Name = "wtBrewery",
					},
					{
						Name = "wtBeacon",
					},
					{
						Name = "wtAnvil",
					},
					{
						Name = "wtInventory",
					},
					{
						Name = "wtAnimalChest",
					},
					{
						Name = "wtChest",
					},
					{
						Name = "wtWorkbench",
					},
					{
						Name = "wtNPCTrade",
					},
					{
						Name = "wtDropper",
					},
					{
						Name = "wtEnchantment",
					},
					{
						Name = "wtHopper",
					},
					{
						Name = "wtDropSpenser",
					},
				},
			},
		},
		cWorld =
		{
			Constants =
			{
				__cBroadcastInterface__ =
				{
					Name = "__cBroadcastInterface__",
				},
				__cWorldInterface__ =
				{
					Name = "__cWorldInterface__",
				},
			},
			Functions =
			{
				BroadcastParticleEffect =
				{
					{
						Params =
						{
							{
								Name = "ParticleName",
								Type = "string",
							},
							{
								Name = "X",
								Type = "number",
							},
							{
								Name = "Y",
								Type = "number",
							},
							{
								Name = "Z",
								Type = "number",
							},
							{
								Name = "OffsetX",
								Type = "number",
							},
							{
								Name = "OffsetY",
								Type = "number",
							},
							{
								Name = "OffsetZ",
								Type = "number",
							},
							{
								Name = "ParticleData",
								Type = "number",
							},
							{
								Name = "ParticleAmount",
								Type = "number",
							},
							{
								IsOptional = true,
								Name = "ExcludeClient",
								Type = "cClientHandle",
							},
						},
					},
				},
				ChunkStay =
				{
					{
						Params =
						{
							{
								Name = "ChunkCoordTable",
								Type = "table",
							},
							{
								Name = "OnChunkAvailable",
								Type = "function",
							},
							{
								Name = "OnAllChunksAvailable",
								Type = "function",
							},
						},
					},
				},
				DoExplosionAt =
				{
					{
						Params =
						{
							{
								Name = "Force",
								Type = "number",
							},
							{
								Name = "X",
								Type = "number",
							},
							{
								Name = "Y",
								Type = "number",
							},
							{
								Name = "Z",
								Type = "number",
							},
							{
								Name = "CanCauseFire",
								Type = "boolean",
							},
							{
								Name = "Source",
								Type = "eExplosionSource",
							},
							{
								Name = "SourceData",
								Type = "any",
							},
						},
					},
				},
				DoWithBeaconAt =
				{
					{
						Params =
						{
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockY",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				DoWithBlockEntityAt =
				{
					{
						Params =
						{
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockY",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				DoWithBrewingstandAt =
				{
					{
						Params =
						{
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockY",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				DoWithChestAt =
				{
					{
						Params =
						{
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockY",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				DoWithCommandBlockAt =
				{
					{
						Params =
						{
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockY",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				DoWithDispenserAt =
				{
					{
						Params =
						{
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockY",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				DoWithDropSpenserAt =
				{
					{
						Params =
						{
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockY",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				DoWithDropperAt =
				{
					{
						Params =
						{
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockY",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				DoWithEntityByID =
				{
					{
						Params =
						{
							{
								Name = "EntityID",
								Type = "number",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				DoWithFlowerPotAt =
				{
					{
						Params =
						{
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockY",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				DoWithFurnaceAt =
				{
					{
						Params =
						{
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockY",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				DoWithMobHeadAt =
				{
					{
						Params =
						{
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockY",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				DoWithNoteBlockAt =
				{
					{
						Params =
						{
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockY",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				DoWithPlayer =
				{
					{
						Params =
						{
							{
								Name = "PlayerName",
								Type = "string",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				DoWithPlayerByUUID =
				{
					{
						Params =
						{
							{
								Name = "PlayerUUID",
								Type = "string",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				FindAndDoWithPlayer =
				{
					{
						Params =
						{
							{
								Name = "PlayerName",
								Type = "string",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				ForEachBlockEntityInChunk =
				{
					{
						Params =
						{
							{
								Name = "ChunkX",
								Type = "number",
							},
							{
								Name = "ChunkZ",
								Type = "number",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				ForEachBrewingstandInChunk =
				{
					{
						Params =
						{
							{
								Name = "ChunkX",
								Type = "number",
							},
							{
								Name = "ChunkZ",
								Type = "number",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				ForEachChestInChunk =
				{
					{
						Params =
						{
							{
								Name = "ChunkX",
								Type = "number",
							},
							{
								Name = "ChunkZ",
								Type = "number",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				ForEachEntity =
				{
					{
						Params =
						{
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				ForEachEntityInBox =
				{
					{
						Params =
						{
							{
								Name = "Box",
								Type = "cBoundingBox",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				ForEachEntityInChunk =
				{
					{
						Params =
						{
							{
								Name = "ChunkX",
								Type = "number",
							},
							{
								Name = "ChunkZ",
								Type = "number",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				ForEachFurnaceInChunk =
				{
					{
						Params =
						{
							{
								Name = "ChunkX",
								Type = "number",
							},
							{
								Name = "ChunkZ",
								Type = "number",
							},
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				ForEachPlayer =
				{
					{
						Params =
						{
							{
								Name = "CallbackFunction",
								Type = "function",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				GetBlockInfo =
				{
					{
						Params =
						{
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockY",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Name = "IsBlockValid",
								Type = "boolean",
							},
							{
								Name = "BlockType",
								Type = "number",
							},
							{
								Name = "BlockMeta",
								Type = "number",
							},
							{
								Name = "BlockSkyLight",
								Type = "number",
							},
							{
								Name = "BlockBlockLight",
								Type = "number",
							},
						},
					},
				},
				GetBlockTypeMeta =
				{
					{
						Params =
						{
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockY",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Name = "IsBlockValid",
								Type = "boolean",
							},
							{
								Name = "BlockType",
								Type = "number",
							},
							{
								Name = "BlockMeta",
								Type = "number",
							},
						},
					},
				},
				GetSignLines =
				{
					{
						Params =
						{
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockY",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Name = "IsValid",
								Type = "boolean",
							},
							{
								IsOptional = true,
								Name = "Line1",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "Line2",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "Line3",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "Line4",
								Type = "string",
							},
						},
					},
				},
				PrepareChunk =
				{
					{
						Params =
						{
							{
								Name = "ChunkX",
								Type = "number",
							},
							{
								Name = "ChunkZ",
								Type = "number",
							},
							{
								IsOptional = true,
								Name = "Callback",
								Type = "function",
							},
						},
					},
				},
				QueueSetBlock =
				{
					{
						Params =
						{
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockY",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
							{
								Name = "BlockType",
								Type = "number",
							},
							{
								Name = "BlockMeta",
								Type = "number",
							},
							{
								Name = "TickDelay",
								Type = "number",
							},
						},
					},
				},
				QueueTask =
				{
					{
						Params =
						{
							{
								Name = "TaskFunction",
								Type = "function",
							},
						},
					},
				},
				ScheduleTask =
				{
					{
						Params =
						{
							{
								Name = "DelayTicks",
								Type = "number",
							},
							{
								Name = "TaskFunction",
								Type = "function",
							},
						},
					},
				},
				SetSignLines =
				{
					{
						Params =
						{
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockY",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
							{
								Name = "Line1",
								Type = "string",
							},
							{
								Name = "Line2",
								Type = "string",
							},
							{
								Name = "Line3",
								Type = "string",
							},
							{
								Name = "Line4",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "Player",
								Type = "cPlayer",
							},
						},
					},
				},
				TryGetHeight =
				{
					{
						Params =
						{
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
						},
						Returns =
						{
							{
								Name = "IsValid",
								Type = "boolean",
							},
							{
								Name = "Height",
								Type = "number",
							},
						},
					},
				},
				UpdateSign =
				{
					{
						Params =
						{
							{
								Name = "BlockX",
								Type = "number",
							},
							{
								Name = "BlockY",
								Type = "number",
							},
							{
								Name = "BlockZ",
								Type = "number",
							},
							{
								Name = "Line1",
								Type = "string",
							},
							{
								Name = "Line2",
								Type = "string",
							},
							{
								Name = "Line3",
								Type = "string",
							},
							{
								Name = "Line4",
								Type = "string",
							},
							{
								IsOptional = true,
								Name = "Player",
								Type = "cPlayer",
							},
						},
					},
				},
			},
		},
		lxp =
		{
			Constants =
			{
				_COPYRIGHT =
				{
					Type = "string",
					Value = "Copyright (C) 2003-2012 Kepler Project",
				},
				_DESCRIPTION =
				{
					Type = "string",
					Value = "LuaExpat is a SAX XML parser based on the Expat library",
				},
				_VERSION =
				{
					Type = "string",
					Value = "LuaExpat 1.3.0",
				},
			},
			Functions =
			{
				new =
				{
					{
						Params =
						{
							{
								Name = "CallbacksTable",
								Type = "table",
							},
							{
								IsOptional = true,
								Name = "SeparatorChar",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "XMLParser object",
								Type = "table",
							},
						},
					},
				},
			},
		},
		sqlite3 =
		{
			Constants =
			{
				ABORT =
				{
					Type = "number",
					Value = 4,
				},
				ALTER_TABLE =
				{
					Type = "number",
					Value = 26,
				},
				ANALYZE =
				{
					Type = "number",
					Value = 28,
				},
				ATTACH =
				{
					Type = "number",
					Value = 24,
				},
				BLOB =
				{
					Type = "number",
					Value = 4,
				},
				BUSY =
				{
					Type = "number",
					Value = 5,
				},
				CANTOPEN =
				{
					Type = "number",
					Value = 14,
				},
				CONSTRAINT =
				{
					Type = "number",
					Value = 19,
				},
				CORRUPT =
				{
					Type = "number",
					Value = 11,
				},
				CREATE_INDEX =
				{
					Type = "number",
					Value = 1,
				},
				CREATE_TABLE =
				{
					Type = "number",
					Value = 2,
				},
				CREATE_TEMP_INDEX =
				{
					Type = "number",
					Value = 3,
				},
				CREATE_TEMP_TABLE =
				{
					Type = "number",
					Value = 4,
				},
				CREATE_TEMP_TRIGGER =
				{
					Type = "number",
					Value = 5,
				},
				CREATE_TEMP_VIEW =
				{
					Type = "number",
					Value = 6,
				},
				CREATE_TRIGGER =
				{
					Type = "number",
					Value = 7,
				},
				CREATE_VIEW =
				{
					Type = "number",
					Value = 8,
				},
				CREATE_VTABLE =
				{
					Type = "number",
					Value = 29,
				},
				DELETE =
				{
					Type = "number",
					Value = 9,
				},
				DETACH =
				{
					Type = "number",
					Value = 25,
				},
				DONE =
				{
					Type = "number",
					Value = 101,
				},
				DROP_INDEX =
				{
					Type = "number",
					Value = 10,
				},
				DROP_TABLE =
				{
					Type = "number",
					Value = 11,
				},
				DROP_TEMP_INDEX =
				{
					Type = "number",
					Value = 12,
				},
				DROP_TEMP_TABLE =
				{
					Type = "number",
					Value = 13,
				},
				DROP_TEMP_TRIGGER =
				{
					Type = "number",
					Value = 14,
				},
				DROP_TEMP_VIEW =
				{
					Type = "number",
					Value = 15,
				},
				DROP_TRIGGER =
				{
					Type = "number",
					Value = 16,
				},
				DROP_VIEW =
				{
					Type = "number",
					Value = 17,
				},
				DROP_VTABLE =
				{
					Type = "number",
					Value = 30,
				},
				EMPTY =
				{
					Type = "number",
					Value = 16,
				},
				ERROR =
				{
					Type = "number",
					Value = 1,
				},
				FLOAT =
				{
					Type = "number",
					Value = 2,
				},
				FORMAT =
				{
					Type = "number",
					Value = 24,
				},
				FULL =
				{
					Type = "number",
					Value = 13,
				},
				FUNCTION =
				{
					Type = "number",
					Value = 31,
				},
				INSERT =
				{
					Type = "number",
					Value = 18,
				},
				INTEGER =
				{
					Type = "number",
					Value = 1,
				},
				INTERNAL =
				{
					Type = "number",
					Value = 2,
				},
				INTERRUPT =
				{
					Type = "number",
					Value = 9,
				},
				IOERR =
				{
					Type = "number",
					Value = 10,
				},
				LOCKED =
				{
					Type = "number",
					Value = 6,
				},
				MISMATCH =
				{
					Type = "number",
					Value = 20,
				},
				MISUSE =
				{
					Type = "number",
					Value = 21,
				},
				NOLFS =
				{
					Type = "number",
					Value = 22,
				},
				NOMEM =
				{
					Type = "number",
					Value = 7,
				},
				NOTADB =
				{
					Type = "number",
					Value = 26,
				},
				NOTFOUND =
				{
					Type = "number",
					Value = 12,
				},
				NULL =
				{
					Type = "number",
					Value = 5,
				},
				OK =
				{
					Type = "number",
					Value = 0,
				},
				PERM =
				{
					Type = "number",
					Value = 3,
				},
				PRAGMA =
				{
					Type = "number",
					Value = 19,
				},
				PROTOCOL =
				{
					Type = "number",
					Value = 15,
				},
				RANGE =
				{
					Type = "number",
					Value = 25,
				},
				READ =
				{
					Type = "number",
					Value = 20,
				},
				READONLY =
				{
					Type = "number",
					Value = 8,
				},
				REINDEX =
				{
					Type = "number",
					Value = 27,
				},
				ROW =
				{
					Type = "number",
					Value = 100,
				},
				SAVEPOINT =
				{
					Type = "number",
					Value = 32,
				},
				SCHEMA =
				{
					Type = "number",
					Value = 17,
				},
				SELECT =
				{
					Type = "number",
					Value = 21,
				},
				TEXT =
				{
					Type = "number",
					Value = 3,
				},
				TOOBIG =
				{
					Type = "number",
					Value = 18,
				},
				TRANSACTION =
				{
					Type = "number",
					Value = 22,
				},
				UPDATE =
				{
					Type = "number",
					Value = 23,
				},
			},
			Functions =
			{
				complete =
				{
					{
						IsGlobal = true,
						IsStatic = true,
						Params =
						{
							{
								Name = "SQL",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Type = "boolean",
							},
						},
					},
				},
				open =
				{
					{
						IsGlobal = true,
						IsStatic = true,
						Params =
						{
							{
								Name = "FileName",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "DBClass",
								Type = "SQLite DB object",
							},
						},
					},
				},
				open_memory =
				{
					{
						IsGlobal = true,
						IsStatic = true,
						Returns =
						{
							{
								Name = "DBClass",
								Type = "SQLite DB object",
							},
						},
					},
				},
				version =
				{
					{
						IsGlobal = true,
						IsStatic = true,
						Returns =
						{
							{
								Type = "string",
							},
						},
					},
				},
			},
		},
		tolua =
		{
			Functions =
			{
				cast =
				{
					{
						IsGlobal = true,
						IsStatic = true,
						Params =
						{
							{
								Name = "Object",
								Type = "any",
							},
							{
								Name = "TypeStr",
								Type = "string",
							},
						},
						Returns =
						{
							{
								Name = "Object",
								Type = "any",
							},
						},
					},
				},
				type =
				{
					{
						IsGlobal = true,
						IsStatic = true,
						Params =
						{
							{
								Name = "Object",
								Type = "any",
							},
						},
						Returns =
						{
							{
								Name = "TypeStr",
								Type = "string",
							},
						},
					},
				},
			},
		},
	},
	Globals =
	{
		Constants =
		{
			BLOCK_FACE_BOTTOM =
			{
				Type = "number",
				Value = 0,
			},
			BLOCK_FACE_EAST =
			{
				Type = "number",
				Value = 5,
			},
			BLOCK_FACE_MAX =
			{
				Type = "number",
				Value = 5,
			},
			BLOCK_FACE_MIN =
			{
				Type = "number",
				Value = -1,
			},
			BLOCK_FACE_NONE =
			{
				Type = "number",
				Value = -1,
			},
			BLOCK_FACE_NORTH =
			{
				Type = "number",
				Value = 2,
			},
			BLOCK_FACE_SOUTH =
			{
				Type = "number",
				Value = 3,
			},
			BLOCK_FACE_TOP =
			{
				Type = "number",
				Value = 1,
			},
			BLOCK_FACE_WEST =
			{
				Type = "number",
				Value = 4,
			},
			BLOCK_FACE_XM =
			{
				Type = "number",
				Value = 4,
			},
			BLOCK_FACE_XP =
			{
				Type = "number",
				Value = 5,
			},
			BLOCK_FACE_YM =
			{
				Type = "number",
				Value = 0,
			},
			BLOCK_FACE_YP =
			{
				Type = "number",
				Value = 1,
			},
			BLOCK_FACE_ZM =
			{
				Type = "number",
				Value = 2,
			},
			BLOCK_FACE_ZP =
			{
				Type = "number",
				Value = 3,
			},
			DIG_STATUS_CANCELLED =
			{
				Type = "number",
				Value = 1,
			},
			DIG_STATUS_DROP_HELD =
			{
				Type = "number",
				Value = 4,
			},
			DIG_STATUS_DROP_STACK =
			{
				Type = "number",
				Value = 3,
			},
			DIG_STATUS_FINISHED =
			{
				Type = "number",
				Value = 2,
			},
			DIG_STATUS_SHOOT_EAT =
			{
				Type = "number",
				Value = 5,
			},
			DIG_STATUS_STARTED =
			{
				Type = "number",
				Value = 0,
			},
			DIG_STATUS_SWAP_ITEM_IN_HAND =
			{
				Type = "number",
				Value = 6,
			},
			E_BLOCK_ACACIA_DOOR =
			{
				Type = "number",
				Value = 196,
			},
			E_BLOCK_ACACIA_FENCE =
			{
				Type = "number",
				Value = 192,
			},
			E_BLOCK_ACACIA_FENCE_GATE =
			{
				Type = "number",
				Value = 187,
			},
			E_BLOCK_ACACIA_WOOD_STAIRS =
			{
				Type = "number",
				Value = 163,
			},
			E_BLOCK_ACTIVATOR_RAIL =
			{
				Type = "number",
				Value = 157,
			},
			E_BLOCK_ACTIVE_COMPARATOR =
			{
				Type = "number",
				Value = 150,
			},
			E_BLOCK_AIR =
			{
				Type = "number",
				Value = 0,
			},
			E_BLOCK_ANVIL =
			{
				Type = "number",
				Value = 145,
			},
			E_BLOCK_ANVIL_HIGH_DAMAGE =
			{
				Type = "number",
				Value = 8,
			},
			E_BLOCK_ANVIL_LOW_DAMAGE =
			{
				Type = "number",
				Value = 4,
			},
			E_BLOCK_ANVIL_NO_DAMAGE =
			{
				Type = "number",
				Value = 0,
			},
			E_BLOCK_ANVIL_X =
			{
				Type = "number",
				Value = 1,
			},
			E_BLOCK_ANVIL_Z =
			{
				Type = "number",
				Value = 0,
			},
			E_BLOCK_BARRIER =
			{
				Type = "number",
				Value = 166,
			},
			E_BLOCK_BEACON =
			{
				Type = "number",
				Value = 138,
			},
			E_BLOCK_BED =
			{
				Type = "number",
				Value = 26,
			},
			E_BLOCK_BEDROCK =
			{
				Type = "number",
				Value = 7,
			},
			E_BLOCK_BED_BED_HEAD =
			{
				Type = "number",
				Value = 8,
			},
			E_BLOCK_BED_OCCUPIED =
			{
				Type = "number",
				Value = 4,
			},
			E_BLOCK_BED_XM =
			{
				Type = "number",
				Value = 1,
			},
			E_BLOCK_BED_XP =
			{
				Type = "number",
				Value = 3,
			},
			E_BLOCK_BED_ZM =
			{
				Type = "number",
				Value = 2,
			},
			E_BLOCK_BED_ZP =
			{
				Type = "number",
				Value = 0,
			},
			E_BLOCK_BIG_FLOWER =
			{
				Type = "number",
				Value = 175,
			},
			E_BLOCK_BIRCH_DOOR =
			{
				Type = "number",
				Value = 194,
			},
			E_BLOCK_BIRCH_FENCE =
			{
				Type = "number",
				Value = 189,
			},
			E_BLOCK_BIRCH_FENCE_GATE =
			{
				Type = "number",
				Value = 184,
			},
			E_BLOCK_BIRCH_WOOD_STAIRS =
			{
				Type = "number",
				Value = 135,
			},
			E_BLOCK_BLOCK_OF_COAL =
			{
				Type = "number",
				Value = 173,
			},
			E_BLOCK_BLOCK_OF_REDSTONE =
			{
				Type = "number",
				Value = 152,
			},
			E_BLOCK_BOOKCASE =
			{
				Type = "number",
				Value = 47,
			},
			E_BLOCK_BREWING_STAND =
			{
				Type = "number",
				Value = 117,
			},
			E_BLOCK_BRICK =
			{
				Type = "number",
				Value = 45,
			},
			E_BLOCK_BRICK_STAIRS =
			{
				Type = "number",
				Value = 108,
			},
			E_BLOCK_BROWN_MUSHROOM =
			{
				Type = "number",
				Value = 39,
			},
			E_BLOCK_BURNING_FURNACE =
			{
				Type = "number",
				Value = 62,
			},
			E_BLOCK_BUTTON_PRESSED =
			{
				Type = "number",
				Value = 8,
			},
			E_BLOCK_BUTTON_XM =
			{
				Type = "number",
				Value = 2,
			},
			E_BLOCK_BUTTON_XP =
			{
				Type = "number",
				Value = 1,
			},
			E_BLOCK_BUTTON_YM =
			{
				Type = "number",
				Value = 0,
			},
			E_BLOCK_BUTTON_YP =
			{
				Type = "number",
				Value = 5,
			},
			E_BLOCK_BUTTON_ZM =
			{
				Type = "number",
				Value = 4,
			},
			E_BLOCK_BUTTON_ZP =
			{
				Type = "number",
				Value = 3,
			},
			E_BLOCK_CACTUS =
			{
				Type = "number",
				Value = 81,
			},
			E_BLOCK_CAKE =
			{
				Type = "number",
				Value = 92,
			},
			E_BLOCK_CARPET =
			{
				Type = "number",
				Value = 171,
			},
			E_BLOCK_CARROTS =
			{
				Type = "number",
				Value = 141,
			},
			E_BLOCK_CAULDRON =
			{
				Type = "number",
				Value = 118,
			},
			E_BLOCK_CHEST =
			{
				Type = "number",
				Value = 54,
			},
			E_BLOCK_CLAY =
			{
				Type = "number",
				Value = 82,
			},
			E_BLOCK_COAL_ORE =
			{
				Type = "number",
				Value = 16,
			},
			E_BLOCK_COBBLESTONE =
			{
				Type = "number",
				Value = 4,
			},
			E_BLOCK_COBBLESTONE_STAIRS =
			{
				Type = "number",
				Value = 67,
			},
			E_BLOCK_COBBLESTONE_WALL =
			{
				Type = "number",
				Value = 139,
			},
			E_BLOCK_COBWEB =
			{
				Type = "number",
				Value = 30,
			},
			E_BLOCK_COCOA_POD =
			{
				Type = "number",
				Value = 127,
			},
			E_BLOCK_COMMAND_BLOCK =
			{
				Type = "number",
				Value = 137,
			},
			E_BLOCK_CRAFTING_TABLE =
			{
				Type = "number",
				Value = 58,
			},
			E_BLOCK_CROPS =
			{
				Type = "number",
				Value = 59,
			},
			E_BLOCK_DANDELION =
			{
				Type = "number",
				Value = 37,
			},
			E_BLOCK_DARK_OAK_DOOR =
			{
				Type = "number",
				Value = 197,
			},
			E_BLOCK_DARK_OAK_FENCE =
			{
				Type = "number",
				Value = 191,
			},
			E_BLOCK_DARK_OAK_FENCE_GATE =
			{
				Type = "number",
				Value = 186,
			},
			E_BLOCK_DARK_OAK_WOOD_STAIRS =
			{
				Type = "number",
				Value = 164,
			},
			E_BLOCK_DAYLIGHT_SENSOR =
			{
				Type = "number",
				Value = 151,
			},
			E_BLOCK_DEAD_BUSH =
			{
				Type = "number",
				Value = 32,
			},
			E_BLOCK_DETECTOR_RAIL =
			{
				Type = "number",
				Value = 28,
			},
			E_BLOCK_DIAMOND_BLOCK =
			{
				Type = "number",
				Value = 57,
			},
			E_BLOCK_DIAMOND_ORE =
			{
				Type = "number",
				Value = 56,
			},
			E_BLOCK_DIRT =
			{
				Type = "number",
				Value = 3,
			},
			E_BLOCK_DISPENSER =
			{
				Type = "number",
				Value = 23,
			},
			E_BLOCK_DOUBLE_RED_SANDSTONE_SLAB =
			{
				Type = "number",
				Value = 181,
			},
			E_BLOCK_DOUBLE_STONE_SLAB =
			{
				Type = "number",
				Value = 43,
			},
			E_BLOCK_DOUBLE_WOODEN_SLAB =
			{
				Type = "number",
				Value = 125,
			},
			E_BLOCK_DRAGON_EGG =
			{
				Type = "number",
				Value = 122,
			},
			E_BLOCK_DROPPER =
			{
				Type = "number",
				Value = 158,
			},
			E_BLOCK_EMERALD_BLOCK =
			{
				Type = "number",
				Value = 133,
			},
			E_BLOCK_EMERALD_ORE =
			{
				Type = "number",
				Value = 129,
			},
			E_BLOCK_ENCHANTMENT_TABLE =
			{
				Type = "number",
				Value = 116,
			},
			E_BLOCK_ENDER_CHEST =
			{
				Type = "number",
				Value = 130,
			},
			E_BLOCK_END_PORTAL =
			{
				Type = "number",
				Value = 119,
			},
			E_BLOCK_END_PORTAL_FRAME =
			{
				Type = "number",
				Value = 120,
			},
			E_BLOCK_END_STONE =
			{
				Type = "number",
				Value = 121,
			},
			E_BLOCK_FARMLAND =
			{
				Type = "number",
				Value = 60,
			},
			E_BLOCK_FENCE =
			{
				Type = "number",
				Value = 85,
			},
			E_BLOCK_FENCE_GATE =
			{
				Type = "number",
				Value = 107,
			},
			E_BLOCK_FIRE =
			{
				Type = "number",
				Value = 51,
			},
			E_BLOCK_FLOWER =
			{
				Type = "number",
				Value = 38,
			},
			E_BLOCK_FLOWER_POT =
			{
				Type = "number",
				Value = 140,
			},
			E_BLOCK_FURNACE =
			{
				Type = "number",
				Value = 61,
			},
			E_BLOCK_GLASS =
			{
				Type = "number",
				Value = 20,
			},
			E_BLOCK_GLASS_PANE =
			{
				Type = "number",
				Value = 102,
			},
			E_BLOCK_GLOWSTONE =
			{
				Type = "number",
				Value = 89,
			},
			E_BLOCK_GOLD_BLOCK =
			{
				Type = "number",
				Value = 41,
			},
			E_BLOCK_GOLD_ORE =
			{
				Type = "number",
				Value = 14,
			},
			E_BLOCK_GRASS =
			{
				Type = "number",
				Value = 2,
			},
			E_BLOCK_GRAVEL =
			{
				Type = "number",
				Value = 13,
			},
			E_BLOCK_HARDENED_CLAY =
			{
				Type = "number",
				Value = 172,
			},
			E_BLOCK_HAY_BALE =
			{
				Type = "number",
				Value = 170,
			},
			E_BLOCK_HEAD =
			{
				Type = "number",
				Value = 144,
			},
			E_BLOCK_HEAVY_WEIGHTED_PRESSURE_PLATE =
			{
				Type = "number",
				Value = 148,
			},
			E_BLOCK_HOPPER =
			{
				Type = "number",
				Value = 154,
			},
			E_BLOCK_HUGE_BROWN_MUSHROOM =
			{
				Type = "number",
				Value = 99,
			},
			E_BLOCK_HUGE_RED_MUSHROOM =
			{
				Type = "number",
				Value = 100,
			},
			E_BLOCK_ICE =
			{
				Type = "number",
				Value = 79,
			},
			E_BLOCK_INACTIVE_COMPARATOR =
			{
				Type = "number",
				Value = 149,
			},
			E_BLOCK_INVERTED_DAYLIGHT_SENSOR =
			{
				Type = "number",
				Value = 178,
			},
			E_BLOCK_IRON_BARS =
			{
				Type = "number",
				Value = 101,
			},
			E_BLOCK_IRON_BLOCK =
			{
				Type = "number",
				Value = 42,
			},
			E_BLOCK_IRON_DOOR =
			{
				Type = "number",
				Value = 71,
			},
			E_BLOCK_IRON_ORE =
			{
				Type = "number",
				Value = 15,
			},
			E_BLOCK_IRON_TRAPDOOR =
			{
				Type = "number",
				Value = 167,
			},
			E_BLOCK_JACK_O_LANTERN =
			{
				Type = "number",
				Value = 91,
			},
			E_BLOCK_JUKEBOX =
			{
				Type = "number",
				Value = 84,
			},
			E_BLOCK_JUNGLE_DOOR =
			{
				Type = "number",
				Value = 195,
			},
			E_BLOCK_JUNGLE_FENCE =
			{
				Type = "number",
				Value = 190,
			},
			E_BLOCK_JUNGLE_FENCE_GATE =
			{
				Type = "number",
				Value = 185,
			},
			E_BLOCK_JUNGLE_WOOD_STAIRS =
			{
				Type = "number",
				Value = 136,
			},
			E_BLOCK_LADDER =
			{
				Type = "number",
				Value = 65,
			},
			E_BLOCK_LAPIS_BLOCK =
			{
				Type = "number",
				Value = 22,
			},
			E_BLOCK_LAPIS_ORE =
			{
				Type = "number",
				Value = 21,
			},
			E_BLOCK_LAVA =
			{
				Type = "number",
				Value = 10,
			},
			E_BLOCK_LEAVES =
			{
				Type = "number",
				Value = 18,
			},
			E_BLOCK_LEVER =
			{
				Type = "number",
				Value = 69,
			},
			E_BLOCK_LIGHT_WEIGHTED_PRESSURE_PLATE =
			{
				Type = "number",
				Value = 147,
			},
			E_BLOCK_LILY_PAD =
			{
				Type = "number",
				Value = 111,
			},
			E_BLOCK_LIT_FURNACE =
			{
				Type = "number",
				Value = 62,
			},
			E_BLOCK_LOG =
			{
				Type = "number",
				Value = 17,
			},
			E_BLOCK_MAX_TYPE_ID =
			{
				Type = "number",
				Value = 197,
			},
			E_BLOCK_MELON =
			{
				Type = "number",
				Value = 103,
			},
			E_BLOCK_MELON_STEM =
			{
				Type = "number",
				Value = 105,
			},
			E_BLOCK_MINECART_TRACKS =
			{
				Type = "number",
				Value = 66,
			},
			E_BLOCK_MOB_SPAWNER =
			{
				Type = "number",
				Value = 52,
			},
			E_BLOCK_MOSSY_COBBLESTONE =
			{
				Type = "number",
				Value = 48,
			},
			E_BLOCK_MYCELIUM =
			{
				Type = "number",
				Value = 110,
			},
			E_BLOCK_NETHERRACK =
			{
				Type = "number",
				Value = 87,
			},
			E_BLOCK_NETHER_BRICK =
			{
				Type = "number",
				Value = 112,
			},
			E_BLOCK_NETHER_BRICK_FENCE =
			{
				Type = "number",
				Value = 113,
			},
			E_BLOCK_NETHER_BRICK_STAIRS =
			{
				Type = "number",
				Value = 114,
			},
			E_BLOCK_NETHER_PORTAL =
			{
				Type = "number",
				Value = 90,
			},
			E_BLOCK_NETHER_QUARTZ_ORE =
			{
				Type = "number",
				Value = 153,
			},
			E_BLOCK_NETHER_WART =
			{
				Type = "number",
				Value = 115,
			},
			E_BLOCK_NEW_LEAVES =
			{
				Type = "number",
				Value = 161,
			},
			E_BLOCK_NEW_LOG =
			{
				Type = "number",
				Value = 162,
			},
			E_BLOCK_NOTE_BLOCK =
			{
				Type = "number",
				Value = 25,
			},
			E_BLOCK_NUMBER_OF_TYPES =
			{
				Type = "number",
				Value = 198,
			},
			E_BLOCK_OAK_DOOR =
			{
				Type = "number",
				Value = 64,
			},
			E_BLOCK_OAK_FENCE_GATE =
			{
				Type = "number",
				Value = 107,
			},
			E_BLOCK_OAK_WOOD_STAIRS =
			{
				Type = "number",
				Value = 53,
			},
			E_BLOCK_OBSIDIAN =
			{
				Type = "number",
				Value = 49,
			},
			E_BLOCK_PACKED_ICE =
			{
				Type = "number",
				Value = 174,
			},
			E_BLOCK_PISTON =
			{
				Type = "number",
				Value = 33,
			},
			E_BLOCK_PISTON_EXTENSION =
			{
				Type = "number",
				Value = 34,
			},
			E_BLOCK_PISTON_MOVED_BLOCK =
			{
				Type = "number",
				Value = 36,
			},
			E_BLOCK_PLANKS =
			{
				Type = "number",
				Value = 5,
			},
			E_BLOCK_POTATOES =
			{
				Type = "number",
				Value = 142,
			},
			E_BLOCK_POWERED_RAIL =
			{
				Type = "number",
				Value = 27,
			},
			E_BLOCK_PRISMARINE_BLOCK =
			{
				Type = "number",
				Value = 168,
			},
			E_BLOCK_PUMPKIN =
			{
				Type = "number",
				Value = 86,
			},
			E_BLOCK_PUMPKIN_STEM =
			{
				Type = "number",
				Value = 104,
			},
			E_BLOCK_QUARTZ_BLOCK =
			{
				Type = "number",
				Value = 155,
			},
			E_BLOCK_QUARTZ_STAIRS =
			{
				Type = "number",
				Value = 156,
			},
			E_BLOCK_RAIL =
			{
				Type = "number",
				Value = 66,
			},
			E_BLOCK_REDSTONE_LAMP_OFF =
			{
				Type = "number",
				Value = 123,
			},
			E_BLOCK_REDSTONE_LAMP_ON =
			{
				Type = "number",
				Value = 124,
			},
			E_BLOCK_REDSTONE_ORE =
			{
				Type = "number",
				Value = 73,
			},
			E_BLOCK_REDSTONE_ORE_GLOWING =
			{
				Type = "number",
				Value = 74,
			},
			E_BLOCK_REDSTONE_REPEATER_OFF =
			{
				Type = "number",
				Value = 93,
			},
			E_BLOCK_REDSTONE_REPEATER_ON =
			{
				Type = "number",
				Value = 94,
			},
			E_BLOCK_REDSTONE_TORCH_OFF =
			{
				Type = "number",
				Value = 75,
			},
			E_BLOCK_REDSTONE_TORCH_ON =
			{
				Type = "number",
				Value = 76,
			},
			E_BLOCK_REDSTONE_WIRE =
			{
				Type = "number",
				Value = 55,
			},
			E_BLOCK_RED_MUSHROOM =
			{
				Type = "number",
				Value = 40,
			},
			E_BLOCK_RED_ROSE =
			{
				Type = "number",
				Value = 38,
			},
			E_BLOCK_RED_SANDSTONE =
			{
				Type = "number",
				Value = 179,
			},
			E_BLOCK_RED_SANDSTONE_SLAB =
			{
				Type = "number",
				Value = 182,
			},
			E_BLOCK_RED_SANDSTONE_STAIRS =
			{
				Type = "number",
				Value = 180,
			},
			E_BLOCK_REEDS =
			{
				Type = "number",
				Value = 83,
			},
			E_BLOCK_SAND =
			{
				Type = "number",
				Value = 12,
			},
			E_BLOCK_SANDSTONE =
			{
				Type = "number",
				Value = 24,
			},
			E_BLOCK_SANDSTONE_STAIRS =
			{
				Type = "number",
				Value = 128,
			},
			E_BLOCK_SAPLING =
			{
				Type = "number",
				Value = 6,
			},
			E_BLOCK_SEA_LANTERN =
			{
				Type = "number",
				Value = 169,
			},
			E_BLOCK_SIGN_POST =
			{
				Type = "number",
				Value = 63,
			},
			E_BLOCK_SILVERFISH_EGG =
			{
				Type = "number",
				Value = 97,
			},
			E_BLOCK_SLIME_BLOCK =
			{
				Type = "number",
				Value = 165,
			},
			E_BLOCK_SNOW =
			{
				Type = "number",
				Value = 78,
			},
			E_BLOCK_SNOW_BLOCK =
			{
				Type = "number",
				Value = 80,
			},
			E_BLOCK_SOULSAND =
			{
				Type = "number",
				Value = 88,
			},
			E_BLOCK_SPONGE =
			{
				Type = "number",
				Value = 19,
			},
			E_BLOCK_SPRUCE_DOOR =
			{
				Type = "number",
				Value = 193,
			},
			E_BLOCK_SPRUCE_FENCE =
			{
				Type = "number",
				Value = 188,
			},
			E_BLOCK_SPRUCE_FENCE_GATE =
			{
				Type = "number",
				Value = 183,
			},
			E_BLOCK_SPRUCE_WOOD_STAIRS =
			{
				Type = "number",
				Value = 134,
			},
			E_BLOCK_STAINED_CLAY =
			{
				Type = "number",
				Value = 159,
			},
			E_BLOCK_STAINED_GLASS =
			{
				Type = "number",
				Value = 95,
			},
			E_BLOCK_STAINED_GLASS_PANE =
			{
				Type = "number",
				Value = 160,
			},
			E_BLOCK_STAIRS_UPSIDE_DOWN =
			{
				Type = "number",
				Value = 4,
			},
			E_BLOCK_STAIRS_XM =
			{
				Type = "number",
				Value = 1,
			},
			E_BLOCK_STAIRS_XP =
			{
				Type = "number",
				Value = 0,
			},
			E_BLOCK_STAIRS_ZM =
			{
				Type = "number",
				Value = 3,
			},
			E_BLOCK_STAIRS_ZP =
			{
				Type = "number",
				Value = 2,
			},
			E_BLOCK_STANDING_BANNER =
			{
				Type = "number",
				Value = 176,
			},
			E_BLOCK_STATIONARY_LAVA =
			{
				Type = "number",
				Value = 11,
			},
			E_BLOCK_STATIONARY_WATER =
			{
				Type = "number",
				Value = 9,
			},
			E_BLOCK_STICKY_PISTON =
			{
				Type = "number",
				Value = 29,
			},
			E_BLOCK_STONE =
			{
				Type = "number",
				Value = 1,
			},
			E_BLOCK_STONE_BRICKS =
			{
				Type = "number",
				Value = 98,
			},
			E_BLOCK_STONE_BRICK_STAIRS =
			{
				Type = "number",
				Value = 109,
			},
			E_BLOCK_STONE_BUTTON =
			{
				Type = "number",
				Value = 77,
			},
			E_BLOCK_STONE_PRESSURE_PLATE =
			{
				Type = "number",
				Value = 70,
			},
			E_BLOCK_STONE_SLAB =
			{
				Type = "number",
				Value = 44,
			},
			E_BLOCK_SUGARCANE =
			{
				Type = "number",
				Value = 83,
			},
			E_BLOCK_TALL_GRASS =
			{
				Type = "number",
				Value = 31,
			},
			E_BLOCK_TNT =
			{
				Type = "number",
				Value = 46,
			},
			E_BLOCK_TORCH =
			{
				Type = "number",
				Value = 50,
			},
			E_BLOCK_TRAPDOOR =
			{
				Type = "number",
				Value = 96,
			},
			E_BLOCK_TRAPPED_CHEST =
			{
				Type = "number",
				Value = 146,
			},
			E_BLOCK_TRIPWIRE =
			{
				Type = "number",
				Value = 132,
			},
			E_BLOCK_TRIPWIRE_HOOK =
			{
				Type = "number",
				Value = 131,
			},
			E_BLOCK_VINES =
			{
				Type = "number",
				Value = 106,
			},
			E_BLOCK_WALLSIGN =
			{
				Type = "number",
				Value = 68,
			},
			E_BLOCK_WALL_BANNER =
			{
				Type = "number",
				Value = 177,
			},
			E_BLOCK_WATER =
			{
				Type = "number",
				Value = 8,
			},
			E_BLOCK_WOODEN_BUTTON =
			{
				Type = "number",
				Value = 143,
			},
			E_BLOCK_WOODEN_DOOR =
			{
				Type = "number",
				Value = 64,
			},
			E_BLOCK_WOODEN_PRESSURE_PLATE =
			{
				Type = "number",
				Value = 72,
			},
			E_BLOCK_WOODEN_SLAB =
			{
				Type = "number",
				Value = 126,
			},
			E_BLOCK_WOODEN_STAIRS =
			{
				Type = "number",
				Value = 53,
			},
			E_BLOCK_WOOL =
			{
				Type = "number",
				Value = 35,
			},
			E_BLOCK_WORKBENCH =
			{
				Type = "number",
				Value = 58,
			},
			E_BLOCK_YELLOW_FLOWER =
			{
				Type = "number",
				Value = 37,
			},
			E_ITEM_11_DISC =
			{
				Type = "number",
				Value = 2266,
			},
			E_ITEM_13_DISC =
			{
				Type = "number",
				Value = 2256,
			},
			E_ITEM_ACACIA_DOOR =
			{
				Type = "number",
				Value = 430,
			},
			E_ITEM_ARMOR_STAND =
			{
				Type = "number",
				Value = 416,
			},
			E_ITEM_ARROW =
			{
				Type = "number",
				Value = 262,
			},
			E_ITEM_BAKED_POTATO =
			{
				Type = "number",
				Value = 393,
			},
			E_ITEM_BANNER =
			{
				Type = "number",
				Value = 425,
			},
			E_ITEM_BED =
			{
				Type = "number",
				Value = 355,
			},
			E_ITEM_BIRCH_DOOR =
			{
				Type = "number",
				Value = 428,
			},
			E_ITEM_BLAZE_POWDER =
			{
				Type = "number",
				Value = 377,
			},
			E_ITEM_BLAZE_ROD =
			{
				Type = "number",
				Value = 369,
			},
			E_ITEM_BLOCKS_DISC =
			{
				Type = "number",
				Value = 2258,
			},
			E_ITEM_BOAT =
			{
				Type = "number",
				Value = 333,
			},
			E_ITEM_BONE =
			{
				Type = "number",
				Value = 352,
			},
			E_ITEM_BOOK =
			{
				Type = "number",
				Value = 340,
			},
			E_ITEM_BOOK_AND_QUILL =
			{
				Type = "number",
				Value = 386,
			},
			E_ITEM_BOTTLE_O_ENCHANTING =
			{
				Type = "number",
				Value = 384,
			},
			E_ITEM_BOW =
			{
				Type = "number",
				Value = 261,
			},
			E_ITEM_BOWL =
			{
				Type = "number",
				Value = 281,
			},
			E_ITEM_BREAD =
			{
				Type = "number",
				Value = 297,
			},
			E_ITEM_BREWING_STAND =
			{
				Type = "number",
				Value = 379,
			},
			E_ITEM_BUCKET =
			{
				Type = "number",
				Value = 325,
			},
			E_ITEM_CAKE =
			{
				Type = "number",
				Value = 354,
			},
			E_ITEM_CARROT =
			{
				Type = "number",
				Value = 391,
			},
			E_ITEM_CARROT_ON_STICK =
			{
				Type = "number",
				Value = 398,
			},
			E_ITEM_CAT_DISC =
			{
				Type = "number",
				Value = 2257,
			},
			E_ITEM_CAULDRON =
			{
				Type = "number",
				Value = 380,
			},
			E_ITEM_CHAIN_BOOTS =
			{
				Type = "number",
				Value = 305,
			},
			E_ITEM_CHAIN_CHESTPLATE =
			{
				Type = "number",
				Value = 303,
			},
			E_ITEM_CHAIN_HELMET =
			{
				Type = "number",
				Value = 302,
			},
			E_ITEM_CHAIN_LEGGINGS =
			{
				Type = "number",
				Value = 304,
			},
			E_ITEM_CHEST_MINECART =
			{
				Type = "number",
				Value = 342,
			},
			E_ITEM_CHIRP_DISC =
			{
				Type = "number",
				Value = 2259,
			},
			E_ITEM_CLAY =
			{
				Type = "number",
				Value = 337,
			},
			E_ITEM_CLAY_BRICK =
			{
				Type = "number",
				Value = 336,
			},
			E_ITEM_CLOCK =
			{
				Type = "number",
				Value = 347,
			},
			E_ITEM_COAL =
			{
				Type = "number",
				Value = 263,
			},
			E_ITEM_COMPARATOR =
			{
				Type = "number",
				Value = 404,
			},
			E_ITEM_COMPASS =
			{
				Type = "number",
				Value = 345,
			},
			E_ITEM_COOKED_CHICKEN =
			{
				Type = "number",
				Value = 366,
			},
			E_ITEM_COOKED_FISH =
			{
				Type = "number",
				Value = 350,
			},
			E_ITEM_COOKED_MUTTON =
			{
				Type = "number",
				Value = 424,
			},
			E_ITEM_COOKED_PORKCHOP =
			{
				Type = "number",
				Value = 320,
			},
			E_ITEM_COOKED_RABBIT =
			{
				Type = "number",
				Value = 412,
			},
			E_ITEM_COOKIE =
			{
				Type = "number",
				Value = 357,
			},
			E_ITEM_DARK_OAK_DOOR =
			{
				Type = "number",
				Value = 431,
			},
			E_ITEM_DIAMOND =
			{
				Type = "number",
				Value = 264,
			},
			E_ITEM_DIAMOND_AXE =
			{
				Type = "number",
				Value = 279,
			},
			E_ITEM_DIAMOND_BOOTS =
			{
				Type = "number",
				Value = 313,
			},
			E_ITEM_DIAMOND_CHESTPLATE =
			{
				Type = "number",
				Value = 311,
			},
			E_ITEM_DIAMOND_HELMET =
			{
				Type = "number",
				Value = 310,
			},
			E_ITEM_DIAMOND_HOE =
			{
				Type = "number",
				Value = 293,
			},
			E_ITEM_DIAMOND_HORSE_ARMOR =
			{
				Type = "number",
				Value = 419,
			},
			E_ITEM_DIAMOND_LEGGINGS =
			{
				Type = "number",
				Value = 312,
			},
			E_ITEM_DIAMOND_PICKAXE =
			{
				Type = "number",
				Value = 278,
			},
			E_ITEM_DIAMOND_SHOVEL =
			{
				Type = "number",
				Value = 277,
			},
			E_ITEM_DIAMOND_SWORD =
			{
				Type = "number",
				Value = 276,
			},
			E_ITEM_DYE =
			{
				Type = "number",
				Value = 351,
			},
			E_ITEM_EGG =
			{
				Type = "number",
				Value = 344,
			},
			E_ITEM_EMERALD =
			{
				Type = "number",
				Value = 388,
			},
			E_ITEM_EMPTY =
			{
				Type = "number",
				Value = -1,
			},
			E_ITEM_EMPTY_MAP =
			{
				Type = "number",
				Value = 395,
			},
			E_ITEM_ENCHANTED_BOOK =
			{
				Type = "number",
				Value = 403,
			},
			E_ITEM_ENDER_PEARL =
			{
				Type = "number",
				Value = 368,
			},
			E_ITEM_EYE_OF_ENDER =
			{
				Type = "number",
				Value = 381,
			},
			E_ITEM_FAR_DISC =
			{
				Type = "number",
				Value = 2260,
			},
			E_ITEM_FEATHER =
			{
				Type = "number",
				Value = 288,
			},
			E_ITEM_FERMENTED_SPIDER_EYE =
			{
				Type = "number",
				Value = 376,
			},
			E_ITEM_FIREWORK_ROCKET =
			{
				Type = "number",
				Value = 401,
			},
			E_ITEM_FIREWORK_STAR =
			{
				Type = "number",
				Value = 402,
			},
			E_ITEM_FIRE_CHARGE =
			{
				Type = "number",
				Value = 385,
			},
			E_ITEM_FIRST =
			{
				Type = "number",
				Value = 256,
			},
			E_ITEM_FIRST_DISC =
			{
				Type = "number",
				Value = 2256,
			},
			E_ITEM_FISHING_ROD =
			{
				Type = "number",
				Value = 346,
			},
			E_ITEM_FLINT =
			{
				Type = "number",
				Value = 318,
			},
			E_ITEM_FLINT_AND_STEEL =
			{
				Type = "number",
				Value = 259,
			},
			E_ITEM_FLOWER_POT =
			{
				Type = "number",
				Value = 390,
			},
			E_ITEM_FURNACE_MINECART =
			{
				Type = "number",
				Value = 343,
			},
			E_ITEM_GHAST_TEAR =
			{
				Type = "number",
				Value = 370,
			},
			E_ITEM_GLASS_BOTTLE =
			{
				Type = "number",
				Value = 374,
			},
			E_ITEM_GLISTERING_MELON =
			{
				Type = "number",
				Value = 382,
			},
			E_ITEM_GLOWSTONE_DUST =
			{
				Type = "number",
				Value = 348,
			},
			E_ITEM_GOLD =
			{
				Type = "number",
				Value = 266,
			},
			E_ITEM_GOLDEN_APPLE =
			{
				Type = "number",
				Value = 322,
			},
			E_ITEM_GOLDEN_CARROT =
			{
				Type = "number",
				Value = 396,
			},
			E_ITEM_GOLD_AXE =
			{
				Type = "number",
				Value = 286,
			},
			E_ITEM_GOLD_BOOTS =
			{
				Type = "number",
				Value = 317,
			},
			E_ITEM_GOLD_CHESTPLATE =
			{
				Type = "number",
				Value = 315,
			},
			E_ITEM_GOLD_HELMET =
			{
				Type = "number",
				Value = 314,
			},
			E_ITEM_GOLD_HOE =
			{
				Type = "number",
				Value = 294,
			},
			E_ITEM_GOLD_HORSE_ARMOR =
			{
				Type = "number",
				Value = 418,
			},
			E_ITEM_GOLD_LEGGINGS =
			{
				Type = "number",
				Value = 316,
			},
			E_ITEM_GOLD_NUGGET =
			{
				Type = "number",
				Value = 371,
			},
			E_ITEM_GOLD_PICKAXE =
			{
				Type = "number",
				Value = 285,
			},
			E_ITEM_GOLD_SHOVEL =
			{
				Type = "number",
				Value = 284,
			},
			E_ITEM_GOLD_SWORD =
			{
				Type = "number",
				Value = 283,
			},
			E_ITEM_GUNPOWDER =
			{
				Type = "number",
				Value = 289,
			},
			E_ITEM_HEAD =
			{
				Type = "number",
				Value = 397,
			},
			E_ITEM_IRON =
			{
				Type = "number",
				Value = 265,
			},
			E_ITEM_IRON_AXE =
			{
				Type = "number",
				Value = 258,
			},
			E_ITEM_IRON_BOOTS =
			{
				Type = "number",
				Value = 309,
			},
			E_ITEM_IRON_CHESTPLATE =
			{
				Type = "number",
				Value = 307,
			},
			E_ITEM_IRON_DOOR =
			{
				Type = "number",
				Value = 330,
			},
			E_ITEM_IRON_HELMET =
			{
				Type = "number",
				Value = 306,
			},
			E_ITEM_IRON_HOE =
			{
				Type = "number",
				Value = 292,
			},
			E_ITEM_IRON_HORSE_ARMOR =
			{
				Type = "number",
				Value = 417,
			},
			E_ITEM_IRON_LEGGINGS =
			{
				Type = "number",
				Value = 308,
			},
			E_ITEM_IRON_PICKAXE =
			{
				Type = "number",
				Value = 257,
			},
			E_ITEM_IRON_SHOVEL =
			{
				Type = "number",
				Value = 256,
			},
			E_ITEM_IRON_SWORD =
			{
				Type = "number",
				Value = 267,
			},
			E_ITEM_ITEM_FRAME =
			{
				Type = "number",
				Value = 389,
			},
			E_ITEM_JUNGLE_DOOR =
			{
				Type = "number",
				Value = 429,
			},
			E_ITEM_LAST =
			{
				Type = "number",
				Value = 2267,
			},
			E_ITEM_LAST_DISC =
			{
				Type = "number",
				Value = 2267,
			},
			E_ITEM_LAST_DISC_PLUS_ONE =
			{
				Type = "number",
				Value = 2268,
			},
			E_ITEM_LAVA_BUCKET =
			{
				Type = "number",
				Value = 327,
			},
			E_ITEM_LEAD =
			{
				Type = "number",
				Value = 420,
			},
			E_ITEM_LEATHER =
			{
				Type = "number",
				Value = 334,
			},
			E_ITEM_LEATHER_BOOTS =
			{
				Type = "number",
				Value = 301,
			},
			E_ITEM_LEATHER_CAP =
			{
				Type = "number",
				Value = 298,
			},
			E_ITEM_LEATHER_PANTS =
			{
				Type = "number",
				Value = 300,
			},
			E_ITEM_LEATHER_TUNIC =
			{
				Type = "number",
				Value = 299,
			},
			E_ITEM_MAGMA_CREAM =
			{
				Type = "number",
				Value = 378,
			},
			E_ITEM_MALL_DISC =
			{
				Type = "number",
				Value = 2261,
			},
			E_ITEM_MAP =
			{
				Type = "number",
				Value = 358,
			},
			E_ITEM_MAX_CONSECUTIVE_TYPE_ID =
			{
				Type = "number",
				Value = 431,
			},
			E_ITEM_MELLOHI_DISC =
			{
				Type = "number",
				Value = 2262,
			},
			E_ITEM_MELON_SEEDS =
			{
				Type = "number",
				Value = 362,
			},
			E_ITEM_MELON_SLICE =
			{
				Type = "number",
				Value = 360,
			},
			E_ITEM_MILK =
			{
				Type = "number",
				Value = 335,
			},
			E_ITEM_MINECART =
			{
				Type = "number",
				Value = 328,
			},
			E_ITEM_MINECART_WITH_COMMAND_BLOCK =
			{
				Type = "number",
				Value = 422,
			},
			E_ITEM_MINECART_WITH_HOPPER =
			{
				Type = "number",
				Value = 408,
			},
			E_ITEM_MINECART_WITH_TNT =
			{
				Type = "number",
				Value = 407,
			},
			E_ITEM_MUSHROOM_SOUP =
			{
				Type = "number",
				Value = 282,
			},
			E_ITEM_NAME_TAG =
			{
				Type = "number",
				Value = 421,
			},
			E_ITEM_NETHER_BRICK =
			{
				Type = "number",
				Value = 405,
			},
			E_ITEM_NETHER_QUARTZ =
			{
				Type = "number",
				Value = 406,
			},
			E_ITEM_NETHER_STAR =
			{
				Type = "number",
				Value = 399,
			},
			E_ITEM_NETHER_WART =
			{
				Type = "number",
				Value = 372,
			},
			E_ITEM_NUMBER_OF_CONSECUTIVE_TYPES =
			{
				Type = "number",
				Value = 432,
			},
			E_ITEM_PAINTING =
			{
				Type = "number",
				Value = 321,
			},
			E_ITEM_PAPER =
			{
				Type = "number",
				Value = 339,
			},
			E_ITEM_POISONOUS_POTATO =
			{
				Type = "number",
				Value = 394,
			},
			E_ITEM_POTATO =
			{
				Type = "number",
				Value = 392,
			},
			E_ITEM_POTION =
			{
				Type = "number",
				Value = 373,
			},
			E_ITEM_POTIONS =
			{
				Type = "number",
				Value = 373,
			},
			E_ITEM_PRISMARINE_CRYSTALS =
			{
				Type = "number",
				Value = 410,
			},
			E_ITEM_PRISMARINE_SHARD =
			{
				Type = "number",
				Value = 409,
			},
			E_ITEM_PUMPKIN_PIE =
			{
				Type = "number",
				Value = 400,
			},
			E_ITEM_PUMPKIN_SEEDS =
			{
				Type = "number",
				Value = 361,
			},
			E_ITEM_RABBITS_FOOT =
			{
				Type = "number",
				Value = 414,
			},
			E_ITEM_RABBIT_HIDE =
			{
				Type = "number",
				Value = 415,
			},
			E_ITEM_RABBIT_STEW =
			{
				Type = "number",
				Value = 413,
			},
			E_ITEM_RAW_BEEF =
			{
				Type = "number",
				Value = 363,
			},
			E_ITEM_RAW_CHICKEN =
			{
				Type = "number",
				Value = 365,
			},
			E_ITEM_RAW_FISH =
			{
				Type = "number",
				Value = 349,
			},
			E_ITEM_RAW_MUTTON =
			{
				Type = "number",
				Value = 423,
			},
			E_ITEM_RAW_PORKCHOP =
			{
				Type = "number",
				Value = 319,
			},
			E_ITEM_RAW_RABBIT =
			{
				Type = "number",
				Value = 411,
			},
			E_ITEM_REDSTONE_DUST =
			{
				Type = "number",
				Value = 331,
			},
			E_ITEM_REDSTONE_REPEATER =
			{
				Type = "number",
				Value = 356,
			},
			E_ITEM_RED_APPLE =
			{
				Type = "number",
				Value = 260,
			},
			E_ITEM_ROTTEN_FLESH =
			{
				Type = "number",
				Value = 367,
			},
			E_ITEM_SADDLE =
			{
				Type = "number",
				Value = 329,
			},
			E_ITEM_SEEDS =
			{
				Type = "number",
				Value = 295,
			},
			E_ITEM_SHEARS =
			{
				Type = "number",
				Value = 359,
			},
			E_ITEM_SIGN =
			{
				Type = "number",
				Value = 323,
			},
			E_ITEM_SLIMEBALL =
			{
				Type = "number",
				Value = 341,
			},
			E_ITEM_SNOWBALL =
			{
				Type = "number",
				Value = 332,
			},
			E_ITEM_SPAWN_EGG =
			{
				Type = "number",
				Value = 383,
			},
			E_ITEM_SPIDER_EYE =
			{
				Type = "number",
				Value = 375,
			},
			E_ITEM_SPRUCE_DOOR =
			{
				Type = "number",
				Value = 427,
			},
			E_ITEM_STAL_DISC =
			{
				Type = "number",
				Value = 2263,
			},
			E_ITEM_STEAK =
			{
				Type = "number",
				Value = 364,
			},
			E_ITEM_STICK =
			{
				Type = "number",
				Value = 280,
			},
			E_ITEM_STONE_AXE =
			{
				Type = "number",
				Value = 275,
			},
			E_ITEM_STONE_HOE =
			{
				Type = "number",
				Value = 291,
			},
			E_ITEM_STONE_PICKAXE =
			{
				Type = "number",
				Value = 274,
			},
			E_ITEM_STONE_SHOVEL =
			{
				Type = "number",
				Value = 273,
			},
			E_ITEM_STONE_SWORD =
			{
				Type = "number",
				Value = 272,
			},
			E_ITEM_STRAD_DISC =
			{
				Type = "number",
				Value = 2264,
			},
			E_ITEM_STRING =
			{
				Type = "number",
				Value = 287,
			},
			E_ITEM_SUGAR =
			{
				Type = "number",
				Value = 353,
			},
			E_ITEM_SUGARCANE =
			{
				Type = "number",
				Value = 338,
			},
			E_ITEM_SUGAR_CANE =
			{
				Type = "number",
				Value = 338,
			},
			E_ITEM_WAIT_DISC =
			{
				Type = "number",
				Value = 2267,
			},
			E_ITEM_WARD_DISC =
			{
				Type = "number",
				Value = 2265,
			},
			E_ITEM_WATER_BUCKET =
			{
				Type = "number",
				Value = 326,
			},
			E_ITEM_WHEAT =
			{
				Type = "number",
				Value = 296,
			},
			E_ITEM_WOODEN_AXE =
			{
				Type = "number",
				Value = 271,
			},
			E_ITEM_WOODEN_DOOR =
			{
				Type = "number",
				Value = 324,
			},
			E_ITEM_WOODEN_HOE =
			{
				Type = "number",
				Value = 290,
			},
			E_ITEM_WOODEN_PICKAXE =
			{
				Type = "number",
				Value = 270,
			},
			E_ITEM_WOODEN_SHOVEL =
			{
				Type = "number",
				Value = 269,
			},
			E_ITEM_WOODEN_SWORD =
			{
				Type = "number",
				Value = 268,
			},
			E_ITEM_WRITTEN_BOOK =
			{
				Type = "number",
				Value = 387,
			},
			E_META_BANNER_BLACK =
			{
				Type = "number",
				Value = 0,
			},
			E_META_BANNER_BLUE =
			{
				Type = "number",
				Value = 4,
			},
			E_META_BANNER_BROWN =
			{
				Type = "number",
				Value = 3,
			},
			E_META_BANNER_CYAN =
			{
				Type = "number",
				Value = 6,
			},
			E_META_BANNER_GRAY =
			{
				Type = "number",
				Value = 8,
			},
			E_META_BANNER_GREEN =
			{
				Type = "number",
				Value = 2,
			},
			E_META_BANNER_LIGHTBLUE =
			{
				Type = "number",
				Value = 12,
			},
			E_META_BANNER_LIGHTGRAY =
			{
				Type = "number",
				Value = 7,
			},
			E_META_BANNER_LIGHTGREEN =
			{
				Type = "number",
				Value = 10,
			},
			E_META_BANNER_MAGENTA =
			{
				Type = "number",
				Value = 13,
			},
			E_META_BANNER_ORANGE =
			{
				Type = "number",
				Value = 14,
			},
			E_META_BANNER_PINK =
			{
				Type = "number",
				Value = 9,
			},
			E_META_BANNER_PURPLE =
			{
				Type = "number",
				Value = 5,
			},
			E_META_BANNER_RED =
			{
				Type = "number",
				Value = 1,
			},
			E_META_BANNER_WHITE =
			{
				Type = "number",
				Value = 15,
			},
			E_META_BANNER_YELLOW =
			{
				Type = "number",
				Value = 11,
			},
			E_META_BIG_FLOWER_DOUBLE_TALL_GRASS =
			{
				Type = "number",
				Value = 2,
			},
			E_META_BIG_FLOWER_LARGE_FERN =
			{
				Type = "number",
				Value = 3,
			},
			E_META_BIG_FLOWER_LILAC =
			{
				Type = "number",
				Value = 1,
			},
			E_META_BIG_FLOWER_PEONY =
			{
				Type = "number",
				Value = 5,
			},
			E_META_BIG_FLOWER_ROSE_BUSH =
			{
				Type = "number",
				Value = 4,
			},
			E_META_BIG_FLOWER_SUNFLOWER =
			{
				Type = "number",
				Value = 0,
			},
			E_META_BREWING_STAND_FILLED_SLOT_XM_ZM =
			{
				Type = "number",
				Value = 4,
			},
			E_META_BREWING_STAND_FILLED_SLOT_XM_ZP =
			{
				Type = "number",
				Value = 2,
			},
			E_META_BREWING_STAND_FILLED_SLOT_XP =
			{
				Type = "number",
				Value = 1,
			},
			E_META_CARPET_BLACK =
			{
				Type = "number",
				Value = 15,
			},
			E_META_CARPET_BLUE =
			{
				Type = "number",
				Value = 11,
			},
			E_META_CARPET_BROWN =
			{
				Type = "number",
				Value = 12,
			},
			E_META_CARPET_CYAN =
			{
				Type = "number",
				Value = 9,
			},
			E_META_CARPET_GRAY =
			{
				Type = "number",
				Value = 7,
			},
			E_META_CARPET_GREEN =
			{
				Type = "number",
				Value = 13,
			},
			E_META_CARPET_LIGHTBLUE =
			{
				Type = "number",
				Value = 3,
			},
			E_META_CARPET_LIGHTGRAY =
			{
				Type = "number",
				Value = 8,
			},
			E_META_CARPET_LIGHTGREEN =
			{
				Type = "number",
				Value = 5,
			},
			E_META_CARPET_MAGENTA =
			{
				Type = "number",
				Value = 2,
			},
			E_META_CARPET_ORANGE =
			{
				Type = "number",
				Value = 1,
			},
			E_META_CARPET_PINK =
			{
				Type = "number",
				Value = 6,
			},
			E_META_CARPET_PURPLE =
			{
				Type = "number",
				Value = 10,
			},
			E_META_CARPET_RED =
			{
				Type = "number",
				Value = 14,
			},
			E_META_CARPET_WHITE =
			{
				Type = "number",
				Value = 0,
			},
			E_META_CARPET_YELLOW =
			{
				Type = "number",
				Value = 4,
			},
			E_META_CHEST_FACING_XM =
			{
				Type = "number",
				Value = 4,
			},
			E_META_CHEST_FACING_XP =
			{
				Type = "number",
				Value = 5,
			},
			E_META_CHEST_FACING_ZM =
			{
				Type = "number",
				Value = 2,
			},
			E_META_CHEST_FACING_ZP =
			{
				Type = "number",
				Value = 3,
			},
			E_META_COAL_CHARCOAL =
			{
				Type = "number",
				Value = 1,
			},
			E_META_COAL_NORMAL =
			{
				Type = "number",
				Value = 0,
			},
			E_META_COOKED_FISH_FISH =
			{
				Type = "number",
				Value = 0,
			},
			E_META_COOKED_FISH_SALMON =
			{
				Type = "number",
				Value = 1,
			},
			E_META_DIRT_COARSE =
			{
				Type = "number",
				Value = 1,
			},
			E_META_DIRT_GRASSLESS =
			{
				Type = "number",
				Value = 1,
			},
			E_META_DIRT_NORMAL =
			{
				Type = "number",
				Value = 0,
			},
			E_META_DIRT_PODZOL =
			{
				Type = "number",
				Value = 2,
			},
			E_META_DOUBLE_STONE_SLAB_BRICK =
			{
				Type = "number",
				Value = 4,
			},
			E_META_DOUBLE_STONE_SLAB_COBBLESTONE =
			{
				Type = "number",
				Value = 3,
			},
			E_META_DOUBLE_STONE_SLAB_NETHER_BRICK =
			{
				Type = "number",
				Value = 6,
			},
			E_META_DOUBLE_STONE_SLAB_QUARTZ =
			{
				Type = "number",
				Value = 7,
			},
			E_META_DOUBLE_STONE_SLAB_SANDSTON =
			{
				Type = "number",
				Value = 1,
			},
			E_META_DOUBLE_STONE_SLAB_SMOOTH_SANDSTONE =
			{
				Type = "number",
				Value = 9,
			},
			E_META_DOUBLE_STONE_SLAB_SMOOTH_STONE =
			{
				Type = "number",
				Value = 8,
			},
			E_META_DOUBLE_STONE_SLAB_STONE =
			{
				Type = "number",
				Value = 0,
			},
			E_META_DOUBLE_STONE_SLAB_STONE_BRICK =
			{
				Type = "number",
				Value = 5,
			},
			E_META_DOUBLE_STONE_SLAB_TILE_QUARTZ =
			{
				Type = "number",
				Value = 10,
			},
			E_META_DOUBLE_STONE_SLAB_WOODEN =
			{
				Type = "number",
				Value = 2,
			},
			E_META_DROPSPENSER_ACTIVATED =
			{
				Type = "number",
				Value = 8,
			},
			E_META_DROPSPENSER_FACING_MASK =
			{
				Type = "number",
				Value = 7,
			},
			E_META_DROPSPENSER_FACING_XM =
			{
				Type = "number",
				Value = 4,
			},
			E_META_DROPSPENSER_FACING_XP =
			{
				Type = "number",
				Value = 5,
			},
			E_META_DROPSPENSER_FACING_YM =
			{
				Type = "number",
				Value = 0,
			},
			E_META_DROPSPENSER_FACING_YP =
			{
				Type = "number",
				Value = 1,
			},
			E_META_DROPSPENSER_FACING_ZM =
			{
				Type = "number",
				Value = 2,
			},
			E_META_DROPSPENSER_FACING_ZP =
			{
				Type = "number",
				Value = 3,
			},
			E_META_DYE_BLACK =
			{
				Type = "number",
				Value = 0,
			},
			E_META_DYE_BLUE =
			{
				Type = "number",
				Value = 4,
			},
			E_META_DYE_BROWN =
			{
				Type = "number",
				Value = 3,
			},
			E_META_DYE_CYAN =
			{
				Type = "number",
				Value = 6,
			},
			E_META_DYE_GRAY =
			{
				Type = "number",
				Value = 8,
			},
			E_META_DYE_GREEN =
			{
				Type = "number",
				Value = 2,
			},
			E_META_DYE_LIGHTBLUE =
			{
				Type = "number",
				Value = 12,
			},
			E_META_DYE_LIGHTGRAY =
			{
				Type = "number",
				Value = 7,
			},
			E_META_DYE_LIGHTGREEN =
			{
				Type = "number",
				Value = 10,
			},
			E_META_DYE_MAGENTA =
			{
				Type = "number",
				Value = 13,
			},
			E_META_DYE_ORANGE =
			{
				Type = "number",
				Value = 14,
			},
			E_META_DYE_PINK =
			{
				Type = "number",
				Value = 9,
			},
			E_META_DYE_PURPLE =
			{
				Type = "number",
				Value = 5,
			},
			E_META_DYE_RED =
			{
				Type = "number",
				Value = 1,
			},
			E_META_DYE_WHITE =
			{
				Type = "number",
				Value = 15,
			},
			E_META_DYE_YELLOW =
			{
				Type = "number",
				Value = 11,
			},
			E_META_FLOWER_ALLIUM =
			{
				Type = "number",
				Value = 2,
			},
			E_META_FLOWER_BLUE_ORCHID =
			{
				Type = "number",
				Value = 1,
			},
			E_META_FLOWER_ORANGE_TULIP =
			{
				Type = "number",
				Value = 5,
			},
			E_META_FLOWER_OXEYE_DAISY =
			{
				Type = "number",
				Value = 8,
			},
			E_META_FLOWER_PINK_TULIP =
			{
				Type = "number",
				Value = 7,
			},
			E_META_FLOWER_POPPY =
			{
				Type = "number",
				Value = 0,
			},
			E_META_FLOWER_RED_TULIP =
			{
				Type = "number",
				Value = 4,
			},
			E_META_FLOWER_WHITE_TULIP =
			{
				Type = "number",
				Value = 6,
			},
			E_META_GOLDEN_APPLE_ENCHANTED =
			{
				Type = "number",
				Value = 1,
			},
			E_META_GOLDEN_APPLE_NORMAL =
			{
				Type = "number",
				Value = 0,
			},
			E_META_HEAD_CREEPER =
			{
				Type = "number",
				Value = 4,
			},
			E_META_HEAD_PLAYER =
			{
				Type = "number",
				Value = 3,
			},
			E_META_HEAD_SKELETON =
			{
				Type = "number",
				Value = 0,
			},
			E_META_HEAD_WITHER =
			{
				Type = "number",
				Value = 1,
			},
			E_META_HEAD_ZOMBIE =
			{
				Type = "number",
				Value = 2,
			},
			E_META_HOPPER_FACING_XM =
			{
				Type = "number",
				Value = 4,
			},
			E_META_HOPPER_FACING_XP =
			{
				Type = "number",
				Value = 5,
			},
			E_META_HOPPER_FACING_YM =
			{
				Type = "number",
				Value = 0,
			},
			E_META_HOPPER_FACING_ZM =
			{
				Type = "number",
				Value = 2,
			},
			E_META_HOPPER_FACING_ZP =
			{
				Type = "number",
				Value = 3,
			},
			E_META_HOPPER_UNATTACHED =
			{
				Type = "number",
				Value = 1,
			},
			E_META_JUKEBOX_OFF =
			{
				Type = "number",
				Value = 0,
			},
			E_META_JUKEBOX_ON =
			{
				Type = "number",
				Value = 1,
			},
			E_META_LEAVES_APPLE =
			{
				Type = "number",
				Value = 0,
			},
			E_META_LEAVES_APPLE_CHECK_DECAY =
			{
				Type = "number",
				Value = 8,
			},
			E_META_LEAVES_APPLE_NO_DECAY =
			{
				Type = "number",
				Value = 4,
			},
			E_META_LEAVES_BIRCH =
			{
				Type = "number",
				Value = 2,
			},
			E_META_LEAVES_BIRCH_CHECK_DECAY =
			{
				Type = "number",
				Value = 10,
			},
			E_META_LEAVES_BIRCH_NO_DECAY =
			{
				Type = "number",
				Value = 6,
			},
			E_META_LEAVES_CONIFER =
			{
				Type = "number",
				Value = 1,
			},
			E_META_LEAVES_CONIFER_CHECK_DECAY =
			{
				Type = "number",
				Value = 9,
			},
			E_META_LEAVES_CONIFER_NO_DECAY =
			{
				Type = "number",
				Value = 5,
			},
			E_META_LEAVES_JUNGLE =
			{
				Type = "number",
				Value = 3,
			},
			E_META_LEAVES_JUNGLE_CHECK_DECAY =
			{
				Type = "number",
				Value = 11,
			},
			E_META_LEAVES_JUNGLE_NO_DECAY =
			{
				Type = "number",
				Value = 7,
			},
			E_META_LOG_APPLE =
			{
				Type = "number",
				Value = 0,
			},
			E_META_LOG_BIRCH =
			{
				Type = "number",
				Value = 2,
			},
			E_META_LOG_BIRCH_BARK_ONLY =
			{
				Type = "number",
				Value = 14,
			},
			E_META_LOG_BIRCH_UP_DOWN =
			{
				Type = "number",
				Value = 2,
			},
			E_META_LOG_BIRCH_X =
			{
				Type = "number",
				Value = 6,
			},
			E_META_LOG_BIRCH_Z =
			{
				Type = "number",
				Value = 10,
			},
			E_META_LOG_CONIFER =
			{
				Type = "number",
				Value = 1,
			},
			E_META_LOG_JUNGLE =
			{
				Type = "number",
				Value = 3,
			},
			E_META_LOG_JUNGLE_BARK_ONLY =
			{
				Type = "number",
				Value = 15,
			},
			E_META_LOG_JUNGLE_UP_DOWN =
			{
				Type = "number",
				Value = 3,
			},
			E_META_LOG_JUNGLE_X =
			{
				Type = "number",
				Value = 7,
			},
			E_META_LOG_JUNGLE_Z =
			{
				Type = "number",
				Value = 11,
			},
			E_META_LOG_OAK_BARK_ONLY =
			{
				Type = "number",
				Value = 12,
			},
			E_META_LOG_OAK_UP_DOWN =
			{
				Type = "number",
				Value = 0,
			},
			E_META_LOG_OAK_X =
			{
				Type = "number",
				Value = 4,
			},
			E_META_LOG_OAK_Z =
			{
				Type = "number",
				Value = 8,
			},
			E_META_LOG_SPRUCE_BARK_ONLY =
			{
				Type = "number",
				Value = 13,
			},
			E_META_LOG_SPRUCE_UP_DOWN =
			{
				Type = "number",
				Value = 1,
			},
			E_META_LOG_SPRUCE_X =
			{
				Type = "number",
				Value = 5,
			},
			E_META_LOG_SPRUCE_Z =
			{
				Type = "number",
				Value = 9,
			},
			E_META_NEWLEAVES_ACACIA =
			{
				Type = "number",
				Value = 0,
			},
			E_META_NEWLEAVES_ACACIA_CHECK_DECAY =
			{
				Type = "number",
				Value = 8,
			},
			E_META_NEWLEAVES_ACACIA_NO_DECAY =
			{
				Type = "number",
				Value = 4,
			},
			E_META_NEWLEAVES_DARK_OAK =
			{
				Type = "number",
				Value = 1,
			},
			E_META_NEWLEAVES_DARK_OAK_CHECK_DECAY =
			{
				Type = "number",
				Value = 9,
			},
			E_META_NEWLEAVES_DARK_OAK_NO_DECAY =
			{
				Type = "number",
				Value = 5,
			},
			E_META_NEWLOG_ACACIA_BARK_ONLY =
			{
				Type = "number",
				Value = 12,
			},
			E_META_NEWLOG_ACACIA_UP_DOWN =
			{
				Type = "number",
				Value = 0,
			},
			E_META_NEWLOG_ACACIA_X =
			{
				Type = "number",
				Value = 4,
			},
			E_META_NEWLOG_ACACIA_Z =
			{
				Type = "number",
				Value = 8,
			},
			E_META_NEWLOG_DARK_OAK_BARK_ONLY =
			{
				Type = "number",
				Value = 13,
			},
			E_META_NEWLOG_DARK_OAK_UP_DOWN =
			{
				Type = "number",
				Value = 1,
			},
			E_META_NEWLOG_DARK_OAK_X =
			{
				Type = "number",
				Value = 5,
			},
			E_META_NEWLOG_DARK_OAK_Z =
			{
				Type = "number",
				Value = 9,
			},
			E_META_NEW_LOG_ACACIA_WOOD =
			{
				Type = "number",
				Value = 0,
			},
			E_META_NEW_LOG_DARK_OAK_WOOD =
			{
				Type = "number",
				Value = 1,
			},
			E_META_PISTON_DOWN =
			{
				Type = "number",
				Value = 0,
			},
			E_META_PISTON_EXTENDED =
			{
				Type = "number",
				Value = 8,
			},
			E_META_PISTON_HEAD_STICKY =
			{
				Type = "number",
				Value = 8,
			},
			E_META_PISTON_U =
			{
				Type = "number",
				Value = 1,
			},
			E_META_PISTON_XM =
			{
				Type = "number",
				Value = 4,
			},
			E_META_PISTON_XP =
			{
				Type = "number",
				Value = 5,
			},
			E_META_PISTON_ZM =
			{
				Type = "number",
				Value = 2,
			},
			E_META_PISTON_ZP =
			{
				Type = "number",
				Value = 3,
			},
			E_META_PLANKS_ACACIA =
			{
				Type = "number",
				Value = 4,
			},
			E_META_PLANKS_BIRCH =
			{
				Type = "number",
				Value = 2,
			},
			E_META_PLANKS_DARK_OAK =
			{
				Type = "number",
				Value = 5,
			},
			E_META_PLANKS_JUNGLE =
			{
				Type = "number",
				Value = 3,
			},
			E_META_PLANKS_OAK =
			{
				Type = "number",
				Value = 0,
			},
			E_META_PLANKS_SPRUCE =
			{
				Type = "number",
				Value = 1,
			},
			E_META_PRESSURE_PLATE_DEPRESSED =
			{
				Type = "number",
				Value = 1,
			},
			E_META_PRESSURE_PLATE_RAISED =
			{
				Type = "number",
				Value = 0,
			},
			E_META_PRISMARINE_BLOCK_BRICKS =
			{
				Type = "number",
				Value = 1,
			},
			E_META_PRISMARINE_BLOCK_DARK =
			{
				Type = "number",
				Value = 2,
			},
			E_META_PRISMARINE_BLOCK_ROUGH =
			{
				Type = "number",
				Value = 0,
			},
			E_META_QUARTZ_CHISELLED =
			{
				Type = "number",
				Value = 1,
			},
			E_META_QUARTZ_NORMAL =
			{
				Type = "number",
				Value = 0,
			},
			E_META_QUARTZ_PILLAR =
			{
				Type = "number",
				Value = 2,
			},
			E_META_RAIL_ASCEND_XM =
			{
				Type = "number",
				Value = 3,
			},
			E_META_RAIL_ASCEND_XP =
			{
				Type = "number",
				Value = 2,
			},
			E_META_RAIL_ASCEND_ZM =
			{
				Type = "number",
				Value = 4,
			},
			E_META_RAIL_ASCEND_ZP =
			{
				Type = "number",
				Value = 5,
			},
			E_META_RAIL_CURVED_ZM_XM =
			{
				Type = "number",
				Value = 8,
			},
			E_META_RAIL_CURVED_ZM_XP =
			{
				Type = "number",
				Value = 9,
			},
			E_META_RAIL_CURVED_ZP_XM =
			{
				Type = "number",
				Value = 7,
			},
			E_META_RAIL_CURVED_ZP_XP =
			{
				Type = "number",
				Value = 6,
			},
			E_META_RAIL_XM_XP =
			{
				Type = "number",
				Value = 1,
			},
			E_META_RAIL_ZM_ZP =
			{
				Type = "number",
				Value = 0,
			},
			E_META_RAW_FISH_CLOWNFISH =
			{
				Type = "number",
				Value = 2,
			},
			E_META_RAW_FISH_FISH =
			{
				Type = "number",
				Value = 0,
			},
			E_META_RAW_FISH_PUFFERFISH =
			{
				Type = "number",
				Value = 3,
			},
			E_META_RAW_FISH_SALMON =
			{
				Type = "number",
				Value = 1,
			},
			E_META_RED_SANDSTONE_NORMAL =
			{
				Type = "number",
				Value = 0,
			},
			E_META_RED_SANDSTONE_ORNAMENT =
			{
				Type = "number",
				Value = 1,
			},
			E_META_RED_SANDSTONE_SMOOTH =
			{
				Type = "number",
				Value = 2,
			},
			E_META_SANDSTONE_NORMAL =
			{
				Type = "number",
				Value = 0,
			},
			E_META_SANDSTONE_ORNAMENT =
			{
				Type = "number",
				Value = 1,
			},
			E_META_SANDSTONE_SMOOTH =
			{
				Type = "number",
				Value = 2,
			},
			E_META_SAND_NORMAL =
			{
				Type = "number",
				Value = 0,
			},
			E_META_SAND_RED =
			{
				Type = "number",
				Value = 1,
			},
			E_META_SAPLING_ACACIA =
			{
				Type = "number",
				Value = 4,
			},
			E_META_SAPLING_APPLE =
			{
				Type = "number",
				Value = 0,
			},
			E_META_SAPLING_BIRCH =
			{
				Type = "number",
				Value = 2,
			},
			E_META_SAPLING_CONIFER =
			{
				Type = "number",
				Value = 1,
			},
			E_META_SAPLING_DARK_OAK =
			{
				Type = "number",
				Value = 5,
			},
			E_META_SAPLING_JUNGLE =
			{
				Type = "number",
				Value = 3,
			},
			E_META_SILVERFISH_EGG_COBBLESTONE =
			{
				Type = "number",
				Value = 1,
			},
			E_META_SILVERFISH_EGG_STONE =
			{
				Type = "number",
				Value = 0,
			},
			E_META_SILVERFISH_EGG_STONE_BRICK =
			{
				Type = "number",
				Value = 2,
			},
			E_META_SNOW_LAYER_EIGHT =
			{
				Type = "number",
				Value = 7,
			},
			E_META_SNOW_LAYER_FIVE =
			{
				Type = "number",
				Value = 4,
			},
			E_META_SNOW_LAYER_FOUR =
			{
				Type = "number",
				Value = 3,
			},
			E_META_SNOW_LAYER_ONE =
			{
				Type = "number",
				Value = 0,
			},
			E_META_SNOW_LAYER_SEVEN =
			{
				Type = "number",
				Value = 6,
			},
			E_META_SNOW_LAYER_SIX =
			{
				Type = "number",
				Value = 5,
			},
			E_META_SNOW_LAYER_THREE =
			{
				Type = "number",
				Value = 2,
			},
			E_META_SNOW_LAYER_TWO =
			{
				Type = "number",
				Value = 1,
			},
			E_META_SPAWN_EGG_ARROW =
			{
				Type = "number",
				Value = 10,
			},
			E_META_SPAWN_EGG_BAT =
			{
				Type = "number",
				Value = 65,
			},
			E_META_SPAWN_EGG_BLAZE =
			{
				Type = "number",
				Value = 61,
			},
			E_META_SPAWN_EGG_BOAT =
			{
				Type = "number",
				Value = 41,
			},
			E_META_SPAWN_EGG_CAVE_SPIDER =
			{
				Type = "number",
				Value = 59,
			},
			E_META_SPAWN_EGG_CHICKEN =
			{
				Type = "number",
				Value = 93,
			},
			E_META_SPAWN_EGG_COW =
			{
				Type = "number",
				Value = 92,
			},
			E_META_SPAWN_EGG_CREEPER =
			{
				Type = "number",
				Value = 50,
			},
			E_META_SPAWN_EGG_ENDERMAN =
			{
				Type = "number",
				Value = 58,
			},
			E_META_SPAWN_EGG_ENDER_CRYSTAL =
			{
				Type = "number",
				Value = 200,
			},
			E_META_SPAWN_EGG_ENDER_DRAGON =
			{
				Type = "number",
				Value = 63,
			},
			E_META_SPAWN_EGG_ENDER_PEARL =
			{
				Type = "number",
				Value = 14,
			},
			E_META_SPAWN_EGG_EXPERIENCE_ORB =
			{
				Type = "number",
				Value = 2,
			},
			E_META_SPAWN_EGG_EXP_BOTTLE =
			{
				Type = "number",
				Value = 17,
			},
			E_META_SPAWN_EGG_EYE_OF_ENDER =
			{
				Type = "number",
				Value = 15,
			},
			E_META_SPAWN_EGG_FALLING_BLOCK =
			{
				Type = "number",
				Value = 21,
			},
			E_META_SPAWN_EGG_FIREBALL =
			{
				Type = "number",
				Value = 12,
			},
			E_META_SPAWN_EGG_FIREWORK =
			{
				Type = "number",
				Value = 22,
			},
			E_META_SPAWN_EGG_GHAST =
			{
				Type = "number",
				Value = 56,
			},
			E_META_SPAWN_EGG_GIANT =
			{
				Type = "number",
				Value = 53,
			},
			E_META_SPAWN_EGG_GUARDIAN =
			{
				Type = "number",
				Value = 68,
			},
			E_META_SPAWN_EGG_HORSE =
			{
				Type = "number",
				Value = 100,
			},
			E_META_SPAWN_EGG_IRON_GOLEM =
			{
				Type = "number",
				Value = 99,
			},
			E_META_SPAWN_EGG_ITEM_FRAME =
			{
				Type = "number",
				Value = 18,
			},
			E_META_SPAWN_EGG_LEASH_KNOT =
			{
				Type = "number",
				Value = 8,
			},
			E_META_SPAWN_EGG_MAGMA_CUBE =
			{
				Type = "number",
				Value = 62,
			},
			E_META_SPAWN_EGG_MINECART =
			{
				Type = "number",
				Value = 42,
			},
			E_META_SPAWN_EGG_MINECART_CHEST =
			{
				Type = "number",
				Value = 43,
			},
			E_META_SPAWN_EGG_MINECART_FURNACE =
			{
				Type = "number",
				Value = 44,
			},
			E_META_SPAWN_EGG_MINECART_HOPPER =
			{
				Type = "number",
				Value = 46,
			},
			E_META_SPAWN_EGG_MINECART_SPAWNER =
			{
				Type = "number",
				Value = 47,
			},
			E_META_SPAWN_EGG_MINECART_TNT =
			{
				Type = "number",
				Value = 45,
			},
			E_META_SPAWN_EGG_MOOSHROOM =
			{
				Type = "number",
				Value = 96,
			},
			E_META_SPAWN_EGG_OCELOT =
			{
				Type = "number",
				Value = 98,
			},
			E_META_SPAWN_EGG_PAINTING =
			{
				Type = "number",
				Value = 9,
			},
			E_META_SPAWN_EGG_PICKUP =
			{
				Type = "number",
				Value = 1,
			},
			E_META_SPAWN_EGG_PIG =
			{
				Type = "number",
				Value = 90,
			},
			E_META_SPAWN_EGG_PRIMED_TNT =
			{
				Type = "number",
				Value = 20,
			},
			E_META_SPAWN_EGG_RABBIT =
			{
				Type = "number",
				Value = 101,
			},
			E_META_SPAWN_EGG_SHEEP =
			{
				Type = "number",
				Value = 91,
			},
			E_META_SPAWN_EGG_SILVERFISH =
			{
				Type = "number",
				Value = 60,
			},
			E_META_SPAWN_EGG_SKELETON =
			{
				Type = "number",
				Value = 51,
			},
			E_META_SPAWN_EGG_SLIME =
			{
				Type = "number",
				Value = 55,
			},
			E_META_SPAWN_EGG_SMALL_FIREBALL =
			{
				Type = "number",
				Value = 13,
			},
			E_META_SPAWN_EGG_SNOWBALL =
			{
				Type = "number",
				Value = 11,
			},
			E_META_SPAWN_EGG_SNOW_GOLEM =
			{
				Type = "number",
				Value = 97,
			},
			E_META_SPAWN_EGG_SPIDER =
			{
				Type = "number",
				Value = 52,
			},
			E_META_SPAWN_EGG_SPLASH_POTION =
			{
				Type = "number",
				Value = 16,
			},
			E_META_SPAWN_EGG_SQUID =
			{
				Type = "number",
				Value = 94,
			},
			E_META_SPAWN_EGG_VILLAGER =
			{
				Type = "number",
				Value = 120,
			},
			E_META_SPAWN_EGG_WITCH =
			{
				Type = "number",
				Value = 66,
			},
			E_META_SPAWN_EGG_WITHER =
			{
				Type = "number",
				Value = 64,
			},
			E_META_SPAWN_EGG_WITHER_SKULL =
			{
				Type = "number",
				Value = 19,
			},
			E_META_SPAWN_EGG_WOLF =
			{
				Type = "number",
				Value = 95,
			},
			E_META_SPAWN_EGG_ZOMBIE =
			{
				Type = "number",
				Value = 54,
			},
			E_META_SPAWN_EGG_ZOMBIE_PIGMAN =
			{
				Type = "number",
				Value = 57,
			},
			E_META_STAINED_CLAY_BLACK =
			{
				Type = "number",
				Value = 15,
			},
			E_META_STAINED_CLAY_BLUE =
			{
				Type = "number",
				Value = 11,
			},
			E_META_STAINED_CLAY_BROWN =
			{
				Type = "number",
				Value = 12,
			},
			E_META_STAINED_CLAY_CYAN =
			{
				Type = "number",
				Value = 9,
			},
			E_META_STAINED_CLAY_GRAY =
			{
				Type = "number",
				Value = 7,
			},
			E_META_STAINED_CLAY_GREEN =
			{
				Type = "number",
				Value = 13,
			},
			E_META_STAINED_CLAY_LIGHTBLUE =
			{
				Type = "number",
				Value = 3,
			},
			E_META_STAINED_CLAY_LIGHTGRAY =
			{
				Type = "number",
				Value = 8,
			},
			E_META_STAINED_CLAY_LIGHTGREEN =
			{
				Type = "number",
				Value = 5,
			},
			E_META_STAINED_CLAY_MAGENTA =
			{
				Type = "number",
				Value = 2,
			},
			E_META_STAINED_CLAY_ORANGE =
			{
				Type = "number",
				Value = 1,
			},
			E_META_STAINED_CLAY_PINK =
			{
				Type = "number",
				Value = 6,
			},
			E_META_STAINED_CLAY_PURPLE =
			{
				Type = "number",
				Value = 10,
			},
			E_META_STAINED_CLAY_RED =
			{
				Type = "number",
				Value = 14,
			},
			E_META_STAINED_CLAY_WHITE =
			{
				Type = "number",
				Value = 0,
			},
			E_META_STAINED_CLAY_YELLOW =
			{
				Type = "number",
				Value = 4,
			},
			E_META_STAINED_GLASS_BLACK =
			{
				Type = "number",
				Value = 15,
			},
			E_META_STAINED_GLASS_BLUE =
			{
				Type = "number",
				Value = 11,
			},
			E_META_STAINED_GLASS_BROWN =
			{
				Type = "number",
				Value = 12,
			},
			E_META_STAINED_GLASS_CYAN =
			{
				Type = "number",
				Value = 9,
			},
			E_META_STAINED_GLASS_GRAY =
			{
				Type = "number",
				Value = 7,
			},
			E_META_STAINED_GLASS_GREEN =
			{
				Type = "number",
				Value = 13,
			},
			E_META_STAINED_GLASS_LIGHTBLUE =
			{
				Type = "number",
				Value = 3,
			},
			E_META_STAINED_GLASS_LIGHTGRAY =
			{
				Type = "number",
				Value = 8,
			},
			E_META_STAINED_GLASS_LIGHTGREEN =
			{
				Type = "number",
				Value = 5,
			},
			E_META_STAINED_GLASS_MAGENTA =
			{
				Type = "number",
				Value = 2,
			},
			E_META_STAINED_GLASS_ORANGE =
			{
				Type = "number",
				Value = 1,
			},
			E_META_STAINED_GLASS_PANE_BLACK =
			{
				Type = "number",
				Value = 15,
			},
			E_META_STAINED_GLASS_PANE_BLUE =
			{
				Type = "number",
				Value = 11,
			},
			E_META_STAINED_GLASS_PANE_BROWN =
			{
				Type = "number",
				Value = 12,
			},
			E_META_STAINED_GLASS_PANE_CYAN =
			{
				Type = "number",
				Value = 9,
			},
			E_META_STAINED_GLASS_PANE_GRAY =
			{
				Type = "number",
				Value = 7,
			},
			E_META_STAINED_GLASS_PANE_GREEN =
			{
				Type = "number",
				Value = 13,
			},
			E_META_STAINED_GLASS_PANE_LIGHTBLUE =
			{
				Type = "number",
				Value = 3,
			},
			E_META_STAINED_GLASS_PANE_LIGHTGRAY =
			{
				Type = "number",
				Value = 8,
			},
			E_META_STAINED_GLASS_PANE_LIGHTGREEN =
			{
				Type = "number",
				Value = 5,
			},
			E_META_STAINED_GLASS_PANE_MAGENTA =
			{
				Type = "number",
				Value = 2,
			},
			E_META_STAINED_GLASS_PANE_ORANGE =
			{
				Type = "number",
				Value = 1,
			},
			E_META_STAINED_GLASS_PANE_PINK =
			{
				Type = "number",
				Value = 6,
			},
			E_META_STAINED_GLASS_PANE_PURPLE =
			{
				Type = "number",
				Value = 10,
			},
			E_META_STAINED_GLASS_PANE_RED =
			{
				Type = "number",
				Value = 14,
			},
			E_META_STAINED_GLASS_PANE_WHITE =
			{
				Type = "number",
				Value = 0,
			},
			E_META_STAINED_GLASS_PANE_YELLOW =
			{
				Type = "number",
				Value = 4,
			},
			E_META_STAINED_GLASS_PINK =
			{
				Type = "number",
				Value = 6,
			},
			E_META_STAINED_GLASS_PURPLE =
			{
				Type = "number",
				Value = 10,
			},
			E_META_STAINED_GLASS_RED =
			{
				Type = "number",
				Value = 14,
			},
			E_META_STAINED_GLASS_WHITE =
			{
				Type = "number",
				Value = 0,
			},
			E_META_STAINED_GLASS_YELLOW =
			{
				Type = "number",
				Value = 4,
			},
			E_META_STONE_ANDESITE =
			{
				Type = "number",
				Value = 5,
			},
			E_META_STONE_BRICK_CRACKED =
			{
				Type = "number",
				Value = 2,
			},
			E_META_STONE_BRICK_MOSSY =
			{
				Type = "number",
				Value = 1,
			},
			E_META_STONE_BRICK_NORMAL =
			{
				Type = "number",
				Value = 0,
			},
			E_META_STONE_BRICK_ORNAMENT =
			{
				Type = "number",
				Value = 3,
			},
			E_META_STONE_DIORITE =
			{
				Type = "number",
				Value = 3,
			},
			E_META_STONE_GRANITE =
			{
				Type = "number",
				Value = 1,
			},
			E_META_STONE_POLISHED_ANDESITE =
			{
				Type = "number",
				Value = 6,
			},
			E_META_STONE_POLISHED_DIORITE =
			{
				Type = "number",
				Value = 4,
			},
			E_META_STONE_POLISHED_GRANITE =
			{
				Type = "number",
				Value = 2,
			},
			E_META_STONE_SLAB_BRICK =
			{
				Type = "number",
				Value = 4,
			},
			E_META_STONE_SLAB_COBBLESTONE =
			{
				Type = "number",
				Value = 3,
			},
			E_META_STONE_SLAB_NETHER_BRICK =
			{
				Type = "number",
				Value = 6,
			},
			E_META_STONE_SLAB_PLANKS =
			{
				Type = "number",
				Value = 2,
			},
			E_META_STONE_SLAB_QUARTZ =
			{
				Type = "number",
				Value = 7,
			},
			E_META_STONE_SLAB_SANDSTONE =
			{
				Type = "number",
				Value = 1,
			},
			E_META_STONE_SLAB_STONE =
			{
				Type = "number",
				Value = 0,
			},
			E_META_STONE_SLAB_STONE_BRICK =
			{
				Type = "number",
				Value = 5,
			},
			E_META_STONE_STONE =
			{
				Type = "number",
				Value = 0,
			},
			E_META_TALL_GRASS_BIOME =
			{
				Type = "number",
				Value = 3,
			},
			E_META_TALL_GRASS_DEAD_SHRUB =
			{
				Type = "number",
				Value = 0,
			},
			E_META_TALL_GRASS_FERN =
			{
				Type = "number",
				Value = 2,
			},
			E_META_TALL_GRASS_GRASS =
			{
				Type = "number",
				Value = 1,
			},
			E_META_TORCH_EAST =
			{
				Type = "number",
				Value = 1,
			},
			E_META_TORCH_FLOOR =
			{
				Type = "number",
				Value = 5,
			},
			E_META_TORCH_NORTH =
			{
				Type = "number",
				Value = 4,
			},
			E_META_TORCH_SOUTH =
			{
				Type = "number",
				Value = 3,
			},
			E_META_TORCH_WEST =
			{
				Type = "number",
				Value = 2,
			},
			E_META_TORCH_XM =
			{
				Type = "number",
				Value = 1,
			},
			E_META_TORCH_XP =
			{
				Type = "number",
				Value = 2,
			},
			E_META_TORCH_ZM =
			{
				Type = "number",
				Value = 3,
			},
			E_META_TORCH_ZP =
			{
				Type = "number",
				Value = 4,
			},
			E_META_TRACKS_X =
			{
				Type = "number",
				Value = 1,
			},
			E_META_TRACKS_Z =
			{
				Type = "number",
				Value = 0,
			},
			E_META_WOODEN_DOUBLE_SLAB_ACACIA =
			{
				Type = "number",
				Value = 4,
			},
			E_META_WOODEN_DOUBLE_SLAB_BIRCH =
			{
				Type = "number",
				Value = 2,
			},
			E_META_WOODEN_DOUBLE_SLAB_DARK_OAK =
			{
				Type = "number",
				Value = 5,
			},
			E_META_WOODEN_DOUBLE_SLAB_JUNGLE =
			{
				Type = "number",
				Value = 3,
			},
			E_META_WOODEN_DOUBLE_SLAB_OAK =
			{
				Type = "number",
				Value = 0,
			},
			E_META_WOODEN_DOUBLE_SLAB_SPRUCE =
			{
				Type = "number",
				Value = 1,
			},
			E_META_WOODEN_SLAB_ACACIA =
			{
				Type = "number",
				Value = 4,
			},
			E_META_WOODEN_SLAB_BIRCH =
			{
				Type = "number",
				Value = 2,
			},
			E_META_WOODEN_SLAB_DARK_OAK =
			{
				Type = "number",
				Value = 5,
			},
			E_META_WOODEN_SLAB_JUNGLE =
			{
				Type = "number",
				Value = 3,
			},
			E_META_WOODEN_SLAB_OAK =
			{
				Type = "number",
				Value = 0,
			},
			E_META_WOODEN_SLAB_SPRUCE =
			{
				Type = "number",
				Value = 1,
			},
			E_META_WOODEN_SLAB_UPSIDE_DOWN =
			{
				Type = "number",
				Value = 8,
			},
			E_META_WOOL_BLACK =
			{
				Type = "number",
				Value = 15,
			},
			E_META_WOOL_BLUE =
			{
				Type = "number",
				Value = 11,
			},
			E_META_WOOL_BROWN =
			{
				Type = "number",
				Value = 12,
			},
			E_META_WOOL_CYAN =
			{
				Type = "number",
				Value = 9,
			},
			E_META_WOOL_GRAY =
			{
				Type = "number",
				Value = 7,
			},
			E_META_WOOL_GREEN =
			{
				Type = "number",
				Value = 13,
			},
			E_META_WOOL_LIGHTBLUE =
			{
				Type = "number",
				Value = 3,
			},
			E_META_WOOL_LIGHTGRAY =
			{
				Type = "number",
				Value = 8,
			},
			E_META_WOOL_LIGHTGREEN =
			{
				Type = "number",
				Value = 5,
			},
			E_META_WOOL_MAGENTA =
			{
				Type = "number",
				Value = 2,
			},
			E_META_WOOL_ORANGE =
			{
				Type = "number",
				Value = 1,
			},
			E_META_WOOL_PINK =
			{
				Type = "number",
				Value = 6,
			},
			E_META_WOOL_PURPLE =
			{
				Type = "number",
				Value = 10,
			},
			E_META_WOOL_RED =
			{
				Type = "number",
				Value = 14,
			},
			E_META_WOOL_WHITE =
			{
				Type = "number",
				Value = 0,
			},
			E_META_WOOL_YELLOW =
			{
				Type = "number",
				Value = 4,
			},
			MAX_EXPERIENCE_ORB_SIZE =
			{
				Type = "number",
				Value = 2000,
			},
			SKULL_ROTATION_EAST =
			{
				Type = "number",
				Value = 4,
			},
			SKULL_ROTATION_EAST_NORTH_EAST =
			{
				Type = "number",
				Value = 3,
			},
			SKULL_ROTATION_EAST_SOUTH_EAST =
			{
				Type = "number",
				Value = 5,
			},
			SKULL_ROTATION_NORTH =
			{
				Type = "number",
				Value = 0,
			},
			SKULL_ROTATION_NORTH_EAST =
			{
				Type = "number",
				Value = 2,
			},
			SKULL_ROTATION_NORTH_NORTH_EAST =
			{
				Type = "number",
				Value = 1,
			},
			SKULL_ROTATION_NORTH_NORTH_WEST =
			{
				Type = "number",
				Value = 15,
			},
			SKULL_ROTATION_NORTH_WEST =
			{
				Type = "number",
				Value = 14,
			},
			SKULL_ROTATION_SOUTH =
			{
				Type = "number",
				Value = 8,
			},
			SKULL_ROTATION_SOUTH_EAST =
			{
				Type = "number",
				Value = 6,
			},
			SKULL_ROTATION_SOUTH_SOUTH_EAST =
			{
				Type = "number",
				Value = 7,
			},
			SKULL_ROTATION_SOUTH_SOUTH_WEST =
			{
				Type = "number",
				Value = 9,
			},
			SKULL_ROTATION_SOUTH_WEST =
			{
				Type = "number",
				Value = 10,
			},
			SKULL_ROTATION_WEST =
			{
				Type = "number",
				Value = 12,
			},
			SKULL_ROTATION_WEST_NORTH_WEST =
			{
				Type = "number",
				Value = 13,
			},
			SKULL_ROTATION_WEST_SOUTH_WEST =
			{
				Type = "number",
				Value = 11,
			},
			SKULL_TYPE_CREEPER =
			{
				Type = "number",
				Value = 4,
			},
			SKULL_TYPE_PLAYER =
			{
				Type = "number",
				Value = 3,
			},
			SKULL_TYPE_SKELETON =
			{
				Type = "number",
				Value = 0,
			},
			SKULL_TYPE_WITHER =
			{
				Type = "number",
				Value = 1,
			},
			SKULL_TYPE_ZOMBIE =
			{
				Type = "number",
				Value = 2,
			},
			_CuberiteInternal_PluginName =
			{
				Type = "string",
				Value = "ManualApiDump",
			},
			_VERSION =
			{
				Type = "string",
				Value = "Lua 5.1",
			},
			achAcquireIron =
			{
				Type = "number",
				Value = 5,
			},
			achBakeCake =
			{
				Type = "number",
				Value = 8,
			},
			achBlazeRod =
			{
				Type = "number",
				Value = 20,
			},
			achBookshelf =
			{
				Type = "number",
				Value = 26,
			},
			achBreedCow =
			{
				Type = "number",
				Value = 31,
			},
			achBrewPotion =
			{
				Type = "number",
				Value = 21,
			},
			achCookFish =
			{
				Type = "number",
				Value = 10,
			},
			achCraftBetterPick =
			{
				Type = "number",
				Value = 9,
			},
			achCraftEnchantTable =
			{
				Type = "number",
				Value = 24,
			},
			achCraftFurnace =
			{
				Type = "number",
				Value = 4,
			},
			achCraftHoe =
			{
				Type = "number",
				Value = 6,
			},
			achCraftPickaxe =
			{
				Type = "number",
				Value = 3,
			},
			achCraftSword =
			{
				Type = "number",
				Value = 12,
			},
			achCraftWorkbench =
			{
				Type = "number",
				Value = 2,
			},
			achDefeatDragon =
			{
				Type = "number",
				Value = 23,
			},
			achDiamonds =
			{
				Type = "number",
				Value = 17,
			},
			achEnterPortal =
			{
				Type = "number",
				Value = 18,
			},
			achEnterTheEnd =
			{
				Type = "number",
				Value = 22,
			},
			achExploreAllBiomes =
			{
				Type = "number",
				Value = 27,
			},
			achFlyPig =
			{
				Type = "number",
				Value = 15,
			},
			achFullBeacon =
			{
				Type = "number",
				Value = 30,
			},
			achKillCow =
			{
				Type = "number",
				Value = 14,
			},
			achKillMonster =
			{
				Type = "number",
				Value = 13,
			},
			achKillWither =
			{
				Type = "number",
				Value = 29,
			},
			achMakeBread =
			{
				Type = "number",
				Value = 7,
			},
			achMineWood =
			{
				Type = "number",
				Value = 1,
			},
			achOnARail =
			{
				Type = "number",
				Value = 11,
			},
			achOpenInv =
			{
				Type = "number",
				Value = 0,
			},
			achOverkill =
			{
				Type = "number",
				Value = 25,
			},
			achReturnToSender =
			{
				Type = "number",
				Value = 19,
			},
			achSnipeSkeleton =
			{
				Type = "number",
				Value = 16,
			},
			achSpawnWither =
			{
				Type = "number",
				Value = 28,
			},
			achThrowDiamonds =
			{
				Type = "number",
				Value = 32,
			},
			biBeach =
			{
				Type = "number",
				Value = 16,
			},
			biBirchForest =
			{
				Type = "number",
				Value = 27,
			},
			biBirchForestHills =
			{
				Type = "number",
				Value = 28,
			},
			biBirchForestHillsM =
			{
				Type = "number",
				Value = 156,
			},
			biBirchForestM =
			{
				Type = "number",
				Value = 155,
			},
			biColdBeach =
			{
				Type = "number",
				Value = 26,
			},
			biColdTaiga =
			{
				Type = "number",
				Value = 30,
			},
			biColdTaigaHills =
			{
				Type = "number",
				Value = 31,
			},
			biColdTaigaM =
			{
				Type = "number",
				Value = 158,
			},
			biDeepOcean =
			{
				Type = "number",
				Value = 24,
			},
			biDesert =
			{
				Type = "number",
				Value = 2,
			},
			biDesertHills =
			{
				Type = "number",
				Value = 17,
			},
			biDesertM =
			{
				Type = "number",
				Value = 130,
			},
			biEnd =
			{
				Type = "number",
				Value = 9,
			},
			biExtremeHills =
			{
				Type = "number",
				Value = 3,
			},
			biExtremeHillsEdge =
			{
				Type = "number",
				Value = 20,
			},
			biExtremeHillsM =
			{
				Type = "number",
				Value = 131,
			},
			biExtremeHillsPlus =
			{
				Type = "number",
				Value = 34,
			},
			biExtremeHillsPlusM =
			{
				Type = "number",
				Value = 162,
			},
			biFirstBiome =
			{
				Type = "number",
				Value = 0,
			},
			biFirstVariantBiome =
			{
				Type = "number",
				Value = 129,
			},
			biFlowerForest =
			{
				Type = "number",
				Value = 132,
			},
			biForest =
			{
				Type = "number",
				Value = 4,
			},
			biForestHills =
			{
				Type = "number",
				Value = 18,
			},
			biFrozenOcean =
			{
				Type = "number",
				Value = 10,
			},
			biFrozenRiver =
			{
				Type = "number",
				Value = 11,
			},
			biHell =
			{
				Type = "number",
				Value = 8,
			},
			biIceMountains =
			{
				Type = "number",
				Value = 13,
			},
			biIcePlains =
			{
				Type = "number",
				Value = 12,
			},
			biIcePlainsSpikes =
			{
				Type = "number",
				Value = 140,
			},
			biInvalidBiome =
			{
				Type = "number",
				Value = -1,
			},
			biJungle =
			{
				Type = "number",
				Value = 21,
			},
			biJungleEdge =
			{
				Type = "number",
				Value = 23,
			},
			biJungleEdgeM =
			{
				Type = "number",
				Value = 151,
			},
			biJungleHills =
			{
				Type = "number",
				Value = 22,
			},
			biJungleM =
			{
				Type = "number",
				Value = 149,
			},
			biMaxBiome =
			{
				Type = "number",
				Value = 39,
			},
			biMaxVariantBiome =
			{
				Type = "number",
				Value = 167,
			},
			biMegaSpruceTaiga =
			{
				Type = "number",
				Value = 160,
			},
			biMegaSpruceTaigaHills =
			{
				Type = "number",
				Value = 161,
			},
			biMegaTaiga =
			{
				Type = "number",
				Value = 32,
			},
			biMegaTaigaHills =
			{
				Type = "number",
				Value = 33,
			},
			biMesa =
			{
				Type = "number",
				Value = 37,
			},
			biMesaBryce =
			{
				Type = "number",
				Value = 165,
			},
			biMesaPlateau =
			{
				Type = "number",
				Value = 39,
			},
			biMesaPlateauF =
			{
				Type = "number",
				Value = 38,
			},
			biMesaPlateauFM =
			{
				Type = "number",
				Value = 166,
			},
			biMesaPlateauM =
			{
				Type = "number",
				Value = 167,
			},
			biMushroomIsland =
			{
				Type = "number",
				Value = 14,
			},
			biMushroomShore =
			{
				Type = "number",
				Value = 15,
			},
			biNether =
			{
				Type = "number",
				Value = 8,
			},
			biNumBiomes =
			{
				Type = "number",
				Value = 40,
			},
			biNumVariantBiomes =
			{
				Type = "number",
				Value = 168,
			},
			biOcean =
			{
				Type = "number",
				Value = 0,
			},
			biPlains =
			{
				Type = "number",
				Value = 1,
			},
			biRiver =
			{
				Type = "number",
				Value = 7,
			},
			biRoofedForest =
			{
				Type = "number",
				Value = 29,
			},
			biRoofedForestM =
			{
				Type = "number",
				Value = 157,
			},
			biSavanna =
			{
				Type = "number",
				Value = 35,
			},
			biSavannaM =
			{
				Type = "number",
				Value = 163,
			},
			biSavannaPlateau =
			{
				Type = "number",
				Value = 36,
			},
			biSavannaPlateauM =
			{
				Type = "number",
				Value = 164,
			},
			biSky =
			{
				Type = "number",
				Value = 9,
			},
			biStoneBeach =
			{
				Type = "number",
				Value = 25,
			},
			biSunflowerPlains =
			{
				Type = "number",
				Value = 129,
			},
			biSwampland =
			{
				Type = "number",
				Value = 6,
			},
			biSwamplandM =
			{
				Type = "number",
				Value = 134,
			},
			biTaiga =
			{
				Type = "number",
				Value = 5,
			},
			biTaigaHills =
			{
				Type = "number",
				Value = 19,
			},
			biTaigaM =
			{
				Type = "number",
				Value = 133,
			},
			biTundra =
			{
				Type = "number",
				Value = 12,
			},
			biVariant =
			{
				Type = "number",
				Value = 128,
			},
			caCtrlDropKey =
			{
				Type = "number",
				Value = 15,
			},
			caDblClick =
			{
				Type = "number",
				Value = 26,
			},
			caDropKey =
			{
				Type = "number",
				Value = 14,
			},
			caLeftClick =
			{
				Type = "number",
				Value = 0,
			},
			caLeftClickOutside =
			{
				Type = "number",
				Value = 16,
			},
			caLeftClickOutsideHoldNothing =
			{
				Type = "number",
				Value = 18,
			},
			caLeftPaintBegin =
			{
				Type = "number",
				Value = 20,
			},
			caLeftPaintEnd =
			{
				Type = "number",
				Value = 24,
			},
			caLeftPaintProgress =
			{
				Type = "number",
				Value = 22,
			},
			caMiddleClick =
			{
				Type = "number",
				Value = 13,
			},
			caNumber1 =
			{
				Type = "number",
				Value = 4,
			},
			caNumber2 =
			{
				Type = "number",
				Value = 5,
			},
			caNumber3 =
			{
				Type = "number",
				Value = 6,
			},
			caNumber4 =
			{
				Type = "number",
				Value = 7,
			},
			caNumber5 =
			{
				Type = "number",
				Value = 8,
			},
			caNumber6 =
			{
				Type = "number",
				Value = 9,
			},
			caNumber7 =
			{
				Type = "number",
				Value = 10,
			},
			caNumber8 =
			{
				Type = "number",
				Value = 11,
			},
			caNumber9 =
			{
				Type = "number",
				Value = 12,
			},
			caRightClick =
			{
				Type = "number",
				Value = 1,
			},
			caRightClickOutside =
			{
				Type = "number",
				Value = 17,
			},
			caRightClickOutsideHoldNothing =
			{
				Type = "number",
				Value = 19,
			},
			caRightPaintBegin =
			{
				Type = "number",
				Value = 21,
			},
			caRightPaintEnd =
			{
				Type = "number",
				Value = 25,
			},
			caRightPaintProgress =
			{
				Type = "number",
				Value = 23,
			},
			caShiftLeftClick =
			{
				Type = "number",
				Value = 2,
			},
			caShiftRightClick =
			{
				Type = "number",
				Value = 3,
			},
			caUnknown =
			{
				Type = "number",
				Value = 255,
			},
			ctAboveActionBar =
			{
				Type = "number",
				Value = 2,
			},
			ctChatBox =
			{
				Type = "number",
				Value = 0,
			},
			ctSystem =
			{
				Type = "number",
				Value = 1,
			},
			dimEnd =
			{
				Type = "number",
				Value = 1,
			},
			dimNether =
			{
				Type = "number",
				Value = -1,
			},
			dimNotSet =
			{
				Type = "number",
				Value = 255,
			},
			dimOverworld =
			{
				Type = "number",
				Value = 0,
			},
			dtAdmin =
			{
				Type = "number",
				Value = 16,
			},
			dtArrow =
			{
				Type = "number",
				Value = 1,
			},
			dtArrowAttack =
			{
				Type = "number",
				Value = 1,
			},
			dtAttack =
			{
				Type = "number",
				Value = 0,
			},
			dtBurning =
			{
				Type = "number",
				Value = 11,
			},
			dtCacti =
			{
				Type = "number",
				Value = 7,
			},
			dtCactus =
			{
				Type = "number",
				Value = 7,
			},
			dtCactusContact =
			{
				Type = "number",
				Value = 7,
			},
			dtCactuses =
			{
				Type = "number",
				Value = 7,
			},
			dtDrown =
			{
				Type = "number",
				Value = 4,
			},
			dtDrowning =
			{
				Type = "number",
				Value = 4,
			},
			dtEnderPearl =
			{
				Type = "number",
				Value = 15,
			},
			dtEntityAttack =
			{
				Type = "number",
				Value = 0,
			},
			dtExplosion =
			{
				Type = "number",
				Value = 17,
			},
			dtFall =
			{
				Type = "number",
				Value = 3,
			},
			dtFalling =
			{
				Type = "number",
				Value = 3,
			},
			dtFireContact =
			{
				Type = "number",
				Value = 12,
			},
			dtHunger =
			{
				Type = "number",
				Value = 6,
			},
			dtInFire =
			{
				Type = "number",
				Value = 12,
			},
			dtInVoid =
			{
				Type = "number",
				Value = 13,
			},
			dtLava =
			{
				Type = "number",
				Value = 8,
			},
			dtLavaContact =
			{
				Type = "number",
				Value = 8,
			},
			dtLightning =
			{
				Type = "number",
				Value = 2,
			},
			dtMob =
			{
				Type = "number",
				Value = 0,
			},
			dtMobAttack =
			{
				Type = "number",
				Value = 0,
			},
			dtOnFire =
			{
				Type = "number",
				Value = 11,
			},
			dtPawnAttack =
			{
				Type = "number",
				Value = 0,
			},
			dtPlugin =
			{
				Type = "number",
				Value = 16,
			},
			dtPoison =
			{
				Type = "number",
				Value = 9,
			},
			dtPoisoning =
			{
				Type = "number",
				Value = 9,
			},
			dtPotionOfHarming =
			{
				Type = "number",
				Value = 14,
			},
			dtProjectile =
			{
				Type = "number",
				Value = 1,
			},
			dtRangedAttack =
			{
				Type = "number",
				Value = 1,
			},
			dtStarvation =
			{
				Type = "number",
				Value = 6,
			},
			dtStarving =
			{
				Type = "number",
				Value = 6,
			},
			dtSuffocating =
			{
				Type = "number",
				Value = 5,
			},
			dtSuffocation =
			{
				Type = "number",
				Value = 5,
			},
			dtWither =
			{
				Type = "number",
				Value = 10,
			},
			dtWithering =
			{
				Type = "number",
				Value = 10,
			},
			eGameMode_Adventure =
			{
				Type = "number",
				Value = 2,
			},
			eGameMode_Creative =
			{
				Type = "number",
				Value = 1,
			},
			eGameMode_NotSet =
			{
				Type = "number",
				Value = -1,
			},
			eGameMode_Spectator =
			{
				Type = "number",
				Value = 3,
			},
			eGameMode_Survival =
			{
				Type = "number",
				Value = 0,
			},
			eWeather_Rain =
			{
				Type = "number",
				Value = 1,
			},
			eWeather_Sunny =
			{
				Type = "number",
				Value = 0,
			},
			eWeather_ThunderStorm =
			{
				Type = "number",
				Value = 2,
			},
			esBed =
			{
				Type = "number",
				Value = 0,
			},
			esEnderCrystal =
			{
				Type = "number",
				Value = 1,
			},
			esGhastFireball =
			{
				Type = "number",
				Value = 2,
			},
			esMax =
			{
				Type = "number",
				Value = 9,
			},
			esMonster =
			{
				Type = "number",
				Value = 3,
			},
			esOther =
			{
				Type = "number",
				Value = 4,
			},
			esPlugin =
			{
				Type = "number",
				Value = 5,
			},
			esPrimedTNT =
			{
				Type = "number",
				Value = 6,
			},
			esWitherBirth =
			{
				Type = "number",
				Value = 7,
			},
			esWitherSkull =
			{
				Type = "number",
				Value = 8,
			},
			g_BlockFullyOccupiesVoxel =
			{
				Name = "g_BlockFullyOccupiesVoxel",
			},
			g_BlockIsSnowable =
			{
				Name = "g_BlockIsSnowable",
			},
			g_BlockIsSolid =
			{
				Name = "g_BlockIsSolid",
			},
			g_BlockLightValue =
			{
				Name = "g_BlockLightValue",
			},
			g_BlockOneHitDig =
			{
				Name = "g_BlockOneHitDig",
			},
			g_BlockPistonBreakable =
			{
				Name = "g_BlockPistonBreakable",
			},
			g_BlockSpreadLightFalloff =
			{
				Name = "g_BlockSpreadLightFalloff",
			},
			g_BlockTransparent =
			{
				Name = "g_BlockTransparent",
			},
			gmAdventure =
			{
				Type = "number",
				Value = 2,
			},
			gmCreative =
			{
				Type = "number",
				Value = 1,
			},
			gmMax =
			{
				Type = "number",
				Value = 4,
			},
			gmMin =
			{
				Type = "number",
				Value = 0,
			},
			gmNotSet =
			{
				Type = "number",
				Value = -1,
			},
			gmSpectator =
			{
				Type = "number",
				Value = 3,
			},
			gmSurvival =
			{
				Type = "number",
				Value = 0,
			},
			mtBat =
			{
				Type = "number",
				Value = 65,
			},
			mtBlaze =
			{
				Type = "number",
				Value = 61,
			},
			mtCaveSpider =
			{
				Type = "number",
				Value = 59,
			},
			mtChicken =
			{
				Type = "number",
				Value = 93,
			},
			mtCow =
			{
				Type = "number",
				Value = 92,
			},
			mtCreeper =
			{
				Type = "number",
				Value = 50,
			},
			mtCustom =
			{
				Type = "number",
				Value = 0,
			},
			mtDeath =
			{
				Type = "number",
				Value = 6,
			},
			mtEnderDragon =
			{
				Type = "number",
				Value = 63,
			},
			mtEnderman =
			{
				Type = "number",
				Value = 58,
			},
			mtError =
			{
				Type = "number",
				Value = 1,
			},
			mtFail =
			{
				Type = "number",
				Value = 1,
			},
			mtFailure =
			{
				Type = "number",
				Value = 1,
			},
			mtFatal =
			{
				Type = "number",
				Value = 5,
			},
			mtGhast =
			{
				Type = "number",
				Value = 56,
			},
			mtGiant =
			{
				Type = "number",
				Value = 53,
			},
			mtGuardian =
			{
				Type = "number",
				Value = 68,
			},
			mtHorse =
			{
				Type = "number",
				Value = 100,
			},
			mtInfo =
			{
				Type = "number",
				Value = 2,
			},
			mtInformation =
			{
				Type = "number",
				Value = 2,
			},
			mtInvalidType =
			{
				Type = "number",
				Value = -1,
			},
			mtIronGolem =
			{
				Type = "number",
				Value = 99,
			},
			mtJoin =
			{
				Type = "number",
				Value = 8,
			},
			mtLeave =
			{
				Type = "number",
				Value = 9,
			},
			mtMagmaCube =
			{
				Type = "number",
				Value = 62,
			},
			mtMax =
			{
				Type = "number",
				Value = 120,
			},
			mtMaxPlusOne =
			{
				Type = "number",
				Value = 10,
			},
			mtMooshroom =
			{
				Type = "number",
				Value = 96,
			},
			mtOcelot =
			{
				Type = "number",
				Value = 98,
			},
			mtPM =
			{
				Type = "number",
				Value = 7,
			},
			mtPig =
			{
				Type = "number",
				Value = 90,
			},
			mtPrivateMessage =
			{
				Type = "number",
				Value = 7,
			},
			mtRabbit =
			{
				Type = "number",
				Value = 101,
			},
			mtSheep =
			{
				Type = "number",
				Value = 91,
			},
			mtSilverfish =
			{
				Type = "number",
				Value = 60,
			},
			mtSkeleton =
			{
				Type = "number",
				Value = 51,
			},
			mtSlime =
			{
				Type = "number",
				Value = 55,
			},
			mtSnowGolem =
			{
				Type = "number",
				Value = 97,
			},
			mtSpider =
			{
				Type = "number",
				Value = 52,
			},
			mtSquid =
			{
				Type = "number",
				Value = 94,
			},
			mtSuccess =
			{
				Type = "number",
				Value = 3,
			},
			mtVillager =
			{
				Type = "number",
				Value = 120,
			},
			mtWarning =
			{
				Type = "number",
				Value = 4,
			},
			mtWitch =
			{
				Type = "number",
				Value = 66,
			},
			mtWither =
			{
				Type = "number",
				Value = 64,
			},
			mtWolf =
			{
				Type = "number",
				Value = 95,
			},
			mtZombie =
			{
				Type = "number",
				Value = 54,
			},
			mtZombiePigman =
			{
				Type = "number",
				Value = 57,
			},
			slAll =
			{
				Type = "number",
				Value = 2,
			},
			slGravityAffectedOnly =
			{
				Type = "number",
				Value = 1,
			},
			slNone =
			{
				Type = "number",
				Value = 0,
			},
			ssFireSpread =
			{
				Type = "number",
				Value = 0,
			},
			ssGrassSpread =
			{
				Type = "number",
				Value = 1,
			},
			ssMushroomSpread =
			{
				Type = "number",
				Value = 2,
			},
			ssMycelSpread =
			{
				Type = "number",
				Value = 3,
			},
			ssVineSpread =
			{
				Type = "number",
				Value = 4,
			},
			statAnimalsBred =
			{
				Type = "number",
				Value = 51,
			},
			statCount =
			{
				Type = "number",
				Value = 56,
			},
			statDamageDealt =
			{
				Type = "number",
				Value = 47,
			},
			statDamageTaken =
			{
				Type = "number",
				Value = 48,
			},
			statDeaths =
			{
				Type = "number",
				Value = 49,
			},
			statDistBoat =
			{
				Type = "number",
				Value = 42,
			},
			statDistClimbed =
			{
				Type = "number",
				Value = 38,
			},
			statDistDove =
			{
				Type = "number",
				Value = 40,
			},
			statDistFallen =
			{
				Type = "number",
				Value = 37,
			},
			statDistFlown =
			{
				Type = "number",
				Value = 39,
			},
			statDistHorse =
			{
				Type = "number",
				Value = 44,
			},
			statDistMinecart =
			{
				Type = "number",
				Value = 41,
			},
			statDistPig =
			{
				Type = "number",
				Value = 43,
			},
			statDistSwum =
			{
				Type = "number",
				Value = 36,
			},
			statDistWalked =
			{
				Type = "number",
				Value = 35,
			},
			statFishCaught =
			{
				Type = "number",
				Value = 53,
			},
			statGamesQuit =
			{
				Type = "number",
				Value = 33,
			},
			statInvalid =
			{
				Type = "number",
				Value = -1,
			},
			statItemsDropped =
			{
				Type = "number",
				Value = 46,
			},
			statJumps =
			{
				Type = "number",
				Value = 45,
			},
			statJunkFished =
			{
				Type = "number",
				Value = 54,
			},
			statMinutesPlayed =
			{
				Type = "number",
				Value = 34,
			},
			statMobKills =
			{
				Type = "number",
				Value = 50,
			},
			statPlayerKills =
			{
				Type = "number",
				Value = 52,
			},
			statTreasureFished =
			{
				Type = "number",
				Value = 55,
			},
			wRain =
			{
				Type = "number",
				Value = 1,
			},
			wStorm =
			{
				Type = "number",
				Value = 2,
			},
			wSunny =
			{
				Type = "number",
				Value = 0,
			},
			wThunderstorm =
			{
				Type = "number",
				Value = 2,
			},
		},
		Enums =
		{
			DigStatuses =
			{
				{
					Name = "DIG_STATUS_SHOOT_EAT",
				},
				{
					Name = "DIG_STATUS_DROP_HELD",
				},
				{
					Name = "DIG_STATUS_SWAP_ITEM_IN_HAND",
				},
				{
					Name = "DIG_STATUS_FINISHED",
				},
				{
					Name = "DIG_STATUS_DROP_STACK",
				},
				{
					Name = "DIG_STATUS_CANCELLED",
				},
				{
					Name = "DIG_STATUS_STARTED",
				},
			},
			EMCSBiome =
			{
				{
					Name = "biSavanna",
				},
				{
					Name = "biExtremeHillsEdge",
				},
				{
					Name = "biJungle",
				},
				{
					Name = "biMegaSpruceTaigaHills",
				},
				{
					Name = "biColdTaiga",
				},
				{
					Name = "biSwampland",
				},
				{
					Name = "biMesaPlateauF",
				},
				{
					Name = "biFlowerForest",
				},
				{
					Name = "biStoneBeach",
				},
				{
					Name = "biExtremeHillsM",
				},
				{
					Name = "biOcean",
				},
				{
					Name = "biSky",
				},
				{
					Name = "biMesaBryce",
				},
				{
					Name = "biJungleM",
				},
				{
					Name = "biNumVariantBiomes",
				},
				{
					Name = "biPlains",
				},
				{
					Name = "biFirstBiome",
				},
				{
					Name = "biFrozenRiver",
				},
				{
					Name = "biMaxVariantBiome",
				},
				{
					Name = "biMesaPlateauM",
				},
				{
					Name = "biExtremeHillsPlus",
				},
				{
					Name = "biTaigaHills",
				},
				{
					Name = "biFirstVariantBiome",
				},
				{
					Name = "biJungleEdgeM",
				},
				{
					Name = "biMesa",
				},
				{
					Name = "biDeepOcean",
				},
				{
					Name = "biBirchForestHills",
				},
				{
					Name = "biMegaTaiga",
				},
				{
					Name = "biMegaSpruceTaiga",
				},
				{
					Name = "biBirchForestM",
				},
				{
					Name = "biColdTaigaHills",
				},
				{
					Name = "biJungleHills",
				},
				{
					Name = "biIcePlainsSpikes",
				},
				{
					Name = "biExtremeHills",
				},
				{
					Name = "biSwamplandM",
				},
				{
					Name = "biMushroomShore",
				},
				{
					Name = "biSavannaPlateauM",
				},
				{
					Name = "biEnd",
				},
				{
					Name = "biMesaPlateauFM",
				},
				{
					Name = "biHell",
				},
				{
					Name = "biSunflowerPlains",
				},
				{
					Name = "biDesertM",
				},
				{
					Name = "biColdTaigaM",
				},
				{
					Name = "biColdBeach",
				},
				{
					Name = "biIceMountains",
				},
				{
					Name = "biRiver",
				},
				{
					Name = "biMushroomIsland",
				},
				{
					Name = "biRoofedForest",
				},
				{
					Name = "biNumBiomes",
				},
				{
					Name = "biFrozenOcean",
				},
				{
					Name = "biMegaTaigaHills",
				},
				{
					Name = "biIcePlains",
				},
				{
					Name = "biRoofedForestM",
				},
				{
					Name = "biTundra",
				},
				{
					Name = "biExtremeHillsPlusM",
				},
				{
					Name = "biJungleEdge",
				},
				{
					Name = "biMaxBiome",
				},
				{
					Name = "biSavannaPlateau",
				},
				{
					Name = "biSavannaM",
				},
				{
					Name = "biBirchForest",
				},
				{
					Name = "biTaiga",
				},
				{
					Name = "biBeach",
				},
				{
					Name = "biVariant",
				},
				{
					Name = "biForest",
				},
				{
					Name = "biBirchForestHillsM",
				},
				{
					Name = "biInvalidBiome",
				},
				{
					Name = "biForestHills",
				},
				{
					Name = "biDesertHills",
				},
				{
					Name = "biMesaPlateau",
				},
				{
					Name = "biNether",
				},
				{
					Name = "biDesert",
				},
				{
					Name = "biTaigaM",
				},
			},
			ItemTypes =
			{
				{
					Name = "E_ITEM_DIAMOND",
				},
				{
					Name = "E_ITEM_SUGARCANE",
				},
				{
					Name = "E_ITEM_POTATO",
				},
				{
					Name = "E_ITEM_GOLD_LEGGINGS",
				},
				{
					Name = "E_ITEM_BANNER",
				},
				{
					Name = "E_ITEM_RAW_RABBIT",
				},
				{
					Name = "E_ITEM_REDSTONE_DUST",
				},
				{
					Name = "E_ITEM_LEATHER_PANTS",
				},
				{
					Name = "E_ITEM_CARROT",
				},
				{
					Name = "E_ITEM_FIREWORK_STAR",
				},
				{
					Name = "E_ITEM_COOKIE",
				},
				{
					Name = "E_ITEM_COOKED_PORKCHOP",
				},
				{
					Name = "E_ITEM_BOWL",
				},
				{
					Name = "E_ITEM_NETHER_STAR",
				},
				{
					Name = "E_ITEM_STAL_DISC",
				},
				{
					Name = "E_ITEM_SLIMEBALL",
				},
				{
					Name = "E_ITEM_PUMPKIN_PIE",
				},
				{
					Name = "E_ITEM_11_DISC",
				},
				{
					Name = "E_ITEM_LAST_DISC_PLUS_ONE",
				},
				{
					Name = "E_ITEM_SUGAR",
				},
				{
					Name = "E_ITEM_STONE_AXE",
				},
				{
					Name = "E_ITEM_RED_APPLE",
				},
				{
					Name = "E_ITEM_WRITTEN_BOOK",
				},
				{
					Name = "E_ITEM_13_DISC",
				},
				{
					Name = "E_ITEM_CAKE",
				},
				{
					Name = "E_ITEM_GOLD_HELMET",
				},
				{
					Name = "E_ITEM_RABBIT_STEW",
				},
				{
					Name = "E_ITEM_GOLDEN_APPLE",
				},
				{
					Name = "E_ITEM_COOKED_MUTTON",
				},
				{
					Name = "E_ITEM_NUMBER_OF_CONSECUTIVE_TYPES",
				},
				{
					Name = "E_ITEM_MAP",
				},
				{
					Name = "E_ITEM_BUCKET",
				},
				{
					Name = "E_ITEM_COOKED_RABBIT",
				},
				{
					Name = "E_ITEM_SPRUCE_DOOR",
				},
				{
					Name = "E_ITEM_STONE_SHOVEL",
				},
				{
					Name = "E_ITEM_RAW_PORKCHOP",
				},
				{
					Name = "E_ITEM_STRAD_DISC",
				},
				{
					Name = "E_ITEM_MUSHROOM_SOUP",
				},
				{
					Name = "E_ITEM_GOLDEN_CARROT",
				},
				{
					Name = "E_ITEM_ARROW",
				},
				{
					Name = "E_ITEM_BONE",
				},
				{
					Name = "E_ITEM_PAPER",
				},
				{
					Name = "E_ITEM_RAW_FISH",
				},
				{
					Name = "E_ITEM_MELON_SLICE",
				},
				{
					Name = "E_ITEM_DIAMOND_BOOTS",
				},
				{
					Name = "E_ITEM_DARK_OAK_DOOR",
				},
				{
					Name = "E_ITEM_FLOWER_POT",
				},
				{
					Name = "E_ITEM_BLAZE_POWDER",
				},
				{
					Name = "E_ITEM_ENCHANTED_BOOK",
				},
				{
					Name = "E_ITEM_STICK",
				},
				{
					Name = "E_ITEM_NAME_TAG",
				},
				{
					Name = "E_ITEM_DIAMOND_HELMET",
				},
				{
					Name = "E_ITEM_PAINTING",
				},
				{
					Name = "E_ITEM_SADDLE",
				},
				{
					Name = "E_ITEM_CHEST_MINECART",
				},
				{
					Name = "E_ITEM_CHAIN_HELMET",
				},
				{
					Name = "E_ITEM_FISHING_ROD",
				},
				{
					Name = "E_ITEM_ITEM_FRAME",
				},
				{
					Name = "E_ITEM_COMPARATOR",
				},
				{
					Name = "E_ITEM_LEATHER_CAP",
				},
				{
					Name = "E_ITEM_BREWING_STAND",
				},
				{
					Name = "E_ITEM_MILK",
				},
				{
					Name = "E_ITEM_FURNACE_MINECART",
				},
				{
					Name = "E_ITEM_COMPASS",
				},
				{
					Name = "E_ITEM_WOODEN_SWORD",
				},
				{
					Name = "E_ITEM_CHAIN_LEGGINGS",
				},
				{
					Name = "E_ITEM_DIAMOND_CHESTPLATE",
				},
				{
					Name = "E_ITEM_IRON_SHOVEL",
				},
				{
					Name = "E_ITEM_FIRST_DISC",
				},
				{
					Name = "E_ITEM_SEEDS",
				},
				{
					Name = "E_ITEM_DIAMOND_SWORD",
				},
				{
					Name = "E_ITEM_IRON_BOOTS",
				},
				{
					Name = "E_ITEM_LEAD",
				},
				{
					Name = "E_ITEM_BLAZE_ROD",
				},
				{
					Name = "E_ITEM_LEATHER",
				},
				{
					Name = "E_ITEM_LEATHER_TUNIC",
				},
				{
					Name = "E_ITEM_RAW_BEEF",
				},
				{
					Name = "E_ITEM_GOLD_BOOTS",
				},
				{
					Name = "E_ITEM_BLOCKS_DISC",
				},
				{
					Name = "E_ITEM_DIAMOND_HORSE_ARMOR",
				},
				{
					Name = "E_ITEM_IRON_DOOR",
				},
				{
					Name = "E_ITEM_WOODEN_AXE",
				},
				{
					Name = "E_ITEM_MINECART_WITH_COMMAND_BLOCK",
				},
				{
					Name = "E_ITEM_SPIDER_EYE",
				},
				{
					Name = "E_ITEM_GUNPOWDER",
				},
				{
					Name = "E_ITEM_BREAD",
				},
				{
					Name = "E_ITEM_FAR_DISC",
				},
				{
					Name = "E_ITEM_STRING",
				},
				{
					Name = "E_ITEM_IRON_CHESTPLATE",
				},
				{
					Name = "E_ITEM_BOW",
				},
				{
					Name = "E_ITEM_MAGMA_CREAM",
				},
				{
					Name = "E_ITEM_REDSTONE_REPEATER",
				},
				{
					Name = "E_ITEM_GLISTERING_MELON",
				},
				{
					Name = "E_ITEM_RAW_MUTTON",
				},
				{
					Name = "E_ITEM_EMPTY_MAP",
				},
				{
					Name = "E_ITEM_DIAMOND_HOE",
				},
				{
					Name = "E_ITEM_FLINT",
				},
				{
					Name = "E_ITEM_NETHER_BRICK",
				},
				{
					Name = "E_ITEM_POTION",
				},
				{
					Name = "E_ITEM_COOKED_FISH",
				},
				{
					Name = "E_ITEM_GLOWSTONE_DUST",
				},
				{
					Name = "E_ITEM_LEATHER_BOOTS",
				},
				{
					Name = "E_ITEM_CAULDRON",
				},
				{
					Name = "E_ITEM_GOLD_PICKAXE",
				},
				{
					Name = "E_ITEM_IRON_AXE",
				},
				{
					Name = "E_ITEM_LAST",
				},
				{
					Name = "E_ITEM_MINECART_WITH_TNT",
				},
				{
					Name = "E_ITEM_SNOWBALL",
				},
				{
					Name = "E_ITEM_CHIRP_DISC",
				},
				{
					Name = "E_ITEM_STONE_SWORD",
				},
				{
					Name = "E_ITEM_GOLD_HOE",
				},
				{
					Name = "E_ITEM_FIREWORK_ROCKET",
				},
				{
					Name = "E_ITEM_IRON",
				},
				{
					Name = "E_ITEM_CLAY",
				},
				{
					Name = "E_ITEM_ENDER_PEARL",
				},
				{
					Name = "E_ITEM_ARMOR_STAND",
				},
				{
					Name = "E_ITEM_EYE_OF_ENDER",
				},
				{
					Name = "E_ITEM_IRON_PICKAXE",
				},
				{
					Name = "E_ITEM_DYE",
				},
				{
					Name = "E_ITEM_PUMPKIN_SEEDS",
				},
				{
					Name = "E_ITEM_WOODEN_PICKAXE",
				},
				{
					Name = "E_ITEM_POTIONS",
				},
				{
					Name = "E_ITEM_BED",
				},
				{
					Name = "E_ITEM_FIRE_CHARGE",
				},
				{
					Name = "E_ITEM_GOLD_SHOVEL",
				},
				{
					Name = "E_ITEM_POISONOUS_POTATO",
				},
				{
					Name = "E_ITEM_FERMENTED_SPIDER_EYE",
				},
				{
					Name = "E_ITEM_MINECART_WITH_HOPPER",
				},
				{
					Name = "E_ITEM_RABBITS_FOOT",
				},
				{
					Name = "E_ITEM_BOTTLE_O_ENCHANTING",
				},
				{
					Name = "E_ITEM_IRON_HOE",
				},
				{
					Name = "E_ITEM_CHAIN_CHESTPLATE",
				},
				{
					Name = "E_ITEM_WATER_BUCKET",
				},
				{
					Name = "E_ITEM_LAVA_BUCKET",
				},
				{
					Name = "E_ITEM_COOKED_CHICKEN",
				},
				{
					Name = "E_ITEM_BIRCH_DOOR",
				},
				{
					Name = "E_ITEM_BOAT",
				},
				{
					Name = "E_ITEM_IRON_HELMET",
				},
				{
					Name = "E_ITEM_MELLOHI_DISC",
				},
				{
					Name = "E_ITEM_EMERALD",
				},
				{
					Name = "E_ITEM_SHEARS",
				},
				{
					Name = "E_ITEM_STONE_HOE",
				},
				{
					Name = "E_ITEM_HEAD",
				},
				{
					Name = "E_ITEM_BOOK",
				},
				{
					Name = "E_ITEM_GHAST_TEAR",
				},
				{
					Name = "E_ITEM_BAKED_POTATO",
				},
				{
					Name = "E_ITEM_MAX_CONSECUTIVE_TYPE_ID",
				},
				{
					Name = "E_ITEM_GOLD_HORSE_ARMOR",
				},
				{
					Name = "E_ITEM_CARROT_ON_STICK",
				},
				{
					Name = "E_ITEM_RAW_CHICKEN",
				},
				{
					Name = "E_ITEM_GOLD_CHESTPLATE",
				},
				{
					Name = "E_ITEM_WAIT_DISC",
				},
				{
					Name = "E_ITEM_CAT_DISC",
				},
				{
					Name = "E_ITEM_GOLD_NUGGET",
				},
				{
					Name = "E_ITEM_NETHER_QUARTZ",
				},
				{
					Name = "E_ITEM_PRISMARINE_SHARD",
				},
				{
					Name = "E_ITEM_IRON_HORSE_ARMOR",
				},
				{
					Name = "E_ITEM_CLOCK",
				},
				{
					Name = "E_ITEM_GOLD_AXE",
				},
				{
					Name = "E_ITEM_WHEAT",
				},
				{
					Name = "E_ITEM_NETHER_WART",
				},
				{
					Name = "E_ITEM_WOODEN_SHOVEL",
				},
				{
					Name = "E_ITEM_STONE_PICKAXE",
				},
				{
					Name = "E_ITEM_GLASS_BOTTLE",
				},
				{
					Name = "E_ITEM_DIAMOND_PICKAXE",
				},
				{
					Name = "E_ITEM_WARD_DISC",
				},
				{
					Name = "E_ITEM_FEATHER",
				},
				{
					Name = "E_ITEM_MINECART",
				},
				{
					Name = "E_ITEM_FIRST",
				},
				{
					Name = "E_ITEM_RABBIT_HIDE",
				},
				{
					Name = "E_ITEM_BOOK_AND_QUILL",
				},
				{
					Name = "E_ITEM_CHAIN_BOOTS",
				},
				{
					Name = "E_ITEM_JUNGLE_DOOR",
				},
				{
					Name = "E_ITEM_SUGAR_CANE",
				},
				{
					Name = "E_ITEM_ROTTEN_FLESH",
				},
				{
					Name = "E_ITEM_FLINT_AND_STEEL",
				},
				{
					Name = "E_ITEM_SIGN",
				},
				{
					Name = "E_ITEM_GOLD_SWORD",
				},
				{
					Name = "E_ITEM_MALL_DISC",
				},
				{
					Name = "E_ITEM_DIAMOND_SHOVEL",
				},
				{
					Name = "E_ITEM_GOLD",
				},
				{
					Name = "E_ITEM_PRISMARINE_CRYSTALS",
				},
				{
					Name = "E_ITEM_ACACIA_DOOR",
				},
				{
					Name = "E_ITEM_COAL",
				},
				{
					Name = "E_ITEM_EMPTY",
				},
				{
					Name = "E_ITEM_IRON_LEGGINGS",
				},
				{
					Name = "E_ITEM_LAST_DISC",
				},
				{
					Name = "E_ITEM_CLAY_BRICK",
				},
				{
					Name = "E_ITEM_IRON_SWORD",
				},
				{
					Name = "E_ITEM_EGG",
				},
				{
					Name = "E_ITEM_STEAK",
				},
				{
					Name = "E_ITEM_MELON_SEEDS",
				},
				{
					Name = "E_ITEM_WOODEN_DOOR",
				},
				{
					Name = "E_ITEM_DIAMOND_LEGGINGS",
				},
				{
					Name = "E_ITEM_WOODEN_HOE",
				},
				{
					Name = "E_ITEM_SPAWN_EGG",
				},
				{
					Name = "E_ITEM_DIAMOND_AXE",
				},
			},
			MetaValues =
			{
				{
					Name = "E_META_LEAVES_BIRCH",
				},
				{
					Name = "E_META_QUARTZ_PILLAR",
				},
				{
					Name = "E_META_PRESSURE_PLATE_DEPRESSED",
				},
				{
					Name = "E_META_STAINED_GLASS_PANE_LIGHTGRAY",
				},
				{
					Name = "E_META_RAIL_ASCEND_ZM",
				},
				{
					Name = "E_META_RED_SANDSTONE_ORNAMENT",
				},
				{
					Name = "E_META_CHEST_FACING_ZP",
				},
				{
					Name = "E_META_NEWLOG_ACACIA_UP_DOWN",
				},
				{
					Name = "E_META_SPAWN_EGG_MINECART_HOPPER",
				},
				{
					Name = "E_META_STAINED_CLAY_PURPLE",
				},
				{
					Name = "E_META_DIRT_GRASSLESS",
				},
				{
					Name = "E_META_SAPLING_BIRCH",
				},
				{
					Name = "E_META_PRISMARINE_BLOCK_BRICKS",
				},
				{
					Name = "E_META_SPAWN_EGG_EYE_OF_ENDER",
				},
				{
					Name = "E_META_HOPPER_FACING_XM",
				},
				{
					Name = "E_META_SPAWN_EGG_COW",
				},
				{
					Name = "E_META_STONE_SLAB_BRICK",
				},
				{
					Name = "E_META_WOOL_WHITE",
				},
				{
					Name = "E_META_LOG_SPRUCE_X",
				},
				{
					Name = "E_META_STAINED_GLASS_PINK",
				},
				{
					Name = "E_META_SAPLING_DARK_OAK",
				},
				{
					Name = "E_META_SAPLING_ACACIA",
				},
				{
					Name = "E_META_HEAD_PLAYER",
				},
				{
					Name = "E_META_BANNER_GRAY",
				},
				{
					Name = "E_META_SPAWN_EGG_MINECART_SPAWNER",
				},
				{
					Name = "E_META_WOOL_YELLOW",
				},
				{
					Name = "E_META_BIG_FLOWER_LILAC",
				},
				{
					Name = "E_META_LOG_BIRCH",
				},
				{
					Name = "E_META_SPAWN_EGG_WITHER_SKULL",
				},
				{
					Name = "E_META_CARPET_PINK",
				},
				{
					Name = "E_META_TORCH_NORTH",
				},
				{
					Name = "E_META_TORCH_FLOOR",
				},
				{
					Name = "E_META_SPAWN_EGG_PAINTING",
				},
				{
					Name = "E_META_WOODEN_DOUBLE_SLAB_ACACIA",
				},
				{
					Name = "E_META_SPAWN_EGG_OCELOT",
				},
				{
					Name = "E_META_STONE_BRICK_CRACKED",
				},
				{
					Name = "E_META_SPAWN_EGG_SPLASH_POTION",
				},
				{
					Name = "E_META_BANNER_GREEN",
				},
				{
					Name = "E_META_DROPSPENSER_FACING_YM",
				},
				{
					Name = "E_META_STONE_POLISHED_GRANITE",
				},
				{
					Name = "E_META_TALL_GRASS_GRASS",
				},
				{
					Name = "E_META_LEAVES_JUNGLE",
				},
				{
					Name = "E_META_BANNER_CYAN",
				},
				{
					Name = "E_META_STAINED_GLASS_PANE_LIGHTGREEN",
				},
				{
					Name = "E_META_CARPET_BLACK",
				},
				{
					Name = "E_META_FLOWER_ORANGE_TULIP",
				},
				{
					Name = "E_META_STAINED_CLAY_MAGENTA",
				},
				{
					Name = "E_META_RAIL_CURVED_ZM_XP",
				},
				{
					Name = "E_META_STONE_BRICK_MOSSY",
				},
				{
					Name = "E_META_SPAWN_EGG_PRIMED_TNT",
				},
				{
					Name = "E_META_DYE_WHITE",
				},
				{
					Name = "E_META_NEWLOG_ACACIA_BARK_ONLY",
				},
				{
					Name = "E_META_WOOL_GREEN",
				},
				{
					Name = "E_META_HOPPER_FACING_ZP",
				},
				{
					Name = "E_META_STONE_SLAB_NETHER_BRICK",
				},
				{
					Name = "E_META_LOG_SPRUCE_BARK_ONLY",
				},
				{
					Name = "E_META_LOG_JUNGLE_X",
				},
				{
					Name = "E_META_DROPSPENSER_FACING_YP",
				},
				{
					Name = "E_META_STAINED_GLASS_PANE_CYAN",
				},
				{
					Name = "E_META_SPAWN_EGG_SMALL_FIREBALL",
				},
				{
					Name = "E_META_SNOW_LAYER_SEVEN",
				},
				{
					Name = "E_META_STAINED_CLAY_BLACK",
				},
				{
					Name = "E_META_WOODEN_DOUBLE_SLAB_BIRCH",
				},
				{
					Name = "E_META_STAINED_GLASS_BLUE",
				},
				{
					Name = "E_META_WOODEN_SLAB_BIRCH",
				},
				{
					Name = "E_META_TORCH_XM",
				},
				{
					Name = "E_META_HEAD_ZOMBIE",
				},
				{
					Name = "E_META_PLANKS_SPRUCE",
				},
				{
					Name = "E_META_STAINED_GLASS_GRAY",
				},
				{
					Name = "E_META_LOG_JUNGLE_UP_DOWN",
				},
				{
					Name = "E_META_SPAWN_EGG_LEASH_KNOT",
				},
				{
					Name = "E_META_SPAWN_EGG_MINECART_FURNACE",
				},
				{
					Name = "E_META_LEAVES_APPLE_NO_DECAY",
				},
				{
					Name = "E_META_CARPET_LIGHTGRAY",
				},
				{
					Name = "E_META_TRACKS_Z",
				},
				{
					Name = "E_META_FLOWER_WHITE_TULIP",
				},
				{
					Name = "E_META_STAINED_GLASS_PANE_LIGHTBLUE",
				},
				{
					Name = "E_META_SNOW_LAYER_ONE",
				},
				{
					Name = "E_META_RAIL_ASCEND_ZP",
				},
				{
					Name = "E_META_CARPET_BROWN",
				},
				{
					Name = "E_META_PLANKS_OAK",
				},
				{
					Name = "E_META_TRACKS_X",
				},
				{
					Name = "E_META_FLOWER_PINK_TULIP",
				},
				{
					Name = "E_META_DYE_LIGHTGRAY",
				},
				{
					Name = "E_META_NEWLOG_ACACIA_X",
				},
				{
					Name = "E_META_RAIL_XM_XP",
				},
				{
					Name = "E_META_WOODEN_DOUBLE_SLAB_DARK_OAK",
				},
				{
					Name = "E_META_DOUBLE_STONE_SLAB_BRICK",
				},
				{
					Name = "E_META_SPAWN_EGG_ENDER_PEARL",
				},
				{
					Name = "E_META_STONE_DIORITE",
				},
				{
					Name = "E_META_PISTON_DOWN",
				},
				{
					Name = "E_META_CARPET_MAGENTA",
				},
				{
					Name = "E_META_STAINED_GLASS_PANE_PURPLE",
				},
				{
					Name = "E_META_NEW_LOG_DARK_OAK_WOOD",
				},
				{
					Name = "E_META_WOOL_GRAY",
				},
				{
					Name = "E_META_RAIL_CURVED_ZP_XM",
				},
				{
					Name = "E_META_HEAD_SKELETON",
				},
				{
					Name = "E_META_TORCH_ZM",
				},
				{
					Name = "E_META_NEWLOG_ACACIA_Z",
				},
				{
					Name = "E_META_HOPPER_UNATTACHED",
				},
				{
					Name = "E_META_WOODEN_SLAB_JUNGLE",
				},
				{
					Name = "E_META_SILVERFISH_EGG_STONE_BRICK",
				},
				{
					Name = "E_META_SAPLING_CONIFER",
				},
				{
					Name = "E_META_STONE_POLISHED_DIORITE",
				},
				{
					Name = "E_META_DOUBLE_STONE_SLAB_SMOOTH_SANDSTONE",
				},
				{
					Name = "E_META_PISTON_XP",
				},
				{
					Name = "E_META_CARPET_CYAN",
				},
				{
					Name = "E_META_WOOL_MAGENTA",
				},
				{
					Name = "E_META_WOOL_LIGHTGRAY",
				},
				{
					Name = "E_META_SAPLING_JUNGLE",
				},
				{
					Name = "E_META_STAINED_GLASS_PANE_GRAY",
				},
				{
					Name = "E_META_WOOL_ORANGE",
				},
				{
					Name = "E_META_FLOWER_RED_TULIP",
				},
				{
					Name = "E_META_TALL_GRASS_DEAD_SHRUB",
				},
				{
					Name = "E_META_SPAWN_EGG_GHAST",
				},
				{
					Name = "E_META_WOODEN_SLAB_UPSIDE_DOWN",
				},
				{
					Name = "E_META_STONE_BRICK_ORNAMENT",
				},
				{
					Name = "E_META_STONE_SLAB_PLANKS",
				},
				{
					Name = "E_META_SNOW_LAYER_TWO",
				},
				{
					Name = "E_META_COAL_NORMAL",
				},
				{
					Name = "E_META_SPAWN_EGG_VILLAGER",
				},
				{
					Name = "E_META_DYE_PINK",
				},
				{
					Name = "E_META_STAINED_GLASS_PANE_BROWN",
				},
				{
					Name = "E_META_NEWLEAVES_DARK_OAK_NO_DECAY",
				},
				{
					Name = "E_META_DOUBLE_STONE_SLAB_SMOOTH_STONE",
				},
				{
					Name = "E_META_SPAWN_EGG_RABBIT",
				},
				{
					Name = "E_META_SAND_RED",
				},
				{
					Name = "E_META_CARPET_ORANGE",
				},
				{
					Name = "E_META_FLOWER_POPPY",
				},
				{
					Name = "E_META_PRISMARINE_BLOCK_DARK",
				},
				{
					Name = "E_META_SPAWN_EGG_WITHER",
				},
				{
					Name = "E_META_LEAVES_JUNGLE_CHECK_DECAY",
				},
				{
					Name = "E_META_NEWLOG_DARK_OAK_UP_DOWN",
				},
				{
					Name = "E_META_SAPLING_APPLE",
				},
				{
					Name = "E_META_NEWLOG_DARK_OAK_X",
				},
				{
					Name = "E_META_LOG_BIRCH_Z",
				},
				{
					Name = "E_META_STAINED_GLASS_LIGHTGREEN",
				},
				{
					Name = "E_META_WOODEN_DOUBLE_SLAB_SPRUCE",
				},
				{
					Name = "E_META_SPAWN_EGG_SPIDER",
				},
				{
					Name = "E_META_PISTON_ZP",
				},
				{
					Name = "E_META_STAINED_GLASS_RED",
				},
				{
					Name = "E_META_WOODEN_SLAB_OAK",
				},
				{
					Name = "E_META_DOUBLE_STONE_SLAB_WOODEN",
				},
				{
					Name = "E_META_DROPSPENSER_FACING_XP",
				},
				{
					Name = "E_META_LOG_CONIFER",
				},
				{
					Name = "E_META_SPAWN_EGG_MOOSHROOM",
				},
				{
					Name = "E_META_STONE_GRANITE",
				},
				{
					Name = "E_META_STONE_SLAB_STONE",
				},
				{
					Name = "E_META_STAINED_CLAY_PINK",
				},
				{
					Name = "E_META_TORCH_XP",
				},
				{
					Name = "E_META_BIG_FLOWER_ROSE_BUSH",
				},
				{
					Name = "E_META_TORCH_SOUTH",
				},
				{
					Name = "E_META_STONE_SLAB_STONE_BRICK",
				},
				{
					Name = "E_META_LOG_JUNGLE_Z",
				},
				{
					Name = "E_META_CARPET_YELLOW",
				},
				{
					Name = "E_META_SNOW_LAYER_EIGHT",
				},
				{
					Name = "E_META_LOG_SPRUCE_UP_DOWN",
				},
				{
					Name = "E_META_JUKEBOX_OFF",
				},
				{
					Name = "E_META_SPAWN_EGG_ITEM_FRAME",
				},
				{
					Name = "E_META_DIRT_NORMAL",
				},
				{
					Name = "E_META_STAINED_GLASS_PANE_RED",
				},
				{
					Name = "E_META_STAINED_GLASS_PURPLE",
				},
				{
					Name = "E_META_RAIL_CURVED_ZM_XM",
				},
				{
					Name = "E_META_CARPET_PURPLE",
				},
				{
					Name = "E_META_SPAWN_EGG_SKELETON",
				},
				{
					Name = "E_META_WOODEN_SLAB_SPRUCE",
				},
				{
					Name = "E_META_SPAWN_EGG_FALLING_BLOCK",
				},
				{
					Name = "E_META_CARPET_RED",
				},
				{
					Name = "E_META_STAINED_GLASS_LIGHTGRAY",
				},
				{
					Name = "E_META_LOG_APPLE",
				},
				{
					Name = "E_META_PRESSURE_PLATE_RAISED",
				},
				{
					Name = "E_META_CHEST_FACING_XM",
				},
				{
					Name = "E_META_RAW_FISH_PUFFERFISH",
				},
				{
					Name = "E_META_DYE_MAGENTA",
				},
				{
					Name = "E_META_STAINED_CLAY_RED",
				},
				{
					Name = "E_META_WOODEN_DOUBLE_SLAB_OAK",
				},
				{
					Name = "E_META_FLOWER_ALLIUM",
				},
				{
					Name = "E_META_PISTON_U",
				},
				{
					Name = "E_META_STAINED_CLAY_LIGHTBLUE",
				},
				{
					Name = "E_META_WOODEN_DOUBLE_SLAB_JUNGLE",
				},
				{
					Name = "E_META_WOODEN_SLAB_ACACIA",
				},
				{
					Name = "E_META_CARPET_GRAY",
				},
				{
					Name = "E_META_HEAD_CREEPER",
				},
				{
					Name = "E_META_SPAWN_EGG_ENDER_CRYSTAL",
				},
				{
					Name = "E_META_STONE_SLAB_COBBLESTONE",
				},
				{
					Name = "E_META_STAINED_GLASS_GREEN",
				},
				{
					Name = "E_META_STAINED_GLASS_PANE_MAGENTA",
				},
				{
					Name = "E_META_DIRT_COARSE",
				},
				{
					Name = "E_META_GOLDEN_APPLE_ENCHANTED",
				},
				{
					Name = "E_META_STAINED_GLASS_CYAN",
				},
				{
					Name = "E_META_DROPSPENSER_FACING_ZP",
				},
				{
					Name = "E_META_SANDSTONE_ORNAMENT",
				},
				{
					Name = "E_META_RED_SANDSTONE_SMOOTH",
				},
				{
					Name = "E_META_BREWING_STAND_FILLED_SLOT_XP",
				},
				{
					Name = "E_META_DYE_GREEN",
				},
				{
					Name = "E_META_WOOL_PINK",
				},
				{
					Name = "E_META_BANNER_BLUE",
				},
				{
					Name = "E_META_BANNER_LIGHTBLUE",
				},
				{
					Name = "E_META_WOOL_BLUE",
				},
				{
					Name = "E_META_PLANKS_ACACIA",
				},
				{
					Name = "E_META_DOUBLE_STONE_SLAB_STONE_BRICK",
				},
				{
					Name = "E_META_SPAWN_EGG_FIREBALL",
				},
				{
					Name = "E_META_RED_SANDSTONE_NORMAL",
				},
				{
					Name = "E_META_STONE_ANDESITE",
				},
				{
					Name = "E_META_SPAWN_EGG_MAGMA_CUBE",
				},
				{
					Name = "E_META_STAINED_CLAY_ORANGE",
				},
				{
					Name = "E_META_HEAD_WITHER",
				},
				{
					Name = "E_META_BREWING_STAND_FILLED_SLOT_XM_ZP",
				},
				{
					Name = "E_META_LOG_SPRUCE_Z",
				},
				{
					Name = "E_META_CHEST_FACING_ZM",
				},
				{
					Name = "E_META_STAINED_CLAY_CYAN",
				},
				{
					Name = "E_META_NEWLEAVES_ACACIA",
				},
				{
					Name = "E_META_SPAWN_EGG_SNOWBALL",
				},
				{
					Name = "E_META_TORCH_EAST",
				},
				{
					Name = "E_META_WOODEN_SLAB_DARK_OAK",
				},
				{
					Name = "E_META_DYE_BROWN",
				},
				{
					Name = "E_META_DOUBLE_STONE_SLAB_NETHER_BRICK",
				},
				{
					Name = "E_META_SNOW_LAYER_SIX",
				},
				{
					Name = "E_META_DYE_BLACK",
				},
				{
					Name = "E_META_WOOL_LIGHTBLUE",
				},
				{
					Name = "E_META_WOOL_CYAN",
				},
				{
					Name = "E_META_SPAWN_EGG_CAVE_SPIDER",
				},
				{
					Name = "E_META_LOG_OAK_Z",
				},
				{
					Name = "E_META_DOUBLE_STONE_SLAB_STONE",
				},
				{
					Name = "E_META_SPAWN_EGG_ENDERMAN",
				},
				{
					Name = "E_META_SPAWN_EGG_GUARDIAN",
				},
				{
					Name = "E_META_BANNER_LIGHTGRAY",
				},
				{
					Name = "E_META_BANNER_LIGHTGREEN",
				},
				{
					Name = "E_META_DOUBLE_STONE_SLAB_TILE_QUARTZ",
				},
				{
					Name = "E_META_JUKEBOX_ON",
				},
				{
					Name = "E_META_DYE_YELLOW",
				},
				{
					Name = "E_META_DYE_LIGHTBLUE",
				},
				{
					Name = "E_META_CARPET_GREEN",
				},
				{
					Name = "E_META_DROPSPENSER_FACING_XM",
				},
				{
					Name = "E_META_HOPPER_FACING_YM",
				},
				{
					Name = "E_META_HOPPER_FACING_ZM",
				},
				{
					Name = "E_META_SPAWN_EGG_ZOMBIE",
				},
				{
					Name = "E_META_LEAVES_CONIFER_CHECK_DECAY",
				},
				{
					Name = "E_META_SPAWN_EGG_SNOW_GOLEM",
				},
				{
					Name = "E_META_SANDSTONE_SMOOTH",
				},
				{
					Name = "E_META_BIG_FLOWER_LARGE_FERN",
				},
				{
					Name = "E_META_DROPSPENSER_FACING_MASK",
				},
				{
					Name = "E_META_SPAWN_EGG_EXP_BOTTLE",
				},
				{
					Name = "E_META_SAND_NORMAL",
				},
				{
					Name = "E_META_SPAWN_EGG_SILVERFISH",
				},
				{
					Name = "E_META_LEAVES_APPLE_CHECK_DECAY",
				},
				{
					Name = "E_META_STAINED_GLASS_PANE_GREEN",
				},
				{
					Name = "E_META_PISTON_XM",
				},
				{
					Name = "E_META_PLANKS_JUNGLE",
				},
				{
					Name = "E_META_STAINED_CLAY_GRAY",
				},
				{
					Name = "E_META_PLANKS_DARK_OAK",
				},
				{
					Name = "E_META_SANDSTONE_NORMAL",
				},
				{
					Name = "E_META_SNOW_LAYER_FIVE",
				},
				{
					Name = "E_META_SPAWN_EGG_WOLF",
				},
				{
					Name = "E_META_SPAWN_EGG_CHICKEN",
				},
				{
					Name = "E_META_STAINED_CLAY_GREEN",
				},
				{
					Name = "E_META_STAINED_CLAY_LIGHTGREEN",
				},
				{
					Name = "E_META_STAINED_CLAY_BROWN",
				},
				{
					Name = "E_META_STAINED_CLAY_LIGHTGRAY",
				},
				{
					Name = "E_META_SPAWN_EGG_PICKUP",
				},
				{
					Name = "E_META_STAINED_GLASS_WHITE",
				},
				{
					Name = "E_META_STAINED_GLASS_MAGENTA",
				},
				{
					Name = "E_META_STAINED_GLASS_PANE_ORANGE",
				},
				{
					Name = "E_META_STAINED_GLASS_PANE_YELLOW",
				},
				{
					Name = "E_META_STAINED_GLASS_PANE_BLUE",
				},
				{
					Name = "E_META_STONE_STONE",
				},
				{
					Name = "E_META_PLANKS_BIRCH",
				},
				{
					Name = "E_META_STONE_POLISHED_ANDESITE",
				},
				{
					Name = "E_META_TORCH_WEST",
				},
				{
					Name = "E_META_COOKED_FISH_FISH",
				},
				{
					Name = "E_META_LOG_BIRCH_X",
				},
				{
					Name = "E_META_CARPET_LIGHTGREEN",
				},
				{
					Name = "E_META_WOOL_LIGHTGREEN",
				},
				{
					Name = "E_META_SPAWN_EGG_IRON_GOLEM",
				},
				{
					Name = "E_META_RAIL_ASCEND_XP",
				},
				{
					Name = "E_META_PISTON_HEAD_STICKY",
				},
				{
					Name = "E_META_NEWLEAVES_ACACIA_CHECK_DECAY",
				},
				{
					Name = "E_META_WOOL_BROWN",
				},
				{
					Name = "E_META_PISTON_ZM",
				},
				{
					Name = "E_META_BANNER_BROWN",
				},
				{
					Name = "E_META_BANNER_YELLOW",
				},
				{
					Name = "E_META_TALL_GRASS_BIOME",
				},
				{
					Name = "E_META_STAINED_GLASS_ORANGE",
				},
				{
					Name = "E_META_SPAWN_EGG_MINECART_CHEST",
				},
				{
					Name = "E_META_SPAWN_EGG_BOAT",
				},
				{
					Name = "E_META_DOUBLE_STONE_SLAB_COBBLESTONE",
				},
				{
					Name = "E_META_LOG_OAK_X",
				},
				{
					Name = "E_META_BANNER_ORANGE",
				},
				{
					Name = "E_META_SPAWN_EGG_FIREWORK",
				},
				{
					Name = "E_META_DYE_RED",
				},
				{
					Name = "E_META_LOG_BIRCH_BARK_ONLY",
				},
				{
					Name = "E_META_QUARTZ_CHISELLED",
				},
				{
					Name = "E_META_LEAVES_JUNGLE_NO_DECAY",
				},
				{
					Name = "E_META_STAINED_CLAY_BLUE",
				},
				{
					Name = "E_META_DYE_PURPLE",
				},
				{
					Name = "E_META_BANNER_BLACK",
				},
				{
					Name = "E_META_DYE_CYAN",
				},
				{
					Name = "E_META_HOPPER_FACING_XP",
				},
				{
					Name = "E_META_LEAVES_CONIFER_NO_DECAY",
				},
				{
					Name = "E_META_NEWLEAVES_DARK_OAK_CHECK_DECAY",
				},
				{
					Name = "E_META_DYE_GRAY",
				},
				{
					Name = "E_META_BIG_FLOWER_DOUBLE_TALL_GRASS",
				},
				{
					Name = "E_META_DYE_LIGHTGREEN",
				},
				{
					Name = "E_META_LEAVES_BIRCH_CHECK_DECAY",
				},
				{
					Name = "E_META_SILVERFISH_EGG_STONE",
				},
				{
					Name = "E_META_SPAWN_EGG_EXPERIENCE_ORB",
				},
				{
					Name = "E_META_GOLDEN_APPLE_NORMAL",
				},
				{
					Name = "E_META_BANNER_PURPLE",
				},
				{
					Name = "E_META_SILVERFISH_EGG_COBBLESTONE",
				},
				{
					Name = "E_META_TORCH_ZP",
				},
				{
					Name = "E_META_STONE_SLAB_QUARTZ",
				},
				{
					Name = "E_META_SPAWN_EGG_ZOMBIE_PIGMAN",
				},
				{
					Name = "E_META_LEAVES_CONIFER",
				},
				{
					Name = "E_META_WOOL_PURPLE",
				},
				{
					Name = "E_META_RAW_FISH_CLOWNFISH",
				},
				{
					Name = "E_META_CARPET_BLUE",
				},
				{
					Name = "E_META_TALL_GRASS_FERN",
				},
				{
					Name = "E_META_WOOL_BLACK",
				},
				{
					Name = "E_META_SPAWN_EGG_WITCH",
				},
				{
					Name = "E_META_CARPET_LIGHTBLUE",
				},
				{
					Name = "E_META_LEAVES_APPLE",
				},
				{
					Name = "E_META_DOUBLE_STONE_SLAB_SANDSTON",
				},
				{
					Name = "E_META_SPAWN_EGG_ENDER_DRAGON",
				},
				{
					Name = "E_META_STAINED_GLASS_BROWN",
				},
				{
					Name = "E_META_BANNER_WHITE",
				},
				{
					Name = "E_META_DOUBLE_STONE_SLAB_QUARTZ",
				},
				{
					Name = "E_META_DIRT_PODZOL",
				},
				{
					Name = "E_META_STAINED_GLASS_BLACK",
				},
				{
					Name = "E_META_SPAWN_EGG_ARROW",
				},
				{
					Name = "E_META_BANNER_RED",
				},
				{
					Name = "E_META_BIG_FLOWER_SUNFLOWER",
				},
				{
					Name = "E_META_LOG_JUNGLE_BARK_ONLY",
				},
				{
					Name = "E_META_STAINED_GLASS_PANE_BLACK",
				},
				{
					Name = "E_META_COOKED_FISH_SALMON",
				},
				{
					Name = "E_META_RAIL_ASCEND_XM",
				},
				{
					Name = "E_META_RAIL_CURVED_ZP_XP",
				},
				{
					Name = "E_META_LOG_JUNGLE",
				},
				{
					Name = "E_META_PRISMARINE_BLOCK_ROUGH",
				},
				{
					Name = "E_META_CHEST_FACING_XP",
				},
				{
					Name = "E_META_QUARTZ_NORMAL",
				},
				{
					Name = "E_META_SNOW_LAYER_THREE",
				},
				{
					Name = "E_META_LOG_BIRCH_UP_DOWN",
				},
				{
					Name = "E_META_RAW_FISH_SALMON",
				},
				{
					Name = "E_META_LOG_OAK_BARK_ONLY",
				},
				{
					Name = "E_META_STONE_SLAB_SANDSTONE",
				},
				{
					Name = "E_META_SPAWN_EGG_MINECART",
				},
				{
					Name = "E_META_RAW_FISH_FISH",
				},
				{
					Name = "E_META_FLOWER_OXEYE_DAISY",
				},
				{
					Name = "E_META_NEWLOG_DARK_OAK_BARK_ONLY",
				},
				{
					Name = "E_META_STONE_BRICK_NORMAL",
				},
				{
					Name = "E_META_STAINED_GLASS_YELLOW",
				},
				{
					Name = "E_META_SPAWN_EGG_MINECART_TNT",
				},
				{
					Name = "E_META_SPAWN_EGG_BLAZE",
				},
				{
					Name = "E_META_DYE_BLUE",
				},
				{
					Name = "E_META_SPAWN_EGG_CREEPER",
				},
				{
					Name = "E_META_DYE_ORANGE",
				},
				{
					Name = "E_META_SPAWN_EGG_SLIME",
				},
				{
					Name = "E_META_SPAWN_EGG_GIANT",
				},
				{
					Name = "E_META_NEW_LOG_ACACIA_WOOD",
				},
				{
					Name = "E_META_SPAWN_EGG_BAT",
				},
				{
					Name = "E_META_SPAWN_EGG_SHEEP",
				},
				{
					Name = "E_META_SPAWN_EGG_SQUID",
				},
				{
					Name = "E_META_BANNER_MAGENTA",
				},
				{
					Name = "E_META_WOOL_RED",
				},
				{
					Name = "E_META_RAIL_ZM_ZP",
				},
				{
					Name = "E_META_STAINED_GLASS_LIGHTBLUE",
				},
				{
					Name = "E_META_PISTON_EXTENDED",
				},
				{
					Name = "E_META_STAINED_GLASS_PANE_WHITE",
				},
				{
					Name = "E_META_BREWING_STAND_FILLED_SLOT_XM_ZM",
				},
				{
					Name = "E_META_STAINED_GLASS_PANE_PINK",
				},
				{
					Name = "E_META_NEWLOG_DARK_OAK_Z",
				},
				{
					Name = "E_META_NEWLEAVES_DARK_OAK",
				},
				{
					Name = "E_META_DROPSPENSER_ACTIVATED",
				},
				{
					Name = "E_META_SNOW_LAYER_FOUR",
				},
				{
					Name = "E_META_LEAVES_BIRCH_NO_DECAY",
				},
				{
					Name = "E_META_LOG_OAK_UP_DOWN",
				},
				{
					Name = "E_META_BIG_FLOWER_PEONY",
				},
				{
					Name = "E_META_BANNER_PINK",
				},
				{
					Name = "E_META_FLOWER_BLUE_ORCHID",
				},
				{
					Name = "E_META_DROPSPENSER_FACING_ZM",
				},
				{
					Name = "E_META_CARPET_WHITE",
				},
				{
					Name = "E_META_COAL_CHARCOAL",
				},
				{
					Name = "E_META_STAINED_CLAY_YELLOW",
				},
				{
					Name = "E_META_SPAWN_EGG_PIG",
				},
				{
					Name = "E_META_NEWLEAVES_ACACIA_NO_DECAY",
				},
				{
					Name = "E_META_STAINED_CLAY_WHITE",
				},
				{
					Name = "E_META_SPAWN_EGG_HORSE",
				},
			},
			eBlockFace =
			{
				{
					Name = "BLOCK_FACE_SOUTH",
				},
				{
					Name = "BLOCK_FACE_NORTH",
				},
				{
					Name = "BLOCK_FACE_YP",
				},
				{
					Name = "BLOCK_FACE_EAST",
				},
				{
					Name = "BLOCK_FACE_XM",
				},
				{
					Name = "BLOCK_FACE_TOP",
				},
				{
					Name = "BLOCK_FACE_XP",
				},
				{
					Name = "BLOCK_FACE_ZP",
				},
				{
					Name = "BLOCK_FACE_WEST",
				},
				{
					Name = "BLOCK_FACE_NONE",
				},
				{
					Name = "BLOCK_FACE_MIN",
				},
				{
					Name = "BLOCK_FACE_ZM",
				},
				{
					Name = "BLOCK_FACE_BOTTOM",
				},
				{
					Name = "BLOCK_FACE_YM",
				},
				{
					Name = "BLOCK_FACE_MAX",
				},
			},
			eBlockType =
			{
				{
					Name = "E_BLOCK_GOLD_BLOCK",
				},
				{
					Name = "E_BLOCK_JACK_O_LANTERN",
				},
				{
					Name = "E_BLOCK_SUGARCANE",
				},
				{
					Name = "E_BLOCK_JUNGLE_DOOR",
				},
				{
					Name = "E_BLOCK_COBBLESTONE",
				},
				{
					Name = "E_BLOCK_WATER",
				},
				{
					Name = "E_BLOCK_PRISMARINE_BLOCK",
				},
				{
					Name = "E_BLOCK_NEW_LEAVES",
				},
				{
					Name = "E_BLOCK_DARK_OAK_WOOD_STAIRS",
				},
				{
					Name = "E_BLOCK_GLOWSTONE",
				},
				{
					Name = "E_BLOCK_SANDSTONE",
				},
				{
					Name = "E_BLOCK_GRAVEL",
				},
				{
					Name = "E_BLOCK_OAK_WOOD_STAIRS",
				},
				{
					Name = "E_BLOCK_NUMBER_OF_TYPES",
				},
				{
					Name = "E_BLOCK_TRAPPED_CHEST",
				},
				{
					Name = "E_BLOCK_COMMAND_BLOCK",
				},
				{
					Name = "E_BLOCK_LAPIS_ORE",
				},
				{
					Name = "E_BLOCK_END_PORTAL_FRAME",
				},
				{
					Name = "E_BLOCK_BED",
				},
				{
					Name = "E_BLOCK_ENDER_CHEST",
				},
				{
					Name = "E_BLOCK_STONE",
				},
				{
					Name = "E_BLOCK_CARROTS",
				},
				{
					Name = "E_BLOCK_DEAD_BUSH",
				},
				{
					Name = "E_BLOCK_REDSTONE_ORE_GLOWING",
				},
				{
					Name = "E_BLOCK_BED_BED_HEAD",
				},
				{
					Name = "E_BLOCK_BUTTON_ZP",
				},
				{
					Name = "E_BLOCK_WOODEN_PRESSURE_PLATE",
				},
				{
					Name = "E_BLOCK_STAIRS_XM",
				},
				{
					Name = "E_BLOCK_BUTTON_XP",
				},
				{
					Name = "E_BLOCK_CARPET",
				},
				{
					Name = "E_BLOCK_LIT_FURNACE",
				},
				{
					Name = "E_BLOCK_RED_MUSHROOM",
				},
				{
					Name = "E_BLOCK_DAYLIGHT_SENSOR",
				},
				{
					Name = "E_BLOCK_BROWN_MUSHROOM",
				},
				{
					Name = "E_BLOCK_STONE_BRICKS",
				},
				{
					Name = "E_BLOCK_MINECART_TRACKS",
				},
				{
					Name = "E_BLOCK_RED_SANDSTONE_SLAB",
				},
				{
					Name = "E_BLOCK_NETHER_QUARTZ_ORE",
				},
				{
					Name = "E_BLOCK_CROPS",
				},
				{
					Name = "E_BLOCK_NETHER_WART",
				},
				{
					Name = "E_BLOCK_DARK_OAK_FENCE_GATE",
				},
				{
					Name = "E_BLOCK_REDSTONE_ORE",
				},
				{
					Name = "E_BLOCK_SLIME_BLOCK",
				},
				{
					Name = "E_BLOCK_SPONGE",
				},
				{
					Name = "E_BLOCK_TALL_GRASS",
				},
				{
					Name = "E_BLOCK_FENCE_GATE",
				},
				{
					Name = "E_BLOCK_HEAVY_WEIGHTED_PRESSURE_PLATE",
				},
				{
					Name = "E_BLOCK_CAULDRON",
				},
				{
					Name = "E_BLOCK_ACACIA_DOOR",
				},
				{
					Name = "E_BLOCK_PISTON_EXTENSION",
				},
				{
					Name = "E_BLOCK_LIGHT_WEIGHTED_PRESSURE_PLATE",
				},
				{
					Name = "E_BLOCK_DOUBLE_WOODEN_SLAB",
				},
				{
					Name = "E_BLOCK_HAY_BALE",
				},
				{
					Name = "E_BLOCK_CRAFTING_TABLE",
				},
				{
					Name = "E_BLOCK_REDSTONE_LAMP_ON",
				},
				{
					Name = "E_BLOCK_AIR",
				},
				{
					Name = "E_BLOCK_STONE_BUTTON",
				},
				{
					Name = "E_BLOCK_BURNING_FURNACE",
				},
				{
					Name = "E_BLOCK_GLASS",
				},
				{
					Name = "E_BLOCK_HEAD",
				},
				{
					Name = "E_BLOCK_STICKY_PISTON",
				},
				{
					Name = "E_BLOCK_TNT",
				},
				{
					Name = "E_BLOCK_REDSTONE_TORCH_OFF",
				},
				{
					Name = "E_BLOCK_BED_XP",
				},
				{
					Name = "E_BLOCK_FENCE",
				},
				{
					Name = "E_BLOCK_GRASS",
				},
				{
					Name = "E_BLOCK_BRICK",
				},
				{
					Name = "E_BLOCK_CHEST",
				},
				{
					Name = "E_BLOCK_RED_SANDSTONE_STAIRS",
				},
				{
					Name = "E_BLOCK_DIAMOND_BLOCK",
				},
				{
					Name = "E_BLOCK_BIRCH_FENCE",
				},
				{
					Name = "E_BLOCK_BARRIER",
				},
				{
					Name = "E_BLOCK_BED_OCCUPIED",
				},
				{
					Name = "E_BLOCK_BOOKCASE",
				},
				{
					Name = "E_BLOCK_DARK_OAK_FENCE",
				},
				{
					Name = "E_BLOCK_WALL_BANNER",
				},
				{
					Name = "E_BLOCK_PUMPKIN_STEM",
				},
				{
					Name = "E_BLOCK_BED_ZM",
				},
				{
					Name = "E_BLOCK_EMERALD_BLOCK",
				},
				{
					Name = "E_BLOCK_FLOWER_POT",
				},
				{
					Name = "E_BLOCK_BUTTON_PRESSED",
				},
				{
					Name = "E_BLOCK_COBBLESTONE_STAIRS",
				},
				{
					Name = "E_BLOCK_LEVER",
				},
				{
					Name = "E_BLOCK_BIG_FLOWER",
				},
				{
					Name = "E_BLOCK_PUMPKIN",
				},
				{
					Name = "E_BLOCK_JUNGLE_FENCE_GATE",
				},
				{
					Name = "E_BLOCK_END_PORTAL",
				},
				{
					Name = "E_BLOCK_DARK_OAK_DOOR",
				},
				{
					Name = "E_BLOCK_DANDELION",
				},
				{
					Name = "E_BLOCK_TRIPWIRE_HOOK",
				},
				{
					Name = "E_BLOCK_WOODEN_DOOR",
				},
				{
					Name = "E_BLOCK_ANVIL_HIGH_DAMAGE",
				},
				{
					Name = "E_BLOCK_COBBLESTONE_WALL",
				},
				{
					Name = "E_BLOCK_RED_SANDSTONE",
				},
				{
					Name = "E_BLOCK_YELLOW_FLOWER",
				},
				{
					Name = "E_BLOCK_PISTON_MOVED_BLOCK",
				},
				{
					Name = "E_BLOCK_BIRCH_DOOR",
				},
				{
					Name = "E_BLOCK_BREWING_STAND",
				},
				{
					Name = "E_BLOCK_EMERALD_ORE",
				},
				{
					Name = "E_BLOCK_CLAY",
				},
				{
					Name = "E_BLOCK_ACACIA_WOOD_STAIRS",
				},
				{
					Name = "E_BLOCK_VINES",
				},
				{
					Name = "E_BLOCK_BIRCH_FENCE_GATE",
				},
				{
					Name = "E_BLOCK_SANDSTONE_STAIRS",
				},
				{
					Name = "E_BLOCK_SPRUCE_FENCE_GATE",
				},
				{
					Name = "E_BLOCK_GOLD_ORE",
				},
				{
					Name = "E_BLOCK_HUGE_RED_MUSHROOM",
				},
				{
					Name = "E_BLOCK_QUARTZ_STAIRS",
				},
				{
					Name = "E_BLOCK_STAIRS_UPSIDE_DOWN",
				},
				{
					Name = "E_BLOCK_ANVIL_X",
				},
				{
					Name = "E_BLOCK_STONE_PRESSURE_PLATE",
				},
				{
					Name = "E_BLOCK_STAIRS_ZM",
				},
				{
					Name = "E_BLOCK_POWERED_RAIL",
				},
				{
					Name = "E_BLOCK_STAINED_GLASS",
				},
				{
					Name = "E_BLOCK_BEACON",
				},
				{
					Name = "E_BLOCK_WOODEN_STAIRS",
				},
				{
					Name = "E_BLOCK_LOG",
				},
				{
					Name = "E_BLOCK_SPRUCE_FENCE",
				},
				{
					Name = "E_BLOCK_DOUBLE_STONE_SLAB",
				},
				{
					Name = "E_BLOCK_BUTTON_ZM",
				},
				{
					Name = "E_BLOCK_DISPENSER",
				},
				{
					Name = "E_BLOCK_WOODEN_BUTTON",
				},
				{
					Name = "E_BLOCK_STATIONARY_WATER",
				},
				{
					Name = "E_BLOCK_JUNGLE_FENCE",
				},
				{
					Name = "E_BLOCK_BEDROCK",
				},
				{
					Name = "E_BLOCK_MOB_SPAWNER",
				},
				{
					Name = "E_BLOCK_ANVIL_Z",
				},
				{
					Name = "E_BLOCK_HOPPER",
				},
				{
					Name = "E_BLOCK_BLOCK_OF_COAL",
				},
				{
					Name = "E_BLOCK_DETECTOR_RAIL",
				},
				{
					Name = "E_BLOCK_BED_XM",
				},
				{
					Name = "E_BLOCK_INACTIVE_COMPARATOR",
				},
				{
					Name = "E_BLOCK_QUARTZ_BLOCK",
				},
				{
					Name = "E_BLOCK_SILVERFISH_EGG",
				},
				{
					Name = "E_BLOCK_NETHER_BRICK",
				},
				{
					Name = "E_BLOCK_IRON_ORE",
				},
				{
					Name = "E_BLOCK_ANVIL_NO_DAMAGE",
				},
				{
					Name = "E_BLOCK_HUGE_BROWN_MUSHROOM",
				},
				{
					Name = "E_BLOCK_BUTTON_YP",
				},
				{
					Name = "E_BLOCK_STANDING_BANNER",
				},
				{
					Name = "E_BLOCK_WALLSIGN",
				},
				{
					Name = "E_BLOCK_ENCHANTMENT_TABLE",
				},
				{
					Name = "E_BLOCK_IRON_BARS",
				},
				{
					Name = "E_BLOCK_MELON",
				},
				{
					Name = "E_BLOCK_LADDER",
				},
				{
					Name = "E_BLOCK_NEW_LOG",
				},
				{
					Name = "E_BLOCK_MYCELIUM",
				},
				{
					Name = "E_BLOCK_NETHER_BRICK_STAIRS",
				},
				{
					Name = "E_BLOCK_STAIRS_ZP",
				},
				{
					Name = "E_BLOCK_END_STONE",
				},
				{
					Name = "E_BLOCK_ACTIVE_COMPARATOR",
				},
				{
					Name = "E_BLOCK_ANVIL",
				},
				{
					Name = "E_BLOCK_WOODEN_SLAB",
				},
				{
					Name = "E_BLOCK_LAPIS_BLOCK",
				},
				{
					Name = "E_BLOCK_ACACIA_FENCE_GATE",
				},
				{
					Name = "E_BLOCK_ANVIL_LOW_DAMAGE",
				},
				{
					Name = "E_BLOCK_ICE",
				},
				{
					Name = "E_BLOCK_SIGN_POST",
				},
				{
					Name = "E_BLOCK_JUKEBOX",
				},
				{
					Name = "E_BLOCK_DOUBLE_RED_SANDSTONE_SLAB",
				},
				{
					Name = "E_BLOCK_COCOA_POD",
				},
				{
					Name = "E_BLOCK_RED_ROSE",
				},
				{
					Name = "E_BLOCK_LILY_PAD",
				},
				{
					Name = "E_BLOCK_TRAPDOOR",
				},
				{
					Name = "E_BLOCK_PACKED_ICE",
				},
				{
					Name = "E_BLOCK_INVERTED_DAYLIGHT_SENSOR",
				},
				{
					Name = "E_BLOCK_LEAVES",
				},
				{
					Name = "E_BLOCK_REDSTONE_REPEATER_ON",
				},
				{
					Name = "E_BLOCK_REEDS",
				},
				{
					Name = "E_BLOCK_BUTTON_YM",
				},
				{
					Name = "E_BLOCK_SNOW",
				},
				{
					Name = "E_BLOCK_STONE_SLAB",
				},
				{
					Name = "E_BLOCK_REDSTONE_TORCH_ON",
				},
				{
					Name = "E_BLOCK_POTATOES",
				},
				{
					Name = "E_BLOCK_STAIRS_XP",
				},
				{
					Name = "E_BLOCK_ACACIA_FENCE",
				},
				{
					Name = "E_BLOCK_WORKBENCH",
				},
				{
					Name = "E_BLOCK_FURNACE",
				},
				{
					Name = "E_BLOCK_DIRT",
				},
				{
					Name = "E_BLOCK_PISTON",
				},
				{
					Name = "E_BLOCK_MAX_TYPE_ID",
				},
				{
					Name = "E_BLOCK_STAINED_GLASS_PANE",
				},
				{
					Name = "E_BLOCK_BLOCK_OF_REDSTONE",
				},
				{
					Name = "E_BLOCK_NETHER_PORTAL",
				},
				{
					Name = "E_BLOCK_DRAGON_EGG",
				},
				{
					Name = "E_BLOCK_SNOW_BLOCK",
				},
				{
					Name = "E_BLOCK_IRON_BLOCK",
				},
				{
					Name = "E_BLOCK_PLANKS",
				},
				{
					Name = "E_BLOCK_JUNGLE_WOOD_STAIRS",
				},
				{
					Name = "E_BLOCK_SAND",
				},
				{
					Name = "E_BLOCK_FARMLAND",
				},
				{
					Name = "E_BLOCK_RAIL",
				},
				{
					Name = "E_BLOCK_HARDENED_CLAY",
				},
				{
					Name = "E_BLOCK_COBWEB",
				},
				{
					Name = "E_BLOCK_MOSSY_COBBLESTONE",
				},
				{
					Name = "E_BLOCK_IRON_DOOR",
				},
				{
					Name = "E_BLOCK_SEA_LANTERN",
				},
				{
					Name = "E_BLOCK_DIAMOND_ORE",
				},
				{
					Name = "E_BLOCK_CACTUS",
				},
				{
					Name = "E_BLOCK_SOULSAND",
				},
				{
					Name = "E_BLOCK_REDSTONE_LAMP_OFF",
				},
				{
					Name = "E_BLOCK_COAL_ORE",
				},
				{
					Name = "E_BLOCK_STATIONARY_LAVA",
				},
				{
					Name = "E_BLOCK_STAINED_CLAY",
				},
				{
					Name = "E_BLOCK_FLOWER",
				},
				{
					Name = "E_BLOCK_NOTE_BLOCK",
				},
				{
					Name = "E_BLOCK_NETHERRACK",
				},
				{
					Name = "E_BLOCK_TRIPWIRE",
				},
				{
					Name = "E_BLOCK_BED_ZP",
				},
				{
					Name = "E_BLOCK_CAKE",
				},
				{
					Name = "E_BLOCK_BRICK_STAIRS",
				},
				{
					Name = "E_BLOCK_NETHER_BRICK_FENCE",
				},
				{
					Name = "E_BLOCK_WOOL",
				},
				{
					Name = "E_BLOCK_DROPPER",
				},
				{
					Name = "E_BLOCK_ACTIVATOR_RAIL",
				},
				{
					Name = "E_BLOCK_FIRE",
				},
				{
					Name = "E_BLOCK_MELON_STEM",
				},
				{
					Name = "E_BLOCK_OAK_FENCE_GATE",
				},
				{
					Name = "E_BLOCK_IRON_TRAPDOOR",
				},
				{
					Name = "E_BLOCK_BIRCH_WOOD_STAIRS",
				},
				{
					Name = "E_BLOCK_TORCH",
				},
				{
					Name = "E_BLOCK_LAVA",
				},
				{
					Name = "E_BLOCK_REDSTONE_REPEATER_OFF",
				},
				{
					Name = "E_BLOCK_SPRUCE_WOOD_STAIRS",
				},
				{
					Name = "E_BLOCK_SPRUCE_DOOR",
				},
				{
					Name = "E_BLOCK_OAK_DOOR",
				},
				{
					Name = "E_BLOCK_SAPLING",
				},
				{
					Name = "E_BLOCK_REDSTONE_WIRE",
				},
				{
					Name = "E_BLOCK_BUTTON_XM",
				},
				{
					Name = "E_BLOCK_OBSIDIAN",
				},
				{
					Name = "E_BLOCK_STONE_BRICK_STAIRS",
				},
				{
					Name = "E_BLOCK_GLASS_PANE",
				},
			},
			eClickAction =
			{
				{
					Name = "caNumber6",
				},
				{
					Name = "caDropKey",
				},
				{
					Name = "caShiftRightClick",
				},
				{
					Name = "caRightClick",
				},
				{
					Name = "caLeftPaintProgress",
				},
				{
					Name = "caNumber5",
				},
				{
					Name = "caNumber7",
				},
				{
					Name = "caNumber8",
				},
				{
					Name = "caLeftClickOutside",
				},
				{
					Name = "caRightClickOutside",
				},
				{
					Name = "caNumber4",
				},
				{
					Name = "caNumber3",
				},
				{
					Name = "caLeftPaintEnd",
				},
				{
					Name = "caDblClick",
				},
				{
					Name = "caMiddleClick",
				},
				{
					Name = "caLeftPaintBegin",
				},
				{
					Name = "caRightClickOutsideHoldNothing",
				},
				{
					Name = "caNumber1",
				},
				{
					Name = "caRightPaintProgress",
				},
				{
					Name = "caRightPaintEnd",
				},
				{
					Name = "caLeftClickOutsideHoldNothing",
				},
				{
					Name = "caUnknown",
				},
				{
					Name = "caCtrlDropKey",
				},
				{
					Name = "caNumber2",
				},
				{
					Name = "caLeftClick",
				},
				{
					Name = "caRightPaintBegin",
				},
				{
					Name = "caShiftLeftClick",
				},
				{
					Name = "caNumber9",
				},
			},
			eDamageType =
			{
				{
					Name = "dtMob",
				},
				{
					Name = "dtDrown",
				},
				{
					Name = "dtSuffocation",
				},
				{
					Name = "dtLightning",
				},
				{
					Name = "dtDrowning",
				},
				{
					Name = "dtStarvation",
				},
				{
					Name = "dtArrow",
				},
				{
					Name = "dtFalling",
				},
				{
					Name = "dtArrowAttack",
				},
				{
					Name = "dtLavaContact",
				},
				{
					Name = "dtPlugin",
				},
				{
					Name = "dtRangedAttack",
				},
				{
					Name = "dtCactus",
				},
				{
					Name = "dtEnderPearl",
				},
				{
					Name = "dtLava",
				},
				{
					Name = "dtProjectile",
				},
				{
					Name = "dtStarving",
				},
				{
					Name = "dtInFire",
				},
				{
					Name = "dtHunger",
				},
				{
					Name = "dtAdmin",
				},
				{
					Name = "dtCactusContact",
				},
				{
					Name = "dtCacti",
				},
				{
					Name = "dtWither",
				},
				{
					Name = "dtCactuses",
				},
				{
					Name = "dtPotionOfHarming",
				},
				{
					Name = "dtBurning",
				},
				{
					Name = "dtPoisoning",
				},
				{
					Name = "dtExplosion",
				},
				{
					Name = "dtInVoid",
				},
				{
					Name = "dtPoison",
				},
				{
					Name = "dtFall",
				},
				{
					Name = "dtFireContact",
				},
				{
					Name = "dtWithering",
				},
				{
					Name = "dtSuffocating",
				},
				{
					Name = "dtOnFire",
				},
				{
					Name = "dtEntityAttack",
				},
				{
					Name = "dtMobAttack",
				},
				{
					Name = "dtAttack",
				},
				{
					Name = "dtPawnAttack",
				},
			},
			eDimension =
			{
				{
					Name = "dimNotSet",
				},
				{
					Name = "dimNether",
				},
				{
					Name = "dimEnd",
				},
				{
					Name = "dimOverworld",
				},
			},
			eExplosionSource =
			{
				{
					Name = "esWitherBirth",
				},
				{
					Name = "esWitherSkull",
				},
				{
					Name = "esOther",
				},
				{
					Name = "esEnderCrystal",
				},
				{
					Name = "esPrimedTNT",
				},
				{
					Name = "esGhastFireball",
				},
				{
					Name = "esBed",
				},
				{
					Name = "esMax",
				},
				{
					Name = "esPlugin",
				},
				{
					Name = "esMonster",
				},
			},
			eGameMode =
			{
				{
					Name = "eGameMode_Adventure",
				},
				{
					Name = "gmAdventure",
				},
				{
					Name = "gmSpectator",
				},
				{
					Name = "gmCreative",
				},
				{
					Name = "eGameMode_Creative",
				},
				{
					Name = "eGameMode_Spectator",
				},
				{
					Name = "eGameMode_Survival",
				},
				{
					Name = "gmSurvival",
				},
				{
					Name = "gmMin",
				},
				{
					Name = "eGameMode_NotSet",
				},
				{
					Name = "gmMax",
				},
				{
					Name = "gmNotSet",
				},
			},
			eMessageType =
			{
				{
					Name = "mtFatal",
				},
				{
					Name = "mtCustom",
				},
				{
					Name = "mtPM",
				},
				{
					Name = "mtFailure",
				},
				{
					Name = "mtFailure",
				},
				{
					Name = "mtSuccess",
				},
				{
					Name = "mtDeath",
				},
				{
					Name = "mtPrivateMessage",
				},
				{
					Name = "mtMaxPlusOne",
				},
				{
					Name = "mtWarning",
				},
				{
					Name = "mtJoin",
				},
				{
					Name = "mtLeave",
				},
				{
					Name = "mtInfo",
				},
				{
					Name = "mtInformation",
				},
				{
					Name = "mtInformation",
				},
				{
					Name = "mtError",
				},
				{
					Name = "mtFail",
				},
			},
			eMobHeadRotation =
			{
				{
					Name = "SKULL_ROTATION_SOUTH",
				},
				{
					Name = "SKULL_ROTATION_SOUTH_EAST",
				},
				{
					Name = "SKULL_ROTATION_WEST_SOUTH_WEST",
				},
				{
					Name = "SKULL_ROTATION_SOUTH_WEST",
				},
				{
					Name = "SKULL_ROTATION_SOUTH_SOUTH_WEST",
				},
				{
					Name = "SKULL_ROTATION_NORTH_EAST",
				},
				{
					Name = "SKULL_ROTATION_SOUTH_SOUTH_EAST",
				},
				{
					Name = "SKULL_ROTATION_NORTH_NORTH_EAST",
				},
				{
					Name = "SKULL_ROTATION_EAST_SOUTH_EAST",
				},
				{
					Name = "SKULL_ROTATION_EAST_NORTH_EAST",
				},
				{
					Name = "SKULL_ROTATION_EAST",
				},
				{
					Name = "SKULL_ROTATION_WEST",
				},
				{
					Name = "SKULL_ROTATION_WEST_NORTH_WEST",
				},
				{
					Name = "SKULL_ROTATION_NORTH",
				},
				{
					Name = "SKULL_ROTATION_NORTH_NORTH_WEST",
				},
				{
					Name = "SKULL_ROTATION_NORTH_WEST",
				},
			},
			eMobHeadType =
			{
				{
					Name = "SKULL_TYPE_WITHER",
				},
				{
					Name = "SKULL_TYPE_PLAYER",
				},
				{
					Name = "SKULL_TYPE_CREEPER",
				},
				{
					Name = "SKULL_TYPE_SKELETON",
				},
				{
					Name = "SKULL_TYPE_ZOMBIE",
				},
			},
			eMonsterType =
			{
				{
					Name = "mtSlime",
				},
				{
					Name = "mtSheep",
				},
				{
					Name = "mtMagmaCube",
				},
				{
					Name = "mtWolf",
				},
				{
					Name = "mtWitch",
				},
				{
					Name = "mtChicken",
				},
				{
					Name = "mtInvalidType",
				},
				{
					Name = "mtZombie",
				},
				{
					Name = "mtMaxPlusOne",
				},
				{
					Name = "mtEnderDragon",
				},
				{
					Name = "mtGhast",
				},
				{
					Name = "mtCreeper",
				},
				{
					Name = "mtVillager",
				},
				{
					Name = "mtBat",
				},
				{
					Name = "mtMax",
				},
				{
					Name = "mtZombiePigman",
				},
				{
					Name = "mtZombiePigman",
				},
				{
					Name = "mtSpider",
				},
				{
					Name = "mtSkeleton",
				},
				{
					Name = "mtPig",
				},
				{
					Name = "mtOcelot",
				},
				{
					Name = "mtGuardian",
				},
				{
					Name = "mtCaveSpider",
				},
				{
					Name = "mtWither",
				},
				{
					Name = "mtSnowGolem",
				},
				{
					Name = "mtBlaze",
				},
				{
					Name = "mtEnderman",
				},
				{
					Name = "mtRabbit",
				},
				{
					Name = "mtSquid",
				},
				{
					Name = "mtHorse",
				},
				{
					Name = "mtGiant",
				},
				{
					Name = "mtCow",
				},
				{
					Name = "mtIronGolem",
				},
				{
					Name = "mtMooshroom",
				},
				{
					Name = "mtSilverfish",
				},
			},
			eShrapnelLevel =
			{
				{
					Name = "slNone",
				},
				{
					Name = "slGravityAffectedOnly",
				},
				{
					Name = "slAll",
				},
			},
			eSpreadSource =
			{
				{
					Name = "ssVineSpread",
				},
				{
					Name = "ssMycelSpread",
				},
				{
					Name = "ssMushroomSpread",
				},
				{
					Name = "ssGrassSpread",
				},
				{
					Name = "ssFireSpread",
				},
			},
			eWeather =
			{
				{
					Name = "wRain",
				},
				{
					Name = "wSunny",
				},
				{
					Name = "eWeather_ThunderStorm",
				},
				{
					Name = "wThunderstorm",
				},
				{
					Name = "eWeather_Rain",
				},
				{
					Name = "eWeather_Sunny",
				},
				{
					Name = "wStorm",
				},
			},
		},
		Functions =
		{
			AddFaceDirection =
			{
				{
					Params =
					{
						{
							Name = "BlockX",
							Type = "number",
						},
						{
							Name = "BlockY",
							Type = "number",
						},
						{
							Name = "BlockZ",
							Type = "number",
						},
						{
							Name = "BlockFace",
							Type = "eBlockFace",
						},
						{
							IsOptional = true,
							Name = "IsInverse",
							Type = "boolean",
						},
					},
					Returns =
					{
						{
							Name = "BlockX",
							Type = "number",
						},
						{
							Name = "BlockY",
							Type = "number",
						},
						{
							Name = "BlockZ",
							Type = "number",
						},
					},
				},
			},
			BlockFaceToString =
			{
				{
					Params =
					{
						{
							Name = "eBlockFace",
							Type = "eBlockFace",
						},
					},
					Returns =
					{
						{
							Type = "string",
						},
					},
				},
			},
			BlockStringToType =
			{
				{
					Params =
					{
						{
							Name = "BlockTypeString",
							Type = "string",
						},
					},
					Returns =
					{
						{
							Name = "BLOCKTYPE",
							Type = "number",
						},
					},
				},
			},
			Clamp =
			{
				{
					Params =
					{
						{
							Name = "Number",
							Type = "number",
						},
						{
							Name = "Min",
							Type = "number",
						},
						{
							Name = "Max",
							Type = "number",
						},
					},
					Returns =
					{
						{
							Type = "number",
						},
					},
				},
			},
			ClickActionToString =
			{
				{
					Params =
					{
						{
							Name = "ClickAction",
							Type = "eClickAction",
						},
					},
					Returns =
					{
						{
							Type = "string",
						},
					},
				},
			},
			DamageTypeToString =
			{
				{
					Params =
					{
						{
							Name = "DamageType",
							Type = "eDamageType",
						},
					},
					Returns =
					{
						{
							Type = "string",
						},
					},
				},
			},
			EscapeString =
			{
				{
					Params =
					{
						{
							Name = "Input",
							Type = "string",
						},
					},
					Returns =
					{
						{
							Type = "string",
						},
					},
				},
			},
			GetChar =
			{
				{
					Params =
					{
						{
							Name = "Input",
							Type = "string",
						},
						{
							Name = "Index",
							Type = "number",
						},
					},
					Returns =
					{
						{
							Type = "string",
						},
					},
				},
			},
			GetIniItemSet =
			{
				{
					Params =
					{
						{
							Name = "IniFile",
							Type = "cIniFile",
						},
						{
							Name = "SectionName",
							Type = "string",
						},
						{
							Name = "KeyName",
							Type = "string",
						},
						{
							Name = "DefaultValue",
							Type = "string",
						},
					},
					Returns =
					{
						{
							Type = "cItem",
						},
					},
				},
			},
			GetTime =
			{
				{
					Returns =
					{
						{
							Type = "number",
						},
					},
				},
			},
			IsBiomeNoDownfall =
			{
				{
					Params =
					{
						{
							Name = "Biome",
							Type = "EMCSBiome",
						},
					},
					Returns =
					{
						{
							Type = "boolean",
						},
					},
				},
			},
			IsValidBlock =
			{
				{
					Params =
					{
						{
							Name = "BlockType",
							Type = "number",
						},
					},
					Returns =
					{
						{
							Type = "boolean",
						},
					},
				},
			},
			IsValidItem =
			{
				{
					Params =
					{
						{
							Name = "ItemType",
							Type = "number",
						},
					},
					Returns =
					{
						{
							Type = "boolean",
						},
					},
				},
			},
			ItemToFullString =
			{
				{
					Params =
					{
						{
							Name = "cItem",
							Type = "cItem",
						},
					},
					Returns =
					{
						{
							Type = "string",
						},
					},
				},
			},
			ItemToString =
			{
				{
					Params =
					{
						{
							Name = "cItem",
							Type = "cItem",
						},
					},
					Returns =
					{
						{
							Type = "string",
						},
					},
				},
			},
			ItemTypeToString =
			{
				{
					Params =
					{
						{
							Name = "ItemType",
							Type = "number",
						},
					},
					Returns =
					{
						{
							Type = "string",
						},
					},
				},
			},
			LOG =
			{
				{
					Params =
					{
						{
							Name = "Message",
							Type = "string",
						},
					},
				},
				{
					Params =
					{
						{
							Name = "Message",
							Type = "cCompositeChat",
						},
					},
				},
			},
			LOGERROR =
			{
				{
					Params =
					{
						{
							Name = "Message",
							Type = "string",
						},
					},
				},
				{
					Params =
					{
						{
							Name = "Message",
							Type = "cCompositeChat",
						},
					},
				},
			},
			LOGINFO =
			{
				{
					Params =
					{
						{
							Name = "Message",
							Type = "string",
						},
					},
				},
				{
					Params =
					{
						{
							Name = "Message",
							Type = "cCompositeChat",
						},
					},
				},
			},
			LOGWARN =
			{
				{
					Params =
					{
						{
							Name = "Message",
							Type = "string",
						},
					},
				},
				{
					Params =
					{
						{
							Name = "Message",
							Type = "cCompositeChat",
						},
					},
				},
			},
			LOGWARNING =
			{
				{
					Params =
					{
						{
							Name = "Message",
							Type = "string",
						},
					},
				},
				{
					Params =
					{
						{
							Name = "Message",
							Type = "cCompositeChat",
						},
					},
				},
			},
			MirrorBlockFaceY =
			{
				{
					Params =
					{
						{
							Name = "eBlockFace",
							Type = "eBlockFace",
						},
					},
					Returns =
					{
						{
							Type = "eBlockFace",
						},
					},
				},
			},
			NoCaseCompare =
			{
				{
					Params =
					{
						{
							Name = "Value1",
							Type = "string",
						},
						{
							Name = "Value2",
							Type = "string",
						},
					},
					Returns =
					{
						{
							Type = "number",
						},
					},
				},
			},
			NormalizeAngleDegrees =
			{
				{
					Params =
					{
						{
							Name = "AngleDegrees",
							Type = "number",
						},
					},
					Returns =
					{
						{
							Name = "AngleDegrees",
							Type = "number",
						},
					},
				},
			},
			ReplaceString =
			{
				{
					Params =
					{
						{
							Name = "full-string",
							Type = "string",
						},
						{
							Name = "to-be-replaced-string",
							Type = "string",
						},
						{
							Name = "to-replace-string",
							Type = "string",
						},
					},
					Returns =
					{
						{
							Type = "string",
						},
					},
				},
			},
			RotateBlockFaceCCW =
			{
				{
					Params =
					{
						{
							Name = "eBlockFace",
							Type = "eBlockFace",
						},
					},
					Returns =
					{
						{
							Type = "eBlockFace",
						},
					},
				},
			},
			RotateBlockFaceCW =
			{
				{
					Params =
					{
						{
							Name = "eBlockFace",
							Type = "eBlockFace",
						},
					},
					Returns =
					{
						{
							Type = "eBlockFace",
						},
					},
				},
			},
			StringSplit =
			{
				{
					Params =
					{
						{
							Name = "Input",
							Type = "string",
						},
						{
							Name = "SeperatorsString",
							Type = "string",
						},
					},
					Returns =
					{
						{
							Type = "table",
						},
					},
				},
			},
			StringSplitAndTrim =
			{
				{
					Params =
					{
						{
							Name = "Input",
							Type = "string",
						},
						{
							Name = "SeperatorsString",
							Type = "string",
						},
					},
					Returns =
					{
						{
							Type = "table",
						},
					},
				},
			},
			StringSplitWithQuotes =
			{
				{
					Params =
					{
						{
							Name = "Input",
							Type = "string",
						},
						{
							Name = "SeperatorsString",
							Type = "string",
						},
					},
					Returns =
					{
						{
							Type = "table",
						},
					},
				},
			},
			StringToBiome =
			{
				{
					Params =
					{
						{
							Name = "Input",
							Type = "string",
						},
					},
					Returns =
					{
						{
							Name = "BiomeType",
							Type = "Globals#EMCSBiome",
						},
					},
				},
			},
			StringToDamageType =
			{
				{
					Params =
					{
						{
							Name = "Input",
							Type = "string",
						},
					},
					Returns =
					{
						{
							Name = "DamageType",
							Type = "Globals#eDamageType",
						},
					},
				},
			},
			StringToDimension =
			{
				{
					Params =
					{
						{
							Name = "Input",
							Type = "string",
						},
					},
					Returns =
					{
						{
							Name = "Dimension",
							Type = "Globals#eDimension",
						},
					},
				},
			},
			StringToItem =
			{
				{
					Params =
					{
						{
							Name = "StringToParse",
							Type = "string",
						},
						{
							Name = "DestItem",
							Type = "cItem",
						},
					},
					Returns =
					{
						{
							Type = "boolean",
						},
					},
				},
			},
			StringToMobType =
			{
				{
					Params =
					{
						{
							Name = "MobTypeString",
							Type = "string",
						},
					},
					Returns =
					{
						{
							Name = "MobType",
							Type = "eMonsterType",
						},
					},
				},
			},
			StripColorCodes =
			{
				{
					Params =
					{
						{
							Name = "Input",
							Type = "string",
						},
					},
					Returns =
					{
						{
							Type = "string",
						},
					},
				},
			},
			TrimString =
			{
				{
					Params =
					{
						{
							Name = "Input",
							Type = "string",
						},
					},
					Returns =
					{
						{
							Type = "string",
						},
					},
				},
			},
			md5 =
			{
				{
					Params =
					{
						{
							Name = "Data",
							Type = "string",
						},
					},
					Returns =
					{
						{
							Type = "string",
						},
					},
				},
			},
		},
	},
}
