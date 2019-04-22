{-# language Strict #-}
{-# language CPP #-}
{-# language DuplicateRecordFields #-}
{-# language DataKinds #-}
{-# language LambdaCase #-}
{-# language GeneralizedNewtypeDeriving #-}
{-# language PatternSynonyms #-}
{-# language TypeOperators #-}

module Graphics.Vulkan.C.Core10.CommandBufferBuilding
  ( VkBufferCopy(..)
  , VkBufferImageCopy(..)
  , VkBufferMemoryBarrier(..)
  , VkClearAttachment(..)
  , VkClearColorValue(..)
  , VkClearDepthStencilValue(..)
  , VkClearRect(..)
  , VkClearValue(..)
  , VkDispatchIndirectCommand(..)
  , VkDrawIndexedIndirectCommand(..)
  , VkDrawIndirectCommand(..)
  , VkImageBlit(..)
  , VkImageCopy(..)
  , VkImageMemoryBarrier(..)
  , VkImageResolve(..)
  , VkImageSubresourceLayers(..)
  , VkIndexType(..)
  , pattern VK_INDEX_TYPE_UINT16
  , pattern VK_INDEX_TYPE_UINT32
  , VkMemoryBarrier(..)
  , VkRenderPassBeginInfo(..)
  , VkStencilFaceFlagBits(..)
  , pattern VK_STENCIL_FACE_FRONT_BIT
  , pattern VK_STENCIL_FACE_BACK_BIT
  , pattern VK_STENCIL_FRONT_AND_BACK
  , VkStencilFaceFlags
  , VkSubpassContents(..)
  , pattern VK_SUBPASS_CONTENTS_INLINE
  , pattern VK_SUBPASS_CONTENTS_SECONDARY_COMMAND_BUFFERS
  , FN_vkCmdBeginQuery
  , PFN_vkCmdBeginQuery
  , vkCmdBeginQuery
  , FN_vkCmdBeginRenderPass
  , PFN_vkCmdBeginRenderPass
  , vkCmdBeginRenderPass
  , FN_vkCmdBindDescriptorSets
  , PFN_vkCmdBindDescriptorSets
  , vkCmdBindDescriptorSets
  , FN_vkCmdBindIndexBuffer
  , PFN_vkCmdBindIndexBuffer
  , vkCmdBindIndexBuffer
  , FN_vkCmdBindPipeline
  , PFN_vkCmdBindPipeline
  , vkCmdBindPipeline
  , FN_vkCmdBindVertexBuffers
  , PFN_vkCmdBindVertexBuffers
  , vkCmdBindVertexBuffers
  , FN_vkCmdBlitImage
  , PFN_vkCmdBlitImage
  , vkCmdBlitImage
  , FN_vkCmdClearAttachments
  , PFN_vkCmdClearAttachments
  , vkCmdClearAttachments
  , FN_vkCmdClearColorImage
  , PFN_vkCmdClearColorImage
  , vkCmdClearColorImage
  , FN_vkCmdClearDepthStencilImage
  , PFN_vkCmdClearDepthStencilImage
  , vkCmdClearDepthStencilImage
  , FN_vkCmdCopyBuffer
  , PFN_vkCmdCopyBuffer
  , vkCmdCopyBuffer
  , FN_vkCmdCopyBufferToImage
  , PFN_vkCmdCopyBufferToImage
  , vkCmdCopyBufferToImage
  , FN_vkCmdCopyImage
  , PFN_vkCmdCopyImage
  , vkCmdCopyImage
  , FN_vkCmdCopyImageToBuffer
  , PFN_vkCmdCopyImageToBuffer
  , vkCmdCopyImageToBuffer
  , FN_vkCmdCopyQueryPoolResults
  , PFN_vkCmdCopyQueryPoolResults
  , vkCmdCopyQueryPoolResults
  , FN_vkCmdDispatch
  , PFN_vkCmdDispatch
  , vkCmdDispatch
  , FN_vkCmdDispatchIndirect
  , PFN_vkCmdDispatchIndirect
  , vkCmdDispatchIndirect
  , FN_vkCmdDraw
  , PFN_vkCmdDraw
  , vkCmdDraw
  , FN_vkCmdDrawIndexed
  , PFN_vkCmdDrawIndexed
  , vkCmdDrawIndexed
  , FN_vkCmdDrawIndexedIndirect
  , PFN_vkCmdDrawIndexedIndirect
  , vkCmdDrawIndexedIndirect
  , FN_vkCmdDrawIndirect
  , PFN_vkCmdDrawIndirect
  , vkCmdDrawIndirect
  , FN_vkCmdEndQuery
  , PFN_vkCmdEndQuery
  , vkCmdEndQuery
  , FN_vkCmdEndRenderPass
  , PFN_vkCmdEndRenderPass
  , vkCmdEndRenderPass
  , FN_vkCmdExecuteCommands
  , PFN_vkCmdExecuteCommands
  , vkCmdExecuteCommands
  , FN_vkCmdFillBuffer
  , PFN_vkCmdFillBuffer
  , vkCmdFillBuffer
  , FN_vkCmdNextSubpass
  , PFN_vkCmdNextSubpass
  , vkCmdNextSubpass
  , FN_vkCmdPipelineBarrier
  , PFN_vkCmdPipelineBarrier
  , vkCmdPipelineBarrier
  , FN_vkCmdPushConstants
  , PFN_vkCmdPushConstants
  , vkCmdPushConstants
  , FN_vkCmdResetEvent
  , PFN_vkCmdResetEvent
  , vkCmdResetEvent
  , FN_vkCmdResetQueryPool
  , PFN_vkCmdResetQueryPool
  , vkCmdResetQueryPool
  , FN_vkCmdResolveImage
  , PFN_vkCmdResolveImage
  , vkCmdResolveImage
  , FN_vkCmdSetBlendConstants
  , PFN_vkCmdSetBlendConstants
  , vkCmdSetBlendConstants
  , FN_vkCmdSetDepthBias
  , PFN_vkCmdSetDepthBias
  , vkCmdSetDepthBias
  , FN_vkCmdSetDepthBounds
  , PFN_vkCmdSetDepthBounds
  , vkCmdSetDepthBounds
  , FN_vkCmdSetEvent
  , PFN_vkCmdSetEvent
  , vkCmdSetEvent
  , FN_vkCmdSetLineWidth
  , PFN_vkCmdSetLineWidth
  , vkCmdSetLineWidth
  , FN_vkCmdSetScissor
  , PFN_vkCmdSetScissor
  , vkCmdSetScissor
  , FN_vkCmdSetStencilCompareMask
  , PFN_vkCmdSetStencilCompareMask
  , vkCmdSetStencilCompareMask
  , FN_vkCmdSetStencilReference
  , PFN_vkCmdSetStencilReference
  , vkCmdSetStencilReference
  , FN_vkCmdSetStencilWriteMask
  , PFN_vkCmdSetStencilWriteMask
  , vkCmdSetStencilWriteMask
  , FN_vkCmdSetViewport
  , PFN_vkCmdSetViewport
  , vkCmdSetViewport
  , FN_vkCmdUpdateBuffer
  , PFN_vkCmdUpdateBuffer
  , vkCmdUpdateBuffer
  , FN_vkCmdWaitEvents
  , PFN_vkCmdWaitEvents
  , vkCmdWaitEvents
  , FN_vkCmdWriteTimestamp
  , PFN_vkCmdWriteTimestamp
  , vkCmdWriteTimestamp
  ) where

import Data.Bits
  ( Bits
  , FiniteBits
  )
import Data.Int
  ( Int32
  )
import Data.Vector.Storable.Sized
  ( Vector
  )
import Data.Word
  ( Word32
  )
import Foreign.C.Types
  ( CFloat(..)
  )
import Foreign.Ptr
  ( FunPtr
  , Ptr
  , castPtr
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


import Graphics.Vulkan.C.Core10.CommandBuffer
  ( VkQueryControlFlagBits(..)
  , VkQueryControlFlags
  )
import Graphics.Vulkan.C.Core10.Core
  ( VkStructureType(..)
  , Zero(..)
  , VkFlags
  , pattern VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER
  , pattern VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER
  , pattern VK_STRUCTURE_TYPE_MEMORY_BARRIER
  , pattern VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO
  )
import Graphics.Vulkan.C.Core10.DescriptorSet
  ( VkDescriptorSet
  )
import Graphics.Vulkan.C.Core10.DeviceInitialization
  ( VkExtent3D(..)
  , VkDeviceSize
  )
import Graphics.Vulkan.C.Core10.Event
  ( VkEvent
  )
import Graphics.Vulkan.C.Core10.Image
  ( VkImageLayout(..)
  )
import Graphics.Vulkan.C.Core10.ImageView
  ( VkImageSubresourceRange(..)
  )
import Graphics.Vulkan.C.Core10.MemoryManagement
  ( VkBuffer
  , VkImage
  )
import Graphics.Vulkan.C.Core10.Pass
  ( VkDependencyFlagBits(..)
  , VkPipelineBindPoint(..)
  , VkAccessFlags
  , VkDependencyFlags
  , VkFramebuffer
  )
import Graphics.Vulkan.C.Core10.Pipeline
  ( VkRect2D(..)
  , VkShaderStageFlagBits(..)
  , VkViewport(..)
  , VkPipeline
  , VkPipelineLayout
  , VkRenderPass
  )
import Graphics.Vulkan.C.Core10.PipelineLayout
  ( VkShaderStageFlags
  )
import Graphics.Vulkan.C.Core10.Query
  ( VkQueryResultFlagBits(..)
  , VkQueryPool
  , VkQueryResultFlags
  )
import Graphics.Vulkan.C.Core10.Queue
  ( VkPipelineStageFlagBits(..)
  , VkCommandBuffer
  , VkPipelineStageFlags
  )
import Graphics.Vulkan.C.Core10.Sampler
  ( VkFilter(..)
  )
import Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement
  ( VkOffset3D(..)
  , VkImageAspectFlags
  )
import Graphics.Vulkan.C.Dynamic
  ( DeviceCmds(..)
  )
import Graphics.Vulkan.NamedType
  ( (:::)
  )


-- | VkBufferCopy - Structure specifying a buffer copy operation
--
-- == Valid Usage
--
-- -   The @size@ /must/ be greater than @0@
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDeviceSize',
-- 'vkCmdCopyBuffer'
data VkBufferCopy = VkBufferCopy
  { -- | @srcOffset@ is the starting offset in bytes from the start of
  -- @srcBuffer@.
  vkSrcOffset :: VkDeviceSize
  , -- | @dstOffset@ is the starting offset in bytes from the start of
  -- @dstBuffer@.
  vkDstOffset :: VkDeviceSize
  , -- | @size@ is the number of bytes to copy.
  vkSize :: VkDeviceSize
  }
  deriving (Eq, Show)

instance Storable VkBufferCopy where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkBufferCopy <$> peek (ptr `plusPtr` 0)
                          <*> peek (ptr `plusPtr` 8)
                          <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSrcOffset (poked :: VkBufferCopy))
                *> poke (ptr `plusPtr` 8) (vkDstOffset (poked :: VkBufferCopy))
                *> poke (ptr `plusPtr` 16) (vkSize (poked :: VkBufferCopy))

instance Zero VkBufferCopy where
  zero = VkBufferCopy zero
                      zero
                      zero

-- | VkBufferImageCopy - Structure specifying a buffer image copy operation
--
-- = Description
--
-- When copying to or from a depth or stencil aspect, the data in buffer
-- memory uses a layout that is a (mostly) tightly packed representation of
-- the depth or stencil data. Specifically:
--
-- -   data copied to or from the stencil aspect of any depth\/stencil
--     format is tightly packed with one
--     'Graphics.Vulkan.C.Core10.Core.VK_FORMAT_S8_UINT' value per texel.
--
-- -   data copied to or from the depth aspect of a
--     'Graphics.Vulkan.C.Core10.Core.VK_FORMAT_D16_UNORM' or
--     'Graphics.Vulkan.C.Core10.Core.VK_FORMAT_D16_UNORM_S8_UINT' format
--     is tightly packed with one
--     'Graphics.Vulkan.C.Core10.Core.VK_FORMAT_D16_UNORM' value per texel.
--
-- -   data copied to or from the depth aspect of a
--     'Graphics.Vulkan.C.Core10.Core.VK_FORMAT_D32_SFLOAT' or
--     'Graphics.Vulkan.C.Core10.Core.VK_FORMAT_D32_SFLOAT_S8_UINT' format
--     is tightly packed with one
--     'Graphics.Vulkan.C.Core10.Core.VK_FORMAT_D32_SFLOAT' value per
--     texel.
--
-- -   data copied to or from the depth aspect of a
--     'Graphics.Vulkan.C.Core10.Core.VK_FORMAT_X8_D24_UNORM_PACK32' or
--     'Graphics.Vulkan.C.Core10.Core.VK_FORMAT_D24_UNORM_S8_UINT' format
--     is packed with one 32-bit word per texel with the D24 value in the
--     LSBs of the word, and undefined values in the eight MSBs.
--
-- __Note__
--
-- To copy both the depth and stencil aspects of a depth\/stencil format,
-- two entries in @pRegions@ /can/ be used, where one specifies the depth
-- aspect in @imageSubresource@, and the other specifies the stencil
-- aspect.
--
-- Because depth or stencil aspect buffer to image copies /may/ require
-- format conversions on some implementations, they are not supported on
-- queues that do not support graphics.
--
-- When copying to a depth aspect, the data in buffer memory /must/ be in
-- the range [0,1], or the resulting values are undefined.
--
-- Copies are done layer by layer starting with image layer
-- @baseArrayLayer@ member of @imageSubresource@. @layerCount@ layers are
-- copied from the source image or to the destination image.
--
-- == Valid Usage
--
-- -   If the calling command’s
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' parameter’s
--     format is not a depth\/stencil format, then @bufferOffset@ /must/ be
--     a multiple of the format’s texel block size.
--
-- -   @bufferOffset@ /must/ be a multiple of @4@
--
-- -   @bufferRowLength@ /must/ be @0@, or greater than or equal to the
--     @width@ member of @imageExtent@
--
-- -   @bufferImageHeight@ /must/ be @0@, or greater than or equal to the
--     @height@ member of @imageExtent@
--
-- -   @imageOffset.x@ and (@imageExtent.width@ + @imageOffset.x@) /must/
--     both be greater than or equal to @0@ and less than or equal to the
--     image subresource width
--
-- -   @imageOffset.y@ and (imageExtent.height + @imageOffset.y@) /must/
--     both be greater than or equal to @0@ and less than or equal to the
--     image subresource height
--
-- -   If the calling command’s @srcImage@ ('vkCmdCopyImageToBuffer') or
--     @dstImage@ ('vkCmdCopyBufferToImage') is of type
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_1D',
--     then @imageOffset.y@ /must/ be @0@ and @imageExtent.height@ /must/
--     be @1@.
--
-- -   @imageOffset.z@ and (imageExtent.depth + @imageOffset.z@) /must/
--     both be greater than or equal to @0@ and less than or equal to the
--     image subresource depth
--
-- -   If the calling command’s @srcImage@ ('vkCmdCopyImageToBuffer') or
--     @dstImage@ ('vkCmdCopyBufferToImage') is of type
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_1D' or
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_2D',
--     then @imageOffset.z@ /must/ be @0@ and @imageExtent.depth@ /must/ be
--     @1@
--
-- -   If the calling command’s
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' parameter is a
--     compressed image, @bufferRowLength@ /must/ be a multiple of the
--     compressed texel block width
--
-- -   If the calling command’s
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' parameter is a
--     compressed image, @bufferImageHeight@ /must/ be a multiple of the
--     compressed texel block height
--
-- -   If the calling command’s
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' parameter is a
--     compressed image, all members of @imageOffset@ /must/ be a multiple
--     of the corresponding dimensions of the compressed texel block
--
-- -   If the calling command’s
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' parameter is a
--     compressed image, @bufferOffset@ /must/ be a multiple of the
--     compressed texel block size in bytes
--
-- -   If the calling command’s
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' parameter is a
--     compressed image, @imageExtent.width@ /must/ be a multiple of the
--     compressed texel block width or (@imageExtent.width@ +
--     @imageOffset.x@) /must/ equal the image subresource width
--
-- -   If the calling command’s
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' parameter is a
--     compressed image, @imageExtent.height@ /must/ be a multiple of the
--     compressed texel block height or (@imageExtent.height@ +
--     @imageOffset.y@) /must/ equal the image subresource height
--
-- -   If the calling command’s
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' parameter is a
--     compressed image, @imageExtent.depth@ /must/ be a multiple of the
--     compressed texel block depth or (@imageExtent.depth@ +
--     @imageOffset.z@) /must/ equal the image subresource depth
--
-- -   The @aspectMask@ member of @imageSubresource@ /must/ specify aspects
--     present in the calling command’s
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' parameter
--
-- -   The @aspectMask@ member of @imageSubresource@ /must/ only have a
--     single bit set
--
-- -   If the calling command’s
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' parameter is of
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkImageType'
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_3D',
--     the @baseArrayLayer@ and @layerCount@ members of @imageSubresource@
--     /must/ be @0@ and @1@, respectively
--
-- -   When copying to the depth aspect of an image subresource, the data
--     in the source buffer /must/ be in the range [0,1]
--
-- == Valid Usage (Implicit)
--
-- -   @imageSubresource@ /must/ be a valid 'VkImageSubresourceLayers'
--     structure
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDeviceSize',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkExtent3D',
-- 'VkImageSubresourceLayers',
-- 'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VkOffset3D',
-- 'vkCmdCopyBufferToImage', 'vkCmdCopyImageToBuffer'
data VkBufferImageCopy = VkBufferImageCopy
  { -- | @bufferOffset@ is the offset in bytes from the start of the buffer
  -- object where the image data is copied from or to.
  vkBufferOffset :: VkDeviceSize
  , -- | @bufferRowLength@ and @bufferImageHeight@ specify in texels a subregion
  -- of a larger two- or three-dimensional image in buffer memory, and
  -- control the addressing calculations. If either of these values is zero,
  -- that aspect of the buffer memory is considered to be tightly packed
  -- according to the @imageExtent@.
  vkBufferRowLength :: Word32
  , -- No documentation found for Nested "VkBufferImageCopy" "bufferImageHeight"
  vkBufferImageHeight :: Word32
  , -- | @imageSubresource@ is a 'VkImageSubresourceLayers' used to specify the
  -- specific image subresources of the image used for the source or
  -- destination image data.
  vkImageSubresource :: VkImageSubresourceLayers
  , -- | @imageOffset@ selects the initial @x@, @y@, @z@ offsets in texels of the
  -- sub-region of the source or destination image data.
  vkImageOffset :: VkOffset3D
  , -- | @imageExtent@ is the size in texels of the image to copy in @width@,
  -- @height@ and @depth@.
  vkImageExtent :: VkExtent3D
  }
  deriving (Eq, Show)

instance Storable VkBufferImageCopy where
  sizeOf ~_ = 56
  alignment ~_ = 8
  peek ptr = VkBufferImageCopy <$> peek (ptr `plusPtr` 0)
                               <*> peek (ptr `plusPtr` 8)
                               <*> peek (ptr `plusPtr` 12)
                               <*> peek (ptr `plusPtr` 16)
                               <*> peek (ptr `plusPtr` 32)
                               <*> peek (ptr `plusPtr` 44)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkBufferOffset (poked :: VkBufferImageCopy))
                *> poke (ptr `plusPtr` 8) (vkBufferRowLength (poked :: VkBufferImageCopy))
                *> poke (ptr `plusPtr` 12) (vkBufferImageHeight (poked :: VkBufferImageCopy))
                *> poke (ptr `plusPtr` 16) (vkImageSubresource (poked :: VkBufferImageCopy))
                *> poke (ptr `plusPtr` 32) (vkImageOffset (poked :: VkBufferImageCopy))
                *> poke (ptr `plusPtr` 44) (vkImageExtent (poked :: VkBufferImageCopy))

instance Zero VkBufferImageCopy where
  zero = VkBufferImageCopy zero
                           zero
                           zero
                           zero
                           zero
                           zero

-- | VkBufferMemoryBarrier - Structure specifying a buffer memory barrier
--
-- = Description
--
-- The first
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-dependencies-access-scopes access scope>
-- is limited to access to memory through the specified buffer range, via
-- access types in the
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-access-masks source access mask>
-- specified by @srcAccessMask@. If @srcAccessMask@ includes
-- 'Graphics.Vulkan.C.Core10.Pass.VK_ACCESS_HOST_WRITE_BIT', memory writes
-- performed by that access type are also made visible, as that access type
-- is not performed through a resource.
--
-- The second
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-dependencies-access-scopes access scope>
-- is limited to access to memory through the specified buffer range, via
-- access types in the
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-access-masks destination access mask>.
-- specified by @dstAccessMask@. If @dstAccessMask@ includes
-- 'Graphics.Vulkan.C.Core10.Pass.VK_ACCESS_HOST_WRITE_BIT' or
-- 'Graphics.Vulkan.C.Core10.Pass.VK_ACCESS_HOST_READ_BIT', available
-- memory writes are also made visible to accesses of those types, as those
-- access types are not performed through a resource.
--
-- If @srcQueueFamilyIndex@ is not equal to @dstQueueFamilyIndex@, and
-- @srcQueueFamilyIndex@ is equal to the current queue family, then the
-- memory barrier defines a
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-queue-transfers-release queue family release operation>
-- for the specified buffer range, and the second access scope includes no
-- access, as if @dstAccessMask@ was @0@.
--
-- If @dstQueueFamilyIndex@ is not equal to @srcQueueFamilyIndex@, and
-- @dstQueueFamilyIndex@ is equal to the current queue family, then the
-- memory barrier defines a
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-queue-transfers-acquire queue family acquire operation>
-- for the specified buffer range, and the first access scope includes no
-- access, as if @srcAccessMask@ was @0@.
--
-- == Valid Usage
--
-- -   @offset@ /must/ be less than the size of @buffer@
--
-- -   If @size@ is not equal to
--     'Graphics.Vulkan.C.Core10.Constants.VK_WHOLE_SIZE', @size@ /must/ be
--     greater than @0@
--
-- -   If @size@ is not equal to
--     'Graphics.Vulkan.C.Core10.Constants.VK_WHOLE_SIZE', @size@ /must/ be
--     less than or equal to than the size of @buffer@ minus @offset@
--
-- -   If @buffer@ was created with a sharing mode of
--     'Graphics.Vulkan.C.Core10.Buffer.VK_SHARING_MODE_CONCURRENT',
--     @srcQueueFamilyIndex@ and @dstQueueFamilyIndex@ /must/ both be
--     'Graphics.Vulkan.C.Core10.Constants.VK_QUEUE_FAMILY_IGNORED'
--
-- -   If @buffer@ was created with a sharing mode of
--     'Graphics.Vulkan.C.Core10.Buffer.VK_SHARING_MODE_EXCLUSIVE',
--     @srcQueueFamilyIndex@ and @dstQueueFamilyIndex@ /must/ either both
--     be 'Graphics.Vulkan.C.Core10.Constants.VK_QUEUE_FAMILY_IGNORED', or
--     both be a valid queue family (see
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#devsandqueues-queueprops>)
--
-- -   If @buffer@ was created with a sharing mode of
--     'Graphics.Vulkan.C.Core10.Buffer.VK_SHARING_MODE_EXCLUSIVE', and
--     @srcQueueFamilyIndex@ and @dstQueueFamilyIndex@ are not
--     'Graphics.Vulkan.C.Core10.Constants.VK_QUEUE_FAMILY_IGNORED', at
--     least one of them /must/ be the same as the family of the queue that
--     will execute this barrier
--
-- -   If @buffer@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.C.Core10.Core.VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER'
--
-- -   @pNext@ /must/ be @NULL@
--
-- -   @srcAccessMask@ /must/ be a valid combination of
--     'Graphics.Vulkan.C.Core10.Pass.VkAccessFlagBits' values
--
-- -   @dstAccessMask@ /must/ be a valid combination of
--     'Graphics.Vulkan.C.Core10.Pass.VkAccessFlagBits' values
--
-- -   @buffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer' handle
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Pass.VkAccessFlags',
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDeviceSize',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType', 'vkCmdPipelineBarrier',
-- 'vkCmdWaitEvents'
data VkBufferMemoryBarrier = VkBufferMemoryBarrier
  { -- | @sType@ is the type of this structure.
  vkSType :: VkStructureType
  , -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
  vkPNext :: Ptr ()
  , -- | @srcAccessMask@ is a bitmask of
  -- 'Graphics.Vulkan.C.Core10.Pass.VkAccessFlagBits' specifying a
  -- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-access-masks source access mask>.
  vkSrcAccessMask :: VkAccessFlags
  , -- | @dstAccessMask@ is a bitmask of
  -- 'Graphics.Vulkan.C.Core10.Pass.VkAccessFlagBits' specifying a
  -- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-access-masks destination access mask>.
  vkDstAccessMask :: VkAccessFlags
  , -- | @srcQueueFamilyIndex@ is the source queue family for a
  -- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-queue-transfers queue family ownership transfer>.
  vkSrcQueueFamilyIndex :: Word32
  , -- | @dstQueueFamilyIndex@ is the destination queue family for a
  -- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-queue-transfers queue family ownership transfer>.
  vkDstQueueFamilyIndex :: Word32
  , -- | @buffer@ is a handle to the buffer whose backing memory is affected by
  -- the barrier.
  vkBuffer :: VkBuffer
  , -- | @offset@ is an offset in bytes into the backing memory for @buffer@;
  -- this is relative to the base offset as bound to the buffer (see
  -- 'Graphics.Vulkan.C.Core10.MemoryManagement.vkBindBufferMemory').
  vkOffset :: VkDeviceSize
  , -- | @size@ is a size in bytes of the affected area of backing memory for
  -- @buffer@, or 'Graphics.Vulkan.C.Core10.Constants.VK_WHOLE_SIZE' to use
  -- the range from @offset@ to the end of the buffer.
  vkSize :: VkDeviceSize
  }
  deriving (Eq, Show)

instance Storable VkBufferMemoryBarrier where
  sizeOf ~_ = 56
  alignment ~_ = 8
  peek ptr = VkBufferMemoryBarrier <$> peek (ptr `plusPtr` 0)
                                   <*> peek (ptr `plusPtr` 8)
                                   <*> peek (ptr `plusPtr` 16)
                                   <*> peek (ptr `plusPtr` 20)
                                   <*> peek (ptr `plusPtr` 24)
                                   <*> peek (ptr `plusPtr` 28)
                                   <*> peek (ptr `plusPtr` 32)
                                   <*> peek (ptr `plusPtr` 40)
                                   <*> peek (ptr `plusPtr` 48)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkBufferMemoryBarrier))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkBufferMemoryBarrier))
                *> poke (ptr `plusPtr` 16) (vkSrcAccessMask (poked :: VkBufferMemoryBarrier))
                *> poke (ptr `plusPtr` 20) (vkDstAccessMask (poked :: VkBufferMemoryBarrier))
                *> poke (ptr `plusPtr` 24) (vkSrcQueueFamilyIndex (poked :: VkBufferMemoryBarrier))
                *> poke (ptr `plusPtr` 28) (vkDstQueueFamilyIndex (poked :: VkBufferMemoryBarrier))
                *> poke (ptr `plusPtr` 32) (vkBuffer (poked :: VkBufferMemoryBarrier))
                *> poke (ptr `plusPtr` 40) (vkOffset (poked :: VkBufferMemoryBarrier))
                *> poke (ptr `plusPtr` 48) (vkSize (poked :: VkBufferMemoryBarrier))

instance Zero VkBufferMemoryBarrier where
  zero = VkBufferMemoryBarrier VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER
                               zero
                               zero
                               zero
                               zero
                               zero
                               zero
                               zero
                               zero

-- | VkClearAttachment - Structure specifying a clear attachment
--
-- = Description
--
-- No memory barriers are needed between 'vkCmdClearAttachments' and
-- preceding or subsequent draw or attachment clear commands in the same
-- subpass.
--
-- The 'vkCmdClearAttachments' command is not affected by the bound
-- pipeline state.
--
-- Attachments /can/ also be cleared at the beginning of a render pass
-- instance by setting @loadOp@ (or @stencilLoadOp@) of
-- 'Graphics.Vulkan.C.Core10.Pass.VkAttachmentDescription' to
-- 'Graphics.Vulkan.C.Core10.Pass.VK_ATTACHMENT_LOAD_OP_CLEAR', as
-- described for 'Graphics.Vulkan.C.Core10.Pass.vkCreateRenderPass'.
--
-- == Valid Usage
--
-- -   If @aspectMask@ includes
--     'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VK_IMAGE_ASPECT_COLOR_BIT',
--     it /must/ not include
--     'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VK_IMAGE_ASPECT_DEPTH_BIT'
--     or
--     'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VK_IMAGE_ASPECT_STENCIL_BIT'
--
-- -   @aspectMask@ /must/ not include
--     'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VK_IMAGE_ASPECT_METADATA_BIT'
--
-- -   @clearValue@ /must/ be a valid 'VkClearValue' union
--
-- == Valid Usage (Implicit)
--
-- -   @aspectMask@ /must/ be a valid combination of
--     'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VkImageAspectFlagBits'
--     values
--
-- -   @aspectMask@ /must/ not be @0@
--
-- = See Also
--
-- 'VkClearValue',
-- 'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VkImageAspectFlags',
-- 'vkCmdClearAttachments'
data VkClearAttachment = VkClearAttachment
  { -- | @aspectMask@ is a mask selecting the color, depth and\/or stencil
  -- aspects of the attachment to be cleared.
  vkAspectMask :: VkImageAspectFlags
  , -- | @colorAttachment@ is only meaningful if
  -- 'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VK_IMAGE_ASPECT_COLOR_BIT'
  -- is set in @aspectMask@, in which case it is an index to the
  -- @pColorAttachments@ array in the
  -- 'Graphics.Vulkan.C.Core10.Pass.VkSubpassDescription' structure of the
  -- current subpass which selects the color attachment to clear.
  vkColorAttachment :: Word32
  , -- | @clearValue@ is the color or depth\/stencil value to clear the
  -- attachment to, as described in
  -- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#clears-values Clear Values>
  -- below.
  vkClearValue :: VkClearValue
  }
  deriving (Eq, Show)

instance Storable VkClearAttachment where
  sizeOf ~_ = 24
  alignment ~_ = 4
  peek ptr = VkClearAttachment <$> peek (ptr `plusPtr` 0)
                               <*> peek (ptr `plusPtr` 4)
                               <*> peek (ptr `plusPtr` 8)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkAspectMask (poked :: VkClearAttachment))
                *> poke (ptr `plusPtr` 4) (vkColorAttachment (poked :: VkClearAttachment))
                *> poke (ptr `plusPtr` 8) (vkClearValue (poked :: VkClearAttachment))

instance Zero VkClearAttachment where
  zero = VkClearAttachment zero
                           zero
                           zero

-- | VkClearColorValue - Structure specifying a clear color value
--
-- = Description
--
-- The four array elements of the clear color map to R, G, B, and A
-- components of image formats, in order.
--
-- If the image has more than one sample, the same value is written to all
-- samples for any pixels being cleared.
--
-- = See Also
--
-- 'VkClearValue', 'vkCmdClearColorImage'
data VkClearColorValue
  = -- No documentation found for Nested "VkClearColorValue" "VkFloat32"
  VkFloat32 (Vector 4 CFloat)
  | -- No documentation found for Nested "VkClearColorValue" "VkInt32"
  VkInt32 (Vector 4 Int32)
  | -- No documentation found for Nested "VkClearColorValue" "VkUint32"
  VkUint32 (Vector 4 Word32)
  deriving (Eq, Show)

-- | _Note_: peek is undefined as we wouldn't know which constructor to use
instance Storable VkClearColorValue where
  sizeOf ~_ = 16
  alignment ~_ = 4
  peek _   = error "peek @VkClearColorValue"
  poke ptr = \case
    VkFloat32 e -> poke (castPtr ptr) e
    VkInt32 e -> poke (castPtr ptr) e
    VkUint32 e -> poke (castPtr ptr) e

instance Zero VkClearColorValue where
  zero = VkFloat32 zero

-- | VkClearDepthStencilValue - Structure specifying a clear depth stencil
-- value
--
-- == Valid Usage
--
-- = See Also
--
-- 'VkClearValue', 'vkCmdClearDepthStencilImage'
data VkClearDepthStencilValue = VkClearDepthStencilValue
  { -- | @depth@ /must/ be between @0.0@ and @1.0@, inclusive
  vkDepth :: CFloat
  , -- | @stencil@ is the clear value for the stencil aspect of the
  -- depth\/stencil attachment. It is a 32-bit integer value which is
  -- converted to the attachment’s format by taking the appropriate number of
  -- LSBs.
  vkStencil :: Word32
  }
  deriving (Eq, Show)

instance Storable VkClearDepthStencilValue where
  sizeOf ~_ = 8
  alignment ~_ = 4
  peek ptr = VkClearDepthStencilValue <$> peek (ptr `plusPtr` 0)
                                      <*> peek (ptr `plusPtr` 4)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkDepth (poked :: VkClearDepthStencilValue))
                *> poke (ptr `plusPtr` 4) (vkStencil (poked :: VkClearDepthStencilValue))

instance Zero VkClearDepthStencilValue where
  zero = VkClearDepthStencilValue zero
                                  zero

-- | VkClearRect - Structure specifying a clear rectangle
--
-- = Description
--
-- The layers [@baseArrayLayer@, @baseArrayLayer@ + @layerCount@) counting
-- from the base layer of the attachment image view are cleared.
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Pipeline.VkRect2D', 'vkCmdClearAttachments'
data VkClearRect = VkClearRect
  { -- | @rect@ is the two-dimensional region to be cleared.
  vkRect :: VkRect2D
  , -- | @baseArrayLayer@ is the first layer to be cleared.
  vkBaseArrayLayer :: Word32
  , -- | @layerCount@ is the number of layers to clear.
  vkLayerCount :: Word32
  }
  deriving (Eq, Show)

instance Storable VkClearRect where
  sizeOf ~_ = 24
  alignment ~_ = 4
  peek ptr = VkClearRect <$> peek (ptr `plusPtr` 0)
                         <*> peek (ptr `plusPtr` 16)
                         <*> peek (ptr `plusPtr` 20)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkRect (poked :: VkClearRect))
                *> poke (ptr `plusPtr` 16) (vkBaseArrayLayer (poked :: VkClearRect))
                *> poke (ptr `plusPtr` 20) (vkLayerCount (poked :: VkClearRect))

instance Zero VkClearRect where
  zero = VkClearRect zero
                     zero
                     zero

-- | VkClearValue - Structure specifying a clear value
--
-- = Description
--
-- This union is used where part of the API requires either color or
-- depth\/stencil clear values, depending on the attachment, and defines
-- the initial clear values in the 'VkRenderPassBeginInfo' structure.
--
-- = See Also
--
-- 'VkClearAttachment', 'VkClearColorValue', 'VkClearDepthStencilValue',
-- 'VkRenderPassBeginInfo'
data VkClearValue
  = -- No documentation found for Nested "VkClearValue" "VkColor"
  VkColor VkClearColorValue
  | -- No documentation found for Nested "VkClearValue" "VkDepthStencil"
  VkDepthStencil VkClearDepthStencilValue
  deriving (Eq, Show)

-- | _Note_: peek is undefined as we wouldn't know which constructor to use
instance Storable VkClearValue where
  sizeOf ~_ = 16
  alignment ~_ = 4
  peek _   = error "peek @VkClearValue"
  poke ptr = \case
    VkColor e -> poke (castPtr ptr) e
    VkDepthStencil e -> poke (castPtr ptr) e

instance Zero VkClearValue where
  zero = VkColor zero

-- | VkDispatchIndirectCommand - Structure specifying a dispatch indirect
-- command
--
-- = Description
--
-- The members of 'VkDispatchIndirectCommand' have the same meaning as the
-- corresponding parameters of 'vkCmdDispatch'.
--
-- == Valid Usage
--
-- = See Also
--
-- 'vkCmdDispatchIndirect'
data VkDispatchIndirectCommand = VkDispatchIndirectCommand
  { -- | @x@ /must/ be less than or equal to
  -- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceLimits'::@maxComputeWorkGroupCount@[0]
  vkX :: Word32
  , -- | @y@ /must/ be less than or equal to
  -- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceLimits'::@maxComputeWorkGroupCount@[1]
  vkY :: Word32
  , -- | @z@ /must/ be less than or equal to
  -- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceLimits'::@maxComputeWorkGroupCount@[2]
  vkZ :: Word32
  }
  deriving (Eq, Show)

instance Storable VkDispatchIndirectCommand where
  sizeOf ~_ = 12
  alignment ~_ = 4
  peek ptr = VkDispatchIndirectCommand <$> peek (ptr `plusPtr` 0)
                                       <*> peek (ptr `plusPtr` 4)
                                       <*> peek (ptr `plusPtr` 8)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkX (poked :: VkDispatchIndirectCommand))
                *> poke (ptr `plusPtr` 4) (vkY (poked :: VkDispatchIndirectCommand))
                *> poke (ptr `plusPtr` 8) (vkZ (poked :: VkDispatchIndirectCommand))

instance Zero VkDispatchIndirectCommand where
  zero = VkDispatchIndirectCommand zero
                                   zero
                                   zero

-- | VkDrawIndexedIndirectCommand - Structure specifying a draw indexed
-- indirect command
--
-- = Description
--
-- The members of 'VkDrawIndexedIndirectCommand' have the same meaning as
-- the similarly named parameters of 'vkCmdDrawIndexed'.
--
-- == Valid Usage
--
-- -   For a given vertex buffer binding, any attribute data fetched /must/
--     be entirely contained within the corresponding vertex buffer
--     binding, as described in
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#fxvertex-input>
--
-- -   (@indexSize@ * (@firstIndex@ + @indexCount@) + @offset@) /must/ be
--     less than or equal to the size of the bound index buffer, with
--     @indexSize@ being based on the type specified by @indexType@, where
--     the index buffer, @indexType@, and @offset@ are specified via
--     'vkCmdBindIndexBuffer'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-drawIndirectFirstInstance drawIndirectFirstInstance>
--     feature is not enabled, @firstInstance@ /must/ be @0@
--
-- = See Also
--
-- 'vkCmdDrawIndexedIndirect'
data VkDrawIndexedIndirectCommand = VkDrawIndexedIndirectCommand
  { -- | @indexCount@ is the number of vertices to draw.
  vkIndexCount :: Word32
  , -- | @instanceCount@ is the number of instances to draw.
  vkInstanceCount :: Word32
  , -- | @firstIndex@ is the base index within the index buffer.
  vkFirstIndex :: Word32
  , -- | @vertexOffset@ is the value added to the vertex index before indexing
  -- into the vertex buffer.
  vkVertexOffset :: Int32
  , -- | @firstInstance@ is the instance ID of the first instance to draw.
  vkFirstInstance :: Word32
  }
  deriving (Eq, Show)

