{-# language Strict #-}
{-# language CPP #-}
{-# language DuplicateRecordFields #-}
{-# language GeneralizedNewtypeDeriving #-}
{-# language PatternSynonyms #-}
{-# language DataKinds #-}
{-# language TypeOperators #-}
{-# language OverloadedStrings #-}

module Graphics.Vulkan.C.Extensions.VK_KHR_swapchain
  ( VkAcquireNextImageInfoKHR(..)
  , VkBindImageMemorySwapchainInfoKHR(..)
  , VkDeviceGroupPresentCapabilitiesKHR(..)
  , VkDeviceGroupPresentInfoKHR(..)
  , VkDeviceGroupPresentModeFlagBitsKHR(..)
  , pattern VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_BIT_KHR
  , pattern VK_DEVICE_GROUP_PRESENT_MODE_REMOTE_BIT_KHR
  , pattern VK_DEVICE_GROUP_PRESENT_MODE_SUM_BIT_KHR
  , pattern VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_MULTI_DEVICE_BIT_KHR
  , VkDeviceGroupPresentModeFlagsKHR
  , VkDeviceGroupSwapchainCreateInfoKHR(..)
  , VkImageSwapchainCreateInfoKHR(..)
  , VkPresentInfoKHR(..)
  , VkSwapchainCreateFlagBitsKHR(..)
  , VkSwapchainCreateFlagsKHR
  , VkSwapchainCreateInfoKHR(..)
  , VkSwapchainKHR
  , FN_vkAcquireNextImage2KHR
  , PFN_vkAcquireNextImage2KHR
  , vkAcquireNextImage2KHR
  , FN_vkAcquireNextImageKHR
  , PFN_vkAcquireNextImageKHR
  , vkAcquireNextImageKHR
  , FN_vkCreateSwapchainKHR
  , PFN_vkCreateSwapchainKHR
  , vkCreateSwapchainKHR
  , FN_vkDestroySwapchainKHR
  , PFN_vkDestroySwapchainKHR
  , vkDestroySwapchainKHR
  , FN_vkGetDeviceGroupPresentCapabilitiesKHR
  , PFN_vkGetDeviceGroupPresentCapabilitiesKHR
  , vkGetDeviceGroupPresentCapabilitiesKHR
  , FN_vkGetDeviceGroupSurfacePresentModesKHR
  , PFN_vkGetDeviceGroupSurfacePresentModesKHR
  , vkGetDeviceGroupSurfacePresentModesKHR
  , FN_vkGetPhysicalDevicePresentRectanglesKHR
  , PFN_vkGetPhysicalDevicePresentRectanglesKHR
  , vkGetPhysicalDevicePresentRectanglesKHR
  , FN_vkGetSwapchainImagesKHR
  , PFN_vkGetSwapchainImagesKHR
  , vkGetSwapchainImagesKHR
  , FN_vkQueuePresentKHR
  , PFN_vkQueuePresentKHR
  , vkQueuePresentKHR
  , pattern VK_ERROR_OUT_OF_DATE_KHR
  , pattern VK_IMAGE_LAYOUT_PRESENT_SRC_KHR
  , pattern VK_KHR_SWAPCHAIN_EXTENSION_NAME
  , pattern VK_KHR_SWAPCHAIN_SPEC_VERSION
  , pattern VK_OBJECT_TYPE_SWAPCHAIN_KHR
  , pattern VK_STRUCTURE_TYPE_ACQUIRE_NEXT_IMAGE_INFO_KHR
  , pattern VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_SWAPCHAIN_INFO_KHR
  , pattern VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_CAPABILITIES_KHR
  , pattern VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_INFO_KHR
  , pattern VK_STRUCTURE_TYPE_DEVICE_GROUP_SWAPCHAIN_CREATE_INFO_KHR
  , pattern VK_STRUCTURE_TYPE_IMAGE_SWAPCHAIN_CREATE_INFO_KHR
  , pattern VK_STRUCTURE_TYPE_PRESENT_INFO_KHR
  , pattern VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR
  , pattern VK_SUBOPTIMAL_KHR
  , pattern VK_SWAPCHAIN_CREATE_PROTECTED_BIT_KHR
  , pattern VK_SWAPCHAIN_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT_KHR
  ) where

import Data.Bits
  ( Bits
  , FiniteBits
  )
import Data.String
  ( IsString
  )
import Data.Vector.Storable.Sized
  ( Vector
  )
import Data.Word
  ( Word32
  , Word64
  )
import Foreign.Ptr
  ( FunPtr
  , Ptr
  , plusPtr
  )
import Foreign.Storable
  ( Storable
  , Storable(..)
  )
import GHC.Read
  ( choose
  , expectP
  )
import Text.ParserCombinators.ReadPrec
  ( (+++)
  , prec
  , step
  )
import Text.Read
  ( Read(..)
  , parens
  )
import Text.Read.Lex
  ( Lexeme(Ident)
  )


import Graphics.Vulkan.C.Core10.Buffer
  ( VkSharingMode(..)
  )
import Graphics.Vulkan.C.Core10.Core
  ( VkBool32(..)
  , VkFormat(..)
  , VkObjectType(..)
  , VkResult(..)
  , VkStructureType(..)
  , Zero(..)
  , VkFlags
  )
import Graphics.Vulkan.C.Core10.DeviceInitialization
  ( VkAllocationCallbacks(..)
  , VkDevice
  , VkImageUsageFlags
  , VkPhysicalDevice
  )
import Graphics.Vulkan.C.Core10.Image
  ( VkImageLayout(..)
  )
import Graphics.Vulkan.C.Core10.MemoryManagement
  ( VkImage
  )
import Graphics.Vulkan.C.Core10.Pipeline
  ( VkExtent2D(..)
  , VkRect2D(..)
  )
import Graphics.Vulkan.C.Core10.Queue
  ( VkFence
  , VkQueue
  , VkSemaphore
  )
import Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_device_group_creation
  ( VK_MAX_DEVICE_GROUP_SIZE
  )
import Graphics.Vulkan.C.Dynamic
  ( DeviceCmds(..)
  , InstanceCmds(..)
  )
import Graphics.Vulkan.C.Extensions.VK_KHR_surface
  ( VkColorSpaceKHR(..)
  , VkCompositeAlphaFlagBitsKHR(..)
  , VkPresentModeKHR(..)
  , VkSurfaceTransformFlagBitsKHR(..)
  , VkSurfaceKHR
  )
import Graphics.Vulkan.NamedType
  ( (:::)
  )


-- | VkAcquireNextImageInfoKHR - Structure specifying parameters of the
-- acquire
--
-- = Description
--
-- If 'vkAcquireNextImageKHR' is used, the device mask is considered to
-- include all physical devices in the logical device.
--
-- __Note__
--
-- 'vkAcquireNextImage2KHR' signals at most one semaphore, even if the
-- application requests waiting for multiple physical devices to be ready
-- via the @deviceMask@. However, only a single physical device /can/ wait
-- on that semaphore, since the semaphore becomes unsignaled when the wait
-- succeeds. For other physical devices to wait for the image to be ready,
-- it is necessary for the application to submit semaphore signal
-- operation(s) to that first physical device to signal additional
-- semaphore(s) after the wait succeeds, which the other physical device(s)
-- /can/ wait upon.
--
-- == Valid Usage
--
-- -   @swapchain@ /must/ not be in the retired state
--
-- -   If @semaphore@ is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE' it /must/ be
--     unsignaled
--
-- -   If @semaphore@ is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE' it /must/ not
--     have any uncompleted signal or wait operations pending
--
-- -   If @fence@ is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE' it /must/ be
--     unsignaled and /must/ not be associated with any other queue command
--     that has not yet completed execution on that queue
--
-- -   @semaphore@ and @fence@ /must/ not both be equal to
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE'
--
-- -   @deviceMask@ /must/ be a valid device mask
--
-- -   @deviceMask@ /must/ not be zero
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be 'VK_STRUCTURE_TYPE_ACQUIRE_NEXT_IMAGE_INFO_KHR'
--
-- -   @pNext@ /must/ be @NULL@
--
-- -   @swapchain@ /must/ be a valid 'VkSwapchainKHR' handle
--
-- -   If @semaphore@ is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE', @semaphore@
--     /must/ be a valid 'Graphics.Vulkan.C.Core10.Queue.VkSemaphore'
--     handle
--
-- -   If @fence@ is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE', @fence@ /must/
--     be a valid 'Graphics.Vulkan.C.Core10.Queue.VkFence' handle
--
-- -   Each of @fence@, @semaphore@, and @swapchain@ that are valid handles
--     /must/ have been created, allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance'
--
-- == Host Synchronization
--
-- -   Host access to @swapchain@ /must/ be externally synchronized
--
-- -   Host access to @semaphore@ /must/ be externally synchronized
--
-- -   Host access to @fence@ /must/ be externally synchronized
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkFence',
-- 'Graphics.Vulkan.C.Core10.Queue.VkSemaphore',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType', 'VkSwapchainKHR',
-- 'vkAcquireNextImage2KHR'
data VkAcquireNextImageInfoKHR = VkAcquireNextImageInfoKHR
  { -- | @sType@ is the type of this structure.
  vkSType :: VkStructureType
  , -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
  vkPNext :: Ptr ()
  , -- | @swapchain@ is a non-retired swapchain from which an image is acquired.
  vkSwapchain :: VkSwapchainKHR
  , -- | @timeout@ specifies how long the function waits, in nanoseconds, if no
  -- image is available.
  vkTimeout :: Word64
  , -- | @semaphore@ is 'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE' or a
  -- semaphore to signal.
  vkSemaphore :: VkSemaphore
  , -- | @fence@ is 'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE' or a
  -- fence to signal.
  vkFence :: VkFence
  , -- | @deviceMask@ is a mask of physical devices for which the swapchain image
  -- will be ready to use when the semaphore or fence is signaled.
  vkDeviceMask :: Word32
  }
  deriving (Eq, Show)

instance Storable VkAcquireNextImageInfoKHR where
  sizeOf ~_ = 56
  alignment ~_ = 8
  peek ptr = VkAcquireNextImageInfoKHR <$> peek (ptr `plusPtr` 0)
                                       <*> peek (ptr `plusPtr` 8)
                                       <*> peek (ptr `plusPtr` 16)
                                       <*> peek (ptr `plusPtr` 24)
                                       <*> peek (ptr `plusPtr` 32)
                                       <*> peek (ptr `plusPtr` 40)
                                       <*> peek (ptr `plusPtr` 48)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkAcquireNextImageInfoKHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkAcquireNextImageInfoKHR))
                *> poke (ptr `plusPtr` 16) (vkSwapchain (poked :: VkAcquireNextImageInfoKHR))
                *> poke (ptr `plusPtr` 24) (vkTimeout (poked :: VkAcquireNextImageInfoKHR))
                *> poke (ptr `plusPtr` 32) (vkSemaphore (poked :: VkAcquireNextImageInfoKHR))
                *> poke (ptr `plusPtr` 40) (vkFence (poked :: VkAcquireNextImageInfoKHR))
                *> poke (ptr `plusPtr` 48) (vkDeviceMask (poked :: VkAcquireNextImageInfoKHR))

instance Zero VkAcquireNextImageInfoKHR where
  zero = VkAcquireNextImageInfoKHR VK_STRUCTURE_TYPE_ACQUIRE_NEXT_IMAGE_INFO_KHR
                                   zero
                                   zero
                                   zero
                                   zero
                                   zero
                                   zero

-- | VkBindImageMemorySwapchainInfoKHR - Structure specifying swapchain image
-- memory to bind to
--
-- = Description
--
-- If @swapchain@ is not @NULL@, the @swapchain@ and @imageIndex@ are used
-- to determine the memory that the image is bound to, instead of @memory@
-- and @memoryOffset@.
--
-- Memory /can/ be bound to a swapchain and use the @pDeviceIndices@ or
-- @pSplitInstanceBindRegions@ members of
-- 'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_device_group_and_VK_KHR_bind_memory2.VkBindImageMemoryDeviceGroupInfo'.
--
-- == Valid Usage
--
-- -   @imageIndex@ /must/ be less than the number of images in @swapchain@
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_SWAPCHAIN_INFO_KHR'
--
-- -   @swapchain@ /must/ be a valid 'VkSwapchainKHR' handle
--
-- == Host Synchronization
--
-- -   Host access to @swapchain@ /must/ be externally synchronized
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType', 'VkSwapchainKHR'
data VkBindImageMemorySwapchainInfoKHR = VkBindImageMemorySwapchainInfoKHR
  { -- | @sType@ is the type of this structure.
  vkSType :: VkStructureType
  , -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
  vkPNext :: Ptr ()
  , -- | @swapchain@ is 'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE' or a
  -- swapchain handle.
  vkSwapchain :: VkSwapchainKHR
  , -- | @imageIndex@ is an image index within @swapchain@.
  vkImageIndex :: Word32
  }
  deriving (Eq, Show)

instance Storable VkBindImageMemorySwapchainInfoKHR where
  sizeOf ~_ = 32
  alignment ~_ = 8
  peek ptr = VkBindImageMemorySwapchainInfoKHR <$> peek (ptr `plusPtr` 0)
                                               <*> peek (ptr `plusPtr` 8)
                                               <*> peek (ptr `plusPtr` 16)
                                               <*> peek (ptr `plusPtr` 24)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkBindImageMemorySwapchainInfoKHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkBindImageMemorySwapchainInfoKHR))
                *> poke (ptr `plusPtr` 16) (vkSwapchain (poked :: VkBindImageMemorySwapchainInfoKHR))
                *> poke (ptr `plusPtr` 24) (vkImageIndex (poked :: VkBindImageMemorySwapchainInfoKHR))

instance Zero VkBindImageMemorySwapchainInfoKHR where
  zero = VkBindImageMemorySwapchainInfoKHR VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_SWAPCHAIN_INFO_KHR
                                           zero
                                           zero
                                           zero

-- | VkDeviceGroupPresentCapabilitiesKHR - Present capabilities from other
-- physical devices
--
-- = Description
--
-- @modes@ always has 'VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_BIT_KHR' set.
--
-- The present mode flags are also used when presenting an image, in
-- 'VkDeviceGroupPresentInfoKHR'::@mode@.
--
-- If a device group only includes a single physical device, then @modes@
-- /must/ equal 'VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_BIT_KHR'.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'VkDeviceGroupPresentModeFlagsKHR',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType',
-- 'vkGetDeviceGroupPresentCapabilitiesKHR'
data VkDeviceGroupPresentCapabilitiesKHR = VkDeviceGroupPresentCapabilitiesKHR
  { -- | @sType@ /must/ be
  -- 'VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_CAPABILITIES_KHR'
  vkSType :: VkStructureType
  , -- | @pNext@ /must/ be @NULL@
  vkPNext :: Ptr ()
  , -- | @presentMask@ is an array of masks, where the mask at element i is
  -- non-zero if physical device i has a presentation engine, and where bit j
  -- is set in element i if physical device i /can/ present swapchain images
  -- from physical device j. If element i is non-zero, then bit i /must/ be
  -- set.
  vkPresentMask :: Vector VK_MAX_DEVICE_GROUP_SIZE Word32
  , -- | @modes@ is a bitmask of 'VkDeviceGroupPresentModeFlagBitsKHR' indicating
  -- which device group presentation modes are supported.
  vkModes :: VkDeviceGroupPresentModeFlagsKHR
  }
  deriving (Eq, Show)

instance Storable VkDeviceGroupPresentCapabilitiesKHR where
  sizeOf ~_ = 152
  alignment ~_ = 8
  peek ptr = VkDeviceGroupPresentCapabilitiesKHR <$> peek (ptr `plusPtr` 0)
                                                 <*> peek (ptr `plusPtr` 8)
                                                 <*> peek (ptr `plusPtr` 16)
                                                 <*> peek (ptr `plusPtr` 144)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkDeviceGroupPresentCapabilitiesKHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkDeviceGroupPresentCapabilitiesKHR))
                *> poke (ptr `plusPtr` 16) (vkPresentMask (poked :: VkDeviceGroupPresentCapabilitiesKHR))
                *> poke (ptr `plusPtr` 144) (vkModes (poked :: VkDeviceGroupPresentCapabilitiesKHR))

instance Zero VkDeviceGroupPresentCapabilitiesKHR where
  zero = VkDeviceGroupPresentCapabilitiesKHR VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_CAPABILITIES_KHR
                                             zero
                                             zero
                                             zero

-- | VkDeviceGroupPresentInfoKHR - Mode and mask controlling which physical
-- devices\' images are presented
--
-- = Description
--
-- If @mode@ is 'VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_BIT_KHR', then each
-- element of @pDeviceMasks@ selects which instance of the swapchain image
-- is presented. Each element of @pDeviceMasks@ /must/ have exactly one bit
-- set, and the corresponding physical device /must/ have a presentation
-- engine as reported by 'VkDeviceGroupPresentCapabilitiesKHR'.
--
-- If @mode@ is 'VK_DEVICE_GROUP_PRESENT_MODE_REMOTE_BIT_KHR', then each
-- element of @pDeviceMasks@ selects which instance of the swapchain image
-- is presented. Each element of @pDeviceMasks@ /must/ have exactly one bit
-- set, and some physical device in the logical device /must/ include that
-- bit in its 'VkDeviceGroupPresentCapabilitiesKHR'::@presentMask@.
--
-- If @mode@ is 'VK_DEVICE_GROUP_PRESENT_MODE_SUM_BIT_KHR', then each
-- element of @pDeviceMasks@ selects which instances of the swapchain image
-- are component-wise summed and the sum of those images is presented. If
-- the sum in any component is outside the representable range, the value
-- of that component is undefined. Each element of @pDeviceMasks@ /must/
-- have a value for which all set bits are set in one of the elements of
-- 'VkDeviceGroupPresentCapabilitiesKHR'::@presentMask@.
--
-- If @mode@ is 'VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_MULTI_DEVICE_BIT_KHR',
-- then each element of @pDeviceMasks@ selects which instance(s) of the
-- swapchain images are presented. For each bit set in each element of
-- @pDeviceMasks@, the corresponding physical device /must/ have a
-- presentation engine as reported by
-- 'VkDeviceGroupPresentCapabilitiesKHR'.
--
-- If 'VkDeviceGroupPresentInfoKHR' is not provided or @swapchainCount@ is
-- zero then the masks are considered to be @1@. If
-- 'VkDeviceGroupPresentInfoKHR' is not provided, @mode@ is considered to
-- be 'VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_BIT_KHR'.
--
-- == Valid Usage
--
-- -   @swapchainCount@ /must/ equal @0@ or
--     'VkPresentInfoKHR'::@swapchainCount@
--
-- -   If @mode@ is 'VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_BIT_KHR', then each
--     element of @pDeviceMasks@ /must/ have exactly one bit set, and the
--     corresponding element of
--     'VkDeviceGroupPresentCapabilitiesKHR'::@presentMask@ /must/ be
--     non-zero
--
-- -   If @mode@ is 'VK_DEVICE_GROUP_PRESENT_MODE_REMOTE_BIT_KHR', then
--     each element of @pDeviceMasks@ /must/ have exactly one bit set, and
--     some physical device in the logical device /must/ include that bit
--     in its 'VkDeviceGroupPresentCapabilitiesKHR'::@presentMask@.
--
-- -   If @mode@ is 'VK_DEVICE_GROUP_PRESENT_MODE_SUM_BIT_KHR', then each
--     element of @pDeviceMasks@ /must/ have a value for which all set bits
--     are set in one of the elements of
--     'VkDeviceGroupPresentCapabilitiesKHR'::@presentMask@
--
-- -   If @mode@ is
--     'VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_MULTI_DEVICE_BIT_KHR', then for
--     each bit set in each element of @pDeviceMasks@, the corresponding
--     element of 'VkDeviceGroupPresentCapabilitiesKHR'::@presentMask@
--     /must/ be non-zero
--
-- -   The value of each element of @pDeviceMasks@ /must/ be equal to the
--     device mask passed in 'VkAcquireNextImageInfoKHR'::@deviceMask@ when
--     the image index was last acquired
--
-- -   @mode@ /must/ have exactly one bit set, and that bit /must/ have
--     been included in 'VkDeviceGroupSwapchainCreateInfoKHR'::@modes@
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be 'VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_INFO_KHR'
--
-- -   If @swapchainCount@ is not @0@, @pDeviceMasks@ /must/ be a valid
--     pointer to an array of @swapchainCount@ @uint32_t@ values
--
-- -   @mode@ /must/ be a valid 'VkDeviceGroupPresentModeFlagBitsKHR' value
--
-- = See Also
--
-- 'VkDeviceGroupPresentModeFlagBitsKHR',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType'
data VkDeviceGroupPresentInfoKHR = VkDeviceGroupPresentInfoKHR
  { -- | @sType@ is the type of this structure.
  vkSType :: VkStructureType
  , -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
  vkPNext :: Ptr ()
  , -- | @swapchainCount@ is zero or the number of elements in @pDeviceMasks@.
  vkSwapchainCount :: Word32
  , -- | @pDeviceMasks@ is an array of device masks, one for each element of
  -- 'VkPresentInfoKHR'::pSwapchains.
  vkPDeviceMasks :: Ptr Word32
  , -- | @mode@ is the device group present mode that will be used for this
  -- present.
  vkMode :: VkDeviceGroupPresentModeFlagBitsKHR
  }
  deriving (Eq, Show)

instance Storable VkDeviceGroupPresentInfoKHR where
  sizeOf ~_ = 40
  alignment ~_ = 8
  peek ptr = VkDeviceGroupPresentInfoKHR <$> peek (ptr `plusPtr` 0)
                                         <*> peek (ptr `plusPtr` 8)
                                         <*> peek (ptr `plusPtr` 16)
                                         <*> peek (ptr `plusPtr` 24)
                                         <*> peek (ptr `plusPtr` 32)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkDeviceGroupPresentInfoKHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkDeviceGroupPresentInfoKHR))
                *> poke (ptr `plusPtr` 16) (vkSwapchainCount (poked :: VkDeviceGroupPresentInfoKHR))
                *> poke (ptr `plusPtr` 24) (vkPDeviceMasks (poked :: VkDeviceGroupPresentInfoKHR))
                *> poke (ptr `plusPtr` 32) (vkMode (poked :: VkDeviceGroupPresentInfoKHR))

