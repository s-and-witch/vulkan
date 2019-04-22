{-# language Strict #-}
{-# language CPP #-}
{-# language GeneralizedNewtypeDeriving #-}
{-# language PatternSynonyms #-}
{-# language DuplicateRecordFields #-}
{-# language DataKinds #-}
{-# language TypeOperators #-}
{-# language OverloadedStrings #-}

module Graphics.Vulkan.C.Extensions.VK_KHR_surface
  ( VkColorSpaceKHR(..)
  , pattern VK_COLOR_SPACE_SRGB_NONLINEAR_KHR
  , VkCompositeAlphaFlagBitsKHR(..)
  , pattern VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR
  , pattern VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR
  , pattern VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR
  , pattern VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR
  , VkCompositeAlphaFlagsKHR
  , VkPresentModeKHR(..)
  , pattern VK_PRESENT_MODE_IMMEDIATE_KHR
  , pattern VK_PRESENT_MODE_MAILBOX_KHR
  , pattern VK_PRESENT_MODE_FIFO_KHR
  , pattern VK_PRESENT_MODE_FIFO_RELAXED_KHR
  , VkSurfaceCapabilitiesKHR(..)
  , VkSurfaceFormatKHR(..)
  , VkSurfaceKHR
  , VkSurfaceTransformFlagBitsKHR(..)
  , pattern VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR
  , pattern VK_SURFACE_TRANSFORM_ROTATE_90_BIT_KHR
  , pattern VK_SURFACE_TRANSFORM_ROTATE_180_BIT_KHR
  , pattern VK_SURFACE_TRANSFORM_ROTATE_270_BIT_KHR
  , pattern VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_BIT_KHR
  , pattern VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR
  , pattern VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR
  , pattern VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR
  , pattern VK_SURFACE_TRANSFORM_INHERIT_BIT_KHR
  , VkSurfaceTransformFlagsKHR
  , FN_vkDestroySurfaceKHR
  , PFN_vkDestroySurfaceKHR
  , vkDestroySurfaceKHR
  , FN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR
  , PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR
  , vkGetPhysicalDeviceSurfaceCapabilitiesKHR
  , FN_vkGetPhysicalDeviceSurfaceFormatsKHR
  , PFN_vkGetPhysicalDeviceSurfaceFormatsKHR
  , vkGetPhysicalDeviceSurfaceFormatsKHR
  , FN_vkGetPhysicalDeviceSurfacePresentModesKHR
  , PFN_vkGetPhysicalDeviceSurfacePresentModesKHR
  , vkGetPhysicalDeviceSurfacePresentModesKHR
  , FN_vkGetPhysicalDeviceSurfaceSupportKHR
  , PFN_vkGetPhysicalDeviceSurfaceSupportKHR
  , vkGetPhysicalDeviceSurfaceSupportKHR
  , pattern VK_ERROR_NATIVE_WINDOW_IN_USE_KHR
  , pattern VK_ERROR_SURFACE_LOST_KHR
  , pattern VK_KHR_SURFACE_EXTENSION_NAME
  , pattern VK_KHR_SURFACE_SPEC_VERSION
  , pattern VK_OBJECT_TYPE_SURFACE_KHR
  ) where

import Data.Bits
  ( Bits
  , FiniteBits
  )
import Data.Int
  ( Int32
  )
import Data.String
  ( IsString
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
  ( VkBool32(..)
  , VkFormat(..)
  , VkObjectType(..)
  , VkResult(..)
  , Zero(..)
  , VkFlags
  )
import Graphics.Vulkan.C.Core10.DeviceInitialization
  ( VkAllocationCallbacks(..)
  , VkImageUsageFlags
  , VkInstance
  , VkPhysicalDevice
  )
import Graphics.Vulkan.C.Core10.Pipeline
  ( VkExtent2D(..)
  )
import Graphics.Vulkan.C.Dynamic
  ( InstanceCmds(..)
  )
import Graphics.Vulkan.NamedType
  ( (:::)
  )


-- ** VkColorSpaceKHR

-- | VkColorSpaceKHR - supported color space of the presentation engine
--
-- = See Also
--
-- 'VkSurfaceFormatKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.VkSwapchainCreateInfoKHR'
newtype VkColorSpaceKHR = VkColorSpaceKHR Int32
  deriving (Eq, Ord, Storable, Zero)

instance Show VkColorSpaceKHR where
  showsPrec _ VK_COLOR_SPACE_SRGB_NONLINEAR_KHR = showString "VK_COLOR_SPACE_SRGB_NONLINEAR_KHR"
  -- The following values are from extensions, the patterns themselves are exported from the extension modules
  showsPrec _ (VkColorSpaceKHR 1000104001) = showString "VK_COLOR_SPACE_DISPLAY_P3_NONLINEAR_EXT"
  showsPrec _ (VkColorSpaceKHR 1000104002) = showString "VK_COLOR_SPACE_EXTENDED_SRGB_LINEAR_EXT"
  showsPrec _ (VkColorSpaceKHR 1000104003) = showString "VK_COLOR_SPACE_DCI_P3_LINEAR_EXT"
  showsPrec _ (VkColorSpaceKHR 1000104004) = showString "VK_COLOR_SPACE_DCI_P3_NONLINEAR_EXT"
  showsPrec _ (VkColorSpaceKHR 1000104005) = showString "VK_COLOR_SPACE_BT709_LINEAR_EXT"
  showsPrec _ (VkColorSpaceKHR 1000104006) = showString "VK_COLOR_SPACE_BT709_NONLINEAR_EXT"
  showsPrec _ (VkColorSpaceKHR 1000104007) = showString "VK_COLOR_SPACE_BT2020_LINEAR_EXT"
  showsPrec _ (VkColorSpaceKHR 1000104008) = showString "VK_COLOR_SPACE_HDR10_ST2084_EXT"
  showsPrec _ (VkColorSpaceKHR 1000104009) = showString "VK_COLOR_SPACE_DOLBYVISION_EXT"
  showsPrec _ (VkColorSpaceKHR 1000104010) = showString "VK_COLOR_SPACE_HDR10_HLG_EXT"
  showsPrec _ (VkColorSpaceKHR 1000104011) = showString "VK_COLOR_SPACE_ADOBERGB_LINEAR_EXT"
  showsPrec _ (VkColorSpaceKHR 1000104012) = showString "VK_COLOR_SPACE_ADOBERGB_NONLINEAR_EXT"
  showsPrec _ (VkColorSpaceKHR 1000104013) = showString "VK_COLOR_SPACE_PASS_THROUGH_EXT"
  showsPrec _ (VkColorSpaceKHR 1000104014) = showString "VK_COLOR_SPACE_EXTENDED_SRGB_NONLINEAR_EXT"
  showsPrec _ (VkColorSpaceKHR 1000213000) = showString "VK_COLOR_SPACE_DISPLAY_NATIVE_AMD"
  showsPrec p (VkColorSpaceKHR x) = showParen (p >= 11) (showString "VkColorSpaceKHR " . showsPrec 11 x)

instance Read VkColorSpaceKHR where
  readPrec = parens ( choose [ ("VK_COLOR_SPACE_SRGB_NONLINEAR_KHR", pure VK_COLOR_SPACE_SRGB_NONLINEAR_KHR)
                             , -- The following values are from extensions, the patterns themselves are exported from the extension modules
                               ("VK_COLOR_SPACE_DISPLAY_P3_NONLINEAR_EXT",    pure (VkColorSpaceKHR 1000104001))
                             , ("VK_COLOR_SPACE_EXTENDED_SRGB_LINEAR_EXT",    pure (VkColorSpaceKHR 1000104002))
                             , ("VK_COLOR_SPACE_DCI_P3_LINEAR_EXT",           pure (VkColorSpaceKHR 1000104003))
                             , ("VK_COLOR_SPACE_DCI_P3_NONLINEAR_EXT",        pure (VkColorSpaceKHR 1000104004))
                             , ("VK_COLOR_SPACE_BT709_LINEAR_EXT",            pure (VkColorSpaceKHR 1000104005))
                             , ("VK_COLOR_SPACE_BT709_NONLINEAR_EXT",         pure (VkColorSpaceKHR 1000104006))
                             , ("VK_COLOR_SPACE_BT2020_LINEAR_EXT",           pure (VkColorSpaceKHR 1000104007))
                             , ("VK_COLOR_SPACE_HDR10_ST2084_EXT",            pure (VkColorSpaceKHR 1000104008))
                             , ("VK_COLOR_SPACE_DOLBYVISION_EXT",             pure (VkColorSpaceKHR 1000104009))
                             , ("VK_COLOR_SPACE_HDR10_HLG_EXT",               pure (VkColorSpaceKHR 1000104010))
                             , ("VK_COLOR_SPACE_ADOBERGB_LINEAR_EXT",         pure (VkColorSpaceKHR 1000104011))
                             , ("VK_COLOR_SPACE_ADOBERGB_NONLINEAR_EXT",      pure (VkColorSpaceKHR 1000104012))
                             , ("VK_COLOR_SPACE_PASS_THROUGH_EXT",            pure (VkColorSpaceKHR 1000104013))
                             , ("VK_COLOR_SPACE_EXTENDED_SRGB_NONLINEAR_EXT", pure (VkColorSpaceKHR 1000104014))
                             , ("VK_COLOR_SPACE_DISPLAY_NATIVE_AMD",          pure (VkColorSpaceKHR 1000213000))
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkColorSpaceKHR")
                        v <- step readPrec
                        pure (VkColorSpaceKHR v)
                        )
                    )

-- | 'VK_COLOR_SPACE_SRGB_NONLINEAR_KHR' specifies support for the sRGB color
-- space.
pattern VK_COLOR_SPACE_SRGB_NONLINEAR_KHR :: VkColorSpaceKHR
pattern VK_COLOR_SPACE_SRGB_NONLINEAR_KHR = VkColorSpaceKHR 0

-- ** VkCompositeAlphaFlagBitsKHR

-- | VkCompositeAlphaFlagBitsKHR - alpha compositing modes supported on a
-- device
--
-- = Description
--
-- These values are described as follows:
--
-- = See Also
--
-- 'VkCompositeAlphaFlagsKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.VkSwapchainCreateInfoKHR'
newtype VkCompositeAlphaFlagBitsKHR = VkCompositeAlphaFlagBitsKHR VkFlags
  deriving (Eq, Ord, Storable, Bits, FiniteBits, Zero)

instance Show VkCompositeAlphaFlagBitsKHR where
  showsPrec _ VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR = showString "VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR"
  showsPrec _ VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR = showString "VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR"
  showsPrec _ VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR = showString "VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR"
  showsPrec _ VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR = showString "VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR"
  showsPrec p (VkCompositeAlphaFlagBitsKHR x) = showParen (p >= 11) (showString "VkCompositeAlphaFlagBitsKHR " . showsPrec 11 x)

instance Read VkCompositeAlphaFlagBitsKHR where
  readPrec = parens ( choose [ ("VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR",          pure VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR)
                             , ("VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR",  pure VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR)
                             , ("VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR", pure VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR)
                             , ("VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR",         pure VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR)
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkCompositeAlphaFlagBitsKHR")
                        v <- step readPrec
                        pure (VkCompositeAlphaFlagBitsKHR v)
                        )
                    )

-- | 'VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR': The alpha channel, if it exists, of
-- the images is ignored in the compositing process. Instead, the image is
-- treated as if it has a constant alpha of 1.0.
pattern VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR :: VkCompositeAlphaFlagBitsKHR
pattern VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR = VkCompositeAlphaFlagBitsKHR 0x00000001

-- | 'VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR': The alpha channel, if it
-- exists, of the images is respected in the compositing process. The
-- non-alpha channels of the image are expected to already be multiplied by
-- the alpha channel by the application.
pattern VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR :: VkCompositeAlphaFlagBitsKHR
pattern VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR = VkCompositeAlphaFlagBitsKHR 0x00000002

-- | 'VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR': The alpha channel, if it
-- exists, of the images is respected in the compositing process. The
-- non-alpha channels of the image are not expected to already be
-- multiplied by the alpha channel by the application; instead, the
-- compositor will multiply the non-alpha channels of the image by the
-- alpha channel during compositing.
pattern VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR :: VkCompositeAlphaFlagBitsKHR
pattern VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR = VkCompositeAlphaFlagBitsKHR 0x00000004

-- | 'VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR': The way in which the presentation
-- engine treats the alpha channel in the images is unknown to the Vulkan
-- API. Instead, the application is responsible for setting the composite
-- alpha blending mode using native window system commands. If the
-- application does not set the blending mode using native window system
-- commands, then a platform-specific default will be used.
pattern VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR :: VkCompositeAlphaFlagBitsKHR
pattern VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR = VkCompositeAlphaFlagBitsKHR 0x00000008

-- | VkCompositeAlphaFlagsKHR - Bitmask of VkCompositeAlphaFlagBitsKHR
--
-- = Description
--
-- 'VkCompositeAlphaFlagsKHR' is a bitmask type for setting a mask of zero
-- or more 'VkCompositeAlphaFlagBitsKHR'.
--
-- = See Also
--
-- 'VkCompositeAlphaFlagBitsKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_surface_counter.VkSurfaceCapabilities2EXT',
-- 'VkSurfaceCapabilitiesKHR'
type VkCompositeAlphaFlagsKHR = VkCompositeAlphaFlagBitsKHR

-- ** VkPresentModeKHR

-- | VkPresentModeKHR - presentation mode supported for a surface
--
-- = Description
--
-- __Note__
--
-- For reference, the mode indicated by 'VK_PRESENT_MODE_FIFO_KHR' is
-- equivalent to the behavior of {wgl|glX|egl}SwapBuffers with a swap
-- interval of 1, while the mode indicated by
-- 'VK_PRESENT_MODE_FIFO_RELAXED_KHR' is equivalent to the behavior of
-- {wgl|glX}SwapBuffers with a swap interval of -1 (from the
-- {WGL|GLX}_EXT_swap_control_tear extensions).
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.VkSwapchainCreateInfoKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_full_screen_exclusive.vkGetPhysicalDeviceSurfacePresentModes2EXT',
-- 'vkGetPhysicalDeviceSurfacePresentModesKHR'
newtype VkPresentModeKHR = VkPresentModeKHR Int32
  deriving (Eq, Ord, Storable, Zero)

instance Show VkPresentModeKHR where
  showsPrec _ VK_PRESENT_MODE_IMMEDIATE_KHR = showString "VK_PRESENT_MODE_IMMEDIATE_KHR"
  showsPrec _ VK_PRESENT_MODE_MAILBOX_KHR = showString "VK_PRESENT_MODE_MAILBOX_KHR"
  showsPrec _ VK_PRESENT_MODE_FIFO_KHR = showString "VK_PRESENT_MODE_FIFO_KHR"
  showsPrec _ VK_PRESENT_MODE_FIFO_RELAXED_KHR = showString "VK_PRESENT_MODE_FIFO_RELAXED_KHR"
  -- The following values are from extensions, the patterns themselves are exported from the extension modules
  showsPrec _ (VkPresentModeKHR 1000111000) = showString "VK_PRESENT_MODE_SHARED_DEMAND_REFRESH_KHR"
  showsPrec _ (VkPresentModeKHR 1000111001) = showString "VK_PRESENT_MODE_SHARED_CONTINUOUS_REFRESH_KHR"
  showsPrec p (VkPresentModeKHR x) = showParen (p >= 11) (showString "VkPresentModeKHR " . showsPrec 11 x)

instance Read VkPresentModeKHR where
  readPrec = parens ( choose [ ("VK_PRESENT_MODE_IMMEDIATE_KHR",    pure VK_PRESENT_MODE_IMMEDIATE_KHR)
                             , ("VK_PRESENT_MODE_MAILBOX_KHR",      pure VK_PRESENT_MODE_MAILBOX_KHR)
                             , ("VK_PRESENT_MODE_FIFO_KHR",         pure VK_PRESENT_MODE_FIFO_KHR)
                             , ("VK_PRESENT_MODE_FIFO_RELAXED_KHR", pure VK_PRESENT_MODE_FIFO_RELAXED_KHR)
                             , -- The following values are from extensions, the patterns themselves are exported from the extension modules
                               ("VK_PRESENT_MODE_SHARED_DEMAND_REFRESH_KHR",     pure (VkPresentModeKHR 1000111000))
                             , ("VK_PRESENT_MODE_SHARED_CONTINUOUS_REFRESH_KHR", pure (VkPresentModeKHR 1000111001))
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkPresentModeKHR")
                        v <- step readPrec
                        pure (VkPresentModeKHR v)
                        )
                    )

-- | 'VK_PRESENT_MODE_IMMEDIATE_KHR' specifies that the presentation engine
-- does not wait for a vertical blanking period to update the current
-- image, meaning this mode /may/ result in visible tearing. No internal
-- queuing of presentation requests is needed, as the requests are applied
-- immediately.
pattern VK_PRESENT_MODE_IMMEDIATE_KHR :: VkPresentModeKHR
pattern VK_PRESENT_MODE_IMMEDIATE_KHR = VkPresentModeKHR 0

-- | 'VK_PRESENT_MODE_MAILBOX_KHR' specifies that the presentation engine
-- waits for the next vertical blanking period to update the current image.
-- Tearing /cannot/ be observed. An internal single-entry queue is used to
-- hold pending presentation requests. If the queue is full when a new
-- presentation request is received, the new request replaces the existing
-- entry, and any images associated with the prior entry become available
-- for re-use by the application. One request is removed from the queue and
-- processed during each vertical blanking period in which the queue is
-- non-empty.
pattern VK_PRESENT_MODE_MAILBOX_KHR :: VkPresentModeKHR
pattern VK_PRESENT_MODE_MAILBOX_KHR = VkPresentModeKHR 1

-- | 'VK_PRESENT_MODE_FIFO_KHR' specifies that the presentation engine waits
-- for the next vertical blanking period to update the current image.
-- Tearing /cannot/ be observed. An internal queue is used to hold pending
-- presentation requests. New requests are appended to the end of the
-- queue, and one request is removed from the beginning of the queue and
-- processed during each vertical blanking period in which the queue is
-- non-empty. This is the only value of @presentMode@ that is /required/ to
-- be supported.
pattern VK_PRESENT_MODE_FIFO_KHR :: VkPresentModeKHR
pattern VK_PRESENT_MODE_FIFO_KHR = VkPresentModeKHR 2

-- | 'VK_PRESENT_MODE_FIFO_RELAXED_KHR' specifies that the presentation
-- engine generally waits for the next vertical blanking period to update
-- the current image. If a vertical blanking period has already passed
-- since the last update of the current image then the presentation engine
-- does not wait for another vertical blanking period for the update,
-- meaning this mode /may/ result in visible tearing in this case. This
-- mode is useful for reducing visual stutter with an application that will
-- mostly present a new image before the next vertical blanking period, but
-- may occasionally be late, and present a new image just after the next
-- vertical blanking period. An internal queue is used to hold pending
-- presentation requests. New requests are appended to the end of the
-- queue, and one request is removed from the beginning of the queue and
-- processed during or after each vertical blanking period in which the
-- queue is non-empty.
pattern VK_PRESENT_MODE_FIFO_RELAXED_KHR :: VkPresentModeKHR
pattern VK_PRESENT_MODE_FIFO_RELAXED_KHR = VkPresentModeKHR 3

-- | VkSurfaceCapabilitiesKHR - Structure describing capabilities of a
-- surface
--
-- = Description
--
-- __Note__
--
-- Formulas such as min(N, @maxImageCount@) are not correct, since
-- @maxImageCount@ /may/ be zero.
--
-- = See Also
--
-- 'VkCompositeAlphaFlagsKHR',
-- 'Graphics.Vulkan.C.Core10.Pipeline.VkExtent2D',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkImageUsageFlags',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_get_surface_capabilities2.VkSurfaceCapabilities2KHR',
-- 'VkSurfaceTransformFlagBitsKHR', 'VkSurfaceTransformFlagsKHR',
-- 'vkGetPhysicalDeviceSurfaceCapabilitiesKHR'
data VkSurfaceCapabilitiesKHR = VkSurfaceCapabilitiesKHR
  { -- | @minImageCount@ is the minimum number of images the specified device
  -- supports for a swapchain created for the surface, and will be at least
  -- one.
  vkMinImageCount :: Word32
  , -- | @maxImageCount@ is the maximum number of images the specified device
  -- supports for a swapchain created for the surface, and will be either 0,
  -- or greater than or equal to @minImageCount@. A value of 0 means that
  -- there is no limit on the number of images, though there /may/ be limits
  -- related to the total amount of memory used by presentable images.
  vkMaxImageCount :: Word32
  , -- | @currentExtent@ is the current width and height of the surface, or the
  -- special value (0xFFFFFFFF, 0xFFFFFFFF) indicating that the surface size
  -- will be determined by the extent of a swapchain targeting the surface.
  vkCurrentExtent :: VkExtent2D
  , -- | @minImageExtent@ contains the smallest valid swapchain extent for the
  -- surface on the specified device. The @width@ and @height@ of the extent
  -- will each be less than or equal to the corresponding @width@ and
  -- @height@ of @currentExtent@, unless @currentExtent@ has the special
  -- value described above.
  vkMinImageExtent :: VkExtent2D
  , -- | @maxImageExtent@ contains the largest valid swapchain extent for the
  -- surface on the specified device. The @width@ and @height@ of the extent
  -- will each be greater than or equal to the corresponding @width@ and
  -- @height@ of @minImageExtent@. The @width@ and @height@ of the extent
  -- will each be greater than or equal to the corresponding @width@ and
  -- @height@ of @currentExtent@, unless @currentExtent@ has the special
  -- value described above.
  vkMaxImageExtent :: VkExtent2D
  , -- | @maxImageArrayLayers@ is the maximum number of layers presentable images
  -- /can/ have for a swapchain created for this device and surface, and will
  -- be at least one.
  vkMaxImageArrayLayers :: Word32
  , -- | @supportedTransforms@ is a bitmask of 'VkSurfaceTransformFlagBitsKHR'
  -- indicating the presentation transforms supported for the surface on the
  -- specified device. At least one bit will be set.
  vkSupportedTransforms :: VkSurfaceTransformFlagsKHR
  , -- | @currentTransform@ is 'VkSurfaceTransformFlagBitsKHR' value indicating
  -- the surface’s current transform relative to the presentation engine’s
  -- natural orientation.
  vkCurrentTransform :: VkSurfaceTransformFlagBitsKHR
  , -- | @supportedCompositeAlpha@ is a bitmask of 'VkCompositeAlphaFlagBitsKHR',
  -- representing the alpha compositing modes supported by the presentation
  -- engine for the surface on the specified device, and at least one bit
  -- will be set. Opaque composition /can/ be achieved in any alpha
  -- compositing mode by either using an image format that has no alpha
  -- component, or by ensuring that all pixels in the presentable images have
  -- an alpha value of 1.0.
  vkSupportedCompositeAlpha :: VkCompositeAlphaFlagsKHR
  , -- | @supportedUsageFlags@ is a bitmask of
  -- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkImageUsageFlagBits'
  -- representing the ways the application /can/ use the presentable images
  -- of a swapchain created for the surface on the specified device.
  -- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT'
  -- /must/ be included in the set but implementations /may/ support
  -- additional usages.
  vkSupportedUsageFlags :: VkImageUsageFlags
  }
  deriving (Eq, Show)

instance Storable VkSurfaceCapabilitiesKHR where
  sizeOf ~_ = 52
  alignment ~_ = 4
  peek ptr = VkSurfaceCapabilitiesKHR <$> peek (ptr `plusPtr` 0)
                                      <*> peek (ptr `plusPtr` 4)
                                      <*> peek (ptr `plusPtr` 8)
                                      <*> peek (ptr `plusPtr` 16)
                                      <*> peek (ptr `plusPtr` 24)
                                      <*> peek (ptr `plusPtr` 32)
                                      <*> peek (ptr `plusPtr` 36)
                                      <*> peek (ptr `plusPtr` 40)
                                      <*> peek (ptr `plusPtr` 44)
                                      <*> peek (ptr `plusPtr` 48)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkMinImageCount (poked :: VkSurfaceCapabilitiesKHR))
                *> poke (ptr `plusPtr` 4) (vkMaxImageCount (poked :: VkSurfaceCapabilitiesKHR))
                *> poke (ptr `plusPtr` 8) (vkCurrentExtent (poked :: VkSurfaceCapabilitiesKHR))
                *> poke (ptr `plusPtr` 16) (vkMinImageExtent (poked :: VkSurfaceCapabilitiesKHR))
                *> poke (ptr `plusPtr` 24) (vkMaxImageExtent (poked :: VkSurfaceCapabilitiesKHR))
                *> poke (ptr `plusPtr` 32) (vkMaxImageArrayLayers (poked :: VkSurfaceCapabilitiesKHR))
                *> poke (ptr `plusPtr` 36) (vkSupportedTransforms (poked :: VkSurfaceCapabilitiesKHR))
                *> poke (ptr `plusPtr` 40) (vkCurrentTransform (poked :: VkSurfaceCapabilitiesKHR))
                *> poke (ptr `plusPtr` 44) (vkSupportedCompositeAlpha (poked :: VkSurfaceCapabilitiesKHR))
                *> poke (ptr `plusPtr` 48) (vkSupportedUsageFlags (poked :: VkSurfaceCapabilitiesKHR))

instance Zero VkSurfaceCapabilitiesKHR where
  zero = VkSurfaceCapabilitiesKHR zero
                                  zero
                                  zero
                                  zero
                                  zero
                                  zero
                                  zero
                                  zero
                                  zero
                                  zero

-- | VkSurfaceFormatKHR - Structure describing a supported swapchain
-- format-color space pair
--
-- = See Also
--
-- 'VkColorSpaceKHR', 'Graphics.Vulkan.C.Core10.Core.VkFormat',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_get_surface_capabilities2.VkSurfaceFormat2KHR',
-- 'vkGetPhysicalDeviceSurfaceFormatsKHR'
data VkSurfaceFormatKHR = VkSurfaceFormatKHR
  { -- | @format@ is a 'Graphics.Vulkan.C.Core10.Core.VkFormat' that is
  -- compatible with the specified surface.
  vkFormat :: VkFormat
  , -- | @colorSpace@ is a presentation 'VkColorSpaceKHR' that is compatible with
  -- the surface.
  vkColorSpace :: VkColorSpaceKHR
  }
  deriving (Eq, Show)

instance Storable VkSurfaceFormatKHR where
  sizeOf ~_ = 8
  alignment ~_ = 4
  peek ptr = VkSurfaceFormatKHR <$> peek (ptr `plusPtr` 0)
                                <*> peek (ptr `plusPtr` 4)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkFormat (poked :: VkSurfaceFormatKHR))
                *> poke (ptr `plusPtr` 4) (vkColorSpace (poked :: VkSurfaceFormatKHR))

instance Zero VkSurfaceFormatKHR where
  zero = VkSurfaceFormatKHR zero
                            zero

-- | Dummy data to tag the 'Ptr' with
data VkSurfaceKHR_T
-- | VkSurfaceKHR - Opaque handle to a surface object
--
-- = Description
--
-- The @VK_KHR_surface@ extension declares the 'VkSurfaceKHR' object, and
-- provides a function for destroying 'VkSurfaceKHR' objects. Separate
-- platform-specific extensions each provide a function for creating a
-- 'VkSurfaceKHR' object for the respective platform. From the
-- application’s perspective this is an opaque handle, just like the
-- handles of other Vulkan objects.
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_get_surface_capabilities2.VkPhysicalDeviceSurfaceInfo2KHR',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.VkSwapchainCreateInfoKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_android_surface.vkCreateAndroidSurfaceKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_display.vkCreateDisplayPlaneSurfaceKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_headless_surface.vkCreateHeadlessSurfaceEXT',
-- 'Graphics.Vulkan.C.Extensions.VK_MVK_ios_surface.vkCreateIOSSurfaceMVK',
-- 'Graphics.Vulkan.C.Extensions.VK_FUCHSIA_imagepipe_surface.vkCreateImagePipeSurfaceFUCHSIA',
-- 'Graphics.Vulkan.C.Extensions.VK_MVK_macos_surface.vkCreateMacOSSurfaceMVK',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_metal_surface.vkCreateMetalSurfaceEXT',
-- 'Graphics.Vulkan.C.Extensions.VK_GGP_stream_descriptor_surface.vkCreateStreamDescriptorSurfaceGGP',
-- 'Graphics.Vulkan.C.Extensions.VK_NN_vi_surface.vkCreateViSurfaceNN',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_wayland_surface.vkCreateWaylandSurfaceKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_win32_surface.vkCreateWin32SurfaceKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_xcb_surface.vkCreateXcbSurfaceKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_xlib_surface.vkCreateXlibSurfaceKHR',
-- 'vkDestroySurfaceKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.vkGetDeviceGroupSurfacePresentModesKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.vkGetPhysicalDevicePresentRectanglesKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_surface_counter.vkGetPhysicalDeviceSurfaceCapabilities2EXT',
-- 'vkGetPhysicalDeviceSurfaceCapabilitiesKHR',
-- 'vkGetPhysicalDeviceSurfaceFormatsKHR',
-- 'vkGetPhysicalDeviceSurfacePresentModesKHR',
-- 'vkGetPhysicalDeviceSurfaceSupportKHR'
type VkSurfaceKHR = Ptr VkSurfaceKHR_T

-- ** VkSurfaceTransformFlagBitsKHR

-- | VkSurfaceTransformFlagBitsKHR - presentation transforms supported on a
-- device
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_display.VkDisplaySurfaceCreateInfoKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_surface_counter.VkSurfaceCapabilities2EXT',
-- 'VkSurfaceCapabilitiesKHR', 'VkSurfaceTransformFlagsKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.VkSwapchainCreateInfoKHR'
newtype VkSurfaceTransformFlagBitsKHR = VkSurfaceTransformFlagBitsKHR VkFlags
  deriving (Eq, Ord, Storable, Bits, FiniteBits, Zero)

instance Show VkSurfaceTransformFlagBitsKHR where
  showsPrec _ VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR = showString "VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR"
  showsPrec _ VK_SURFACE_TRANSFORM_ROTATE_90_BIT_KHR = showString "VK_SURFACE_TRANSFORM_ROTATE_90_BIT_KHR"
  showsPrec _ VK_SURFACE_TRANSFORM_ROTATE_180_BIT_KHR = showString "VK_SURFACE_TRANSFORM_ROTATE_180_BIT_KHR"
  showsPrec _ VK_SURFACE_TRANSFORM_ROTATE_270_BIT_KHR = showString "VK_SURFACE_TRANSFORM_ROTATE_270_BIT_KHR"
  showsPrec _ VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_BIT_KHR = showString "VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_BIT_KHR"
  showsPrec _ VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR = showString "VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR"
  showsPrec _ VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR = showString "VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR"
  showsPrec _ VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR = showString "VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR"
  showsPrec _ VK_SURFACE_TRANSFORM_INHERIT_BIT_KHR = showString "VK_SURFACE_TRANSFORM_INHERIT_BIT_KHR"
  showsPrec p (VkSurfaceTransformFlagBitsKHR x) = showParen (p >= 11) (showString "VkSurfaceTransformFlagBitsKHR " . showsPrec 11 x)

instance Read VkSurfaceTransformFlagBitsKHR where
  readPrec = parens ( choose [ ("VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR",                     pure VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR)
                             , ("VK_SURFACE_TRANSFORM_ROTATE_90_BIT_KHR",                    pure VK_SURFACE_TRANSFORM_ROTATE_90_BIT_KHR)
                             , ("VK_SURFACE_TRANSFORM_ROTATE_180_BIT_KHR",                   pure VK_SURFACE_TRANSFORM_ROTATE_180_BIT_KHR)
                             , ("VK_SURFACE_TRANSFORM_ROTATE_270_BIT_KHR",                   pure VK_SURFACE_TRANSFORM_ROTATE_270_BIT_KHR)
                             , ("VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_BIT_KHR",            pure VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_BIT_KHR)
                             , ("VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR",  pure VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR)
                             , ("VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR", pure VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR)
                             , ("VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR", pure VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR)
                             , ("VK_SURFACE_TRANSFORM_INHERIT_BIT_KHR",                      pure VK_SURFACE_TRANSFORM_INHERIT_BIT_KHR)
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkSurfaceTransformFlagBitsKHR")
                        v <- step readPrec
                        pure (VkSurfaceTransformFlagBitsKHR v)
                        )
                    )

-- | 'VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR' specifies that image content is
-- presented without being transformed.
pattern VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR :: VkSurfaceTransformFlagBitsKHR
pattern VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR = VkSurfaceTransformFlagBitsKHR 0x00000001

-- | 'VK_SURFACE_TRANSFORM_ROTATE_90_BIT_KHR' specifies that image content is
-- rotated 90 degrees clockwise.
pattern VK_SURFACE_TRANSFORM_ROTATE_90_BIT_KHR :: VkSurfaceTransformFlagBitsKHR
pattern VK_SURFACE_TRANSFORM_ROTATE_90_BIT_KHR = VkSurfaceTransformFlagBitsKHR 0x00000002

-- | 'VK_SURFACE_TRANSFORM_ROTATE_180_BIT_KHR' specifies that image content
-- is rotated 180 degrees clockwise.
pattern VK_SURFACE_TRANSFORM_ROTATE_180_BIT_KHR :: VkSurfaceTransformFlagBitsKHR
pattern VK_SURFACE_TRANSFORM_ROTATE_180_BIT_KHR = VkSurfaceTransformFlagBitsKHR 0x00000004

-- | 'VK_SURFACE_TRANSFORM_ROTATE_270_BIT_KHR' specifies that image content
-- is rotated 270 degrees clockwise.
pattern VK_SURFACE_TRANSFORM_ROTATE_270_BIT_KHR :: VkSurfaceTransformFlagBitsKHR
pattern VK_SURFACE_TRANSFORM_ROTATE_270_BIT_KHR = VkSurfaceTransformFlagBitsKHR 0x00000008

-- | 'VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_BIT_KHR' specifies that image
-- content is mirrored horizontally.
pattern VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_BIT_KHR :: VkSurfaceTransformFlagBitsKHR
pattern VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_BIT_KHR = VkSurfaceTransformFlagBitsKHR 0x00000010

-- | 'VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR' specifies
-- that image content is mirrored horizontally, then rotated 90 degrees
-- clockwise.
pattern VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR :: VkSurfaceTransformFlagBitsKHR
pattern VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR = VkSurfaceTransformFlagBitsKHR 0x00000020

-- | 'VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR' specifies
-- that image content is mirrored horizontally, then rotated 180 degrees
-- clockwise.
pattern VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR :: VkSurfaceTransformFlagBitsKHR
pattern VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR = VkSurfaceTransformFlagBitsKHR 0x00000040

-- | 'VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR' specifies
-- that image content is mirrored horizontally, then rotated 270 degrees
-- clockwise.
pattern VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR :: VkSurfaceTransformFlagBitsKHR
pattern VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR = VkSurfaceTransformFlagBitsKHR 0x00000080

-- | 'VK_SURFACE_TRANSFORM_INHERIT_BIT_KHR' specifies that the presentation
-- transform is not specified, and is instead determined by
-- platform-specific considerations and mechanisms outside Vulkan.
pattern VK_SURFACE_TRANSFORM_INHERIT_BIT_KHR :: VkSurfaceTransformFlagBitsKHR
pattern VK_SURFACE_TRANSFORM_INHERIT_BIT_KHR = VkSurfaceTransformFlagBitsKHR 0x00000100

-- | VkSurfaceTransformFlagsKHR - Bitmask of VkSurfaceTransformFlagBitsKHR
--
-- = Description
--
-- 'VkSurfaceTransformFlagsKHR' is a bitmask type for setting a mask of
-- zero or more 'VkSurfaceTransformFlagBitsKHR'.
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_display.VkDisplayPropertiesKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_surface_counter.VkSurfaceCapabilities2EXT',
-- 'VkSurfaceCapabilitiesKHR', 'VkSurfaceTransformFlagBitsKHR'
type VkSurfaceTransformFlagsKHR = VkSurfaceTransformFlagBitsKHR

-- | vkDestroySurfaceKHR - Destroy a VkSurfaceKHR object
--
-- = Parameters
--
-- -   @instance@ is the instance used to create the surface.
--
-- -   @surface@ is the surface to destroy.
--
-- -   @pAllocator@ is the allocator used for host memory allocated for the
--     surface object when there is no more specific allocator available
--     (see
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#memory-allocation Memory Allocation>).
--
-- = Description
--
-- Destroying a 'VkSurfaceKHR' merely severs the connection between Vulkan
-- and the native surface, and does not imply destroying the native
-- surface, closing a window, or similar behavior.
--
-- == Valid Usage
--
-- -   All 'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.VkSwapchainKHR'
--     objects created for @surface@ /must/ have been destroyed prior to
--     destroying @surface@
--
-- -   If
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     were provided when @surface@ was created, a compatible set of
--     callbacks /must/ be provided here
--
-- -   If no
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     were provided when @surface@ was created, @pAllocator@ /must/ be
--     @NULL@
--
-- == Valid Usage (Implicit)
--
-- -   @instance@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance' handle
--
-- -   If @surface@ is not
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE', @surface@
--     /must/ be a valid 'VkSurfaceKHR' handle
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     structure
--
-- -   If @surface@ is a valid handle, it /must/ have been created,
--     allocated, or retrieved from @instance@
--
-- == Host Synchronization
--
-- -   Host access to @surface@ /must/ be externally synchronized
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance',
-- 'VkSurfaceKHR'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkDestroySurfaceKHR" vkDestroySurfaceKHR :: ("instance" ::: VkInstance) -> ("surface" ::: VkSurfaceKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()
#else
vkDestroySurfaceKHR :: InstanceCmds -> ("instance" ::: VkInstance) -> ("surface" ::: VkSurfaceKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()
vkDestroySurfaceKHR deviceCmds = mkVkDestroySurfaceKHR (pVkDestroySurfaceKHR deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkDestroySurfaceKHR
  :: FunPtr (("instance" ::: VkInstance) -> ("surface" ::: VkSurfaceKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()) -> (("instance" ::: VkInstance) -> ("surface" ::: VkSurfaceKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ())
#endif

type FN_vkDestroySurfaceKHR = ("instance" ::: VkInstance) -> ("surface" ::: VkSurfaceKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()
type PFN_vkDestroySurfaceKHR = FunPtr FN_vkDestroySurfaceKHR

-- | vkGetPhysicalDeviceSurfaceCapabilitiesKHR - Query surface capabilities
--
-- = Parameters
--
-- -   @physicalDevice@ is the physical device that will be associated with
--     the swapchain to be created, as described for
--     'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.vkCreateSwapchainKHR'.
--
-- -   @surface@ is the surface that will be associated with the swapchain.
--
-- -   @pSurfaceCapabilities@ is a pointer to an instance of the
--     'VkSurfaceCapabilitiesKHR' structure in which the capabilities are
--     returned.
--
-- == Valid Usage (Implicit)
--
-- -   @physicalDevice@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDevice'
--     handle
--
-- -   @surface@ /must/ be a valid 'VkSurfaceKHR' handle
--
-- -   @pSurfaceCapabilities@ /must/ be a valid pointer to a
--     'VkSurfaceCapabilitiesKHR' structure
--
-- -   Both of @physicalDevice@, and @surface@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance'
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
--     -   'VK_ERROR_SURFACE_LOST_KHR'
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDevice',
-- 'VkSurfaceCapabilitiesKHR', 'VkSurfaceKHR'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkGetPhysicalDeviceSurfaceCapabilitiesKHR" vkGetPhysicalDeviceSurfaceCapabilitiesKHR :: ("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pSurfaceCapabilities" ::: Ptr VkSurfaceCapabilitiesKHR) -> IO VkResult
#else
vkGetPhysicalDeviceSurfaceCapabilitiesKHR :: InstanceCmds -> ("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pSurfaceCapabilities" ::: Ptr VkSurfaceCapabilitiesKHR) -> IO VkResult
vkGetPhysicalDeviceSurfaceCapabilitiesKHR deviceCmds = mkVkGetPhysicalDeviceSurfaceCapabilitiesKHR (pVkGetPhysicalDeviceSurfaceCapabilitiesKHR deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceSurfaceCapabilitiesKHR
  :: FunPtr (("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pSurfaceCapabilities" ::: Ptr VkSurfaceCapabilitiesKHR) -> IO VkResult) -> (("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pSurfaceCapabilities" ::: Ptr VkSurfaceCapabilitiesKHR) -> IO VkResult)
#endif

type FN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR = ("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pSurfaceCapabilities" ::: Ptr VkSurfaceCapabilitiesKHR) -> IO VkResult
type PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR = FunPtr FN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR

-- | vkGetPhysicalDeviceSurfaceFormatsKHR - Query color formats supported by
-- surface
--
-- = Parameters
--
-- -   @physicalDevice@ is the physical device that will be associated with
--     the swapchain to be created, as described for
--     'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.vkCreateSwapchainKHR'.
--
-- -   @surface@ is the surface that will be associated with the swapchain.
--
-- -   @pSurfaceFormatCount@ is a pointer to an integer related to the
--     number of format pairs available or queried, as described below.
--
-- -   @pSurfaceFormats@ is either @NULL@ or a pointer to an array of
--     'VkSurfaceFormatKHR' structures.
--
-- = Description
--
-- If @pSurfaceFormats@ is @NULL@, then the number of format pairs
-- supported for the given @surface@ is returned in @pSurfaceFormatCount@.
-- The number of format pairs supported will be greater than or equal to 1.
-- Otherwise, @pSurfaceFormatCount@ /must/ point to a variable set by the
-- user to the number of elements in the @pSurfaceFormats@ array, and on
-- return the variable is overwritten with the number of structures
-- actually written to @pSurfaceFormats@. If the value of
-- @pSurfaceFormatCount@ is less than the number of format pairs supported,
-- at most @pSurfaceFormatCount@ structures will be written. If
-- @pSurfaceFormatCount@ is smaller than the number of format pairs
-- supported for the given @surface@,
-- 'Graphics.Vulkan.C.Core10.Core.VK_INCOMPLETE' will be returned instead
-- of 'Graphics.Vulkan.C.Core10.Core.VK_SUCCESS' to indicate that not all
-- the available values were returned.
--
-- == Valid Usage (Implicit)
--
-- -   @physicalDevice@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDevice'
--     handle
--
-- -   @surface@ /must/ be a valid 'VkSurfaceKHR' handle
--
-- -   @pSurfaceFormatCount@ /must/ be a valid pointer to a @uint32_t@
--     value
--
-- -   If the value referenced by @pSurfaceFormatCount@ is not @0@, and
--     @pSurfaceFormats@ is not @NULL@, @pSurfaceFormats@ /must/ be a valid
--     pointer to an array of @pSurfaceFormatCount@ 'VkSurfaceFormatKHR'
--     structures
--
-- -   Both of @physicalDevice@, and @surface@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance'
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_SUCCESS'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_INCOMPLETE'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_OUT_OF_DEVICE_MEMORY'
--
--     -   'VK_ERROR_SURFACE_LOST_KHR'
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDevice',
-- 'VkSurfaceFormatKHR', 'VkSurfaceKHR'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkGetPhysicalDeviceSurfaceFormatsKHR" vkGetPhysicalDeviceSurfaceFormatsKHR :: ("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pSurfaceFormatCount" ::: Ptr Word32) -> ("pSurfaceFormats" ::: Ptr VkSurfaceFormatKHR) -> IO VkResult
#else
vkGetPhysicalDeviceSurfaceFormatsKHR :: InstanceCmds -> ("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pSurfaceFormatCount" ::: Ptr Word32) -> ("pSurfaceFormats" ::: Ptr VkSurfaceFormatKHR) -> IO VkResult
vkGetPhysicalDeviceSurfaceFormatsKHR deviceCmds = mkVkGetPhysicalDeviceSurfaceFormatsKHR (pVkGetPhysicalDeviceSurfaceFormatsKHR deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceSurfaceFormatsKHR
  :: FunPtr (("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pSurfaceFormatCount" ::: Ptr Word32) -> ("pSurfaceFormats" ::: Ptr VkSurfaceFormatKHR) -> IO VkResult) -> (("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pSurfaceFormatCount" ::: Ptr Word32) -> ("pSurfaceFormats" ::: Ptr VkSurfaceFormatKHR) -> IO VkResult)
#endif

type FN_vkGetPhysicalDeviceSurfaceFormatsKHR = ("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pSurfaceFormatCount" ::: Ptr Word32) -> ("pSurfaceFormats" ::: Ptr VkSurfaceFormatKHR) -> IO VkResult
type PFN_vkGetPhysicalDeviceSurfaceFormatsKHR = FunPtr FN_vkGetPhysicalDeviceSurfaceFormatsKHR

-- | vkGetPhysicalDeviceSurfacePresentModesKHR - Query supported presentation
-- modes
--
-- = Parameters
--
-- -   @physicalDevice@ is the physical device that will be associated with
--     the swapchain to be created, as described for
--     'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.vkCreateSwapchainKHR'.
--
-- -   @surface@ is the surface that will be associated with the swapchain.
--
-- -   @pPresentModeCount@ is a pointer to an integer related to the number
--     of presentation modes available or queried, as described below.
--
-- -   @pPresentModes@ is either @NULL@ or a pointer to an array of
--     'VkPresentModeKHR' values, indicating the supported presentation
--     modes.
--
-- = Description
--
-- If @pPresentModes@ is @NULL@, then the number of presentation modes
-- supported for the given @surface@ is returned in @pPresentModeCount@.
-- Otherwise, @pPresentModeCount@ /must/ point to a variable set by the
-- user to the number of elements in the @pPresentModes@ array, and on
-- return the variable is overwritten with the number of values actually
-- written to @pPresentModes@. If the value of @pPresentModeCount@ is less
-- than the number of presentation modes supported, at most
-- @pPresentModeCount@ values will be written. If @pPresentModeCount@ is
-- smaller than the number of presentation modes supported for the given
-- @surface@, 'Graphics.Vulkan.C.Core10.Core.VK_INCOMPLETE' will be
-- returned instead of 'Graphics.Vulkan.C.Core10.Core.VK_SUCCESS' to
-- indicate that not all the available values were returned.
--
-- == Valid Usage (Implicit)
--
-- -   @physicalDevice@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDevice'
--     handle
--
-- -   @surface@ /must/ be a valid 'VkSurfaceKHR' handle
--
-- -   @pPresentModeCount@ /must/ be a valid pointer to a @uint32_t@ value
--
-- -   If the value referenced by @pPresentModeCount@ is not @0@, and
--     @pPresentModes@ is not @NULL@, @pPresentModes@ /must/ be a valid
--     pointer to an array of @pPresentModeCount@ 'VkPresentModeKHR' values
--
-- -   Both of @physicalDevice@, and @surface@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance'
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_SUCCESS'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_INCOMPLETE'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_OUT_OF_DEVICE_MEMORY'
--
--     -   'VK_ERROR_SURFACE_LOST_KHR'
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDevice',
-- 'VkPresentModeKHR', 'VkSurfaceKHR'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkGetPhysicalDeviceSurfacePresentModesKHR" vkGetPhysicalDeviceSurfacePresentModesKHR :: ("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pPresentModeCount" ::: Ptr Word32) -> ("pPresentModes" ::: Ptr VkPresentModeKHR) -> IO VkResult
#else
vkGetPhysicalDeviceSurfacePresentModesKHR :: InstanceCmds -> ("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pPresentModeCount" ::: Ptr Word32) -> ("pPresentModes" ::: Ptr VkPresentModeKHR) -> IO VkResult
vkGetPhysicalDeviceSurfacePresentModesKHR deviceCmds = mkVkGetPhysicalDeviceSurfacePresentModesKHR (pVkGetPhysicalDeviceSurfacePresentModesKHR deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceSurfacePresentModesKHR
  :: FunPtr (("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pPresentModeCount" ::: Ptr Word32) -> ("pPresentModes" ::: Ptr VkPresentModeKHR) -> IO VkResult) -> (("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pPresentModeCount" ::: Ptr Word32) -> ("pPresentModes" ::: Ptr VkPresentModeKHR) -> IO VkResult)
#endif

type FN_vkGetPhysicalDeviceSurfacePresentModesKHR = ("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pPresentModeCount" ::: Ptr Word32) -> ("pPresentModes" ::: Ptr VkPresentModeKHR) -> IO VkResult
type PFN_vkGetPhysicalDeviceSurfacePresentModesKHR = FunPtr FN_vkGetPhysicalDeviceSurfacePresentModesKHR

-- | vkGetPhysicalDeviceSurfaceSupportKHR - Query if presentation is
-- supported
--
-- = Parameters
--
-- -   @physicalDevice@ is the physical device.
--
-- -   @queueFamilyIndex@ is the queue family.
--
-- -   @surface@ is the surface.
--
-- -   @pSupported@ is a pointer to a
--     'Graphics.Vulkan.C.Core10.Core.VkBool32', which is set to
--     'Graphics.Vulkan.C.Core10.Core.VK_TRUE' to indicate support, and
--     'Graphics.Vulkan.C.Core10.Core.VK_FALSE' otherwise.
--
-- == Valid Usage
--
-- -   @queueFamilyIndex@ /must/ be less than @pQueueFamilyPropertyCount@
--     returned by
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.vkGetPhysicalDeviceQueueFamilyProperties'
--     for the given @physicalDevice@
--
-- == Valid Usage (Implicit)
--
-- -   @physicalDevice@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDevice'
--     handle
--
-- -   @surface@ /must/ be a valid 'VkSurfaceKHR' handle
--
-- -   @pSupported@ /must/ be a valid pointer to a
--     'Graphics.Vulkan.C.Core10.Core.VkBool32' value
--
-- -   Both of @physicalDevice@, and @surface@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance'
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
--     -   'VK_ERROR_SURFACE_LOST_KHR'
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Core.VkBool32',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDevice',
-- 'VkSurfaceKHR'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkGetPhysicalDeviceSurfaceSupportKHR" vkGetPhysicalDeviceSurfaceSupportKHR :: ("physicalDevice" ::: VkPhysicalDevice) -> ("queueFamilyIndex" ::: Word32) -> ("surface" ::: VkSurfaceKHR) -> ("pSupported" ::: Ptr VkBool32) -> IO VkResult
#else
vkGetPhysicalDeviceSurfaceSupportKHR :: InstanceCmds -> ("physicalDevice" ::: VkPhysicalDevice) -> ("queueFamilyIndex" ::: Word32) -> ("surface" ::: VkSurfaceKHR) -> ("pSupported" ::: Ptr VkBool32) -> IO VkResult
vkGetPhysicalDeviceSurfaceSupportKHR deviceCmds = mkVkGetPhysicalDeviceSurfaceSupportKHR (pVkGetPhysicalDeviceSurfaceSupportKHR deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceSurfaceSupportKHR
  :: FunPtr (("physicalDevice" ::: VkPhysicalDevice) -> ("queueFamilyIndex" ::: Word32) -> ("surface" ::: VkSurfaceKHR) -> ("pSupported" ::: Ptr VkBool32) -> IO VkResult) -> (("physicalDevice" ::: VkPhysicalDevice) -> ("queueFamilyIndex" ::: Word32) -> ("surface" ::: VkSurfaceKHR) -> ("pSupported" ::: Ptr VkBool32) -> IO VkResult)
#endif

type FN_vkGetPhysicalDeviceSurfaceSupportKHR = ("physicalDevice" ::: VkPhysicalDevice) -> ("queueFamilyIndex" ::: Word32) -> ("surface" ::: VkSurfaceKHR) -> ("pSupported" ::: Ptr VkBool32) -> IO VkResult
type PFN_vkGetPhysicalDeviceSurfaceSupportKHR = FunPtr FN_vkGetPhysicalDeviceSurfaceSupportKHR

-- No documentation found for Nested "VkResult" "VK_ERROR_NATIVE_WINDOW_IN_USE_KHR"
pattern VK_ERROR_NATIVE_WINDOW_IN_USE_KHR :: VkResult
pattern VK_ERROR_NATIVE_WINDOW_IN_USE_KHR = VkResult (-1000000001)

-- No documentation found for Nested "VkResult" "VK_ERROR_SURFACE_LOST_KHR"
pattern VK_ERROR_SURFACE_LOST_KHR :: VkResult
pattern VK_ERROR_SURFACE_LOST_KHR = VkResult (-1000000000)

-- No documentation found for TopLevel "VK_KHR_SURFACE_EXTENSION_NAME"
pattern VK_KHR_SURFACE_EXTENSION_NAME :: (Eq a, IsString a) => a
pattern VK_KHR_SURFACE_EXTENSION_NAME = "VK_KHR_surface"

-- No documentation found for TopLevel "VK_KHR_SURFACE_SPEC_VERSION"
pattern VK_KHR_SURFACE_SPEC_VERSION :: Integral a => a
pattern VK_KHR_SURFACE_SPEC_VERSION = 25

-- No documentation found for Nested "VkObjectType" "VK_OBJECT_TYPE_SURFACE_KHR"
pattern VK_OBJECT_TYPE_SURFACE_KHR :: VkObjectType
pattern VK_OBJECT_TYPE_SURFACE_KHR = VkObjectType 1000000000
