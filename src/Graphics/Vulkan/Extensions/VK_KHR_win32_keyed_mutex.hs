{-# language Strict #-}
{-# language CPP #-}
{-# language PatternSynonyms #-}
{-# language DuplicateRecordFields #-}

module Graphics.Vulkan.Extensions.VK_KHR_win32_keyed_mutex
  ( withCStructWin32KeyedMutexAcquireReleaseInfoKHR
  , fromCStructWin32KeyedMutexAcquireReleaseInfoKHR
  , Win32KeyedMutexAcquireReleaseInfoKHR(..)
  , pattern KHR_WIN32_KEYED_MUTEX_EXTENSION_NAME
  , pattern KHR_WIN32_KEYED_MUTEX_SPEC_VERSION
  , pattern STRUCTURE_TYPE_WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_KHR
  ) where

import Data.Function
  ( (&)
  )
import Data.List
  ( minimum
  )
import Data.String
  ( IsString
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
  , Word64
  )
import Foreign.Marshal.Utils
  ( maybePeek
  , maybeWith
  )
import Foreign.Ptr
  ( castPtr
  )
import Foreign.Storable
  ( peekElemOff
  )


import Graphics.Vulkan.C.Core10.Core
  ( Zero(..)
  )
import Graphics.Vulkan.C.Extensions.VK_KHR_win32_keyed_mutex
  ( VkWin32KeyedMutexAcquireReleaseInfoKHR(..)
  , pattern VK_KHR_WIN32_KEYED_MUTEX_EXTENSION_NAME
  , pattern VK_KHR_WIN32_KEYED_MUTEX_SPEC_VERSION
  , pattern VK_STRUCTURE_TYPE_WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_KHR
  )
import Graphics.Vulkan.Core10.Memory
  ( DeviceMemory
  )
import Graphics.Vulkan.Marshal.Utils
  ( withVec
  )
import {-# source #-} Graphics.Vulkan.Marshal.SomeVkStruct
  ( SomeVkStruct
  , peekVkStruct
  , withSomeVkStruct
  )
import Graphics.Vulkan.Core10.Core
  ( pattern STRUCTURE_TYPE_WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_KHR
  )



-- | VkWin32KeyedMutexAcquireReleaseInfoKHR - Use the Windows keyed mutex
-- mechanism to synchronize work
--
-- == Valid Usage
--
-- -   Each member of @pAcquireSyncs@ and @pReleaseSyncs@ /must/ be a
--     device memory object imported by setting
--     'Graphics.Vulkan.C.Extensions.VK_KHR_external_memory_win32.VkImportMemoryWin32HandleInfoKHR'::@handleType@
--     to
--     'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_external_memory_capabilities.VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT'
--     or
--     'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_external_memory_capabilities.VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT'.
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.C.Extensions.VK_KHR_win32_keyed_mutex.VK_STRUCTURE_TYPE_WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_KHR'
--
-- -   If @acquireCount@ is not @0@, @pAcquireSyncs@ /must/ be a valid
--     pointer to an array of @acquireCount@ valid
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' handles
--
-- -   If @acquireCount@ is not @0@, @pAcquireKeys@ /must/ be a valid
--     pointer to an array of @acquireCount@ @uint64_t@ values
--
-- -   If @acquireCount@ is not @0@, @pAcquireTimeouts@ /must/ be a valid
--     pointer to an array of @acquireCount@ @uint32_t@ values
--
-- -   If @releaseCount@ is not @0@, @pReleaseSyncs@ /must/ be a valid
--     pointer to an array of @releaseCount@ valid
--     'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory' handles
--
-- -   If @releaseCount@ is not @0@, @pReleaseKeys@ /must/ be a valid
--     pointer to an array of @releaseCount@ @uint64_t@ values
--
-- -   Both of the elements of @pAcquireSyncs@, and the elements of
--     @pReleaseSyncs@ that are valid handles /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice'
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Memory.VkDeviceMemory',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType'
data Win32KeyedMutexAcquireReleaseInfoKHR = Win32KeyedMutexAcquireReleaseInfoKHR
  { -- Univalued member elided
  -- No documentation found for Nested "Win32KeyedMutexAcquireReleaseInfoKHR" "pNext"
  next :: Maybe SomeVkStruct
  -- Length valued member elided
  , -- No documentation found for Nested "Win32KeyedMutexAcquireReleaseInfoKHR" "pAcquireSyncs"
  acquireSyncs :: Vector DeviceMemory
  , -- No documentation found for Nested "Win32KeyedMutexAcquireReleaseInfoKHR" "pAcquireKeys"
  acquireKeys :: Vector Word64
  , -- No documentation found for Nested "Win32KeyedMutexAcquireReleaseInfoKHR" "pAcquireTimeouts"
  acquireTimeouts :: Vector Word32
  -- Length valued member elided
  , -- No documentation found for Nested "Win32KeyedMutexAcquireReleaseInfoKHR" "pReleaseSyncs"
  releaseSyncs :: Vector DeviceMemory
  , -- No documentation found for Nested "Win32KeyedMutexAcquireReleaseInfoKHR" "pReleaseKeys"
  releaseKeys :: Vector Word64
  }
  deriving (Show, Eq)

-- | A function to temporarily allocate memory for a 'VkWin32KeyedMutexAcquireReleaseInfoKHR' and
-- marshal a 'Win32KeyedMutexAcquireReleaseInfoKHR' into it. The 'VkWin32KeyedMutexAcquireReleaseInfoKHR' is only valid inside
-- the provided computation and must not be returned out of it.
withCStructWin32KeyedMutexAcquireReleaseInfoKHR :: Win32KeyedMutexAcquireReleaseInfoKHR -> (VkWin32KeyedMutexAcquireReleaseInfoKHR -> IO a) -> IO a
withCStructWin32KeyedMutexAcquireReleaseInfoKHR marshalled cont = withVec (&) (releaseKeys (marshalled :: Win32KeyedMutexAcquireReleaseInfoKHR)) (\pPReleaseKeys -> withVec (&) (releaseSyncs (marshalled :: Win32KeyedMutexAcquireReleaseInfoKHR)) (\pPReleaseSyncs -> withVec (&) (acquireTimeouts (marshalled :: Win32KeyedMutexAcquireReleaseInfoKHR)) (\pPAcquireTimeouts -> withVec (&) (acquireKeys (marshalled :: Win32KeyedMutexAcquireReleaseInfoKHR)) (\pPAcquireKeys -> withVec (&) (acquireSyncs (marshalled :: Win32KeyedMutexAcquireReleaseInfoKHR)) (\pPAcquireSyncs -> maybeWith withSomeVkStruct (next (marshalled :: Win32KeyedMutexAcquireReleaseInfoKHR)) (\pPNext -> cont (VkWin32KeyedMutexAcquireReleaseInfoKHR VK_STRUCTURE_TYPE_WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_KHR pPNext (fromIntegral (minimum ([Data.Vector.length (acquireSyncs (marshalled :: Win32KeyedMutexAcquireReleaseInfoKHR)), Data.Vector.length (acquireKeys (marshalled :: Win32KeyedMutexAcquireReleaseInfoKHR)), Data.Vector.length (acquireTimeouts (marshalled :: Win32KeyedMutexAcquireReleaseInfoKHR))]))) pPAcquireSyncs pPAcquireKeys pPAcquireTimeouts (fromIntegral (minimum ([Data.Vector.length (releaseSyncs (marshalled :: Win32KeyedMutexAcquireReleaseInfoKHR)), Data.Vector.length (releaseKeys (marshalled :: Win32KeyedMutexAcquireReleaseInfoKHR))]))) pPReleaseSyncs pPReleaseKeys)))))))

-- | A function to read a 'VkWin32KeyedMutexAcquireReleaseInfoKHR' and all additional
-- structures in the pointer chain into a 'Win32KeyedMutexAcquireReleaseInfoKHR'.
fromCStructWin32KeyedMutexAcquireReleaseInfoKHR :: VkWin32KeyedMutexAcquireReleaseInfoKHR -> IO Win32KeyedMutexAcquireReleaseInfoKHR
fromCStructWin32KeyedMutexAcquireReleaseInfoKHR c = Win32KeyedMutexAcquireReleaseInfoKHR <$> -- Univalued Member elided
                                                                                         maybePeek peekVkStruct (castPtr (vkPNext (c :: VkWin32KeyedMutexAcquireReleaseInfoKHR)))
                                                                                         -- Length valued member elided
                                                                                         <*> (Data.Vector.generateM (fromIntegral (vkAcquireCount (c :: VkWin32KeyedMutexAcquireReleaseInfoKHR))) (peekElemOff (vkPAcquireSyncs (c :: VkWin32KeyedMutexAcquireReleaseInfoKHR))))
                                                                                         <*> (Data.Vector.generateM (fromIntegral (vkAcquireCount (c :: VkWin32KeyedMutexAcquireReleaseInfoKHR))) (peekElemOff (vkPAcquireKeys (c :: VkWin32KeyedMutexAcquireReleaseInfoKHR))))
                                                                                         <*> (Data.Vector.generateM (fromIntegral (vkAcquireCount (c :: VkWin32KeyedMutexAcquireReleaseInfoKHR))) (peekElemOff (vkPAcquireTimeouts (c :: VkWin32KeyedMutexAcquireReleaseInfoKHR))))
                                                                                         -- Length valued member elided
                                                                                         <*> (Data.Vector.generateM (fromIntegral (vkReleaseCount (c :: VkWin32KeyedMutexAcquireReleaseInfoKHR))) (peekElemOff (vkPReleaseSyncs (c :: VkWin32KeyedMutexAcquireReleaseInfoKHR))))
                                                                                         <*> (Data.Vector.generateM (fromIntegral (vkReleaseCount (c :: VkWin32KeyedMutexAcquireReleaseInfoKHR))) (peekElemOff (vkPReleaseKeys (c :: VkWin32KeyedMutexAcquireReleaseInfoKHR))))

instance Zero Win32KeyedMutexAcquireReleaseInfoKHR where
  zero = Win32KeyedMutexAcquireReleaseInfoKHR Nothing
                                              Data.Vector.empty
                                              Data.Vector.empty
                                              Data.Vector.empty
                                              Data.Vector.empty
                                              Data.Vector.empty


-- No documentation found for TopLevel "VK_KHR_WIN32_KEYED_MUTEX_EXTENSION_NAME"
pattern KHR_WIN32_KEYED_MUTEX_EXTENSION_NAME :: (Eq a, IsString a) => a
pattern KHR_WIN32_KEYED_MUTEX_EXTENSION_NAME = VK_KHR_WIN32_KEYED_MUTEX_EXTENSION_NAME

-- No documentation found for TopLevel "VK_KHR_WIN32_KEYED_MUTEX_SPEC_VERSION"
pattern KHR_WIN32_KEYED_MUTEX_SPEC_VERSION :: Integral a => a
pattern KHR_WIN32_KEYED_MUTEX_SPEC_VERSION = VK_KHR_WIN32_KEYED_MUTEX_SPEC_VERSION