instance Storable VkDrawIndexedIndirectCommand where
  sizeOf ~_ = 20
  alignment ~_ = 4
  peek ptr = VkDrawIndexedIndirectCommand <$> peek (ptr `plusPtr` 0)
                                          <*> peek (ptr `plusPtr` 4)
                                          <*> peek (ptr `plusPtr` 8)
                                          <*> peek (ptr `plusPtr` 12)
                                          <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkIndexCount (poked :: VkDrawIndexedIndirectCommand))
                *> poke (ptr `plusPtr` 4) (vkInstanceCount (poked :: VkDrawIndexedIndirectCommand))
                *> poke (ptr `plusPtr` 8) (vkFirstIndex (poked :: VkDrawIndexedIndirectCommand))
                *> poke (ptr `plusPtr` 12) (vkVertexOffset (poked :: VkDrawIndexedIndirectCommand))
                *> poke (ptr `plusPtr` 16) (vkFirstInstance (poked :: VkDrawIndexedIndirectCommand))

instance Zero VkDrawIndexedIndirectCommand where
  zero = VkDrawIndexedIndirectCommand zero
                                      zero
                                      zero
                                      zero
                                      zero

-- | VkDrawIndirectCommand - Structure specifying a draw indirect command
--
-- = Description
--
-- The members of 'VkDrawIndirectCommand' have the same meaning as the
-- similarly named parameters of 'vkCmdDraw'.
--
-- == Valid Usage
--
-- -   For a given vertex buffer binding, any attribute data fetched /must/
--     be entirely contained within the corresponding vertex buffer
--     binding, as described in
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#fxvertex-input>
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-drawIndirectFirstInstance drawIndirectFirstInstance>
--     feature is not enabled, @firstInstance@ /must/ be @0@
--
-- = See Also
--
-- 'vkCmdDrawIndirect'
data VkDrawIndirectCommand = VkDrawIndirectCommand
  { -- | @vertexCount@ is the number of vertices to draw.
  vkVertexCount :: Word32
  , -- | @instanceCount@ is the number of instances to draw.
  vkInstanceCount :: Word32
  , -- | @firstVertex@ is the index of the first vertex to draw.
  vkFirstVertex :: Word32
  , -- | @firstInstance@ is the instance ID of the first instance to draw.
  vkFirstInstance :: Word32
  }
  deriving (Eq, Show)

instance Storable VkDrawIndirectCommand where
  sizeOf ~_ = 16
  alignment ~_ = 4
  peek ptr = VkDrawIndirectCommand <$> peek (ptr `plusPtr` 0)
                                   <*> peek (ptr `plusPtr` 4)
                                   <*> peek (ptr `plusPtr` 8)
                                   <*> peek (ptr `plusPtr` 12)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkVertexCount (poked :: VkDrawIndirectCommand))
                *> poke (ptr `plusPtr` 4) (vkInstanceCount (poked :: VkDrawIndirectCommand))
                *> poke (ptr `plusPtr` 8) (vkFirstVertex (poked :: VkDrawIndirectCommand))
                *> poke (ptr `plusPtr` 12) (vkFirstInstance (poked :: VkDrawIndirectCommand))

instance Zero VkDrawIndirectCommand where
  zero = VkDrawIndirectCommand zero
                               zero
                               zero
                               zero

-- | VkImageBlit - Structure specifying an image blit operation
--
-- = Description
--
-- For each element of the @pRegions@ array, a blit operation is performed
-- the specified source and destination regions.
--
-- == Valid Usage
--
-- -   The @aspectMask@ member of @srcSubresource@ and @dstSubresource@
--     /must/ match
--
-- -   The @layerCount@ member of @srcSubresource@ and @dstSubresource@
--     /must/ match
--
-- -   If either of the calling command’s @srcImage@ or @dstImage@
--     parameters are of
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkImageType'
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_3D',
--     the @baseArrayLayer@ and @layerCount@ members of both
--     @srcSubresource@ and @dstSubresource@ /must/ be @0@ and @1@,
--     respectively
--
-- -   The @aspectMask@ member of @srcSubresource@ /must/ specify aspects
--     present in the calling command’s @srcImage@
--
-- -   The @aspectMask@ member of @dstSubresource@ /must/ specify aspects
--     present in the calling command’s @dstImage@
--
-- -   @srcOffset@[0].@x@ and @srcOffset@[1].@x@ /must/ both be greater
--     than or equal to @0@ and less than or equal to the source image
--     subresource width
--
-- -   @srcOffset@[0].@y@ and @srcOffset@[1].@y@ /must/ both be greater
--     than or equal to @0@ and less than or equal to the source image
--     subresource height
--
-- -   If the calling command’s @srcImage@ is of type
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_1D',
--     then @srcOffset@[0].y /must/ be @0@ and @srcOffset@[1].y /must/ be
--     @1@.
--
-- -   @srcOffset@[0].@z@ and @srcOffset@[1].@z@ /must/ both be greater
--     than or equal to @0@ and less than or equal to the source image
--     subresource depth
--
-- -   If the calling command’s @srcImage@ is of type
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_1D' or
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_2D',
--     then @srcOffset@[0].z /must/ be @0@ and @srcOffset@[1].z /must/ be
--     @1@.
--
-- -   @dstOffset@[0].@x@ and @dstOffset@[1].@x@ /must/ both be greater
--     than or equal to @0@ and less than or equal to the destination image
--     subresource width
--
-- -   @dstOffset@[0].@y@ and @dstOffset@[1].@y@ /must/ both be greater
--     than or equal to @0@ and less than or equal to the destination image
--     subresource height
--
-- -   If the calling command’s @dstImage@ is of type
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_1D',
--     then @dstOffset@[0].y /must/ be @0@ and @dstOffset@[1].y /must/ be
--     @1@.
--
-- -   @dstOffset@[0].@z@ and @dstOffset@[1].@z@ /must/ both be greater
--     than or equal to @0@ and less than or equal to the destination image
--     subresource depth
--
-- -   If the calling command’s @dstImage@ is of type
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_1D' or
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_2D',
--     then @dstOffset@[0].z /must/ be @0@ and @dstOffset@[1].z /must/ be
--     @1@.
--
-- == Valid Usage (Implicit)
--
-- -   @srcSubresource@ /must/ be a valid 'VkImageSubresourceLayers'
--     structure
--
-- -   @dstSubresource@ /must/ be a valid 'VkImageSubresourceLayers'
--     structure
--
-- = See Also
--
-- 'VkImageSubresourceLayers',
-- 'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VkOffset3D',
-- 'vkCmdBlitImage'
data VkImageBlit = VkImageBlit
  { -- | @srcSubresource@ is the subresource to blit from.
  vkSrcSubresource :: VkImageSubresourceLayers
  , -- | @srcOffsets@ is an array of two
  -- 'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VkOffset3D'
  -- structures specifying the bounds of the source region within
  -- @srcSubresource@.
  vkSrcOffsets :: Vector 2 VkOffset3D
  , -- | @dstSubresource@ is the subresource to blit into.
  vkDstSubresource :: VkImageSubresourceLayers
  , -- | @dstOffsets@ is an array of two
  -- 'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VkOffset3D'
  -- structures specifying the bounds of the destination region within
  -- @dstSubresource@.
  vkDstOffsets :: Vector 2 VkOffset3D
  }
  deriving (Eq, Show)

instance Storable VkImageBlit where
  sizeOf ~_ = 80
  alignment ~_ = 4
  peek ptr = VkImageBlit <$> peek (ptr `plusPtr` 0)
                         <*> peek (ptr `plusPtr` 16)
                         <*> peek (ptr `plusPtr` 40)
                         <*> peek (ptr `plusPtr` 56)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSrcSubresource (poked :: VkImageBlit))
                *> poke (ptr `plusPtr` 16) (vkSrcOffsets (poked :: VkImageBlit))
                *> poke (ptr `plusPtr` 40) (vkDstSubresource (poked :: VkImageBlit))
                *> poke (ptr `plusPtr` 56) (vkDstOffsets (poked :: VkImageBlit))

instance Zero VkImageBlit where
  zero = VkImageBlit zero
                     zero
                     zero
                     zero

-- | VkImageCopy - Structure specifying an image copy operation
--
-- = Description
--
-- Copies are done layer by layer starting with @baseArrayLayer@ member of
-- @srcSubresource@ for the source and @dstSubresource@ for the
-- destination. @layerCount@ layers are copied to the destination image.
--
-- == Valid Usage
--
-- -   The @aspectMask@ member of @srcSubresource@ and @dstSubresource@
--     /must/ match
--
-- -   The @layerCount@ member of @srcSubresource@ and @dstSubresource@
--     /must/ match
--
-- -   If either of the calling command’s @srcImage@ or @dstImage@
--     parameters are of
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkImageType'
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_3D',
--     the @baseArrayLayer@ and @layerCount@ members of both
--     @srcSubresource@ and @dstSubresource@ /must/ be @0@ and @1@,
--     respectively
--
-- -   The @aspectMask@ member of @srcSubresource@ /must/ specify aspects
--     present in the calling command’s @srcImage@
--
-- -   The @aspectMask@ member of @dstSubresource@ /must/ specify aspects
--     present in the calling command’s @dstImage@
--
-- -   @srcOffset.x@ and (@extent.width@ + @srcOffset.x@) /must/ both be
--     greater than or equal to @0@ and less than or equal to the source
--     image subresource width
--
-- -   @srcOffset.y@ and (@extent.height@ + @srcOffset.y@) /must/ both be
--     greater than or equal to @0@ and less than or equal to the source
--     image subresource height
--
-- -   If the calling command’s @srcImage@ is of type
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_1D',
--     then @srcOffset.y@ /must/ be @0@ and @extent.height@ /must/ be @1@.
--
-- -   @srcOffset.z@ and (@extent.depth@ + @srcOffset.z@) /must/ both be
--     greater than or equal to @0@ and less than or equal to the source
--     image subresource depth
--
-- -   If the calling command’s @srcImage@ is of type
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_1D',
--     then @srcOffset.z@ /must/ be @0@ and @extent.depth@ /must/ be @1@.
--
-- -   If the calling command’s @dstImage@ is of type
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_1D',
--     then @dstOffset.z@ /must/ be @0@ and @extent.depth@ /must/ be @1@.
--
-- -   If the calling command’s @srcImage@ is of type
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_2D',
--     then @srcOffset.z@ /must/ be @0@.
--
-- -   If the calling command’s @dstImage@ is of type
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_2D',
--     then @dstOffset.z@ /must/ be @0@.
--
-- -   If the calling command’s @srcImage@ or @dstImage@ is of type
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_2D',
--     then @extent.depth@ /must/ be @1@.
--
-- -   @dstOffset.x@ and (@extent.width@ + @dstOffset.x@) /must/ both be
--     greater than or equal to @0@ and less than or equal to the
--     destination image subresource width
--
-- -   @dstOffset.y@ and (@extent.height@ + @dstOffset.y@) /must/ both be
--     greater than or equal to @0@ and less than or equal to the
--     destination image subresource height
--
-- -   If the calling command’s @dstImage@ is of type
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_1D',
--     then @dstOffset.y@ /must/ be @0@ and @extent.height@ /must/ be @1@.
--
-- -   @dstOffset.z@ and (@extent.depth@ + @dstOffset.z@) /must/ both be
--     greater than or equal to @0@ and less than or equal to the
--     destination image subresource depth
--
-- -   If the calling command’s @srcImage@ is a compressed image, all
--     members of @srcOffset@ /must/ be a multiple of the corresponding
--     dimensions of the compressed texel block
--
-- -   If the calling command’s @srcImage@ is a compressed image,
--     @extent.width@ /must/ be a multiple of the compressed texel block
--     width or (@extent.width@ + @srcOffset.x@) /must/ equal the source
--     image subresource width
--
-- -   If the calling command’s @srcImage@ is a compressed image,
--     @extent.height@ /must/ be a multiple of the compressed texel block
--     height or (@extent.height@ + @srcOffset.y@) /must/ equal the source
--     image subresource height
--
-- -   If the calling command’s @srcImage@ is a compressed image,
--     @extent.depth@ /must/ be a multiple of the compressed texel block
--     depth or (@extent.depth@ + @srcOffset.z@) /must/ equal the source
--     image subresource depth
--
-- -   If the calling command’s @dstImage@ is a compressed format image,
--     all members of @dstOffset@ /must/ be a multiple of the corresponding
--     dimensions of the compressed texel block
--
-- -   If the calling command’s @dstImage@ is a compressed format image,
--     @extent.width@ /must/ be a multiple of the compressed texel block
--     width or (@extent.width@ + @dstOffset.x@) /must/ equal the
--     destination image subresource width
--
-- -   If the calling command’s @dstImage@ is a compressed format image,
--     @extent.height@ /must/ be a multiple of the compressed texel block
--     height or (@extent.height@ + @dstOffset.y@) /must/ equal the
--     destination image subresource height
--
-- -   If the calling command’s @dstImage@ is a compressed format image,
--     @extent.depth@ /must/ be a multiple of the compressed texel block
--     depth or (@extent.depth@ + @dstOffset.z@) /must/ equal the
--     destination image subresource depth
--
-- == Valid Usage (Implicit)
--
-- -   @srcSubresource@ /must/ be a valid 'VkImageSubresourceLayers'
--     structure
--
-- -   @dstSubresource@ /must/ be a valid 'VkImageSubresourceLayers'
--     structure
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkExtent3D',
-- 'VkImageSubresourceLayers',
-- 'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VkOffset3D',
-- 'vkCmdCopyImage'
data VkImageCopy = VkImageCopy
  { -- | @srcSubresource@ and @dstSubresource@ are 'VkImageSubresourceLayers'
  -- structures specifying the image subresources of the images used for the
  -- source and destination image data, respectively.
  vkSrcSubresource :: VkImageSubresourceLayers
  , -- | @srcOffset@ and @dstOffset@ select the initial @x@, @y@, and @z@ offsets
  -- in texels of the sub-regions of the source and destination image data.
  vkSrcOffset :: VkOffset3D
  , -- No documentation found for Nested "VkImageCopy" "dstSubresource"
  vkDstSubresource :: VkImageSubresourceLayers
  , -- No documentation found for Nested "VkImageCopy" "dstOffset"
  vkDstOffset :: VkOffset3D
  , -- | @extent@ is the size in texels of the image to copy in @width@, @height@
  -- and @depth@.
  vkExtent :: VkExtent3D
  }
  deriving (Eq, Show)

instance Storable VkImageCopy where
  sizeOf ~_ = 68
  alignment ~_ = 4
  peek ptr = VkImageCopy <$> peek (ptr `plusPtr` 0)
                         <*> peek (ptr `plusPtr` 16)
                         <*> peek (ptr `plusPtr` 28)
                         <*> peek (ptr `plusPtr` 44)
                         <*> peek (ptr `plusPtr` 56)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSrcSubresource (poked :: VkImageCopy))
                *> poke (ptr `plusPtr` 16) (vkSrcOffset (poked :: VkImageCopy))
                *> poke (ptr `plusPtr` 28) (vkDstSubresource (poked :: VkImageCopy))
                *> poke (ptr `plusPtr` 44) (vkDstOffset (poked :: VkImageCopy))
                *> poke (ptr `plusPtr` 56) (vkExtent (poked :: VkImageCopy))

instance Zero VkImageCopy where
  zero = VkImageCopy zero
                     zero
                     zero
                     zero
                     zero

-- | VkImageMemoryBarrier - Structure specifying the parameters of an image
-- memory barrier
--
-- = Description
--
-- The first
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-dependencies-access-scopes access scope>
-- is limited to access to memory through the specified image subresource
-- range, via access types in the
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-access-masks source access mask>
-- specified by @srcAccessMask@. If @srcAccessMask@ includes
-- 'Graphics.Vulkan.C.Core10.Pass.VK_ACCESS_HOST_WRITE_BIT', memory writes
-- performed by that access type are also made visible, as that access type
-- is not performed through a resource.
--
-- The second
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-dependencies-access-scopes access scope>
-- is limited to access to memory through the specified image subresource
-- range, via access types in the
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-access-masks destination access mask>
-- specified by @dstAccessMask@. If @dstAccessMask@ includes
-- 'Graphics.Vulkan.C.Core10.Pass.VK_ACCESS_HOST_WRITE_BIT' or
-- 'Graphics.Vulkan.C.Core10.Pass.VK_ACCESS_HOST_READ_BIT', available
-- memory writes are also made visible to accesses of those types, as those
-- access types are not performed through a resource.
--
-- If @srcQueueFamilyIndex@ is not equal to @dstQueueFamilyIndex@, and
-- @srcQueueFamilyIndex@ is equal to the current queue family, then the
-- memory barrier defines a
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-queue-transfers-release queue family release operation>
-- for the specified image subresource range, and the second access scope
-- includes no access, as if @dstAccessMask@ was @0@.
--
-- If @dstQueueFamilyIndex@ is not equal to @srcQueueFamilyIndex@, and
-- @dstQueueFamilyIndex@ is equal to the current queue family, then the
-- memory barrier defines a
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-queue-transfers-acquire queue family acquire operation>
-- for the specified image subresource range, and the first access scope
-- includes no access, as if @srcAccessMask@ was @0@.
--
-- If @oldLayout@ is not equal to @newLayout@, then the memory barrier
-- defines an
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-image-layout-transitions image layout transition>
-- for the specified image subresource range.
--
-- Layout transitions that are performed via image memory barriers execute
-- in their entirety in
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-submission-order submission order>,
-- relative to other image layout transitions submitted to the same queue,
-- including those performed by
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#renderpass render passes>.
-- In effect there is an implicit execution dependency from each such
-- layout transition to all layout transitions previously submitted to the
-- same queue.
--
-- == Valid Usage
--
-- -   @oldLayout@ /must/ be
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_UNDEFINED' or the
--     current layout of the image subresources affected by the barrier
--
-- -   @newLayout@ /must/ not be
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_UNDEFINED' or
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_PREINITIALIZED'
--
-- -   If @image@ was created with a sharing mode of
--     'Graphics.Vulkan.C.Core10.Buffer.VK_SHARING_MODE_CONCURRENT',
--     @srcQueueFamilyIndex@ and @dstQueueFamilyIndex@ /must/ both be
--     'Graphics.Vulkan.C.Core10.Constants.VK_QUEUE_FAMILY_IGNORED'
--
-- -   If @image@ was created with a sharing mode of
--     'Graphics.Vulkan.C.Core10.Buffer.VK_SHARING_MODE_EXCLUSIVE',
--     @srcQueueFamilyIndex@ and @dstQueueFamilyIndex@ /must/ either both
--     be 'Graphics.Vulkan.C.Core10.Constants.VK_QUEUE_FAMILY_IGNORED', or
--     both be a valid queue family (see
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#devsandqueues-queueprops>).
--
-- -   If @image@ was created with a sharing mode of
--     'Graphics.Vulkan.C.Core10.Buffer.VK_SHARING_MODE_EXCLUSIVE', and
--     @srcQueueFamilyIndex@ and @dstQueueFamilyIndex@ are not
--     'Graphics.Vulkan.C.Core10.Constants.VK_QUEUE_FAMILY_IGNORED', at
--     least one of them /must/ be the same as the family of the queue that
--     will execute this barrier
--
-- -   @subresourceRange.baseMipLevel@ /must/ be less than the @mipLevels@
--     specified in 'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when
--     @image@ was created
--
-- -   If @subresourceRange.levelCount@ is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_REMAINING_MIP_LEVELS',
--     @subresourceRange.baseMipLevel@ + @subresourceRange.levelCount@
--     /must/ be less than or equal to the @mipLevels@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @image@ was
--     created
--
-- -   @subresourceRange.baseArrayLayer@ /must/ be less than the
--     @arrayLayers@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @image@ was
--     created
--
-- -   If @subresourceRange.layerCount@ is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_REMAINING_ARRAY_LAYERS',
--     @subresourceRange.baseArrayLayer@ + @subresourceRange.layerCount@
--     /must/ be less than or equal to the @arrayLayers@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @image@ was
--     created
--
-- -   If @image@ has a depth\/stencil format with both depth and stencil
--     components, then the @aspectMask@ member of @subresourceRange@
--     /must/ include both
--     'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VK_IMAGE_ASPECT_DEPTH_BIT'
--     and
--     'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VK_IMAGE_ASPECT_STENCIL_BIT'
--
-- -   If either @oldLayout@ or @newLayout@ is
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL'
--     then @image@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT'
--     set
--
-- -   If either @oldLayout@ or @newLayout@ is
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL'
--     then @image@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT'
--     set
--
-- -   If either @oldLayout@ or @newLayout@ is
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL'
--     then @image@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT'
--     set
--
-- -   If either @oldLayout@ or @newLayout@ is
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL'
--     then @image@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_SAMPLED_BIT'
--     or
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_INPUT_ATTACHMENT_BIT'
--     set
--
-- -   If either @oldLayout@ or @newLayout@ is
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL'
--     then @image@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_TRANSFER_SRC_BIT'
--     set
--
-- -   If either @oldLayout@ or @newLayout@ is
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL'
--     then @image@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_TRANSFER_DST_BIT'
--     set
--
-- -   If @image@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.C.Core10.Core.VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER'
--
-- -   @pNext@ /must/ be @NULL@ or a pointer to a valid instance of
--     'Graphics.Vulkan.C.Extensions.VK_EXT_sample_locations.VkSampleLocationsInfoEXT'
--
-- -   @srcAccessMask@ /must/ be a valid combination of
--     'Graphics.Vulkan.C.Core10.Pass.VkAccessFlagBits' values
--
-- -   @dstAccessMask@ /must/ be a valid combination of
--     'Graphics.Vulkan.C.Core10.Pass.VkAccessFlagBits' values
--
-- -   @oldLayout@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Image.VkImageLayout' value
--
-- -   @newLayout@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Image.VkImageLayout' value
--
-- -   @image@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' handle
--
-- -   @subresourceRange@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.ImageView.VkImageSubresourceRange'
--     structure
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Pass.VkAccessFlags',
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage',
-- 'Graphics.Vulkan.C.Core10.Image.VkImageLayout',
-- 'Graphics.Vulkan.C.Core10.ImageView.VkImageSubresourceRange',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType', 'vkCmdPipelineBarrier',
-- 'vkCmdWaitEvents'
data VkImageMemoryBarrier = VkImageMemoryBarrier
  { -- | @sType@ is the type of this structure.
  vkSType :: VkStructureType
  , -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
  vkPNext :: Ptr ()
  , -- | @srcAccessMask@ is a bitmask of
  -- 'Graphics.Vulkan.C.Core10.Pass.VkAccessFlagBits' specifying a
  -- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-access-masks source access mask>.
  vkSrcAccessMask :: VkAccessFlags
  , -- | @dstAccessMask@ is a bitmask of
  -- 'Graphics.Vulkan.C.Core10.Pass.VkAccessFlagBits' specifying a
  -- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-access-masks destination access mask>.
  vkDstAccessMask :: VkAccessFlags
  , -- | @oldLayout@ is the old layout in an
  -- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-image-layout-transitions image layout transition>.
  vkOldLayout :: VkImageLayout
  , -- | @newLayout@ is the new layout in an
  -- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-image-layout-transitions image layout transition>.
  vkNewLayout :: VkImageLayout
  , -- | @srcQueueFamilyIndex@ is the source queue family for a
  -- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-queue-transfers queue family ownership transfer>.
  vkSrcQueueFamilyIndex :: Word32
  , -- | @dstQueueFamilyIndex@ is the destination queue family for a
  -- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-queue-transfers queue family ownership transfer>.
  vkDstQueueFamilyIndex :: Word32
  , -- | @image@ is a handle to the image affected by this barrier.
  vkImage :: VkImage
  , -- | @subresourceRange@ describes the
  -- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#resources-image-views image subresource range>
  -- within @image@ that is affected by this barrier.
  vkSubresourceRange :: VkImageSubresourceRange
  }
  deriving (Eq, Show)

instance Storable VkImageMemoryBarrier where
  sizeOf ~_ = 72
  alignment ~_ = 8
  peek ptr = VkImageMemoryBarrier <$> peek (ptr `plusPtr` 0)
                                  <*> peek (ptr `plusPtr` 8)
                                  <*> peek (ptr `plusPtr` 16)
                                  <*> peek (ptr `plusPtr` 20)
                                  <*> peek (ptr `plusPtr` 24)
                                  <*> peek (ptr `plusPtr` 28)
                                  <*> peek (ptr `plusPtr` 32)
                                  <*> peek (ptr `plusPtr` 36)
                                  <*> peek (ptr `plusPtr` 40)
                                  <*> peek (ptr `plusPtr` 48)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkImageMemoryBarrier))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkImageMemoryBarrier))
                *> poke (ptr `plusPtr` 16) (vkSrcAccessMask (poked :: VkImageMemoryBarrier))
                *> poke (ptr `plusPtr` 20) (vkDstAccessMask (poked :: VkImageMemoryBarrier))
                *> poke (ptr `plusPtr` 24) (vkOldLayout (poked :: VkImageMemoryBarrier))
                *> poke (ptr `plusPtr` 28) (vkNewLayout (poked :: VkImageMemoryBarrier))
                *> poke (ptr `plusPtr` 32) (vkSrcQueueFamilyIndex (poked :: VkImageMemoryBarrier))
                *> poke (ptr `plusPtr` 36) (vkDstQueueFamilyIndex (poked :: VkImageMemoryBarrier))
                *> poke (ptr `plusPtr` 40) (vkImage (poked :: VkImageMemoryBarrier))
                *> poke (ptr `plusPtr` 48) (vkSubresourceRange (poked :: VkImageMemoryBarrier))

instance Zero VkImageMemoryBarrier where
  zero = VkImageMemoryBarrier VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER
                              zero
                              zero
                              zero
                              zero
                              zero
                              zero
                              zero
                              zero
                              zero

-- | VkImageResolve - Structure specifying an image resolve operation
--
-- == Valid Usage
--
-- -   The @aspectMask@ member of @srcSubresource@ and @dstSubresource@
--     /must/ only contain
--     'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VK_IMAGE_ASPECT_COLOR_BIT'
--
-- -   The @layerCount@ member of @srcSubresource@ and @dstSubresource@
--     /must/ match
--
-- -   If either of the calling command’s @srcImage@ or @dstImage@
--     parameters are of
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkImageType'
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_3D',
--     the @baseArrayLayer@ and @layerCount@ members of both
--     @srcSubresource@ and @dstSubresource@ /must/ be @0@ and @1@,
--     respectively
--
-- -   @srcOffset.x@ and (@extent.width@ + @srcOffset.x@) /must/ both be
--     greater than or equal to @0@ and less than or equal to the source
--     image subresource width
--
-- -   @srcOffset.y@ and (@extent.height@ + @srcOffset.y@) /must/ both be
--     greater than or equal to @0@ and less than or equal to the source
--     image subresource height
--
-- -   If the calling command’s @srcImage@ is of type
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_1D',
--     then @srcOffset.y@ /must/ be @0@ and @extent.height@ /must/ be @1@.
--
-- -   @srcOffset.z@ and (@extent.depth@ + @srcOffset.z@) /must/ both be
--     greater than or equal to @0@ and less than or equal to the source
--     image subresource depth
--
-- -   If the calling command’s @srcImage@ is of type
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_1D' or
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_2D',
--     then @srcOffset.z@ /must/ be @0@ and @extent.depth@ /must/ be @1@.
--
-- -   @dstOffset.x@ and (@extent.width@ + @dstOffset.x@) /must/ both be
--     greater than or equal to @0@ and less than or equal to the
--     destination image subresource width
--
-- -   @dstOffset.y@ and (@extent.height@ + @dstOffset.y@) /must/ both be
--     greater than or equal to @0@ and less than or equal to the
--     destination image subresource height
--
-- -   If the calling command’s @dstImage@ is of type
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_1D',
--     then @dstOffset.y@ /must/ be @0@ and @extent.height@ /must/ be @1@.
--
-- -   @dstOffset.z@ and (@extent.depth@ + @dstOffset.z@) /must/ both be
--     greater than or equal to @0@ and less than or equal to the
--     destination image subresource depth
--
-- -   If the calling command’s @dstImage@ is of type
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_1D' or
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_TYPE_2D',
--     then @dstOffset.z@ /must/ be @0@ and @extent.depth@ /must/ be @1@.
--
-- == Valid Usage (Implicit)
--
-- -   @srcSubresource@ /must/ be a valid 'VkImageSubresourceLayers'
--     structure
--
-- -   @dstSubresource@ /must/ be a valid 'VkImageSubresourceLayers'
--     structure
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkExtent3D',
-- 'VkImageSubresourceLayers',
-- 'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VkOffset3D',
-- 'vkCmdResolveImage'
data VkImageResolve = VkImageResolve
  { -- | @srcSubresource@ and @dstSubresource@ are 'VkImageSubresourceLayers'
  -- structures specifying the image subresources of the images used for the
  -- source and destination image data, respectively. Resolve of
  -- depth\/stencil images is not supported.
  vkSrcSubresource :: VkImageSubresourceLayers
  , -- | @srcOffset@ and @dstOffset@ select the initial @x@, @y@, and @z@ offsets
  -- in texels of the sub-regions of the source and destination image data.
  vkSrcOffset :: VkOffset3D
  , -- No documentation found for Nested "VkImageResolve" "dstSubresource"
  vkDstSubresource :: VkImageSubresourceLayers
  , -- No documentation found for Nested "VkImageResolve" "dstOffset"
  vkDstOffset :: VkOffset3D
  , -- | @extent@ is the size in texels of the source image to resolve in
  -- @width@, @height@ and @depth@.
  vkExtent :: VkExtent3D
  }
  deriving (Eq, Show)

instance Storable VkImageResolve where
  sizeOf ~_ = 68
  alignment ~_ = 4
  peek ptr = VkImageResolve <$> peek (ptr `plusPtr` 0)
                            <*> peek (ptr `plusPtr` 16)
                            <*> peek (ptr `plusPtr` 28)
                            <*> peek (ptr `plusPtr` 44)
                            <*> peek (ptr `plusPtr` 56)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSrcSubresource (poked :: VkImageResolve))
                *> poke (ptr `plusPtr` 16) (vkSrcOffset (poked :: VkImageResolve))
                *> poke (ptr `plusPtr` 28) (vkDstSubresource (poked :: VkImageResolve))
                *> poke (ptr `plusPtr` 44) (vkDstOffset (poked :: VkImageResolve))
                *> poke (ptr `plusPtr` 56) (vkExtent (poked :: VkImageResolve))

instance Zero VkImageResolve where
  zero = VkImageResolve zero
                        zero
                        zero
                        zero
                        zero

-- | VkImageSubresourceLayers - Structure specifying an image subresource
-- layers
--
-- == Valid Usage
--
-- -   If @aspectMask@ contains
--     'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VK_IMAGE_ASPECT_COLOR_BIT',
--     it /must/ not contain either of
--     'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VK_IMAGE_ASPECT_DEPTH_BIT'
--     or
--     'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VK_IMAGE_ASPECT_STENCIL_BIT'
--
-- -   @aspectMask@ /must/ not contain
--     'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VK_IMAGE_ASPECT_METADATA_BIT'
--
-- -   @layerCount@ /must/ be greater than 0
--
-- == Valid Usage (Implicit)
--
-- -   @aspectMask@ /must/ be a valid combination of
--     'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VkImageAspectFlagBits'
--     values
--
-- -   @aspectMask@ /must/ not be @0@
--
-- = See Also
--
-- 'VkBufferImageCopy',
-- 'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VkImageAspectFlags',
-- 'VkImageBlit', 'VkImageCopy', 'VkImageResolve'
data VkImageSubresourceLayers = VkImageSubresourceLayers
  { -- | @aspectMask@ is a combination of
  -- 'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VkImageAspectFlagBits',
  -- selecting the color, depth and\/or stencil aspects to be copied.
  vkAspectMask :: VkImageAspectFlags
  , -- | @mipLevel@ is the mipmap level to copy from.
  vkMipLevel :: Word32
  , -- | @baseArrayLayer@ and @layerCount@ are the starting layer and number of
  -- layers to copy.
  vkBaseArrayLayer :: Word32
  , -- No documentation found for Nested "VkImageSubresourceLayers" "layerCount"
  vkLayerCount :: Word32
  }
  deriving (Eq, Show)

instance Storable VkImageSubresourceLayers where
  sizeOf ~_ = 16
  alignment ~_ = 4
  peek ptr = VkImageSubresourceLayers <$> peek (ptr `plusPtr` 0)
                                      <*> peek (ptr `plusPtr` 4)
                                      <*> peek (ptr `plusPtr` 8)
                                      <*> peek (ptr `plusPtr` 12)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkAspectMask (poked :: VkImageSubresourceLayers))
                *> poke (ptr `plusPtr` 4) (vkMipLevel (poked :: VkImageSubresourceLayers))
                *> poke (ptr `plusPtr` 8) (vkBaseArrayLayer (poked :: VkImageSubresourceLayers))
                *> poke (ptr `plusPtr` 12) (vkLayerCount (poked :: VkImageSubresourceLayers))

instance Zero VkImageSubresourceLayers where
  zero = VkImageSubresourceLayers zero
                                  zero
                                  zero
                                  zero

-- ** VkIndexType

-- | VkIndexType - Type of index buffer indices
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Extensions.VK_NV_ray_tracing.VkGeometryTrianglesNV',
-- 'Graphics.Vulkan.C.Extensions.VK_NVX_device_generated_commands.VkObjectTableIndexBufferEntryNVX',
-- 'vkCmdBindIndexBuffer'
newtype VkIndexType = VkIndexType Int32
  deriving (Eq, Ord, Storable, Zero)

instance Show VkIndexType where
  showsPrec _ VK_INDEX_TYPE_UINT16 = showString "VK_INDEX_TYPE_UINT16"
  showsPrec _ VK_INDEX_TYPE_UINT32 = showString "VK_INDEX_TYPE_UINT32"
  -- The following values are from extensions, the patterns themselves are exported from the extension modules
  showsPrec _ (VkIndexType 1000165000) = showString "VK_INDEX_TYPE_NONE_NV"
  showsPrec p (VkIndexType x) = showParen (p >= 11) (showString "VkIndexType " . showsPrec 11 x)

instance Read VkIndexType where
  readPrec = parens ( choose [ ("VK_INDEX_TYPE_UINT16", pure VK_INDEX_TYPE_UINT16)
                             , ("VK_INDEX_TYPE_UINT32", pure VK_INDEX_TYPE_UINT32)
                             , -- The following values are from extensions, the patterns themselves are exported from the extension modules
                               ("VK_INDEX_TYPE_NONE_NV", pure (VkIndexType 1000165000))
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkIndexType")
                        v <- step readPrec
                        pure (VkIndexType v)
                        )
                    )

-- | 'VK_INDEX_TYPE_UINT16' specifies that indices are 16-bit unsigned
-- integer values.
pattern VK_INDEX_TYPE_UINT16 :: VkIndexType
pattern VK_INDEX_TYPE_UINT16 = VkIndexType 0

-- | 'VK_INDEX_TYPE_UINT32' specifies that indices are 32-bit unsigned
-- integer values.
pattern VK_INDEX_TYPE_UINT32 :: VkIndexType
pattern VK_INDEX_TYPE_UINT32 = VkIndexType 1

-- | VkMemoryBarrier - Structure specifying a global memory barrier
--
-- = Description
--
-- The first
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-dependencies-access-scopes access scope>
-- is limited to access types in the
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-access-masks source access mask>
-- specified by @srcAccessMask@.
--
-- The second
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-dependencies-access-scopes access scope>
-- is limited to access types in the
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-access-masks destination access mask>
-- specified by @dstAccessMask@.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Pass.VkAccessFlags',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType', 'vkCmdPipelineBarrier',
-- 'vkCmdWaitEvents'
data VkMemoryBarrier = VkMemoryBarrier
  { -- | @sType@ /must/ be
  -- 'Graphics.Vulkan.C.Core10.Core.VK_STRUCTURE_TYPE_MEMORY_BARRIER'
  vkSType :: VkStructureType
  , -- | @pNext@ /must/ be @NULL@
  vkPNext :: Ptr ()
  , -- | @srcAccessMask@ /must/ be a valid combination of
  -- 'Graphics.Vulkan.C.Core10.Pass.VkAccessFlagBits' values
  vkSrcAccessMask :: VkAccessFlags
  , -- | @dstAccessMask@ /must/ be a valid combination of
  -- 'Graphics.Vulkan.C.Core10.Pass.VkAccessFlagBits' values
  vkDstAccessMask :: VkAccessFlags
  }
  deriving (Eq, Show)

instance Storable VkMemoryBarrier where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkMemoryBarrier <$> peek (ptr `plusPtr` 0)
                             <*> peek (ptr `plusPtr` 8)
                             <*> peek (ptr `plusPtr` 16)
                             <*> peek (ptr `plusPtr` 20)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkMemoryBarrier))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkMemoryBarrier))
                *> poke (ptr `plusPtr` 16) (vkSrcAccessMask (poked :: VkMemoryBarrier))
                *> poke (ptr `plusPtr` 20) (vkDstAccessMask (poked :: VkMemoryBarrier))

instance Zero VkMemoryBarrier where
  zero = VkMemoryBarrier VK_STRUCTURE_TYPE_MEMORY_BARRIER
                         zero
                         zero
                         zero

