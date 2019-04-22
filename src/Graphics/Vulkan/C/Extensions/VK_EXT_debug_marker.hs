{-# language Strict #-}
{-# language CPP #-}
{-# language DataKinds #-}
{-# language DuplicateRecordFields #-}
{-# language TypeOperators #-}
{-# language PatternSynonyms #-}
{-# language OverloadedStrings #-}

module Graphics.Vulkan.C.Extensions.VK_EXT_debug_marker
  ( VkDebugMarkerMarkerInfoEXT(..)
  , VkDebugMarkerObjectNameInfoEXT(..)
  , VkDebugMarkerObjectTagInfoEXT(..)
  , FN_vkCmdDebugMarkerBeginEXT
  , PFN_vkCmdDebugMarkerBeginEXT
  , vkCmdDebugMarkerBeginEXT
  , FN_vkCmdDebugMarkerEndEXT
  , PFN_vkCmdDebugMarkerEndEXT
  , vkCmdDebugMarkerEndEXT
  , FN_vkCmdDebugMarkerInsertEXT
  , PFN_vkCmdDebugMarkerInsertEXT
  , vkCmdDebugMarkerInsertEXT
  , FN_vkDebugMarkerSetObjectNameEXT
  , PFN_vkDebugMarkerSetObjectNameEXT
  , vkDebugMarkerSetObjectNameEXT
  , FN_vkDebugMarkerSetObjectTagEXT
  , PFN_vkDebugMarkerSetObjectTagEXT
  , vkDebugMarkerSetObjectTagEXT
  , pattern VK_EXT_DEBUG_MARKER_EXTENSION_NAME
  , pattern VK_EXT_DEBUG_MARKER_SPEC_VERSION
  , pattern VK_STRUCTURE_TYPE_DEBUG_MARKER_MARKER_INFO_EXT
  , pattern VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_NAME_INFO_EXT
  , pattern VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_TAG_INFO_EXT
  , VkDebugReportObjectTypeEXT(..)
  ) where

import Data.String
  ( IsString
  )
import Data.Vector.Storable.Sized
  ( Vector
  )
import Data.Word
  ( Word64
  )
import Foreign.C.Types
  ( CChar(..)
  , CFloat(..)
  , CSize(..)
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
  ( VkResult(..)
  , VkStructureType(..)
  , Zero(..)
  )
import Graphics.Vulkan.C.Core10.DeviceInitialization
  ( VkDevice
  )
import Graphics.Vulkan.C.Core10.Queue
  ( VkCommandBuffer
  )
import Graphics.Vulkan.C.Dynamic
  ( DeviceCmds(..)
  )
import Graphics.Vulkan.C.Extensions.VK_EXT_debug_report
  ( VkDebugReportObjectTypeEXT(..)
  )
import Graphics.Vulkan.NamedType
  ( (:::)
  )


-- | VkDebugMarkerMarkerInfoEXT - Specify parameters of a command buffer
-- marker region
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType',
-- 'vkCmdDebugMarkerBeginEXT', 'vkCmdDebugMarkerInsertEXT'
data VkDebugMarkerMarkerInfoEXT = VkDebugMarkerMarkerInfoEXT
  { -- | @sType@ /must/ be 'VK_STRUCTURE_TYPE_DEBUG_MARKER_MARKER_INFO_EXT'
  vkSType :: VkStructureType
  , -- | @pNext@ /must/ be @NULL@
  vkPNext :: Ptr ()
  , -- | @pMarkerName@ /must/ be a null-terminated UTF-8 string
  vkPMarkerName :: Ptr CChar
  , -- | @color@ is an /optional/ RGBA color value that can be associated with
  -- the marker. A particular implementation /may/ choose to ignore this
  -- color value. The values contain RGBA values in order, in the range 0.0
  -- to 1.0. If all elements in @color@ are set to 0.0 then it is ignored.
  vkColor :: Vector 4 CFloat
  }
  deriving (Eq, Show)

instance Storable VkDebugMarkerMarkerInfoEXT where
  sizeOf ~_ = 40
  alignment ~_ = 8
  peek ptr = VkDebugMarkerMarkerInfoEXT <$> peek (ptr `plusPtr` 0)
                                        <*> peek (ptr `plusPtr` 8)
                                        <*> peek (ptr `plusPtr` 16)
                                        <*> peek (ptr `plusPtr` 24)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkDebugMarkerMarkerInfoEXT))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkDebugMarkerMarkerInfoEXT))
                *> poke (ptr `plusPtr` 16) (vkPMarkerName (poked :: VkDebugMarkerMarkerInfoEXT))
                *> poke (ptr `plusPtr` 24) (vkColor (poked :: VkDebugMarkerMarkerInfoEXT))

instance Zero VkDebugMarkerMarkerInfoEXT where
  zero = VkDebugMarkerMarkerInfoEXT VK_STRUCTURE_TYPE_DEBUG_MARKER_MARKER_INFO_EXT
                                    zero
                                    zero
                                    zero

-- | VkDebugMarkerObjectNameInfoEXT - Specify parameters of a name to give to
-- an object
--
-- = Description
--
-- Applications /may/ change the name associated with an object simply by
-- calling 'vkDebugMarkerSetObjectNameEXT' again with a new string. To
-- remove a previously set name, @pObjectName@ /should/ be set to an empty
-- string.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_debug_report.VkDebugReportObjectTypeEXT',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType',
-- 'vkDebugMarkerSetObjectNameEXT'
data VkDebugMarkerObjectNameInfoEXT = VkDebugMarkerObjectNameInfoEXT
  { -- | @sType@ /must/ be 'VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_NAME_INFO_EXT'
  vkSType :: VkStructureType
  , -- | @pNext@ /must/ be @NULL@
  vkPNext :: Ptr ()
  , -- | @objectType@ /must/ be a valid
  -- 'Graphics.Vulkan.C.Extensions.VK_EXT_debug_report.VkDebugReportObjectTypeEXT'
  -- value
  vkObjectType :: VkDebugReportObjectTypeEXT
  , -- | @object@ /must/ be a Vulkan object of the type associated with
  -- @objectType@ as defined in
  -- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#debug-report-object-types>.
  vkObject :: Word64
  , -- | @pObjectName@ /must/ be a null-terminated UTF-8 string
  vkPObjectName :: Ptr CChar
  }
  deriving (Eq, Show)

instance Storable VkDebugMarkerObjectNameInfoEXT where
  sizeOf ~_ = 40
  alignment ~_ = 8
  peek ptr = VkDebugMarkerObjectNameInfoEXT <$> peek (ptr `plusPtr` 0)
                                            <*> peek (ptr `plusPtr` 8)
                                            <*> peek (ptr `plusPtr` 16)
                                            <*> peek (ptr `plusPtr` 24)
                                            <*> peek (ptr `plusPtr` 32)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkDebugMarkerObjectNameInfoEXT))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkDebugMarkerObjectNameInfoEXT))
                *> poke (ptr `plusPtr` 16) (vkObjectType (poked :: VkDebugMarkerObjectNameInfoEXT))
                *> poke (ptr `plusPtr` 24) (vkObject (poked :: VkDebugMarkerObjectNameInfoEXT))
                *> poke (ptr `plusPtr` 32) (vkPObjectName (poked :: VkDebugMarkerObjectNameInfoEXT))