instance Zero VkDeviceGroupPresentInfoKHR where
  zero = VkDeviceGroupPresentInfoKHR VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_INFO_KHR
                                     zero
                                     zero
                                     zero
                                     zero

-- ** VkDeviceGroupPresentModeFlagBitsKHR

-- | VkDeviceGroupPresentModeFlagBitsKHR - Bitmask specifying supported
-- device group present modes
--
-- = See Also
--
-- 'VkDeviceGroupPresentInfoKHR', 'VkDeviceGroupPresentModeFlagsKHR'
newtype VkDeviceGroupPresentModeFlagBitsKHR = VkDeviceGroupPresentModeFlagBitsKHR VkFlags
  deriving (Eq, Ord, Storable, Bits, FiniteBits, Zero)

instance Show VkDeviceGroupPresentModeFlagBitsKHR where
  showsPrec _ VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_BIT_KHR = showString "VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_BIT_KHR"
  showsPrec _ VK_DEVICE_GROUP_PRESENT_MODE_REMOTE_BIT_KHR = showString "VK_DEVICE_GROUP_PRESENT_MODE_REMOTE_BIT_KHR"
  showsPrec _ VK_DEVICE_GROUP_PRESENT_MODE_SUM_BIT_KHR = showString "VK_DEVICE_GROUP_PRESENT_MODE_SUM_BIT_KHR"
  showsPrec _ VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_MULTI_DEVICE_BIT_KHR = showString "VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_MULTI_DEVICE_BIT_KHR"
  showsPrec p (VkDeviceGroupPresentModeFlagBitsKHR x) = showParen (p >= 11) (showString "VkDeviceGroupPresentModeFlagBitsKHR " . showsPrec 11 x)

instance Read VkDeviceGroupPresentModeFlagBitsKHR where
  readPrec = parens ( choose [ ("VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_BIT_KHR",              pure VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_BIT_KHR)
                             , ("VK_DEVICE_GROUP_PRESENT_MODE_REMOTE_BIT_KHR",             pure VK_DEVICE_GROUP_PRESENT_MODE_REMOTE_BIT_KHR)
                             , ("VK_DEVICE_GROUP_PRESENT_MODE_SUM_BIT_KHR",                pure VK_DEVICE_GROUP_PRESENT_MODE_SUM_BIT_KHR)
                             , ("VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_MULTI_DEVICE_BIT_KHR", pure VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_MULTI_DEVICE_BIT_KHR)
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkDeviceGroupPresentModeFlagBitsKHR")
                        v <- step readPrec
                        pure (VkDeviceGroupPresentModeFlagBitsKHR v)
                        )
                    )

