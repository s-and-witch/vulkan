{-# language Strict #-}
{-# language CPP #-}
{-# language PatternSynonyms #-}

module Graphics.Vulkan.Extensions.VK_IMG_format_pvrtc
  ( pattern IMG_FORMAT_PVRTC_EXTENSION_NAME
  , pattern IMG_FORMAT_PVRTC_SPEC_VERSION
  , pattern FORMAT_PVRTC1_2BPP_UNORM_BLOCK_IMG
  , pattern FORMAT_PVRTC1_4BPP_UNORM_BLOCK_IMG
  , pattern FORMAT_PVRTC2_2BPP_UNORM_BLOCK_IMG
  , pattern FORMAT_PVRTC2_4BPP_UNORM_BLOCK_IMG
  , pattern FORMAT_PVRTC1_2BPP_SRGB_BLOCK_IMG
  , pattern FORMAT_PVRTC1_4BPP_SRGB_BLOCK_IMG
  , pattern FORMAT_PVRTC2_2BPP_SRGB_BLOCK_IMG
  , pattern FORMAT_PVRTC2_4BPP_SRGB_BLOCK_IMG
  ) where

import Data.String
  ( IsString
  )


import Graphics.Vulkan.C.Extensions.VK_IMG_format_pvrtc
  ( pattern VK_IMG_FORMAT_PVRTC_EXTENSION_NAME
  , pattern VK_IMG_FORMAT_PVRTC_SPEC_VERSION
  )
import Graphics.Vulkan.Core10.Core
  ( pattern FORMAT_PVRTC1_2BPP_SRGB_BLOCK_IMG
  , pattern FORMAT_PVRTC1_2BPP_UNORM_BLOCK_IMG
  , pattern FORMAT_PVRTC1_4BPP_SRGB_BLOCK_IMG
  , pattern FORMAT_PVRTC1_4BPP_UNORM_BLOCK_IMG
  , pattern FORMAT_PVRTC2_2BPP_SRGB_BLOCK_IMG
  , pattern FORMAT_PVRTC2_2BPP_UNORM_BLOCK_IMG
  , pattern FORMAT_PVRTC2_4BPP_SRGB_BLOCK_IMG
  , pattern FORMAT_PVRTC2_4BPP_UNORM_BLOCK_IMG
  )


-- No documentation found for TopLevel "VK_IMG_FORMAT_PVRTC_EXTENSION_NAME"
pattern IMG_FORMAT_PVRTC_EXTENSION_NAME :: (Eq a, IsString a) => a
pattern IMG_FORMAT_PVRTC_EXTENSION_NAME = VK_IMG_FORMAT_PVRTC_EXTENSION_NAME

-- No documentation found for TopLevel "VK_IMG_FORMAT_PVRTC_SPEC_VERSION"
pattern IMG_FORMAT_PVRTC_SPEC_VERSION :: Integral a => a
pattern IMG_FORMAT_PVRTC_SPEC_VERSION = VK_IMG_FORMAT_PVRTC_SPEC_VERSION
