{-# language Strict #-}
{-# language CPP #-}
{-# language DuplicateRecordFields #-}
{-# language GeneralizedNewtypeDeriving #-}
{-# language PatternSynonyms #-}
{-# language OverloadedStrings #-}

module Graphics.Vulkan.C.Extensions.VK_EXT_depth_clip_enable
  ( VkPhysicalDeviceDepthClipEnableFeaturesEXT(..)
  , VkPipelineRasterizationDepthClipStateCreateFlagsEXT(..)
  , VkPipelineRasterizationDepthClipStateCreateInfoEXT(..)
  , pattern VK_EXT_DEPTH_CLIP_ENABLE_EXTENSION_NAME
  , pattern VK_EXT_DEPTH_CLIP_ENABLE_SPEC_VERSION
  , pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_ENABLE_FEATURES_EXT
  , pattern VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_DEPTH_CLIP_STATE_CREATE_INFO_EXT
  ) where

import Data.Bits
  ( Bits
  , FiniteBits
  )
import Data.String
  ( IsString
  )
import Foreign.Ptr
  ( Ptr
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
  ( VkBool32(..)
  , VkStructureType(..)
  , Zero(..)
  , VkFlags
  )


-- | VkPhysicalDeviceDepthClipEnableFeaturesEXT - Structure indicating
-- support for explicit enable of depth clip
--
-- = Members
--
-- The members of the 'VkPhysicalDeviceDepthClipEnableFeaturesEXT'
-- structure describe the following features:
--
-- = Description
--
-- If the 'VkPhysicalDeviceDepthClipEnableFeaturesEXT' structure is
-- included in the @pNext@ chain of
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_get_physical_device_properties2.VkPhysicalDeviceFeatures2KHR',
-- it is filled with values indicating whether the feature is supported.
-- 'VkPhysicalDeviceDepthClipEnableFeaturesEXT' /can/ also be used in the
-- @pNext@ chain of 'Graphics.Vulkan.C.Core10.Device.VkDeviceCreateInfo' to
-- enable this feature.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Core.VkBool32',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType'
data VkPhysicalDeviceDepthClipEnableFeaturesEXT = VkPhysicalDeviceDepthClipEnableFeaturesEXT
  { -- | @sType@ /must/ be
  -- 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_ENABLE_FEATURES_EXT'
  vkSType :: VkStructureType
  , -- No documentation found for Nested "VkPhysicalDeviceDepthClipEnableFeaturesEXT" "pNext"
  vkPNext :: Ptr ()
  , -- | @depthClipEnable@ indicates that the implementation supports setting the
  -- depth clipping operation explicitly via the
  -- 'VkPipelineRasterizationDepthClipStateCreateInfoEXT' pipeline state.
  -- Otherwise depth clipping is only enabled when
  -- 'Graphics.Vulkan.C.Core10.Pipeline.VkPipelineRasterizationStateCreateInfo'::@depthClampEnable@
  -- is set to 'Graphics.Vulkan.C.Core10.Core.VK_FALSE'.
  vkDepthClipEnable :: VkBool32
  }
  deriving (Eq, Show)

instance Storable VkPhysicalDeviceDepthClipEnableFeaturesEXT where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkPhysicalDeviceDepthClipEnableFeaturesEXT <$> peek (ptr `plusPtr` 0)
                                                        <*> peek (ptr `plusPtr` 8)
                                                        <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkPhysicalDeviceDepthClipEnableFeaturesEXT))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkPhysicalDeviceDepthClipEnableFeaturesEXT))
                *> poke (ptr `plusPtr` 16) (vkDepthClipEnable (poked :: VkPhysicalDeviceDepthClipEnableFeaturesEXT))

instance Zero VkPhysicalDeviceDepthClipEnableFeaturesEXT where
  zero = VkPhysicalDeviceDepthClipEnableFeaturesEXT VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_ENABLE_FEATURES_EXT
                                                    zero
                                                    zero

-- ** VkPipelineRasterizationDepthClipStateCreateFlagsEXT

-- | VkPipelineRasterizationDepthClipStateCreateFlagsEXT - Reserved for
-- future use
--
-- = Description
--
-- 'VkPipelineRasterizationDepthClipStateCreateFlagsEXT' is a bitmask type
-- for setting a mask, but is currently reserved for future use.
--
-- = See Also
--
-- 'VkPipelineRasterizationDepthClipStateCreateInfoEXT'
newtype VkPipelineRasterizationDepthClipStateCreateFlagsEXT = VkPipelineRasterizationDepthClipStateCreateFlagsEXT VkFlags
  deriving (Eq, Ord, Storable, Bits, FiniteBits, Zero)

instance Show VkPipelineRasterizationDepthClipStateCreateFlagsEXT where
  
  showsPrec p (VkPipelineRasterizationDepthClipStateCreateFlagsEXT x) = showParen (p >= 11) (showString "VkPipelineRasterizationDepthClipStateCreateFlagsEXT " . showsPrec 11 x)

instance Read VkPipelineRasterizationDepthClipStateCreateFlagsEXT where
  readPrec = parens ( choose [ 
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkPipelineRasterizationDepthClipStateCreateFlagsEXT")
                        v <- step readPrec
                        pure (VkPipelineRasterizationDepthClipStateCreateFlagsEXT v)
                        )
                    )



-- | VkPipelineRasterizationDepthClipStateCreateInfoEXT - Structure
-- specifying depth clipping state
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Core.VkBool32',
-- 'VkPipelineRasterizationDepthClipStateCreateFlagsEXT',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType'
data VkPipelineRasterizationDepthClipStateCreateInfoEXT = VkPipelineRasterizationDepthClipStateCreateInfoEXT
  { -- | @sType@ /must/ be
  -- 'VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_DEPTH_CLIP_STATE_CREATE_INFO_EXT'
  vkSType :: VkStructureType
  , -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
  vkPNext :: Ptr ()
  , -- | @flags@ /must/ be @0@
  vkFlags :: VkPipelineRasterizationDepthClipStateCreateFlagsEXT
  , -- | @depthClipEnable@ controls whether depth clipping is enabled as
  -- described in
  -- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#vertexpostproc-clipping Primitive Clipping>.
  vkDepthClipEnable :: VkBool32
  }
  deriving (Eq, Show)

instance Storable VkPipelineRasterizationDepthClipStateCreateInfoEXT where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkPipelineRasterizationDepthClipStateCreateInfoEXT <$> peek (ptr `plusPtr` 0)
                                                                <*> peek (ptr `plusPtr` 8)
                                                                <*> peek (ptr `plusPtr` 16)
                                                                <*> peek (ptr `plusPtr` 20)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkPipelineRasterizationDepthClipStateCreateInfoEXT))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkPipelineRasterizationDepthClipStateCreateInfoEXT))
                *> poke (ptr `plusPtr` 16) (vkFlags (poked :: VkPipelineRasterizationDepthClipStateCreateInfoEXT))
                *> poke (ptr `plusPtr` 20) (vkDepthClipEnable (poked :: VkPipelineRasterizationDepthClipStateCreateInfoEXT))