instance Zero VkDebugMarkerObjectNameInfoEXT where
  zero = VkDebugMarkerObjectNameInfoEXT VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_NAME_INFO_EXT
                                        zero
                                        zero
                                        zero
                                        zero

-- | VkDebugMarkerObjectTagInfoEXT - Specify parameters of a tag to attach to
-- an object
--
-- = Description
--
-- The @tagName@ parameter gives a name or identifier to the type of data
-- being tagged. This can be used by debugging layers to easily filter for
-- only data that can be used by that implementation.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_debug_report.VkDebugReportObjectTypeEXT',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType',
-- 'vkDebugMarkerSetObjectTagEXT'
data VkDebugMarkerObjectTagInfoEXT = VkDebugMarkerObjectTagInfoEXT
  { -- | @sType@ /must/ be 'VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_TAG_INFO_EXT'
  vkSType :: VkStructureType
  , -- | @pNext@ /must/ be @NULL@
  vkPNext :: Ptr ()
  , -- | @objectType@ /must/ be a valid
  -- 'Graphics.Vulkan.C.Extensions.VK_EXT_debug_report.VkDebugReportObjectTypeEXT'
  -- value
  vkObjectType :: VkDebugReportObjectTypeEXT
  , -- | @object@ /must/ be a Vulkan object of the type associated with
  -- @objectType@ as defined in
  -- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#debug-report-object-types>.
  vkObject :: Word64
  , -- | @tagName@ is a numerical identifier of the tag.
  vkTagName :: Word64
  , -- | @tagSize@ /must/ be greater than @0@
  vkTagSize :: CSize
  , -- | @pTag@ /must/ be a valid pointer to an array of @tagSize@ bytes
  vkPTag :: Ptr ()
  }
  deriving (Eq, Show)

