{-# language CPP #-}
-- | = Name
--
-- VK_KHR_format_feature_flags2 - device extension
--
-- == VK_KHR_format_feature_flags2
--
-- [__Name String__]
--     @VK_KHR_format_feature_flags2@
--
-- [__Extension Type__]
--     Device extension
--
-- [__Registered Extension Number__]
--     361
--
-- [__Revision__]
--     1
--
-- [__Extension and Version Dependencies__]
--
--     -   Requires Vulkan 1.0
--
--     -   Requires @VK_KHR_get_physical_device_properties2@
--
-- [__Contact__]
--
--     -   Lionel Landwerlin
--         <https://github.com/KhronosGroup/Vulkan-Docs/issues/new?body=[VK_KHR_format_feature_flags2] @llandwerlin%0A<<Here describe the issue or question you have about the VK_KHR_format_feature_flags2 extension>> >
--
-- == Other Extension Metadata
--
-- [__Last Modified Date__]
--     2021-07-01
--
-- [__IP Status__]
--     No known IP claims.
--
-- [__Contributors__]
--
--     -   Lionel Landwerlin, Intel
--
--     -   Jason Ekstrand, Intel
--
--     -   Tobias Hector, AMD
--
--     -   Spencer Fricke, Samsung Electronics
--
--     -   Graeme Leese, Broadcom
--
--     -   Jan-Harald Fredriksen, ARM
--
-- == Description
--
-- This extension adds a new
-- 'Vulkan.Extensions.VK_KHR_acceleration_structure.FormatFeatureFlagBits2KHR'
-- 64bits format feature flag type to extend the existing
-- 'Vulkan.Core10.Enums.FormatFeatureFlagBits.FormatFeatureFlagBits' which
-- is limited to 31 flags. At the time of this writing 29 bits of
-- 'Vulkan.Core10.Enums.FormatFeatureFlagBits.FormatFeatureFlagBits' are
-- already used.
--
-- Because
-- 'Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2.FormatProperties2'
-- is already defined to extend the Vulkan 1.0
-- 'Vulkan.Core10.DeviceInitialization.getPhysicalDeviceFormatProperties'
-- entry point, this extension defines a new 'FormatProperties3KHR' to
-- extend the 'Vulkan.Core10.DeviceInitialization.FormatProperties'.
--
-- On top of replicating all the bits from
-- 'Vulkan.Core10.Enums.FormatFeatureFlagBits.FormatFeatureFlagBits',
-- 'Vulkan.Extensions.VK_KHR_acceleration_structure.FormatFeatureFlagBits2KHR'
-- adds the following bits :
--
-- -   'Vulkan.Extensions.VK_KHR_acceleration_structure.FORMAT_FEATURE_2_STORAGE_READ_WITHOUT_FORMAT_BIT_KHR'
--     and
--     'Vulkan.Extensions.VK_KHR_acceleration_structure.FORMAT_FEATURE_2_STORAGE_WRITE_WITHOUT_FORMAT_BIT_KHR'
--     indicate that an implementation supports respectively reading and
--     writing a given 'Vulkan.Core10.Enums.Format.Format' through storage
--     operations without specifying the format in the shader.
--
-- -   'Vulkan.Extensions.VK_KHR_acceleration_structure.FORMAT_FEATURE_2_SAMPLED_IMAGE_DEPTH_COMPARISON_BIT_KHR'
--     indicates that an implementation supports depth comparison performed
--     by @OpImage*Dref@ instructions on a given
--     'Vulkan.Core10.Enums.Format.Format'. Previously the result of
--     executing a @OpImage*Dref*@ instruction on an image view, where the
--     @format@ was not one of the depth\/stencil formats with a depth
--     component, was undefined. This bit clarifies on which formats such
--     instructions can be used.
--
-- == New Structures
--
-- -   Extending
--     'Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2.FormatProperties2':
--
--     -   'FormatProperties3KHR'
--
-- == New Enums
--
-- -   'Vulkan.Extensions.VK_KHR_acceleration_structure.FormatFeatureFlagBits2KHR'
--
-- == New Bitmasks
--
-- -   'Vulkan.Extensions.VK_KHR_acceleration_structure.FormatFeatureFlags2KHR'
--
-- == New Enum Constants
--
-- -   'KHR_FORMAT_FEATURE_FLAGS_2_EXTENSION_NAME'
--
-- -   'KHR_FORMAT_FEATURE_FLAGS_2_SPEC_VERSION'
--
-- -   Extending 'Vulkan.Core10.Enums.StructureType.StructureType':
--
--     -   'Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_FORMAT_PROPERTIES_3_KHR'
--
-- == Version History
--
-- -   Revision 1, 2020-07-21 (Lionel Landwerlin)
--
--     -   Initial draft
--
-- = See Also
--
-- 'Vulkan.Extensions.VK_KHR_acceleration_structure.FormatFeatureFlagBits2KHR',
-- 'Vulkan.Extensions.VK_KHR_acceleration_structure.FormatFeatureFlags2KHR',
-- 'FormatProperties3KHR'
--
-- = Document Notes
--
-- For more information, see the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VK_KHR_format_feature_flags2 Vulkan Specification>
--
-- This page is a generated document. Fixes and changes should be made to
-- the generator scripts, not directly.
module Vulkan.Extensions.VK_KHR_format_feature_flags2  (FormatProperties3KHR) where

import Vulkan.CStruct (FromCStruct)
import Vulkan.CStruct (ToCStruct)
import Data.Kind (Type)

data FormatProperties3KHR

instance ToCStruct FormatProperties3KHR
instance Show FormatProperties3KHR

instance FromCStruct FormatProperties3KHR

