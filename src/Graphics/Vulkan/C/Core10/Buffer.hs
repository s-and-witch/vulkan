{-# language Strict #-}
{-# language CPP #-}
{-# language GeneralizedNewtypeDeriving #-}
{-# language PatternSynonyms #-}
{-# language DuplicateRecordFields #-}
{-# language DataKinds #-}
{-# language TypeOperators #-}

module Graphics.Vulkan.C.Core10.Buffer
  ( VkBufferCreateFlagBits(..)
  , pattern VK_BUFFER_CREATE_SPARSE_BINDING_BIT
  , pattern VK_BUFFER_CREATE_SPARSE_RESIDENCY_BIT
  , pattern VK_BUFFER_CREATE_SPARSE_ALIASED_BIT
  , VkBufferCreateFlags
  , VkBufferCreateInfo(..)
  , VkBufferUsageFlagBits(..)
  , pattern VK_BUFFER_USAGE_TRANSFER_SRC_BIT
  , pattern VK_BUFFER_USAGE_TRANSFER_DST_BIT
  , pattern VK_BUFFER_USAGE_UNIFORM_TEXEL_BUFFER_BIT
  , pattern VK_BUFFER_USAGE_STORAGE_TEXEL_BUFFER_BIT
  , pattern VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT
  , pattern VK_BUFFER_USAGE_STORAGE_BUFFER_BIT
  , pattern VK_BUFFER_USAGE_INDEX_BUFFER_BIT
  , pattern VK_BUFFER_USAGE_VERTEX_BUFFER_BIT
  , pattern VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT
  , VkBufferUsageFlags
  , VkSharingMode(..)
  , pattern VK_SHARING_MODE_EXCLUSIVE
  , pattern VK_SHARING_MODE_CONCURRENT
  , FN_vkCreateBuffer
  , PFN_vkCreateBuffer
  , vkCreateBuffer
  , FN_vkDestroyBuffer
  , PFN_vkDestroyBuffer
  , vkDestroyBuffer
  ) where

import Data.Bits
  ( Bits
  , FiniteBits
  )
import Data.Int
  ( Int32
  )
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


import Graphics.Vulkan.C.Core10.Core
  ( VkResult(..)
  , VkStructureType(..)
  , Zero(..)
  , VkFlags
  , pattern VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO
  )
import Graphics.Vulkan.C.Core10.DeviceInitialization
  ( VkAllocationCallbacks(..)
  , VkDevice
  , VkDeviceSize
  )
import Graphics.Vulkan.C.Core10.MemoryManagement
  ( VkBuffer
  )
import Graphics.Vulkan.C.Dynamic
  ( DeviceCmds(..)
  )
import Graphics.Vulkan.NamedType
  ( (:::)
  )


-- ** VkBufferCreateFlagBits

-- | VkBufferCreateFlagBits - Bitmask specifying additional parameters of a
-- buffer
--
-- = Description
--
-- See
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#sparsememory-sparseresourcefeatures Sparse Resource Features>
-- and
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features Physical Device Features>
-- for details of the sparse memory features supported on a device.
--
-- = See Also
--
-- 'VkBufferCreateFlags'
newtype VkBufferCreateFlagBits = VkBufferCreateFlagBits VkFlags
  deriving (Eq, Ord, Storable, Bits, FiniteBits, Zero)

instance Show VkBufferCreateFlagBits where
  showsPrec _ VK_BUFFER_CREATE_SPARSE_BINDING_BIT = showString "VK_BUFFER_CREATE_SPARSE_BINDING_BIT"
  showsPrec _ VK_BUFFER_CREATE_SPARSE_RESIDENCY_BIT = showString "VK_BUFFER_CREATE_SPARSE_RESIDENCY_BIT"
  showsPrec _ VK_BUFFER_CREATE_SPARSE_ALIASED_BIT = showString "VK_BUFFER_CREATE_SPARSE_ALIASED_BIT"
  -- The following values are from extensions, the patterns themselves are exported from the extension modules
  showsPrec _ (VkBufferCreateFlagBits 0x00000008) = showString "VK_BUFFER_CREATE_PROTECTED_BIT"
  showsPrec _ (VkBufferCreateFlagBits 0x00000010) = showString "VK_BUFFER_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT_EXT"
  showsPrec p (VkBufferCreateFlagBits x) = showParen (p >= 11) (showString "VkBufferCreateFlagBits " . showsPrec 11 x)

instance Read VkBufferCreateFlagBits where
  readPrec = parens ( choose [ ("VK_BUFFER_CREATE_SPARSE_BINDING_BIT",   pure VK_BUFFER_CREATE_SPARSE_BINDING_BIT)
                             , ("VK_BUFFER_CREATE_SPARSE_RESIDENCY_BIT", pure VK_BUFFER_CREATE_SPARSE_RESIDENCY_BIT)
                             , ("VK_BUFFER_CREATE_SPARSE_ALIASED_BIT",   pure VK_BUFFER_CREATE_SPARSE_ALIASED_BIT)
                             , -- The following values are from extensions, the patterns themselves are exported from the extension modules
                               ("VK_BUFFER_CREATE_PROTECTED_BIT",                         pure (VkBufferCreateFlagBits 0x00000008))
                             , ("VK_BUFFER_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT_EXT", pure (VkBufferCreateFlagBits 0x00000010))
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkBufferCreateFlagBits")
                        v <- step readPrec
                        pure (VkBufferCreateFlagBits v)
                        )
                    )

-- | 'VK_BUFFER_CREATE_SPARSE_BINDING_BIT' specifies that the buffer will be
-- backed using sparse memory binding.
pattern VK_BUFFER_CREATE_SPARSE_BINDING_BIT :: VkBufferCreateFlagBits
pattern VK_BUFFER_CREATE_SPARSE_BINDING_BIT = VkBufferCreateFlagBits 0x00000001

-- | 'VK_BUFFER_CREATE_SPARSE_RESIDENCY_BIT' specifies that the buffer /can/
-- be partially backed using sparse memory binding. Buffers created with
-- this flag /must/ also be created with the
-- 'VK_BUFFER_CREATE_SPARSE_BINDING_BIT' flag.
pattern VK_BUFFER_CREATE_SPARSE_RESIDENCY_BIT :: VkBufferCreateFlagBits
pattern VK_BUFFER_CREATE_SPARSE_RESIDENCY_BIT = VkBufferCreateFlagBits 0x00000002

-- | 'VK_BUFFER_CREATE_SPARSE_ALIASED_BIT' specifies that the buffer will be
-- backed using sparse memory binding with memory ranges that might also
-- simultaneously be backing another buffer (or another portion of the same
-- buffer). Buffers created with this flag /must/ also be created with the
-- 'VK_BUFFER_CREATE_SPARSE_BINDING_BIT' flag.
pattern VK_BUFFER_CREATE_SPARSE_ALIASED_BIT :: VkBufferCreateFlagBits
pattern VK_BUFFER_CREATE_SPARSE_ALIASED_BIT = VkBufferCreateFlagBits 0x00000004

-- | VkBufferCreateFlags - Bitmask of VkBufferCreateFlagBits
--
-- = Description
--
-- 'VkBufferCreateFlags' is a bitmask type for setting a mask of zero or
-- more 'VkBufferCreateFlagBits'.
--
-- = See Also
--
-- 'VkBufferCreateFlagBits', 'VkBufferCreateInfo',
-- 'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_external_memory_capabilities.VkPhysicalDeviceExternalBufferInfo'
type VkBufferCreateFlags = VkBufferCreateFlagBits

-- | VkBufferCreateInfo - Structure specifying the parameters of a newly
-- created buffer object
--
-- == Valid Usage
--
-- -   @size@ /must/ be greater than @0@
--
-- -   If @sharingMode@ is 'VK_SHARING_MODE_CONCURRENT',
--     @pQueueFamilyIndices@ /must/ be a valid pointer to an array of
--     @queueFamilyIndexCount@ @uint32_t@ values
--
-- -   If @sharingMode@ is 'VK_SHARING_MODE_CONCURRENT',
--     @queueFamilyIndexCount@ /must/ be greater than @1@
--
-- -   If @sharingMode@ is 'VK_SHARING_MODE_CONCURRENT', each element of
--     @pQueueFamilyIndices@ /must/ be unique and /must/ be less than
--     @pQueueFamilyPropertyCount@ returned by
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.vkGetPhysicalDeviceQueueFamilyProperties'
--     for the @physicalDevice@ that was used to create @device@
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-sparseBinding sparse bindings>
--     feature is not enabled, @flags@ /must/ not contain
--     'VK_BUFFER_CREATE_SPARSE_BINDING_BIT'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-sparseResidencyBuffer sparse buffer residency>
--     feature is not enabled, @flags@ /must/ not contain
--     'VK_BUFFER_CREATE_SPARSE_RESIDENCY_BIT'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-sparseResidencyAliased sparse aliased residency>
--     feature is not enabled, @flags@ /must/ not contain
--     'VK_BUFFER_CREATE_SPARSE_ALIASED_BIT'
--
-- -   If @flags@ contains 'VK_BUFFER_CREATE_SPARSE_RESIDENCY_BIT' or
--     'VK_BUFFER_CREATE_SPARSE_ALIASED_BIT', it /must/ also contain
--     'VK_BUFFER_CREATE_SPARSE_BINDING_BIT'
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.C.Core10.Core.VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO'
--
-- -   Each @pNext@ member of any structure (including this one) in the
--     @pNext@ chain /must/ be either @NULL@ or a pointer to a valid
--     instance of
--     'Graphics.Vulkan.C.Extensions.VK_EXT_buffer_device_address.VkBufferDeviceAddressCreateInfoEXT',
--     'Graphics.Vulkan.C.Extensions.VK_NV_dedicated_allocation.VkDedicatedAllocationBufferCreateInfoNV',
--     or
--     'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_external_memory.VkExternalMemoryBufferCreateInfo'
--
-- -   Each @sType@ member in the @pNext@ chain /must/ be unique
--
-- -   @flags@ /must/ be a valid combination of 'VkBufferCreateFlagBits'
--     values
--
-- -   @usage@ /must/ be a valid combination of 'VkBufferUsageFlagBits'
--     values
--
-- -   @usage@ /must/ not be @0@
--
-- -   @sharingMode@ /must/ be a valid 'VkSharingMode' value
--
-- = See Also
--
-- 'VkBufferCreateFlags', 'VkBufferUsageFlags',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDeviceSize',
-- 'VkSharingMode', 'Graphics.Vulkan.C.Core10.Core.VkStructureType',
-- 'vkCreateBuffer'
data VkBufferCreateInfo = VkBufferCreateInfo
  { -- | @sType@ is the type of this structure.
  vkSType :: VkStructureType
  , -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
  vkPNext :: Ptr ()
  , -- | @flags@ is a bitmask of 'VkBufferCreateFlagBits' specifying additional
  -- parameters of the buffer.
  vkFlags :: VkBufferCreateFlags
  , -- | @size@ is the size in bytes of the buffer to be created.
  vkSize :: VkDeviceSize
  , -- | @usage@ is a bitmask of 'VkBufferUsageFlagBits' specifying allowed
  -- usages of the buffer.
  vkUsage :: VkBufferUsageFlags
  , -- | @sharingMode@ is a 'VkSharingMode' value specifying the sharing mode of
  -- the buffer when it will be accessed by multiple queue families.
  vkSharingMode :: VkSharingMode
  , -- | @queueFamilyIndexCount@ is the number of entries in the
  -- @pQueueFamilyIndices@ array.
  vkQueueFamilyIndexCount :: Word32
  , -- | @pQueueFamilyIndices@ is a list of queue families that will access this
  -- buffer (ignored if @sharingMode@ is not 'VK_SHARING_MODE_CONCURRENT').
  vkPQueueFamilyIndices :: Ptr Word32
  }
  deriving (Eq, Show)

instance Storable VkBufferCreateInfo where
  sizeOf ~_ = 56
  alignment ~_ = 8
  peek ptr = VkBufferCreateInfo <$> peek (ptr `plusPtr` 0)
                                <*> peek (ptr `plusPtr` 8)
                                <*> peek (ptr `plusPtr` 16)
                                <*> peek (ptr `plusPtr` 24)
                                <*> peek (ptr `plusPtr` 32)
                                <*> peek (ptr `plusPtr` 36)
                                <*> peek (ptr `plusPtr` 40)
                                <*> peek (ptr `plusPtr` 48)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkBufferCreateInfo))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkBufferCreateInfo))
                *> poke (ptr `plusPtr` 16) (vkFlags (poked :: VkBufferCreateInfo))
                *> poke (ptr `plusPtr` 24) (vkSize (poked :: VkBufferCreateInfo))
                *> poke (ptr `plusPtr` 32) (vkUsage (poked :: VkBufferCreateInfo))
                *> poke (ptr `plusPtr` 36) (vkSharingMode (poked :: VkBufferCreateInfo))
                *> poke (ptr `plusPtr` 40) (vkQueueFamilyIndexCount (poked :: VkBufferCreateInfo))
                *> poke (ptr `plusPtr` 48) (vkPQueueFamilyIndices (poked :: VkBufferCreateInfo))

instance Zero VkBufferCreateInfo where
  zero = VkBufferCreateInfo VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO
                            zero
                            zero
                            zero
                            zero
                            zero
                            zero
                            zero

-- ** VkBufferUsageFlagBits

-- | VkBufferUsageFlagBits - Bitmask specifying allowed usage of a buffer
--
-- = See Also
--
-- 'VkBufferUsageFlags'
newtype VkBufferUsageFlagBits = VkBufferUsageFlagBits VkFlags
  deriving (Eq, Ord, Storable, Bits, FiniteBits, Zero)

instance Show VkBufferUsageFlagBits where
  showsPrec _ VK_BUFFER_USAGE_TRANSFER_SRC_BIT = showString "VK_BUFFER_USAGE_TRANSFER_SRC_BIT"
  showsPrec _ VK_BUFFER_USAGE_TRANSFER_DST_BIT = showString "VK_BUFFER_USAGE_TRANSFER_DST_BIT"
  showsPrec _ VK_BUFFER_USAGE_UNIFORM_TEXEL_BUFFER_BIT = showString "VK_BUFFER_USAGE_UNIFORM_TEXEL_BUFFER_BIT"
  showsPrec _ VK_BUFFER_USAGE_STORAGE_TEXEL_BUFFER_BIT = showString "VK_BUFFER_USAGE_STORAGE_TEXEL_BUFFER_BIT"
  showsPrec _ VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT = showString "VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT"
  showsPrec _ VK_BUFFER_USAGE_STORAGE_BUFFER_BIT = showString "VK_BUFFER_USAGE_STORAGE_BUFFER_BIT"
  showsPrec _ VK_BUFFER_USAGE_INDEX_BUFFER_BIT = showString "VK_BUFFER_USAGE_INDEX_BUFFER_BIT"
  showsPrec _ VK_BUFFER_USAGE_VERTEX_BUFFER_BIT = showString "VK_BUFFER_USAGE_VERTEX_BUFFER_BIT"
  showsPrec _ VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT = showString "VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT"
  -- The following values are from extensions, the patterns themselves are exported from the extension modules
  showsPrec _ (VkBufferUsageFlagBits 0x00008000) = showString "VK_BUFFER_USAGE_RESERVED_15_BIT_KHR"
  showsPrec _ (VkBufferUsageFlagBits 0x00010000) = showString "VK_BUFFER_USAGE_RESERVED_16_BIT_KHR"
  showsPrec _ (VkBufferUsageFlagBits 0x00002000) = showString "VK_BUFFER_USAGE_RESERVED_13_BIT_KHR"
  showsPrec _ (VkBufferUsageFlagBits 0x00004000) = showString "VK_BUFFER_USAGE_RESERVED_14_BIT_KHR"
  showsPrec _ (VkBufferUsageFlagBits 0x00000800) = showString "VK_BUFFER_USAGE_TRANSFORM_FEEDBACK_BUFFER_BIT_EXT"
  showsPrec _ (VkBufferUsageFlagBits 0x00001000) = showString "VK_BUFFER_USAGE_TRANSFORM_FEEDBACK_COUNTER_BUFFER_BIT_EXT"
  showsPrec _ (VkBufferUsageFlagBits 0x00000200) = showString "VK_BUFFER_USAGE_CONDITIONAL_RENDERING_BIT_EXT"
  showsPrec _ (VkBufferUsageFlagBits 0x00000400) = showString "VK_BUFFER_USAGE_RAY_TRACING_BIT_NV"
  showsPrec _ (VkBufferUsageFlagBits 0x00020000) = showString "VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT_EXT"
  showsPrec p (VkBufferUsageFlagBits x) = showParen (p >= 11) (showString "VkBufferUsageFlagBits " . showsPrec 11 x)

instance Read VkBufferUsageFlagBits where
  readPrec = parens ( choose [ ("VK_BUFFER_USAGE_TRANSFER_SRC_BIT",         pure VK_BUFFER_USAGE_TRANSFER_SRC_BIT)
                             , ("VK_BUFFER_USAGE_TRANSFER_DST_BIT",         pure VK_BUFFER_USAGE_TRANSFER_DST_BIT)
                             , ("VK_BUFFER_USAGE_UNIFORM_TEXEL_BUFFER_BIT", pure VK_BUFFER_USAGE_UNIFORM_TEXEL_BUFFER_BIT)
                             , ("VK_BUFFER_USAGE_STORAGE_TEXEL_BUFFER_BIT", pure VK_BUFFER_USAGE_STORAGE_TEXEL_BUFFER_BIT)
                             , ("VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT",       pure VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT)
                             , ("VK_BUFFER_USAGE_STORAGE_BUFFER_BIT",       pure VK_BUFFER_USAGE_STORAGE_BUFFER_BIT)
                             , ("VK_BUFFER_USAGE_INDEX_BUFFER_BIT",         pure VK_BUFFER_USAGE_INDEX_BUFFER_BIT)
                             , ("VK_BUFFER_USAGE_VERTEX_BUFFER_BIT",        pure VK_BUFFER_USAGE_VERTEX_BUFFER_BIT)
                             , ("VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT",      pure VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT)
                             , -- The following values are from extensions, the patterns themselves are exported from the extension modules
                               ("VK_BUFFER_USAGE_RESERVED_15_BIT_KHR",                       pure (VkBufferUsageFlagBits 0x00008000))
                             , ("VK_BUFFER_USAGE_RESERVED_16_BIT_KHR",                       pure (VkBufferUsageFlagBits 0x00010000))
                             , ("VK_BUFFER_USAGE_RESERVED_13_BIT_KHR",                       pure (VkBufferUsageFlagBits 0x00002000))
                             , ("VK_BUFFER_USAGE_RESERVED_14_BIT_KHR",                       pure (VkBufferUsageFlagBits 0x00004000))
                             , ("VK_BUFFER_USAGE_TRANSFORM_FEEDBACK_BUFFER_BIT_EXT",         pure (VkBufferUsageFlagBits 0x00000800))
                             , ("VK_BUFFER_USAGE_TRANSFORM_FEEDBACK_COUNTER_BUFFER_BIT_EXT", pure (VkBufferUsageFlagBits 0x00001000))
                             , ("VK_BUFFER_USAGE_CONDITIONAL_RENDERING_BIT_EXT",             pure (VkBufferUsageFlagBits 0x00000200))
                             , ("VK_BUFFER_USAGE_RAY_TRACING_BIT_NV",                        pure (VkBufferUsageFlagBits 0x00000400))
                             , ("VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT_EXT",             pure (VkBufferUsageFlagBits 0x00020000))
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkBufferUsageFlagBits")
                        v <- step readPrec
                        pure (VkBufferUsageFlagBits v)
                        )
                    )

-- | 'VK_BUFFER_USAGE_TRANSFER_SRC_BIT' specifies that the buffer /can/ be
-- used as the source of a /transfer command/ (see the definition of
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages-transfer >).
pattern VK_BUFFER_USAGE_TRANSFER_SRC_BIT :: VkBufferUsageFlagBits
pattern VK_BUFFER_USAGE_TRANSFER_SRC_BIT = VkBufferUsageFlagBits 0x00000001

-- | 'VK_BUFFER_USAGE_TRANSFER_DST_BIT' specifies that the buffer /can/ be
-- used as the destination of a transfer command.
pattern VK_BUFFER_USAGE_TRANSFER_DST_BIT :: VkBufferUsageFlagBits
pattern VK_BUFFER_USAGE_TRANSFER_DST_BIT = VkBufferUsageFlagBits 0x00000002

-- | 'VK_BUFFER_USAGE_UNIFORM_TEXEL_BUFFER_BIT' specifies that the buffer
-- /can/ be used to create a
-- 'Graphics.Vulkan.C.Core10.BufferView.VkBufferView' suitable for
-- occupying a 'Graphics.Vulkan.C.Core10.DescriptorSet.VkDescriptorSet'
-- slot of type
-- 'Graphics.Vulkan.C.Core10.DescriptorSet.VK_DESCRIPTOR_TYPE_UNIFORM_TEXEL_BUFFER'.
pattern VK_BUFFER_USAGE_UNIFORM_TEXEL_BUFFER_BIT :: VkBufferUsageFlagBits
pattern VK_BUFFER_USAGE_UNIFORM_TEXEL_BUFFER_BIT = VkBufferUsageFlagBits 0x00000004

-- | 'VK_BUFFER_USAGE_STORAGE_TEXEL_BUFFER_BIT' specifies that the buffer
-- /can/ be used to create a
-- 'Graphics.Vulkan.C.Core10.BufferView.VkBufferView' suitable for
-- occupying a 'Graphics.Vulkan.C.Core10.DescriptorSet.VkDescriptorSet'
-- slot of type
-- 'Graphics.Vulkan.C.Core10.DescriptorSet.VK_DESCRIPTOR_TYPE_STORAGE_TEXEL_BUFFER'.
pattern VK_BUFFER_USAGE_STORAGE_TEXEL_BUFFER_BIT :: VkBufferUsageFlagBits
pattern VK_BUFFER_USAGE_STORAGE_TEXEL_BUFFER_BIT = VkBufferUsageFlagBits 0x00000008

-- | 'VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT' specifies that the buffer /can/ be
-- used in a
-- 'Graphics.Vulkan.C.Core10.DescriptorSet.VkDescriptorBufferInfo' suitable
-- for occupying a 'Graphics.Vulkan.C.Core10.DescriptorSet.VkDescriptorSet'
-- slot either of type
-- 'Graphics.Vulkan.C.Core10.DescriptorSet.VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER'
-- or
-- 'Graphics.Vulkan.C.Core10.DescriptorSet.VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC'.
pattern VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT :: VkBufferUsageFlagBits
pattern VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT = VkBufferUsageFlagBits 0x00000010

-- | 'VK_BUFFER_USAGE_STORAGE_BUFFER_BIT' specifies that the buffer /can/ be
-- used in a
-- 'Graphics.Vulkan.C.Core10.DescriptorSet.VkDescriptorBufferInfo' suitable
-- for occupying a 'Graphics.Vulkan.C.Core10.DescriptorSet.VkDescriptorSet'
-- slot either of type
-- 'Graphics.Vulkan.C.Core10.DescriptorSet.VK_DESCRIPTOR_TYPE_STORAGE_BUFFER'
-- or
-- 'Graphics.Vulkan.C.Core10.DescriptorSet.VK_DESCRIPTOR_TYPE_STORAGE_BUFFER_DYNAMIC'.
pattern VK_BUFFER_USAGE_STORAGE_BUFFER_BIT :: VkBufferUsageFlagBits
pattern VK_BUFFER_USAGE_STORAGE_BUFFER_BIT = VkBufferUsageFlagBits 0x00000020

-- | 'VK_BUFFER_USAGE_INDEX_BUFFER_BIT' specifies that the buffer is suitable
-- for passing as the @buffer@ parameter to
-- 'Graphics.Vulkan.C.Core10.CommandBufferBuilding.vkCmdBindIndexBuffer'.
pattern VK_BUFFER_USAGE_INDEX_BUFFER_BIT :: VkBufferUsageFlagBits
pattern VK_BUFFER_USAGE_INDEX_BUFFER_BIT = VkBufferUsageFlagBits 0x00000040

-- | 'VK_BUFFER_USAGE_VERTEX_BUFFER_BIT' specifies that the buffer is
-- suitable for passing as an element of the @pBuffers@ array to
-- 'Graphics.Vulkan.C.Core10.CommandBufferBuilding.vkCmdBindVertexBuffers'.
pattern VK_BUFFER_USAGE_VERTEX_BUFFER_BIT :: VkBufferUsageFlagBits
pattern VK_BUFFER_USAGE_VERTEX_BUFFER_BIT = VkBufferUsageFlagBits 0x00000080

-- | 'VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT' specifies that the buffer is
-- suitable for passing as the @buffer@ parameter to
-- 'Graphics.Vulkan.C.Core10.CommandBufferBuilding.vkCmdDrawIndirect',
-- 'Graphics.Vulkan.C.Core10.CommandBufferBuilding.vkCmdDrawIndexedIndirect',
-- or
-- 'Graphics.Vulkan.C.Core10.CommandBufferBuilding.vkCmdDispatchIndirect'.
pattern VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT :: VkBufferUsageFlagBits
pattern VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT = VkBufferUsageFlagBits 0x00000100

-- | VkBufferUsageFlags - Bitmask of VkBufferUsageFlagBits
--
-- = Description
--
-- 'VkBufferUsageFlags' is a bitmask type for setting a mask of zero or
-- more 'VkBufferUsageFlagBits'.
--
-- = See Also
--
-- 'VkBufferCreateInfo', 'VkBufferUsageFlagBits',
-- 'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_external_memory_capabilities.VkPhysicalDeviceExternalBufferInfo'
type VkBufferUsageFlags = VkBufferUsageFlagBits

-- ** VkSharingMode

-- | VkSharingMode - Buffer and image sharing modes
--
-- = Description
--
-- __Note__
--
-- 'VK_SHARING_MODE_CONCURRENT' /may/ result in lower performance access to
-- the buffer or image than 'VK_SHARING_MODE_EXCLUSIVE'.
--
-- Ranges of buffers and image subresources of image objects created using
-- 'VK_SHARING_MODE_EXCLUSIVE' /must/ only be accessed by queues in the
-- queue family that has /ownership/ of the resource. Upon creation, such
-- resources are not owned by any queue family; ownership is implicitly
-- acquired upon first use within a queue. Once a resource using
-- 'VK_SHARING_MODE_EXCLUSIVE' is owned by some queue family, the
-- application /must/ perform a
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-queue-transfers queue family ownership transfer>
-- to make the memory contents of a range or image subresource accessible
-- to a different queue family.
--
-- __Note__
--
-- Images still require a
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#resources-image-layouts layout transition>
-- from 'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_UNDEFINED' or
-- 'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_PREINITIALIZED' before
-- being used on the first queue.
--
-- A queue family /can/ take ownership of an image subresource or buffer
-- range of a resource created with 'VK_SHARING_MODE_EXCLUSIVE', without an
-- ownership transfer, in the same way as for a resource that was just
-- created; however, taking ownership in this way has the effect that the
-- contents of the image subresource or buffer range are undefined.
--
-- Ranges of buffers and image subresources of image objects created using
-- 'VK_SHARING_MODE_CONCURRENT' /must/ only be accessed by queues from the
-- queue families specified through the @queueFamilyIndexCount@ and
-- @pQueueFamilyIndices@ members of the corresponding create info
-- structures.
--
-- = See Also
--
-- 'VkBufferCreateInfo',
-- 'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_image_drm_format_modifier.VkPhysicalDeviceImageDrmFormatModifierInfoEXT',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.VkSwapchainCreateInfoKHR'
newtype VkSharingMode = VkSharingMode Int32
  deriving (Eq, Ord, Storable, Zero)

instance Show VkSharingMode where
  showsPrec _ VK_SHARING_MODE_EXCLUSIVE = showString "VK_SHARING_MODE_EXCLUSIVE"
  showsPrec _ VK_SHARING_MODE_CONCURRENT = showString "VK_SHARING_MODE_CONCURRENT"
  showsPrec p (VkSharingMode x) = showParen (p >= 11) (showString "VkSharingMode " . showsPrec 11 x)

instance Read VkSharingMode where
  readPrec = parens ( choose [ ("VK_SHARING_MODE_EXCLUSIVE",  pure VK_SHARING_MODE_EXCLUSIVE)
                             , ("VK_SHARING_MODE_CONCURRENT", pure VK_SHARING_MODE_CONCURRENT)
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkSharingMode")
                        v <- step readPrec
                        pure (VkSharingMode v)
                        )
                    )

-- | 'VK_SHARING_MODE_EXCLUSIVE' specifies that access to any range or image
-- subresource of the object will be exclusive to a single queue family at
-- a time.
pattern VK_SHARING_MODE_EXCLUSIVE :: VkSharingMode
pattern VK_SHARING_MODE_EXCLUSIVE = VkSharingMode 0

-- | 'VK_SHARING_MODE_CONCURRENT' specifies that concurrent access to any
-- range or image subresource of the object from multiple queue families is
-- supported.
pattern VK_SHARING_MODE_CONCURRENT :: VkSharingMode
pattern VK_SHARING_MODE_CONCURRENT = VkSharingMode 1

-- | vkCreateBuffer - Create a new buffer object
--
-- = Parameters
--
-- -   @device@ is the logical device that creates the buffer object.
--
-- -   @pCreateInfo@ is a pointer to an instance of the
--     'VkBufferCreateInfo' structure containing parameters affecting
--     creation of the buffer.
--
-- -   @pAllocator@ controls host memory allocation as described in the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#memory-allocation Memory Allocation>
--     chapter.
--
-- -   @pBuffer@ points to a
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer' handle in which
--     the resulting buffer object is returned.
--
-- == Valid Usage
--
-- -   If the @flags@ member of @pCreateInfo@ includes
--     'VK_BUFFER_CREATE_SPARSE_BINDING_BIT', creating this
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer' /must/ not
--     cause the total required sparse memory for all currently valid
--     sparse resources on the device to exceed
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceLimits'::@sparseAddressSpaceSize@
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' handle
--
-- -   @pCreateInfo@ /must/ be a valid pointer to a valid
--     'VkBufferCreateInfo' structure
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     structure
--
-- -   @pBuffer@ /must/ be a valid pointer to a
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer' handle
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
--     -   'Graphics.Vulkan.C.Extensions.VK_EXT_buffer_device_address.VK_ERROR_INVALID_DEVICE_ADDRESS_EXT'
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks',
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer',
-- 'VkBufferCreateInfo',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCreateBuffer" vkCreateBuffer :: ("device" ::: VkDevice) -> ("pCreateInfo" ::: Ptr VkBufferCreateInfo) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pBuffer" ::: Ptr VkBuffer) -> IO VkResult
#else
vkCreateBuffer :: DeviceCmds -> ("device" ::: VkDevice) -> ("pCreateInfo" ::: Ptr VkBufferCreateInfo) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pBuffer" ::: Ptr VkBuffer) -> IO VkResult
vkCreateBuffer deviceCmds = mkVkCreateBuffer (pVkCreateBuffer deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCreateBuffer
  :: FunPtr (("device" ::: VkDevice) -> ("pCreateInfo" ::: Ptr VkBufferCreateInfo) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pBuffer" ::: Ptr VkBuffer) -> IO VkResult) -> (("device" ::: VkDevice) -> ("pCreateInfo" ::: Ptr VkBufferCreateInfo) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pBuffer" ::: Ptr VkBuffer) -> IO VkResult)
#endif

type FN_vkCreateBuffer = ("device" ::: VkDevice) -> ("pCreateInfo" ::: Ptr VkBufferCreateInfo) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pBuffer" ::: Ptr VkBuffer) -> IO VkResult
type PFN_vkCreateBuffer = FunPtr FN_vkCreateBuffer

-- | vkDestroyBuffer - Destroy a buffer object
--
-- = Parameters
--
-- -   @device@ is the logical device that destroys the buffer.
--
-- -   @buffer@ is the buffer to destroy.
--
-- -   @pAllocator@ controls host memory allocation as described in the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#memory-allocation Memory Allocation>
--     chapter.
--
-- == Valid Usage
--
-- -   All submitted commands that refer to @buffer@, either directly or
--     via a 'Graphics.Vulkan.C.Core10.BufferView.VkBufferView', /must/
--     have completed execution
--
-- -   If
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     were provided when @buffer@ was created, a compatible set of
--     callbacks /must/ be provided here
--
-- -   If no
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     were provided when @buffer@ was created, @pAllocator@ /must/ be
--     @NULL@
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' handle
--
-- -   If @buffer@ is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE', @buffer@ /must/
--     be a valid 'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer'
--     handle
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     structure
--
-- -   If @buffer@ is a valid handle, it /must/ have been created,
--     allocated, or retrieved from @device@
--
-- == Host Synchronization
--
-- -   Host access to @buffer@ /must/ be externally synchronized
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks',
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkDestroyBuffer" vkDestroyBuffer :: ("device" ::: VkDevice) -> ("buffer" ::: VkBuffer) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()
#else
vkDestroyBuffer :: DeviceCmds -> ("device" ::: VkDevice) -> ("buffer" ::: VkBuffer) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()
vkDestroyBuffer deviceCmds = mkVkDestroyBuffer (pVkDestroyBuffer deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkDestroyBuffer
  :: FunPtr (("device" ::: VkDevice) -> ("buffer" ::: VkBuffer) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()) -> (("device" ::: VkDevice) -> ("buffer" ::: VkBuffer) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ())
#endif

type FN_vkDestroyBuffer = ("device" ::: VkDevice) -> ("buffer" ::: VkBuffer) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()
type PFN_vkDestroyBuffer = FunPtr FN_vkDestroyBuffer
