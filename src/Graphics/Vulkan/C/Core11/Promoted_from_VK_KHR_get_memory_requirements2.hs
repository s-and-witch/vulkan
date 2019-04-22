{-# language Strict #-}
{-# language CPP #-}
{-# language DuplicateRecordFields #-}
{-# language PatternSynonyms #-}
{-# language DataKinds #-}
{-# language TypeOperators #-}

module Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_get_memory_requirements2
  ( VkBufferMemoryRequirementsInfo2(..)
  , VkImageMemoryRequirementsInfo2(..)
  , VkImageSparseMemoryRequirementsInfo2(..)
  , VkMemoryRequirements2(..)
  , VkMemoryRequirements2KHR
  , pattern VkMemoryRequirements2KHR
  , VkSparseImageMemoryRequirements2(..)
  , FN_vkGetBufferMemoryRequirements2
  , PFN_vkGetBufferMemoryRequirements2
  , vkGetBufferMemoryRequirements2
  , FN_vkGetImageMemoryRequirements2
  , PFN_vkGetImageMemoryRequirements2
  , vkGetImageMemoryRequirements2
  , FN_vkGetImageSparseMemoryRequirements2
  , PFN_vkGetImageSparseMemoryRequirements2
  , vkGetImageSparseMemoryRequirements2
  , pattern VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2
  , pattern VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2
  , pattern VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2
  , pattern VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
  , pattern VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2
  ) where

import Data.Word
  ( Word32
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


import Graphics.Vulkan.C.Core10.Core
  ( VkStructureType(..)
  , Zero(..)
  )
import Graphics.Vulkan.C.Core10.DeviceInitialization
  ( VkDevice
  )
import Graphics.Vulkan.C.Core10.MemoryManagement
  ( VkMemoryRequirements(..)
  , VkBuffer
  , VkImage
  )
import Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement
  ( VkSparseImageMemoryRequirements(..)
  )
import Graphics.Vulkan.C.Dynamic
  ( DeviceCmds(..)
  )
import Graphics.Vulkan.NamedType
  ( (:::)
  )


-- | VkBufferMemoryRequirementsInfo2 - (None)
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType',
-- 'vkGetBufferMemoryRequirements2',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_get_memory_requirements2.vkGetBufferMemoryRequirements2KHR'
data VkBufferMemoryRequirementsInfo2 = VkBufferMemoryRequirementsInfo2
  { -- | @sType@ /must/ be 'VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2'
  vkSType :: VkStructureType
  , -- | @pNext@ /must/ be @NULL@
  vkPNext :: Ptr ()
  , -- | @buffer@ /must/ be a valid
  -- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer' handle
  vkBuffer :: VkBuffer
  }
  deriving (Eq, Show)

instance Storable VkBufferMemoryRequirementsInfo2 where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkBufferMemoryRequirementsInfo2 <$> peek (ptr `plusPtr` 0)
                                             <*> peek (ptr `plusPtr` 8)
                                             <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkBufferMemoryRequirementsInfo2))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkBufferMemoryRequirementsInfo2))
                *> poke (ptr `plusPtr` 16) (vkBuffer (poked :: VkBufferMemoryRequirementsInfo2))

instance Zero VkBufferMemoryRequirementsInfo2 where
  zero = VkBufferMemoryRequirementsInfo2 VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2
                                         zero
                                         zero

-- | VkImageMemoryRequirementsInfo2 - (None)
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType',
-- 'vkGetImageMemoryRequirements2',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_get_memory_requirements2.vkGetImageMemoryRequirements2KHR'
data VkImageMemoryRequirementsInfo2 = VkImageMemoryRequirementsInfo2
  { -- | @sType@ /must/ be 'VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2'
  vkSType :: VkStructureType
  , -- | @pNext@ /must/ be @NULL@ or a pointer to a valid instance of
  -- 'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_sampler_ycbcr_conversion.VkImagePlaneMemoryRequirementsInfo'
  vkPNext :: Ptr ()
  , -- | @image@ /must/ be a valid
  -- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' handle
  vkImage :: VkImage
  }
  deriving (Eq, Show)

instance Storable VkImageMemoryRequirementsInfo2 where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkImageMemoryRequirementsInfo2 <$> peek (ptr `plusPtr` 0)
                                            <*> peek (ptr `plusPtr` 8)
                                            <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkImageMemoryRequirementsInfo2))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkImageMemoryRequirementsInfo2))
                *> poke (ptr `plusPtr` 16) (vkImage (poked :: VkImageMemoryRequirementsInfo2))

instance Zero VkImageMemoryRequirementsInfo2 where
  zero = VkImageMemoryRequirementsInfo2 VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2
                                        zero
                                        zero

