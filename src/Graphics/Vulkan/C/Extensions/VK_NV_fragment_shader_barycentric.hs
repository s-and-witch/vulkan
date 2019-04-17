{-# language Strict #-}
{-# language CPP #-}
{-# language DuplicateRecordFields #-}
{-# language PatternSynonyms #-}
{-# language OverloadedStrings #-}

module Graphics.Vulkan.C.Extensions.VK_NV_fragment_shader_barycentric
  ( VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV(..)
  , pattern VK_NV_FRAGMENT_SHADER_BARYCENTRIC_EXTENSION_NAME
  , pattern VK_NV_FRAGMENT_SHADER_BARYCENTRIC_SPEC_VERSION
  , pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV
  ) where

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


import Graphics.Vulkan.C.Core10.Core
  ( VkBool32(..)
  , VkStructureType(..)
  , Zero(..)
  )


-- No documentation found for TopLevel "VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV"
data VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV = VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV
  { -- No documentation found for Nested "VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV" "sType"
  vkSType :: VkStructureType
  , -- No documentation found for Nested "VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV" "pNext"
  vkPNext :: Ptr ()
  , -- No documentation found for Nested "VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV" "fragmentShaderBarycentric"
  vkFragmentShaderBarycentric :: VkBool32
  }
  deriving (Eq, Show)

instance Storable VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV <$> peek (ptr `plusPtr` 0)
                                                                 <*> peek (ptr `plusPtr` 8)
                                                                 <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV))
                *> poke (ptr `plusPtr` 16) (vkFragmentShaderBarycentric (poked :: VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV))

instance Zero VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV where
  zero = VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV zero
                                                             zero
                                                             zero
-- No documentation found for TopLevel "VK_NV_FRAGMENT_SHADER_BARYCENTRIC_EXTENSION_NAME"
pattern VK_NV_FRAGMENT_SHADER_BARYCENTRIC_EXTENSION_NAME :: (Eq a ,IsString a) => a
pattern VK_NV_FRAGMENT_SHADER_BARYCENTRIC_EXTENSION_NAME = "VK_NV_fragment_shader_barycentric"
-- No documentation found for TopLevel "VK_NV_FRAGMENT_SHADER_BARYCENTRIC_SPEC_VERSION"
pattern VK_NV_FRAGMENT_SHADER_BARYCENTRIC_SPEC_VERSION :: Integral a => a
pattern VK_NV_FRAGMENT_SHADER_BARYCENTRIC_SPEC_VERSION = 1
-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV"
pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV :: VkStructureType
pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV = VkStructureType 1000203000