-- | VkRenderPassBeginInfo - Structure specifying render pass begin info
--
-- = Description
--
-- @renderArea@ is the render area that is affected by the render pass
-- instance. The effects of attachment load, store and multisample resolve
-- operations are restricted to the pixels whose x and y coordinates fall
-- within the render area on all attachments. The render area extends to
-- all layers of @framebuffer@. The application /must/ ensure (using
-- scissor if necessary) that all rendering is contained within the render
-- area. The render area /must/ be contained within the framebuffer
-- dimensions.
--
-- __Note__
--
-- There /may/ be a performance cost for using a render area smaller than
-- the framebuffer, unless it matches the render area granularity for the
-- render pass.
--
-- == Valid Usage
--
-- -   @clearValueCount@ /must/ be greater than the largest attachment
--     index in @renderPass@ that specifies a @loadOp@ (or @stencilLoadOp@,
--     if the attachment has a depth\/stencil format) of
--     'Graphics.Vulkan.C.Core10.Pass.VK_ATTACHMENT_LOAD_OP_CLEAR'
--
-- -   @renderPass@ /must/ be
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#renderpass-compatibility compatible>
--     with the @renderPass@ member of the
--     'Graphics.Vulkan.C.Core10.Pass.VkFramebufferCreateInfo' structure
--     specified when creating @framebuffer@.
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.C.Core10.Core.VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO'
--
-- -   Each @pNext@ member of any structure (including this one) in the
--     @pNext@ chain /must/ be either @NULL@ or a pointer to a valid
--     instance of
--     'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_device_group.VkDeviceGroupRenderPassBeginInfo'
--     or
--     'Graphics.Vulkan.C.Extensions.VK_EXT_sample_locations.VkRenderPassSampleLocationsBeginInfoEXT'
--
-- -   Each @sType@ member in the @pNext@ chain /must/ be unique
--
-- -   @renderPass@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Pipeline.VkRenderPass' handle
--
-- -   @framebuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Pass.VkFramebuffer' handle
--
-- -   If @clearValueCount@ is not @0@, @pClearValues@ /must/ be a valid
--     pointer to an array of @clearValueCount@ 'VkClearValue' unions
--
-- -   Both of @framebuffer@, and @renderPass@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- = See Also
--
-- 'VkClearValue', 'Graphics.Vulkan.C.Core10.Pass.VkFramebuffer',
-- 'Graphics.Vulkan.C.Core10.Pipeline.VkRect2D',
-- 'Graphics.Vulkan.C.Core10.Pipeline.VkRenderPass',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType', 'vkCmdBeginRenderPass',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_create_renderpass2.vkCmdBeginRenderPass2KHR'
data VkRenderPassBeginInfo = VkRenderPassBeginInfo
  { -- | @sType@ is the type of this structure.
  vkSType :: VkStructureType
  , -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
  vkPNext :: Ptr ()
  , -- | @renderPass@ is the render pass to begin an instance of.
  vkRenderPass :: VkRenderPass
  , -- | @framebuffer@ is the framebuffer containing the attachments that are
  -- used with the render pass.
  vkFramebuffer :: VkFramebuffer
  , -- | @renderArea@ is the render area that is affected by the render pass
  -- instance, and is described in more detail below.
  vkRenderArea :: VkRect2D
  , -- | @clearValueCount@ is the number of elements in @pClearValues@.
  vkClearValueCount :: Word32
  , -- | @pClearValues@ is an array of 'VkClearValue' structures that contains
  -- clear values for each attachment, if the attachment uses a @loadOp@
  -- value of 'Graphics.Vulkan.C.Core10.Pass.VK_ATTACHMENT_LOAD_OP_CLEAR' or
  -- if the attachment has a depth\/stencil format and uses a @stencilLoadOp@
  -- value of 'Graphics.Vulkan.C.Core10.Pass.VK_ATTACHMENT_LOAD_OP_CLEAR'.
  -- The array is indexed by attachment number. Only elements corresponding
  -- to cleared attachments are used. Other elements of @pClearValues@ are
  -- ignored.
  vkPClearValues :: Ptr VkClearValue
  }
  deriving (Eq, Show)

instance Storable VkRenderPassBeginInfo where
  sizeOf ~_ = 64
  alignment ~_ = 8
  peek ptr = VkRenderPassBeginInfo <$> peek (ptr `plusPtr` 0)
                                   <*> peek (ptr `plusPtr` 8)
                                   <*> peek (ptr `plusPtr` 16)
                                   <*> peek (ptr `plusPtr` 24)
                                   <*> peek (ptr `plusPtr` 32)
                                   <*> peek (ptr `plusPtr` 48)
                                   <*> peek (ptr `plusPtr` 56)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkRenderPassBeginInfo))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkRenderPassBeginInfo))
                *> poke (ptr `plusPtr` 16) (vkRenderPass (poked :: VkRenderPassBeginInfo))
                *> poke (ptr `plusPtr` 24) (vkFramebuffer (poked :: VkRenderPassBeginInfo))
                *> poke (ptr `plusPtr` 32) (vkRenderArea (poked :: VkRenderPassBeginInfo))
                *> poke (ptr `plusPtr` 48) (vkClearValueCount (poked :: VkRenderPassBeginInfo))
                *> poke (ptr `plusPtr` 56) (vkPClearValues (poked :: VkRenderPassBeginInfo))

instance Zero VkRenderPassBeginInfo where
  zero = VkRenderPassBeginInfo VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO
                               zero
                               zero
                               zero
                               zero
                               zero
                               zero

-- ** VkStencilFaceFlagBits

-- | VkStencilFaceFlagBits - Bitmask specifying sets of stencil state for
-- which to update the compare mask
--
-- = See Also
--
-- 'VkStencilFaceFlags'
newtype VkStencilFaceFlagBits = VkStencilFaceFlagBits VkFlags
  deriving (Eq, Ord, Storable, Bits, FiniteBits, Zero)

instance Show VkStencilFaceFlagBits where
  showsPrec _ VK_STENCIL_FACE_FRONT_BIT = showString "VK_STENCIL_FACE_FRONT_BIT"
  showsPrec _ VK_STENCIL_FACE_BACK_BIT = showString "VK_STENCIL_FACE_BACK_BIT"
  showsPrec _ VK_STENCIL_FRONT_AND_BACK = showString "VK_STENCIL_FRONT_AND_BACK"
  showsPrec p (VkStencilFaceFlagBits x) = showParen (p >= 11) (showString "VkStencilFaceFlagBits " . showsPrec 11 x)

instance Read VkStencilFaceFlagBits where
  readPrec = parens ( choose [ ("VK_STENCIL_FACE_FRONT_BIT", pure VK_STENCIL_FACE_FRONT_BIT)
                             , ("VK_STENCIL_FACE_BACK_BIT",  pure VK_STENCIL_FACE_BACK_BIT)
                             , ("VK_STENCIL_FRONT_AND_BACK", pure VK_STENCIL_FRONT_AND_BACK)
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkStencilFaceFlagBits")
                        v <- step readPrec
                        pure (VkStencilFaceFlagBits v)
                        )
                    )

-- | 'VK_STENCIL_FACE_FRONT_BIT' specifies that only the front set of stencil
-- state is updated.
pattern VK_STENCIL_FACE_FRONT_BIT :: VkStencilFaceFlagBits
pattern VK_STENCIL_FACE_FRONT_BIT = VkStencilFaceFlagBits 0x00000001

-- | 'VK_STENCIL_FACE_BACK_BIT' specifies that only the back set of stencil
-- state is updated.
pattern VK_STENCIL_FACE_BACK_BIT :: VkStencilFaceFlagBits
pattern VK_STENCIL_FACE_BACK_BIT = VkStencilFaceFlagBits 0x00000002

-- | 'VK_STENCIL_FRONT_AND_BACK' is the combination of
-- 'VK_STENCIL_FACE_FRONT_BIT' and 'VK_STENCIL_FACE_BACK_BIT', and
-- specifies that both sets of stencil state are updated.
pattern VK_STENCIL_FRONT_AND_BACK :: VkStencilFaceFlagBits
pattern VK_STENCIL_FRONT_AND_BACK = VkStencilFaceFlagBits 0x00000003

-- | VkStencilFaceFlags - Bitmask of VkStencilFaceFlagBits
--
-- = Description
--
-- 'VkStencilFaceFlags' is a bitmask type for setting a mask of zero or
-- more 'VkStencilFaceFlagBits'.
--
-- = See Also
--
-- 'VkStencilFaceFlagBits', 'vkCmdSetStencilCompareMask',
-- 'vkCmdSetStencilReference', 'vkCmdSetStencilWriteMask'
type VkStencilFaceFlags = VkStencilFaceFlagBits

-- ** VkSubpassContents

-- | VkSubpassContents - Specify how commands in the first subpass of a
-- render pass are provided
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_create_renderpass2.VkSubpassBeginInfoKHR',
-- 'vkCmdBeginRenderPass', 'vkCmdNextSubpass'
newtype VkSubpassContents = VkSubpassContents Int32
  deriving (Eq, Ord, Storable, Zero)

instance Show VkSubpassContents where
  showsPrec _ VK_SUBPASS_CONTENTS_INLINE = showString "VK_SUBPASS_CONTENTS_INLINE"
  showsPrec _ VK_SUBPASS_CONTENTS_SECONDARY_COMMAND_BUFFERS = showString "VK_SUBPASS_CONTENTS_SECONDARY_COMMAND_BUFFERS"
  showsPrec p (VkSubpassContents x) = showParen (p >= 11) (showString "VkSubpassContents " . showsPrec 11 x)

instance Read VkSubpassContents where
  readPrec = parens ( choose [ ("VK_SUBPASS_CONTENTS_INLINE",                    pure VK_SUBPASS_CONTENTS_INLINE)
                             , ("VK_SUBPASS_CONTENTS_SECONDARY_COMMAND_BUFFERS", pure VK_SUBPASS_CONTENTS_SECONDARY_COMMAND_BUFFERS)
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkSubpassContents")
                        v <- step readPrec
                        pure (VkSubpassContents v)
                        )
                    )

-- | 'VK_SUBPASS_CONTENTS_INLINE' specifies that the contents of the subpass
-- will be recorded inline in the primary command buffer, and secondary
-- command buffers /must/ not be executed within the subpass.
pattern VK_SUBPASS_CONTENTS_INLINE :: VkSubpassContents
pattern VK_SUBPASS_CONTENTS_INLINE = VkSubpassContents 0

-- | 'VK_SUBPASS_CONTENTS_SECONDARY_COMMAND_BUFFERS' specifies that the
-- contents are recorded in secondary command buffers that will be called
-- from the primary command buffer, and 'vkCmdExecuteCommands' is the only
-- valid command on the command buffer until 'vkCmdNextSubpass' or
-- 'vkCmdEndRenderPass'.
pattern VK_SUBPASS_CONTENTS_SECONDARY_COMMAND_BUFFERS :: VkSubpassContents
pattern VK_SUBPASS_CONTENTS_SECONDARY_COMMAND_BUFFERS = VkSubpassContents 1

-- | vkCmdBeginQuery - Begin a query
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which this command will
--     be recorded.
--
-- -   @queryPool@ is the query pool that will manage the results of the
--     query.
--
-- -   @query@ is the query index within the query pool that will contain
--     the results.
--
-- -   @flags@ is a bitmask of
--     'Graphics.Vulkan.C.Core10.CommandBuffer.VkQueryControlFlagBits'
--     specifying constraints on the types of queries that /can/ be
--     performed.
--
-- = Description
--
-- If the @queryType@ of the pool is
-- 'Graphics.Vulkan.C.Core10.Query.VK_QUERY_TYPE_OCCLUSION' and @flags@
-- contains
-- 'Graphics.Vulkan.C.Core10.CommandBuffer.VK_QUERY_CONTROL_PRECISE_BIT',
-- an implementation /must/ return a result that matches the actual number
-- of samples passed. This is described in more detail in
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#queries-occlusion Occlusion Queries>.
--
-- After beginning a query, that query is considered /active/ within the
-- command buffer it was called in until that same query is ended. Queries
-- active in a primary command buffer when secondary command buffers are
-- executed are considered active for those secondary command buffers.
--
-- == Valid Usage
--
-- -   @queryPool@ /must/ have been created with a @queryType@ that differs
--     from that of any queries that are
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#queries-operation-active active>
--     within @commandBuffer@
--
-- -   All queries used by the command /must/ be unavailable
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-occlusionQueryPrecise precise occlusion queries>
--     feature is not enabled, or the @queryType@ used to create
--     @queryPool@ was not
--     'Graphics.Vulkan.C.Core10.Query.VK_QUERY_TYPE_OCCLUSION', @flags@
--     /must/ not contain
--     'Graphics.Vulkan.C.Core10.CommandBuffer.VK_QUERY_CONTROL_PRECISE_BIT'
--
-- -   @query@ /must/ be less than the number of queries in @queryPool@
--
-- -   If the @queryType@ used to create @queryPool@ was
--     'Graphics.Vulkan.C.Core10.Query.VK_QUERY_TYPE_OCCLUSION', the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   If the @queryType@ used to create @queryPool@ was
--     'Graphics.Vulkan.C.Core10.Query.VK_QUERY_TYPE_PIPELINE_STATISTICS'
--     and any of the @pipelineStatistics@ indicate graphics operations,
--     the 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   If the @queryType@ used to create @queryPool@ was
--     'Graphics.Vulkan.C.Core10.Query.VK_QUERY_TYPE_PIPELINE_STATISTICS'
--     and any of the @pipelineStatistics@ indicate compute operations, the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support compute operations
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @queryPool@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Query.VkQueryPool' handle
--
-- -   @flags@ /must/ be a valid combination of
--     'Graphics.Vulkan.C.Core10.CommandBuffer.VkQueryControlFlagBits'
--     values
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics, or
--     compute operations
--
-- -   Both of @commandBuffer@, and @queryPool@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Both            | Graphics        |                 |
-- > | Secondary       |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.CommandBuffer.VkQueryControlFlags',
-- 'Graphics.Vulkan.C.Core10.Query.VkQueryPool'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdBeginQuery" vkCmdBeginQuery :: ("commandBuffer" ::: VkCommandBuffer) -> ("queryPool" ::: VkQueryPool) -> ("query" ::: Word32) -> ("flags" ::: VkQueryControlFlags) -> IO ()
#else
vkCmdBeginQuery :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("queryPool" ::: VkQueryPool) -> ("query" ::: Word32) -> ("flags" ::: VkQueryControlFlags) -> IO ()
vkCmdBeginQuery deviceCmds = mkVkCmdBeginQuery (pVkCmdBeginQuery deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdBeginQuery
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("queryPool" ::: VkQueryPool) -> ("query" ::: Word32) -> ("flags" ::: VkQueryControlFlags) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("queryPool" ::: VkQueryPool) -> ("query" ::: Word32) -> ("flags" ::: VkQueryControlFlags) -> IO ())
#endif

type FN_vkCmdBeginQuery = ("commandBuffer" ::: VkCommandBuffer) -> ("queryPool" ::: VkQueryPool) -> ("query" ::: Word32) -> ("flags" ::: VkQueryControlFlags) -> IO ()
type PFN_vkCmdBeginQuery = FunPtr FN_vkCmdBeginQuery

-- | vkCmdBeginRenderPass - Begin a new render pass
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer in which to record the
--     command.
--
-- -   @pRenderPassBegin@ is a pointer to a 'VkRenderPassBeginInfo'
--     structure (defined below) which specifies the render pass to begin
--     an instance of, and the framebuffer the instance uses.
--
-- -   @contents@ is a 'VkSubpassContents' value specifying how the
--     commands in the first subpass will be provided.
--
-- = Description
--
-- After beginning a render pass instance, the command buffer is ready to
-- record the commands for the first subpass of that render pass.
--
-- == Valid Usage
--
-- -   If any of the @initialLayout@ or @finalLayout@ member of the
--     'Graphics.Vulkan.C.Core10.Pass.VkAttachmentDescription' structures
--     or the @layout@ member of the
--     'Graphics.Vulkan.C.Core10.Pass.VkAttachmentReference' structures
--     specified when creating the render pass specified in the
--     @renderPass@ member of @pRenderPassBegin@ is
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL'
--     then the corresponding attachment image view of the framebuffer
--     specified in the @framebuffer@ member of @pRenderPassBegin@ /must/
--     have been created with a @usage@ value including
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT'
--
-- -   If any of the @initialLayout@ or @finalLayout@ member of the
--     'Graphics.Vulkan.C.Core10.Pass.VkAttachmentDescription' structures
--     or the @layout@ member of the
--     'Graphics.Vulkan.C.Core10.Pass.VkAttachmentReference' structures
--     specified when creating the render pass specified in the
--     @renderPass@ member of @pRenderPassBegin@ is
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL',
--     or
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL'
--     then the corresponding attachment image view of the framebuffer
--     specified in the @framebuffer@ member of @pRenderPassBegin@ /must/
--     have been created with a @usage@ value including
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT'
--
-- -   If any of the @initialLayout@ or @finalLayout@ member of the
--     'Graphics.Vulkan.C.Core10.Pass.VkAttachmentDescription' structures
--     or the @layout@ member of the
--     'Graphics.Vulkan.C.Core10.Pass.VkAttachmentReference' structures
--     specified when creating the render pass specified in the
--     @renderPass@ member of @pRenderPassBegin@ is
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL'
--     then the corresponding attachment image view of the framebuffer
--     specified in the @framebuffer@ member of @pRenderPassBegin@ /must/
--     have been created with a @usage@ value including
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_SAMPLED_BIT'
--     or
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_INPUT_ATTACHMENT_BIT'
--
-- -   If any of the @initialLayout@ or @finalLayout@ member of the
--     'Graphics.Vulkan.C.Core10.Pass.VkAttachmentDescription' structures
--     or the @layout@ member of the
--     'Graphics.Vulkan.C.Core10.Pass.VkAttachmentReference' structures
--     specified when creating the render pass specified in the
--     @renderPass@ member of @pRenderPassBegin@ is
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL'
--     then the corresponding attachment image view of the framebuffer
--     specified in the @framebuffer@ member of @pRenderPassBegin@ /must/
--     have been created with a @usage@ value including
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_TRANSFER_SRC_BIT'
--
-- -   If any of the @initialLayout@ or @finalLayout@ member of the
--     'Graphics.Vulkan.C.Core10.Pass.VkAttachmentDescription' structures
--     or the @layout@ member of the
--     'Graphics.Vulkan.C.Core10.Pass.VkAttachmentReference' structures
--     specified when creating the render pass specified in the
--     @renderPass@ member of @pRenderPassBegin@ is
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL'
--     then the corresponding attachment image view of the framebuffer
--     specified in the @framebuffer@ member of @pRenderPassBegin@ /must/
--     have been created with a @usage@ value including
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_TRANSFER_DST_BIT'
--
-- -   If any of the @initialLayout@ members of the
--     'Graphics.Vulkan.C.Core10.Pass.VkAttachmentDescription' structures
--     specified when creating the render pass specified in the
--     @renderPass@ member of @pRenderPassBegin@ is not
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_UNDEFINED', then
--     each such @initialLayout@ /must/ be equal to the current layout of
--     the corresponding attachment image subresource of the framebuffer
--     specified in the @framebuffer@ member of @pRenderPassBegin@
--
-- -   The @srcStageMask@ and @dstStageMask@ members of any element of the
--     @pDependencies@ member of
--     'Graphics.Vulkan.C.Core10.Pass.VkRenderPassCreateInfo' used to
--     create @renderPass@ /must/ be supported by the capabilities of the
--     queue family identified by the @queueFamilyIndex@ member of the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPoolCreateInfo' used
--     to create the command pool which @commandBuffer@ was allocated from
--
-- -   For any attachment in @framebuffer@ that is used by @renderPass@ and
--     is bound to memory locations that are also bound to another
--     attachment used by @renderPass@, and if at least one of those uses
--     causes either attachment to be written to, both attachments /must/
--     have had the
--     'Graphics.Vulkan.C.Core10.Pass.VK_ATTACHMENT_DESCRIPTION_MAY_ALIAS_BIT'
--     set
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @pRenderPassBegin@ /must/ be a valid pointer to a valid
--     'VkRenderPassBeginInfo' structure
--
-- -   @contents@ /must/ be a valid 'VkSubpassContents' value
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   This command /must/ only be called outside of a render pass instance
--
-- -   @commandBuffer@ /must/ be a primary
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Outside         | Graphics        | Graphics        |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'VkRenderPassBeginInfo', 'VkSubpassContents'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdBeginRenderPass" vkCmdBeginRenderPass :: ("commandBuffer" ::: VkCommandBuffer) -> ("pRenderPassBegin" ::: Ptr VkRenderPassBeginInfo) -> ("contents" ::: VkSubpassContents) -> IO ()
#else
vkCmdBeginRenderPass :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("pRenderPassBegin" ::: Ptr VkRenderPassBeginInfo) -> ("contents" ::: VkSubpassContents) -> IO ()
vkCmdBeginRenderPass deviceCmds = mkVkCmdBeginRenderPass (pVkCmdBeginRenderPass deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdBeginRenderPass
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("pRenderPassBegin" ::: Ptr VkRenderPassBeginInfo) -> ("contents" ::: VkSubpassContents) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("pRenderPassBegin" ::: Ptr VkRenderPassBeginInfo) -> ("contents" ::: VkSubpassContents) -> IO ())
#endif

type FN_vkCmdBeginRenderPass = ("commandBuffer" ::: VkCommandBuffer) -> ("pRenderPassBegin" ::: Ptr VkRenderPassBeginInfo) -> ("contents" ::: VkSubpassContents) -> IO ()
type PFN_vkCmdBeginRenderPass = FunPtr FN_vkCmdBeginRenderPass

-- | vkCmdBindDescriptorSets - Binds descriptor sets to a command buffer
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer that the descriptor sets will
--     be bound to.
--
-- -   @pipelineBindPoint@ is a
--     'Graphics.Vulkan.C.Core10.Pass.VkPipelineBindPoint' indicating
--     whether the descriptors will be used by graphics pipelines or
--     compute pipelines. There is a separate set of bind points for each
--     of graphics and compute, so binding one does not disturb the other.
--
-- -   @layout@ is a 'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout'
--     object used to program the bindings.
--
-- -   @firstSet@ is the set number of the first descriptor set to be
--     bound.
--
-- -   @descriptorSetCount@ is the number of elements in the
--     @pDescriptorSets@ array.
--
-- -   @pDescriptorSets@ is an array of handles to
--     'Graphics.Vulkan.C.Core10.DescriptorSet.VkDescriptorSet' objects
--     describing the descriptor sets to write to.
--
-- -   @dynamicOffsetCount@ is the number of dynamic offsets in the
--     @pDynamicOffsets@ array.
--
-- -   @pDynamicOffsets@ is a pointer to an array of @uint32_t@ values
--     specifying dynamic offsets.
--
-- = Description
--
-- 'vkCmdBindDescriptorSets' causes the sets numbered [@firstSet@..
-- @firstSet@+@descriptorSetCount@-1] to use the bindings stored in
-- @pDescriptorSets@[0..@descriptorSetCount@-1] for subsequent rendering
-- commands (either compute or graphics, according to the
-- @pipelineBindPoint@). Any bindings that were previously applied via
-- these sets are no longer valid.
--
-- Once bound, a descriptor set affects rendering of subsequent graphics or
-- compute commands in the command buffer until a different set is bound to
-- the same set number, or else until the set is disturbed as described in
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#descriptorsets-compatibility Pipeline Layout Compatibility>.
--
-- A compatible descriptor set /must/ be bound for all set numbers that any
-- shaders in a pipeline access, at the time that a draw or dispatch
-- command is recorded to execute using that pipeline. However, if none of
-- the shaders in a pipeline statically use any bindings with a particular
-- set number, then no descriptor set need be bound for that set number,
-- even if the pipeline layout includes a non-trivial descriptor set layout
-- for that set number.
--
-- If any of the sets being bound include dynamic uniform or storage
-- buffers, then @pDynamicOffsets@ includes one element for each array
-- element in each dynamic descriptor type binding in each set. Values are
-- taken from @pDynamicOffsets@ in an order such that all entries for set N
-- come before set N+1; within a set, entries are ordered by the binding
-- numbers in the descriptor set layouts; and within a binding array,
-- elements are in order. @dynamicOffsetCount@ /must/ equal the total
-- number of dynamic descriptors in the sets being bound.
--
-- The effective offset used for dynamic uniform and storage buffer
-- bindings is the sum of the relative offset taken from @pDynamicOffsets@,
-- and the base address of the buffer plus base offset in the descriptor
-- set. The range of the dynamic uniform and storage buffer bindings is the
-- buffer range as specified in the descriptor set.
--
-- Each of the @pDescriptorSets@ /must/ be compatible with the pipeline
-- layout specified by @layout@. The layout used to program the bindings
-- /must/ also be compatible with the pipeline used in subsequent graphics
-- or compute commands, as defined in the
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#descriptorsets-compatibility Pipeline Layout Compatibility>
-- section.
--
-- The descriptor set contents bound by a call to 'vkCmdBindDescriptorSets'
-- /may/ be consumed at the following times:
--
-- -   during host execution of the command, or during shader execution of
--     the resulting draws and dispatches, or any time in between.
--
-- Thus, the contents of a descriptor set binding /must/ not be altered
-- (overwritten by an update command, or freed) between the first point in
-- time that it /may/ be consumed, and when the command completes executing
-- on the queue.
--
-- The contents of @pDynamicOffsets@ are consumed immediately during
-- execution of 'vkCmdBindDescriptorSets'. Once all pending uses have
-- completed, it is legal to update and reuse a descriptor set.
--
-- == Valid Usage
--
-- -   Each element of @pDescriptorSets@ /must/ have been allocated with a
--     'Graphics.Vulkan.C.Core10.PipelineLayout.VkDescriptorSetLayout' that
--     matches (is the same as, or identically defined as) the
--     'Graphics.Vulkan.C.Core10.PipelineLayout.VkDescriptorSetLayout' at
--     set /n/ in @layout@, where /n/ is the sum of @firstSet@ and the
--     index into @pDescriptorSets@
--
-- -   @dynamicOffsetCount@ /must/ be equal to the total number of dynamic
--     descriptors in @pDescriptorSets@
--
-- -   The sum of @firstSet@ and @descriptorSetCount@ /must/ be less than
--     or equal to
--     'Graphics.Vulkan.C.Core10.PipelineLayout.VkPipelineLayoutCreateInfo'::@setLayoutCount@
--     provided when @layout@ was created
--
-- -   @pipelineBindPoint@ /must/ be supported by the @commandBuffer@’s
--     parent 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool'’s queue
--     family
--
-- -   Each element of @pDynamicOffsets@ which corresponds to a descriptor
--     binding with type
--     'Graphics.Vulkan.C.Core10.DescriptorSet.VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC'
--     /must/ be a multiple of
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceLimits'::@minUniformBufferOffsetAlignment@
--
-- -   Each element of @pDynamicOffsets@ which corresponds to a descriptor
--     binding with type
--     'Graphics.Vulkan.C.Core10.DescriptorSet.VK_DESCRIPTOR_TYPE_STORAGE_BUFFER_DYNAMIC'
--     /must/ be a multiple of
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceLimits'::@minStorageBufferOffsetAlignment@
--
-- -   For each dynamic uniform or storage buffer binding in
--     @pDescriptorSets@, the sum of the effective offset, as defined
--     above, and the range of the binding /must/ be less than or equal to
--     the size of the buffer
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @pipelineBindPoint@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Pass.VkPipelineBindPoint' value
--
-- -   @layout@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' handle
--
-- -   @pDescriptorSets@ /must/ be a valid pointer to an array of
--     @descriptorSetCount@ valid
--     'Graphics.Vulkan.C.Core10.DescriptorSet.VkDescriptorSet' handles
--
-- -   If @dynamicOffsetCount@ is not @0@, @pDynamicOffsets@ /must/ be a
--     valid pointer to an array of @dynamicOffsetCount@ @uint32_t@ values
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics, or
--     compute operations
--
-- -   @descriptorSetCount@ /must/ be greater than @0@
--
-- -   Each of @commandBuffer@, @layout@, and the elements of
--     @pDescriptorSets@ /must/ have been created, allocated, or retrieved
--     from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Both            | Graphics        |                 |
-- > | Secondary       |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.DescriptorSet.VkDescriptorSet',
-- 'Graphics.Vulkan.C.Core10.Pass.VkPipelineBindPoint',
-- 'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdBindDescriptorSets" vkCmdBindDescriptorSets :: ("commandBuffer" ::: VkCommandBuffer) -> ("pipelineBindPoint" ::: VkPipelineBindPoint) -> ("layout" ::: VkPipelineLayout) -> ("firstSet" ::: Word32) -> ("descriptorSetCount" ::: Word32) -> ("pDescriptorSets" ::: Ptr VkDescriptorSet) -> ("dynamicOffsetCount" ::: Word32) -> ("pDynamicOffsets" ::: Ptr Word32) -> IO ()
#else
vkCmdBindDescriptorSets :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("pipelineBindPoint" ::: VkPipelineBindPoint) -> ("layout" ::: VkPipelineLayout) -> ("firstSet" ::: Word32) -> ("descriptorSetCount" ::: Word32) -> ("pDescriptorSets" ::: Ptr VkDescriptorSet) -> ("dynamicOffsetCount" ::: Word32) -> ("pDynamicOffsets" ::: Ptr Word32) -> IO ()
vkCmdBindDescriptorSets deviceCmds = mkVkCmdBindDescriptorSets (pVkCmdBindDescriptorSets deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdBindDescriptorSets
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("pipelineBindPoint" ::: VkPipelineBindPoint) -> ("layout" ::: VkPipelineLayout) -> ("firstSet" ::: Word32) -> ("descriptorSetCount" ::: Word32) -> ("pDescriptorSets" ::: Ptr VkDescriptorSet) -> ("dynamicOffsetCount" ::: Word32) -> ("pDynamicOffsets" ::: Ptr Word32) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("pipelineBindPoint" ::: VkPipelineBindPoint) -> ("layout" ::: VkPipelineLayout) -> ("firstSet" ::: Word32) -> ("descriptorSetCount" ::: Word32) -> ("pDescriptorSets" ::: Ptr VkDescriptorSet) -> ("dynamicOffsetCount" ::: Word32) -> ("pDynamicOffsets" ::: Ptr Word32) -> IO ())
#endif

type FN_vkCmdBindDescriptorSets = ("commandBuffer" ::: VkCommandBuffer) -> ("pipelineBindPoint" ::: VkPipelineBindPoint) -> ("layout" ::: VkPipelineLayout) -> ("firstSet" ::: Word32) -> ("descriptorSetCount" ::: Word32) -> ("pDescriptorSets" ::: Ptr VkDescriptorSet) -> ("dynamicOffsetCount" ::: Word32) -> ("pDynamicOffsets" ::: Ptr Word32) -> IO ()
type PFN_vkCmdBindDescriptorSets = FunPtr FN_vkCmdBindDescriptorSets

-- | vkCmdBindIndexBuffer - Bind an index buffer to a command buffer
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command is
--     recorded.
--
-- -   @buffer@ is the buffer being bound.
--
-- -   @offset@ is the starting offset in bytes within @buffer@ used in
--     index buffer address calculations.
--
-- -   @indexType@ is a 'VkIndexType' value specifying whether indices are
--     treated as 16 bits or 32 bits.
--
-- == Valid Usage
--
-- -   @offset@ /must/ be less than the size of @buffer@
--
-- -   The sum of @offset@ and the address of the range of
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object that is
--     backing @buffer@, /must/ be a multiple of the type indicated by
--     @indexType@
--
-- -   @buffer@ /must/ have been created with the
--     'Graphics.Vulkan.C.Core10.Buffer.VK_BUFFER_USAGE_INDEX_BUFFER_BIT'
--     flag
--
-- -   If @buffer@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @buffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer' handle
--
-- -   @indexType@ /must/ be a valid 'VkIndexType' value
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   Both of @buffer@, and @commandBuffer@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Both            | Graphics        |                 |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer',
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDeviceSize',
-- 'VkIndexType'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdBindIndexBuffer" vkCmdBindIndexBuffer :: ("commandBuffer" ::: VkCommandBuffer) -> ("buffer" ::: VkBuffer) -> ("offset" ::: VkDeviceSize) -> ("indexType" ::: VkIndexType) -> IO ()
#else
vkCmdBindIndexBuffer :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("buffer" ::: VkBuffer) -> ("offset" ::: VkDeviceSize) -> ("indexType" ::: VkIndexType) -> IO ()
vkCmdBindIndexBuffer deviceCmds = mkVkCmdBindIndexBuffer (pVkCmdBindIndexBuffer deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdBindIndexBuffer
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("buffer" ::: VkBuffer) -> ("offset" ::: VkDeviceSize) -> ("indexType" ::: VkIndexType) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("buffer" ::: VkBuffer) -> ("offset" ::: VkDeviceSize) -> ("indexType" ::: VkIndexType) -> IO ())
#endif

type FN_vkCmdBindIndexBuffer = ("commandBuffer" ::: VkCommandBuffer) -> ("buffer" ::: VkBuffer) -> ("offset" ::: VkDeviceSize) -> ("indexType" ::: VkIndexType) -> IO ()
type PFN_vkCmdBindIndexBuffer = FunPtr FN_vkCmdBindIndexBuffer

-- | vkCmdBindPipeline - Bind a pipeline object to a command buffer
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer that the pipeline will be
--     bound to.
--
-- -   @pipelineBindPoint@ is a
--     'Graphics.Vulkan.C.Core10.Pass.VkPipelineBindPoint' value specifying
--     whether to bind to the compute or graphics bind point. Binding one
--     does not disturb the other.
--
-- -   @pipeline@ is the pipeline to be bound.
--
-- = Description
--
-- Once bound, a pipeline binding affects subsequent graphics or compute
-- commands in the command buffer until a different pipeline is bound to
-- the bind point. The pipeline bound to
-- 'Graphics.Vulkan.C.Core10.Pass.VK_PIPELINE_BIND_POINT_COMPUTE' controls
-- the behavior of 'vkCmdDispatch' and 'vkCmdDispatchIndirect'. The
-- pipeline bound to
-- 'Graphics.Vulkan.C.Core10.Pass.VK_PIPELINE_BIND_POINT_GRAPHICS' controls
-- the behavior of all
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#drawing drawing commands>.
-- No other commands are affected by the pipeline state.
--
-- == Valid Usage
--
-- -   If @pipelineBindPoint@ is
--     'Graphics.Vulkan.C.Core10.Pass.VK_PIPELINE_BIND_POINT_COMPUTE', the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support compute operations
--
-- -   If @pipelineBindPoint@ is
--     'Graphics.Vulkan.C.Core10.Pass.VK_PIPELINE_BIND_POINT_GRAPHICS', the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   If @pipelineBindPoint@ is
--     'Graphics.Vulkan.C.Core10.Pass.VK_PIPELINE_BIND_POINT_COMPUTE',
--     @pipeline@ /must/ be a compute pipeline
--
-- -   If @pipelineBindPoint@ is
--     'Graphics.Vulkan.C.Core10.Pass.VK_PIPELINE_BIND_POINT_GRAPHICS',
--     @pipeline@ /must/ be a graphics pipeline
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-variableMultisampleRate variable multisample rate>
--     feature is not supported, @pipeline@ is a graphics pipeline, the
--     current subpass has no attachments, and this is not the first call
--     to this function with a graphics pipeline after transitioning to the
--     current subpass, then the sample count specified by this pipeline
--     /must/ match that set in the previous pipeline
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @pipelineBindPoint@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Pass.VkPipelineBindPoint' value
--
-- -   @pipeline@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' handle
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics, or
--     compute operations
--
-- -   Both of @commandBuffer@, and @pipeline@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Both            | Graphics        |                 |
-- > | Secondary       |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline',
-- 'Graphics.Vulkan.C.Core10.Pass.VkPipelineBindPoint'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdBindPipeline" vkCmdBindPipeline :: ("commandBuffer" ::: VkCommandBuffer) -> ("pipelineBindPoint" ::: VkPipelineBindPoint) -> ("pipeline" ::: VkPipeline) -> IO ()
#else
vkCmdBindPipeline :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("pipelineBindPoint" ::: VkPipelineBindPoint) -> ("pipeline" ::: VkPipeline) -> IO ()
vkCmdBindPipeline deviceCmds = mkVkCmdBindPipeline (pVkCmdBindPipeline deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdBindPipeline
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("pipelineBindPoint" ::: VkPipelineBindPoint) -> ("pipeline" ::: VkPipeline) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("pipelineBindPoint" ::: VkPipelineBindPoint) -> ("pipeline" ::: VkPipeline) -> IO ())
#endif

type FN_vkCmdBindPipeline = ("commandBuffer" ::: VkCommandBuffer) -> ("pipelineBindPoint" ::: VkPipelineBindPoint) -> ("pipeline" ::: VkPipeline) -> IO ()
type PFN_vkCmdBindPipeline = FunPtr FN_vkCmdBindPipeline

-- | vkCmdBindVertexBuffers - Bind vertex buffers to a command buffer
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command is
--     recorded.
--
-- -   @firstBinding@ is the index of the first vertex input binding whose
--     state is updated by the command.
--
-- -   @bindingCount@ is the number of vertex input bindings whose state is
--     updated by the command.
--
-- -   @pBuffers@ is a pointer to an array of buffer handles.
--
-- -   @pOffsets@ is a pointer to an array of buffer offsets.
--
-- = Description
--
-- The values taken from elements i of @pBuffers@ and @pOffsets@ replace
-- the current state for the vertex input binding @firstBinding@ + i, for i
-- in [0, @bindingCount@). The vertex input binding is updated to start at
-- the offset indicated by @pOffsets@[i] from the start of the buffer
-- @pBuffers@[i]. All vertex input attributes that use each of these
-- bindings will use these updated addresses in their address calculations
-- for subsequent draw commands.
--
-- == Valid Usage
--
-- -   @firstBinding@ /must/ be less than
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceLimits'::@maxVertexInputBindings@
--
-- -   The sum of @firstBinding@ and @bindingCount@ /must/ be less than or
--     equal to
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceLimits'::@maxVertexInputBindings@
--
-- -   All elements of @pOffsets@ /must/ be less than the size of the
--     corresponding element in @pBuffers@
--
-- -   All elements of @pBuffers@ /must/ have been created with the
--     'Graphics.Vulkan.C.Core10.Buffer.VK_BUFFER_USAGE_VERTEX_BUFFER_BIT'
--     flag
--
-- -   Each element of @pBuffers@ that is non-sparse /must/ be bound
--     completely and contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @pBuffers@ /must/ be a valid pointer to an array of @bindingCount@
--     valid 'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer' handles
--
-- -   @pOffsets@ /must/ be a valid pointer to an array of @bindingCount@
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDeviceSize' values
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   @bindingCount@ /must/ be greater than @0@
--
-- -   Both of @commandBuffer@, and the elements of @pBuffers@ /must/ have
--     been created, allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Both            | Graphics        |                 |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer',
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDeviceSize'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdBindVertexBuffers" vkCmdBindVertexBuffers :: ("commandBuffer" ::: VkCommandBuffer) -> ("firstBinding" ::: Word32) -> ("bindingCount" ::: Word32) -> ("pBuffers" ::: Ptr VkBuffer) -> ("pOffsets" ::: Ptr VkDeviceSize) -> IO ()
#else
vkCmdBindVertexBuffers :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("firstBinding" ::: Word32) -> ("bindingCount" ::: Word32) -> ("pBuffers" ::: Ptr VkBuffer) -> ("pOffsets" ::: Ptr VkDeviceSize) -> IO ()
vkCmdBindVertexBuffers deviceCmds = mkVkCmdBindVertexBuffers (pVkCmdBindVertexBuffers deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdBindVertexBuffers
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("firstBinding" ::: Word32) -> ("bindingCount" ::: Word32) -> ("pBuffers" ::: Ptr VkBuffer) -> ("pOffsets" ::: Ptr VkDeviceSize) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("firstBinding" ::: Word32) -> ("bindingCount" ::: Word32) -> ("pBuffers" ::: Ptr VkBuffer) -> ("pOffsets" ::: Ptr VkDeviceSize) -> IO ())
#endif

