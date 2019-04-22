{-# language Strict #-}
{-# language CPP #-}
{-# language PatternSynonyms #-}

module Graphics.Vulkan.Extensions.VK_EXT_swapchain_colorspace
  ( pattern EXT_SWAPCHAIN_COLOR_SPACE_EXTENSION_NAME
  , pattern EXT_SWAPCHAIN_COLOR_SPACE_SPEC_VERSION
  , pattern COLOR_SPACE_DISPLAY_P3_NONLINEAR_EXT
  , pattern COLOR_SPACE_EXTENDED_SRGB_LINEAR_EXT
  , pattern COLOR_SPACE_DCI_P3_LINEAR_EXT
  , pattern COLOR_SPACE_DCI_P3_NONLINEAR_EXT
  , pattern COLOR_SPACE_BT709_LINEAR_EXT
  , pattern COLOR_SPACE_BT709_NONLINEAR_EXT
  , pattern COLOR_SPACE_BT2020_LINEAR_EXT
  , pattern COLOR_SPACE_HDR10_ST2084_EXT
  , pattern COLOR_SPACE_DOLBYVISION_EXT
  , pattern COLOR_SPACE_HDR10_HLG_EXT
  , pattern COLOR_SPACE_ADOBERGB_LINEAR_EXT
  , pattern COLOR_SPACE_ADOBERGB_NONLINEAR_EXT
  , pattern COLOR_SPACE_PASS_THROUGH_EXT
  , pattern COLOR_SPACE_EXTENDED_SRGB_NONLINEAR_EXT
  ) where

import Data.String
  ( IsString
  )


import Graphics.Vulkan.C.Extensions.VK_EXT_swapchain_colorspace
  ( pattern VK_EXT_SWAPCHAIN_COLOR_SPACE_EXTENSION_NAME
  , pattern VK_EXT_SWAPCHAIN_COLOR_SPACE_SPEC_VERSION
  )
import Graphics.Vulkan.Extensions.VK_KHR_surface
  ( pattern COLOR_SPACE_ADOBERGB_LINEAR_EXT
  , pattern COLOR_SPACE_ADOBERGB_NONLINEAR_EXT
  , pattern COLOR_SPACE_BT2020_LINEAR_EXT
  , pattern COLOR_SPACE_BT709_LINEAR_EXT
  , pattern COLOR_SPACE_BT709_NONLINEAR_EXT
  , pattern COLOR_SPACE_DCI_P3_LINEAR_EXT
  , pattern COLOR_SPACE_DCI_P3_NONLINEAR_EXT
  , pattern COLOR_SPACE_DISPLAY_P3_NONLINEAR_EXT
  , pattern COLOR_SPACE_DOLBYVISION_EXT
  , pattern COLOR_SPACE_EXTENDED_SRGB_LINEAR_EXT
  , pattern COLOR_SPACE_EXTENDED_SRGB_NONLINEAR_EXT
  , pattern COLOR_SPACE_HDR10_HLG_EXT
  , pattern COLOR_SPACE_HDR10_ST2084_EXT
  , pattern COLOR_SPACE_PASS_THROUGH_EXT
  )


-- No documentation found for TopLevel "VK_EXT_SWAPCHAIN_COLOR_SPACE_EXTENSION_NAME"
pattern EXT_SWAPCHAIN_COLOR_SPACE_EXTENSION_NAME :: (Eq a, IsString a) => a
pattern EXT_SWAPCHAIN_COLOR_SPACE_EXTENSION_NAME = VK_EXT_SWAPCHAIN_COLOR_SPACE_EXTENSION_NAME

-- No documentation found for TopLevel "VK_EXT_SWAPCHAIN_COLOR_SPACE_SPEC_VERSION"
pattern EXT_SWAPCHAIN_COLOR_SPACE_SPEC_VERSION :: Integral a => a
pattern EXT_SWAPCHAIN_COLOR_SPACE_SPEC_VERSION = VK_EXT_SWAPCHAIN_COLOR_SPACE_SPEC_VERSION