-- | VkImageSparseMemoryRequirementsInfo2 - (None)
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType',
-- 'vkGetImageSparseMemoryRequirements2',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_get_memory_requirements2.vkGetImageSparseMemoryRequirements2KHR'
data VkImageSparseMemoryRequirementsInfo2 = VkImageSparseMemoryRequirementsInfo2
  { -- | @sType@ /must/ be
  -- 'VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2'
  vkSType :: VkStructureType
  , -- | @pNext@ /must/ be @NULL@
  vkPNext :: Ptr ()
  , -- | @image@ /must/ be a valid
  -- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' handle
  vkImage :: VkImage
  }
  deriving (Eq, Show)

instance Storable VkImageSparseMemoryRequirementsInfo2 where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkImageSparseMemoryRequirementsInfo2 <$> peek (ptr `plusPtr` 0)
                                                  <*> peek (ptr `plusPtr` 8)
                                                  <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkImageSparseMemoryRequirementsInfo2))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkImageSparseMemoryRequirementsInfo2))
                *> poke (ptr `plusPtr` 16) (vkImage (poked :: VkImageSparseMemoryRequirementsInfo2))

instance Zero VkImageSparseMemoryRequirementsInfo2 where
  zero = VkImageSparseMemoryRequirementsInfo2 VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2
                                              zero
                                              zero

-- | VkMemoryRequirements2 - Structure specifying memory requirements
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkMemoryRequirements',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType',
-- 'vkGetBufferMemoryRequirements2',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_get_memory_requirements2.vkGetBufferMemoryRequirements2KHR',
-- 'vkGetImageMemoryRequirements2',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_get_memory_requirements2.vkGetImageMemoryRequirements2KHR'
data VkMemoryRequirements2 = VkMemoryRequirements2
  { -- | @sType@ /must/ be 'VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2'
  vkSType :: VkStructureType
  , -- | @pNext@ /must/ be @NULL@ or a pointer to a valid instance of
  -- 'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_dedicated_allocation.VkMemoryDedicatedRequirements'
  vkPNext :: Ptr ()
  , -- | @memoryRequirements@ is a structure of type
  -- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkMemoryRequirements'
  -- describing the memory requirements of the resource.
  vkMemoryRequirements :: VkMemoryRequirements
  }
  deriving (Eq, Show)

instance Storable VkMemoryRequirements2 where
  sizeOf ~_ = 40
  alignment ~_ = 8
  peek ptr = VkMemoryRequirements2 <$> peek (ptr `plusPtr` 0)
                                   <*> peek (ptr `plusPtr` 8)
                                   <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkMemoryRequirements2))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkMemoryRequirements2))
                *> poke (ptr `plusPtr` 16) (vkMemoryRequirements (poked :: VkMemoryRequirements2))

instance Zero VkMemoryRequirements2 where
  zero = VkMemoryRequirements2 VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
                               zero
                               zero

-- No documentation found for TopLevel "VkMemoryRequirements2KHR"
type VkMemoryRequirements2KHR = VkMemoryRequirements2


-- No documentation found for TopLevel "VkMemoryRequirements2KHR"
pattern VkMemoryRequirements2KHR :: ("sType" ::: VkStructureType) -> ("pNext" ::: Ptr ()) -> ("memoryRequirements" ::: VkMemoryRequirements) -> VkMemoryRequirements2KHR
pattern VkMemoryRequirements2KHR vkSType vkPNext vkMemoryRequirements = VkMemoryRequirements2 vkSType vkPNext vkMemoryRequirements

-- | VkSparseImageMemoryRequirements2 - (None)
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VkSparseImageMemoryRequirements',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType',
-- 'vkGetImageSparseMemoryRequirements2',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_get_memory_requirements2.vkGetImageSparseMemoryRequirements2KHR'
data VkSparseImageMemoryRequirements2 = VkSparseImageMemoryRequirements2
  { -- | @sType@ /must/ be 'VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2'
  vkSType :: VkStructureType
  , -- | @pNext@ /must/ be @NULL@
  vkPNext :: Ptr ()
  , -- | @memoryRequirements@ is a structure of type
  -- 'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VkSparseImageMemoryRequirements'
  -- describing the memory requirements of the sparse image.
  vkMemoryRequirements :: VkSparseImageMemoryRequirements
  }
  deriving (Eq, Show)

instance Storable VkSparseImageMemoryRequirements2 where
  sizeOf ~_ = 64
  alignment ~_ = 8
  peek ptr = VkSparseImageMemoryRequirements2 <$> peek (ptr `plusPtr` 0)
                                              <*> peek (ptr `plusPtr` 8)
                                              <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkSparseImageMemoryRequirements2))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkSparseImageMemoryRequirements2))
                *> poke (ptr `plusPtr` 16) (vkMemoryRequirements (poked :: VkSparseImageMemoryRequirements2))