type FN_vkCmdBindVertexBuffers = ("commandBuffer" ::: VkCommandBuffer) -> ("firstBinding" ::: Word32) -> ("bindingCount" ::: Word32) -> ("pBuffers" ::: Ptr VkBuffer) -> ("pOffsets" ::: Ptr VkDeviceSize) -> IO ()
type PFN_vkCmdBindVertexBuffers = FunPtr FN_vkCmdBindVertexBuffers

-- | vkCmdBlitImage - Copy regions of an image, potentially performing format
-- conversion,
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @srcImage@ is the source image.
--
-- -   @srcImageLayout@ is the layout of the source image subresources for
--     the blit.
--
-- -   @dstImage@ is the destination image.
--
-- -   @dstImageLayout@ is the layout of the destination image subresources
--     for the blit.
--
-- -   @regionCount@ is the number of regions to blit.
--
-- -   @pRegions@ is a pointer to an array of 'VkImageBlit' structures
--     specifying the regions to blit.
--
-- -   @filter@ is a 'Graphics.Vulkan.C.Core10.Sampler.VkFilter' specifying
--     the filter to apply if the blits require scaling.
--
-- = Description
--
-- 'vkCmdBlitImage' /must/ not be used for multisampled source or
-- destination images. Use 'vkCmdResolveImage' for this purpose.
--
-- As the sizes of the source and destination extents /can/ differ in any
-- dimension, texels in the source extent are scaled and filtered to the
-- destination extent. Scaling occurs via the following operations:
--
-- -   For each destination texel, the integer coordinate of that texel is
--     converted to an unnormalized texture coordinate, using the effective
--     inverse of the equations described in
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#textures-unnormalized-to-integer unnormalized to integer conversion>:
--
--     -   ubase = i + ½
--
--     -   vbase = j + ½
--
--     -   wbase = k + ½
--
-- -   These base coordinates are then offset by the first destination
--     offset:
--
--     -   uoffset = ubase - xdst0
--
--     -   voffset = vbase - ydst0
--
--     -   woffset = wbase - zdst0
--
--     -   aoffset = a - @baseArrayCount@dst
--
-- -   The scale is determined from the source and destination regions, and
--     applied to the offset coordinates:
--
--     -   scale_u = (xsrc1 - xsrc0) \/ (xdst1 - xdst0)
--
--     -   scale_v = (ysrc1 - ysrc0) \/ (ydst1 - ydst0)
--
--     -   scale_w = (zsrc1 - zsrc0) \/ (zdst1 - zdst0)
--
--     -   uscaled = uoffset * scaleu
--
--     -   vscaled = voffset * scalev
--
--     -   wscaled = woffset * scalew
--
-- -   Finally the source offset is added to the scaled coordinates, to
--     determine the final unnormalized coordinates used to sample from
--     @srcImage@:
--
--     -   u = uscaled + xsrc0
--
--     -   v = vscaled + ysrc0
--
--     -   w = wscaled + zsrc0
--
--     -   q = @mipLevel@
--
--     -   a = aoffset + @baseArrayCount@src
--
-- These coordinates are used to sample from the source image, as described
-- in
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#textures Image Operations chapter>,
-- with the filter mode equal to that of @filter@, a mipmap mode of
-- 'Graphics.Vulkan.C.Core10.Sampler.VK_SAMPLER_MIPMAP_MODE_NEAREST' and an
-- address mode of
-- 'Graphics.Vulkan.C.Core10.Sampler.VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE'.
-- Implementations /must/ clamp at the edge of the source image, and /may/
-- additionally clamp to the edge of the source region.
--
-- __Note__
--
-- Due to allowable rounding errors in the generation of the source texture
-- coordinates, it is not always possible to guarantee exactly which source
-- texels will be sampled for a given blit. As rounding errors are
-- implementation dependent, the exact results of a blitting operation are
-- also implementation dependent.
--
-- Blits are done layer by layer starting with the @baseArrayLayer@ member
-- of @srcSubresource@ for the source and @dstSubresource@ for the
-- destination. @layerCount@ layers are blitted to the destination image.
--
-- 3D textures are blitted slice by slice. Slices in the source region
-- bounded by @srcOffsets@[0].@z@ and @srcOffsets@[1].@z@ are copied to
-- slices in the destination region bounded by @dstOffsets@[0].@z@ and
-- @dstOffsets@[1].@z@. For each destination slice, a source __z__
-- coordinate is linearly interpolated between @srcOffsets@[0].@z@ and
-- @srcOffsets@[1].@z@. If the @filter@ parameter is
-- 'Graphics.Vulkan.C.Core10.Sampler.VK_FILTER_LINEAR' then the value
-- sampled from the source image is taken by doing linear filtering using
-- the interpolated __z__ coordinate. If @filter@ parameter is
-- 'Graphics.Vulkan.C.Core10.Sampler.VK_FILTER_NEAREST' then the value
-- sampled from the source image is taken from the single nearest slice,
-- with an implementation-dependent arithmetic rounding mode.
--
-- The following filtering and conversion rules apply:
--
-- -   Integer formats /can/ only be converted to other integer formats
--     with the same signedness.
--
-- -   No format conversion is supported between depth\/stencil images. The
--     formats /must/ match.
--
-- -   Format conversions on unorm, snorm, unscaled and packed float
--     formats of the copied aspect of the image are performed by first
--     converting the pixels to float values.
--
-- -   For sRGB source formats, nonlinear RGB values are converted to
--     linear representation prior to filtering.
--
-- -   After filtering, the float values are first clamped and then cast to
--     the destination image format. In case of sRGB destination format,
--     linear RGB values are converted to nonlinear representation before
--     writing the pixel to the image.
--
-- Signed and unsigned integers are converted by first clamping to the
-- representable range of the destination format, then casting the value.
--
-- == Valid Usage
--
-- -   The source region specified by each element of @pRegions@ /must/ be
--     a region that is contained within @srcImage@
--
-- -   The destination region specified by each element of @pRegions@
--     /must/ be a region that is contained within @dstImage@
--
-- -   The union of all destination regions, specified by the elements of
--     @pRegions@, /must/ not overlap in memory with any texel that /may/
--     be sampled during the blit operation
--
-- -   The
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#resources-image-format-features format features>
--     of @srcImage@ /must/ contain
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_FORMAT_FEATURE_BLIT_SRC_BIT'.
--
-- -   @srcImage@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_TRANSFER_SRC_BIT'
--     usage flag
--
-- -   If @srcImage@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- -   @srcImageLayout@ /must/ specify the layout of the image subresources
--     of @srcImage@ specified in @pRegions@ at the time this command is
--     executed on a
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- -   @srcImageLayout@ /must/ be
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL'
--     or 'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_GENERAL'
--
-- -   The
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#resources-image-format-features format features>
--     of @dstImage@ /must/ contain
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_FORMAT_FEATURE_BLIT_DST_BIT'.
--
-- -   @dstImage@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_TRANSFER_DST_BIT'
--     usage flag
--
-- -   If @dstImage@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- -   @dstImageLayout@ /must/ specify the layout of the image subresources
--     of @dstImage@ specified in @pRegions@ at the time this command is
--     executed on a
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- -   @dstImageLayout@ /must/ be
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL'
--     or 'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_GENERAL'
--
-- -   The sample count of @srcImage@ and @dstImage@ /must/ both be equal
--     to
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_SAMPLE_COUNT_1_BIT'
--
-- -   If either of @srcImage@ or @dstImage@ was created with a signed
--     integer 'Graphics.Vulkan.C.Core10.Core.VkFormat', the other /must/
--     also have been created with a signed integer
--     'Graphics.Vulkan.C.Core10.Core.VkFormat'
--
-- -   If either of @srcImage@ or @dstImage@ was created with an unsigned
--     integer 'Graphics.Vulkan.C.Core10.Core.VkFormat', the other /must/
--     also have been created with an unsigned integer
--     'Graphics.Vulkan.C.Core10.Core.VkFormat'
--
-- -   If either of @srcImage@ or @dstImage@ was created with a
--     depth\/stencil format, the other /must/ have exactly the same format
--
-- -   If @srcImage@ was created with a depth\/stencil format, @filter@
--     /must/ be 'Graphics.Vulkan.C.Core10.Sampler.VK_FILTER_NEAREST'
--
-- -   @srcImage@ /must/ have been created with a @samples@ value of
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_SAMPLE_COUNT_1_BIT'
--
-- -   @dstImage@ /must/ have been created with a @samples@ value of
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_SAMPLE_COUNT_1_BIT'
--
-- -   If @filter@ is 'Graphics.Vulkan.C.Core10.Sampler.VK_FILTER_LINEAR',
--     then the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#resources-image-format-features format features>
--     of @srcImage@ /must/ contain
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT'.
--
-- -   The @srcSubresource.mipLevel@ member of each element of @pRegions@
--     /must/ be less than the @mipLevels@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @srcImage@
--     was created
--
-- -   The @dstSubresource.mipLevel@ member of each element of @pRegions@
--     /must/ be less than the @mipLevels@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @dstImage@
--     was created
--
-- -   The @srcSubresource.baseArrayLayer@ + @srcSubresource.layerCount@ of
--     each element of @pRegions@ /must/ be less than or equal to the
--     @arrayLayers@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @srcImage@
--     was created
--
-- -   The @dstSubresource.baseArrayLayer@ + @dstSubresource.layerCount@ of
--     each element of @pRegions@ /must/ be less than or equal to the
--     @arrayLayers@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @dstImage@
--     was created
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @srcImage@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' handle
--
-- -   @srcImageLayout@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Image.VkImageLayout' value
--
-- -   @dstImage@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' handle
--
-- -   @dstImageLayout@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Image.VkImageLayout' value
--
-- -   @pRegions@ /must/ be a valid pointer to an array of @regionCount@
--     valid 'VkImageBlit' structures
--
-- -   @filter@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Sampler.VkFilter' value
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   This command /must/ only be called outside of a render pass instance
--
-- -   @regionCount@ /must/ be greater than @0@
--
-- -   Each of @commandBuffer@, @dstImage@, and @srcImage@ /must/ have been
--     created, allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Outside         | Graphics        | Transfer        |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.Sampler.VkFilter',
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage', 'VkImageBlit',
-- 'Graphics.Vulkan.C.Core10.Image.VkImageLayout'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdBlitImage" vkCmdBlitImage :: ("commandBuffer" ::: VkCommandBuffer) -> ("srcImage" ::: VkImage) -> ("srcImageLayout" ::: VkImageLayout) -> ("dstImage" ::: VkImage) -> ("dstImageLayout" ::: VkImageLayout) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkImageBlit) -> ("filter" ::: VkFilter) -> IO ()
#else
vkCmdBlitImage :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("srcImage" ::: VkImage) -> ("srcImageLayout" ::: VkImageLayout) -> ("dstImage" ::: VkImage) -> ("dstImageLayout" ::: VkImageLayout) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkImageBlit) -> ("filter" ::: VkFilter) -> IO ()
vkCmdBlitImage deviceCmds = mkVkCmdBlitImage (pVkCmdBlitImage deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdBlitImage
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("srcImage" ::: VkImage) -> ("srcImageLayout" ::: VkImageLayout) -> ("dstImage" ::: VkImage) -> ("dstImageLayout" ::: VkImageLayout) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkImageBlit) -> ("filter" ::: VkFilter) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("srcImage" ::: VkImage) -> ("srcImageLayout" ::: VkImageLayout) -> ("dstImage" ::: VkImage) -> ("dstImageLayout" ::: VkImageLayout) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkImageBlit) -> ("filter" ::: VkFilter) -> IO ())
#endif

type FN_vkCmdBlitImage = ("commandBuffer" ::: VkCommandBuffer) -> ("srcImage" ::: VkImage) -> ("srcImageLayout" ::: VkImageLayout) -> ("dstImage" ::: VkImage) -> ("dstImageLayout" ::: VkImageLayout) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkImageBlit) -> ("filter" ::: VkFilter) -> IO ()
type PFN_vkCmdBlitImage = FunPtr FN_vkCmdBlitImage

-- | vkCmdClearAttachments - Clear regions within bound framebuffer
-- attachments
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @attachmentCount@ is the number of entries in the @pAttachments@
--     array.
--
-- -   @pAttachments@ is a pointer to an array of 'VkClearAttachment'
--     structures defining the attachments to clear and the clear values to
--     use. If any attachment to be cleared in the current subpass is
--     'Graphics.Vulkan.C.Core10.Constants.VK_ATTACHMENT_UNUSED', then the
--     clear has no effect on that attachment.
--
-- -   @rectCount@ is the number of entries in the @pRects@ array.
--
-- -   @pRects@ points to an array of 'VkClearRect' structures defining
--     regions within each selected attachment to clear.
--
-- = Description
--
-- 'vkCmdClearAttachments' /can/ clear multiple regions of each attachment
-- used in the current subpass of a render pass instance. This command
-- /must/ be called only inside a render pass instance, and implicitly
-- selects the images to clear based on the current framebuffer attachments
-- and the command parameters.
--
-- Unlike other
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#clears clear commands>,
-- 'vkCmdClearAttachments' executes as a drawing command, rather than a
-- transfer command, with writes performed by it executing in
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#primrast-order rasterization order>.
-- Clears to color attachments are executed as color attachment writes, by
-- the
-- 'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT'
-- stage. Clears to depth\/stencil attachments are executed as
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#fragops-depth depth writes>
-- and
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#fragops-stencil writes>
-- by the
-- 'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_EARLY_FRAGMENT_TESTS_BIT'
-- and
-- 'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_LATE_FRAGMENT_TESTS_BIT'
-- stages.
--
-- == Valid Usage
--
-- -   If the @aspectMask@ member of any element of @pAttachments@ contains
--     'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VK_IMAGE_ASPECT_COLOR_BIT',
--     then the @colorAttachment@ member of that element /must/ either
--     refer to a color attachment which is
--     'Graphics.Vulkan.C.Core10.Constants.VK_ATTACHMENT_UNUSED', or /must/
--     be a valid color attachment.
--
-- -   If the @aspectMask@ member of any element of @pAttachments@ contains
--     'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VK_IMAGE_ASPECT_DEPTH_BIT',
--     then the current subpass\' depth\/stencil attachment /must/ either
--     be 'Graphics.Vulkan.C.Core10.Constants.VK_ATTACHMENT_UNUSED', or
--     /must/ have a depth component
--
-- -   If the @aspectMask@ member of any element of @pAttachments@ contains
--     'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VK_IMAGE_ASPECT_STENCIL_BIT',
--     then the current subpass\' depth\/stencil attachment /must/ either
--     be 'Graphics.Vulkan.C.Core10.Constants.VK_ATTACHMENT_UNUSED', or
--     /must/ have a stencil component
--
-- -   The @rect@ member of each element of @pRects@ /must/ have an
--     @extent.width@ greater than @0@
--
-- -   The @rect@ member of each element of @pRects@ /must/ have an
--     @extent.height@ greater than @0@
--
-- -   The rectangular region specified by each element of @pRects@ /must/
--     be contained within the render area of the current render pass
--     instance
--
-- -   The layers specified by each element of @pRects@ /must/ be contained
--     within every attachment that @pAttachments@ refers to
--
-- -   The @layerCount@ member of each element of @pRects@ /must/ not be
--     @0@
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @pAttachments@ /must/ be a valid pointer to an array of
--     @attachmentCount@ valid 'VkClearAttachment' structures
--
-- -   @pRects@ /must/ be a valid pointer to an array of @rectCount@
--     'VkClearRect' structures
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   This command /must/ only be called inside of a render pass instance
--
-- -   @attachmentCount@ /must/ be greater than @0@
--
-- -   @rectCount@ /must/ be greater than @0@
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Inside          | Graphics        | Graphics        |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'VkClearAttachment', 'VkClearRect',
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdClearAttachments" vkCmdClearAttachments :: ("commandBuffer" ::: VkCommandBuffer) -> ("attachmentCount" ::: Word32) -> ("pAttachments" ::: Ptr VkClearAttachment) -> ("rectCount" ::: Word32) -> ("pRects" ::: Ptr VkClearRect) -> IO ()
#else
vkCmdClearAttachments :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("attachmentCount" ::: Word32) -> ("pAttachments" ::: Ptr VkClearAttachment) -> ("rectCount" ::: Word32) -> ("pRects" ::: Ptr VkClearRect) -> IO ()
vkCmdClearAttachments deviceCmds = mkVkCmdClearAttachments (pVkCmdClearAttachments deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdClearAttachments
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("attachmentCount" ::: Word32) -> ("pAttachments" ::: Ptr VkClearAttachment) -> ("rectCount" ::: Word32) -> ("pRects" ::: Ptr VkClearRect) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("attachmentCount" ::: Word32) -> ("pAttachments" ::: Ptr VkClearAttachment) -> ("rectCount" ::: Word32) -> ("pRects" ::: Ptr VkClearRect) -> IO ())
#endif

type FN_vkCmdClearAttachments = ("commandBuffer" ::: VkCommandBuffer) -> ("attachmentCount" ::: Word32) -> ("pAttachments" ::: Ptr VkClearAttachment) -> ("rectCount" ::: Word32) -> ("pRects" ::: Ptr VkClearRect) -> IO ()
type PFN_vkCmdClearAttachments = FunPtr FN_vkCmdClearAttachments

-- | vkCmdClearColorImage - Clear regions of a color image
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @image@ is the image to be cleared.
--
-- -   @imageLayout@ specifies the current layout of the image subresource
--     ranges to be cleared, and /must/ be
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_GENERAL' or
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL'.
--
-- -   @pColor@ is a pointer to a 'VkClearColorValue' structure that
--     contains the values the image subresource ranges will be cleared to
--     (see
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#clears-values>
--     below).
--
-- -   @rangeCount@ is the number of image subresource range structures in
--     @pRanges@.
--
-- -   @pRanges@ points to an array of
--     'Graphics.Vulkan.C.Core10.ImageView.VkImageSubresourceRange'
--     structures that describe a range of mipmap levels, array layers, and
--     aspects to be cleared, as described in
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#resources-image-views Image Views>.
--
-- = Description
--
-- Each specified range in @pRanges@ is cleared to the value specified by
-- @pColor@.
--
-- == Valid Usage
--
-- -   @image@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_TRANSFER_DST_BIT'
--     usage flag
--
-- -   If @image@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- -   @imageLayout@ /must/ specify the layout of the image subresource
--     ranges of @image@ specified in @pRanges@ at the time this command is
--     executed on a
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- -   @imageLayout@ /must/ be
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL'
--     or 'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_GENERAL'
--
-- -   The
--     'Graphics.Vulkan.C.Core10.ImageView.VkImageSubresourceRange'::@aspectMask@
--     members of the elements of the @pRanges@ array /must/ each only
--     include
--     'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VK_IMAGE_ASPECT_COLOR_BIT'
--
-- -   The
--     'Graphics.Vulkan.C.Core10.ImageView.VkImageSubresourceRange'::@baseMipLevel@
--     members of the elements of the @pRanges@ array /must/ each be less
--     than the @mipLevels@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @image@ was
--     created
--
-- -   For each
--     'Graphics.Vulkan.C.Core10.ImageView.VkImageSubresourceRange' element
--     of @pRanges@, if the @levelCount@ member is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_REMAINING_MIP_LEVELS', then
--     @baseMipLevel@ + @levelCount@ /must/ be less than the @mipLevels@
--     specified in 'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when
--     @image@ was created
--
-- -   The
--     'Graphics.Vulkan.C.Core10.ImageView.VkImageSubresourceRange'::@baseArrayLayer@
--     members of the elements of the @pRanges@ array /must/ each be less
--     than the @arrayLayers@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @image@ was
--     created
--
-- -   For each
--     'Graphics.Vulkan.C.Core10.ImageView.VkImageSubresourceRange' element
--     of @pRanges@, if the @layerCount@ member is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_REMAINING_ARRAY_LAYERS', then
--     @baseArrayLayer@ + @layerCount@ /must/ be less than the
--     @arrayLayers@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @image@ was
--     created
--
-- -   @image@ /must/ not have a compressed or depth\/stencil format
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @image@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' handle
--
-- -   @imageLayout@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Image.VkImageLayout' value
--
-- -   @pColor@ /must/ be a valid pointer to a valid 'VkClearColorValue'
--     union
--
-- -   @pRanges@ /must/ be a valid pointer to an array of @rangeCount@
--     valid 'Graphics.Vulkan.C.Core10.ImageView.VkImageSubresourceRange'
--     structures
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics, or
--     compute operations
--
-- -   This command /must/ only be called outside of a render pass instance
--
-- -   @rangeCount@ /must/ be greater than @0@
--
-- -   Both of @commandBuffer@, and @image@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Outside         | Graphics        | Transfer        |
-- > | Secondary       |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'VkClearColorValue', 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage',
-- 'Graphics.Vulkan.C.Core10.Image.VkImageLayout',
-- 'Graphics.Vulkan.C.Core10.ImageView.VkImageSubresourceRange'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdClearColorImage" vkCmdClearColorImage :: ("commandBuffer" ::: VkCommandBuffer) -> ("image" ::: VkImage) -> ("imageLayout" ::: VkImageLayout) -> ("pColor" ::: Ptr VkClearColorValue) -> ("rangeCount" ::: Word32) -> ("pRanges" ::: Ptr VkImageSubresourceRange) -> IO ()
#else
vkCmdClearColorImage :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("image" ::: VkImage) -> ("imageLayout" ::: VkImageLayout) -> ("pColor" ::: Ptr VkClearColorValue) -> ("rangeCount" ::: Word32) -> ("pRanges" ::: Ptr VkImageSubresourceRange) -> IO ()
vkCmdClearColorImage deviceCmds = mkVkCmdClearColorImage (pVkCmdClearColorImage deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdClearColorImage
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("image" ::: VkImage) -> ("imageLayout" ::: VkImageLayout) -> ("pColor" ::: Ptr VkClearColorValue) -> ("rangeCount" ::: Word32) -> ("pRanges" ::: Ptr VkImageSubresourceRange) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("image" ::: VkImage) -> ("imageLayout" ::: VkImageLayout) -> ("pColor" ::: Ptr VkClearColorValue) -> ("rangeCount" ::: Word32) -> ("pRanges" ::: Ptr VkImageSubresourceRange) -> IO ())
#endif

type FN_vkCmdClearColorImage = ("commandBuffer" ::: VkCommandBuffer) -> ("image" ::: VkImage) -> ("imageLayout" ::: VkImageLayout) -> ("pColor" ::: Ptr VkClearColorValue) -> ("rangeCount" ::: Word32) -> ("pRanges" ::: Ptr VkImageSubresourceRange) -> IO ()
type PFN_vkCmdClearColorImage = FunPtr FN_vkCmdClearColorImage

-- | vkCmdClearDepthStencilImage - Fill regions of a combined depth\/stencil
-- image
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @image@ is the image to be cleared.
--
-- -   @imageLayout@ specifies the current layout of the image subresource
--     ranges to be cleared, and /must/ be
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_GENERAL' or
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL'.
--
-- -   @pDepthStencil@ is a pointer to a 'VkClearDepthStencilValue'
--     structure that contains the values the depth and stencil image
--     subresource ranges will be cleared to (see
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#clears-values>
--     below).
--
-- -   @rangeCount@ is the number of image subresource range structures in
--     @pRanges@.
--
-- -   @pRanges@ points to an array of
--     'Graphics.Vulkan.C.Core10.ImageView.VkImageSubresourceRange'
--     structures that describe a range of mipmap levels, array layers, and
--     aspects to be cleared, as described in
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#resources-image-views Image Views>.
--
-- == Valid Usage
--
-- -   @image@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_TRANSFER_DST_BIT'
--     usage flag
--
-- -   If @image@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- -   @imageLayout@ /must/ specify the layout of the image subresource
--     ranges of @image@ specified in @pRanges@ at the time this command is
--     executed on a
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- -   @imageLayout@ /must/ be either of
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL'
--     or 'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_GENERAL'
--
-- -   The
--     'Graphics.Vulkan.C.Core10.ImageView.VkImageSubresourceRange'::@aspectMask@
--     members of the elements of the @pRanges@ array /must/ each only
--     include
--     'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VK_IMAGE_ASPECT_DEPTH_BIT'
--     if the image format has a depth component
--
-- -   The
--     'Graphics.Vulkan.C.Core10.ImageView.VkImageSubresourceRange'::@aspectMask@
--     members of the elements of the @pRanges@ array /must/ each only
--     include
--     'Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement.VK_IMAGE_ASPECT_STENCIL_BIT'
--     if the image format has a stencil component
--
-- -   The
--     'Graphics.Vulkan.C.Core10.ImageView.VkImageSubresourceRange'::@baseMipLevel@
--     members of the elements of the @pRanges@ array /must/ each be less
--     than the @mipLevels@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @image@ was
--     created
--
-- -   For each
--     'Graphics.Vulkan.C.Core10.ImageView.VkImageSubresourceRange' element
--     of @pRanges@, if the @levelCount@ member is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_REMAINING_MIP_LEVELS', then
--     @baseMipLevel@ + @levelCount@ /must/ be less than the @mipLevels@
--     specified in 'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when
--     @image@ was created
--
-- -   The
--     'Graphics.Vulkan.C.Core10.ImageView.VkImageSubresourceRange'::@baseArrayLayer@
--     members of the elements of the @pRanges@ array /must/ each be less
--     than the @arrayLayers@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @image@ was
--     created
--
-- -   For each
--     'Graphics.Vulkan.C.Core10.ImageView.VkImageSubresourceRange' element
--     of @pRanges@, if the @layerCount@ member is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_REMAINING_ARRAY_LAYERS', then
--     @baseArrayLayer@ + @layerCount@ /must/ be less than the
--     @arrayLayers@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @image@ was
--     created
--
-- -   @image@ /must/ have a depth\/stencil format
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @image@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' handle
--
-- -   @imageLayout@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Image.VkImageLayout' value
--
-- -   @pDepthStencil@ /must/ be a valid pointer to a valid
--     'VkClearDepthStencilValue' structure
--
-- -   @pRanges@ /must/ be a valid pointer to an array of @rangeCount@
--     valid 'Graphics.Vulkan.C.Core10.ImageView.VkImageSubresourceRange'
--     structures
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   This command /must/ only be called outside of a render pass instance
--
-- -   @rangeCount@ /must/ be greater than @0@
--
-- -   Both of @commandBuffer@, and @image@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Outside         | Graphics        | Transfer        |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'VkClearDepthStencilValue',
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage',
-- 'Graphics.Vulkan.C.Core10.Image.VkImageLayout',
-- 'Graphics.Vulkan.C.Core10.ImageView.VkImageSubresourceRange'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdClearDepthStencilImage" vkCmdClearDepthStencilImage :: ("commandBuffer" ::: VkCommandBuffer) -> ("image" ::: VkImage) -> ("imageLayout" ::: VkImageLayout) -> ("pDepthStencil" ::: Ptr VkClearDepthStencilValue) -> ("rangeCount" ::: Word32) -> ("pRanges" ::: Ptr VkImageSubresourceRange) -> IO ()
#else
vkCmdClearDepthStencilImage :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("image" ::: VkImage) -> ("imageLayout" ::: VkImageLayout) -> ("pDepthStencil" ::: Ptr VkClearDepthStencilValue) -> ("rangeCount" ::: Word32) -> ("pRanges" ::: Ptr VkImageSubresourceRange) -> IO ()
vkCmdClearDepthStencilImage deviceCmds = mkVkCmdClearDepthStencilImage (pVkCmdClearDepthStencilImage deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdClearDepthStencilImage
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("image" ::: VkImage) -> ("imageLayout" ::: VkImageLayout) -> ("pDepthStencil" ::: Ptr VkClearDepthStencilValue) -> ("rangeCount" ::: Word32) -> ("pRanges" ::: Ptr VkImageSubresourceRange) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("image" ::: VkImage) -> ("imageLayout" ::: VkImageLayout) -> ("pDepthStencil" ::: Ptr VkClearDepthStencilValue) -> ("rangeCount" ::: Word32) -> ("pRanges" ::: Ptr VkImageSubresourceRange) -> IO ())
#endif

type FN_vkCmdClearDepthStencilImage = ("commandBuffer" ::: VkCommandBuffer) -> ("image" ::: VkImage) -> ("imageLayout" ::: VkImageLayout) -> ("pDepthStencil" ::: Ptr VkClearDepthStencilValue) -> ("rangeCount" ::: Word32) -> ("pRanges" ::: Ptr VkImageSubresourceRange) -> IO ()
type PFN_vkCmdClearDepthStencilImage = FunPtr FN_vkCmdClearDepthStencilImage

-- | vkCmdCopyBuffer - Copy data between buffer regions
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @srcBuffer@ is the source buffer.
--
-- -   @dstBuffer@ is the destination buffer.
--
-- -   @regionCount@ is the number of regions to copy.
--
-- -   @pRegions@ is a pointer to an array of 'VkBufferCopy' structures
--     specifying the regions to copy.
--
-- = Description
--
-- Each region in @pRegions@ is copied from the source buffer to the same
-- region of the destination buffer. @srcBuffer@ and @dstBuffer@ /can/ be
-- the same buffer or alias the same memory, but the resulting values are
-- undefined if the copy regions overlap in memory.
--
-- == Valid Usage
--
-- -   The @srcOffset@ member of each element of @pRegions@ /must/ be less
--     than the size of @srcBuffer@
--
-- -   The @dstOffset@ member of each element of @pRegions@ /must/ be less
--     than the size of @dstBuffer@
--
-- -   The @size@ member of each element of @pRegions@ /must/ be less than
--     or equal to the size of @srcBuffer@ minus @srcOffset@
--
-- -   The @size@ member of each element of @pRegions@ /must/ be less than
--     or equal to the size of @dstBuffer@ minus @dstOffset@
--
-- -   The union of the source regions, and the union of the destination
--     regions, specified by the elements of @pRegions@, /must/ not overlap
--     in memory
--
-- -   @srcBuffer@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.Buffer.VK_BUFFER_USAGE_TRANSFER_SRC_BIT'
--     usage flag
--
-- -   If @srcBuffer@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- -   @dstBuffer@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.Buffer.VK_BUFFER_USAGE_TRANSFER_DST_BIT'
--     usage flag
--
-- -   If @dstBuffer@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @srcBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer' handle
--
-- -   @dstBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer' handle
--
-- -   @pRegions@ /must/ be a valid pointer to an array of @regionCount@
--     valid 'VkBufferCopy' structures
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support transfer,
--     graphics, or compute operations
--
-- -   This command /must/ only be called outside of a render pass instance
--
-- -   @regionCount@ /must/ be greater than @0@
--
-- -   Each of @commandBuffer@, @dstBuffer@, and @srcBuffer@ /must/ have
--     been created, allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Outside         | Transfer        | Transfer        |
-- > | Secondary       |                 | Graphics        |                 |
-- > |                 |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer', 'VkBufferCopy',
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdCopyBuffer" vkCmdCopyBuffer :: ("commandBuffer" ::: VkCommandBuffer) -> ("srcBuffer" ::: VkBuffer) -> ("dstBuffer" ::: VkBuffer) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkBufferCopy) -> IO ()
#else
vkCmdCopyBuffer :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("srcBuffer" ::: VkBuffer) -> ("dstBuffer" ::: VkBuffer) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkBufferCopy) -> IO ()
vkCmdCopyBuffer deviceCmds = mkVkCmdCopyBuffer (pVkCmdCopyBuffer deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdCopyBuffer
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("srcBuffer" ::: VkBuffer) -> ("dstBuffer" ::: VkBuffer) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkBufferCopy) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("srcBuffer" ::: VkBuffer) -> ("dstBuffer" ::: VkBuffer) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkBufferCopy) -> IO ())
#endif

type FN_vkCmdCopyBuffer = ("commandBuffer" ::: VkCommandBuffer) -> ("srcBuffer" ::: VkBuffer) -> ("dstBuffer" ::: VkBuffer) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkBufferCopy) -> IO ()
type PFN_vkCmdCopyBuffer = FunPtr FN_vkCmdCopyBuffer

-- | vkCmdCopyBufferToImage - Copy data from a buffer into an image
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @srcBuffer@ is the source buffer.
--
-- -   @dstImage@ is the destination image.
--
-- -   @dstImageLayout@ is the layout of the destination image subresources
--     for the copy.
--
-- -   @regionCount@ is the number of regions to copy.
--
-- -   @pRegions@ is a pointer to an array of 'VkBufferImageCopy'
--     structures specifying the regions to copy.
--
-- = Description
--
-- Each region in @pRegions@ is copied from the specified region of the
-- source buffer to the specified region of the destination image.
--
-- == Valid Usage
--
-- -   @srcBuffer@ /must/ be large enough to contain all buffer locations
--     that are accessed according to
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#copies-buffers-images-addressing Buffer and Image Addressing>,
--     for each element of @pRegions@
--
-- -   The image region specified by each element of @pRegions@ /must/ be a
--     region that is contained within @dstImage@
--
-- -   The union of all source regions, and the union of all destination
--     regions, specified by the elements of @pRegions@, /must/ not overlap
--     in memory
--
-- -   @srcBuffer@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.Buffer.VK_BUFFER_USAGE_TRANSFER_SRC_BIT'
--     usage flag
--
-- -   If @srcBuffer@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- -   @dstImage@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_TRANSFER_DST_BIT'
--     usage flag
--
-- -   If @dstImage@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- -   @dstImage@ /must/ have a sample count equal to
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_SAMPLE_COUNT_1_BIT'
--
-- -   @dstImageLayout@ /must/ specify the layout of the image subresources
--     of @dstImage@ specified in @pRegions@ at the time this command is
--     executed on a
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- -   @dstImageLayout@ /must/ be
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL'
--     or 'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_GENERAL'
--
-- -   The @imageSubresource.mipLevel@ member of each element of @pRegions@
--     /must/ be less than the @mipLevels@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @dstImage@
--     was created
--
-- -   The @imageSubresource.baseArrayLayer@ +
--     @imageSubresource.layerCount@ of each element of @pRegions@ /must/
--     be less than or equal to the @arrayLayers@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @dstImage@
--     was created
--
-- -   The @imageOffset@ and @imageExtent@ members of each element of
--     @pRegions@ /must/ respect the image transfer granularity
--     requirements of @commandBuffer@’s command pool’s queue family, as
--     described in
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkQueueFamilyProperties'
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @srcBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer' handle
--
-- -   @dstImage@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' handle
--
-- -   @dstImageLayout@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Image.VkImageLayout' value
--
-- -   @pRegions@ /must/ be a valid pointer to an array of @regionCount@
--     valid 'VkBufferImageCopy' structures
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support transfer,
--     graphics, or compute operations
--
-- -   This command /must/ only be called outside of a render pass instance
--
-- -   @regionCount@ /must/ be greater than @0@
--
-- -   Each of @commandBuffer@, @dstImage@, and @srcBuffer@ /must/ have
--     been created, allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Outside         | Transfer        | Transfer        |
-- > | Secondary       |                 | Graphics        |                 |
-- > |                 |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer',
-- 'VkBufferImageCopy', 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage',
-- 'Graphics.Vulkan.C.Core10.Image.VkImageLayout'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdCopyBufferToImage" vkCmdCopyBufferToImage :: ("commandBuffer" ::: VkCommandBuffer) -> ("srcBuffer" ::: VkBuffer) -> ("dstImage" ::: VkImage) -> ("dstImageLayout" ::: VkImageLayout) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkBufferImageCopy) -> IO ()
#else
vkCmdCopyBufferToImage :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("srcBuffer" ::: VkBuffer) -> ("dstImage" ::: VkImage) -> ("dstImageLayout" ::: VkImageLayout) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkBufferImageCopy) -> IO ()
vkCmdCopyBufferToImage deviceCmds = mkVkCmdCopyBufferToImage (pVkCmdCopyBufferToImage deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdCopyBufferToImage
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("srcBuffer" ::: VkBuffer) -> ("dstImage" ::: VkImage) -> ("dstImageLayout" ::: VkImageLayout) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkBufferImageCopy) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("srcBuffer" ::: VkBuffer) -> ("dstImage" ::: VkImage) -> ("dstImageLayout" ::: VkImageLayout) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkBufferImageCopy) -> IO ())
#endif

type FN_vkCmdCopyBufferToImage = ("commandBuffer" ::: VkCommandBuffer) -> ("srcBuffer" ::: VkBuffer) -> ("dstImage" ::: VkImage) -> ("dstImageLayout" ::: VkImageLayout) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkBufferImageCopy) -> IO ()
type PFN_vkCmdCopyBufferToImage = FunPtr FN_vkCmdCopyBufferToImage