-- | 'VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_BIT_KHR' specifies that any physical
-- device with a presentation engine /can/ present its own swapchain
-- images.
pattern VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_BIT_KHR :: VkDeviceGroupPresentModeFlagBitsKHR
pattern VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_BIT_KHR = VkDeviceGroupPresentModeFlagBitsKHR 0x00000001

-- | 'VK_DEVICE_GROUP_PRESENT_MODE_REMOTE_BIT_KHR' specifies that any
-- physical device with a presentation engine /can/ present swapchain
-- images from any physical device in its @presentMask@.
pattern VK_DEVICE_GROUP_PRESENT_MODE_REMOTE_BIT_KHR :: VkDeviceGroupPresentModeFlagBitsKHR
pattern VK_DEVICE_GROUP_PRESENT_MODE_REMOTE_BIT_KHR = VkDeviceGroupPresentModeFlagBitsKHR 0x00000002

-- | 'VK_DEVICE_GROUP_PRESENT_MODE_SUM_BIT_KHR' specifies that any physical
-- device with a presentation engine /can/ present the sum of swapchain
-- images from any physical devices in its @presentMask@.
pattern VK_DEVICE_GROUP_PRESENT_MODE_SUM_BIT_KHR :: VkDeviceGroupPresentModeFlagBitsKHR
pattern VK_DEVICE_GROUP_PRESENT_MODE_SUM_BIT_KHR = VkDeviceGroupPresentModeFlagBitsKHR 0x00000004

-- | 'VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_MULTI_DEVICE_BIT_KHR' specifies that
-- multiple physical devices with a presentation engine /can/ each present
-- their own swapchain images.
pattern VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_MULTI_DEVICE_BIT_KHR :: VkDeviceGroupPresentModeFlagBitsKHR
pattern VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_MULTI_DEVICE_BIT_KHR = VkDeviceGroupPresentModeFlagBitsKHR 0x00000008

-- | VkDeviceGroupPresentModeFlagsKHR - Bitmask of
-- VkDeviceGroupPresentModeFlagBitsKHR
--
-- = Description
--
-- 'VkDeviceGroupPresentModeFlagsKHR' is a bitmask type for setting a mask
-- of zero or more 'VkDeviceGroupPresentModeFlagBitsKHR'.
--
-- = See Also
--
-- 'VkDeviceGroupPresentCapabilitiesKHR',
-- 'VkDeviceGroupPresentModeFlagBitsKHR',
-- 'VkDeviceGroupSwapchainCreateInfoKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_device_group.vkGetDeviceGroupSurfacePresentModes2EXT',
-- 'vkGetDeviceGroupSurfacePresentModesKHR'
type VkDeviceGroupPresentModeFlagsKHR = VkDeviceGroupPresentModeFlagBitsKHR

-- | VkDeviceGroupSwapchainCreateInfoKHR - Structure specifying parameters of
-- a newly created swapchain object
--
-- = Description
--
-- If this structure is not present, @modes@ is considered to be
-- 'VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_BIT_KHR'.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'VkDeviceGroupPresentModeFlagsKHR',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType'
data VkDeviceGroupSwapchainCreateInfoKHR = VkDeviceGroupSwapchainCreateInfoKHR
  { -- | @sType@ /must/ be
  -- 'VK_STRUCTURE_TYPE_DEVICE_GROUP_SWAPCHAIN_CREATE_INFO_KHR'
  vkSType :: VkStructureType
  , -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
  vkPNext :: Ptr ()
  , -- | @modes@ /must/ not be @0@
  vkModes :: VkDeviceGroupPresentModeFlagsKHR
  }
  deriving (Eq, Show)

instance Storable VkDeviceGroupSwapchainCreateInfoKHR where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkDeviceGroupSwapchainCreateInfoKHR <$> peek (ptr `plusPtr` 0)
                                                 <*> peek (ptr `plusPtr` 8)
                                                 <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkDeviceGroupSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkDeviceGroupSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 16) (vkModes (poked :: VkDeviceGroupSwapchainCreateInfoKHR))

instance Zero VkDeviceGroupSwapchainCreateInfoKHR where
  zero = VkDeviceGroupSwapchainCreateInfoKHR VK_STRUCTURE_TYPE_DEVICE_GROUP_SWAPCHAIN_CREATE_INFO_KHR
                                             zero
                                             zero

-- | VkImageSwapchainCreateInfoKHR - Specify that an image will be bound to
-- swapchain memory
--
-- == Valid Usage
--
-- -   If @swapchain@ is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE', the fields of
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' /must/ match the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#swapchain-wsi-image-create-info implied image creation parameters>
--     of the swapchain
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'VK_STRUCTURE_TYPE_IMAGE_SWAPCHAIN_CREATE_INFO_KHR'
--
-- -   If @swapchain@ is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE', @swapchain@
--     /must/ be a valid 'VkSwapchainKHR' handle
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType', 'VkSwapchainKHR'
data VkImageSwapchainCreateInfoKHR = VkImageSwapchainCreateInfoKHR
  { -- | @sType@ is the type of this structure.
  vkSType :: VkStructureType
  , -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
  vkPNext :: Ptr ()
  , -- | @swapchain@ is 'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE' or a
  -- handle of a swapchain that the image will be bound to.
  vkSwapchain :: VkSwapchainKHR
  }
  deriving (Eq, Show)

instance Storable VkImageSwapchainCreateInfoKHR where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkImageSwapchainCreateInfoKHR <$> peek (ptr `plusPtr` 0)
                                           <*> peek (ptr `plusPtr` 8)
                                           <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkImageSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkImageSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 16) (vkSwapchain (poked :: VkImageSwapchainCreateInfoKHR))

instance Zero VkImageSwapchainCreateInfoKHR where
  zero = VkImageSwapchainCreateInfoKHR VK_STRUCTURE_TYPE_IMAGE_SWAPCHAIN_CREATE_INFO_KHR
                                       zero
                                       zero

-- | VkPresentInfoKHR - Structure describing parameters of a queue
-- presentation
--
-- = Description
--
-- Before an application /can/ present an image, the image’s layout /must/
-- be transitioned to the 'VK_IMAGE_LAYOUT_PRESENT_SRC_KHR' layout.
--
-- __Note__
--
-- When transitioning the image to 'VK_IMAGE_LAYOUT_PRESENT_SRC_KHR', there
-- is no need to delay subsequent processing, or perform any visibility
-- operations (as 'vkQueuePresentKHR' performs automatic visibility
-- operations). To achieve this, the @dstAccessMask@ member of the
-- 'Graphics.Vulkan.C.Core10.CommandBufferBuilding.VkImageMemoryBarrier'
-- /should/ be set to @0@, and the @dstStageMask@ parameter /should/ be set
-- to
-- 'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT'.
--
-- == Valid Usage
--
-- -   Each element of @pImageIndices@ /must/ be the index of a presentable
--     image acquired from the swapchain specified by the corresponding
--     element of the @pSwapchains@ array, and the presented image
--     subresource /must/ be in the 'VK_IMAGE_LAYOUT_PRESENT_SRC_KHR'
--     layout at the time the operation is executed on a
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be 'VK_STRUCTURE_TYPE_PRESENT_INFO_KHR'
--
-- -   Each @pNext@ member of any structure (including this one) in the
--     @pNext@ chain /must/ be either @NULL@ or a pointer to a valid
--     instance of 'VkDeviceGroupPresentInfoKHR',
--     'Graphics.Vulkan.C.Extensions.VK_KHR_display_swapchain.VkDisplayPresentInfoKHR',
--     'Graphics.Vulkan.C.Extensions.VK_GGP_frame_token.VkPresentFrameTokenGGP',
--     'Graphics.Vulkan.C.Extensions.VK_KHR_incremental_present.VkPresentRegionsKHR',
--     or
--     'Graphics.Vulkan.C.Extensions.VK_GOOGLE_display_timing.VkPresentTimesInfoGOOGLE'
--
-- -   Each @sType@ member in the @pNext@ chain /must/ be unique
--
-- -   If @waitSemaphoreCount@ is not @0@, @pWaitSemaphores@ /must/ be a
--     valid pointer to an array of @waitSemaphoreCount@ valid
--     'Graphics.Vulkan.C.Core10.Queue.VkSemaphore' handles
--
-- -   @pSwapchains@ /must/ be a valid pointer to an array of
--     @swapchainCount@ valid 'VkSwapchainKHR' handles
--
-- -   @pImageIndices@ /must/ be a valid pointer to an array of
--     @swapchainCount@ @uint32_t@ values
--
-- -   If @pResults@ is not @NULL@, @pResults@ /must/ be a valid pointer to
--     an array of @swapchainCount@
--     'Graphics.Vulkan.C.Core10.Core.VkResult' values
--
-- -   @swapchainCount@ /must/ be greater than @0@
--
-- -   Both of the elements of @pSwapchains@, and the elements of
--     @pWaitSemaphores@ that are valid handles /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance'
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Core.VkResult',
-- 'Graphics.Vulkan.C.Core10.Queue.VkSemaphore',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType', 'VkSwapchainKHR',
-- 'vkQueuePresentKHR'
data VkPresentInfoKHR = VkPresentInfoKHR
  { -- | @sType@ is the type of this structure.
  vkSType :: VkStructureType
  , -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
  vkPNext :: Ptr ()
  , -- | @waitSemaphoreCount@ is the number of semaphores to wait for before
  -- issuing the present request. The number /may/ be zero.
  vkWaitSemaphoreCount :: Word32
  , -- | @pWaitSemaphores@, if not @NULL@, is an array of
  -- 'Graphics.Vulkan.C.Core10.Queue.VkSemaphore' objects with
  -- @waitSemaphoreCount@ entries, and specifies the semaphores to wait for
  -- before issuing the present request.
  vkPWaitSemaphores :: Ptr VkSemaphore
  , -- | @swapchainCount@ is the number of swapchains being presented to by this
  -- command.
  vkSwapchainCount :: Word32
  , -- | @pSwapchains@ is an array of 'VkSwapchainKHR' objects with
  -- @swapchainCount@ entries. A given swapchain /must/ not appear in this
  -- list more than once.
  vkPSwapchains :: Ptr VkSwapchainKHR
  , -- | @pImageIndices@ is an array of indices into the array of each
  -- swapchain’s presentable images, with @swapchainCount@ entries. Each
  -- entry in this array identifies the image to present on the corresponding
  -- entry in the @pSwapchains@ array.
  vkPImageIndices :: Ptr Word32
  , -- | @pResults@ is an array of 'Graphics.Vulkan.C.Core10.Core.VkResult' typed
  -- elements with @swapchainCount@ entries. Applications that do not need
  -- per-swapchain results /can/ use @NULL@ for @pResults@. If non-@NULL@,
  -- each entry in @pResults@ will be set to the
  -- 'Graphics.Vulkan.C.Core10.Core.VkResult' for presenting the swapchain
  -- corresponding to the same index in @pSwapchains@.
  vkPResults :: Ptr VkResult
  }
  deriving (Eq, Show)

instance Storable VkPresentInfoKHR where
  sizeOf ~_ = 64
  alignment ~_ = 8
  peek ptr = VkPresentInfoKHR <$> peek (ptr `plusPtr` 0)
                              <*> peek (ptr `plusPtr` 8)
                              <*> peek (ptr `plusPtr` 16)
                              <*> peek (ptr `plusPtr` 24)
                              <*> peek (ptr `plusPtr` 32)
                              <*> peek (ptr `plusPtr` 40)
                              <*> peek (ptr `plusPtr` 48)
                              <*> peek (ptr `plusPtr` 56)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkPresentInfoKHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkPresentInfoKHR))
                *> poke (ptr `plusPtr` 16) (vkWaitSemaphoreCount (poked :: VkPresentInfoKHR))
                *> poke (ptr `plusPtr` 24) (vkPWaitSemaphores (poked :: VkPresentInfoKHR))
                *> poke (ptr `plusPtr` 32) (vkSwapchainCount (poked :: VkPresentInfoKHR))
                *> poke (ptr `plusPtr` 40) (vkPSwapchains (poked :: VkPresentInfoKHR))
                *> poke (ptr `plusPtr` 48) (vkPImageIndices (poked :: VkPresentInfoKHR))
                *> poke (ptr `plusPtr` 56) (vkPResults (poked :: VkPresentInfoKHR))

