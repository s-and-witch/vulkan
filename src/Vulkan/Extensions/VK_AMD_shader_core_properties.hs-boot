{-# language CPP #-}
-- | = Name
--
-- VK_AMD_shader_core_properties - device extension
--
-- == VK_AMD_shader_core_properties
--
-- [__Name String__]
--     @VK_AMD_shader_core_properties@
--
-- [__Extension Type__]
--     Device extension
--
-- [__Registered Extension Number__]
--     186
--
-- [__Revision__]
--     2
--
-- [__Extension and Version Dependencies__]
--
--     -   Requires Vulkan 1.0
--
--     -   Requires @VK_KHR_get_physical_device_properties2@
--
-- [__Contact__]
--
--     -   Martin Dinkov
--         <https://github.com/KhronosGroup/Vulkan-Docs/issues/new?title=VK_AMD_shader_core_properties:%20&body=@mdinkov%20 >
--
-- == Other Extension Metadata
--
-- [__Last Modified Date__]
--     2019-06-25
--
-- [__IP Status__]
--     No known IP claims.
--
-- [__Contributors__]
--
--     -   Martin Dinkov, AMD
--
--     -   Matthaeus G. Chajdas, AMD
--
-- == Description
--
-- This extension exposes shader core properties for a target physical
-- device through the @VK_KHR_get_physical_device_properties2@ extension.
-- Please refer to the example below for proper usage.
--
-- == New Structures
--
-- -   Extending
--     'Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2.PhysicalDeviceProperties2':
--
--     -   'PhysicalDeviceShaderCorePropertiesAMD'
--
-- == New Enum Constants
--
-- -   'AMD_SHADER_CORE_PROPERTIES_EXTENSION_NAME'
--
-- -   'AMD_SHADER_CORE_PROPERTIES_SPEC_VERSION'
--
-- -   Extending 'Vulkan.Core10.Enums.StructureType.StructureType':
--
--     -   'Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_AMD'
--
-- == Examples
--
-- This example retrieves the shader core properties for a physical device.
--
-- > extern VkInstance       instance;
-- >
-- > PFN_vkGetPhysicalDeviceProperties2 pfnVkGetPhysicalDeviceProperties2 =
-- >     reinterpret_cast<PFN_vkGetPhysicalDeviceProperties2>
-- >     (vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceProperties2") );
-- >
-- > VkPhysicalDeviceProperties2             general_props;
-- > VkPhysicalDeviceShaderCorePropertiesAMD shader_core_properties;
-- >
-- > shader_core_properties.pNext = nullptr;
-- > shader_core_properties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_AMD;
-- >
-- > general_props.pNext = &shader_core_properties;
-- > general_props.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2;
-- >
-- > // After this call, shader_core_properties has been populated
-- > pfnVkGetPhysicalDeviceProperties2(device, &general_props);
-- >
-- > printf("Number of shader engines: %d\n",
-- >     m_shader_core_properties.shader_engine_count =
-- >     shader_core_properties.shaderEngineCount;
-- > printf("Number of shader arrays: %d\n",
-- >     m_shader_core_properties.shader_arrays_per_engine_count =
-- >     shader_core_properties.shaderArraysPerEngineCount;
-- > printf("Number of CUs per shader array: %d\n",
-- >     m_shader_core_properties.compute_units_per_shader_array =
-- >     shader_core_properties.computeUnitsPerShaderArray;
-- > printf("Number of SIMDs per compute unit: %d\n",
-- >     m_shader_core_properties.simd_per_compute_unit =
-- >     shader_core_properties.simdPerComputeUnit;
-- > printf("Number of wavefront slots in each SIMD: %d\n",
-- >     m_shader_core_properties.wavefronts_per_simd =
-- >     shader_core_properties.wavefrontsPerSimd;
-- > printf("Number of threads per wavefront: %d\n",
-- >     m_shader_core_properties.wavefront_size =
-- >     shader_core_properties.wavefrontSize;
-- > printf("Number of physical SGPRs per SIMD: %d\n",
-- >     m_shader_core_properties.sgprs_per_simd =
-- >     shader_core_properties.sgprsPerSimd;
-- > printf("Minimum number of SGPRs that can be allocated by a wave: %d\n",
-- >     m_shader_core_properties.min_sgpr_allocation =
-- >     shader_core_properties.minSgprAllocation;
-- > printf("Number of available SGPRs: %d\n",
-- >     m_shader_core_properties.max_sgpr_allocation =
-- >     shader_core_properties.maxSgprAllocation;
-- > printf("SGPRs are allocated in groups of this size: %d\n",
-- >     m_shader_core_properties.sgpr_allocation_granularity =
-- >     shader_core_properties.sgprAllocationGranularity;
-- > printf("Number of physical VGPRs per SIMD: %d\n",
-- >     m_shader_core_properties.vgprs_per_simd =
-- >     shader_core_properties.vgprsPerSimd;
-- > printf("Minimum number of VGPRs that can be allocated by a wave: %d\n",
-- >     m_shader_core_properties.min_vgpr_allocation =
-- >     shader_core_properties.minVgprAllocation;
-- > printf("Number of available VGPRs: %d\n",
-- >     m_shader_core_properties.max_vgpr_allocation =
-- >     shader_core_properties.maxVgprAllocation;
-- > printf("VGPRs are allocated in groups of this size: %d\n",
-- >     m_shader_core_properties.vgpr_allocation_granularity =
-- >     shader_core_properties.vgprAllocationGranularity;
--
-- == Version History
--
-- -   Revision 2, 2019-06-25 (Matthaeus G. Chajdas)
--
--     -   Clarified the meaning of a few fields.
--
-- -   Revision 1, 2018-02-15 (Martin Dinkov)
--
--     -   Initial draft.
--
-- = See Also
--
-- 'PhysicalDeviceShaderCorePropertiesAMD'
--
-- = Document Notes
--
-- For more information, see the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VK_AMD_shader_core_properties Vulkan Specification>
--
-- This page is a generated document. Fixes and changes should be made to
-- the generator scripts, not directly.
module Vulkan.Extensions.VK_AMD_shader_core_properties  (PhysicalDeviceShaderCorePropertiesAMD) where

import Vulkan.CStruct (FromCStruct)
import Vulkan.CStruct (ToCStruct)
import Data.Kind (Type)

data PhysicalDeviceShaderCorePropertiesAMD

instance ToCStruct PhysicalDeviceShaderCorePropertiesAMD
instance Show PhysicalDeviceShaderCorePropertiesAMD

instance FromCStruct PhysicalDeviceShaderCorePropertiesAMD