-- | vkCmdCopyImage - Copy data between images
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @srcImage@ is the source image.
--
-- -   @srcImageLayout@ is the current layout of the source image
--     subresource.
--
-- -   @dstImage@ is the destination image.
--
-- -   @dstImageLayout@ is the current layout of the destination image
--     subresource.
--
-- -   @regionCount@ is the number of regions to copy.
--
-- -   @pRegions@ is a pointer to an array of 'VkImageCopy' structures
--     specifying the regions to copy.
--
-- = Description
--
-- Each region in @pRegions@ is copied from the source image to the same
-- region of the destination image. @srcImage@ and @dstImage@ /can/ be the
-- same image or alias the same memory.
--
-- The formats of @srcImage@ and @dstImage@ /must/ be compatible. Formats
-- are compatible if they share the same class, as shown in the
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#formats-compatibility Compatible Formats>
-- table. Depth\/stencil formats /must/ match exactly.
--
-- 'vkCmdCopyImage' allows copying between /size-compatible/ compressed and
-- uncompressed internal formats. Formats are size-compatible if the texel
-- block size of the uncompressed format is equal to the texel block size
-- of the compressed format. Such a copy does not perform on-the-fly
-- compression or decompression. When copying from an uncompressed format
-- to a compressed format, each texel of uncompressed data of the source
-- image is copied as a raw value to the corresponding compressed texel
-- block of the destination image. When copying from a compressed format to
-- an uncompressed format, each compressed texel block of the source image
-- is copied as a raw value to the corresponding texel of uncompressed data
-- in the destination image. Thus, for example, it is legal to copy between
-- a 128-bit uncompressed format and a compressed format which has a
-- 128-bit sized compressed texel block representing 4×4 texels (using 8
-- bits per texel), or between a 64-bit uncompressed format and a
-- compressed format which has a 64-bit sized compressed texel block
-- representing 4×4 texels (using 4 bits per texel).
--
-- When copying between compressed and uncompressed formats the @extent@
-- members represent the texel dimensions of the source image and not the
-- destination. When copying from a compressed image to an uncompressed
-- image the image texel dimensions written to the uncompressed image will
-- be source extent divided by the compressed texel block dimensions. When
-- copying from an uncompressed image to a compressed image the image texel
-- dimensions written to the compressed image will be the source extent
-- multiplied by the compressed texel block dimensions. In both cases the
-- number of bytes read and the number of bytes written will be identical.
--
-- Copying to or from block-compressed images is typically done in
-- multiples of the compressed texel block size. For this reason the
-- @extent@ /must/ be a multiple of the compressed texel block dimension.
-- There is one exception to this rule which is /required/ to handle
-- compressed images created with dimensions that are not a multiple of the
-- compressed texel block dimensions: if the @srcImage@ is compressed,
-- then:
--
-- -   If @extent.width@ is not a multiple of the compressed texel block
--     width, then (@extent.width@ + @srcOffset.x@) /must/ equal the image
--     subresource width.
--
-- -   If @extent.height@ is not a multiple of the compressed texel block
--     height, then (@extent.height@ + @srcOffset.y@) /must/ equal the
--     image subresource height.
--
-- -   If @extent.depth@ is not a multiple of the compressed texel block
--     depth, then (@extent.depth@ + @srcOffset.z@) /must/ equal the image
--     subresource depth.
--
-- Similarly, if the @dstImage@ is compressed, then:
--
-- -   If @extent.width@ is not a multiple of the compressed texel block
--     width, then (@extent.width@ + @dstOffset.x@) /must/ equal the image
--     subresource width.
--
-- -   If @extent.height@ is not a multiple of the compressed texel block
--     height, then (@extent.height@ + @dstOffset.y@) /must/ equal the
--     image subresource height.
--
-- -   If @extent.depth@ is not a multiple of the compressed texel block
--     depth, then (@extent.depth@ + @dstOffset.z@) /must/ equal the image
--     subresource depth.
--
-- This allows the last compressed texel block of the image in each
-- non-multiple dimension to be included as a source or destination of the
-- copy.
--
-- 'vkCmdCopyImage' /can/ be used to copy image data between multisample
-- images, but both images /must/ have the same number of samples.
--
-- == Valid Usage
--
-- -   The source region specified by each element of @pRegions@ /must/ be
--     a region that is contained within @srcImage@
--
-- -   The destination region specified by each element of @pRegions@
--     /must/ be a region that is contained within @dstImage@
--
-- -   The union of all source regions, and the union of all destination
--     regions, specified by the elements of @pRegions@, /must/ not overlap
--     in memory
--
-- -   @srcImage@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_TRANSFER_SRC_BIT'
--     usage flag
--
-- -   If @srcImage@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- -   @srcImageLayout@ /must/ specify the layout of the image subresources
--     of @srcImage@ specified in @pRegions@ at the time this command is
--     executed on a
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- -   @srcImageLayout@ /must/ be
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL'
--     or 'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_GENERAL'
--
-- -   @dstImage@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_TRANSFER_DST_BIT'
--     usage flag
--
-- -   If @dstImage@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- -   @dstImageLayout@ /must/ specify the layout of the image subresources
--     of @dstImage@ specified in @pRegions@ at the time this command is
--     executed on a
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- -   @dstImageLayout@ /must/ be
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL'
--     or 'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_GENERAL'
--
-- -   The 'Graphics.Vulkan.C.Core10.Core.VkFormat' of each of @srcImage@
--     and @dstImage@ /must/ be compatible, as defined
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#copies-images-format-compatibility above>
--
-- -   The sample count of @srcImage@ and @dstImage@ /must/ match
--
-- -   The @srcSubresource.mipLevel@ member of each element of @pRegions@
--     /must/ be less than the @mipLevels@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @srcImage@
--     was created
--
-- -   The @dstSubresource.mipLevel@ member of each element of @pRegions@
--     /must/ be less than the @mipLevels@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @dstImage@
--     was created
--
-- -   The @srcSubresource.baseArrayLayer@ + @srcSubresource.layerCount@ of
--     each element of @pRegions@ /must/ be less than or equal to the
--     @arrayLayers@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @srcImage@
--     was created
--
-- -   The @dstSubresource.baseArrayLayer@ + @dstSubresource.layerCount@ of
--     each element of @pRegions@ /must/ be less than or equal to the
--     @arrayLayers@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @dstImage@
--     was created
--
-- -   The @srcOffset@ and @extent@ members of each element of @pRegions@
--     /must/ respect the image transfer granularity requirements of
--     @commandBuffer@’s command pool’s queue family, as described in
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkQueueFamilyProperties'
--
-- -   The @dstOffset@ and @extent@ members of each element of @pRegions@
--     /must/ respect the image transfer granularity requirements of
--     @commandBuffer@’s command pool’s queue family, as described in
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkQueueFamilyProperties'
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @srcImage@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' handle
--
-- -   @srcImageLayout@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Image.VkImageLayout' value
--
-- -   @dstImage@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' handle
--
-- -   @dstImageLayout@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Image.VkImageLayout' value
--
-- -   @pRegions@ /must/ be a valid pointer to an array of @regionCount@
--     valid 'VkImageCopy' structures
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support transfer,
--     graphics, or compute operations
--
-- -   This command /must/ only be called outside of a render pass instance
--
-- -   @regionCount@ /must/ be greater than @0@
--
-- -   Each of @commandBuffer@, @dstImage@, and @srcImage@ /must/ have been
--     created, allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Outside         | Transfer        | Transfer        |
-- > | Secondary       |                 | Graphics        |                 |
-- > |                 |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage', 'VkImageCopy',
-- 'Graphics.Vulkan.C.Core10.Image.VkImageLayout'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdCopyImage" vkCmdCopyImage :: ("commandBuffer" ::: VkCommandBuffer) -> ("srcImage" ::: VkImage) -> ("srcImageLayout" ::: VkImageLayout) -> ("dstImage" ::: VkImage) -> ("dstImageLayout" ::: VkImageLayout) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkImageCopy) -> IO ()
#else
vkCmdCopyImage :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("srcImage" ::: VkImage) -> ("srcImageLayout" ::: VkImageLayout) -> ("dstImage" ::: VkImage) -> ("dstImageLayout" ::: VkImageLayout) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkImageCopy) -> IO ()
vkCmdCopyImage deviceCmds = mkVkCmdCopyImage (pVkCmdCopyImage deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdCopyImage
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("srcImage" ::: VkImage) -> ("srcImageLayout" ::: VkImageLayout) -> ("dstImage" ::: VkImage) -> ("dstImageLayout" ::: VkImageLayout) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkImageCopy) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("srcImage" ::: VkImage) -> ("srcImageLayout" ::: VkImageLayout) -> ("dstImage" ::: VkImage) -> ("dstImageLayout" ::: VkImageLayout) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkImageCopy) -> IO ())
#endif

type FN_vkCmdCopyImage = ("commandBuffer" ::: VkCommandBuffer) -> ("srcImage" ::: VkImage) -> ("srcImageLayout" ::: VkImageLayout) -> ("dstImage" ::: VkImage) -> ("dstImageLayout" ::: VkImageLayout) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkImageCopy) -> IO ()
type PFN_vkCmdCopyImage = FunPtr FN_vkCmdCopyImage

-- | vkCmdCopyImageToBuffer - Copy image data into a buffer
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @srcImage@ is the source image.
--
-- -   @srcImageLayout@ is the layout of the source image subresources for
--     the copy.
--
-- -   @dstBuffer@ is the destination buffer.
--
-- -   @regionCount@ is the number of regions to copy.
--
-- -   @pRegions@ is a pointer to an array of 'VkBufferImageCopy'
--     structures specifying the regions to copy.
--
-- = Description
--
-- Each region in @pRegions@ is copied from the specified region of the
-- source image to the specified region of the destination buffer.
--
-- == Valid Usage
--
-- -   The image region specified by each element of @pRegions@ /must/ be a
--     region that is contained within @srcImage@
--
-- -   @dstBuffer@ /must/ be large enough to contain all buffer locations
--     that are accessed according to
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#copies-buffers-images-addressing Buffer and Image Addressing>,
--     for each element of @pRegions@
--
-- -   The union of all source regions, and the union of all destination
--     regions, specified by the elements of @pRegions@, /must/ not overlap
--     in memory
--
-- -   @srcImage@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_TRANSFER_SRC_BIT'
--     usage flag
--
-- -   If @srcImage@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- -   @srcImage@ /must/ have a sample count equal to
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_SAMPLE_COUNT_1_BIT'
--
-- -   @srcImageLayout@ /must/ specify the layout of the image subresources
--     of @srcImage@ specified in @pRegions@ at the time this command is
--     executed on a
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- -   @srcImageLayout@ /must/ be
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL'
--     or 'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_GENERAL'
--
-- -   @dstBuffer@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.Buffer.VK_BUFFER_USAGE_TRANSFER_DST_BIT'
--     usage flag
--
-- -   If @dstBuffer@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- -   The @imageSubresource.mipLevel@ member of each element of @pRegions@
--     /must/ be less than the @mipLevels@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @srcImage@
--     was created
--
-- -   The @imageSubresource.baseArrayLayer@ +
--     @imageSubresource.layerCount@ of each element of @pRegions@ /must/
--     be less than or equal to the @arrayLayers@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @srcImage@
--     was created
--
-- -   The @imageOffset@ and @imageExtent@ members of each element of
--     @pRegions@ /must/ respect the image transfer granularity
--     requirements of @commandBuffer@’s command pool’s queue family, as
--     described in
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkQueueFamilyProperties'
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @srcImage@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' handle
--
-- -   @srcImageLayout@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Image.VkImageLayout' value
--
-- -   @dstBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer' handle
--
-- -   @pRegions@ /must/ be a valid pointer to an array of @regionCount@
--     valid 'VkBufferImageCopy' structures
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support transfer,
--     graphics, or compute operations
--
-- -   This command /must/ only be called outside of a render pass instance
--
-- -   @regionCount@ /must/ be greater than @0@
--
-- -   Each of @commandBuffer@, @dstBuffer@, and @srcImage@ /must/ have
--     been created, allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Outside         | Transfer        | Transfer        |
-- > | Secondary       |                 | Graphics        |                 |
-- > |                 |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer',
-- 'VkBufferImageCopy', 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage',
-- 'Graphics.Vulkan.C.Core10.Image.VkImageLayout'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdCopyImageToBuffer" vkCmdCopyImageToBuffer :: ("commandBuffer" ::: VkCommandBuffer) -> ("srcImage" ::: VkImage) -> ("srcImageLayout" ::: VkImageLayout) -> ("dstBuffer" ::: VkBuffer) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkBufferImageCopy) -> IO ()
#else
vkCmdCopyImageToBuffer :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("srcImage" ::: VkImage) -> ("srcImageLayout" ::: VkImageLayout) -> ("dstBuffer" ::: VkBuffer) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkBufferImageCopy) -> IO ()
vkCmdCopyImageToBuffer deviceCmds = mkVkCmdCopyImageToBuffer (pVkCmdCopyImageToBuffer deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdCopyImageToBuffer
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("srcImage" ::: VkImage) -> ("srcImageLayout" ::: VkImageLayout) -> ("dstBuffer" ::: VkBuffer) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkBufferImageCopy) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("srcImage" ::: VkImage) -> ("srcImageLayout" ::: VkImageLayout) -> ("dstBuffer" ::: VkBuffer) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkBufferImageCopy) -> IO ())
#endif

type FN_vkCmdCopyImageToBuffer = ("commandBuffer" ::: VkCommandBuffer) -> ("srcImage" ::: VkImage) -> ("srcImageLayout" ::: VkImageLayout) -> ("dstBuffer" ::: VkBuffer) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkBufferImageCopy) -> IO ()
type PFN_vkCmdCopyImageToBuffer = FunPtr FN_vkCmdCopyImageToBuffer

-- | vkCmdCopyQueryPoolResults - Copy the results of queries in a query pool
-- to a buffer object
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which this command will
--     be recorded.
--
-- -   @queryPool@ is the query pool managing the queries containing the
--     desired results.
--
-- -   @firstQuery@ is the initial query index.
--
-- -   @queryCount@ is the number of queries. @firstQuery@ and @queryCount@
--     together define a range of queries.
--
-- -   @dstBuffer@ is a
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer' object that
--     will receive the results of the copy command.
--
-- -   @dstOffset@ is an offset into @dstBuffer@.
--
-- -   @stride@ is the stride in bytes between results for individual
--     queries within @dstBuffer@. The required size of the backing memory
--     for @dstBuffer@ is determined as described above for
--     'Graphics.Vulkan.C.Core10.Query.vkGetQueryPoolResults'.
--
-- -   @flags@ is a bitmask of
--     'Graphics.Vulkan.C.Core10.Query.VkQueryResultFlagBits' specifying
--     how and when results are returned.
--
-- = Description
--
-- 'vkCmdCopyQueryPoolResults' is guaranteed to see the effect of previous
-- uses of 'vkCmdResetQueryPool' in the same queue, without any additional
-- synchronization. Thus, the results will always reflect the most recent
-- use of the query.
--
-- @flags@ has the same possible values described above for the @flags@
-- parameter of 'Graphics.Vulkan.C.Core10.Query.vkGetQueryPoolResults', but
-- the different style of execution causes some subtle behavioral
-- differences. Because 'vkCmdCopyQueryPoolResults' executes in order with
-- respect to other query commands, there is less ambiguity about which use
-- of a query is being requested.
--
-- If no bits are set in @flags@, results for all requested queries in the
-- available state are written as 32-bit unsigned integer values, and
-- nothing is written for queries in the unavailable state.
--
-- If 'Graphics.Vulkan.C.Core10.Query.VK_QUERY_RESULT_64_BIT' is set, the
-- results are written as an array of 64-bit unsigned integer values as
-- described for 'Graphics.Vulkan.C.Core10.Query.vkGetQueryPoolResults'.
--
-- If 'Graphics.Vulkan.C.Core10.Query.VK_QUERY_RESULT_WAIT_BIT' is set, the
-- implementation will wait for each query’s status to be in the available
-- state before retrieving the numerical results for that query. This is
-- guaranteed to reflect the most recent use of the query on the same
-- queue, assuming that the query is not being simultaneously used by other
-- queues. If the query does not become available in a finite amount of
-- time (e.g. due to not issuing a query since the last reset), a
-- 'Graphics.Vulkan.C.Core10.Core.VK_ERROR_DEVICE_LOST' error /may/ occur.
--
-- Similarly, if
-- 'Graphics.Vulkan.C.Core10.Query.VK_QUERY_RESULT_WITH_AVAILABILITY_BIT'
-- is set and 'Graphics.Vulkan.C.Core10.Query.VK_QUERY_RESULT_WAIT_BIT' is
-- not set, the availability is guaranteed to reflect the most recent use
-- of the query on the same queue, assuming that the query is not being
-- simultaneously used by other queues. As with
-- 'Graphics.Vulkan.C.Core10.Query.vkGetQueryPoolResults', implementations
-- /must/ guarantee that if they return a non-zero availability value, then
-- the numerical results are valid.
--
-- If 'Graphics.Vulkan.C.Core10.Query.VK_QUERY_RESULT_PARTIAL_BIT' is set,
-- 'Graphics.Vulkan.C.Core10.Query.VK_QUERY_RESULT_WAIT_BIT' is not set,
-- and the query’s status is unavailable, an intermediate result value
-- between zero and the final result value is written for that query.
--
-- 'Graphics.Vulkan.C.Core10.Query.VK_QUERY_RESULT_PARTIAL_BIT' /must/ not
-- be used if the pool’s @queryType@ is
-- 'Graphics.Vulkan.C.Core10.Query.VK_QUERY_TYPE_TIMESTAMP'.
--
-- 'vkCmdCopyQueryPoolResults' is considered to be a transfer operation,
-- and its writes to buffer memory /must/ be synchronized using
-- 'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_TRANSFER_BIT' and
-- 'Graphics.Vulkan.C.Core10.Pass.VK_ACCESS_TRANSFER_WRITE_BIT' before
-- using the results.
--
-- == Valid Usage
--
-- -   @dstOffset@ /must/ be less than the size of @dstBuffer@
--
-- -   @firstQuery@ /must/ be less than the number of queries in
--     @queryPool@
--
-- -   The sum of @firstQuery@ and @queryCount@ /must/ be less than or
--     equal to the number of queries in @queryPool@
--
-- -   If 'Graphics.Vulkan.C.Core10.Query.VK_QUERY_RESULT_64_BIT' is not
--     set in @flags@ then @dstOffset@ and @stride@ /must/ be multiples of
--     @4@
--
-- -   If 'Graphics.Vulkan.C.Core10.Query.VK_QUERY_RESULT_64_BIT' is set in
--     @flags@ then @dstOffset@ and @stride@ /must/ be multiples of @8@
--
-- -   @dstBuffer@ /must/ have enough storage, from @dstOffset@, to contain
--     the result of each query, as described
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#queries-operation-memorylayout here>
--
-- -   @dstBuffer@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.Buffer.VK_BUFFER_USAGE_TRANSFER_DST_BIT'
--     usage flag
--
-- -   If @dstBuffer@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- -   If the @queryType@ used to create @queryPool@ was
--     'Graphics.Vulkan.C.Core10.Query.VK_QUERY_TYPE_TIMESTAMP', @flags@
--     /must/ not contain
--     'Graphics.Vulkan.C.Core10.Query.VK_QUERY_RESULT_PARTIAL_BIT'
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @queryPool@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Query.VkQueryPool' handle
--
-- -   @dstBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer' handle
--
-- -   @flags@ /must/ be a valid combination of
--     'Graphics.Vulkan.C.Core10.Query.VkQueryResultFlagBits' values
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics, or
--     compute operations
--
-- -   This command /must/ only be called outside of a render pass instance
--
-- -   Each of @commandBuffer@, @dstBuffer@, and @queryPool@ /must/ have
--     been created, allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Outside         | Graphics        | Transfer        |
-- > | Secondary       |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer',
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDeviceSize',
-- 'Graphics.Vulkan.C.Core10.Query.VkQueryPool',
-- 'Graphics.Vulkan.C.Core10.Query.VkQueryResultFlags'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdCopyQueryPoolResults" vkCmdCopyQueryPoolResults :: ("commandBuffer" ::: VkCommandBuffer) -> ("queryPool" ::: VkQueryPool) -> ("firstQuery" ::: Word32) -> ("queryCount" ::: Word32) -> ("dstBuffer" ::: VkBuffer) -> ("dstOffset" ::: VkDeviceSize) -> ("stride" ::: VkDeviceSize) -> ("flags" ::: VkQueryResultFlags) -> IO ()
#else
vkCmdCopyQueryPoolResults :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("queryPool" ::: VkQueryPool) -> ("firstQuery" ::: Word32) -> ("queryCount" ::: Word32) -> ("dstBuffer" ::: VkBuffer) -> ("dstOffset" ::: VkDeviceSize) -> ("stride" ::: VkDeviceSize) -> ("flags" ::: VkQueryResultFlags) -> IO ()
vkCmdCopyQueryPoolResults deviceCmds = mkVkCmdCopyQueryPoolResults (pVkCmdCopyQueryPoolResults deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdCopyQueryPoolResults
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("queryPool" ::: VkQueryPool) -> ("firstQuery" ::: Word32) -> ("queryCount" ::: Word32) -> ("dstBuffer" ::: VkBuffer) -> ("dstOffset" ::: VkDeviceSize) -> ("stride" ::: VkDeviceSize) -> ("flags" ::: VkQueryResultFlags) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("queryPool" ::: VkQueryPool) -> ("firstQuery" ::: Word32) -> ("queryCount" ::: Word32) -> ("dstBuffer" ::: VkBuffer) -> ("dstOffset" ::: VkDeviceSize) -> ("stride" ::: VkDeviceSize) -> ("flags" ::: VkQueryResultFlags) -> IO ())
#endif

type FN_vkCmdCopyQueryPoolResults = ("commandBuffer" ::: VkCommandBuffer) -> ("queryPool" ::: VkQueryPool) -> ("firstQuery" ::: Word32) -> ("queryCount" ::: Word32) -> ("dstBuffer" ::: VkBuffer) -> ("dstOffset" ::: VkDeviceSize) -> ("stride" ::: VkDeviceSize) -> ("flags" ::: VkQueryResultFlags) -> IO ()
type PFN_vkCmdCopyQueryPoolResults = FunPtr FN_vkCmdCopyQueryPoolResults

-- | vkCmdDispatch - Dispatch compute work items
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @groupCountX@ is the number of local workgroups to dispatch in the X
--     dimension.
--
-- -   @groupCountY@ is the number of local workgroups to dispatch in the Y
--     dimension.
--
-- -   @groupCountZ@ is the number of local workgroups to dispatch in the Z
--     dimension.
--
-- = Description
--
-- When the command is executed, a global workgroup consisting of
-- @groupCountX@ × @groupCountY@ × @groupCountZ@ local workgroups is
-- assembled.
--
-- == Valid Usage
--
-- -   If a 'Graphics.Vulkan.C.Core10.ImageView.VkImageView' is sampled
--     with 'Graphics.Vulkan.C.Core10.Sampler.VK_FILTER_LINEAR' as a result
--     of this command, then the image view’s
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#resources-image-view-format-features format features>
--     /must/ contain
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT'
--
-- -   If a 'Graphics.Vulkan.C.Core10.ImageView.VkImageView' is accessed
--     using atomic operations as a result of this command, then the image
--     view’s
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#resources-image-view-format-features format features>
--     /must/ contain
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT'
--
-- -   For each set /n/ that is statically used by the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to the pipeline
--     bind point used by this command, a descriptor set /must/ have been
--     bound to /n/ at the same pipeline bind point, with a
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' that is
--     compatible for set /n/, with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' used to create
--     the current 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline', as
--     described in
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#descriptorsets-compatibility ???>
--
-- -   For each push constant that is statically used by the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to the pipeline
--     bind point used by this command, a push constant value /must/ have
--     been set for the same pipeline bind point, with a
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' that is
--     compatible for push constants, with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' used to create
--     the current 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline', as
--     described in
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#descriptorsets-compatibility ???>
--
-- -   Descriptors in each bound descriptor set, specified via
--     'vkCmdBindDescriptorSets', /must/ be valid if they are statically
--     used by the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to
--     the pipeline bind point used by this command
--
-- -   A valid pipeline /must/ be bound to the pipeline bind point used by
--     this command
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command requires any dynamic
--     state, that state /must/ have been set for @commandBuffer@
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command accesses a
--     'Graphics.Vulkan.C.Core10.Sampler.VkSampler' object that uses
--     unnormalized coordinates, that sampler /must/ not be used to sample
--     from any 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' with a
--     'Graphics.Vulkan.C.Core10.ImageView.VkImageView' of the type
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_3D',
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_CUBE',
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_1D_ARRAY',
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_2D_ARRAY' or
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_CUBE_ARRAY',
--     in any shader stage
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command accesses a
--     'Graphics.Vulkan.C.Core10.Sampler.VkSampler' object that uses
--     unnormalized coordinates, that sampler /must/ not be used with any
--     of the SPIR-V @OpImageSample*@ or @OpImageSparseSample*@
--     instructions with @ImplicitLod@, @Dref@ or @Proj@ in their name, in
--     any shader stage
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command accesses a
--     'Graphics.Vulkan.C.Core10.Sampler.VkSampler' object that uses
--     unnormalized coordinates, that sampler /must/ not be used with any
--     of the SPIR-V @OpImageSample*@ or @OpImageSparseSample*@
--     instructions that includes a LOD bias or any offset values, in any
--     shader stage
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#features-robustBufferAccess robust buffer access>
--     feature is not enabled, and if the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound to the
--     pipeline bind point used by this command accesses a uniform buffer,
--     it /must/ not access values outside of the range of the buffer as
--     specified in the descriptor set bound to the same pipeline bind
--     point
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#features-robustBufferAccess robust buffer access>
--     feature is not enabled, and if the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound to the
--     pipeline bind point used by this command accesses a storage buffer,
--     it /must/ not access values outside of the range of the buffer as
--     specified in the descriptor set bound to the same pipeline bind
--     point
--
-- -   @groupCountX@ /must/ be less than or equal to
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceLimits'::@maxComputeWorkGroupCount@[0]
--
-- -   @groupCountY@ /must/ be less than or equal to
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceLimits'::@maxComputeWorkGroupCount@[1]
--
-- -   @groupCountZ@ /must/ be less than or equal to
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceLimits'::@maxComputeWorkGroupCount@[2]
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support compute operations
--
-- -   This command /must/ only be called outside of a render pass instance
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Outside         | Compute         | Compute         |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdDispatch" vkCmdDispatch :: ("commandBuffer" ::: VkCommandBuffer) -> ("groupCountX" ::: Word32) -> ("groupCountY" ::: Word32) -> ("groupCountZ" ::: Word32) -> IO ()
#else
vkCmdDispatch :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("groupCountX" ::: Word32) -> ("groupCountY" ::: Word32) -> ("groupCountZ" ::: Word32) -> IO ()
vkCmdDispatch deviceCmds = mkVkCmdDispatch (pVkCmdDispatch deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdDispatch
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("groupCountX" ::: Word32) -> ("groupCountY" ::: Word32) -> ("groupCountZ" ::: Word32) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("groupCountX" ::: Word32) -> ("groupCountY" ::: Word32) -> ("groupCountZ" ::: Word32) -> IO ())
#endif

type FN_vkCmdDispatch = ("commandBuffer" ::: VkCommandBuffer) -> ("groupCountX" ::: Word32) -> ("groupCountY" ::: Word32) -> ("groupCountZ" ::: Word32) -> IO ()
type PFN_vkCmdDispatch = FunPtr FN_vkCmdDispatch

-- | vkCmdDispatchIndirect - Dispatch compute work items using indirect
-- parameters
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @buffer@ is the buffer containing dispatch parameters.
--
-- -   @offset@ is the byte offset into @buffer@ where parameters begin.
--
-- = Description
--
-- 'vkCmdDispatchIndirect' behaves similarly to 'vkCmdDispatch' except that
-- the parameters are read by the device from a buffer during execution.
-- The parameters of the dispatch are encoded in a
-- 'VkDispatchIndirectCommand' structure taken from @buffer@ starting at
-- @offset@.
--
-- == Valid Usage
--
-- -   If a 'Graphics.Vulkan.C.Core10.ImageView.VkImageView' is sampled
--     with 'Graphics.Vulkan.C.Core10.Sampler.VK_FILTER_LINEAR' as a result
--     of this command, then the image view’s
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#resources-image-view-format-features format features>
--     /must/ contain
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT'
--
-- -   If a 'Graphics.Vulkan.C.Core10.ImageView.VkImageView' is accessed
--     using atomic operations as a result of this command, then the image
--     view’s
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#resources-image-view-format-features format features>
--     /must/ contain
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT'
--
-- -   For each set /n/ that is statically used by the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to the pipeline
--     bind point used by this command, a descriptor set /must/ have been
--     bound to /n/ at the same pipeline bind point, with a
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' that is
--     compatible for set /n/, with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' used to create
--     the current 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline', as
--     described in
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#descriptorsets-compatibility ???>
--
-- -   For each push constant that is statically used by the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to the pipeline
--     bind point used by this command, a push constant value /must/ have
--     been set for the same pipeline bind point, with a
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' that is
--     compatible for push constants, with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' used to create
--     the current 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline', as
--     described in
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#descriptorsets-compatibility ???>
--
-- -   Descriptors in each bound descriptor set, specified via
--     'vkCmdBindDescriptorSets', /must/ be valid if they are statically
--     used by the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to
--     the pipeline bind point used by this command
--
-- -   A valid pipeline /must/ be bound to the pipeline bind point used by
--     this command
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command requires any dynamic
--     state, that state /must/ have been set for @commandBuffer@
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command accesses a
--     'Graphics.Vulkan.C.Core10.Sampler.VkSampler' object that uses
--     unnormalized coordinates, that sampler /must/ not be used to sample
--     from any 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' with a
--     'Graphics.Vulkan.C.Core10.ImageView.VkImageView' of the type
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_3D',
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_CUBE',
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_1D_ARRAY',
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_2D_ARRAY' or
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_CUBE_ARRAY',
--     in any shader stage
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command accesses a
--     'Graphics.Vulkan.C.Core10.Sampler.VkSampler' object that uses
--     unnormalized coordinates, that sampler /must/ not be used with any
--     of the SPIR-V @OpImageSample*@ or @OpImageSparseSample*@
--     instructions with @ImplicitLod@, @Dref@ or @Proj@ in their name, in
--     any shader stage
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command accesses a
--     'Graphics.Vulkan.C.Core10.Sampler.VkSampler' object that uses
--     unnormalized coordinates, that sampler /must/ not be used with any
--     of the SPIR-V @OpImageSample*@ or @OpImageSparseSample*@
--     instructions that includes a LOD bias or any offset values, in any
--     shader stage
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#features-robustBufferAccess robust buffer access>
--     feature is not enabled, and if the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound to the
--     pipeline bind point used by this command accesses a uniform buffer,
--     it /must/ not access values outside of the range of the buffer as
--     specified in the descriptor set bound to the same pipeline bind
--     point
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#features-robustBufferAccess robust buffer access>
--     feature is not enabled, and if the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound to the
--     pipeline bind point used by this command accesses a storage buffer,
--     it /must/ not access values outside of the range of the buffer as
--     specified in the descriptor set bound to the same pipeline bind
--     point
--
-- -   If @buffer@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- -   @buffer@ /must/ have been created with the
--     'Graphics.Vulkan.C.Core10.Buffer.VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT'
--     bit set
--
-- -   @offset@ /must/ be a multiple of @4@
--
-- -   The sum of @offset@ and the size of 'VkDispatchIndirectCommand'
--     /must/ be less than or equal to the size of @buffer@
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @buffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer' handle
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support compute operations
--
-- -   This command /must/ only be called outside of a render pass instance
--
-- -   Both of @buffer@, and @commandBuffer@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Outside         | Compute         | Compute         |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer',
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDeviceSize'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdDispatchIndirect" vkCmdDispatchIndirect :: ("commandBuffer" ::: VkCommandBuffer) -> ("buffer" ::: VkBuffer) -> ("offset" ::: VkDeviceSize) -> IO ()
#else
vkCmdDispatchIndirect :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("buffer" ::: VkBuffer) -> ("offset" ::: VkDeviceSize) -> IO ()
vkCmdDispatchIndirect deviceCmds = mkVkCmdDispatchIndirect (pVkCmdDispatchIndirect deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdDispatchIndirect
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("buffer" ::: VkBuffer) -> ("offset" ::: VkDeviceSize) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("buffer" ::: VkBuffer) -> ("offset" ::: VkDeviceSize) -> IO ())
#endif

type FN_vkCmdDispatchIndirect = ("commandBuffer" ::: VkCommandBuffer) -> ("buffer" ::: VkBuffer) -> ("offset" ::: VkDeviceSize) -> IO ()
type PFN_vkCmdDispatchIndirect = FunPtr FN_vkCmdDispatchIndirect

-- | vkCmdDraw - Draw primitives
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command is
--     recorded.
--
-- -   @vertexCount@ is the number of vertices to draw.
--
-- -   @instanceCount@ is the number of instances to draw.
--
-- -   @firstVertex@ is the index of the first vertex to draw.
--
-- -   @firstInstance@ is the instance ID of the first instance to draw.
--
-- = Description
--
-- When the command is executed, primitives are assembled using the current
-- primitive topology and @vertexCount@ consecutive vertex indices with the
-- first @vertexIndex@ value equal to @firstVertex@. The primitives are
-- drawn @instanceCount@ times with @instanceIndex@ starting with
-- @firstInstance@ and increasing sequentially for each instance. The
-- assembled primitives execute the bound graphics pipeline.
--
-- == Valid Usage
--
-- -   If a 'Graphics.Vulkan.C.Core10.ImageView.VkImageView' is sampled
--     with 'Graphics.Vulkan.C.Core10.Sampler.VK_FILTER_LINEAR' as a result
--     of this command, then the image view’s
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#resources-image-view-format-features format features>
--     /must/ contain
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT'
--
-- -   If a 'Graphics.Vulkan.C.Core10.ImageView.VkImageView' is accessed
--     using atomic operations as a result of this command, then the image
--     view’s
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#resources-image-view-format-features format features>
--     /must/ contain
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT'
--
-- -   For each set /n/ that is statically used by the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to the pipeline
--     bind point used by this command, a descriptor set /must/ have been
--     bound to /n/ at the same pipeline bind point, with a
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' that is
--     compatible for set /n/, with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' used to create
--     the current 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline', as
--     described in
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#descriptorsets-compatibility ???>
--
-- -   For each push constant that is statically used by the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to the pipeline
--     bind point used by this command, a push constant value /must/ have
--     been set for the same pipeline bind point, with a
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' that is
--     compatible for push constants, with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' used to create
--     the current 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline', as
--     described in
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#descriptorsets-compatibility ???>
--
-- -   Descriptors in each bound descriptor set, specified via
--     'vkCmdBindDescriptorSets', /must/ be valid if they are statically
--     used by the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to
--     the pipeline bind point used by this command
--
-- -   A valid pipeline /must/ be bound to the pipeline bind point used by
--     this command
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command requires any dynamic
--     state, that state /must/ have been set for @commandBuffer@
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command accesses a
--     'Graphics.Vulkan.C.Core10.Sampler.VkSampler' object that uses
--     unnormalized coordinates, that sampler /must/ not be used to sample
--     from any 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' with a
--     'Graphics.Vulkan.C.Core10.ImageView.VkImageView' of the type
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_3D',
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_CUBE',
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_1D_ARRAY',
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_2D_ARRAY' or
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_CUBE_ARRAY',
--     in any shader stage
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command accesses a
--     'Graphics.Vulkan.C.Core10.Sampler.VkSampler' object that uses
--     unnormalized coordinates, that sampler /must/ not be used with any
--     of the SPIR-V @OpImageSample*@ or @OpImageSparseSample*@
--     instructions with @ImplicitLod@, @Dref@ or @Proj@ in their name, in
--     any shader stage
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command accesses a
--     'Graphics.Vulkan.C.Core10.Sampler.VkSampler' object that uses
--     unnormalized coordinates, that sampler /must/ not be used with any
--     of the SPIR-V @OpImageSample*@ or @OpImageSparseSample*@
--     instructions that includes a LOD bias or any offset values, in any
--     shader stage
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#features-robustBufferAccess robust buffer access>
--     feature is not enabled, and if the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound to the
--     pipeline bind point used by this command accesses a uniform buffer,
--     it /must/ not access values outside of the range of the buffer as
--     specified in the descriptor set bound to the same pipeline bind
--     point
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#features-robustBufferAccess robust buffer access>
--     feature is not enabled, and if the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound to the
--     pipeline bind point used by this command accesses a storage buffer,
--     it /must/ not access values outside of the range of the buffer as
--     specified in the descriptor set bound to the same pipeline bind
--     point
--
-- -   The current render pass /must/ be
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#renderpass-compatibility compatible>
--     with the @renderPass@ member of the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkGraphicsPipelineCreateInfo'
--     structure specified when creating the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to
--     'Graphics.Vulkan.C.Core10.Pass.VK_PIPELINE_BIND_POINT_GRAPHICS'.
--
-- -   The subpass index of the current render pass /must/ be equal to the
--     @subpass@ member of the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkGraphicsPipelineCreateInfo'
--     structure specified when creating the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to
--     'Graphics.Vulkan.C.Core10.Pass.VK_PIPELINE_BIND_POINT_GRAPHICS'.
--
-- -   Every input attachment used by the current subpass /must/ be bound
--     to the pipeline via a descriptor set
--
-- -   Image subresources used as attachments in the current render pass
--     /must/ not be accessed in any way other than as an attachment by
--     this command.
--
-- -   All vertex input bindings accessed via vertex input variables
--     declared in the vertex shader entry point’s interface /must/ have
--     valid buffers bound
--
-- -   For a given vertex buffer binding, any attribute data fetched /must/
--     be entirely contained within the corresponding vertex buffer
--     binding, as described in
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fxvertex-input ???>
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   This command /must/ only be called inside of a render pass instance
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Inside          | Graphics        | Graphics        |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdDraw" vkCmdDraw :: ("commandBuffer" ::: VkCommandBuffer) -> ("vertexCount" ::: Word32) -> ("instanceCount" ::: Word32) -> ("firstVertex" ::: Word32) -> ("firstInstance" ::: Word32) -> IO ()
#else
vkCmdDraw :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("vertexCount" ::: Word32) -> ("instanceCount" ::: Word32) -> ("firstVertex" ::: Word32) -> ("firstInstance" ::: Word32) -> IO ()
vkCmdDraw deviceCmds = mkVkCmdDraw (pVkCmdDraw deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdDraw
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("vertexCount" ::: Word32) -> ("instanceCount" ::: Word32) -> ("firstVertex" ::: Word32) -> ("firstInstance" ::: Word32) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("vertexCount" ::: Word32) -> ("instanceCount" ::: Word32) -> ("firstVertex" ::: Word32) -> ("firstInstance" ::: Word32) -> IO ())
#endif

type FN_vkCmdDraw = ("commandBuffer" ::: VkCommandBuffer) -> ("vertexCount" ::: Word32) -> ("instanceCount" ::: Word32) -> ("firstVertex" ::: Word32) -> ("firstInstance" ::: Word32) -> IO ()
type PFN_vkCmdDraw = FunPtr FN_vkCmdDraw