instance Storable VkDebugMarkerObjectTagInfoEXT where
  sizeOf ~_ = 56
  alignment ~_ = 8
  peek ptr = VkDebugMarkerObjectTagInfoEXT <$> peek (ptr `plusPtr` 0)
                                           <*> peek (ptr `plusPtr` 8)
                                           <*> peek (ptr `plusPtr` 16)
                                           <*> peek (ptr `plusPtr` 24)
                                           <*> peek (ptr `plusPtr` 32)
                                           <*> peek (ptr `plusPtr` 40)
                                           <*> peek (ptr `plusPtr` 48)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkDebugMarkerObjectTagInfoEXT))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkDebugMarkerObjectTagInfoEXT))
                *> poke (ptr `plusPtr` 16) (vkObjectType (poked :: VkDebugMarkerObjectTagInfoEXT))
                *> poke (ptr `plusPtr` 24) (vkObject (poked :: VkDebugMarkerObjectTagInfoEXT))
                *> poke (ptr `plusPtr` 32) (vkTagName (poked :: VkDebugMarkerObjectTagInfoEXT))
                *> poke (ptr `plusPtr` 40) (vkTagSize (poked :: VkDebugMarkerObjectTagInfoEXT))
                *> poke (ptr `plusPtr` 48) (vkPTag (poked :: VkDebugMarkerObjectTagInfoEXT))

instance Zero VkDebugMarkerObjectTagInfoEXT where
  zero = VkDebugMarkerObjectTagInfoEXT VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_TAG_INFO_EXT
                                       zero
                                       zero
                                       zero
                                       zero
                                       zero
                                       zero

-- | vkCmdDebugMarkerBeginEXT - Open a command buffer marker region
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command is
--     recorded.
--
-- -   @pMarkerInfo@ is a pointer to an instance of the
--     'VkDebugMarkerMarkerInfoEXT' structure specifying the parameters of
--     the marker region to open.
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @pMarkerInfo@ /must/ be a valid pointer to a valid
--     'VkDebugMarkerMarkerInfoEXT' structure
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics, or
--     compute operations
--
-- == Host Synchronization
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
-- 'VkDebugMarkerMarkerInfoEXT'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdDebugMarkerBeginEXT" vkCmdDebugMarkerBeginEXT :: ("commandBuffer" ::: VkCommandBuffer) -> ("pMarkerInfo" ::: Ptr VkDebugMarkerMarkerInfoEXT) -> IO ()
#else
vkCmdDebugMarkerBeginEXT :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("pMarkerInfo" ::: Ptr VkDebugMarkerMarkerInfoEXT) -> IO ()
vkCmdDebugMarkerBeginEXT deviceCmds = mkVkCmdDebugMarkerBeginEXT (pVkCmdDebugMarkerBeginEXT deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdDebugMarkerBeginEXT
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("pMarkerInfo" ::: Ptr VkDebugMarkerMarkerInfoEXT) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("pMarkerInfo" ::: Ptr VkDebugMarkerMarkerInfoEXT) -> IO ())
#endif

type FN_vkCmdDebugMarkerBeginEXT = ("commandBuffer" ::: VkCommandBuffer) -> ("pMarkerInfo" ::: Ptr VkDebugMarkerMarkerInfoEXT) -> IO ()
type PFN_vkCmdDebugMarkerBeginEXT = FunPtr FN_vkCmdDebugMarkerBeginEXT

