{-# language CPP #-}
-- | = Name
--
-- VK_EXT_validation_features - instance extension
--
-- == VK_EXT_validation_features
--
-- [__Name String__]
--     @VK_EXT_validation_features@
--
-- [__Extension Type__]
--     Instance extension
--
-- [__Registered Extension Number__]
--     248
--
-- [__Revision__]
--     4
--
-- [__Extension and Version Dependencies__]
--
--     -   Requires Vulkan 1.0
--
-- [__Special Use__]
--
--     -   <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#extendingvulkan-compatibility-specialuse Debugging tools>
--
-- [__Contact__]
--
--     -   Karl Schultz
--         <https://github.com/KhronosGroup/Vulkan-Docs/issues/new?title=VK_EXT_validation_features:%20&body=@karl-lunarg%20 >
--
-- == Other Extension Metadata
--
-- [__Last Modified Date__]
--     2018-11-14
--
-- [__IP Status__]
--     No known IP claims.
--
-- [__Contributors__]
--
--     -   Karl Schultz, LunarG
--
--     -   Dave Houlton, LunarG
--
--     -   Mark Lobodzinski, LunarG
--
--     -   Camden Stocker, LunarG
--
--     -   Tony Barbour, LunarG
--
--     -   John Zulauf, LunarG
--
-- == Description
--
-- This extension provides the 'ValidationFeaturesEXT' struct that can be
-- included in the @pNext@ chain of the
-- 'Vulkan.Core10.DeviceInitialization.InstanceCreateInfo' structure passed
-- as the @pCreateInfo@ parameter of
-- 'Vulkan.Core10.DeviceInitialization.createInstance'. The structure
-- contains an array of 'ValidationFeatureEnableEXT' enum values that
-- enable specific validation features that are disabled by default. The
-- structure also contains an array of 'ValidationFeatureDisableEXT' enum
-- values that disable specific validation layer features that are enabled
-- by default.
--
-- Note
--
-- The @VK_EXT_validation_features@ extension subsumes all the
-- functionality provided in the @VK_EXT_validation_flags@ extension.
--
-- == New Structures
--
-- -   Extending 'Vulkan.Core10.DeviceInitialization.InstanceCreateInfo':
--
--     -   'ValidationFeaturesEXT'
--
-- == New Enums
--
-- -   'ValidationFeatureDisableEXT'
--
-- -   'ValidationFeatureEnableEXT'
--
-- == New Enum Constants
--
-- -   'EXT_VALIDATION_FEATURES_EXTENSION_NAME'
--
-- -   'EXT_VALIDATION_FEATURES_SPEC_VERSION'
--
-- -   Extending 'Vulkan.Core10.Enums.StructureType.StructureType':
--
--     -   'Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_VALIDATION_FEATURES_EXT'
--
-- == Version History
--
-- -   Revision 1, 2018-11-14 (Karl Schultz)
--
--     -   Initial revision
--
-- -   Revision 2, 2019-08-06 (Mark Lobodzinski)
--
--     -   Add Best Practices enable
--
-- -   Revision 3, 2020-03-04 (Tony Barbour)
--
--     -   Add Debug Printf enable
--
-- -   Revision 4, 2020-07-29 (John Zulauf)
--
--     -   Add Synchronization Validation enable
--
-- = See Also
--
-- 'ValidationFeatureDisableEXT', 'ValidationFeatureEnableEXT',
-- 'ValidationFeaturesEXT'
--
-- = Document Notes
--
-- For more information, see the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VK_EXT_validation_features Vulkan Specification>
--
-- This page is a generated document. Fixes and changes should be made to
-- the generator scripts, not directly.
module Vulkan.Extensions.VK_EXT_validation_features  (ValidationFeaturesEXT) where

import Vulkan.CStruct (FromCStruct)
import Vulkan.CStruct (ToCStruct)
import Data.Kind (Type)

data ValidationFeaturesEXT

instance ToCStruct ValidationFeaturesEXT
instance Show ValidationFeaturesEXT

instance FromCStruct ValidationFeaturesEXT