-- | vkCmdDrawIndexed - Issue an indexed draw into a command buffer
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command is
--     recorded.
--
-- -   @indexCount@ is the number of vertices to draw.
--
-- -   @instanceCount@ is the number of instances to draw.
--
-- -   @firstIndex@ is the base index within the index buffer.
--
-- -   @vertexOffset@ is the value added to the vertex index before
--     indexing into the vertex buffer.
--
-- -   @firstInstance@ is the instance ID of the first instance to draw.
--
-- = Description
--
-- When the command is executed, primitives are assembled using the current
-- primitive topology and @indexCount@ vertices whose indices are retrieved
-- from the index buffer. The index buffer is treated as an array of
-- tightly packed unsigned integers of size defined by the
-- 'vkCmdBindIndexBuffer'::@indexType@ parameter with which the buffer was
-- bound.
--
-- The first vertex index is at an offset of @firstIndex@ * @indexSize@ +
-- @offset@ within the bound index buffer, where @offset@ is the offset
-- specified by 'vkCmdBindIndexBuffer' and @indexSize@ is the byte size of
-- the type specified by @indexType@. Subsequent index values are retrieved
-- from consecutive locations in the index buffer. Indices are first
-- compared to the primitive restart value, then zero extended to 32 bits
-- (if the @indexType@ is 'VK_INDEX_TYPE_UINT16') and have @vertexOffset@
-- added to them, before being supplied as the @vertexIndex@ value.
--
-- The primitives are drawn @instanceCount@ times with @instanceIndex@
-- starting with @firstInstance@ and increasing sequentially for each
-- instance. The assembled primitives execute the bound graphics pipeline.
--
-- == Valid Usage
--
-- -   If a 'Graphics.Vulkan.C.Core10.ImageView.VkImageView' is sampled
--     with 'Graphics.Vulkan.C.Core10.Sampler.VK_FILTER_LINEAR' as a result
--     of this command, then the image view’s
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#resources-image-view-format-features format features>
--     /must/ contain
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT'
--
-- -   If a 'Graphics.Vulkan.C.Core10.ImageView.VkImageView' is accessed
--     using atomic operations as a result of this command, then the image
--     view’s
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#resources-image-view-format-features format features>
--     /must/ contain
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT'
--
-- -   For each set /n/ that is statically used by the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to the pipeline
--     bind point used by this command, a descriptor set /must/ have been
--     bound to /n/ at the same pipeline bind point, with a
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' that is
--     compatible for set /n/, with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' used to create
--     the current 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline', as
--     described in
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#descriptorsets-compatibility ???>
--
-- -   For each push constant that is statically used by the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to the pipeline
--     bind point used by this command, a push constant value /must/ have
--     been set for the same pipeline bind point, with a
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' that is
--     compatible for push constants, with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' used to create
--     the current 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline', as
--     described in
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#descriptorsets-compatibility ???>
--
-- -   Descriptors in each bound descriptor set, specified via
--     'vkCmdBindDescriptorSets', /must/ be valid if they are statically
--     used by the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to
--     the pipeline bind point used by this command
--
-- -   A valid pipeline /must/ be bound to the pipeline bind point used by
--     this command
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command requires any dynamic
--     state, that state /must/ have been set for @commandBuffer@
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command accesses a
--     'Graphics.Vulkan.C.Core10.Sampler.VkSampler' object that uses
--     unnormalized coordinates, that sampler /must/ not be used to sample
--     from any 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' with a
--     'Graphics.Vulkan.C.Core10.ImageView.VkImageView' of the type
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_3D',
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_CUBE',
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_1D_ARRAY',
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_2D_ARRAY' or
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_CUBE_ARRAY',
--     in any shader stage
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command accesses a
--     'Graphics.Vulkan.C.Core10.Sampler.VkSampler' object that uses
--     unnormalized coordinates, that sampler /must/ not be used with any
--     of the SPIR-V @OpImageSample*@ or @OpImageSparseSample*@
--     instructions with @ImplicitLod@, @Dref@ or @Proj@ in their name, in
--     any shader stage
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command accesses a
--     'Graphics.Vulkan.C.Core10.Sampler.VkSampler' object that uses
--     unnormalized coordinates, that sampler /must/ not be used with any
--     of the SPIR-V @OpImageSample*@ or @OpImageSparseSample*@
--     instructions that includes a LOD bias or any offset values, in any
--     shader stage
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#features-robustBufferAccess robust buffer access>
--     feature is not enabled, and if the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound to the
--     pipeline bind point used by this command accesses a uniform buffer,
--     it /must/ not access values outside of the range of the buffer as
--     specified in the descriptor set bound to the same pipeline bind
--     point
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#features-robustBufferAccess robust buffer access>
--     feature is not enabled, and if the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound to the
--     pipeline bind point used by this command accesses a storage buffer,
--     it /must/ not access values outside of the range of the buffer as
--     specified in the descriptor set bound to the same pipeline bind
--     point
--
-- -   The current render pass /must/ be
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#renderpass-compatibility compatible>
--     with the @renderPass@ member of the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkGraphicsPipelineCreateInfo'
--     structure specified when creating the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to
--     'Graphics.Vulkan.C.Core10.Pass.VK_PIPELINE_BIND_POINT_GRAPHICS'.
--
-- -   The subpass index of the current render pass /must/ be equal to the
--     @subpass@ member of the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkGraphicsPipelineCreateInfo'
--     structure specified when creating the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to
--     'Graphics.Vulkan.C.Core10.Pass.VK_PIPELINE_BIND_POINT_GRAPHICS'.
--
-- -   Every input attachment used by the current subpass /must/ be bound
--     to the pipeline via a descriptor set
--
-- -   Image subresources used as attachments in the current render pass
--     /must/ not be accessed in any way other than as an attachment by
--     this command.
--
-- -   All vertex input bindings accessed via vertex input variables
--     declared in the vertex shader entry point’s interface /must/ have
--     valid buffers bound
--
-- -   For a given vertex buffer binding, any attribute data fetched /must/
--     be entirely contained within the corresponding vertex buffer
--     binding, as described in
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fxvertex-input ???>
--
-- -   (@indexSize@ * (@firstIndex@ + @indexCount@) + @offset@) /must/ be
--     less than or equal to the size of the bound index buffer, with
--     @indexSize@ being based on the type specified by @indexType@, where
--     the index buffer, @indexType@, and @offset@ are specified via
--     'vkCmdBindIndexBuffer'
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   This command /must/ only be called inside of a render pass instance
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Inside          | Graphics        | Graphics        |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdDrawIndexed" vkCmdDrawIndexed :: ("commandBuffer" ::: VkCommandBuffer) -> ("indexCount" ::: Word32) -> ("instanceCount" ::: Word32) -> ("firstIndex" ::: Word32) -> ("vertexOffset" ::: Int32) -> ("firstInstance" ::: Word32) -> IO ()
#else
vkCmdDrawIndexed :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("indexCount" ::: Word32) -> ("instanceCount" ::: Word32) -> ("firstIndex" ::: Word32) -> ("vertexOffset" ::: Int32) -> ("firstInstance" ::: Word32) -> IO ()
vkCmdDrawIndexed deviceCmds = mkVkCmdDrawIndexed (pVkCmdDrawIndexed deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdDrawIndexed
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("indexCount" ::: Word32) -> ("instanceCount" ::: Word32) -> ("firstIndex" ::: Word32) -> ("vertexOffset" ::: Int32) -> ("firstInstance" ::: Word32) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("indexCount" ::: Word32) -> ("instanceCount" ::: Word32) -> ("firstIndex" ::: Word32) -> ("vertexOffset" ::: Int32) -> ("firstInstance" ::: Word32) -> IO ())
#endif

type FN_vkCmdDrawIndexed = ("commandBuffer" ::: VkCommandBuffer) -> ("indexCount" ::: Word32) -> ("instanceCount" ::: Word32) -> ("firstIndex" ::: Word32) -> ("vertexOffset" ::: Int32) -> ("firstInstance" ::: Word32) -> IO ()
type PFN_vkCmdDrawIndexed = FunPtr FN_vkCmdDrawIndexed

-- | vkCmdDrawIndexedIndirect - Perform an indexed indirect draw
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command is
--     recorded.
--
-- -   @buffer@ is the buffer containing draw parameters.
--
-- -   @offset@ is the byte offset into @buffer@ where parameters begin.
--
-- -   @drawCount@ is the number of draws to execute, and /can/ be zero.
--
-- -   @stride@ is the byte stride between successive sets of draw
--     parameters.
--
-- = Description
--
-- 'vkCmdDrawIndexedIndirect' behaves similarly to 'vkCmdDrawIndexed'
-- except that the parameters are read by the device from a buffer during
-- execution. @drawCount@ draws are executed by the command, with
-- parameters taken from @buffer@ starting at @offset@ and increasing by
-- @stride@ bytes for each successive draw. The parameters of each draw are
-- encoded in an array of 'VkDrawIndexedIndirectCommand' structures. If
-- @drawCount@ is less than or equal to one, @stride@ is ignored.
--
-- == Valid Usage
--
-- -   If a 'Graphics.Vulkan.C.Core10.ImageView.VkImageView' is sampled
--     with 'Graphics.Vulkan.C.Core10.Sampler.VK_FILTER_LINEAR' as a result
--     of this command, then the image view’s
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#resources-image-view-format-features format features>
--     /must/ contain
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT'
--
-- -   If a 'Graphics.Vulkan.C.Core10.ImageView.VkImageView' is accessed
--     using atomic operations as a result of this command, then the image
--     view’s
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#resources-image-view-format-features format features>
--     /must/ contain
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT'
--
-- -   For each set /n/ that is statically used by the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to the pipeline
--     bind point used by this command, a descriptor set /must/ have been
--     bound to /n/ at the same pipeline bind point, with a
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' that is
--     compatible for set /n/, with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' used to create
--     the current 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline', as
--     described in
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#descriptorsets-compatibility ???>
--
-- -   For each push constant that is statically used by the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to the pipeline
--     bind point used by this command, a push constant value /must/ have
--     been set for the same pipeline bind point, with a
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' that is
--     compatible for push constants, with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' used to create
--     the current 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline', as
--     described in
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#descriptorsets-compatibility ???>
--
-- -   Descriptors in each bound descriptor set, specified via
--     'vkCmdBindDescriptorSets', /must/ be valid if they are statically
--     used by the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to
--     the pipeline bind point used by this command
--
-- -   A valid pipeline /must/ be bound to the pipeline bind point used by
--     this command
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command requires any dynamic
--     state, that state /must/ have been set for @commandBuffer@
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command accesses a
--     'Graphics.Vulkan.C.Core10.Sampler.VkSampler' object that uses
--     unnormalized coordinates, that sampler /must/ not be used to sample
--     from any 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' with a
--     'Graphics.Vulkan.C.Core10.ImageView.VkImageView' of the type
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_3D',
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_CUBE',
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_1D_ARRAY',
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_2D_ARRAY' or
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_CUBE_ARRAY',
--     in any shader stage
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command accesses a
--     'Graphics.Vulkan.C.Core10.Sampler.VkSampler' object that uses
--     unnormalized coordinates, that sampler /must/ not be used with any
--     of the SPIR-V @OpImageSample*@ or @OpImageSparseSample*@
--     instructions with @ImplicitLod@, @Dref@ or @Proj@ in their name, in
--     any shader stage
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command accesses a
--     'Graphics.Vulkan.C.Core10.Sampler.VkSampler' object that uses
--     unnormalized coordinates, that sampler /must/ not be used with any
--     of the SPIR-V @OpImageSample*@ or @OpImageSparseSample*@
--     instructions that includes a LOD bias or any offset values, in any
--     shader stage
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#features-robustBufferAccess robust buffer access>
--     feature is not enabled, and if the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound to the
--     pipeline bind point used by this command accesses a uniform buffer,
--     it /must/ not access values outside of the range of the buffer as
--     specified in the descriptor set bound to the same pipeline bind
--     point
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#features-robustBufferAccess robust buffer access>
--     feature is not enabled, and if the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound to the
--     pipeline bind point used by this command accesses a storage buffer,
--     it /must/ not access values outside of the range of the buffer as
--     specified in the descriptor set bound to the same pipeline bind
--     point
--
-- -   The current render pass /must/ be
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#renderpass-compatibility compatible>
--     with the @renderPass@ member of the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkGraphicsPipelineCreateInfo'
--     structure specified when creating the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to
--     'Graphics.Vulkan.C.Core10.Pass.VK_PIPELINE_BIND_POINT_GRAPHICS'.
--
-- -   The subpass index of the current render pass /must/ be equal to the
--     @subpass@ member of the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkGraphicsPipelineCreateInfo'
--     structure specified when creating the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to
--     'Graphics.Vulkan.C.Core10.Pass.VK_PIPELINE_BIND_POINT_GRAPHICS'.
--
-- -   Every input attachment used by the current subpass /must/ be bound
--     to the pipeline via a descriptor set
--
-- -   Image subresources used as attachments in the current render pass
--     /must/ not be accessed in any way other than as an attachment by
--     this command.
--
-- -   All vertex input bindings accessed via vertex input variables
--     declared in the vertex shader entry point’s interface /must/ have
--     valid buffers bound
--
-- -   For a given vertex buffer binding, any attribute data fetched /must/
--     be entirely contained within the corresponding vertex buffer
--     binding, as described in
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fxvertex-input ???>
--
-- -   If @buffer@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- -   @buffer@ /must/ have been created with the
--     'Graphics.Vulkan.C.Core10.Buffer.VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT'
--     bit set
--
-- -   @offset@ /must/ be a multiple of @4@
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#features-multiDrawIndirect multi-draw indirect>
--     feature is not enabled, @drawCount@ /must/ be @0@ or @1@
--
-- -   @drawCount@ /must/ be less than or equal to
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceLimits'::@maxDrawIndirectCount@
--
-- -   If @drawCount@ is greater than @1@, @stride@ /must/ be a multiple of
--     @4@ and /must/ be greater than or equal to
--     @sizeof@('VkDrawIndexedIndirectCommand')
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-drawIndirectFirstInstance drawIndirectFirstInstance>
--     feature is not enabled, all the @firstInstance@ members of the
--     'VkDrawIndexedIndirectCommand' structures accessed by this command
--     /must/ be @0@
--
-- -   If @drawCount@ is equal to @1@, (@offset@ +
--     @sizeof@('VkDrawIndexedIndirectCommand')) /must/ be less than or
--     equal to the size of @buffer@
--
-- -   If @drawCount@ is greater than @1@, (@stride@ × (@drawCount@ - 1) +
--     @offset@ + @sizeof@('VkDrawIndexedIndirectCommand')) /must/ be less
--     than or equal to the size of @buffer@
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @buffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer' handle
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   This command /must/ only be called inside of a render pass instance
--
-- -   Both of @buffer@, and @commandBuffer@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Inside          | Graphics        | Graphics        |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer',
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDeviceSize'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdDrawIndexedIndirect" vkCmdDrawIndexedIndirect :: ("commandBuffer" ::: VkCommandBuffer) -> ("buffer" ::: VkBuffer) -> ("offset" ::: VkDeviceSize) -> ("drawCount" ::: Word32) -> ("stride" ::: Word32) -> IO ()
#else
vkCmdDrawIndexedIndirect :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("buffer" ::: VkBuffer) -> ("offset" ::: VkDeviceSize) -> ("drawCount" ::: Word32) -> ("stride" ::: Word32) -> IO ()
vkCmdDrawIndexedIndirect deviceCmds = mkVkCmdDrawIndexedIndirect (pVkCmdDrawIndexedIndirect deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdDrawIndexedIndirect
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("buffer" ::: VkBuffer) -> ("offset" ::: VkDeviceSize) -> ("drawCount" ::: Word32) -> ("stride" ::: Word32) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("buffer" ::: VkBuffer) -> ("offset" ::: VkDeviceSize) -> ("drawCount" ::: Word32) -> ("stride" ::: Word32) -> IO ())
#endif

type FN_vkCmdDrawIndexedIndirect = ("commandBuffer" ::: VkCommandBuffer) -> ("buffer" ::: VkBuffer) -> ("offset" ::: VkDeviceSize) -> ("drawCount" ::: Word32) -> ("stride" ::: Word32) -> IO ()
type PFN_vkCmdDrawIndexedIndirect = FunPtr FN_vkCmdDrawIndexedIndirect

-- | vkCmdDrawIndirect - Issue an indirect draw into a command buffer
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command is
--     recorded.
--
-- -   @buffer@ is the buffer containing draw parameters.
--
-- -   @offset@ is the byte offset into @buffer@ where parameters begin.
--
-- -   @drawCount@ is the number of draws to execute, and /can/ be zero.
--
-- -   @stride@ is the byte stride between successive sets of draw
--     parameters.
--
-- = Description
--
-- 'vkCmdDrawIndirect' behaves similarly to 'vkCmdDraw' except that the
-- parameters are read by the device from a buffer during execution.
-- @drawCount@ draws are executed by the command, with parameters taken
-- from @buffer@ starting at @offset@ and increasing by @stride@ bytes for
-- each successive draw. The parameters of each draw are encoded in an
-- array of 'VkDrawIndirectCommand' structures. If @drawCount@ is less than
-- or equal to one, @stride@ is ignored.
--
-- == Valid Usage
--
-- -   If a 'Graphics.Vulkan.C.Core10.ImageView.VkImageView' is sampled
--     with 'Graphics.Vulkan.C.Core10.Sampler.VK_FILTER_LINEAR' as a result
--     of this command, then the image view’s
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#resources-image-view-format-features format features>
--     /must/ contain
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT'
--
-- -   If a 'Graphics.Vulkan.C.Core10.ImageView.VkImageView' is accessed
--     using atomic operations as a result of this command, then the image
--     view’s
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#resources-image-view-format-features format features>
--     /must/ contain
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT'
--
-- -   For each set /n/ that is statically used by the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to the pipeline
--     bind point used by this command, a descriptor set /must/ have been
--     bound to /n/ at the same pipeline bind point, with a
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' that is
--     compatible for set /n/, with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' used to create
--     the current 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline', as
--     described in
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#descriptorsets-compatibility ???>
--
-- -   For each push constant that is statically used by the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to the pipeline
--     bind point used by this command, a push constant value /must/ have
--     been set for the same pipeline bind point, with a
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' that is
--     compatible for push constants, with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' used to create
--     the current 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline', as
--     described in
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#descriptorsets-compatibility ???>
--
-- -   Descriptors in each bound descriptor set, specified via
--     'vkCmdBindDescriptorSets', /must/ be valid if they are statically
--     used by the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to
--     the pipeline bind point used by this command
--
-- -   A valid pipeline /must/ be bound to the pipeline bind point used by
--     this command
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command requires any dynamic
--     state, that state /must/ have been set for @commandBuffer@
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command accesses a
--     'Graphics.Vulkan.C.Core10.Sampler.VkSampler' object that uses
--     unnormalized coordinates, that sampler /must/ not be used to sample
--     from any 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' with a
--     'Graphics.Vulkan.C.Core10.ImageView.VkImageView' of the type
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_3D',
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_CUBE',
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_1D_ARRAY',
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_2D_ARRAY' or
--     'Graphics.Vulkan.C.Core10.ImageView.VK_IMAGE_VIEW_TYPE_CUBE_ARRAY',
--     in any shader stage
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command accesses a
--     'Graphics.Vulkan.C.Core10.Sampler.VkSampler' object that uses
--     unnormalized coordinates, that sampler /must/ not be used with any
--     of the SPIR-V @OpImageSample*@ or @OpImageSparseSample*@
--     instructions with @ImplicitLod@, @Dref@ or @Proj@ in their name, in
--     any shader stage
--
-- -   If the 'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound
--     to the pipeline bind point used by this command accesses a
--     'Graphics.Vulkan.C.Core10.Sampler.VkSampler' object that uses
--     unnormalized coordinates, that sampler /must/ not be used with any
--     of the SPIR-V @OpImageSample*@ or @OpImageSparseSample*@
--     instructions that includes a LOD bias or any offset values, in any
--     shader stage
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#features-robustBufferAccess robust buffer access>
--     feature is not enabled, and if the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound to the
--     pipeline bind point used by this command accesses a uniform buffer,
--     it /must/ not access values outside of the range of the buffer as
--     specified in the descriptor set bound to the same pipeline bind
--     point
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#features-robustBufferAccess robust buffer access>
--     feature is not enabled, and if the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' object bound to the
--     pipeline bind point used by this command accesses a storage buffer,
--     it /must/ not access values outside of the range of the buffer as
--     specified in the descriptor set bound to the same pipeline bind
--     point
--
-- -   The current render pass /must/ be
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#renderpass-compatibility compatible>
--     with the @renderPass@ member of the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkGraphicsPipelineCreateInfo'
--     structure specified when creating the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to
--     'Graphics.Vulkan.C.Core10.Pass.VK_PIPELINE_BIND_POINT_GRAPHICS'.
--
-- -   The subpass index of the current render pass /must/ be equal to the
--     @subpass@ member of the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkGraphicsPipelineCreateInfo'
--     structure specified when creating the
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipeline' bound to
--     'Graphics.Vulkan.C.Core10.Pass.VK_PIPELINE_BIND_POINT_GRAPHICS'.
--
-- -   Every input attachment used by the current subpass /must/ be bound
--     to the pipeline via a descriptor set
--
-- -   Image subresources used as attachments in the current render pass
--     /must/ not be accessed in any way other than as an attachment by
--     this command.
--
-- -   All vertex input bindings accessed via vertex input variables
--     declared in the vertex shader entry point’s interface /must/ have
--     valid buffers bound
--
-- -   For a given vertex buffer binding, any attribute data fetched /must/
--     be entirely contained within the corresponding vertex buffer
--     binding, as described in
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fxvertex-input ???>
--
-- -   If @buffer@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- -   @buffer@ /must/ have been created with the
--     'Graphics.Vulkan.C.Core10.Buffer.VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT'
--     bit set
--
-- -   @offset@ /must/ be a multiple of @4@
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#features-multiDrawIndirect multi-draw indirect>
--     feature is not enabled, @drawCount@ /must/ be @0@ or @1@
--
-- -   @drawCount@ /must/ be less than or equal to
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceLimits'::@maxDrawIndirectCount@
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-drawIndirectFirstInstance drawIndirectFirstInstance>
--     feature is not enabled, all the @firstInstance@ members of the
--     'VkDrawIndirectCommand' structures accessed by this command /must/
--     be @0@
--
-- -   If @drawCount@ is greater than @1@, @stride@ /must/ be a multiple of
--     @4@ and /must/ be greater than or equal to
--     @sizeof@('VkDrawIndirectCommand')
--
-- -   If @drawCount@ is equal to @1@, (@offset@ +
--     @sizeof@('VkDrawIndirectCommand')) /must/ be less than or equal to
--     the size of @buffer@
--
-- -   If @drawCount@ is greater than @1@, (@stride@ × (@drawCount@ - 1) +
--     @offset@ + @sizeof@('VkDrawIndirectCommand')) /must/ be less than or
--     equal to the size of @buffer@
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @buffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer' handle
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   This command /must/ only be called inside of a render pass instance
--
-- -   Both of @buffer@, and @commandBuffer@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Inside          | Graphics        | Graphics        |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer',
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDeviceSize'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdDrawIndirect" vkCmdDrawIndirect :: ("commandBuffer" ::: VkCommandBuffer) -> ("buffer" ::: VkBuffer) -> ("offset" ::: VkDeviceSize) -> ("drawCount" ::: Word32) -> ("stride" ::: Word32) -> IO ()
#else
vkCmdDrawIndirect :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("buffer" ::: VkBuffer) -> ("offset" ::: VkDeviceSize) -> ("drawCount" ::: Word32) -> ("stride" ::: Word32) -> IO ()
vkCmdDrawIndirect deviceCmds = mkVkCmdDrawIndirect (pVkCmdDrawIndirect deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdDrawIndirect
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("buffer" ::: VkBuffer) -> ("offset" ::: VkDeviceSize) -> ("drawCount" ::: Word32) -> ("stride" ::: Word32) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("buffer" ::: VkBuffer) -> ("offset" ::: VkDeviceSize) -> ("drawCount" ::: Word32) -> ("stride" ::: Word32) -> IO ())
#endif

type FN_vkCmdDrawIndirect = ("commandBuffer" ::: VkCommandBuffer) -> ("buffer" ::: VkBuffer) -> ("offset" ::: VkDeviceSize) -> ("drawCount" ::: Word32) -> ("stride" ::: Word32) -> IO ()
type PFN_vkCmdDrawIndirect = FunPtr FN_vkCmdDrawIndirect

-- | vkCmdEndQuery - Ends a query
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which this command will
--     be recorded.
--
-- -   @queryPool@ is the query pool that is managing the results of the
--     query.
--
-- -   @query@ is the query index within the query pool where the result is
--     stored.
--
-- = Description
--
-- As queries operate asynchronously, ending a query does not immediately
-- set the query’s status to available. A query is considered /finished/
-- when the final results of the query are ready to be retrieved by
-- 'Graphics.Vulkan.C.Core10.Query.vkGetQueryPoolResults' and
-- 'vkCmdCopyQueryPoolResults', and this is when the query’s status is set
-- to available.
--
-- Once a query is ended the query /must/ finish in finite time, unless the
-- state of the query is changed using other commands, e.g. by issuing a
-- reset of the query.
--
-- == Valid Usage
--
-- -   All queries used by the command /must/ be
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#queries-operation-active active>
--
-- -   @query@ /must/ be less than the number of queries in @queryPool@
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @queryPool@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Query.VkQueryPool' handle
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics, or
--     compute operations
--
-- -   Both of @commandBuffer@, and @queryPool@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Both            | Graphics        |                 |
-- > | Secondary       |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.Query.VkQueryPool'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdEndQuery" vkCmdEndQuery :: ("commandBuffer" ::: VkCommandBuffer) -> ("queryPool" ::: VkQueryPool) -> ("query" ::: Word32) -> IO ()
#else
vkCmdEndQuery :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("queryPool" ::: VkQueryPool) -> ("query" ::: Word32) -> IO ()
vkCmdEndQuery deviceCmds = mkVkCmdEndQuery (pVkCmdEndQuery deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdEndQuery
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("queryPool" ::: VkQueryPool) -> ("query" ::: Word32) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("queryPool" ::: VkQueryPool) -> ("query" ::: Word32) -> IO ())
#endif

type FN_vkCmdEndQuery = ("commandBuffer" ::: VkCommandBuffer) -> ("queryPool" ::: VkQueryPool) -> ("query" ::: Word32) -> IO ()
type PFN_vkCmdEndQuery = FunPtr FN_vkCmdEndQuery

-- | vkCmdEndRenderPass - End the current render pass
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer in which to end the current
--     render pass instance.
--
-- = Description
--
-- Ending a render pass instance performs any multisample resolve
-- operations on the final subpass.
--
-- == Valid Usage
--
-- -   The current subpass index /must/ be equal to the number of subpasses
--     in the render pass minus one
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   This command /must/ only be called inside of a render pass instance
--
-- -   @commandBuffer@ /must/ be a primary
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Inside          | Graphics        | Graphics        |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdEndRenderPass" vkCmdEndRenderPass :: ("commandBuffer" ::: VkCommandBuffer) -> IO ()
#else
vkCmdEndRenderPass :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> IO ()
vkCmdEndRenderPass deviceCmds = mkVkCmdEndRenderPass (pVkCmdEndRenderPass deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdEndRenderPass
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> IO ())
#endif

type FN_vkCmdEndRenderPass = ("commandBuffer" ::: VkCommandBuffer) -> IO ()
type PFN_vkCmdEndRenderPass = FunPtr FN_vkCmdEndRenderPass

-- | vkCmdExecuteCommands - Execute a secondary command buffer from a primary
-- command buffer
--
-- = Parameters
--
-- -   @commandBuffer@ is a handle to a primary command buffer that the
--     secondary command buffers are executed in.
--
-- -   @commandBufferCount@ is the length of the @pCommandBuffers@ array.
--
-- -   @pCommandBuffers@ is an array of secondary command buffer handles,
--     which are recorded to execute in the primary command buffer in the
--     order they are listed in the array.
--
-- = Description
--
-- If any element of @pCommandBuffers@ was not recorded with the
-- 'Graphics.Vulkan.C.Core10.CommandBuffer.VK_COMMAND_BUFFER_USAGE_SIMULTANEOUS_USE_BIT'
-- flag, and it was recorded into any other primary command buffer which is
-- currently in the
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#commandbuffers-lifecycle executable or recording state>,
-- that primary command buffer becomes
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#commandbuffers-lifecycle invalid>.
--
-- == Valid Usage
--
-- -   @commandBuffer@ /must/ have been allocated with a @level@ of
--     'Graphics.Vulkan.C.Core10.CommandBuffer.VK_COMMAND_BUFFER_LEVEL_PRIMARY'
--
-- -   Each element of @pCommandBuffers@ /must/ have been allocated with a
--     @level@ of
--     'Graphics.Vulkan.C.Core10.CommandBuffer.VK_COMMAND_BUFFER_LEVEL_SECONDARY'
--
-- -   Each element of @pCommandBuffers@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#commandbuffers-lifecycle pending or executable state>.
--
-- -   If any element of @pCommandBuffers@ was not recorded with the
--     'Graphics.Vulkan.C.Core10.CommandBuffer.VK_COMMAND_BUFFER_USAGE_SIMULTANEOUS_USE_BIT'
--     flag, and it was recorded into any other primary command buffer,
--     that primary command buffer /must/ not be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#commandbuffers-lifecycle pending state>
--
-- -   If any element of @pCommandBuffers@ was not recorded with the
--     'Graphics.Vulkan.C.Core10.CommandBuffer.VK_COMMAND_BUFFER_USAGE_SIMULTANEOUS_USE_BIT'
--     flag, it /must/ not be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#commandbuffers-lifecycle pending state>.
--
-- -   If any element of @pCommandBuffers@ was not recorded with the
--     'Graphics.Vulkan.C.Core10.CommandBuffer.VK_COMMAND_BUFFER_USAGE_SIMULTANEOUS_USE_BIT'
--     flag, it /must/ not have already been recorded to @commandBuffer@.
--
-- -   If any element of @pCommandBuffers@ was not recorded with the
--     'Graphics.Vulkan.C.Core10.CommandBuffer.VK_COMMAND_BUFFER_USAGE_SIMULTANEOUS_USE_BIT'
--     flag, it /must/ not appear more than once in @pCommandBuffers@.
--
-- -   Each element of @pCommandBuffers@ /must/ have been allocated from a
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that was
--     created for the same queue family as the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' from which
--     @commandBuffer@ was allocated
--
-- -   If 'vkCmdExecuteCommands' is being called within a render pass
--     instance, that render pass instance /must/ have been begun with the
--     @contents@ parameter of 'vkCmdBeginRenderPass' set to
--     'VK_SUBPASS_CONTENTS_SECONDARY_COMMAND_BUFFERS'
--
-- -   If 'vkCmdExecuteCommands' is being called within a render pass
--     instance, each element of @pCommandBuffers@ /must/ have been
--     recorded with the
--     'Graphics.Vulkan.C.Core10.CommandBuffer.VK_COMMAND_BUFFER_USAGE_RENDER_PASS_CONTINUE_BIT'
--
-- -   If 'vkCmdExecuteCommands' is being called within a render pass
--     instance, each element of @pCommandBuffers@ /must/ have been
--     recorded with
--     'Graphics.Vulkan.C.Core10.CommandBuffer.VkCommandBufferInheritanceInfo'::@subpass@
--     set to the index of the subpass which the given command buffer will
--     be executed in
--
-- -   If 'vkCmdExecuteCommands' is being called within a render pass
--     instance, the render passes specified in the
--     @pBeginInfo@::@pInheritanceInfo@::@renderPass@ members of the
--     'Graphics.Vulkan.C.Core10.CommandBuffer.vkBeginCommandBuffer'
--     commands used to begin recording each element of @pCommandBuffers@
--     /must/ be
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#renderpass-compatibility compatible>
--     with the current render pass.
--
-- -   If 'vkCmdExecuteCommands' is being called within a render pass
--     instance, and any element of @pCommandBuffers@ was recorded with
--     'Graphics.Vulkan.C.Core10.CommandBuffer.VkCommandBufferInheritanceInfo'::@framebuffer@
--     not equal to 'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE',
--     that 'Graphics.Vulkan.C.Core10.Pass.VkFramebuffer' /must/ match the
--     'Graphics.Vulkan.C.Core10.Pass.VkFramebuffer' used in the current
--     render pass instance
--
-- -   If 'vkCmdExecuteCommands' is not being called within a render pass
--     instance, each element of @pCommandBuffers@ /must/ not have been
--     recorded with the
--     'Graphics.Vulkan.C.Core10.CommandBuffer.VK_COMMAND_BUFFER_USAGE_RENDER_PASS_CONTINUE_BIT'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-inheritedQueries inherited queries>
--     feature is not enabled, @commandBuffer@ /must/ not have any queries
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#queries-operation-active active>
--
-- -   If @commandBuffer@ has a
--     'Graphics.Vulkan.C.Core10.Query.VK_QUERY_TYPE_OCCLUSION' query
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#queries-operation-active active>,
--     then each element of @pCommandBuffers@ /must/ have been recorded
--     with
--     'Graphics.Vulkan.C.Core10.CommandBuffer.VkCommandBufferInheritanceInfo'::@occlusionQueryEnable@
--     set to 'Graphics.Vulkan.C.Core10.Core.VK_TRUE'
--
-- -   If @commandBuffer@ has a
--     'Graphics.Vulkan.C.Core10.Query.VK_QUERY_TYPE_OCCLUSION' query
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#queries-operation-active active>,
--     then each element of @pCommandBuffers@ /must/ have been recorded
--     with
--     'Graphics.Vulkan.C.Core10.CommandBuffer.VkCommandBufferInheritanceInfo'::@queryFlags@
--     having all bits set that are set for the query
--
-- -   If @commandBuffer@ has a
--     'Graphics.Vulkan.C.Core10.Query.VK_QUERY_TYPE_PIPELINE_STATISTICS'
--     query
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#queries-operation-active active>,
--     then each element of @pCommandBuffers@ /must/ have been recorded
--     with
--     'Graphics.Vulkan.C.Core10.CommandBuffer.VkCommandBufferInheritanceInfo'::@pipelineStatistics@
--     having all bits set that are set in the
--     'Graphics.Vulkan.C.Core10.Query.VkQueryPool' the query uses
--
-- -   Each element of @pCommandBuffers@ /must/ not begin any query types
--     that are
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#queries-operation-active active>
--     in @commandBuffer@
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @pCommandBuffers@ /must/ be a valid pointer to an array of
--     @commandBufferCount@ valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handles
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support transfer,
--     graphics, or compute operations
--
-- -   @commandBuffer@ /must/ be a primary
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer'
--
-- -   @commandBufferCount@ /must/ be greater than @0@
--
-- -   Both of @commandBuffer@, and the elements of @pCommandBuffers@
--     /must/ have been created, allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Both            | Transfer        |                 |
-- > |                 |                 | Graphics        |                 |
-- > |                 |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdExecuteCommands" vkCmdExecuteCommands :: ("commandBuffer" ::: VkCommandBuffer) -> ("commandBufferCount" ::: Word32) -> ("pCommandBuffers" ::: Ptr VkCommandBuffer) -> IO ()
#else
vkCmdExecuteCommands :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("commandBufferCount" ::: Word32) -> ("pCommandBuffers" ::: Ptr VkCommandBuffer) -> IO ()
vkCmdExecuteCommands deviceCmds = mkVkCmdExecuteCommands (pVkCmdExecuteCommands deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdExecuteCommands
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("commandBufferCount" ::: Word32) -> ("pCommandBuffers" ::: Ptr VkCommandBuffer) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("commandBufferCount" ::: Word32) -> ("pCommandBuffers" ::: Ptr VkCommandBuffer) -> IO ())
#endif

type FN_vkCmdExecuteCommands = ("commandBuffer" ::: VkCommandBuffer) -> ("commandBufferCount" ::: Word32) -> ("pCommandBuffers" ::: Ptr VkCommandBuffer) -> IO ()
type PFN_vkCmdExecuteCommands = FunPtr FN_vkCmdExecuteCommands

-- | vkCmdFillBuffer - Fill a region of a buffer with a fixed value
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @dstBuffer@ is the buffer to be filled.
--
-- -   @dstOffset@ is the byte offset into the buffer at which to start
--     filling, and /must/ be a multiple of 4.
--
-- -   @size@ is the number of bytes to fill, and /must/ be either a
--     multiple of 4, or 'Graphics.Vulkan.C.Core10.Constants.VK_WHOLE_SIZE'
--     to fill the range from @offset@ to the end of the buffer. If
--     'Graphics.Vulkan.C.Core10.Constants.VK_WHOLE_SIZE' is used and the
--     remaining size of the buffer is not a multiple of 4, then the
--     nearest smaller multiple is used.
--
-- -   @data@ is the 4-byte word written repeatedly to the buffer to fill
--     @size@ bytes of data. The data word is written to memory according
--     to the host endianness.
--
-- = Description
--
-- 'vkCmdFillBuffer' is treated as “transfer” operation for the purposes of
-- synchronization barriers. The
-- 'Graphics.Vulkan.C.Core10.Buffer.VK_BUFFER_USAGE_TRANSFER_DST_BIT'
-- /must/ be specified in @usage@ of
-- 'Graphics.Vulkan.C.Core10.Buffer.VkBufferCreateInfo' in order for the
-- buffer to be compatible with 'vkCmdFillBuffer'.
--
-- == Valid Usage
--
-- -   @dstOffset@ /must/ be less than the size of @dstBuffer@
--
-- -   @dstOffset@ /must/ be a multiple of @4@
--
-- -   If @size@ is not equal to
--     'Graphics.Vulkan.C.Core10.Constants.VK_WHOLE_SIZE', @size@ /must/ be
--     greater than @0@
--
-- -   If @size@ is not equal to
--     'Graphics.Vulkan.C.Core10.Constants.VK_WHOLE_SIZE', @size@ /must/ be
--     less than or equal to the size of @dstBuffer@ minus @dstOffset@
--
-- -   If @size@ is not equal to
--     'Graphics.Vulkan.C.Core10.Constants.VK_WHOLE_SIZE', @size@ /must/ be
--     a multiple of @4@
--
-- -   @dstBuffer@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.Buffer.VK_BUFFER_USAGE_TRANSFER_DST_BIT'
--     usage flag
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics or
--     compute operations
--
-- -   If @dstBuffer@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @dstBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer' handle
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support transfer, graphics
--     or compute operations
--
-- -   This command /must/ only be called outside of a render pass instance
--
-- -   Both of @commandBuffer@, and @dstBuffer@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Outside         | Transfer        | Transfer        |
-- > | Secondary       |                 | Graphics        |                 |
-- > |                 |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer',
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDeviceSize'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdFillBuffer" vkCmdFillBuffer :: ("commandBuffer" ::: VkCommandBuffer) -> ("dstBuffer" ::: VkBuffer) -> ("dstOffset" ::: VkDeviceSize) -> ("size" ::: VkDeviceSize) -> ("data" ::: Word32) -> IO ()
#else
vkCmdFillBuffer :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("dstBuffer" ::: VkBuffer) -> ("dstOffset" ::: VkDeviceSize) -> ("size" ::: VkDeviceSize) -> ("data" ::: Word32) -> IO ()
vkCmdFillBuffer deviceCmds = mkVkCmdFillBuffer (pVkCmdFillBuffer deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdFillBuffer
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("dstBuffer" ::: VkBuffer) -> ("dstOffset" ::: VkDeviceSize) -> ("size" ::: VkDeviceSize) -> ("data" ::: Word32) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("dstBuffer" ::: VkBuffer) -> ("dstOffset" ::: VkDeviceSize) -> ("size" ::: VkDeviceSize) -> ("data" ::: Word32) -> IO ())
#endif

