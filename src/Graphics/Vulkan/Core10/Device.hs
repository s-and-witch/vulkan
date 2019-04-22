{-# language Strict #-}
{-# language CPP #-}
{-# language PatternSynonyms #-}
{-# language DuplicateRecordFields #-}
{-# language TypeFamilies #-}

module Graphics.Vulkan.Core10.Device
  ( DeviceCreateFlags
  , withCStructDeviceCreateInfo
  , fromCStructDeviceCreateInfo
  , DeviceCreateInfo(..)
  , DeviceQueueCreateFlagBits
  , pattern DEVICE_QUEUE_CREATE_PROTECTED_BIT
  , DeviceQueueCreateFlags
  , withCStructDeviceQueueCreateInfo
  , fromCStructDeviceQueueCreateInfo
  , DeviceQueueCreateInfo(..)
  , createDevice
  , destroyDevice
  , withDevice
  ) where

import Control.Exception
  ( bracket
  , throwIO
  )
import Control.Monad
  ( (<=<)
  , when
  )
import Data.ByteString
  ( ByteString
  , useAsCString
  )
import Data.Function
  ( (&)
  )
import Data.Vector
  ( Vector
  )
import qualified Data.Vector
  ( empty
  , generateM
  , length
  )
import Data.Word
  ( Word32
  )
import Foreign.C.Types
  ( CFloat(..)
  )
import Foreign.Marshal.Alloc
  ( alloca
  )
import Foreign.Marshal.Utils
  ( maybePeek
  , maybeWith
  , with
  )
import Foreign.Ptr
  ( castPtr
  )
import Foreign.Storable
  ( peek
  , peekElemOff
  )


import Graphics.Vulkan.C.Core10.Core
  ( Zero(..)
  , pattern VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO
  , pattern VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO
  , pattern VK_SUCCESS
  )
import Graphics.Vulkan.C.Core10.Device
  ( VkDeviceCreateFlags(..)
  , VkDeviceCreateInfo(..)
  , VkDeviceQueueCreateFlagBits(..)
  , VkDeviceQueueCreateInfo(..)
  , vkCreateDevice
  , vkDestroyDevice
  )
import Graphics.Vulkan.C.Core11.Promoted_From_VK_KHR_protected_memory
  ( pattern VK_DEVICE_QUEUE_CREATE_PROTECTED_BIT
  )
import Graphics.Vulkan.C.Dynamic
  ( initDeviceCmds
  )
import Graphics.Vulkan.Core10.DeviceInitialization
  ( AllocationCallbacks(..)
  , Device(..)
  , PhysicalDevice(..)
  , PhysicalDeviceFeatures(..)
  , fromCStructPhysicalDeviceFeatures
  , withCStructAllocationCallbacks
  , withCStructPhysicalDeviceFeatures
  )
import Graphics.Vulkan.Exception
  ( VulkanException(..)
  )
import Graphics.Vulkan.Marshal.Utils
  ( packCStringElemOff
  , withVec
  )
import {-# source #-} Graphics.Vulkan.Marshal.SomeVkStruct
  ( SomeVkStruct
  , peekVkStruct
  , withSomeVkStruct
  )


-- | VkDeviceCreateFlags - Reserved for future use
--
-- = Description
--
-- 'Graphics.Vulkan.C.Core10.Device.VkDeviceCreateFlags' is a bitmask type
-- for setting a mask, but is currently reserved for future use.
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Device.VkDeviceCreateInfo'
type DeviceCreateFlags = VkDeviceCreateFlags


-- No complete pragma for DeviceCreateFlags as it has no patterns


-- | VkDeviceCreateInfo - Structure specifying parameters of a newly created
-- device
--
-- == Valid Usage
--
-- -   The @queueFamilyIndex@ member of each element of @pQueueCreateInfos@
--     /must/ be unique within @pQueueCreateInfos@
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.C.Core10.Core.VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO'
--
-- -   Each @pNext@ member of any structure (including this one) in the
--     @pNext@ chain /must/ be either @NULL@ or a pointer to a valid
--     instance of
--     'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_device_group_creation.VkDeviceGroupDeviceCreateInfo',
--     'Graphics.Vulkan.C.Extensions.VK_AMD_memory_overallocation_behavior.VkDeviceMemoryOverallocationCreateInfoAMD',
--     'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_16bit_storage.VkPhysicalDevice16BitStorageFeatures',
--     'Graphics.Vulkan.C.Extensions.VK_KHR_8bit_storage.VkPhysicalDevice8BitStorageFeaturesKHR',
--     'Graphics.Vulkan.C.Extensions.VK_EXT_astc_decode_mode.VkPhysicalDeviceASTCDecodeFeaturesEXT',
--     'Graphics.Vulkan.C.Extensions.VK_EXT_blend_operation_advanced.VkPhysicalDeviceBlendOperationAdvancedFeaturesEXT',
--     'Graphics.Vulkan.C.Extensions.VK_EXT_buffer_device_address.VkPhysicalDeviceBufferDeviceAddressFeaturesEXT',
--     'Graphics.Vulkan.C.Extensions.VK_NV_compute_shader_derivatives.VkPhysicalDeviceComputeShaderDerivativesFeaturesNV',
--     'Graphics.Vulkan.C.Extensions.VK_EXT_conditional_rendering.VkPhysicalDeviceConditionalRenderingFeaturesEXT',
--     'Graphics.Vulkan.C.Extensions.VK_NV_cooperative_matrix.VkPhysicalDeviceCooperativeMatrixFeaturesNV',
--     'Graphics.Vulkan.C.Extensions.VK_NV_corner_sampled_image.VkPhysicalDeviceCornerSampledImageFeaturesNV',
--     'Graphics.Vulkan.C.Extensions.VK_NV_dedicated_allocation_image_aliasing.VkPhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV',
--     'Graphics.Vulkan.C.Extensions.VK_EXT_depth_clip_enable.VkPhysicalDeviceDepthClipEnableFeaturesEXT',
--     'Graphics.Vulkan.C.Extensions.VK_EXT_descriptor_indexing.VkPhysicalDeviceDescriptorIndexingFeaturesEXT',
--     'Graphics.Vulkan.C.Extensions.VK_NV_scissor_exclusive.VkPhysicalDeviceExclusiveScissorFeaturesNV',
--     'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_get_physical_device_properties2.VkPhysicalDeviceFeatures2',
--     'Graphics.Vulkan.C.Extensions.VK_KHR_shader_float16_int8.VkPhysicalDeviceFloat16Int8FeaturesKHR',
--     'Graphics.Vulkan.C.Extensions.VK_EXT_fragment_density_map.VkPhysicalDeviceFragmentDensityMapFeaturesEXT',
--     'Graphics.Vulkan.C.Extensions.VK_NV_fragment_shader_barycentric.VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV',
--     'Graphics.Vulkan.C.Extensions.VK_EXT_host_query_reset.VkPhysicalDeviceHostQueryResetFeaturesEXT',
--     'Graphics.Vulkan.C.Extensions.VK_EXT_inline_uniform_block.VkPhysicalDeviceInlineUniformBlockFeaturesEXT',
--     'Graphics.Vulkan.C.Extensions.VK_EXT_memory_priority.VkPhysicalDeviceMemoryPriorityFeaturesEXT',
--     'Graphics.Vulkan.C.Extensions.VK_NV_mesh_shader.VkPhysicalDeviceMeshShaderFeaturesNV',
--     'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_multiview.VkPhysicalDeviceMultiviewFeatures',
--     'Graphics.Vulkan.C.Core11.Promoted_From_VK_KHR_protected_memory.VkPhysicalDeviceProtectedMemoryFeatures',
--     'Graphics.Vulkan.C.Extensions.VK_NV_representative_fragment_test.VkPhysicalDeviceRepresentativeFragmentTestFeaturesNV',
--     'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_sampler_ycbcr_conversion.VkPhysicalDeviceSamplerYcbcrConversionFeatures',
--     'Graphics.Vulkan.C.Extensions.VK_EXT_scalar_block_layout.VkPhysicalDeviceScalarBlockLayoutFeaturesEXT',
--     'Graphics.Vulkan.C.Extensions.VK_KHR_shader_atomic_int64.VkPhysicalDeviceShaderAtomicInt64FeaturesKHR',
--     'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_shader_draw_parameters.VkPhysicalDeviceShaderDrawParametersFeatures',
--     'Graphics.Vulkan.C.Extensions.VK_NV_shader_image_footprint.VkPhysicalDeviceShaderImageFootprintFeaturesNV',
--     'Graphics.Vulkan.C.Extensions.VK_NV_shading_rate_image.VkPhysicalDeviceShadingRateImageFeaturesNV',
--     'Graphics.Vulkan.C.Extensions.VK_EXT_transform_feedback.VkPhysicalDeviceTransformFeedbackFeaturesEXT',
--     'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_variable_pointers.VkPhysicalDeviceVariablePointersFeatures',
--     'Graphics.Vulkan.C.Extensions.VK_EXT_vertex_attribute_divisor.VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT',
--     'Graphics.Vulkan.C.Extensions.VK_KHR_vulkan_memory_model.VkPhysicalDeviceVulkanMemoryModelFeaturesKHR',
--     or
--     'Graphics.Vulkan.C.Extensions.VK_EXT_ycbcr_image_arrays.VkPhysicalDeviceYcbcrImageArraysFeaturesEXT'
--
-- -   Each @sType@ member in the @pNext@ chain /must/ be unique
--
-- -   @flags@ /must/ be @0@
--
-- -   @pQueueCreateInfos@ /must/ be a valid pointer to an array of
--     @queueCreateInfoCount@ valid
--     'Graphics.Vulkan.C.Core10.Device.VkDeviceQueueCreateInfo' structures
--
-- -   If @enabledLayerCount@ is not @0@, @ppEnabledLayerNames@ /must/ be a
--     valid pointer to an array of @enabledLayerCount@ null-terminated
--     UTF-8 strings
--
-- -   If @enabledExtensionCount@ is not @0@, @ppEnabledExtensionNames@
--     /must/ be a valid pointer to an array of @enabledExtensionCount@
--     null-terminated UTF-8 strings
--
-- -   If @pEnabledFeatures@ is not @NULL@, @pEnabledFeatures@ /must/ be a
--     valid pointer to a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceFeatures'
--     structure
--
-- -   @queueCreateInfoCount@ /must/ be greater than @0@
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Device.VkDeviceCreateFlags',
-- 'Graphics.Vulkan.C.Core10.Device.VkDeviceQueueCreateInfo',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceFeatures',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType',
-- 'Graphics.Vulkan.C.Core10.Device.vkCreateDevice'
data DeviceCreateInfo = DeviceCreateInfo
  { -- Univalued member elided
  -- No documentation found for Nested "DeviceCreateInfo" "pNext"
  next :: Maybe SomeVkStruct
  , -- No documentation found for Nested "DeviceCreateInfo" "flags"
  flags :: DeviceCreateFlags
  -- Length valued member elided
  , -- No documentation found for Nested "DeviceCreateInfo" "pQueueCreateInfos"
  queueCreateInfos :: Vector DeviceQueueCreateInfo
  -- Length valued member elided
  , -- No documentation found for Nested "DeviceCreateInfo" "ppEnabledLayerNames"
  enabledLayerNames :: Vector ByteString
  -- Length valued member elided
  , -- No documentation found for Nested "DeviceCreateInfo" "ppEnabledExtensionNames"
  enabledExtensionNames :: Vector ByteString
  , -- No documentation found for Nested "DeviceCreateInfo" "pEnabledFeatures"
  enabledFeatures :: Maybe PhysicalDeviceFeatures
  }
  deriving (Show, Eq)

-- | A function to temporarily allocate memory for a 'VkDeviceCreateInfo' and
-- marshal a 'DeviceCreateInfo' into it. The 'VkDeviceCreateInfo' is only valid inside
-- the provided computation and must not be returned out of it.
withCStructDeviceCreateInfo :: DeviceCreateInfo -> (VkDeviceCreateInfo -> IO a) -> IO a
withCStructDeviceCreateInfo marshalled cont = maybeWith (\a -> withCStructPhysicalDeviceFeatures a . flip with) (enabledFeatures (marshalled :: DeviceCreateInfo)) (\pPEnabledFeatures -> withVec useAsCString (enabledExtensionNames (marshalled :: DeviceCreateInfo)) (\pPpEnabledExtensionNames -> withVec useAsCString (enabledLayerNames (marshalled :: DeviceCreateInfo)) (\pPpEnabledLayerNames -> withVec withCStructDeviceQueueCreateInfo (queueCreateInfos (marshalled :: DeviceCreateInfo)) (\pPQueueCreateInfos -> maybeWith withSomeVkStruct (next (marshalled :: DeviceCreateInfo)) (\pPNext -> cont (VkDeviceCreateInfo VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO pPNext (flags (marshalled :: DeviceCreateInfo)) (fromIntegral (Data.Vector.length (queueCreateInfos (marshalled :: DeviceCreateInfo)))) pPQueueCreateInfos (fromIntegral (Data.Vector.length (enabledLayerNames (marshalled :: DeviceCreateInfo)))) pPpEnabledLayerNames (fromIntegral (Data.Vector.length (enabledExtensionNames (marshalled :: DeviceCreateInfo)))) pPpEnabledExtensionNames pPEnabledFeatures))))))

-- | A function to read a 'VkDeviceCreateInfo' and all additional
-- structures in the pointer chain into a 'DeviceCreateInfo'.
fromCStructDeviceCreateInfo :: VkDeviceCreateInfo -> IO DeviceCreateInfo
fromCStructDeviceCreateInfo c = DeviceCreateInfo <$> -- Univalued Member elided
                                                 maybePeek peekVkStruct (castPtr (vkPNext (c :: VkDeviceCreateInfo)))
                                                 <*> pure (vkFlags (c :: VkDeviceCreateInfo))
                                                 -- Length valued member elided
                                                 <*> (Data.Vector.generateM (fromIntegral (vkQueueCreateInfoCount (c :: VkDeviceCreateInfo))) (((fromCStructDeviceQueueCreateInfo <=<) . peekElemOff) (vkPQueueCreateInfos (c :: VkDeviceCreateInfo))))
                                                 -- Length valued member elided
                                                 <*> (Data.Vector.generateM (fromIntegral (vkEnabledLayerCount (c :: VkDeviceCreateInfo))) (packCStringElemOff (vkPPEnabledLayerNames (c :: VkDeviceCreateInfo))))
                                                 -- Length valued member elided
                                                 <*> (Data.Vector.generateM (fromIntegral (vkEnabledExtensionCount (c :: VkDeviceCreateInfo))) (packCStringElemOff (vkPPEnabledExtensionNames (c :: VkDeviceCreateInfo))))
                                                 <*> maybePeek (fromCStructPhysicalDeviceFeatures <=< peek) (vkPEnabledFeatures (c :: VkDeviceCreateInfo))

instance Zero DeviceCreateInfo where
  zero = DeviceCreateInfo Nothing
                          zero
                          Data.Vector.empty
                          Data.Vector.empty
                          Data.Vector.empty
                          Nothing


-- | VkDeviceQueueCreateFlagBits - Bitmask specifying behavior of the queue
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Device.VkDeviceQueueCreateFlags'
type DeviceQueueCreateFlagBits = VkDeviceQueueCreateFlagBits


{-# complete DEVICE_QUEUE_CREATE_PROTECTED_BIT :: DeviceQueueCreateFlagBits #-}


-- | 'Graphics.Vulkan.C.Core11.Promoted_From_VK_KHR_protected_memory.VK_DEVICE_QUEUE_CREATE_PROTECTED_BIT'
-- specifies that the device queue is a protected-capable queue. If the
-- protected memory feature is not enabled, the
-- 'Graphics.Vulkan.C.Core11.Promoted_From_VK_KHR_protected_memory.VK_DEVICE_QUEUE_CREATE_PROTECTED_BIT'
-- bit of @flags@ /must/ not be set.
pattern DEVICE_QUEUE_CREATE_PROTECTED_BIT :: (a ~ DeviceQueueCreateFlagBits) => a
pattern DEVICE_QUEUE_CREATE_PROTECTED_BIT = VK_DEVICE_QUEUE_CREATE_PROTECTED_BIT

-- | VkDeviceQueueCreateFlags - Bitmask of VkDeviceQueueCreateFlagBits
--
-- = Description
--
-- 'Graphics.Vulkan.C.Core10.Device.VkDeviceQueueCreateFlags' is a bitmask
-- type for setting a mask of zero or more
-- 'Graphics.Vulkan.C.Core10.Device.VkDeviceQueueCreateFlagBits'.
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Device.VkDeviceQueueCreateFlagBits',
-- 'Graphics.Vulkan.C.Core10.Device.VkDeviceQueueCreateInfo',
-- 'Graphics.Vulkan.C.Core11.Promoted_From_VK_KHR_protected_memory.VkDeviceQueueInfo2'
type DeviceQueueCreateFlags = DeviceQueueCreateFlagBits


-- | VkDeviceQueueCreateInfo - Structure specifying parameters of a newly
-- created device queue
--
-- == Valid Usage
--
-- -   @queueFamilyIndex@ /must/ be less than @pQueueFamilyPropertyCount@
--     returned by
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.vkGetPhysicalDeviceQueueFamilyProperties'
--
-- -   @queueCount@ /must/ be less than or equal to the @queueCount@ member
--     of the
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkQueueFamilyProperties'
--     structure, as returned by
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.vkGetPhysicalDeviceQueueFamilyProperties'
--     in the @pQueueFamilyProperties@[@queueFamilyIndex@]
--
-- -   Each element of @pQueuePriorities@ /must/ be between @0.0@ and @1.0@
--     inclusive
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.C.Core10.Core.VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO'
--
-- -   @pNext@ /must/ be @NULL@ or a pointer to a valid instance of
--     'Graphics.Vulkan.C.Extensions.VK_EXT_global_priority.VkDeviceQueueGlobalPriorityCreateInfoEXT'
--
-- -   @flags@ /must/ be a valid combination of
--     'Graphics.Vulkan.C.Core10.Device.VkDeviceQueueCreateFlagBits' values
--
-- -   @pQueuePriorities@ /must/ be a valid pointer to an array of
--     @queueCount@ @float@ values
--
-- -   @queueCount@ /must/ be greater than @0@
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Device.VkDeviceCreateInfo',
-- 'Graphics.Vulkan.C.Core10.Device.VkDeviceQueueCreateFlags',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType'
data DeviceQueueCreateInfo = DeviceQueueCreateInfo
  { -- Univalued member elided
  -- No documentation found for Nested "DeviceQueueCreateInfo" "pNext"
  next :: Maybe SomeVkStruct
  , -- No documentation found for Nested "DeviceQueueCreateInfo" "flags"
  flags :: DeviceQueueCreateFlags
  , -- No documentation found for Nested "DeviceQueueCreateInfo" "queueFamilyIndex"
  queueFamilyIndex :: Word32
  -- Length valued member elided
  , -- No documentation found for Nested "DeviceQueueCreateInfo" "pQueuePriorities"
  queuePriorities :: Vector CFloat
  }
  deriving (Show, Eq)

-- | A function to temporarily allocate memory for a 'VkDeviceQueueCreateInfo' and
-- marshal a 'DeviceQueueCreateInfo' into it. The 'VkDeviceQueueCreateInfo' is only valid inside
-- the provided computation and must not be returned out of it.
withCStructDeviceQueueCreateInfo :: DeviceQueueCreateInfo -> (VkDeviceQueueCreateInfo -> IO a) -> IO a
withCStructDeviceQueueCreateInfo marshalled cont = withVec (&) (queuePriorities (marshalled :: DeviceQueueCreateInfo)) (\pPQueuePriorities -> maybeWith withSomeVkStruct (next (marshalled :: DeviceQueueCreateInfo)) (\pPNext -> cont (VkDeviceQueueCreateInfo VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO pPNext (flags (marshalled :: DeviceQueueCreateInfo)) (queueFamilyIndex (marshalled :: DeviceQueueCreateInfo)) (fromIntegral (Data.Vector.length (queuePriorities (marshalled :: DeviceQueueCreateInfo)))) pPQueuePriorities)))

-- | A function to read a 'VkDeviceQueueCreateInfo' and all additional
-- structures in the pointer chain into a 'DeviceQueueCreateInfo'.
fromCStructDeviceQueueCreateInfo :: VkDeviceQueueCreateInfo -> IO DeviceQueueCreateInfo
fromCStructDeviceQueueCreateInfo c = DeviceQueueCreateInfo <$> -- Univalued Member elided
                                                           maybePeek peekVkStruct (castPtr (vkPNext (c :: VkDeviceQueueCreateInfo)))
                                                           <*> pure (vkFlags (c :: VkDeviceQueueCreateInfo))
                                                           <*> pure (vkQueueFamilyIndex (c :: VkDeviceQueueCreateInfo))
                                                           -- Length valued member elided
                                                           <*> (Data.Vector.generateM (fromIntegral (vkQueueCount (c :: VkDeviceQueueCreateInfo))) (peekElemOff (vkPQueuePriorities (c :: VkDeviceQueueCreateInfo))))

instance Zero DeviceQueueCreateInfo where
  zero = DeviceQueueCreateInfo Nothing
                               zero
                               zero
                               Data.Vector.empty



-- | vkCreateDevice - Create a new device instance
--
-- = Parameters
--
-- -   @physicalDevice@ /must/ be one of the device handles returned from a
--     call to
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.vkEnumeratePhysicalDevices'
--     (see
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#devsandqueues-physical-device-enumeration Physical Device Enumeration>).
--
-- -   @pCreateInfo@ is a pointer to a
--     'Graphics.Vulkan.C.Core10.Device.VkDeviceCreateInfo' structure
--     containing information about how to create the device.
--
-- -   @pAllocator@ controls host memory allocation as described in the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#memory-allocation Memory Allocation>
--     chapter.
--
-- -   @pDevice@ points to a handle in which the created
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' is
--     returned.
--
-- = Description
--
-- 'Graphics.Vulkan.C.Core10.Device.vkCreateDevice' verifies that
-- extensions and features requested in the @ppEnabledExtensionNames@ and
-- @pEnabledFeatures@ members of @pCreateInfo@, respectively, are supported
-- by the implementation. If any requested extension is not supported,
-- 'Graphics.Vulkan.C.Core10.Device.vkCreateDevice' /must/ return
-- 'Graphics.Vulkan.C.Core10.Core.VK_ERROR_EXTENSION_NOT_PRESENT'. If any
-- requested feature is not supported,
-- 'Graphics.Vulkan.C.Core10.Device.vkCreateDevice' /must/ return
-- 'Graphics.Vulkan.C.Core10.Core.VK_ERROR_FEATURE_NOT_PRESENT'. Support
-- for extensions /can/ be checked before creating a device by querying
-- 'Graphics.Vulkan.C.Core10.ExtensionDiscovery.vkEnumerateDeviceExtensionProperties'.
-- Support for features /can/ similarly be checked by querying
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.vkGetPhysicalDeviceFeatures'.
--
-- After verifying and enabling the extensions the
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' object is
-- created and returned to the application. If a requested extension is
-- only supported by a layer, both the layer and the extension need to be
-- specified at
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.vkCreateInstance' time
-- for the creation to succeed.
--
-- Multiple logical devices /can/ be created from the same physical device.
-- Logical device creation /may/ fail due to lack of device-specific
-- resources (in addition to the other errors). If that occurs,
-- 'Graphics.Vulkan.C.Core10.Device.vkCreateDevice' will return
-- 'Graphics.Vulkan.C.Core10.Core.VK_ERROR_TOO_MANY_OBJECTS'.
--
-- == Valid Usage
--
-- -   All
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#extendingvulkan-extensions-extensiondependencies required extensions>
--     for each extension in the
--     'Graphics.Vulkan.C.Core10.Device.VkDeviceCreateInfo'::@ppEnabledExtensionNames@
--     list /must/ also be present in that list.
--
-- == Valid Usage (Implicit)
--
-- -   @physicalDevice@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDevice'
--     handle
--
-- -   @pCreateInfo@ /must/ be a valid pointer to a valid
--     'Graphics.Vulkan.C.Core10.Device.VkDeviceCreateInfo' structure
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     structure
--
-- -   @pDevice@ /must/ be a valid pointer to a
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' handle
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_OUT_OF_DEVICE_MEMORY'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_INITIALIZATION_FAILED'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_EXTENSION_NOT_PRESENT'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_FEATURE_NOT_PRESENT'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_TOO_MANY_OBJECTS'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_DEVICE_LOST'
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice',
-- 'Graphics.Vulkan.C.Core10.Device.VkDeviceCreateInfo',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDevice'
createDevice :: PhysicalDevice ->  DeviceCreateInfo ->  Maybe AllocationCallbacks ->  IO (Device)
createDevice = \(PhysicalDevice physicalDevice' commandTable) -> \createInfo' -> \allocator -> alloca (\pDevice' -> maybeWith (\marshalled -> withCStructAllocationCallbacks marshalled . flip with) allocator (\pAllocator -> (\marshalled -> withCStructDeviceCreateInfo marshalled . flip with) createInfo' (\pCreateInfo' -> vkCreateDevice commandTable physicalDevice' pCreateInfo' pAllocator pDevice' >>= (\ret -> when (ret < VK_SUCCESS) (throwIO (VulkanException ret)) *> (peek pDevice' >>= (\deviceH -> Device deviceH <$> initDeviceCmds commandTable deviceH))))))


-- | vkDestroyDevice - Destroy a logical device
--
-- = Parameters
--
-- -   @device@ is the logical device to destroy.
--
-- -   @pAllocator@ controls host memory allocation as described in the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#memory-allocation Memory Allocation>
--     chapter.
--
-- = Description
--
-- To ensure that no work is active on the device,
-- 'Graphics.Vulkan.C.Core10.Queue.vkDeviceWaitIdle' /can/ be used to gate
-- the destruction of the device. Prior to destroying a device, an
-- application is responsible for destroying\/freeing any Vulkan objects
-- that were created using that device as the first parameter of the
-- corresponding @vkCreate*@ or @vkAllocate*@ command.
--
-- __Note__
--
-- The lifetime of each of these objects is bound by the lifetime of the
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' object.
-- Therefore, to avoid resource leaks, it is critical that an application
-- explicitly free all of these resources prior to calling
-- 'Graphics.Vulkan.C.Core10.Device.vkDestroyDevice'.
--
-- == Valid Usage
--
-- -   All child objects created on @device@ /must/ have been destroyed
--     prior to destroying @device@
--
-- -   If
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     were provided when @device@ was created, a compatible set of
--     callbacks /must/ be provided here
--
-- -   If no
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     were provided when @device@ was created, @pAllocator@ /must/ be
--     @NULL@
--
-- == Valid Usage (Implicit)
--
-- -   If @device@ is not @NULL@, @device@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' handle
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     structure
--
-- == Host Synchronization
--
-- -   Host access to @device@ /must/ be externally synchronized
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
destroyDevice :: Device ->  Maybe AllocationCallbacks ->  IO ()
destroyDevice = \(Device device' commandTable) -> \allocator -> maybeWith (\marshalled -> withCStructAllocationCallbacks marshalled . flip with) allocator (\pAllocator -> vkDestroyDevice commandTable device' pAllocator *> (pure ()))

-- | A safe wrapper for 'createDevice' and 'destroyDevice' using 'bracket'
--
-- The allocated value must not be returned from the provided computation
withDevice
  :: PhysicalDevice -> DeviceCreateInfo -> Maybe (AllocationCallbacks) -> (Device -> IO a) -> IO a
withDevice physicalDevice deviceCreateInfo allocationCallbacks = bracket
  (createDevice physicalDevice deviceCreateInfo allocationCallbacks)
  (\o -> destroyDevice o allocationCallbacks)