-- | vkCmdDebugMarkerEndEXT - Close a command buffer marker region
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command is
--     recorded.
--
-- = Description
--
-- An application /may/ open a marker region in one command buffer and
-- close it in another, or otherwise split marker regions across multiple
-- command buffers or multiple queue submissions. When viewed from the
-- linear series of submissions to a single queue, the calls to
-- 'vkCmdDebugMarkerBeginEXT' and 'vkCmdDebugMarkerEndEXT' /must/ be
-- matched and balanced.
--
-- == Valid Usage
--
-- -   There /must/ be an outstanding 'vkCmdDebugMarkerBeginEXT' command
--     prior to the 'vkCmdDebugMarkerEndEXT' on the queue that
--     @commandBuffer@ is submitted to
--
-- -   If @commandBuffer@ is a secondary command buffer, there /must/ be an
--     outstanding 'vkCmdDebugMarkerBeginEXT' command recorded to
--     @commandBuffer@ that has not previously been ended by a call to
--     'vkCmdDebugMarkerEndEXT'.
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
--     @commandBuffer@ was allocated from /must/ support graphics, or
--     compute operations
--
-- == Host Synchronization
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
-- 'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdDebugMarkerEndEXT" vkCmdDebugMarkerEndEXT :: ("commandBuffer" ::: VkCommandBuffer) -> IO ()
#else
vkCmdDebugMarkerEndEXT :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> IO ()
vkCmdDebugMarkerEndEXT deviceCmds = mkVkCmdDebugMarkerEndEXT (pVkCmdDebugMarkerEndEXT deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdDebugMarkerEndEXT
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> IO ())
#endif

type FN_vkCmdDebugMarkerEndEXT = ("commandBuffer" ::: VkCommandBuffer) -> IO ()
type PFN_vkCmdDebugMarkerEndEXT = FunPtr FN_vkCmdDebugMarkerEndEXT