instance Zero VkPresentInfoKHR where
  zero = VkPresentInfoKHR VK_STRUCTURE_TYPE_PRESENT_INFO_KHR
                          zero
                          zero
                          zero
                          zero
                          zero
                          zero
                          zero

-- ** VkSwapchainCreateFlagBitsKHR

-- | VkSwapchainCreateFlagBitsKHR - Bitmask controlling swapchain creation
--
-- = See Also
--
-- 'VkSwapchainCreateFlagsKHR'
newtype VkSwapchainCreateFlagBitsKHR = VkSwapchainCreateFlagBitsKHR VkFlags
  deriving (Eq, Ord, Storable, Bits, FiniteBits, Zero)

instance Show VkSwapchainCreateFlagBitsKHR where
  -- The following values are from extensions, the patterns themselves are exported from the extension modules
  showsPrec _ (VkSwapchainCreateFlagBitsKHR 0x00000001) = showString "VK_SWAPCHAIN_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT_KHR"
  showsPrec _ (VkSwapchainCreateFlagBitsKHR 0x00000002) = showString "VK_SWAPCHAIN_CREATE_PROTECTED_BIT_KHR"
  showsPrec _ (VkSwapchainCreateFlagBitsKHR 0x00000004) = showString "VK_SWAPCHAIN_CREATE_MUTABLE_FORMAT_BIT_KHR"
  showsPrec p (VkSwapchainCreateFlagBitsKHR x) = showParen (p >= 11) (showString "VkSwapchainCreateFlagBitsKHR " . showsPrec 11 x)

instance Read VkSwapchainCreateFlagBitsKHR where
  readPrec = parens ( choose [ -- The following values are from extensions, the patterns themselves are exported from the extension modules
                               ("VK_SWAPCHAIN_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT_KHR", pure (VkSwapchainCreateFlagBitsKHR 0x00000001))
                             , ("VK_SWAPCHAIN_CREATE_PROTECTED_BIT_KHR",                   pure (VkSwapchainCreateFlagBitsKHR 0x00000002))
                             , ("VK_SWAPCHAIN_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT_KHR", pure (VkSwapchainCreateFlagBitsKHR 0x00000001))
                             , ("VK_SWAPCHAIN_CREATE_MUTABLE_FORMAT_BIT_KHR",              pure (VkSwapchainCreateFlagBitsKHR 0x00000004))
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkSwapchainCreateFlagBitsKHR")
                        v <- step readPrec
                        pure (VkSwapchainCreateFlagBitsKHR v)
                        )
                    )



-- | VkSwapchainCreateFlagsKHR - Bitmask of VkSwapchainCreateFlagBitsKHR
--
-- = Description
--
-- 'VkSwapchainCreateFlagsKHR' is a bitmask type for setting a mask of zero
-- or more 'VkSwapchainCreateFlagBitsKHR'.
--
-- = See Also
--
-- 'VkSwapchainCreateFlagBitsKHR', 'VkSwapchainCreateInfoKHR'
type VkSwapchainCreateFlagsKHR = VkSwapchainCreateFlagBitsKHR

-- | VkSwapchainCreateInfoKHR - Structure specifying parameters of a newly
-- created swapchain object
--
-- = Description
--
-- __Note__
--
-- On some platforms, it is normal that @maxImageExtent@ /may/ become @(0,
-- 0)@, for example when the window is minimized. In such a case, it is not
-- possible to create a swapchain due to the Valid Usage requirements.
--
-- -   @imageArrayLayers@ is the number of views in a multiview\/stereo
--     surface. For non-stereoscopic-3D applications, this value is 1.
--
-- -   @imageUsage@ is a bitmask of
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkImageUsageFlagBits'
--     describing the intended usage of the (acquired) swapchain images.
--
-- -   @imageSharingMode@ is the sharing mode used for the image(s) of the
--     swapchain.
--
-- -   @queueFamilyIndexCount@ is the number of queue families having
--     access to the image(s) of the swapchain when @imageSharingMode@ is
--     'Graphics.Vulkan.C.Core10.Buffer.VK_SHARING_MODE_CONCURRENT'.
--
-- -   @pQueueFamilyIndices@ is an array of queue family indices having
--     access to the images(s) of the swapchain when @imageSharingMode@ is
--     'Graphics.Vulkan.C.Core10.Buffer.VK_SHARING_MODE_CONCURRENT'.
--
-- -   @preTransform@ is a
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceTransformFlagBitsKHR'
--     value describing the transform, relative to the presentation
--     engine’s natural orientation, applied to the image content prior to
--     presentation. If it does not match the @currentTransform@ value
--     returned by
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.vkGetPhysicalDeviceSurfaceCapabilitiesKHR',
--     the presentation engine will transform the image content as part of
--     the presentation operation.
--
-- -   @compositeAlpha@ is a
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkCompositeAlphaFlagBitsKHR'
--     value indicating the alpha compositing mode to use when this surface
--     is composited together with other surfaces on certain window
--     systems.
--
-- -   @presentMode@ is the presentation mode the swapchain will use. A
--     swapchain’s present mode determines how incoming present requests
--     will be processed and queued internally.
--
-- -   @clipped@ specifies whether the Vulkan implementation is allowed to
--     discard rendering operations that affect regions of the surface that
--     are not visible.
--
--     -   If set to 'Graphics.Vulkan.C.Core10.Core.VK_TRUE', the
--         presentable images associated with the swapchain /may/ not own
--         all of their pixels. Pixels in the presentable images that
--         correspond to regions of the target surface obscured by another
--         window on the desktop, or subject to some other clipping
--         mechanism will have undefined content when read back. Pixel
--         shaders /may/ not execute for these pixels, and thus any side
--         effects they would have had will not occur.
--         'Graphics.Vulkan.C.Core10.Core.VK_TRUE' value does not guarantee
--         any clipping will occur, but allows more optimal presentation
--         methods to be used on some platforms.
--
--     -   If set to 'Graphics.Vulkan.C.Core10.Core.VK_FALSE', presentable
--         images associated with the swapchain will own all of the pixels
--         they contain.
--
-- __Note__
--
-- Applications /should/ set this value to
-- 'Graphics.Vulkan.C.Core10.Core.VK_TRUE' if they do not expect to read
-- back the content of presentable images before presenting them or after
-- reacquiring them, and if their pixel shaders do not have any side
-- effects that require them to run for all pixels in the presentable
-- image.
--
-- -   @oldSwapchain@ is
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE', or the existing
--     non-retired swapchain currently associated with @surface@. Providing
--     a valid @oldSwapchain@ /may/ aid in the resource reuse, and also
--     allows the application to still present any images that are already
--     acquired from it.
--
-- Upon calling 'vkCreateSwapchainKHR' with an @oldSwapchain@ that is not
-- 'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE', @oldSwapchain@ is
-- retired — even if creation of the new swapchain fails. The new swapchain
-- is created in the non-retired state whether or not @oldSwapchain@ is
-- 'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE'.
--
-- Upon calling 'vkCreateSwapchainKHR' with an @oldSwapchain@ that is not
-- 'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE', any images from
-- @oldSwapchain@ that are not acquired by the application /may/ be freed
-- by the implementation, which /may/ occur even if creation of the new
-- swapchain fails. The application /can/ destroy @oldSwapchain@ to free
-- all memory associated with @oldSwapchain@.
--
-- __Note__
--
-- Multiple retired swapchains /can/ be associated with the same
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceKHR' through
-- multiple uses of @oldSwapchain@ that outnumber calls to
-- 'vkDestroySwapchainKHR'.
--
-- After @oldSwapchain@ is retired, the application /can/ pass to
-- 'vkQueuePresentKHR' any images it had already acquired from
-- @oldSwapchain@. E.g., an application may present an image from the old
-- swapchain before an image from the new swapchain is ready to be
-- presented. As usual, 'vkQueuePresentKHR' /may/ fail if @oldSwapchain@
-- has entered a state that causes 'VK_ERROR_OUT_OF_DATE_KHR' to be
-- returned.
--
-- == Valid Usage
--
-- -   @surface@ /must/ be a surface that is supported by the device as
--     determined using
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.vkGetPhysicalDeviceSurfaceSupportKHR'
--
-- -   @minImageCount@ /must/ be greater than or equal to the value
--     returned in the @minImageCount@ member of the
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceCapabilitiesKHR'
--     structure returned by
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.vkGetPhysicalDeviceSurfaceCapabilitiesKHR'
--     for the surface
--
-- -   @minImageCount@ /must/ be less than or equal to the value returned
--     in the @maxImageCount@ member of the
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceCapabilitiesKHR'
--     structure returned by
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.vkGetPhysicalDeviceSurfaceCapabilitiesKHR'
--     for the surface if the returned @maxImageCount@ is not zero
--
-- -   @imageFormat@ and @imageColorSpace@ /must/ match the @format@ and
--     @colorSpace@ members, respectively, of one of the
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceFormatKHR'
--     structures returned by
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.vkGetPhysicalDeviceSurfaceFormatsKHR'
--     for the surface
--
-- -   @imageExtent@ /must/ be between @minImageExtent@ and
--     @maxImageExtent@, inclusive, where @minImageExtent@ and
--     @maxImageExtent@ are members of the
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceCapabilitiesKHR'
--     structure returned by
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.vkGetPhysicalDeviceSurfaceCapabilitiesKHR'
--     for the surface
--
-- -   @imageExtent@ members @width@ and @height@ /must/ both be non-zero
--
-- -   @imageArrayLayers@ /must/ be greater than @0@ and less than or equal
--     to the @maxImageArrayLayers@ member of the
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceCapabilitiesKHR'
--     structure returned by
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.vkGetPhysicalDeviceSurfaceCapabilitiesKHR'
--     for the surface
--
-- -   @imageUsage@ /must/ be a subset of the supported usage flags present
--     in the @supportedUsageFlags@ member of the
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceCapabilitiesKHR'
--     structure returned by
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.vkGetPhysicalDeviceSurfaceCapabilitiesKHR'
--     for the surface
--
-- -   If @imageSharingMode@ is
--     'Graphics.Vulkan.C.Core10.Buffer.VK_SHARING_MODE_CONCURRENT',
--     @pQueueFamilyIndices@ /must/ be a valid pointer to an array of
--     @queueFamilyIndexCount@ @uint32_t@ values
--
-- -   If @imageSharingMode@ is
--     'Graphics.Vulkan.C.Core10.Buffer.VK_SHARING_MODE_CONCURRENT',
--     @queueFamilyIndexCount@ /must/ be greater than @1@
--
-- -   If @imageSharingMode@ is
--     'Graphics.Vulkan.C.Core10.Buffer.VK_SHARING_MODE_CONCURRENT', each
--     element of @pQueueFamilyIndices@ /must/ be unique and /must/ be less
--     than @pQueueFamilyPropertyCount@ returned by
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.vkGetPhysicalDeviceQueueFamilyProperties'
--     for the @physicalDevice@ that was used to create @device@
--
-- -   @preTransform@ /must/ be one of the bits present in the
--     @supportedTransforms@ member of the
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceCapabilitiesKHR'
--     structure returned by
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.vkGetPhysicalDeviceSurfaceCapabilitiesKHR'
--     for the surface
--
-- -   @compositeAlpha@ /must/ be one of the bits present in the
--     @supportedCompositeAlpha@ member of the
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceCapabilitiesKHR'
--     structure returned by
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.vkGetPhysicalDeviceSurfaceCapabilitiesKHR'
--     for the surface
--
-- -   @presentMode@ /must/ be one of the
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkPresentModeKHR'
--     values returned by
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.vkGetPhysicalDeviceSurfacePresentModesKHR'
--     for the surface
--
-- -   If @oldSwapchain@ is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE', @oldSwapchain@
--     /must/ be a non-retired swapchain associated with native window
--     referred to by @surface@
--
-- -   The
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#swapchain-wsi-image-create-info implied image creation parameters>
--     of the swapchain /must/ be supported as reported by
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.vkGetPhysicalDeviceImageFormatProperties'
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be 'VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR'
--
-- -   Each @pNext@ member of any structure (including this one) in the
--     @pNext@ chain /must/ be either @NULL@ or a pointer to a valid
--     instance of 'VkDeviceGroupSwapchainCreateInfoKHR',
--     'Graphics.Vulkan.C.Extensions.VK_KHR_image_format_list.VkImageFormatListCreateInfoKHR',
--     'Graphics.Vulkan.C.Extensions.VK_EXT_full_screen_exclusive.VkSurfaceFullScreenExclusiveInfoEXT',
--     'Graphics.Vulkan.C.Extensions.VK_EXT_full_screen_exclusive.VkSurfaceFullScreenExclusiveWin32InfoEXT',
--     'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VkSwapchainCounterCreateInfoEXT',
--     or
--     'Graphics.Vulkan.C.Extensions.VK_AMD_display_native_hdr.VkSwapchainDisplayNativeHdrCreateInfoAMD'
--
-- -   Each @sType@ member in the @pNext@ chain /must/ be unique
--
-- -   @flags@ /must/ be a valid combination of
--     'VkSwapchainCreateFlagBitsKHR' values
--
-- -   @surface@ /must/ be a valid
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceKHR' handle
--
-- -   @imageFormat@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Core.VkFormat' value
--
-- -   @imageColorSpace@ /must/ be a valid
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkColorSpaceKHR' value
--
-- -   @imageUsage@ /must/ be a valid combination of
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkImageUsageFlagBits'
--     values
--
-- -   @imageUsage@ /must/ not be @0@
--
-- -   @imageSharingMode@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Buffer.VkSharingMode' value
--
-- -   @preTransform@ /must/ be a valid
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceTransformFlagBitsKHR'
--     value
--
-- -   @compositeAlpha@ /must/ be a valid
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkCompositeAlphaFlagBitsKHR'
--     value
--
-- -   @presentMode@ /must/ be a valid
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkPresentModeKHR' value
--
-- -   If @oldSwapchain@ is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE', @oldSwapchain@
--     /must/ be a valid 'VkSwapchainKHR' handle
--
-- -   If @oldSwapchain@ is a valid handle, it /must/ have been created,
--     allocated, or retrieved from @surface@
--
-- -   Both of @oldSwapchain@, and @surface@ that are valid handles /must/
--     have been created, allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance'
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Core.VkBool32',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkColorSpaceKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkCompositeAlphaFlagBitsKHR',
-- 'Graphics.Vulkan.C.Core10.Pipeline.VkExtent2D',
-- 'Graphics.Vulkan.C.Core10.Core.VkFormat',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkImageUsageFlags',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkPresentModeKHR',
-- 'Graphics.Vulkan.C.Core10.Buffer.VkSharingMode',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceTransformFlagBitsKHR',
-- 'VkSwapchainCreateFlagsKHR', 'VkSwapchainKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_display_swapchain.vkCreateSharedSwapchainsKHR',
-- 'vkCreateSwapchainKHR'
data VkSwapchainCreateInfoKHR = VkSwapchainCreateInfoKHR
  { -- | @sType@ is the type of this structure.
  vkSType :: VkStructureType
  , -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
  vkPNext :: Ptr ()
  , -- | @flags@ is a bitmask of 'VkSwapchainCreateFlagBitsKHR' indicating
  -- parameters of the swapchain creation.
  vkFlags :: VkSwapchainCreateFlagsKHR
  , -- | @surface@ is the surface onto which the swapchain will present images.
  -- If the creation succeeds, the swapchain becomes associated with
  -- @surface@.
  vkSurface :: VkSurfaceKHR
  , -- | @minImageCount@ is the minimum number of presentable images that the
  -- application needs. The implementation will either create the swapchain
  -- with at least that many images, or it will fail to create the swapchain.
  vkMinImageCount :: Word32
  , -- | @imageFormat@ is a 'Graphics.Vulkan.C.Core10.Core.VkFormat' value
  -- specifying the format the swapchain image(s) will be created with.
  vkImageFormat :: VkFormat
  , -- | @imageColorSpace@ is a
  -- 'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkColorSpaceKHR' value
  -- specifying the way the swapchain interprets image data.
  vkImageColorSpace :: VkColorSpaceKHR
  , -- | @imageExtent@ is the size (in pixels) of the swapchain image(s). The
  -- behavior is platform-dependent if the image extent does not match the
  -- surface’s @currentExtent@ as returned by
  -- 'Graphics.Vulkan.C.Extensions.VK_KHR_surface.vkGetPhysicalDeviceSurfaceCapabilitiesKHR'.
  vkImageExtent :: VkExtent2D
  , -- No documentation found for Nested "VkSwapchainCreateInfoKHR" "imageArrayLayers"
  vkImageArrayLayers :: Word32
  , -- No documentation found for Nested "VkSwapchainCreateInfoKHR" "imageUsage"
  vkImageUsage :: VkImageUsageFlags
  , -- No documentation found for Nested "VkSwapchainCreateInfoKHR" "imageSharingMode"
  vkImageSharingMode :: VkSharingMode
  , -- No documentation found for Nested "VkSwapchainCreateInfoKHR" "queueFamilyIndexCount"
  vkQueueFamilyIndexCount :: Word32
  , -- No documentation found for Nested "VkSwapchainCreateInfoKHR" "pQueueFamilyIndices"
  vkPQueueFamilyIndices :: Ptr Word32
  , -- No documentation found for Nested "VkSwapchainCreateInfoKHR" "preTransform"
  vkPreTransform :: VkSurfaceTransformFlagBitsKHR
  , -- No documentation found for Nested "VkSwapchainCreateInfoKHR" "compositeAlpha"
  vkCompositeAlpha :: VkCompositeAlphaFlagBitsKHR
  , -- No documentation found for Nested "VkSwapchainCreateInfoKHR" "presentMode"
  vkPresentMode :: VkPresentModeKHR
  , -- No documentation found for Nested "VkSwapchainCreateInfoKHR" "clipped"
  vkClipped :: VkBool32
  , -- No documentation found for Nested "VkSwapchainCreateInfoKHR" "oldSwapchain"
  vkOldSwapchain :: VkSwapchainKHR
  }
  deriving (Eq, Show)