instance Zero VkPipelineRasterizationDepthClipStateCreateInfoEXT where
  zero = VkPipelineRasterizationDepthClipStateCreateInfoEXT VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_DEPTH_CLIP_STATE_CREATE_INFO_EXT
                                                            zero
                                                            zero
                                                            zero

-- No documentation found for TopLevel "VK_EXT_DEPTH_CLIP_ENABLE_EXTENSION_NAME"
pattern VK_EXT_DEPTH_CLIP_ENABLE_EXTENSION_NAME :: (Eq a, IsString a) => a
pattern VK_EXT_DEPTH_CLIP_ENABLE_EXTENSION_NAME = "VK_EXT_depth_clip_enable"

-- No documentation found for TopLevel "VK_EXT_DEPTH_CLIP_ENABLE_SPEC_VERSION"
pattern VK_EXT_DEPTH_CLIP_ENABLE_SPEC_VERSION :: Integral a => a
pattern VK_EXT_DEPTH_CLIP_ENABLE_SPEC_VERSION = 1

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_ENABLE_FEATURES_EXT"
pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_ENABLE_FEATURES_EXT :: VkStructureType
pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_ENABLE_FEATURES_EXT = VkStructureType 1000102000

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_DEPTH_CLIP_STATE_CREATE_INFO_EXT"
pattern VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_DEPTH_CLIP_STATE_CREATE_INFO_EXT :: VkStructureType
pattern VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_DEPTH_CLIP_STATE_CREATE_INFO_EXT = VkStructureType 1000102001