-- | vkCmdDebugMarkerInsertEXT - Insert a marker label into a command buffer
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command is
--     recorded.
--
-- -   @pMarkerInfo@ is a pointer to an instance of the
--     'VkDebugMarkerMarkerInfoEXT' structure specifying the parameters of
--     the marker to insert.
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkCommandBuffer' handle
--
-- -   @pMarkerInfo@ /must/ be a valid pointer to a valid
--     'VkDebugMarkerMarkerInfoEXT' structure
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.C.Core10.CommandPool.VkCommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics, or
--     compute operations
--
-- == Host Synchronization
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
-- 'VkDebugMarkerMarkerInfoEXT'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdDebugMarkerInsertEXT" vkCmdDebugMarkerInsertEXT :: ("commandBuffer" ::: VkCommandBuffer) -> ("pMarkerInfo" ::: Ptr VkDebugMarkerMarkerInfoEXT) -> IO ()
#else
vkCmdDebugMarkerInsertEXT :: DeviceCmds -> ("commandBuffer" ::: VkCommandBuffer) -> ("pMarkerInfo" ::: Ptr VkDebugMarkerMarkerInfoEXT) -> IO ()
vkCmdDebugMarkerInsertEXT deviceCmds = mkVkCmdDebugMarkerInsertEXT (pVkCmdDebugMarkerInsertEXT deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdDebugMarkerInsertEXT
  :: FunPtr (("commandBuffer" ::: VkCommandBuffer) -> ("pMarkerInfo" ::: Ptr VkDebugMarkerMarkerInfoEXT) -> IO ()) -> (("commandBuffer" ::: VkCommandBuffer) -> ("pMarkerInfo" ::: Ptr VkDebugMarkerMarkerInfoEXT) -> IO ())
#endif

type FN_vkCmdDebugMarkerInsertEXT = ("commandBuffer" ::: VkCommandBuffer) -> ("pMarkerInfo" ::: Ptr VkDebugMarkerMarkerInfoEXT) -> IO ()
type PFN_vkCmdDebugMarkerInsertEXT = FunPtr FN_vkCmdDebugMarkerInsertEXT

-- | vkDebugMarkerSetObjectNameEXT - Give a user-friendly name to an object
--
-- = Parameters
--
-- -   @device@ is the device that created the object.
--
-- -   @pNameInfo@ is a pointer to an instance of the
--     'VkDebugMarkerObjectNameInfoEXT' structure specifying the parameters
--     of the name to set on the object.
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' handle
--
-- -   @pNameInfo@ /must/ be a valid pointer to a valid
--     'VkDebugMarkerObjectNameInfoEXT' structure
--
-- == Host Synchronization
--
-- -   Host access to @pNameInfo.object@ /must/ be externally synchronized
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
-- 'VkDebugMarkerObjectNameInfoEXT',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkDebugMarkerSetObjectNameEXT" vkDebugMarkerSetObjectNameEXT :: ("device" ::: VkDevice) -> ("pNameInfo" ::: Ptr VkDebugMarkerObjectNameInfoEXT) -> IO VkResult
#else
vkDebugMarkerSetObjectNameEXT :: DeviceCmds -> ("device" ::: VkDevice) -> ("pNameInfo" ::: Ptr VkDebugMarkerObjectNameInfoEXT) -> IO VkResult
vkDebugMarkerSetObjectNameEXT deviceCmds = mkVkDebugMarkerSetObjectNameEXT (pVkDebugMarkerSetObjectNameEXT deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkDebugMarkerSetObjectNameEXT
  :: FunPtr (("device" ::: VkDevice) -> ("pNameInfo" ::: Ptr VkDebugMarkerObjectNameInfoEXT) -> IO VkResult) -> (("device" ::: VkDevice) -> ("pNameInfo" ::: Ptr VkDebugMarkerObjectNameInfoEXT) -> IO VkResult)
#endif

type FN_vkDebugMarkerSetObjectNameEXT = ("device" ::: VkDevice) -> ("pNameInfo" ::: Ptr VkDebugMarkerObjectNameInfoEXT) -> IO VkResult
type PFN_vkDebugMarkerSetObjectNameEXT = FunPtr FN_vkDebugMarkerSetObjectNameEXT

-- | vkDebugMarkerSetObjectTagEXT - Attach arbitrary data to an object
--
-- = Parameters
--
-- -   @device@ is the device that created the object.
--
-- -   @pTagInfo@ is a pointer to an instance of the
--     'VkDebugMarkerObjectTagInfoEXT' structure specifying the parameters
--     of the tag to attach to the object.
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' handle
--
-- -   @pTagInfo@ /must/ be a valid pointer to a valid
--     'VkDebugMarkerObjectTagInfoEXT' structure
--
-- == Host Synchronization
--
-- -   Host access to @pTagInfo.object@ /must/ be externally synchronized
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
-- 'VkDebugMarkerObjectTagInfoEXT',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkDebugMarkerSetObjectTagEXT" vkDebugMarkerSetObjectTagEXT :: ("device" ::: VkDevice) -> ("pTagInfo" ::: Ptr VkDebugMarkerObjectTagInfoEXT) -> IO VkResult
#else
vkDebugMarkerSetObjectTagEXT :: DeviceCmds -> ("device" ::: VkDevice) -> ("pTagInfo" ::: Ptr VkDebugMarkerObjectTagInfoEXT) -> IO VkResult
vkDebugMarkerSetObjectTagEXT deviceCmds = mkVkDebugMarkerSetObjectTagEXT (pVkDebugMarkerSetObjectTagEXT deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkDebugMarkerSetObjectTagEXT
  :: FunPtr (("device" ::: VkDevice) -> ("pTagInfo" ::: Ptr VkDebugMarkerObjectTagInfoEXT) -> IO VkResult) -> (("device" ::: VkDevice) -> ("pTagInfo" ::: Ptr VkDebugMarkerObjectTagInfoEXT) -> IO VkResult)
#endif

type FN_vkDebugMarkerSetObjectTagEXT = ("device" ::: VkDevice) -> ("pTagInfo" ::: Ptr VkDebugMarkerObjectTagInfoEXT) -> IO VkResult
type PFN_vkDebugMarkerSetObjectTagEXT = FunPtr FN_vkDebugMarkerSetObjectTagEXT

-- No documentation found for TopLevel "VK_EXT_DEBUG_MARKER_EXTENSION_NAME"
pattern VK_EXT_DEBUG_MARKER_EXTENSION_NAME :: (Eq a, IsString a) => a
pattern VK_EXT_DEBUG_MARKER_EXTENSION_NAME = "VK_EXT_debug_marker"

-- No documentation found for TopLevel "VK_EXT_DEBUG_MARKER_SPEC_VERSION"
pattern VK_EXT_DEBUG_MARKER_SPEC_VERSION :: Integral a => a
pattern VK_EXT_DEBUG_MARKER_SPEC_VERSION = 4

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_DEBUG_MARKER_MARKER_INFO_EXT"
pattern VK_STRUCTURE_TYPE_DEBUG_MARKER_MARKER_INFO_EXT :: VkStructureType
pattern VK_STRUCTURE_TYPE_DEBUG_MARKER_MARKER_INFO_EXT = VkStructureType 1000022002

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_NAME_INFO_EXT"
pattern VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_NAME_INFO_EXT :: VkStructureType
pattern VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_NAME_INFO_EXT = VkStructureType 1000022000

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_TAG_INFO_EXT"
pattern VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_TAG_INFO_EXT :: VkStructureType
pattern VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_TAG_INFO_EXT = VkStructureType 1000022001