instance Storable VkSwapchainCreateInfoKHR where
  sizeOf ~_ = 104
  alignment ~_ = 8
  peek ptr = VkSwapchainCreateInfoKHR <$> peek (ptr `plusPtr` 0)
                                      <*> peek (ptr `plusPtr` 8)
                                      <*> peek (ptr `plusPtr` 16)
                                      <*> peek (ptr `plusPtr` 24)
                                      <*> peek (ptr `plusPtr` 32)
                                      <*> peek (ptr `plusPtr` 36)
                                      <*> peek (ptr `plusPtr` 40)
                                      <*> peek (ptr `plusPtr` 44)
                                      <*> peek (ptr `plusPtr` 52)
                                      <*> peek (ptr `plusPtr` 56)
                                      <*> peek (ptr `plusPtr` 60)
                                      <*> peek (ptr `plusPtr` 64)
                                      <*> peek (ptr `plusPtr` 72)
                                      <*> peek (ptr `plusPtr` 80)
                                      <*> peek (ptr `plusPtr` 84)
                                      <*> peek (ptr `plusPtr` 88)
                                      <*> peek (ptr `plusPtr` 92)
                                      <*> peek (ptr `plusPtr` 96)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 16) (vkFlags (poked :: VkSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 24) (vkSurface (poked :: VkSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 32) (vkMinImageCount (poked :: VkSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 36) (vkImageFormat (poked :: VkSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 40) (vkImageColorSpace (poked :: VkSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 44) (vkImageExtent (poked :: VkSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 52) (vkImageArrayLayers (poked :: VkSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 56) (vkImageUsage (poked :: VkSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 60) (vkImageSharingMode (poked :: VkSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 64) (vkQueueFamilyIndexCount (poked :: VkSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 72) (vkPQueueFamilyIndices (poked :: VkSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 80) (vkPreTransform (poked :: VkSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 84) (vkCompositeAlpha (poked :: VkSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 88) (vkPresentMode (poked :: VkSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 92) (vkClipped (poked :: VkSwapchainCreateInfoKHR))
                *> poke (ptr `plusPtr` 96) (vkOldSwapchain (poked :: VkSwapchainCreateInfoKHR))

instance Zero VkSwapchainCreateInfoKHR where
  zero = VkSwapchainCreateInfoKHR VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR
                                  zero
                                  zero
                                  zero
                                  zero
                                  zero
                                  zero
                                  zero
                                  zero
                                  zero
                                  zero
                                  zero
                                  zero
                                  zero
                                  zero
                                  zero
                                  zero
                                  zero

-- | Dummy data to tag the 'Ptr' with
data VkSwapchainKHR_T
-- | VkSwapchainKHR - Opaque handle to a swapchain object
--
-- = Description
--
-- A swapchain is an abstraction for an array of presentable images that
-- are associated with a surface. The presentable images are represented by
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' objects created by
-- the platform. One image (which /can/ be an array image for
-- multiview\/stereoscopic-3D surfaces) is displayed at a time, but
-- multiple images /can/ be queued for presentation. An application renders
-- to the image, and then queues the image for presentation to the surface.
--
-- A native window /cannot/ be associated with more than one non-retired
-- swapchain at a time. Further, swapchains /cannot/ be created for native
-- windows that have a non-Vulkan graphics API surface associated with
-- them.
--
-- __Note__
--
-- The presentation engine is an abstraction for the platform’s compositor
-- or display engine.
--
-- The presentation engine /may/ be synchronous or asynchronous with
-- respect to the application and\/or logical device.
--
-- Some implementations /may/ use the device’s graphics queue or dedicated
-- presentation hardware to perform presentation.
--
-- The presentable images of a swapchain are owned by the presentation
-- engine. An application /can/ acquire use of a presentable image from the
-- presentation engine. Use of a presentable image /must/ occur only after
-- the image is returned by 'vkAcquireNextImageKHR', and before it is
-- presented by 'vkQueuePresentKHR'. This includes transitioning the image
-- layout and rendering commands.
--
-- An application /can/ acquire use of a presentable image with
-- 'vkAcquireNextImageKHR'. After acquiring a presentable image and before
-- modifying it, the application /must/ use a synchronization primitive to
-- ensure that the presentation engine has finished reading from the image.
-- The application /can/ then transition the image’s layout, queue
-- rendering commands to it, etc. Finally, the application presents the
-- image with 'vkQueuePresentKHR', which releases the acquisition of the
-- image.
--
-- The presentation engine controls the order in which presentable images
-- are acquired for use by the application.
--
-- __Note__
--
-- This allows the platform to handle situations which require out-of-order
-- return of images after presentation. At the same time, it allows the
-- application to generate command buffers referencing all of the images in
-- the swapchain at initialization time, rather than in its main loop.
--
-- = See Also
--
-- 'VkAcquireNextImageInfoKHR', 'VkBindImageMemorySwapchainInfoKHR',
-- 'VkImageSwapchainCreateInfoKHR', 'VkPresentInfoKHR',
-- 'VkSwapchainCreateInfoKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_full_screen_exclusive.vkAcquireFullScreenExclusiveModeEXT',
-- 'vkAcquireNextImageKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_display_swapchain.vkCreateSharedSwapchainsKHR',
-- 'vkCreateSwapchainKHR', 'vkDestroySwapchainKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_GOOGLE_display_timing.vkGetPastPresentationTimingGOOGLE',
-- 'Graphics.Vulkan.C.Extensions.VK_GOOGLE_display_timing.vkGetRefreshCycleDurationGOOGLE',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.vkGetSwapchainCounterEXT',
-- 'vkGetSwapchainImagesKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_shared_presentable_image.vkGetSwapchainStatusKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_full_screen_exclusive.vkReleaseFullScreenExclusiveModeEXT',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_hdr_metadata.vkSetHdrMetadataEXT',
-- 'Graphics.Vulkan.C.Extensions.VK_AMD_display_native_hdr.vkSetLocalDimmingAMD'
type VkSwapchainKHR = Ptr VkSwapchainKHR_T

-- | vkAcquireNextImage2KHR - Retrieve the index of the next available
-- presentable image
--
-- = Parameters
--
-- -   @device@ is the device associated with @swapchain@.
--
-- -   @pAcquireInfo@ is a pointer to a structure of type
--     'VkAcquireNextImageInfoKHR' containing parameters of the acquire.
--
-- -   @pImageIndex@ is a pointer to a @uint32_t@ that is set to the index
--     of the next image to use.
--
-- == Valid Usage
--
-- -   If the number of currently acquired images is greater than the
--     difference between the number of images in the @swapchain@ member of
--     @pAcquireInfo@ and the value of
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceCapabilitiesKHR'::@minImageCount@
--     as returned by a call to
--     'Graphics.Vulkan.C.Extensions.VK_KHR_get_surface_capabilities2.vkGetPhysicalDeviceSurfaceCapabilities2KHR'
--     with the @surface@ used to create @swapchain@, the @timeout@ member
--     of @pAcquireInfo@ /must/ not be @UINT64_MAX@
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' handle
--
-- -   @pAcquireInfo@ /must/ be a valid pointer to a valid
--     'VkAcquireNextImageInfoKHR' structure
--
-- -   @pImageIndex@ /must/ be a valid pointer to a @uint32_t@ value
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_SUCCESS'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_TIMEOUT'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_NOT_READY'
--
--     -   'VK_SUBOPTIMAL_KHR'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_OUT_OF_DEVICE_MEMORY'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_DEVICE_LOST'
--
--     -   'VK_ERROR_OUT_OF_DATE_KHR'
--
--     -   'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VK_ERROR_SURFACE_LOST_KHR'
--
--     -   'Graphics.Vulkan.C.Extensions.VK_EXT_full_screen_exclusive.VK_ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT'
--
-- = See Also
--
-- 'VkAcquireNextImageInfoKHR',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkAcquireNextImage2KHR" vkAcquireNextImage2KHR :: ("device" ::: VkDevice) -> ("pAcquireInfo" ::: Ptr VkAcquireNextImageInfoKHR) -> ("pImageIndex" ::: Ptr Word32) -> IO VkResult
#else
vkAcquireNextImage2KHR :: DeviceCmds -> ("device" ::: VkDevice) -> ("pAcquireInfo" ::: Ptr VkAcquireNextImageInfoKHR) -> ("pImageIndex" ::: Ptr Word32) -> IO VkResult
vkAcquireNextImage2KHR deviceCmds = mkVkAcquireNextImage2KHR (pVkAcquireNextImage2KHR deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkAcquireNextImage2KHR
  :: FunPtr (("device" ::: VkDevice) -> ("pAcquireInfo" ::: Ptr VkAcquireNextImageInfoKHR) -> ("pImageIndex" ::: Ptr Word32) -> IO VkResult) -> (("device" ::: VkDevice) -> ("pAcquireInfo" ::: Ptr VkAcquireNextImageInfoKHR) -> ("pImageIndex" ::: Ptr Word32) -> IO VkResult)
#endif

type FN_vkAcquireNextImage2KHR = ("device" ::: VkDevice) -> ("pAcquireInfo" ::: Ptr VkAcquireNextImageInfoKHR) -> ("pImageIndex" ::: Ptr Word32) -> IO VkResult
type PFN_vkAcquireNextImage2KHR = FunPtr FN_vkAcquireNextImage2KHR

-- | vkAcquireNextImageKHR - Retrieve the index of the next available
-- presentable image
--
-- = Parameters
--
-- -   @device@ is the device associated with @swapchain@.
--
-- -   @swapchain@ is the non-retired swapchain from which an image is
--     being acquired.
--
-- -   @timeout@ specifies how long the function waits, in nanoseconds, if
--     no image is available.
--
-- -   @semaphore@ is 'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE'
--     or a semaphore to signal.
--
-- -   @fence@ is 'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE' or a
--     fence to signal.
--
-- -   @pImageIndex@ is a pointer to a @uint32_t@ that is set to the index
--     of the next image to use (i.e. an index into the array of images
--     returned by 'vkGetSwapchainImagesKHR').
--
-- == Valid Usage
--
-- -   @swapchain@ /must/ not be in the retired state
--
-- -   If @semaphore@ is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE' it /must/ be
--     unsignaled
--
-- -   If @semaphore@ is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE' it /must/ not
--     have any uncompleted signal or wait operations pending
--
-- -   If @fence@ is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE' it /must/ be
--     unsignaled and /must/ not be associated with any other queue command
--     that has not yet completed execution on that queue
--
-- -   @semaphore@ and @fence@ /must/ not both be equal to
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE'
--
-- -   If the number of currently acquired images is greater than the
--     difference between the number of images in @swapchain@ and the value
--     of
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceCapabilitiesKHR'::@minImageCount@
--     as returned by a call to
--     'Graphics.Vulkan.C.Extensions.VK_KHR_get_surface_capabilities2.vkGetPhysicalDeviceSurfaceCapabilities2KHR'
--     with the @surface@ used to create @swapchain@, @timeout@ /must/ not
--     be @UINT64_MAX@
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' handle
--
-- -   @swapchain@ /must/ be a valid 'VkSwapchainKHR' handle
--
-- -   If @semaphore@ is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE', @semaphore@
--     /must/ be a valid 'Graphics.Vulkan.C.Core10.Queue.VkSemaphore'
--     handle
--
-- -   If @fence@ is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE', @fence@ /must/
--     be a valid 'Graphics.Vulkan.C.Core10.Queue.VkFence' handle
--
-- -   @pImageIndex@ /must/ be a valid pointer to a @uint32_t@ value
--
-- -   If @semaphore@ is a valid handle, it /must/ have been created,
--     allocated, or retrieved from @device@
--
-- -   If @fence@ is a valid handle, it /must/ have been created,
--     allocated, or retrieved from @device@
--
-- -   Both of @device@, and @swapchain@ that are valid handles /must/ have
--     been created, allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance'
--
-- == Host Synchronization
--
-- -   Host access to @swapchain@ /must/ be externally synchronized
--
-- -   Host access to @semaphore@ /must/ be externally synchronized
--
-- -   Host access to @fence@ /must/ be externally synchronized
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_SUCCESS'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_TIMEOUT'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_NOT_READY'
--
--     -   'VK_SUBOPTIMAL_KHR'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_OUT_OF_DEVICE_MEMORY'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_DEVICE_LOST'
--
--     -   'VK_ERROR_OUT_OF_DATE_KHR'
--
--     -   'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VK_ERROR_SURFACE_LOST_KHR'
--
--     -   'Graphics.Vulkan.C.Extensions.VK_EXT_full_screen_exclusive.VK_ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT'
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice',
-- 'Graphics.Vulkan.C.Core10.Queue.VkFence',
-- 'Graphics.Vulkan.C.Core10.Queue.VkSemaphore', 'VkSwapchainKHR'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkAcquireNextImageKHR" vkAcquireNextImageKHR :: ("device" ::: VkDevice) -> ("swapchain" ::: VkSwapchainKHR) -> ("timeout" ::: Word64) -> ("semaphore" ::: VkSemaphore) -> ("fence" ::: VkFence) -> ("pImageIndex" ::: Ptr Word32) -> IO VkResult
#else
vkAcquireNextImageKHR :: DeviceCmds -> ("device" ::: VkDevice) -> ("swapchain" ::: VkSwapchainKHR) -> ("timeout" ::: Word64) -> ("semaphore" ::: VkSemaphore) -> ("fence" ::: VkFence) -> ("pImageIndex" ::: Ptr Word32) -> IO VkResult
vkAcquireNextImageKHR deviceCmds = mkVkAcquireNextImageKHR (pVkAcquireNextImageKHR deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkAcquireNextImageKHR
  :: FunPtr (("device" ::: VkDevice) -> ("swapchain" ::: VkSwapchainKHR) -> ("timeout" ::: Word64) -> ("semaphore" ::: VkSemaphore) -> ("fence" ::: VkFence) -> ("pImageIndex" ::: Ptr Word32) -> IO VkResult) -> (("device" ::: VkDevice) -> ("swapchain" ::: VkSwapchainKHR) -> ("timeout" ::: Word64) -> ("semaphore" ::: VkSemaphore) -> ("fence" ::: VkFence) -> ("pImageIndex" ::: Ptr Word32) -> IO VkResult)
#endif

type FN_vkAcquireNextImageKHR = ("device" ::: VkDevice) -> ("swapchain" ::: VkSwapchainKHR) -> ("timeout" ::: Word64) -> ("semaphore" ::: VkSemaphore) -> ("fence" ::: VkFence) -> ("pImageIndex" ::: Ptr Word32) -> IO VkResult
type PFN_vkAcquireNextImageKHR = FunPtr FN_vkAcquireNextImageKHR

-- | vkCreateSwapchainKHR - Create a swapchain
--
-- = Parameters
--
-- -   @device@ is the device to create the swapchain for.
--
-- -   @pCreateInfo@ is a pointer to an instance of the
--     'VkSwapchainCreateInfoKHR' structure specifying the parameters of
--     the created swapchain.
--
-- -   @pAllocator@ is the allocator used for host memory allocated for the
--     swapchain object when there is no more specific allocator available
--     (see
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#memory-allocation Memory Allocation>).
--
-- -   @pSwapchain@ is a pointer to a 'VkSwapchainKHR' handle in which the
--     created swapchain object will be returned.
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' handle
--
-- -   @pCreateInfo@ /must/ be a valid pointer to a valid
--     'VkSwapchainCreateInfoKHR' structure
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     structure
--
-- -   @pSwapchain@ /must/ be a valid pointer to a 'VkSwapchainKHR' handle
--
-- == Host Synchronization
--
-- -   Host access to @pCreateInfo.surface@ /must/ be externally
--     synchronized
--
-- -   Host access to @pCreateInfo.oldSwapchain@ /must/ be externally
--     synchronized
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
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_DEVICE_LOST'
--
--     -   'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VK_ERROR_SURFACE_LOST_KHR'
--
--     -   'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VK_ERROR_NATIVE_WINDOW_IN_USE_KHR'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_INITIALIZATION_FAILED'
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice',
-- 'VkSwapchainCreateInfoKHR', 'VkSwapchainKHR'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCreateSwapchainKHR" vkCreateSwapchainKHR :: ("device" ::: VkDevice) -> ("pCreateInfo" ::: Ptr VkSwapchainCreateInfoKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pSwapchain" ::: Ptr VkSwapchainKHR) -> IO VkResult
#else
vkCreateSwapchainKHR :: DeviceCmds -> ("device" ::: VkDevice) -> ("pCreateInfo" ::: Ptr VkSwapchainCreateInfoKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pSwapchain" ::: Ptr VkSwapchainKHR) -> IO VkResult
vkCreateSwapchainKHR deviceCmds = mkVkCreateSwapchainKHR (pVkCreateSwapchainKHR deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCreateSwapchainKHR
  :: FunPtr (("device" ::: VkDevice) -> ("pCreateInfo" ::: Ptr VkSwapchainCreateInfoKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pSwapchain" ::: Ptr VkSwapchainKHR) -> IO VkResult) -> (("device" ::: VkDevice) -> ("pCreateInfo" ::: Ptr VkSwapchainCreateInfoKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pSwapchain" ::: Ptr VkSwapchainKHR) -> IO VkResult)
#endif

type FN_vkCreateSwapchainKHR = ("device" ::: VkDevice) -> ("pCreateInfo" ::: Ptr VkSwapchainCreateInfoKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pSwapchain" ::: Ptr VkSwapchainKHR) -> IO VkResult
type PFN_vkCreateSwapchainKHR = FunPtr FN_vkCreateSwapchainKHR

-- | vkDestroySwapchainKHR - Destroy a swapchain object
--
-- = Parameters
--
-- -   @device@ is the
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' associated
--     with @swapchain@.
--
-- -   @swapchain@ is the swapchain to destroy.
--
-- -   @pAllocator@ is the allocator used for host memory allocated for the
--     swapchain object when there is no more specific allocator available
--     (see
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#memory-allocation Memory Allocation>).
--
-- = Description
--
-- The application /must/ not destroy a swapchain until after completion of
-- all outstanding operations on images that were acquired from the
-- swapchain. @swapchain@ and all associated
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' handles are
-- destroyed, and /must/ not be acquired or used any more by the
-- application. The memory of each
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' will only be freed
-- after that image is no longer used by the presentation engine. For
-- example, if one image of the swapchain is being displayed in a window,
-- the memory for that image /may/ not be freed until the window is
-- destroyed, or another swapchain is created for the window. Destroying
-- the swapchain does not invalidate the parent
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceKHR', and a new
-- swapchain /can/ be created with it.
--
-- == Valid Usage
--
-- -   All uses of presentable images acquired from @swapchain@ /must/ have
--     completed execution
--
-- -   If
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     were provided when @swapchain@ was created, a compatible set of
--     callbacks /must/ be provided here
--
-- -   If no
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     were provided when @swapchain@ was created, @pAllocator@ /must/ be
--     @NULL@
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' handle
--
-- -   If @swapchain@ is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE', @swapchain@
--     /must/ be a valid 'VkSwapchainKHR' handle
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     structure
--
-- -   Both of @device@, and @swapchain@ that are valid handles /must/ have
--     been created, allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance'
--
-- == Host Synchronization
--
-- -   Host access to @swapchain@ /must/ be externally synchronized
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice',
-- 'VkSwapchainKHR'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkDestroySwapchainKHR" vkDestroySwapchainKHR :: ("device" ::: VkDevice) -> ("swapchain" ::: VkSwapchainKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()
#else
vkDestroySwapchainKHR :: DeviceCmds -> ("device" ::: VkDevice) -> ("swapchain" ::: VkSwapchainKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()
vkDestroySwapchainKHR deviceCmds = mkVkDestroySwapchainKHR (pVkDestroySwapchainKHR deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkDestroySwapchainKHR
  :: FunPtr (("device" ::: VkDevice) -> ("swapchain" ::: VkSwapchainKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()) -> (("device" ::: VkDevice) -> ("swapchain" ::: VkSwapchainKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ())
#endif

type FN_vkDestroySwapchainKHR = ("device" ::: VkDevice) -> ("swapchain" ::: VkSwapchainKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()
type PFN_vkDestroySwapchainKHR = FunPtr FN_vkDestroySwapchainKHR

-- | vkGetDeviceGroupPresentCapabilitiesKHR - Query present capabilities from
-- other physical devices
--
-- = Parameters
--
-- -   @device@ is the logical device.
--
-- -   @pDeviceGroupPresentCapabilities@ is a pointer to a structure of
--     type 'VkDeviceGroupPresentCapabilitiesKHR' that is filled with the
--     logical device’s capabilities.
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
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice',
-- 'VkDeviceGroupPresentCapabilitiesKHR'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkGetDeviceGroupPresentCapabilitiesKHR" vkGetDeviceGroupPresentCapabilitiesKHR :: ("device" ::: VkDevice) -> ("pDeviceGroupPresentCapabilities" ::: Ptr VkDeviceGroupPresentCapabilitiesKHR) -> IO VkResult
#else
vkGetDeviceGroupPresentCapabilitiesKHR :: DeviceCmds -> ("device" ::: VkDevice) -> ("pDeviceGroupPresentCapabilities" ::: Ptr VkDeviceGroupPresentCapabilitiesKHR) -> IO VkResult
vkGetDeviceGroupPresentCapabilitiesKHR deviceCmds = mkVkGetDeviceGroupPresentCapabilitiesKHR (pVkGetDeviceGroupPresentCapabilitiesKHR deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetDeviceGroupPresentCapabilitiesKHR
  :: FunPtr (("device" ::: VkDevice) -> ("pDeviceGroupPresentCapabilities" ::: Ptr VkDeviceGroupPresentCapabilitiesKHR) -> IO VkResult) -> (("device" ::: VkDevice) -> ("pDeviceGroupPresentCapabilities" ::: Ptr VkDeviceGroupPresentCapabilitiesKHR) -> IO VkResult)
#endif

type FN_vkGetDeviceGroupPresentCapabilitiesKHR = ("device" ::: VkDevice) -> ("pDeviceGroupPresentCapabilities" ::: Ptr VkDeviceGroupPresentCapabilitiesKHR) -> IO VkResult
type PFN_vkGetDeviceGroupPresentCapabilitiesKHR = FunPtr FN_vkGetDeviceGroupPresentCapabilitiesKHR

-- | vkGetDeviceGroupSurfacePresentModesKHR - Query present capabilities for
-- a surface
--
-- = Parameters
--
-- -   @device@ is the logical device.
--
-- -   @surface@ is the surface.
--
-- -   @pModes@ is a pointer to a value of type
--     'VkDeviceGroupPresentModeFlagsKHR' that is filled with the supported
--     device group present modes for the surface.
--
-- = Description
--
-- The modes returned by this command are not invariant, and /may/ change
-- in response to the surface being moved, resized, or occluded. These
-- modes /must/ be a subset of the modes returned by
-- 'vkGetDeviceGroupPresentCapabilitiesKHR'.
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' handle
--
-- -   @surface@ /must/ be a valid
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceKHR' handle
--
-- -   @pModes@ /must/ be a valid pointer to a
--     'VkDeviceGroupPresentModeFlagsKHR' value
--
-- -   Both of @device@, and @surface@ /must/ have been created, allocated,
--     or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance'
--
-- == Host Synchronization
--
-- -   Host access to @surface@ /must/ be externally synchronized
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
--     -   'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VK_ERROR_SURFACE_LOST_KHR'
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice',
-- 'VkDeviceGroupPresentModeFlagsKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceKHR'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkGetDeviceGroupSurfacePresentModesKHR" vkGetDeviceGroupSurfacePresentModesKHR :: ("device" ::: VkDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pModes" ::: Ptr VkDeviceGroupPresentModeFlagsKHR) -> IO VkResult
#else
vkGetDeviceGroupSurfacePresentModesKHR :: DeviceCmds -> ("device" ::: VkDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pModes" ::: Ptr VkDeviceGroupPresentModeFlagsKHR) -> IO VkResult
vkGetDeviceGroupSurfacePresentModesKHR deviceCmds = mkVkGetDeviceGroupSurfacePresentModesKHR (pVkGetDeviceGroupSurfacePresentModesKHR deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetDeviceGroupSurfacePresentModesKHR
  :: FunPtr (("device" ::: VkDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pModes" ::: Ptr VkDeviceGroupPresentModeFlagsKHR) -> IO VkResult) -> (("device" ::: VkDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pModes" ::: Ptr VkDeviceGroupPresentModeFlagsKHR) -> IO VkResult)
#endif

type FN_vkGetDeviceGroupSurfacePresentModesKHR = ("device" ::: VkDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pModes" ::: Ptr VkDeviceGroupPresentModeFlagsKHR) -> IO VkResult
type PFN_vkGetDeviceGroupSurfacePresentModesKHR = FunPtr FN_vkGetDeviceGroupSurfacePresentModesKHR

-- | vkGetPhysicalDevicePresentRectanglesKHR - Query present rectangles for a
-- surface on a physical device
--
-- = Parameters
--
-- -   @physicalDevice@ is the physical device.
--
-- -   @surface@ is the surface.
--
-- -   @pRectCount@ is a pointer to an integer related to the number of
--     rectangles available or queried, as described below.
--
-- -   @pRects@ is either @NULL@ or a pointer to an array of
--     'Graphics.Vulkan.C.Core10.Pipeline.VkRect2D' structures.
--
-- = Description
--
-- If @pRects@ is @NULL@, then the number of rectangles used when
-- presenting the given @surface@ is returned in @pRectCount@. Otherwise,
-- @pRectCount@ /must/ point to a variable set by the user to the number of
-- elements in the @pRects@ array, and on return the variable is
-- overwritten with the number of structures actually written to @pRects@.
-- If the value of @pRectCount@ is less than the number of rectangles, at
-- most @pRectCount@ structures will be written. If @pRectCount@ is smaller
-- than the number of rectangles used for the given @surface@,
-- 'Graphics.Vulkan.C.Core10.Core.VK_INCOMPLETE' will be returned instead
-- of 'Graphics.Vulkan.C.Core10.Core.VK_SUCCESS' to indicate that not all
-- the available values were returned.
--
-- The values returned by this command are not invariant, and /may/ change
-- in response to the surface being moved, resized, or occluded.
--
-- The rectangles returned by this command /must/ not overlap.
--
-- == Valid Usage (Implicit)
--
-- -   @physicalDevice@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDevice'
--     handle
--
-- -   @surface@ /must/ be a valid
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceKHR' handle
--
-- -   @pRectCount@ /must/ be a valid pointer to a @uint32_t@ value
--
-- -   If the value referenced by @pRectCount@ is not @0@, and @pRects@ is
--     not @NULL@, @pRects@ /must/ be a valid pointer to an array of
--     @pRectCount@ 'Graphics.Vulkan.C.Core10.Pipeline.VkRect2D' structures
--
-- -   Both of @physicalDevice@, and @surface@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance'
--
-- == Host Synchronization
--
-- -   Host access to @surface@ /must/ be externally synchronized
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_SUCCESS'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_INCOMPLETE'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_OUT_OF_DEVICE_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDevice',
-- 'Graphics.Vulkan.C.Core10.Pipeline.VkRect2D',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceKHR'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkGetPhysicalDevicePresentRectanglesKHR" vkGetPhysicalDevicePresentRectanglesKHR :: ("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pRectCount" ::: Ptr Word32) -> ("pRects" ::: Ptr VkRect2D) -> IO VkResult
#else
vkGetPhysicalDevicePresentRectanglesKHR :: InstanceCmds -> ("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pRectCount" ::: Ptr Word32) -> ("pRects" ::: Ptr VkRect2D) -> IO VkResult
vkGetPhysicalDevicePresentRectanglesKHR deviceCmds = mkVkGetPhysicalDevicePresentRectanglesKHR (pVkGetPhysicalDevicePresentRectanglesKHR deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDevicePresentRectanglesKHR
  :: FunPtr (("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pRectCount" ::: Ptr Word32) -> ("pRects" ::: Ptr VkRect2D) -> IO VkResult) -> (("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pRectCount" ::: Ptr Word32) -> ("pRects" ::: Ptr VkRect2D) -> IO VkResult)
#endif

type FN_vkGetPhysicalDevicePresentRectanglesKHR = ("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pRectCount" ::: Ptr Word32) -> ("pRects" ::: Ptr VkRect2D) -> IO VkResult
type PFN_vkGetPhysicalDevicePresentRectanglesKHR = FunPtr FN_vkGetPhysicalDevicePresentRectanglesKHR

-- | vkGetSwapchainImagesKHR - Obtain the array of presentable images
-- associated with a swapchain
--
-- = Parameters
--
-- -   @device@ is the device associated with @swapchain@.
--
-- -   @swapchain@ is the swapchain to query.
--
-- -   @pSwapchainImageCount@ is a pointer to an integer related to the
--     number of presentable images available or queried, as described
--     below.
--
-- -   @pSwapchainImages@ is either @NULL@ or a pointer to an array of
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' handles.
--
-- = Description
--
-- If @pSwapchainImages@ is @NULL@, then the number of presentable images
-- for @swapchain@ is returned in @pSwapchainImageCount@. Otherwise,
-- @pSwapchainImageCount@ /must/ point to a variable set by the user to the
-- number of elements in the @pSwapchainImages@ array, and on return the
-- variable is overwritten with the number of structures actually written
-- to @pSwapchainImages@. If the value of @pSwapchainImageCount@ is less
-- than the number of presentable images for @swapchain@, at most
-- @pSwapchainImageCount@ structures will be written. If
-- @pSwapchainImageCount@ is smaller than the number of presentable images
-- for @swapchain@, 'Graphics.Vulkan.C.Core10.Core.VK_INCOMPLETE' will be
-- returned instead of 'Graphics.Vulkan.C.Core10.Core.VK_SUCCESS' to
-- indicate that not all the available values were returned.
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' handle
--
-- -   @swapchain@ /must/ be a valid 'VkSwapchainKHR' handle
--
-- -   @pSwapchainImageCount@ /must/ be a valid pointer to a @uint32_t@
--     value
--
-- -   If the value referenced by @pSwapchainImageCount@ is not @0@, and
--     @pSwapchainImages@ is not @NULL@, @pSwapchainImages@ /must/ be a
--     valid pointer to an array of @pSwapchainImageCount@
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' handles
--
-- -   Both of @device@, and @swapchain@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance'
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_SUCCESS'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_INCOMPLETE'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_OUT_OF_DEVICE_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice',
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage', 'VkSwapchainKHR'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkGetSwapchainImagesKHR" vkGetSwapchainImagesKHR :: ("device" ::: VkDevice) -> ("swapchain" ::: VkSwapchainKHR) -> ("pSwapchainImageCount" ::: Ptr Word32) -> ("pSwapchainImages" ::: Ptr VkImage) -> IO VkResult
#else
vkGetSwapchainImagesKHR :: DeviceCmds -> ("device" ::: VkDevice) -> ("swapchain" ::: VkSwapchainKHR) -> ("pSwapchainImageCount" ::: Ptr Word32) -> ("pSwapchainImages" ::: Ptr VkImage) -> IO VkResult
vkGetSwapchainImagesKHR deviceCmds = mkVkGetSwapchainImagesKHR (pVkGetSwapchainImagesKHR deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetSwapchainImagesKHR
  :: FunPtr (("device" ::: VkDevice) -> ("swapchain" ::: VkSwapchainKHR) -> ("pSwapchainImageCount" ::: Ptr Word32) -> ("pSwapchainImages" ::: Ptr VkImage) -> IO VkResult) -> (("device" ::: VkDevice) -> ("swapchain" ::: VkSwapchainKHR) -> ("pSwapchainImageCount" ::: Ptr Word32) -> ("pSwapchainImages" ::: Ptr VkImage) -> IO VkResult)
#endif

type FN_vkGetSwapchainImagesKHR = ("device" ::: VkDevice) -> ("swapchain" ::: VkSwapchainKHR) -> ("pSwapchainImageCount" ::: Ptr Word32) -> ("pSwapchainImages" ::: Ptr VkImage) -> IO VkResult
type PFN_vkGetSwapchainImagesKHR = FunPtr FN_vkGetSwapchainImagesKHR

-- | vkQueuePresentKHR - Queue an image for presentation
--
-- = Parameters
--
-- -   @queue@ is a queue that is capable of presentation to the target
--     surface’s platform on the same device as the image’s swapchain.
--
-- -   @pPresentInfo@ is a pointer to an instance of the 'VkPresentInfoKHR'
--     structure specifying the parameters of the presentation.
--
-- = Description
--
-- __Note__
--
-- There is no requirement for an application to present images in the same
-- order that they were acquired - applications can arbitrarily present any
-- image that is currently acquired.
--
-- == Valid Usage
--
-- -   Each element of @pSwapchains@ member of @pPresentInfo@ /must/ be a
--     swapchain that is created for a surface for which presentation is
--     supported from @queue@ as determined using a call to
--     'Graphics.Vulkan.C.Extensions.VK_KHR_surface.vkGetPhysicalDeviceSurfaceSupportKHR'
--
-- -   When a semaphore unsignal operation defined by the elements of the
--     @pWaitSemaphores@ member of @pPresentInfo@ executes on @queue@, no
--     other queue /must/ be waiting on the same semaphore.
--
-- -   All elements of the @pWaitSemaphores@ member of @pPresentInfo@
--     /must/ be semaphores that are signaled, or have
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-semaphores-signaling semaphore signal operations>
--     previously submitted for execution.
--
-- Any writes to memory backing the images referenced by the
-- @pImageIndices@ and @pSwapchains@ members of @pPresentInfo@, that are
-- available before 'vkQueuePresentKHR' is executed, are automatically made
-- visible to the read access performed by the presentation engine. This
-- automatic visibility operation for an image happens-after the semaphore
-- signal operation, and happens-before the presentation engine accesses
-- the image.
--
-- Queueing an image for presentation defines a set of /queue operations/,
-- including waiting on the semaphores and submitting a presentation
-- request to the presentation engine. However, the scope of this set of
-- queue operations does not include the actual processing of the image by
-- the presentation engine.
--
-- If 'vkQueuePresentKHR' fails to enqueue the corresponding set of queue
-- operations, it /may/ return
-- 'Graphics.Vulkan.C.Core10.Core.VK_ERROR_OUT_OF_HOST_MEMORY' or
-- 'Graphics.Vulkan.C.Core10.Core.VK_ERROR_OUT_OF_DEVICE_MEMORY'. If it
-- does, the implementation /must/ ensure that the state and contents of
-- any resources or synchronization primitives referenced is unaffected by
-- the call or its failure.
--
-- If 'vkQueuePresentKHR' fails in such a way that the implementation is
-- unable to make that guarantee, the implementation /must/ return
-- 'Graphics.Vulkan.C.Core10.Core.VK_ERROR_DEVICE_LOST'.
--
-- However, if the presentation request is rejected by the presentation
-- engine with an error 'VK_ERROR_OUT_OF_DATE_KHR' or
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VK_ERROR_SURFACE_LOST_KHR',
-- the set of queue operations are still considered to be enqueued and thus
-- any semaphore to be waited on gets unsignaled when the corresponding
-- queue operation is complete.
--
-- == Valid Usage (Implicit)
--
-- -   @queue@ /must/ be a valid 'Graphics.Vulkan.C.Core10.Queue.VkQueue'
--     handle
--
-- -   @pPresentInfo@ /must/ be a valid pointer to a valid
--     'VkPresentInfoKHR' structure
--
-- == Host Synchronization
--
-- -   Host access to @queue@ /must/ be externally synchronized
--
-- -   Host access to @pPresentInfo.pWaitSemaphores@[] /must/ be externally
--     synchronized
--
-- -   Host access to @pPresentInfo.pSwapchains@[] /must/ be externally
--     synchronized
--
-- == Command Properties
--
-- \'
--
-- > +-----------------+-----------------+-----------------+-----------------+
-- > | <https://www.kh | <https://www.kh | <https://www.kh | <https://www.kh |
-- > | ronos.org/regis | ronos.org/regis | ronos.org/regis | ronos.org/regis |
-- > | try/vulkan/spec | try/vulkan/spec | try/vulkan/spec | try/vulkan/spec |
-- > | s/1.0-extension | s/1.0-extension | s/1.0-extension | s/1.0-extension |
-- > | s/html/vkspec.h | s/html/vkspec.h | s/html/vkspec.h | s/html/vkspec.h |
-- > | tml#VkCommandBu | tml#vkCmdBeginR | tml#VkQueueFlag | tml#synchroniza |
-- > | fferLevel Comma | enderPass Rende | Bits Supported  | tion-pipeline-s |
-- > | nd Buffer Level | r Pass Scope>   | Queue Types>    | tages-types Pip |
-- > | s>              |                 |                 | eline Type>     |
-- > +=================+=================+=================+=================+
-- > | -               | -               | Any             | -               |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_SUCCESS'
--
--     -   'VK_SUBOPTIMAL_KHR'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_OUT_OF_DEVICE_MEMORY'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_DEVICE_LOST'
--
--     -   'VK_ERROR_OUT_OF_DATE_KHR'
--
--     -   'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VK_ERROR_SURFACE_LOST_KHR'
--
--     -   'Graphics.Vulkan.C.Extensions.VK_EXT_full_screen_exclusive.VK_ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT'
--
-- = See Also
--
-- 'VkPresentInfoKHR', 'Graphics.Vulkan.C.Core10.Queue.VkQueue'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkQueuePresentKHR" vkQueuePresentKHR :: ("queue" ::: VkQueue) -> ("pPresentInfo" ::: Ptr VkPresentInfoKHR) -> IO VkResult
#else
vkQueuePresentKHR :: DeviceCmds -> ("queue" ::: VkQueue) -> ("pPresentInfo" ::: Ptr VkPresentInfoKHR) -> IO VkResult
vkQueuePresentKHR deviceCmds = mkVkQueuePresentKHR (pVkQueuePresentKHR deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkQueuePresentKHR
  :: FunPtr (("queue" ::: VkQueue) -> ("pPresentInfo" ::: Ptr VkPresentInfoKHR) -> IO VkResult) -> (("queue" ::: VkQueue) -> ("pPresentInfo" ::: Ptr VkPresentInfoKHR) -> IO VkResult)
#endif

type FN_vkQueuePresentKHR = ("queue" ::: VkQueue) -> ("pPresentInfo" ::: Ptr VkPresentInfoKHR) -> IO VkResult
type PFN_vkQueuePresentKHR = FunPtr FN_vkQueuePresentKHR

-- No documentation found for Nested "VkResult" "VK_ERROR_OUT_OF_DATE_KHR"
pattern VK_ERROR_OUT_OF_DATE_KHR :: VkResult
pattern VK_ERROR_OUT_OF_DATE_KHR = VkResult (-1000001004)

-- No documentation found for Nested "VkImageLayout" "VK_IMAGE_LAYOUT_PRESENT_SRC_KHR"
pattern VK_IMAGE_LAYOUT_PRESENT_SRC_KHR :: VkImageLayout
pattern VK_IMAGE_LAYOUT_PRESENT_SRC_KHR = VkImageLayout 1000001002

-- No documentation found for TopLevel "VK_KHR_SWAPCHAIN_EXTENSION_NAME"
pattern VK_KHR_SWAPCHAIN_EXTENSION_NAME :: (Eq a, IsString a) => a
pattern VK_KHR_SWAPCHAIN_EXTENSION_NAME = "VK_KHR_swapchain"

-- No documentation found for TopLevel "VK_KHR_SWAPCHAIN_SPEC_VERSION"
pattern VK_KHR_SWAPCHAIN_SPEC_VERSION :: Integral a => a
pattern VK_KHR_SWAPCHAIN_SPEC_VERSION = 70

-- No documentation found for Nested "VkObjectType" "VK_OBJECT_TYPE_SWAPCHAIN_KHR"
pattern VK_OBJECT_TYPE_SWAPCHAIN_KHR :: VkObjectType
pattern VK_OBJECT_TYPE_SWAPCHAIN_KHR = VkObjectType 1000001000

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_ACQUIRE_NEXT_IMAGE_INFO_KHR"
pattern VK_STRUCTURE_TYPE_ACQUIRE_NEXT_IMAGE_INFO_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_ACQUIRE_NEXT_IMAGE_INFO_KHR = VkStructureType 1000060010

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_SWAPCHAIN_INFO_KHR"
pattern VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_SWAPCHAIN_INFO_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_SWAPCHAIN_INFO_KHR = VkStructureType 1000060009

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_CAPABILITIES_KHR"
pattern VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_CAPABILITIES_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_CAPABILITIES_KHR = VkStructureType 1000060007

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_INFO_KHR"
pattern VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_INFO_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_INFO_KHR = VkStructureType 1000060011

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_DEVICE_GROUP_SWAPCHAIN_CREATE_INFO_KHR"
pattern VK_STRUCTURE_TYPE_DEVICE_GROUP_SWAPCHAIN_CREATE_INFO_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_DEVICE_GROUP_SWAPCHAIN_CREATE_INFO_KHR = VkStructureType 1000060012

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_IMAGE_SWAPCHAIN_CREATE_INFO_KHR"
pattern VK_STRUCTURE_TYPE_IMAGE_SWAPCHAIN_CREATE_INFO_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_IMAGE_SWAPCHAIN_CREATE_INFO_KHR = VkStructureType 1000060008

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_PRESENT_INFO_KHR"
pattern VK_STRUCTURE_TYPE_PRESENT_INFO_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_PRESENT_INFO_KHR = VkStructureType 1000001001

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR"
pattern VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR = VkStructureType 1000001000

-- No documentation found for Nested "VkResult" "VK_SUBOPTIMAL_KHR"
pattern VK_SUBOPTIMAL_KHR :: VkResult
pattern VK_SUBOPTIMAL_KHR = VkResult 1000001003

-- No documentation found for Nested "VkSwapchainCreateFlagBitsKHR" "VK_SWAPCHAIN_CREATE_PROTECTED_BIT_KHR"
pattern VK_SWAPCHAIN_CREATE_PROTECTED_BIT_KHR :: VkSwapchainCreateFlagBitsKHR
pattern VK_SWAPCHAIN_CREATE_PROTECTED_BIT_KHR = VkSwapchainCreateFlagBitsKHR 0x00000002

-- No documentation found for Nested "VkSwapchainCreateFlagBitsKHR" "VK_SWAPCHAIN_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT_KHR"
pattern VK_SWAPCHAIN_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT_KHR :: VkSwapchainCreateFlagBitsKHR
pattern VK_SWAPCHAIN_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT_KHR = VkSwapchainCreateFlagBitsKHR 0x00000001