instance Zero VkSparseImageMemoryRequirements2 where
  zero = VkSparseImageMemoryRequirements2 VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2
                                          zero
                                          zero

-- | vkGetBufferMemoryRequirements2 - Returns the memory requirements for
-- specified Vulkan object
--
-- = Parameters
--
-- -   @device@ is the logical device that owns the buffer.
--
-- -   @pInfo@ is a pointer to an instance of the
--     'VkBufferMemoryRequirementsInfo2' structure containing parameters
--     required for the memory requirements query.
--
-- -   @pMemoryRequirements@ points to an instance of the
--     'VkMemoryRequirements2' structure in which the memory requirements
--     of the buffer object are returned.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'VkBufferMemoryRequirementsInfo2',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice',
-- 'VkMemoryRequirements2'
#if defined(EXPOSE_CORE11_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkGetBufferMemoryRequirements2" vkGetBufferMemoryRequirements2 :: ("device" ::: VkDevice) -> ("pInfo" ::: Ptr VkBufferMemoryRequirementsInfo2) -> ("pMemoryRequirements" ::: Ptr VkMemoryRequirements2) -> IO ()
#else
vkGetBufferMemoryRequirements2 :: DeviceCmds -> ("device" ::: VkDevice) -> ("pInfo" ::: Ptr VkBufferMemoryRequirementsInfo2) -> ("pMemoryRequirements" ::: Ptr VkMemoryRequirements2) -> IO ()
vkGetBufferMemoryRequirements2 deviceCmds = mkVkGetBufferMemoryRequirements2 (pVkGetBufferMemoryRequirements2 deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetBufferMemoryRequirements2
  :: FunPtr (("device" ::: VkDevice) -> ("pInfo" ::: Ptr VkBufferMemoryRequirementsInfo2) -> ("pMemoryRequirements" ::: Ptr VkMemoryRequirements2) -> IO ()) -> (("device" ::: VkDevice) -> ("pInfo" ::: Ptr VkBufferMemoryRequirementsInfo2) -> ("pMemoryRequirements" ::: Ptr VkMemoryRequirements2) -> IO ())
#endif

type FN_vkGetBufferMemoryRequirements2 = ("device" ::: VkDevice) -> ("pInfo" ::: Ptr VkBufferMemoryRequirementsInfo2) -> ("pMemoryRequirements" ::: Ptr VkMemoryRequirements2) -> IO ()
type PFN_vkGetBufferMemoryRequirements2 = FunPtr FN_vkGetBufferMemoryRequirements2

-- | vkGetImageMemoryRequirements2 - Returns the memory requirements for
-- specified Vulkan object
--
-- = Parameters
--
-- -   @device@ is the logical device that owns the image.
--
-- -   @pInfo@ is a pointer to an instance of the
--     'VkImageMemoryRequirementsInfo2' structure containing parameters
--     required for the memory requirements query.
--
-- -   @pMemoryRequirements@ points to an instance of the
--     'VkMemoryRequirements2' structure in which the memory requirements
--     of the image object are returned.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice',
-- 'VkImageMemoryRequirementsInfo2', 'VkMemoryRequirements2'
#if defined(EXPOSE_CORE11_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkGetImageMemoryRequirements2" vkGetImageMemoryRequirements2 :: ("device" ::: VkDevice) -> ("pInfo" ::: Ptr VkImageMemoryRequirementsInfo2) -> ("pMemoryRequirements" ::: Ptr VkMemoryRequirements2) -> IO ()
#else
vkGetImageMemoryRequirements2 :: DeviceCmds -> ("device" ::: VkDevice) -> ("pInfo" ::: Ptr VkImageMemoryRequirementsInfo2) -> ("pMemoryRequirements" ::: Ptr VkMemoryRequirements2) -> IO ()
vkGetImageMemoryRequirements2 deviceCmds = mkVkGetImageMemoryRequirements2 (pVkGetImageMemoryRequirements2 deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetImageMemoryRequirements2
  :: FunPtr (("device" ::: VkDevice) -> ("pInfo" ::: Ptr VkImageMemoryRequirementsInfo2) -> ("pMemoryRequirements" ::: Ptr VkMemoryRequirements2) -> IO ()) -> (("device" ::: VkDevice) -> ("pInfo" ::: Ptr VkImageMemoryRequirementsInfo2) -> ("pMemoryRequirements" ::: Ptr VkMemoryRequirements2) -> IO ())
#endif

type FN_vkGetImageMemoryRequirements2 = ("device" ::: VkDevice) -> ("pInfo" ::: Ptr VkImageMemoryRequirementsInfo2) -> ("pMemoryRequirements" ::: Ptr VkMemoryRequirements2) -> IO ()
type PFN_vkGetImageMemoryRequirements2 = FunPtr FN_vkGetImageMemoryRequirements2

-- | vkGetImageSparseMemoryRequirements2 - Query the memory requirements for
-- a sparse image
--
-- = Parameters
--
-- -   @device@ is the logical device that owns the image.
--
-- -   @pInfo@ is a pointer to an instance of the
--     'VkImageSparseMemoryRequirementsInfo2' structure containing
--     parameters required for the memory requirements query.
--
-- -   @pSparseMemoryRequirementCount@ is a pointer to an integer related
--     to the number of sparse memory requirements available or queried, as
--     described below.
--
-- -   @pSparseMemoryRequirements@ is either @NULL@ or a pointer to an
--     array of 'VkSparseImageMemoryRequirements2' structures.
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' handle
--
-- -   @pInfo@ /must/ be a valid pointer to a valid
--     'VkImageSparseMemoryRequirementsInfo2' structure
--
-- -   @pSparseMemoryRequirementCount@ /must/ be a valid pointer to a
--     @uint32_t@ value
--
-- -   If the value referenced by @pSparseMemoryRequirementCount@ is not
--     @0@, and @pSparseMemoryRequirements@ is not @NULL@,
--     @pSparseMemoryRequirements@ /must/ be a valid pointer to an array of
--     @pSparseMemoryRequirementCount@ 'VkSparseImageMemoryRequirements2'
--     structures
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice',
-- 'VkImageSparseMemoryRequirementsInfo2',
-- 'VkSparseImageMemoryRequirements2'
#if defined(EXPOSE_CORE11_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkGetImageSparseMemoryRequirements2" vkGetImageSparseMemoryRequirements2 :: ("device" ::: VkDevice) -> ("pInfo" ::: Ptr VkImageSparseMemoryRequirementsInfo2) -> ("pSparseMemoryRequirementCount" ::: Ptr Word32) -> ("pSparseMemoryRequirements" ::: Ptr VkSparseImageMemoryRequirements2) -> IO ()
#else
vkGetImageSparseMemoryRequirements2 :: DeviceCmds -> ("device" ::: VkDevice) -> ("pInfo" ::: Ptr VkImageSparseMemoryRequirementsInfo2) -> ("pSparseMemoryRequirementCount" ::: Ptr Word32) -> ("pSparseMemoryRequirements" ::: Ptr VkSparseImageMemoryRequirements2) -> IO ()
vkGetImageSparseMemoryRequirements2 deviceCmds = mkVkGetImageSparseMemoryRequirements2 (pVkGetImageSparseMemoryRequirements2 deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetImageSparseMemoryRequirements2
  :: FunPtr (("device" ::: VkDevice) -> ("pInfo" ::: Ptr VkImageSparseMemoryRequirementsInfo2) -> ("pSparseMemoryRequirementCount" ::: Ptr Word32) -> ("pSparseMemoryRequirements" ::: Ptr VkSparseImageMemoryRequirements2) -> IO ()) -> (("device" ::: VkDevice) -> ("pInfo" ::: Ptr VkImageSparseMemoryRequirementsInfo2) -> ("pSparseMemoryRequirementCount" ::: Ptr Word32) -> ("pSparseMemoryRequirements" ::: Ptr VkSparseImageMemoryRequirements2) -> IO ())
#endif

type FN_vkGetImageSparseMemoryRequirements2 = ("device" ::: VkDevice) -> ("pInfo" ::: Ptr VkImageSparseMemoryRequirementsInfo2) -> ("pSparseMemoryRequirementCount" ::: Ptr Word32) -> ("pSparseMemoryRequirements" ::: Ptr VkSparseImageMemoryRequirements2) -> IO ()
type PFN_vkGetImageSparseMemoryRequirements2 = FunPtr FN_vkGetImageSparseMemoryRequirements2

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2"
pattern VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2 :: VkStructureType
pattern VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2 = VkStructureType 1000146000

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2"
pattern VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2 :: VkStructureType
pattern VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2 = VkStructureType 1000146001

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2"
pattern VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2 :: VkStructureType
pattern VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2 = VkStructureType 1000146002

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2"
pattern VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2 :: VkStructureType
pattern VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2 = VkStructureType 1000146003

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2"
pattern VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2 :: VkStructureType
pattern VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2 = VkStructureType 1000146004
