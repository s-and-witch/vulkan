{-# language Strict #-}
{-# language CPP #-}
{-# language GeneralizedNewtypeDeriving #-}
{-# language PatternSynonyms #-}
{-# language DuplicateRecordFields #-}
{-# language DataKinds #-}
{-# language TypeOperators #-}

module Graphics.Vulkan.C.Core10.Shader
  ( VkShaderModule
  , VkShaderModuleCreateFlags(..)
  , VkShaderModuleCreateInfo(..)
  , FN_vkCreateShaderModule
  , PFN_vkCreateShaderModule
  , vkCreateShaderModule
  , FN_vkDestroyShaderModule
  , PFN_vkDestroyShaderModule
  , vkDestroyShaderModule
  ) where

import Data.Bits
  ( Bits
  , FiniteBits
  )
import Data.Word
  ( Word32
  )
import Foreign.C.Types
  ( CSize(..)
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
  , pattern VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO
  )
import Graphics.Vulkan.C.Core10.DeviceInitialization
  ( VkAllocationCallbacks(..)
  , VkDevice
  )
import Graphics.Vulkan.C.Dynamic
  ( DeviceCmds(..)
  )
import Graphics.Vulkan.NamedType
  ( (:::)
  )


-- | Dummy data to tag the 'Ptr' with
data VkShaderModule_T
-- | VkShaderModule - Opaque handle to a shader module object
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineShaderStageCreateInfo',
-- 'vkCreateShaderModule', 'vkDestroyShaderModule'
type VkShaderModule = Ptr VkShaderModule_T

-- ** VkShaderModuleCreateFlags

-- | VkShaderModuleCreateFlags - Reserved for future use
--
-- = Description
--
-- 'VkShaderModuleCreateFlags' is a bitmask type for setting a mask, but is
-- currently reserved for future use.
--
-- = See Also
--
-- 'VkShaderModuleCreateInfo'
newtype VkShaderModuleCreateFlags = VkShaderModuleCreateFlags VkFlags
  deriving (Eq, Ord, Storable, Bits, FiniteBits, Zero)

instance Show VkShaderModuleCreateFlags where
  
  showsPrec p (VkShaderModuleCreateFlags x) = showParen (p >= 11) (showString "VkShaderModuleCreateFlags " . showsPrec 11 x)

instance Read VkShaderModuleCreateFlags where
  readPrec = parens ( choose [ 
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkShaderModuleCreateFlags")
                        v <- step readPrec
                        pure (VkShaderModuleCreateFlags v)
                        )
                    )



-- | VkShaderModuleCreateInfo - Structure specifying parameters of a newly
-- created shader module
--
-- == Valid Usage
--
-- -   @codeSize@ /must/ be greater than 0
--
-- -   @codeSize@ /must/ be a multiple of 4
--
-- -   @pCode@ /must/ point to valid SPIR-V code, formatted and packed as
--     described by the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#spirv-spec Khronos SPIR-V Specification>
--
-- -   @pCode@ /must/ adhere to the validation rules described by the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#spirvenv-module-validation Validation Rules within a Module>
--     section of the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#spirvenv-capabilities SPIR-V Environment>
--     appendix
--
-- -   @pCode@ /must/ declare the @Shader@ capability for SPIR-V code
--
-- -   @pCode@ /must/ not declare any capability that is not supported by
--     the API, as described by the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#spirvenv-module-validation Capabilities>
--     section of the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#spirvenv-capabilities SPIR-V Environment>
--     appendix
--
-- -   If @pCode@ declares any of the capabilities listed as /optional/ in
--     the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#spirvenv-capabilities-table SPIR-V Environment>
--     appendix, the corresponding feature(s) /must/ be enabled.
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.C.Core10.Core.VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO'
--
-- -   @pNext@ /must/ be @NULL@ or a pointer to a valid instance of
--     'Graphics.Vulkan.C.Extensions.VK_EXT_validation_cache.VkShaderModuleValidationCacheCreateInfoEXT'
--
-- -   @flags@ /must/ be @0@
--
-- -   @pCode@ /must/ be a valid pointer to an array of
--     \(\textrm{codeSize} \over 4\) @uint32_t@ values
--
-- = See Also
--
-- 'VkShaderModuleCreateFlags',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType', 'vkCreateShaderModule'
data VkShaderModuleCreateInfo = VkShaderModuleCreateInfo
  { -- | @sType@ is the type of this structure.
  vkSType :: VkStructureType
  , -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
  vkPNext :: Ptr ()
  , -- | @flags@ is reserved for future use.
  vkFlags :: VkShaderModuleCreateFlags
  , -- | @codeSize@ is the size, in bytes, of the code pointed to by @pCode@.
  vkCodeSize :: CSize
  , -- | @pCode@ points to code that is used to create the shader module. The
  -- type and format of the code is determined from the content of the memory
  -- addressed by @pCode@.
  vkPCode :: Ptr Word32
  }
  deriving (Eq, Show)

instance Storable VkShaderModuleCreateInfo where
  sizeOf ~_ = 40
  alignment ~_ = 8
  peek ptr = VkShaderModuleCreateInfo <$> peek (ptr `plusPtr` 0)
                                      <*> peek (ptr `plusPtr` 8)
                                      <*> peek (ptr `plusPtr` 16)
                                      <*> peek (ptr `plusPtr` 24)
                                      <*> peek (ptr `plusPtr` 32)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkShaderModuleCreateInfo))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkShaderModuleCreateInfo))
                *> poke (ptr `plusPtr` 16) (vkFlags (poked :: VkShaderModuleCreateInfo))
                *> poke (ptr `plusPtr` 24) (vkCodeSize (poked :: VkShaderModuleCreateInfo))
                *> poke (ptr `plusPtr` 32) (vkPCode (poked :: VkShaderModuleCreateInfo))

instance Zero VkShaderModuleCreateInfo where
  zero = VkShaderModuleCreateInfo VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO
                                  zero
                                  zero
                                  zero
                                  zero

-- | vkCreateShaderModule - Creates a new shader module object
--
-- = Parameters
--
-- -   @device@ is the logical device that creates the shader module.
--
-- -   @pCreateInfo@ is a pointer to an instance of the
--     'VkShaderModuleCreateInfo' structure.
--
-- -   @pAllocator@ controls host memory allocation as described in the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#memory-allocation Memory Allocation>
--     chapter.
--
-- -   @pShaderModule@ points to a 'VkShaderModule' handle in which the
--     resulting shader module object is returned.
--
-- = Description
--
-- Once a shader module has been created, any entry points it contains
-- /can/ be used in pipeline shader stages as described in
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#pipelines-compute Compute Pipelines>
-- and
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#pipelines-graphics Graphics Pipelines>.
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' handle
--
-- -   @pCreateInfo@ /must/ be a valid pointer to a valid
--     'VkShaderModuleCreateInfo' structure
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     structure
--
-- -   @pShaderModule@ /must/ be a valid pointer to a 'VkShaderModule'
--     handle
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
--     -   'Graphics.Vulkan.C.Extensions.VK_NV_glsl_shader.VK_ERROR_INVALID_SHADER_NV'
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice',
-- 'VkShaderModule', 'VkShaderModuleCreateInfo'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCreateShaderModule" vkCreateShaderModule :: ("device" ::: VkDevice) -> ("pCreateInfo" ::: Ptr VkShaderModuleCreateInfo) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pShaderModule" ::: Ptr VkShaderModule) -> IO VkResult
#else
vkCreateShaderModule :: DeviceCmds -> ("device" ::: VkDevice) -> ("pCreateInfo" ::: Ptr VkShaderModuleCreateInfo) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pShaderModule" ::: Ptr VkShaderModule) -> IO VkResult
vkCreateShaderModule deviceCmds = mkVkCreateShaderModule (pVkCreateShaderModule deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCreateShaderModule
  :: FunPtr (("device" ::: VkDevice) -> ("pCreateInfo" ::: Ptr VkShaderModuleCreateInfo) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pShaderModule" ::: Ptr VkShaderModule) -> IO VkResult) -> (("device" ::: VkDevice) -> ("pCreateInfo" ::: Ptr VkShaderModuleCreateInfo) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pShaderModule" ::: Ptr VkShaderModule) -> IO VkResult)
#endif

type FN_vkCreateShaderModule = ("device" ::: VkDevice) -> ("pCreateInfo" ::: Ptr VkShaderModuleCreateInfo) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pShaderModule" ::: Ptr VkShaderModule) -> IO VkResult
type PFN_vkCreateShaderModule = FunPtr FN_vkCreateShaderModule

-- | vkDestroyShaderModule - Destroy a shader module
--
-- = Parameters
--
-- -   @device@ is the logical device that destroys the shader module.
--
-- -   @shaderModule@ is the handle of the shader module to destroy.
--
-- -   @pAllocator@ controls host memory allocation as described in the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#memory-allocation Memory Allocation>
--     chapter.
--
-- = Description
--
-- A shader module /can/ be destroyed while pipelines created using its
-- shaders are still in use.
--
-- == Valid Usage
--
-- -   If
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     were provided when @shaderModule@ was created, a compatible set of
--     callbacks /must/ be provided here
--
-- -   If no
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     were provided when @shaderModule@ was created, @pAllocator@ /must/
--     be @NULL@
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' handle
--
-- -   If @shaderModule@ is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE', @shaderModule@
--     /must/ be a valid 'VkShaderModule' handle
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     structure
--
-- -   If @shaderModule@ is a valid handle, it /must/ have been created,
--     allocated, or retrieved from @device@
--
-- == Host Synchronization
--
-- -   Host access to @shaderModule@ /must/ be externally synchronized
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice',
-- 'VkShaderModule'
#if defined(EXPOSE_CORE10_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkDestroyShaderModule" vkDestroyShaderModule :: ("device" ::: VkDevice) -> ("shaderModule" ::: VkShaderModule) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()
#else
vkDestroyShaderModule :: DeviceCmds -> ("device" ::: VkDevice) -> ("shaderModule" ::: VkShaderModule) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()
vkDestroyShaderModule deviceCmds = mkVkDestroyShaderModule (pVkDestroyShaderModule deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkDestroyShaderModule
  :: FunPtr (("device" ::: VkDevice) -> ("shaderModule" ::: VkShaderModule) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()) -> (("device" ::: VkDevice) -> ("shaderModule" ::: VkShaderModule) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ())
#endif

type FN_vkDestroyShaderModule = ("device" ::: VkDevice) -> ("shaderModule" ::: VkShaderModule) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()
type PFN_vkDestroyShaderModule = FunPtr FN_vkDestroyShaderModule