type FN_vkCmdFillBuffer = ("commandBuffer" ::: VkCommandBuffer) -> ("dstBuffer" ::: VkBuffer) -> ("dstOffset" ::: VkDeviceSize) -> ("size" ::: VkDeviceSize) -> ("data" ::: Word32) -> IO ()
type PFN_vkCmdFillBuffer = FunPtr FN_vkCmdFillBuffer

-- | vkCmdNextSubpass - Transition to the next subpass of a render pass
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer in which to record the
--     command.
--
-- -   @contents@ specifies how the commands in the next subpass will be
--     provided, in the same fashion as the corresponding parameter of
--     'vkCmdBeginRenderPass'.
--
-- = Description
--
-- The subpass index for a render pass begins at zero when
-- 'vkCmdBeginRenderPass' is recorded, and increments each time
-- 'vkCmdNextSubpass' is recorded.
--
-- Moving to the next subpass automatically performs any multisample
-- resolve operations in the subpass being ended. End-of-subpass
-- multisample resolves are treated as color attachment writes for the
-- purposes of synchronization. That is, they are considered to execute in
-- the
-- 'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT'
-- pipeline stage and their writes are synchronized with
-- 'Graphics.Vulkan.C.Core10.Pass.VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT'.
-- Synchronization between rendering within a subpass and any resolve
-- operations at the end of the subpass occurs automatically, without need
-- for explicit dependencies or pipeline barriers. However, if the resolve
-- attachment is also used in a different subpass, an explicit dependency
-- is needed.
--
-- After transitioning to the next subpass, the application /can/ record
-- the commands for that subpass.
--
-- == Valid Usage
--
-- -   The current subpass index /must/ be less than the number of
--     subpasses in the render pass minus one
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @contents@ /must/ be a valid 'VkSubpassContents' value
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   This command /must/ only be called inside of a render pass instance
--
-- -   @commandBuffer@ /must/ be a primary
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Inside          | Graphics        | Graphics        |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer', 'VkSubpassContents'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdNextSubpass" vkCmdNextSubpass :: ("commandBuffer" ::: VkCommandBuffer) -> ("contents" ::: VkSubpassContents) -> IO ()
#else
vkCmdNextSubpass :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("contents" ::: VkSubpassContents) -> IO ()
vkCmdNextSubpass deviceCmds = mkVkCmdNextSubpass (pVkCmdNextSubpass deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdNextSubpass
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("contents" ::: VkSubpassContents) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("contents" ::: VkSubpassContents) -> IO ())
#endif

type FN_vkCmdNextSubpass = ("commandBuffer" ::: VkCommandBuffer) -> ("contents" ::: VkSubpassContents) -> IO ()
type PFN_vkCmdNextSubpass = FunPtr FN_vkCmdNextSubpass

-- | vkCmdPipelineBarrier - Insert a memory dependency
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command is
--     recorded.
--
-- -   @srcStageMask@ is a bitmask of
--     'Graphics.Vulkan.C.Core10.Queue.VkPipelineStageFlagBits' specifying
--     the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages-masks source stage mask>.
--
-- -   @dstStageMask@ is a bitmask of
--     'Graphics.Vulkan.C.Core10.Queue.VkPipelineStageFlagBits' specifying
--     the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages-masks destination stage mask>.
--
-- -   @dependencyFlags@ is a bitmask of
--     'Graphics.Vulkan.C.Core10.Pass.VkDependencyFlagBits' specifying how
--     execution and memory dependencies are formed.
--
-- -   @memoryBarrierCount@ is the length of the @pMemoryBarriers@ array.
--
-- -   @pMemoryBarriers@ is a pointer to an array of 'VkMemoryBarrier'
--     structures.
--
-- -   @bufferMemoryBarrierCount@ is the length of the
--     @pBufferMemoryBarriers@ array.
--
-- -   @pBufferMemoryBarriers@ is a pointer to an array of
--     'VkBufferMemoryBarrier' structures.
--
-- -   @imageMemoryBarrierCount@ is the length of the
--     @pImageMemoryBarriers@ array.
--
-- -   @pImageMemoryBarriers@ is a pointer to an array of
--     'VkImageMemoryBarrier' structures.
--
-- = Description
--
-- When 'vkCmdPipelineBarrier' is submitted to a queue, it defines a memory
-- dependency between commands that were submitted before it, and those
-- submitted after it.
--
-- If 'vkCmdPipelineBarrier' was recorded outside a render pass instance,
-- the first
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-dependencies-scopes synchronization scope>
-- includes all commands that occur earlier in
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-submission-order submission order>.
-- If 'vkCmdPipelineBarrier' was recorded inside a render pass instance,
-- the first synchronization scope includes only commands that occur
-- earlier in
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-submission-order submission order>
-- within the same subpass. In either case, the first synchronization scope
-- is limited to operations on the pipeline stages determined by the
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages-masks source stage mask>
-- specified by @srcStageMask@.
--
-- If 'vkCmdPipelineBarrier' was recorded outside a render pass instance,
-- the second
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-dependencies-scopes synchronization scope>
-- includes all commands that occur later in
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-submission-order submission order>.
-- If 'vkCmdPipelineBarrier' was recorded inside a render pass instance,
-- the second synchronization scope includes only commands that occur later
-- in
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-submission-order submission order>
-- within the same subpass. In either case, the second synchronization
-- scope is limited to operations on the pipeline stages determined by the
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages-masks destination stage mask>
-- specified by @dstStageMask@.
--
-- The first
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-dependencies-access-scopes access scope>
-- is limited to access in the pipeline stages determined by the
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages-masks source stage mask>
-- specified by @srcStageMask@. Within that, the first access scope only
-- includes the first access scopes defined by elements of the
-- @pMemoryBarriers@, @pBufferMemoryBarriers@ and @pImageMemoryBarriers@
-- arrays, which each define a set of
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-memory-barriers memory barriers>.
-- If no memory barriers are specified, then the first access scope
-- includes no accesses.
--
-- The second
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-dependencies-access-scopes access scope>
-- is limited to access in the pipeline stages determined by the
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages-masks destination stage mask>
-- specified by @dstStageMask@. Within that, the second access scope only
-- includes the second access scopes defined by elements of the
-- @pMemoryBarriers@, @pBufferMemoryBarriers@ and @pImageMemoryBarriers@
-- arrays, which each define a set of
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-memory-barriers memory barriers>.
-- If no memory barriers are specified, then the second access scope
-- includes no accesses.
--
-- If @dependencyFlags@ includes
-- 'Graphics.Vulkan.C.Core10.Pass.VK_DEPENDENCY_BY_REGION_BIT', then any
-- dependency between
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-framebuffer-regions framebuffer-space>
-- pipeline stages is
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-framebuffer-regions framebuffer-local>
-- - otherwise it is
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-framebuffer-regions framebuffer-global>.
--
-- == Valid Usage
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-geometryShader geometry shaders>
--     feature is not enabled, @srcStageMask@ /must/ not contain
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_GEOMETRY_SHADER_BIT'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-geometryShader geometry shaders>
--     feature is not enabled, @dstStageMask@ /must/ not contain
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_GEOMETRY_SHADER_BIT'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-tessellationShader tessellation shaders>
--     feature is not enabled, @srcStageMask@ /must/ not contain
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_TESSELLATION_CONTROL_SHADER_BIT'
--     or
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_TESSELLATION_EVALUATION_SHADER_BIT'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-tessellationShader tessellation shaders>
--     feature is not enabled, @dstStageMask@ /must/ not contain
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_TESSELLATION_CONTROL_SHADER_BIT'
--     or
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_TESSELLATION_EVALUATION_SHADER_BIT'
--
-- -   If 'vkCmdPipelineBarrier' is called within a render pass instance,
--     the render pass /must/ have been created with at least one
--     'Graphics.Vulkan.C.Core10.Pass.VkSubpassDependency' instance in
--     'Graphics.Vulkan.C.Core10.Pass.VkRenderPassCreateInfo'::@pDependencies@
--     that expresses a dependency from the current subpass to itself, and
--     for which @srcStageMask@ contains a subset of the bit values in
--     'Graphics.Vulkan.C.Core10.Pass.VkSubpassDependency'::@srcStageMask@,
--     @dstStageMask@ contains a subset of the bit values in
--     'Graphics.Vulkan.C.Core10.Pass.VkSubpassDependency'::@dstStageMask@,
--     @dependencyFlags@ is equal to
--     'Graphics.Vulkan.C.Core10.Pass.VkSubpassDependency'::@dependencyFlags@,
--     @srcAccessMask@ member of each element of @pMemoryBarriers@ and
--     @pImageMemoryBarriers@ contains a subset of the bit values in
--     'Graphics.Vulkan.C.Core10.Pass.VkSubpassDependency'::@srcAccessMask@,
--     and @dstAccessMask@ member of each element of @pMemoryBarriers@ and
--     @pImageMemoryBarriers@ contains a subset of the bit values in
--     'Graphics.Vulkan.C.Core10.Pass.VkSubpassDependency'::@dstAccessMask@
--
-- -   If 'vkCmdPipelineBarrier' is called within a render pass instance,
--     @bufferMemoryBarrierCount@ /must/ be @0@
--
-- -   If 'vkCmdPipelineBarrier' is called within a render pass instance,
--     the @image@ member of any element of @pImageMemoryBarriers@ /must/
--     be equal to one of the elements of @pAttachments@ that the current
--     @framebuffer@ was created with, that is also referred to by one of
--     the elements of the @pColorAttachments@, @pResolveAttachments@ or
--     @pDepthStencilAttachment@ members of the
--     'Graphics.Vulkan.C.Core10.Pass.VkSubpassDescription' instance that
--     the current subpass was created with
--
-- -   If 'vkCmdPipelineBarrier' is called within a render pass instance,
--     the @oldLayout@ and @newLayout@ members of any element of
--     @pImageMemoryBarriers@ /must/ be equal to the @layout@ member of an
--     element of the @pColorAttachments@, @pResolveAttachments@ or
--     @pDepthStencilAttachment@ members of the
--     'Graphics.Vulkan.C.Core10.Pass.VkSubpassDescription' instance that
--     the current subpass was created with, that refers to the same
--     @image@
--
-- -   If 'vkCmdPipelineBarrier' is called within a render pass instance,
--     the @oldLayout@ and @newLayout@ members of an element of
--     @pImageMemoryBarriers@ /must/ be equal
--
-- -   If 'vkCmdPipelineBarrier' is called within a render pass instance,
--     the @srcQueueFamilyIndex@ and @dstQueueFamilyIndex@ members of any
--     element of @pImageMemoryBarriers@ /must/ be
--     'Graphics.Vulkan.C.Core10.Constants.VK_QUEUE_FAMILY_IGNORED'
--
-- -   Any pipeline stage included in @srcStageMask@ or @dstStageMask@
--     /must/ be supported by the capabilities of the queue family
--     specified by the @queueFamilyIndex@ member of the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPoolCreateInfo'
--     structure that was used to create the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from, as specified in the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages-supported table of supported pipeline stages>.
--
-- -   Each element of @pMemoryBarriers@, @pBufferMemoryBarriers@ and
--     @pImageMemoryBarriers@ /must/ not have any access flag included in
--     its @srcAccessMask@ member if that bit is not supported by any of
--     the pipeline stages in @srcStageMask@, as specified in the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-access-types-supported table of supported access types>.
--
-- -   Each element of @pMemoryBarriers@, @pBufferMemoryBarriers@ and
--     @pImageMemoryBarriers@ /must/ not have any access flag included in
--     its @dstAccessMask@ member if that bit is not supported by any of
--     the pipeline stages in @dstStageMask@, as specified in the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-access-types-supported table of supported access types>.
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @srcStageMask@ /must/ be a valid combination of
--     'Graphics.Vulkan.C.Core10.Queue.VkPipelineStageFlagBits' values
--
-- -   @srcStageMask@ /must/ not be @0@
--
-- -   @dstStageMask@ /must/ be a valid combination of
--     'Graphics.Vulkan.C.Core10.Queue.VkPipelineStageFlagBits' values
--
-- -   @dstStageMask@ /must/ not be @0@
--
-- -   @dependencyFlags@ /must/ be a valid combination of
--     'Graphics.Vulkan.C.Core10.Pass.VkDependencyFlagBits' values
--
-- -   If @memoryBarrierCount@ is not @0@, @pMemoryBarriers@ /must/ be a
--     valid pointer to an array of @memoryBarrierCount@ valid
--     'VkMemoryBarrier' structures
--
-- -   If @bufferMemoryBarrierCount@ is not @0@, @pBufferMemoryBarriers@
--     /must/ be a valid pointer to an array of @bufferMemoryBarrierCount@
--     valid 'VkBufferMemoryBarrier' structures
--
-- -   If @imageMemoryBarrierCount@ is not @0@, @pImageMemoryBarriers@
--     /must/ be a valid pointer to an array of @imageMemoryBarrierCount@
--     valid 'VkImageMemoryBarrier' structures
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support transfer,
--     graphics, or compute operations
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Both            | Transfer        |                 |
-- > | Secondary       |                 | Graphics        |                 |
-- > |                 |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'VkBufferMemoryBarrier',
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.Pass.VkDependencyFlags',
-- 'VkImageMemoryBarrier', 'VkMemoryBarrier',
-- 'Graphics.Vulkan.C.Core10.Queue.VkPipelineStageFlags'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdPipelineBarrier" vkCmdPipelineBarrier :: ("commandBuffer" ::: VkCommandBuffer) -> ("srcStageMask" ::: VkPipelineStageFlags) -> ("dstStageMask" ::: VkPipelineStageFlags) -> ("dependencyFlags" ::: VkDependencyFlags) -> ("memoryBarrierCount" ::: Word32) -> ("pMemoryBarriers" ::: Ptr VkMemoryBarrier) -> ("bufferMemoryBarrierCount" ::: Word32) -> ("pBufferMemoryBarriers" ::: Ptr VkBufferMemoryBarrier) -> ("imageMemoryBarrierCount" ::: Word32) -> ("pImageMemoryBarriers" ::: Ptr VkImageMemoryBarrier) -> IO ()
#else
vkCmdPipelineBarrier :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("srcStageMask" ::: VkPipelineStageFlags) -> ("dstStageMask" ::: VkPipelineStageFlags) -> ("dependencyFlags" ::: VkDependencyFlags) -> ("memoryBarrierCount" ::: Word32) -> ("pMemoryBarriers" ::: Ptr VkMemoryBarrier) -> ("bufferMemoryBarrierCount" ::: Word32) -> ("pBufferMemoryBarriers" ::: Ptr VkBufferMemoryBarrier) -> ("imageMemoryBarrierCount" ::: Word32) -> ("pImageMemoryBarriers" ::: Ptr VkImageMemoryBarrier) -> IO ()
vkCmdPipelineBarrier deviceCmds = mkVkCmdPipelineBarrier (pVkCmdPipelineBarrier deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdPipelineBarrier
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("srcStageMask" ::: VkPipelineStageFlags) -> ("dstStageMask" ::: VkPipelineStageFlags) -> ("dependencyFlags" ::: VkDependencyFlags) -> ("memoryBarrierCount" ::: Word32) -> ("pMemoryBarriers" ::: Ptr VkMemoryBarrier) -> ("bufferMemoryBarrierCount" ::: Word32) -> ("pBufferMemoryBarriers" ::: Ptr VkBufferMemoryBarrier) -> ("imageMemoryBarrierCount" ::: Word32) -> ("pImageMemoryBarriers" ::: Ptr VkImageMemoryBarrier) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("srcStageMask" ::: VkPipelineStageFlags) -> ("dstStageMask" ::: VkPipelineStageFlags) -> ("dependencyFlags" ::: VkDependencyFlags) -> ("memoryBarrierCount" ::: Word32) -> ("pMemoryBarriers" ::: Ptr VkMemoryBarrier) -> ("bufferMemoryBarrierCount" ::: Word32) -> ("pBufferMemoryBarriers" ::: Ptr VkBufferMemoryBarrier) -> ("imageMemoryBarrierCount" ::: Word32) -> ("pImageMemoryBarriers" ::: Ptr VkImageMemoryBarrier) -> IO ())
#endif

type FN_vkCmdPipelineBarrier = ("commandBuffer" ::: VkCommandBuffer) -> ("srcStageMask" ::: VkPipelineStageFlags) -> ("dstStageMask" ::: VkPipelineStageFlags) -> ("dependencyFlags" ::: VkDependencyFlags) -> ("memoryBarrierCount" ::: Word32) -> ("pMemoryBarriers" ::: Ptr VkMemoryBarrier) -> ("bufferMemoryBarrierCount" ::: Word32) -> ("pBufferMemoryBarriers" ::: Ptr VkBufferMemoryBarrier) -> ("imageMemoryBarrierCount" ::: Word32) -> ("pImageMemoryBarriers" ::: Ptr VkImageMemoryBarrier) -> IO ()
type PFN_vkCmdPipelineBarrier = FunPtr FN_vkCmdPipelineBarrier

-- | vkCmdPushConstants - Update the values of push constants
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer in which the push constant
--     update will be recorded.
--
-- -   @layout@ is the pipeline layout used to program the push constant
--     updates.
--
-- -   @stageFlags@ is a bitmask of
--     'Graphics.Vulkan.C.Core10.Pipeline.VkShaderStageFlagBits' specifying
--     the shader stages that will use the push constants in the updated
--     range.
--
-- -   @offset@ is the start offset of the push constant range to update,
--     in units of bytes.
--
-- -   @size@ is the size of the push constant range to update, in units of
--     bytes.
--
-- -   @pValues@ is an array of @size@ bytes containing the new push
--     constant values.
--
-- = Description
--
-- __Note__
--
-- As @stageFlags@ needs to include all flags the relevant push constant
-- ranges were created with, any flags that are not supported by the queue
-- family that the 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool'
-- used to allocate @commandBuffer@ was created on are ignored.
--
-- == Valid Usage
--
-- -   For each byte in the range specified by @offset@ and @size@ and for
--     each shader stage in @stageFlags@, there /must/ be a push constant
--     range in @layout@ that includes that byte and that stage
--
-- -   For each byte in the range specified by @offset@ and @size@ and for
--     each push constant range that overlaps that byte, @stageFlags@
--     /must/ include all stages in that push constant range’s
--     'Graphics.Vulkan.C.Core10.PipelineLayout.VkPushConstantRange'::@stageFlags@
--
-- -   @offset@ /must/ be a multiple of @4@
--
-- -   @size@ /must/ be a multiple of @4@
--
-- -   @offset@ /must/ be less than
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceLimits'::@maxPushConstantsSize@
--
-- -   @size@ /must/ be less than or equal to
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceLimits'::@maxPushConstantsSize@
--     minus @offset@
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @layout@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout' handle
--
-- -   @stageFlags@ /must/ be a valid combination of
--     'Graphics.Vulkan.C.Core10.Pipeline.VkShaderStageFlagBits' values
--
-- -   @stageFlags@ /must/ not be @0@
--
-- -   @pValues@ /must/ be a valid pointer to an array of @size@ bytes
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics, or
--     compute operations
--
-- -   @size@ /must/ be greater than @0@
--
-- -   Both of @commandBuffer@, and @layout@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Both            | Graphics        |                 |
-- > | Secondary       |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineLayout',
-- 'Graphics.Vulkan.C.Core10.PipelineLayout.VkShaderStageFlags'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdPushConstants" vkCmdPushConstants :: ("commandBuffer" ::: VkCommandBuffer) -> ("layout" ::: VkPipelineLayout) -> ("stageFlags" ::: VkShaderStageFlags) -> ("offset" ::: Word32) -> ("size" ::: Word32) -> ("pValues" ::: Ptr ()) -> IO ()
#else
vkCmdPushConstants :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("layout" ::: VkPipelineLayout) -> ("stageFlags" ::: VkShaderStageFlags) -> ("offset" ::: Word32) -> ("size" ::: Word32) -> ("pValues" ::: Ptr ()) -> IO ()
vkCmdPushConstants deviceCmds = mkVkCmdPushConstants (pVkCmdPushConstants deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdPushConstants
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("layout" ::: VkPipelineLayout) -> ("stageFlags" ::: VkShaderStageFlags) -> ("offset" ::: Word32) -> ("size" ::: Word32) -> ("pValues" ::: Ptr ()) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("layout" ::: VkPipelineLayout) -> ("stageFlags" ::: VkShaderStageFlags) -> ("offset" ::: Word32) -> ("size" ::: Word32) -> ("pValues" ::: Ptr ()) -> IO ())
#endif

type FN_vkCmdPushConstants = ("commandBuffer" ::: VkCommandBuffer) -> ("layout" ::: VkPipelineLayout) -> ("stageFlags" ::: VkShaderStageFlags) -> ("offset" ::: Word32) -> ("size" ::: Word32) -> ("pValues" ::: Ptr ()) -> IO ()
type PFN_vkCmdPushConstants = FunPtr FN_vkCmdPushConstants

-- | vkCmdResetEvent - Reset an event object to non-signaled state
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command is
--     recorded.
--
-- -   @event@ is the event that will be unsignaled.
--
-- -   @stageMask@ is a bitmask of
--     'Graphics.Vulkan.C.Core10.Queue.VkPipelineStageFlagBits' specifying
--     the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages source stage mask>
--     used to determine when the @event@ is unsignaled.
--
-- = Description
--
-- When 'vkCmdResetEvent' is submitted to a queue, it defines an execution
-- dependency on commands that were submitted before it, and defines an
-- event unsignal operation which resets the event to the unsignaled state.
--
-- The first
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-dependencies-scopes synchronization scope>
-- includes all commands that occur earlier in
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-submission-order submission order>.
-- The synchronization scope is limited to operations on the pipeline
-- stages determined by the
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages-masks source stage mask>
-- specified by @stageMask@.
--
-- The second
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-dependencies-scopes synchronization scope>
-- includes only the event unsignal operation.
--
-- If @event@ is already in the unsignaled state when 'vkCmdResetEvent' is
-- executed on the device, then 'vkCmdResetEvent' has no effect, no event
-- unsignal operation occurs, and no execution dependency is generated.
--
-- == Valid Usage
--
-- -   @stageMask@ /must/ not include
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_HOST_BIT'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-geometryShader geometry shaders>
--     feature is not enabled, @stageMask@ /must/ not contain
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_GEOMETRY_SHADER_BIT'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-tessellationShader tessellation shaders>
--     feature is not enabled, @stageMask@ /must/ not contain
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_TESSELLATION_CONTROL_SHADER_BIT'
--     or
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_TESSELLATION_EVALUATION_SHADER_BIT'
--
-- -   When this command executes, @event@ /must/ not be waited on by a
--     'vkCmdWaitEvents' command that is currently executing
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @event@ /must/ be a valid 'Graphics.Vulkan.C.Core10.Event.VkEvent'
--     handle
--
-- -   @stageMask@ /must/ be a valid combination of
--     'Graphics.Vulkan.C.Core10.Queue.VkPipelineStageFlagBits' values
--
-- -   @stageMask@ /must/ not be @0@
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics, or
--     compute operations
--
-- -   This command /must/ only be called outside of a render pass instance
--
-- -   Both of @commandBuffer@, and @event@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Outside         | Graphics        |                 |
-- > | Secondary       |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.Event.VkEvent',
-- 'Graphics.Vulkan.C.Core10.Queue.VkPipelineStageFlags'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdResetEvent" vkCmdResetEvent :: ("commandBuffer" ::: VkCommandBuffer) -> ("event" ::: VkEvent) -> ("stageMask" ::: VkPipelineStageFlags) -> IO ()
#else
vkCmdResetEvent :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("event" ::: VkEvent) -> ("stageMask" ::: VkPipelineStageFlags) -> IO ()
vkCmdResetEvent deviceCmds = mkVkCmdResetEvent (pVkCmdResetEvent deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdResetEvent
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("event" ::: VkEvent) -> ("stageMask" ::: VkPipelineStageFlags) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("event" ::: VkEvent) -> ("stageMask" ::: VkPipelineStageFlags) -> IO ())
#endif

type FN_vkCmdResetEvent = ("commandBuffer" ::: VkCommandBuffer) -> ("event" ::: VkEvent) -> ("stageMask" ::: VkPipelineStageFlags) -> IO ()
type PFN_vkCmdResetEvent = FunPtr FN_vkCmdResetEvent

-- | vkCmdResetQueryPool - Reset queries in a query pool
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which this command will
--     be recorded.
--
-- -   @queryPool@ is the handle of the query pool managing the queries
--     being reset.
--
-- -   @firstQuery@ is the initial query index to reset.
--
-- -   @queryCount@ is the number of queries to reset.
--
-- = Description
--
-- When executed on a queue, this command sets the status of query indices
-- [@firstQuery@, @firstQuery@ + @queryCount@ - 1] to unavailable.
--
-- == Valid Usage
--
-- -   @firstQuery@ /must/ be less than the number of queries in
--     @queryPool@
--
-- -   The sum of @firstQuery@ and @queryCount@ /must/ be less than or
--     equal to the number of queries in @queryPool@
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @queryPool@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Query.VkQueryPool' handle
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics, or
--     compute operations
--
-- -   This command /must/ only be called outside of a render pass instance
--
-- -   Both of @commandBuffer@, and @queryPool@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Outside         | Graphics        |                 |
-- > | Secondary       |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.Query.VkQueryPool'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdResetQueryPool" vkCmdResetQueryPool :: ("commandBuffer" ::: VkCommandBuffer) -> ("queryPool" ::: VkQueryPool) -> ("firstQuery" ::: Word32) -> ("queryCount" ::: Word32) -> IO ()
#else
vkCmdResetQueryPool :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("queryPool" ::: VkQueryPool) -> ("firstQuery" ::: Word32) -> ("queryCount" ::: Word32) -> IO ()
vkCmdResetQueryPool deviceCmds = mkVkCmdResetQueryPool (pVkCmdResetQueryPool deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdResetQueryPool
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("queryPool" ::: VkQueryPool) -> ("firstQuery" ::: Word32) -> ("queryCount" ::: Word32) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("queryPool" ::: VkQueryPool) -> ("firstQuery" ::: Word32) -> ("queryCount" ::: Word32) -> IO ())
#endif

type FN_vkCmdResetQueryPool = ("commandBuffer" ::: VkCommandBuffer) -> ("queryPool" ::: VkQueryPool) -> ("firstQuery" ::: Word32) -> ("queryCount" ::: Word32) -> IO ()
type PFN_vkCmdResetQueryPool = FunPtr FN_vkCmdResetQueryPool

-- | vkCmdResolveImage - Resolve regions of an image
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @srcImage@ is the source image.
--
-- -   @srcImageLayout@ is the layout of the source image subresources for
--     the resolve.
--
-- -   @dstImage@ is the destination image.
--
-- -   @dstImageLayout@ is the layout of the destination image subresources
--     for the resolve.
--
-- -   @regionCount@ is the number of regions to resolve.
--
-- -   @pRegions@ is a pointer to an array of 'VkImageResolve' structures
--     specifying the regions to resolve.
--
-- = Description
--
-- During the resolve the samples corresponding to each pixel location in
-- the source are converted to a single sample before being written to the
-- destination. If the source formats are floating-point or normalized
-- types, the sample values for each pixel are resolved in an
-- implementation-dependent manner. If the source formats are integer
-- types, a single sample’s value is selected for each pixel.
--
-- @srcOffset@ and @dstOffset@ select the initial @x@, @y@, and @z@ offsets
-- in texels of the sub-regions of the source and destination image data.
-- @extent@ is the size in texels of the source image to resolve in
-- @width@, @height@ and @depth@.
--
-- Resolves are done layer by layer starting with @baseArrayLayer@ member
-- of @srcSubresource@ for the source and @dstSubresource@ for the
-- destination. @layerCount@ layers are resolved to the destination image.
--
-- == Valid Usage
--
-- -   The source region specified by each element of @pRegions@ /must/ be
--     a region that is contained within @srcImage@
--
-- -   The destination region specified by each element of @pRegions@
--     /must/ be a region that is contained within @dstImage@
--
-- -   The union of all source regions, and the union of all destination
--     regions, specified by the elements of @pRegions@, /must/ not overlap
--     in memory
--
-- -   If @srcImage@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- -   @srcImage@ /must/ have a sample count equal to any valid sample
--     count value other than
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_SAMPLE_COUNT_1_BIT'
--
-- -   If @dstImage@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- -   @dstImage@ /must/ have a sample count equal to
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_SAMPLE_COUNT_1_BIT'
--
-- -   @srcImageLayout@ /must/ specify the layout of the image subresources
--     of @srcImage@ specified in @pRegions@ at the time this command is
--     executed on a
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- -   @srcImageLayout@ /must/ be
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL'
--     or 'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_GENERAL'
--
-- -   @dstImageLayout@ /must/ specify the layout of the image subresources
--     of @dstImage@ specified in @pRegions@ at the time this command is
--     executed on a
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- -   @dstImageLayout@ /must/ be
--     'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL'
--     or 'Graphics.Vulkan.C.Core10.Image.VK_IMAGE_LAYOUT_GENERAL'
--
-- -   The
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#resources-image-format-features format features>
--     of @dstImage@ /must/ contain
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT'.
--
-- -   @srcImage@ and @dstImage@ /must/ have been created with the same
--     image format
--
-- -   The @srcSubresource.mipLevel@ member of each element of @pRegions@
--     /must/ be less than the @mipLevels@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @srcImage@
--     was created
--
-- -   The @dstSubresource.mipLevel@ member of each element of @pRegions@
--     /must/ be less than the @mipLevels@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @dstImage@
--     was created
--
-- -   The @srcSubresource.baseArrayLayer@ + @srcSubresource.layerCount@ of
--     each element of @pRegions@ /must/ be less than or equal to the
--     @arrayLayers@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @srcImage@
--     was created
--
-- -   The @dstSubresource.baseArrayLayer@ + @dstSubresource.layerCount@ of
--     each element of @pRegions@ /must/ be less than or equal to the
--     @arrayLayers@ specified in
--     'Graphics.Vulkan.C.Core10.Image.VkImageCreateInfo' when @dstImage@
--     was created
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @srcImage@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' handle
--
-- -   @srcImageLayout@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Image.VkImageLayout' value
--
-- -   @dstImage@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage' handle
--
-- -   @dstImageLayout@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Image.VkImageLayout' value
--
-- -   @pRegions@ /must/ be a valid pointer to an array of @regionCount@
--     valid 'VkImageResolve' structures
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   This command /must/ only be called outside of a render pass instance
--
-- -   @regionCount@ /must/ be greater than @0@
--
-- -   Each of @commandBuffer@, @dstImage@, and @srcImage@ /must/ have been
--     created, allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Outside         | Graphics        | Transfer        |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkImage',
-- 'Graphics.Vulkan.C.Core10.Image.VkImageLayout', 'VkImageResolve'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdResolveImage" vkCmdResolveImage :: ("commandBuffer" ::: VkCommandBuffer) -> ("srcImage" ::: VkImage) -> ("srcImageLayout" ::: VkImageLayout) -> ("dstImage" ::: VkImage) -> ("dstImageLayout" ::: VkImageLayout) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkImageResolve) -> IO ()
#else
vkCmdResolveImage :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("srcImage" ::: VkImage) -> ("srcImageLayout" ::: VkImageLayout) -> ("dstImage" ::: VkImage) -> ("dstImageLayout" ::: VkImageLayout) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkImageResolve) -> IO ()
vkCmdResolveImage deviceCmds = mkVkCmdResolveImage (pVkCmdResolveImage deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdResolveImage
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("srcImage" ::: VkImage) -> ("srcImageLayout" ::: VkImageLayout) -> ("dstImage" ::: VkImage) -> ("dstImageLayout" ::: VkImageLayout) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkImageResolve) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("srcImage" ::: VkImage) -> ("srcImageLayout" ::: VkImageLayout) -> ("dstImage" ::: VkImage) -> ("dstImageLayout" ::: VkImageLayout) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkImageResolve) -> IO ())
#endif

type FN_vkCmdResolveImage = ("commandBuffer" ::: VkCommandBuffer) -> ("srcImage" ::: VkImage) -> ("srcImageLayout" ::: VkImageLayout) -> ("dstImage" ::: VkImage) -> ("dstImageLayout" ::: VkImageLayout) -> ("regionCount" ::: Word32) -> ("pRegions" ::: Ptr VkImageResolve) -> IO ()
type PFN_vkCmdResolveImage = FunPtr FN_vkCmdResolveImage

-- | vkCmdSetBlendConstants - Set the values of blend constants
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @blendConstants@ is an array of four values specifying the R, G, B,
--     and A components of the blend constant color used in blending,
--     depending on the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#framebuffer-blendfactors blend factor>.
--
-- == Valid Usage
--
-- -   The bound graphics pipeline /must/ have been created with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VK_DYNAMIC_STATE_BLEND_CONSTANTS'
--     dynamic state enabled
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Both            | Graphics        |                 |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdSetBlendConstants" vkCmdSetBlendConstants :: ("commandBuffer" ::: VkCommandBuffer) -> ("blendConstants" ::: Ptr CFloat) -> IO ()
#else
vkCmdSetBlendConstants :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("blendConstants" ::: Ptr CFloat) -> IO ()
vkCmdSetBlendConstants deviceCmds = mkVkCmdSetBlendConstants (pVkCmdSetBlendConstants deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdSetBlendConstants
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("blendConstants" ::: Ptr CFloat) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("blendConstants" ::: Ptr CFloat) -> IO ())
#endif

type FN_vkCmdSetBlendConstants = ("commandBuffer" ::: VkCommandBuffer) -> ("blendConstants" ::: Ptr CFloat) -> IO ()
type PFN_vkCmdSetBlendConstants = FunPtr FN_vkCmdSetBlendConstants

-- | vkCmdSetDepthBias - Set the depth bias dynamic state
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @depthBiasConstantFactor@ is a scalar factor controlling the
--     constant depth value added to each fragment.
--
-- -   @depthBiasClamp@ is the maximum (or minimum) depth bias of a
--     fragment.
--
-- -   @depthBiasSlopeFactor@ is a scalar factor applied to a fragment’s
--     slope in depth bias calculations.
--
-- = Description
--
-- If @depthBiasEnable@ is 'Graphics.Vulkan.C.Core10.Core.VK_FALSE', no
-- depth bias is applied and the fragment’s depth values are unchanged.
--
-- @depthBiasSlopeFactor@ scales the maximum depth slope of the polygon,
-- and @depthBiasConstantFactor@ scales an implementation-dependent
-- constant that relates to the usable resolution of the depth buffer. The
-- resulting values are summed to produce the depth bias value which is
-- then clamped to a minimum or maximum value specified by
-- @depthBiasClamp@. @depthBiasSlopeFactor@, @depthBiasConstantFactor@, and
-- @depthBiasClamp@ /can/ each be positive, negative, or zero.
--
-- The maximum depth slope m of a triangle is
--
-- \[m = \sqrt{ \left({{\partial z_f} \over {\partial x_f}}\right)^2
--         +  \left({{\partial z_f} \over {\partial y_f}}\right)^2}\]
--
-- where (xf, yf, zf) is a point on the triangle. m /may/ be approximated
-- as
--
-- \[m = \max\left( \left| { {\partial z_f} \over {\partial x_f} } \right|,
--                \left| { {\partial z_f} \over {\partial y_f} } \right|
--        \right).\]
--
-- The minimum resolvable difference r is an implementation-dependent
-- parameter that depends on the depth buffer representation. It is the
-- smallest difference in framebuffer coordinate z values that is
-- guaranteed to remain distinct throughout polygon rasterization and in
-- the depth buffer. All pairs of fragments generated by the rasterization
-- of two polygons with otherwise identical vertices, but @z@f values that
-- differ by r, will have distinct depth values.
--
-- For fixed-point depth buffer representations, r is constant throughout
-- the range of the entire depth buffer. For floating-point depth buffers,
-- there is no single minimum resolvable difference. In this case, the
-- minimum resolvable difference for a given polygon is dependent on the
-- maximum exponent, e, in the range of z values spanned by the primitive.
-- If n is the number of bits in the floating-point mantissa, the minimum
-- resolvable difference, r, for the given primitive is defined as
--
-- -   r = 2e-n
--
-- If no depth buffer is present, r is undefined.
--
-- The bias value o for a polygon is
--
-- \[\begin{aligned}
-- o &= \mathrm{dbclamp}( m \times \mathtt{depthBiasSlopeFactor} + r \times \mathtt{depthBiasConstantFactor} ) \\
-- \text{where} &\quad \mathrm{dbclamp}(x) =
-- \begin{cases}
--     x                                 & \mathtt{depthBiasClamp} = 0 \ \text{or}\ \texttt{NaN} \\
--     \min(x, \mathtt{depthBiasClamp})  & \mathtt{depthBiasClamp} > 0 \\
--     \max(x, \mathtt{depthBiasClamp})  & \mathtt{depthBiasClamp} < 0 \\
-- \end{cases}
-- \end{aligned}\]
--
-- m is computed as described above. If the depth buffer uses a fixed-point
-- representation, m is a function of depth values in the range [0,1], and
-- o is applied to depth values in the same range.
--
-- For fixed-point depth buffers, fragment depth values are always limited
-- to the range [0,1] by clamping after depth bias addition is performed.
-- Fragment depth values are clamped even when the depth buffer uses a
-- floating-point representation.
--
-- == Valid Usage
--
-- -   The bound graphics pipeline /must/ have been created with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VK_DYNAMIC_STATE_DEPTH_BIAS'
--     dynamic state enabled
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-depthBiasClamp depth bias clamping>
--     feature is not enabled, @depthBiasClamp@ /must/ be @0.0@
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Both            | Graphics        |                 |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdSetDepthBias" vkCmdSetDepthBias :: ("commandBuffer" ::: VkCommandBuffer) -> ("depthBiasConstantFactor" ::: CFloat) -> ("depthBiasClamp" ::: CFloat) -> ("depthBiasSlopeFactor" ::: CFloat) -> IO ()
#else
vkCmdSetDepthBias :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("depthBiasConstantFactor" ::: CFloat) -> ("depthBiasClamp" ::: CFloat) -> ("depthBiasSlopeFactor" ::: CFloat) -> IO ()
vkCmdSetDepthBias deviceCmds = mkVkCmdSetDepthBias (pVkCmdSetDepthBias deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdSetDepthBias
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("depthBiasConstantFactor" ::: CFloat) -> ("depthBiasClamp" ::: CFloat) -> ("depthBiasSlopeFactor" ::: CFloat) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("depthBiasConstantFactor" ::: CFloat) -> ("depthBiasClamp" ::: CFloat) -> ("depthBiasSlopeFactor" ::: CFloat) -> IO ())
#endif

type FN_vkCmdSetDepthBias = ("commandBuffer" ::: VkCommandBuffer) -> ("depthBiasConstantFactor" ::: CFloat) -> ("depthBiasClamp" ::: CFloat) -> ("depthBiasSlopeFactor" ::: CFloat) -> IO ()
type PFN_vkCmdSetDepthBias = FunPtr FN_vkCmdSetDepthBias

-- | vkCmdSetDepthBounds - Set the depth bounds test values for a command
-- buffer
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @minDepthBounds@ is the lower bound of the range of depth values
--     used in the depth bounds test.
--
-- -   @maxDepthBounds@ is the upper bound of the range.
--
-- == Valid Usage
--
-- -   The bound graphics pipeline /must/ have been created with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VK_DYNAMIC_STATE_DEPTH_BOUNDS'
--     dynamic state enabled
--
-- -   @minDepthBounds@ /must/ be between @0.0@ and @1.0@, inclusive
--
-- -   @maxDepthBounds@ /must/ be between @0.0@ and @1.0@, inclusive
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Both            | Graphics        |                 |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdSetDepthBounds" vkCmdSetDepthBounds :: ("commandBuffer" ::: VkCommandBuffer) -> ("minDepthBounds" ::: CFloat) -> ("maxDepthBounds" ::: CFloat) -> IO ()
#else
vkCmdSetDepthBounds :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("minDepthBounds" ::: CFloat) -> ("maxDepthBounds" ::: CFloat) -> IO ()
vkCmdSetDepthBounds deviceCmds = mkVkCmdSetDepthBounds (pVkCmdSetDepthBounds deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdSetDepthBounds
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("minDepthBounds" ::: CFloat) -> ("maxDepthBounds" ::: CFloat) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("minDepthBounds" ::: CFloat) -> ("maxDepthBounds" ::: CFloat) -> IO ())
#endif

type FN_vkCmdSetDepthBounds = ("commandBuffer" ::: VkCommandBuffer) -> ("minDepthBounds" ::: CFloat) -> ("maxDepthBounds" ::: CFloat) -> IO ()
type PFN_vkCmdSetDepthBounds = FunPtr FN_vkCmdSetDepthBounds

-- | vkCmdSetEvent - Set an event object to signaled state
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command is
--     recorded.
--
-- -   @event@ is the event that will be signaled.
--
-- -   @stageMask@ specifies the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages source stage mask>
--     used to determine when the @event@ is signaled.
--
-- = Description
--
-- When 'vkCmdSetEvent' is submitted to a queue, it defines an execution
-- dependency on commands that were submitted before it, and defines an
-- event signal operation which sets the event to the signaled state.
--
-- The first
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-dependencies-scopes synchronization scope>
-- includes all commands that occur earlier in
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-submission-order submission order>.
-- The synchronization scope is limited to operations on the pipeline
-- stages determined by the
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages-masks source stage mask>
-- specified by @stageMask@.
--
-- The second
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-dependencies-scopes synchronization scope>
-- includes only the event signal operation.
--
-- If @event@ is already in the signaled state when 'vkCmdSetEvent' is
-- executed on the device, then 'vkCmdSetEvent' has no effect, no event
-- signal operation occurs, and no execution dependency is generated.
--
-- == Valid Usage
--
-- -   @stageMask@ /must/ not include
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_HOST_BIT'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-geometryShader geometry shaders>
--     feature is not enabled, @stageMask@ /must/ not contain
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_GEOMETRY_SHADER_BIT'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-tessellationShader tessellation shaders>
--     feature is not enabled, @stageMask@ /must/ not contain
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_TESSELLATION_CONTROL_SHADER_BIT'
--     or
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_TESSELLATION_EVALUATION_SHADER_BIT'
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @event@ /must/ be a valid 'Graphics.Vulkan.C.Core10.Event.VkEvent'
--     handle
--
-- -   @stageMask@ /must/ be a valid combination of
--     'Graphics.Vulkan.C.Core10.Queue.VkPipelineStageFlagBits' values
--
-- -   @stageMask@ /must/ not be @0@
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics, or
--     compute operations
--
-- -   This command /must/ only be called outside of a render pass instance
--
-- -   Both of @commandBuffer@, and @event@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Outside         | Graphics        |                 |
-- > | Secondary       |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.Event.VkEvent',
-- 'Graphics.Vulkan.C.Core10.Queue.VkPipelineStageFlags'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdSetEvent" vkCmdSetEvent :: ("commandBuffer" ::: VkCommandBuffer) -> ("event" ::: VkEvent) -> ("stageMask" ::: VkPipelineStageFlags) -> IO ()
#else
vkCmdSetEvent :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("event" ::: VkEvent) -> ("stageMask" ::: VkPipelineStageFlags) -> IO ()
vkCmdSetEvent deviceCmds = mkVkCmdSetEvent (pVkCmdSetEvent deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdSetEvent
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("event" ::: VkEvent) -> ("stageMask" ::: VkPipelineStageFlags) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("event" ::: VkEvent) -> ("stageMask" ::: VkPipelineStageFlags) -> IO ())
#endif

type FN_vkCmdSetEvent = ("commandBuffer" ::: VkCommandBuffer) -> ("event" ::: VkEvent) -> ("stageMask" ::: VkPipelineStageFlags) -> IO ()
type PFN_vkCmdSetEvent = FunPtr FN_vkCmdSetEvent

-- | vkCmdSetLineWidth - Set the dynamic line width state
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @lineWidth@ is the width of rasterized line segments.
--
-- == Valid Usage
--
-- -   The bound graphics pipeline /must/ have been created with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VK_DYNAMIC_STATE_LINE_WIDTH'
--     dynamic state enabled
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-wideLines wide lines>
--     feature is not enabled, @lineWidth@ /must/ be @1.0@
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Both            | Graphics        |                 |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdSetLineWidth" vkCmdSetLineWidth :: ("commandBuffer" ::: VkCommandBuffer) -> ("lineWidth" ::: CFloat) -> IO ()
#else
vkCmdSetLineWidth :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("lineWidth" ::: CFloat) -> IO ()
vkCmdSetLineWidth deviceCmds = mkVkCmdSetLineWidth (pVkCmdSetLineWidth deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdSetLineWidth
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("lineWidth" ::: CFloat) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("lineWidth" ::: CFloat) -> IO ())
#endif

type FN_vkCmdSetLineWidth = ("commandBuffer" ::: VkCommandBuffer) -> ("lineWidth" ::: CFloat) -> IO ()
type PFN_vkCmdSetLineWidth = FunPtr FN_vkCmdSetLineWidth

-- | vkCmdSetScissor - Set the dynamic scissor rectangles on a command buffer
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @firstScissor@ is the index of the first scissor whose state is
--     updated by the command.
--
-- -   @scissorCount@ is the number of scissors whose rectangles are
--     updated by the command.
--
-- -   @pScissors@ is a pointer to an array of
--     'Graphics.Vulkan.C.Core10.Pipeline.VkRect2D' structures defining
--     scissor rectangles.
--
-- = Description
--
-- The scissor rectangles taken from element i of @pScissors@ replace the
-- current state for the scissor index @firstScissor@ + i, for i in [0,
-- @scissorCount@).
--
-- Each scissor rectangle is described by a
-- 'Graphics.Vulkan.C.Core10.Pipeline.VkRect2D' structure, with the
-- @offset.x@ and @offset.y@ values determining the upper left corner of
-- the scissor rectangle, and the @extent.width@ and @extent.height@ values
-- determining the size in pixels.
--
-- == Valid Usage
--
-- -   The bound graphics pipeline /must/ have been created with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VK_DYNAMIC_STATE_SCISSOR' dynamic
--     state enabled
--
-- -   @firstScissor@ /must/ be less than
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceLimits'::@maxViewports@
--
-- -   The sum of @firstScissor@ and @scissorCount@ /must/ be between @1@
--     and
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceLimits'::@maxViewports@,
--     inclusive
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-multiViewport multiple viewports>
--     feature is not enabled, @firstScissor@ /must/ be @0@
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-multiViewport multiple viewports>
--     feature is not enabled, @scissorCount@ /must/ be @1@
--
-- -   The @x@ and @y@ members of @offset@ /must/ be greater than or equal
--     to @0@
--
-- -   Evaluation of (@offset.x@ + @extent.width@) /must/ not cause a
--     signed integer addition overflow
--
-- -   Evaluation of (@offset.y@ + @extent.height@) /must/ not cause a
--     signed integer addition overflow
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @pScissors@ /must/ be a valid pointer to an array of @scissorCount@
--     'Graphics.Vulkan.C.Core10.Pipeline.VkRect2D' structures
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   @scissorCount@ /must/ be greater than @0@
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Both            | Graphics        |                 |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.Pipeline.VkRect2D'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdSetScissor" vkCmdSetScissor :: ("commandBuffer" ::: VkCommandBuffer) -> ("firstScissor" ::: Word32) -> ("scissorCount" ::: Word32) -> ("pScissors" ::: Ptr VkRect2D) -> IO ()
#else
vkCmdSetScissor :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("firstScissor" ::: Word32) -> ("scissorCount" ::: Word32) -> ("pScissors" ::: Ptr VkRect2D) -> IO ()
vkCmdSetScissor deviceCmds = mkVkCmdSetScissor (pVkCmdSetScissor deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdSetScissor
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("firstScissor" ::: Word32) -> ("scissorCount" ::: Word32) -> ("pScissors" ::: Ptr VkRect2D) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("firstScissor" ::: Word32) -> ("scissorCount" ::: Word32) -> ("pScissors" ::: Ptr VkRect2D) -> IO ())
#endif

type FN_vkCmdSetScissor = ("commandBuffer" ::: VkCommandBuffer) -> ("firstScissor" ::: Word32) -> ("scissorCount" ::: Word32) -> ("pScissors" ::: Ptr VkRect2D) -> IO ()
type PFN_vkCmdSetScissor = FunPtr FN_vkCmdSetScissor

-- | vkCmdSetStencilCompareMask - Set the stencil compare mask dynamic state
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @faceMask@ is a bitmask of 'VkStencilFaceFlagBits' specifying the
--     set of stencil state for which to update the compare mask.
--
-- -   @compareMask@ is the new value to use as the stencil compare mask.
--
-- == Valid Usage
--
-- -   The bound graphics pipeline /must/ have been created with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VK_DYNAMIC_STATE_STENCIL_COMPARE_MASK'
--     dynamic state enabled
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @faceMask@ /must/ be a valid combination of 'VkStencilFaceFlagBits'
--     values
--
-- -   @faceMask@ /must/ not be @0@
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Both            | Graphics        |                 |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer', 'VkStencilFaceFlags'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdSetStencilCompareMask" vkCmdSetStencilCompareMask :: ("commandBuffer" ::: VkCommandBuffer) -> ("faceMask" ::: VkStencilFaceFlags) -> ("compareMask" ::: Word32) -> IO ()
#else
vkCmdSetStencilCompareMask :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("faceMask" ::: VkStencilFaceFlags) -> ("compareMask" ::: Word32) -> IO ()
vkCmdSetStencilCompareMask deviceCmds = mkVkCmdSetStencilCompareMask (pVkCmdSetStencilCompareMask deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdSetStencilCompareMask
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("faceMask" ::: VkStencilFaceFlags) -> ("compareMask" ::: Word32) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("faceMask" ::: VkStencilFaceFlags) -> ("compareMask" ::: Word32) -> IO ())
#endif

type FN_vkCmdSetStencilCompareMask = ("commandBuffer" ::: VkCommandBuffer) -> ("faceMask" ::: VkStencilFaceFlags) -> ("compareMask" ::: Word32) -> IO ()
type PFN_vkCmdSetStencilCompareMask = FunPtr FN_vkCmdSetStencilCompareMask

-- | vkCmdSetStencilReference - Set the stencil reference dynamic state
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @faceMask@ is a bitmask of 'VkStencilFaceFlagBits' specifying the
--     set of stencil state for which to update the reference value, as
--     described above for 'vkCmdSetStencilCompareMask'.
--
-- -   @reference@ is the new value to use as the stencil reference value.
--
-- == Valid Usage
--
-- -   The bound graphics pipeline /must/ have been created with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VK_DYNAMIC_STATE_STENCIL_REFERENCE'
--     dynamic state enabled
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @faceMask@ /must/ be a valid combination of 'VkStencilFaceFlagBits'
--     values
--
-- -   @faceMask@ /must/ not be @0@
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Both            | Graphics        |                 |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer', 'VkStencilFaceFlags'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdSetStencilReference" vkCmdSetStencilReference :: ("commandBuffer" ::: VkCommandBuffer) -> ("faceMask" ::: VkStencilFaceFlags) -> ("reference" ::: Word32) -> IO ()
#else
vkCmdSetStencilReference :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("faceMask" ::: VkStencilFaceFlags) -> ("reference" ::: Word32) -> IO ()
vkCmdSetStencilReference deviceCmds = mkVkCmdSetStencilReference (pVkCmdSetStencilReference deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdSetStencilReference
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("faceMask" ::: VkStencilFaceFlags) -> ("reference" ::: Word32) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("faceMask" ::: VkStencilFaceFlags) -> ("reference" ::: Word32) -> IO ())
#endif

type FN_vkCmdSetStencilReference = ("commandBuffer" ::: VkCommandBuffer) -> ("faceMask" ::: VkStencilFaceFlags) -> ("reference" ::: Word32) -> IO ()
type PFN_vkCmdSetStencilReference = FunPtr FN_vkCmdSetStencilReference

-- | vkCmdSetStencilWriteMask - Set the stencil write mask dynamic state
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @faceMask@ is a bitmask of 'VkStencilFaceFlagBits' specifying the
--     set of stencil state for which to update the write mask, as
--     described above for 'vkCmdSetStencilCompareMask'.
--
-- -   @writeMask@ is the new value to use as the stencil write mask.
--
-- == Valid Usage
--
-- -   The bound graphics pipeline /must/ have been created with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VK_DYNAMIC_STATE_STENCIL_WRITE_MASK'
--     dynamic state enabled
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @faceMask@ /must/ be a valid combination of 'VkStencilFaceFlagBits'
--     values
--
-- -   @faceMask@ /must/ not be @0@
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Both            | Graphics        |                 |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer', 'VkStencilFaceFlags'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdSetStencilWriteMask" vkCmdSetStencilWriteMask :: ("commandBuffer" ::: VkCommandBuffer) -> ("faceMask" ::: VkStencilFaceFlags) -> ("writeMask" ::: Word32) -> IO ()
#else
vkCmdSetStencilWriteMask :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("faceMask" ::: VkStencilFaceFlags) -> ("writeMask" ::: Word32) -> IO ()
vkCmdSetStencilWriteMask deviceCmds = mkVkCmdSetStencilWriteMask (pVkCmdSetStencilWriteMask deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdSetStencilWriteMask
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("faceMask" ::: VkStencilFaceFlags) -> ("writeMask" ::: Word32) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("faceMask" ::: VkStencilFaceFlags) -> ("writeMask" ::: Word32) -> IO ())
#endif

type FN_vkCmdSetStencilWriteMask = ("commandBuffer" ::: VkCommandBuffer) -> ("faceMask" ::: VkStencilFaceFlags) -> ("writeMask" ::: Word32) -> IO ()
type PFN_vkCmdSetStencilWriteMask = FunPtr FN_vkCmdSetStencilWriteMask

-- | vkCmdSetViewport - Set the viewport on a command buffer
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @firstViewport@ is the index of the first viewport whose parameters
--     are updated by the command.
--
-- -   @viewportCount@ is the number of viewports whose parameters are
--     updated by the command.
--
-- -   @pViewports@ is a pointer to an array of
--     'Graphics.Vulkan.C.Core10.Pipeline.VkViewport' structures specifying
--     viewport parameters.
--
-- = Description
--
-- The viewport parameters taken from element i of @pViewports@ replace the
-- current state for the viewport index @firstViewport@ + i, for i in [0,
-- @viewportCount@).
--
-- == Valid Usage
--
-- -   The bound graphics pipeline /must/ have been created with the
--     'Graphics.Vulkan.C.Core10.Pipeline.VK_DYNAMIC_STATE_VIEWPORT'
--     dynamic state enabled
--
-- -   @firstViewport@ /must/ be less than
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceLimits'::@maxViewports@
--
-- -   The sum of @firstViewport@ and @viewportCount@ /must/ be between @1@
--     and
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDeviceLimits'::@maxViewports@,
--     inclusive
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-multiViewport multiple viewports>
--     feature is not enabled, @firstViewport@ /must/ be @0@
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-multiViewport multiple viewports>
--     feature is not enabled, @viewportCount@ /must/ be @1@
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @pViewports@ /must/ be a valid pointer to an array of
--     @viewportCount@ valid 'Graphics.Vulkan.C.Core10.Pipeline.VkViewport'
--     structures
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   @viewportCount@ /must/ be greater than @0@
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Both            | Graphics        |                 |
-- > | Secondary       |                 |                 |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.Pipeline.VkViewport'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdSetViewport" vkCmdSetViewport :: ("commandBuffer" ::: VkCommandBuffer) -> ("firstViewport" ::: Word32) -> ("viewportCount" ::: Word32) -> ("pViewports" ::: Ptr VkViewport) -> IO ()
#else
vkCmdSetViewport :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("firstViewport" ::: Word32) -> ("viewportCount" ::: Word32) -> ("pViewports" ::: Ptr VkViewport) -> IO ()
vkCmdSetViewport deviceCmds = mkVkCmdSetViewport (pVkCmdSetViewport deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdSetViewport
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("firstViewport" ::: Word32) -> ("viewportCount" ::: Word32) -> ("pViewports" ::: Ptr VkViewport) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("firstViewport" ::: Word32) -> ("viewportCount" ::: Word32) -> ("pViewports" ::: Ptr VkViewport) -> IO ())
#endif

type FN_vkCmdSetViewport = ("commandBuffer" ::: VkCommandBuffer) -> ("firstViewport" ::: Word32) -> ("viewportCount" ::: Word32) -> ("pViewports" ::: Ptr VkViewport) -> IO ()
type PFN_vkCmdSetViewport = FunPtr FN_vkCmdSetViewport

-- | vkCmdUpdateBuffer - Update a buffer’s contents from host memory
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @dstBuffer@ is a handle to the buffer to be updated.
--
-- -   @dstOffset@ is the byte offset into the buffer to start updating,
--     and /must/ be a multiple of 4.
--
-- -   @dataSize@ is the number of bytes to update, and /must/ be a
--     multiple of 4.
--
-- -   @pData@ is a pointer to the source data for the buffer update, and
--     /must/ be at least @dataSize@ bytes in size.
--
-- = Description
--
-- @dataSize@ /must/ be less than or equal to 65536 bytes. For larger
-- updates, applications /can/ use buffer to buffer
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#copies-buffers copies>.
--
-- __Note__
--
-- Buffer updates performed with 'vkCmdUpdateBuffer' first copy the data
-- into command buffer memory when the command is recorded (which requires
-- additional storage and may incur an additional allocation), and then
-- copy the data from the command buffer into @dstBuffer@ when the command
-- is executed on a device.
--
-- The additional cost of this functionality compared to
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#copies-buffers buffer to buffer copies>
-- means it is only recommended for very small amounts of data, and is why
-- it is limited to only 65536 bytes.
--
-- Applications /can/ work around this by issuing multiple
-- 'vkCmdUpdateBuffer' commands to different ranges of the same buffer, but
-- it is strongly recommended that they /should/ not.
--
-- The source data is copied from the user pointer to the command buffer
-- when the command is called.
--
-- 'vkCmdUpdateBuffer' is only allowed outside of a render pass. This
-- command is treated as “transfer” operation, for the purposes of
-- synchronization barriers. The
-- 'Graphics.Vulkan.C.Core10.Buffer.VK_BUFFER_USAGE_TRANSFER_DST_BIT'
-- /must/ be specified in @usage@ of
-- 'Graphics.Vulkan.C.Core10.Buffer.VkBufferCreateInfo' in order for the
-- buffer to be compatible with 'vkCmdUpdateBuffer'.
--
-- == Valid Usage
--
-- -   @dstOffset@ /must/ be less than the size of @dstBuffer@
--
-- -   @dataSize@ /must/ be less than or equal to the size of @dstBuffer@
--     minus @dstOffset@
--
-- -   @dstBuffer@ /must/ have been created with
--     'Graphics.Vulkan.C.Core10.Buffer.VK_BUFFER_USAGE_TRANSFER_DST_BIT'
--     usage flag
--
-- -   If @dstBuffer@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' object
--
-- -   @dstOffset@ /must/ be a multiple of @4@
--
-- -   @dataSize@ /must/ be less than or equal to @65536@
--
-- -   @dataSize@ /must/ be a multiple of @4@
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @dstBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer' handle
--
-- -   @pData@ /must/ be a valid pointer to an array of @dataSize@ bytes
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support transfer,
--     graphics, or compute operations
--
-- -   This command /must/ only be called outside of a render pass instance
--
-- -   @dataSize@ /must/ be greater than @0@
--
-- -   Both of @commandBuffer@, and @dstBuffer@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Outside         | Transfer        | Transfer        |
-- > | Secondary       |                 | Graphics        |                 |
-- > |                 |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.MemoryManagement.VkBuffer',
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDeviceSize'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdUpdateBuffer" vkCmdUpdateBuffer :: ("commandBuffer" ::: VkCommandBuffer) -> ("dstBuffer" ::: VkBuffer) -> ("dstOffset" ::: VkDeviceSize) -> ("dataSize" ::: VkDeviceSize) -> ("pData" ::: Ptr ()) -> IO ()
#else
vkCmdUpdateBuffer :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("dstBuffer" ::: VkBuffer) -> ("dstOffset" ::: VkDeviceSize) -> ("dataSize" ::: VkDeviceSize) -> ("pData" ::: Ptr ()) -> IO ()
vkCmdUpdateBuffer deviceCmds = mkVkCmdUpdateBuffer (pVkCmdUpdateBuffer deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdUpdateBuffer
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("dstBuffer" ::: VkBuffer) -> ("dstOffset" ::: VkDeviceSize) -> ("dataSize" ::: VkDeviceSize) -> ("pData" ::: Ptr ()) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("dstBuffer" ::: VkBuffer) -> ("dstOffset" ::: VkDeviceSize) -> ("dataSize" ::: VkDeviceSize) -> ("pData" ::: Ptr ()) -> IO ())
#endif

type FN_vkCmdUpdateBuffer = ("commandBuffer" ::: VkCommandBuffer) -> ("dstBuffer" ::: VkBuffer) -> ("dstOffset" ::: VkDeviceSize) -> ("dataSize" ::: VkDeviceSize) -> ("pData" ::: Ptr ()) -> IO ()
type PFN_vkCmdUpdateBuffer = FunPtr FN_vkCmdUpdateBuffer

-- | vkCmdWaitEvents - Wait for one or more events and insert a set of memory
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command is
--     recorded.
--
-- -   @eventCount@ is the length of the @pEvents@ array.
--
-- -   @pEvents@ is an array of event object handles to wait on.
--
-- -   @srcStageMask@ is a bitmask of
--     'Graphics.Vulkan.C.Core10.Queue.VkPipelineStageFlagBits' specifying
--     the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages source stage mask>.
--
-- -   @dstStageMask@ is a bitmask of
--     'Graphics.Vulkan.C.Core10.Queue.VkPipelineStageFlagBits' specifying
--     the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages destination stage mask>.
--
-- -   @memoryBarrierCount@ is the length of the @pMemoryBarriers@ array.
--
-- -   @pMemoryBarriers@ is a pointer to an array of 'VkMemoryBarrier'
--     structures.
--
-- -   @bufferMemoryBarrierCount@ is the length of the
--     @pBufferMemoryBarriers@ array.
--
-- -   @pBufferMemoryBarriers@ is a pointer to an array of
--     'VkBufferMemoryBarrier' structures.
--
-- -   @imageMemoryBarrierCount@ is the length of the
--     @pImageMemoryBarriers@ array.
--
-- -   @pImageMemoryBarriers@ is a pointer to an array of
--     'VkImageMemoryBarrier' structures.
--
-- = Description
--
-- When 'vkCmdWaitEvents' is submitted to a queue, it defines a memory
-- dependency between prior event signal operations on the same queue or
-- the host, and subsequent commands. 'vkCmdWaitEvents' /must/ not be used
-- to wait on event signal operations occurring on other queues.
--
-- The first synchronization scope only includes event signal operations
-- that operate on members of @pEvents@, and the operations that
-- happened-before the event signal operations. Event signal operations
-- performed by 'vkCmdSetEvent' that occur earlier in
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-submission-order submission order>
-- are included in the first synchronization scope, if the
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages-order logically latest>
-- pipeline stage in their @stageMask@ parameter is
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages-order logically earlier>
-- than or equal to the
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages-order logically latest>
-- pipeline stage in @srcStageMask@. Event signal operations performed by
-- 'Graphics.Vulkan.C.Core10.Event.vkSetEvent' are only included in the
-- first synchronization scope if
-- 'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_HOST_BIT' is included
-- in @srcStageMask@.
--
-- The second
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-dependencies-scopes synchronization scope>
-- includes all commands that occur later in
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-submission-order submission order>.
-- The second synchronization scope is limited to operations on the
-- pipeline stages determined by the
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages-masks destination stage mask>
-- specified by @dstStageMask@.
--
-- The first
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-dependencies-access-scopes access scope>
-- is limited to access in the pipeline stages determined by the
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages-masks source stage mask>
-- specified by @srcStageMask@. Within that, the first access scope only
-- includes the first access scopes defined by elements of the
-- @pMemoryBarriers@, @pBufferMemoryBarriers@ and @pImageMemoryBarriers@
-- arrays, which each define a set of
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-memory-barriers memory barriers>.
-- If no memory barriers are specified, then the first access scope
-- includes no accesses.
--
-- The second
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-dependencies-access-scopes access scope>
-- is limited to access in the pipeline stages determined by the
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages-masks destination stage mask>
-- specified by @dstStageMask@. Within that, the second access scope only
-- includes the second access scopes defined by elements of the
-- @pMemoryBarriers@, @pBufferMemoryBarriers@ and @pImageMemoryBarriers@
-- arrays, which each define a set of
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-memory-barriers memory barriers>.
-- If no memory barriers are specified, then the second access scope
-- includes no accesses.
--
-- __Note__
--
-- 'vkCmdWaitEvents' is used with 'vkCmdSetEvent' to define a memory
-- dependency between two sets of action commands, roughly in the same way
-- as pipeline barriers, but split into two commands such that work between
-- the two /may/ execute unhindered.
--
-- __Note__
--
-- Applications /should/ be careful to avoid race conditions when using
-- events. There is no direct ordering guarantee between a
-- 'vkCmdResetEvent' command and a 'vkCmdWaitEvents' command submitted
-- after it, so some other execution dependency /must/ be included between
-- these commands (e.g. a semaphore).
--
-- == Valid Usage
--
-- -   @srcStageMask@ /must/ be the bitwise OR of the @stageMask@ parameter
--     used in previous calls to 'vkCmdSetEvent' with any of the members of
--     @pEvents@ and
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_HOST_BIT' if any
--     of the members of @pEvents@ was set using
--     'Graphics.Vulkan.C.Core10.Event.vkSetEvent'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-geometryShader geometry shaders>
--     feature is not enabled, @srcStageMask@ /must/ not contain
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_GEOMETRY_SHADER_BIT'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-geometryShader geometry shaders>
--     feature is not enabled, @dstStageMask@ /must/ not contain
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_GEOMETRY_SHADER_BIT'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-tessellationShader tessellation shaders>
--     feature is not enabled, @srcStageMask@ /must/ not contain
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_TESSELLATION_CONTROL_SHADER_BIT'
--     or
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_TESSELLATION_EVALUATION_SHADER_BIT'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#features-tessellationShader tessellation shaders>
--     feature is not enabled, @dstStageMask@ /must/ not contain
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_TESSELLATION_CONTROL_SHADER_BIT'
--     or
--     'Graphics.Vulkan.C.Core10.Queue.VK_PIPELINE_STAGE_TESSELLATION_EVALUATION_SHADER_BIT'
--
-- -   If @pEvents@ includes one or more events that will be signaled by
--     'Graphics.Vulkan.C.Core10.Event.vkSetEvent' after @commandBuffer@
--     has been submitted to a queue, then 'vkCmdWaitEvents' /must/ not be
--     called inside a render pass instance
--
-- -   Any pipeline stage included in @srcStageMask@ or @dstStageMask@
--     /must/ be supported by the capabilities of the queue family
--     specified by the @queueFamilyIndex@ member of the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPoolCreateInfo'
--     structure that was used to create the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from, as specified in the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-pipeline-stages-supported table of supported pipeline stages>.
--
-- -   Each element of @pMemoryBarriers@, @pBufferMemoryBarriers@ or
--     @pImageMemoryBarriers@ /must/ not have any access flag included in
--     its @srcAccessMask@ member if that bit is not supported by any of
--     the pipeline stages in @srcStageMask@, as specified in the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-access-types-supported table of supported access types>.
--
-- -   Each element of @pMemoryBarriers@, @pBufferMemoryBarriers@ or
--     @pImageMemoryBarriers@ /must/ not have any access flag included in
--     its @dstAccessMask@ member if that bit is not supported by any of
--     the pipeline stages in @dstStageMask@, as specified in the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#synchronization-access-types-supported table of supported access types>.
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @pEvents@ /must/ be a valid pointer to an array of @eventCount@
--     valid 'Graphics.Vulkan.C.Core10.Event.VkEvent' handles
--
-- -   @srcStageMask@ /must/ be a valid combination of
--     'Graphics.Vulkan.C.Core10.Queue.VkPipelineStageFlagBits' values
--
-- -   @srcStageMask@ /must/ not be @0@
--
-- -   @dstStageMask@ /must/ be a valid combination of
--     'Graphics.Vulkan.C.Core10.Queue.VkPipelineStageFlagBits' values
--
-- -   @dstStageMask@ /must/ not be @0@
--
-- -   If @memoryBarrierCount@ is not @0@, @pMemoryBarriers@ /must/ be a
--     valid pointer to an array of @memoryBarrierCount@ valid
--     'VkMemoryBarrier' structures
--
-- -   If @bufferMemoryBarrierCount@ is not @0@, @pBufferMemoryBarriers@
--     /must/ be a valid pointer to an array of @bufferMemoryBarrierCount@
--     valid 'VkBufferMemoryBarrier' structures
--
-- -   If @imageMemoryBarrierCount@ is not @0@, @pImageMemoryBarriers@
--     /must/ be a valid pointer to an array of @imageMemoryBarrierCount@
--     valid 'VkImageMemoryBarrier' structures
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics, or
--     compute operations
--
-- -   @eventCount@ /must/ be greater than @0@
--
-- -   Both of @commandBuffer@, and the elements of @pEvents@ /must/ have
--     been created, allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Both            | Graphics        |                 |
-- > | Secondary       |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'VkBufferMemoryBarrier',
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.Event.VkEvent', 'VkImageMemoryBarrier',
-- 'VkMemoryBarrier', 'Graphics.Vulkan.C.Core10.Queue.VkPipelineStageFlags'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdWaitEvents" vkCmdWaitEvents :: ("commandBuffer" ::: VkCommandBuffer) -> ("eventCount" ::: Word32) -> ("pEvents" ::: Ptr VkEvent) -> ("srcStageMask" ::: VkPipelineStageFlags) -> ("dstStageMask" ::: VkPipelineStageFlags) -> ("memoryBarrierCount" ::: Word32) -> ("pMemoryBarriers" ::: Ptr VkMemoryBarrier) -> ("bufferMemoryBarrierCount" ::: Word32) -> ("pBufferMemoryBarriers" ::: Ptr VkBufferMemoryBarrier) -> ("imageMemoryBarrierCount" ::: Word32) -> ("pImageMemoryBarriers" ::: Ptr VkImageMemoryBarrier) -> IO ()
#else
vkCmdWaitEvents :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("eventCount" ::: Word32) -> ("pEvents" ::: Ptr VkEvent) -> ("srcStageMask" ::: VkPipelineStageFlags) -> ("dstStageMask" ::: VkPipelineStageFlags) -> ("memoryBarrierCount" ::: Word32) -> ("pMemoryBarriers" ::: Ptr VkMemoryBarrier) -> ("bufferMemoryBarrierCount" ::: Word32) -> ("pBufferMemoryBarriers" ::: Ptr VkBufferMemoryBarrier) -> ("imageMemoryBarrierCount" ::: Word32) -> ("pImageMemoryBarriers" ::: Ptr VkImageMemoryBarrier) -> IO ()
vkCmdWaitEvents deviceCmds = mkVkCmdWaitEvents (pVkCmdWaitEvents deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdWaitEvents
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("eventCount" ::: Word32) -> ("pEvents" ::: Ptr VkEvent) -> ("srcStageMask" ::: VkPipelineStageFlags) -> ("dstStageMask" ::: VkPipelineStageFlags) -> ("memoryBarrierCount" ::: Word32) -> ("pMemoryBarriers" ::: Ptr VkMemoryBarrier) -> ("bufferMemoryBarrierCount" ::: Word32) -> ("pBufferMemoryBarriers" ::: Ptr VkBufferMemoryBarrier) -> ("imageMemoryBarrierCount" ::: Word32) -> ("pImageMemoryBarriers" ::: Ptr VkImageMemoryBarrier) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("eventCount" ::: Word32) -> ("pEvents" ::: Ptr VkEvent) -> ("srcStageMask" ::: VkPipelineStageFlags) -> ("dstStageMask" ::: VkPipelineStageFlags) -> ("memoryBarrierCount" ::: Word32) -> ("pMemoryBarriers" ::: Ptr VkMemoryBarrier) -> ("bufferMemoryBarrierCount" ::: Word32) -> ("pBufferMemoryBarriers" ::: Ptr VkBufferMemoryBarrier) -> ("imageMemoryBarrierCount" ::: Word32) -> ("pImageMemoryBarriers" ::: Ptr VkImageMemoryBarrier) -> IO ())
#endif

type FN_vkCmdWaitEvents = ("commandBuffer" ::: VkCommandBuffer) -> ("eventCount" ::: Word32) -> ("pEvents" ::: Ptr VkEvent) -> ("srcStageMask" ::: VkPipelineStageFlags) -> ("dstStageMask" ::: VkPipelineStageFlags) -> ("memoryBarrierCount" ::: Word32) -> ("pMemoryBarriers" ::: Ptr VkMemoryBarrier) -> ("bufferMemoryBarrierCount" ::: Word32) -> ("pBufferMemoryBarriers" ::: Ptr VkBufferMemoryBarrier) -> ("imageMemoryBarrierCount" ::: Word32) -> ("pImageMemoryBarriers" ::: Ptr VkImageMemoryBarrier) -> IO ()
type PFN_vkCmdWaitEvents = FunPtr FN_vkCmdWaitEvents

-- | vkCmdWriteTimestamp - Write a device timestamp into a query object
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @pipelineStage@ is one of the
--     'Graphics.Vulkan.C.Core10.Queue.VkPipelineStageFlagBits', specifying
--     a stage of the pipeline.
--
-- -   @queryPool@ is the query pool that will manage the timestamp.
--
-- -   @query@ is the query within the query pool that will contain the
--     timestamp.
--
-- = Description
--
-- 'vkCmdWriteTimestamp' latches the value of the timer when all previous
-- commands have completed executing as far as the specified pipeline
-- stage, and writes the timestamp value to memory. When the timestamp
-- value is written, the availability status of the query is set to
-- available.
--
-- __Note__
--
-- If an implementation is unable to detect completion and latch the timer
-- at any specific stage of the pipeline, it /may/ instead do so at any
-- logically later stage.
--
-- 'vkCmdCopyQueryPoolResults' /can/ then be called to copy the timestamp
-- value from the query pool into buffer memory, with ordering and
-- synchronization behavior equivalent to how other queries operate.
-- Timestamp values /can/ also be retrieved from the query pool using
-- 'Graphics.Vulkan.C.Core10.Query.vkGetQueryPoolResults'. As with other
-- queries, the query /must/ be reset using 'vkCmdResetQueryPool' before
-- requesting the timestamp value be written to it.
--
-- While 'vkCmdWriteTimestamp' /can/ be called inside or outside of a
-- render pass instance, 'vkCmdCopyQueryPoolResults' /must/ only be called
-- outside of a render pass instance.
--
-- Timestamps /may/ only be meaningfully compared if they are written by
-- commands submitted to the same queue.
--
-- __Note__
--
-- An example of such a comparison is determining the execution time of a
-- sequence of commands.
--
-- == Valid Usage
--
-- -   @queryPool@ /must/ have been created with a @queryType@ of
--     'Graphics.Vulkan.C.Core10.Query.VK_QUERY_TYPE_TIMESTAMP'
--
-- -   The query identified by @queryPool@ and @query@ /must/ be
--     /unavailable/
--
-- -   The command pool’s queue family /must/ support a non-zero
--     @timestampValidBits@
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @pipelineStage@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkPipelineStageFlagBits' value
--
-- -   @queryPool@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Query.VkQueryPool' handle
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support transfer,
--     graphics, or compute operations
--
-- -   Both of @commandBuffer@, and @queryPool@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the
--     'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
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
-- > | Primary         | Both            | Transfer        | Transfer        |
-- > | Secondary       |                 | Graphics        |                 |
-- > |                 |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer',
-- 'Graphics.Vulkan.C.Core10.Queue.VkPipelineStageFlagBits',
-- 'Graphics.Vulkan.C.Core10.Query.VkQueryPool'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdWriteTimestamp" vkCmdWriteTimestamp :: ("commandBuffer" ::: VkCommandBuffer) -> ("pipelineStage" ::: VkPipelineStageFlagBits) -> ("queryPool" ::: VkQueryPool) -> ("query" ::: Word32) -> IO ()
#else
vkCmdWriteTimestamp :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("pipelineStage" ::: VkPipelineStageFlagBits) -> ("queryPool" ::: VkQueryPool) -> ("query" ::: Word32) -> IO ()
vkCmdWriteTimestamp deviceCmds = mkVkCmdWriteTimestamp (pVkCmdWriteTimestamp deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdWriteTimestamp
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("pipelineStage" ::: VkPipelineStageFlagBits) -> ("queryPool" ::: VkQueryPool) -> ("query" ::: Word32) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("pipelineStage" ::: VkPipelineStageFlagBits) -> ("queryPool" ::: VkQueryPool) -> ("query" ::: Word32) -> IO ())
#endif

type FN_vkCmdWriteTimestamp = ("commandBuffer" ::: VkCommandBuffer) -> ("pipelineStage" ::: VkPipelineStageFlagBits) -> ("queryPool" ::: VkQueryPool) -> ("query" ::: Word32) -> IO ()
type PFN_vkCmdWriteTimestamp = FunPtr FN_vkCmdWriteTimestamp
