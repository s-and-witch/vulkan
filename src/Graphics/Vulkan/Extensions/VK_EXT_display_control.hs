{-# language Strict #-}
{-# language CPP #-}
{-# language PatternSynonyms #-}
{-# language DuplicateRecordFields #-}
{-# language TypeFamilies #-}

module Graphics.Vulkan.Extensions.VK_EXT_display_control
  ( withCStructDeviceEventInfoEXT
  , fromCStructDeviceEventInfoEXT
  , DeviceEventInfoEXT(..)
  , DeviceEventTypeEXT
  , pattern DEVICE_EVENT_TYPE_DISPLAY_HOTPLUG_EXT
  , withCStructDisplayEventInfoEXT
  , fromCStructDisplayEventInfoEXT
  , DisplayEventInfoEXT(..)
  , DisplayEventTypeEXT
  , pattern DISPLAY_EVENT_TYPE_FIRST_PIXEL_OUT_EXT
  , withCStructDisplayPowerInfoEXT
  , fromCStructDisplayPowerInfoEXT
  , DisplayPowerInfoEXT(..)
  , DisplayPowerStateEXT
  , pattern DISPLAY_POWER_STATE_OFF_EXT
  , pattern DISPLAY_POWER_STATE_SUSPEND_EXT
  , pattern DISPLAY_POWER_STATE_ON_EXT
  , withCStructSwapchainCounterCreateInfoEXT
  , fromCStructSwapchainCounterCreateInfoEXT
  , SwapchainCounterCreateInfoEXT(..)
  , displayPowerControlEXT
  , getSwapchainCounterEXT
  , registerDeviceEventEXT
  , registerDisplayEventEXT
  , pattern EXT_DISPLAY_CONTROL_EXTENSION_NAME
  , pattern EXT_DISPLAY_CONTROL_SPEC_VERSION
  , pattern STRUCTURE_TYPE_DISPLAY_POWER_INFO_EXT
  , pattern STRUCTURE_TYPE_DEVICE_EVENT_INFO_EXT
  , pattern STRUCTURE_TYPE_DISPLAY_EVENT_INFO_EXT
  , pattern STRUCTURE_TYPE_SWAPCHAIN_COUNTER_CREATE_INFO_EXT
  ) where

import Control.Exception
  ( throwIO
  )
import Control.Monad
  ( when
  )
import Data.String
  ( IsString
  )
import Data.Word
  ( Word64
  )
import Foreign.Marshal.Alloc
  ( alloca
  )
import Foreign.Marshal.Utils
  ( maybePeek
  , maybeWith
  , with
  )
import Foreign.Ptr
  ( castPtr
  )
import Foreign.Storable
  ( peek
  )


import Graphics.Vulkan.C.Core10.Core
  ( Zero(..)
  , pattern VK_SUCCESS
  )
import Graphics.Vulkan.C.Extensions.VK_EXT_display_control
  ( VkDeviceEventInfoEXT(..)
  , VkDeviceEventTypeEXT(..)
  , VkDisplayEventInfoEXT(..)
  , VkDisplayEventTypeEXT(..)
  , VkDisplayPowerInfoEXT(..)
  , VkDisplayPowerStateEXT(..)
  , VkSwapchainCounterCreateInfoEXT(..)
  , vkDisplayPowerControlEXT
  , vkGetSwapchainCounterEXT
  , vkRegisterDeviceEventEXT
  , vkRegisterDisplayEventEXT
  , pattern VK_DEVICE_EVENT_TYPE_DISPLAY_HOTPLUG_EXT
  , pattern VK_DISPLAY_EVENT_TYPE_FIRST_PIXEL_OUT_EXT
  , pattern VK_DISPLAY_POWER_STATE_OFF_EXT
  , pattern VK_DISPLAY_POWER_STATE_ON_EXT
  , pattern VK_DISPLAY_POWER_STATE_SUSPEND_EXT
  , pattern VK_EXT_DISPLAY_CONTROL_EXTENSION_NAME
  , pattern VK_EXT_DISPLAY_CONTROL_SPEC_VERSION
  , pattern VK_STRUCTURE_TYPE_DEVICE_EVENT_INFO_EXT
  , pattern VK_STRUCTURE_TYPE_DISPLAY_EVENT_INFO_EXT
  , pattern VK_STRUCTURE_TYPE_DISPLAY_POWER_INFO_EXT
  , pattern VK_STRUCTURE_TYPE_SWAPCHAIN_COUNTER_CREATE_INFO_EXT
  )
import Graphics.Vulkan.Core10.DeviceInitialization
  ( AllocationCallbacks(..)
  , Device(..)
  , withCStructAllocationCallbacks
  )
import Graphics.Vulkan.Core10.Queue
  ( Fence
  )
import Graphics.Vulkan.Exception
  ( VulkanException(..)
  )
import Graphics.Vulkan.Extensions.VK_EXT_display_surface_counter
  ( SurfaceCounterFlagBitsEXT
  , SurfaceCounterFlagsEXT
  )
import Graphics.Vulkan.Extensions.VK_KHR_display
  ( DisplayKHR
  )
import Graphics.Vulkan.Extensions.VK_KHR_swapchain
  ( SwapchainKHR
  )
import {-# source #-} Graphics.Vulkan.Marshal.SomeVkStruct
  ( SomeVkStruct
  , peekVkStruct
  , withSomeVkStruct
  )
import Graphics.Vulkan.Core10.Core
  ( pattern STRUCTURE_TYPE_DEVICE_EVENT_INFO_EXT
  , pattern STRUCTURE_TYPE_DISPLAY_EVENT_INFO_EXT
  , pattern STRUCTURE_TYPE_DISPLAY_POWER_INFO_EXT
  , pattern STRUCTURE_TYPE_SWAPCHAIN_COUNTER_CREATE_INFO_EXT
  )



-- | VkDeviceEventInfoEXT - Describe a device event to create
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VkDeviceEventTypeEXT',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.vkRegisterDeviceEventEXT'
data DeviceEventInfoEXT = DeviceEventInfoEXT
  { -- Univalued member elided
  -- No documentation found for Nested "DeviceEventInfoEXT" "pNext"
  next :: Maybe SomeVkStruct
  , -- No documentation found for Nested "DeviceEventInfoEXT" "deviceEvent"
  deviceEvent :: DeviceEventTypeEXT
  }
  deriving (Show, Eq)

-- | A function to temporarily allocate memory for a 'VkDeviceEventInfoEXT' and
-- marshal a 'DeviceEventInfoEXT' into it. The 'VkDeviceEventInfoEXT' is only valid inside
-- the provided computation and must not be returned out of it.
withCStructDeviceEventInfoEXT :: DeviceEventInfoEXT -> (VkDeviceEventInfoEXT -> IO a) -> IO a
withCStructDeviceEventInfoEXT marshalled cont = maybeWith withSomeVkStruct (next (marshalled :: DeviceEventInfoEXT)) (\pPNext -> cont (VkDeviceEventInfoEXT VK_STRUCTURE_TYPE_DEVICE_EVENT_INFO_EXT pPNext (deviceEvent (marshalled :: DeviceEventInfoEXT))))

-- | A function to read a 'VkDeviceEventInfoEXT' and all additional
-- structures in the pointer chain into a 'DeviceEventInfoEXT'.
fromCStructDeviceEventInfoEXT :: VkDeviceEventInfoEXT -> IO DeviceEventInfoEXT
fromCStructDeviceEventInfoEXT c = DeviceEventInfoEXT <$> -- Univalued Member elided
                                                     maybePeek peekVkStruct (castPtr (vkPNext (c :: VkDeviceEventInfoEXT)))
                                                     <*> pure (vkDeviceEvent (c :: VkDeviceEventInfoEXT))

instance Zero DeviceEventInfoEXT where
  zero = DeviceEventInfoEXT Nothing
                            zero


-- | VkDeviceEventTypeEXT - Events that can occur on a device object
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VkDeviceEventInfoEXT'
type DeviceEventTypeEXT = VkDeviceEventTypeEXT


{-# complete DEVICE_EVENT_TYPE_DISPLAY_HOTPLUG_EXT :: DeviceEventTypeEXT #-}


-- | 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VK_DEVICE_EVENT_TYPE_DISPLAY_HOTPLUG_EXT'
-- specifies that the fence is signaled when a display is plugged into or
-- unplugged from the specified device. Applications /can/ use this
-- notification to determine when they need to re-enumerate the available
-- displays on a device.
pattern DEVICE_EVENT_TYPE_DISPLAY_HOTPLUG_EXT :: (a ~ DeviceEventTypeEXT) => a
pattern DEVICE_EVENT_TYPE_DISPLAY_HOTPLUG_EXT = VK_DEVICE_EVENT_TYPE_DISPLAY_HOTPLUG_EXT


-- | VkDisplayEventInfoEXT - Describe a display event to create
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VkDisplayEventTypeEXT',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.vkRegisterDisplayEventEXT'
data DisplayEventInfoEXT = DisplayEventInfoEXT
  { -- Univalued member elided
  -- No documentation found for Nested "DisplayEventInfoEXT" "pNext"
  next :: Maybe SomeVkStruct
  , -- No documentation found for Nested "DisplayEventInfoEXT" "displayEvent"
  displayEvent :: DisplayEventTypeEXT
  }
  deriving (Show, Eq)

-- | A function to temporarily allocate memory for a 'VkDisplayEventInfoEXT' and
-- marshal a 'DisplayEventInfoEXT' into it. The 'VkDisplayEventInfoEXT' is only valid inside
-- the provided computation and must not be returned out of it.
withCStructDisplayEventInfoEXT :: DisplayEventInfoEXT -> (VkDisplayEventInfoEXT -> IO a) -> IO a
withCStructDisplayEventInfoEXT marshalled cont = maybeWith withSomeVkStruct (next (marshalled :: DisplayEventInfoEXT)) (\pPNext -> cont (VkDisplayEventInfoEXT VK_STRUCTURE_TYPE_DISPLAY_EVENT_INFO_EXT pPNext (displayEvent (marshalled :: DisplayEventInfoEXT))))

-- | A function to read a 'VkDisplayEventInfoEXT' and all additional
-- structures in the pointer chain into a 'DisplayEventInfoEXT'.
fromCStructDisplayEventInfoEXT :: VkDisplayEventInfoEXT -> IO DisplayEventInfoEXT
fromCStructDisplayEventInfoEXT c = DisplayEventInfoEXT <$> -- Univalued Member elided
                                                       maybePeek peekVkStruct (castPtr (vkPNext (c :: VkDisplayEventInfoEXT)))
                                                       <*> pure (vkDisplayEvent (c :: VkDisplayEventInfoEXT))

instance Zero DisplayEventInfoEXT where
  zero = DisplayEventInfoEXT Nothing
                             zero


-- | VkDisplayEventTypeEXT - Events that can occur on a display object
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VkDisplayEventInfoEXT'
type DisplayEventTypeEXT = VkDisplayEventTypeEXT


{-# complete DISPLAY_EVENT_TYPE_FIRST_PIXEL_OUT_EXT :: DisplayEventTypeEXT #-}


-- | 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VK_DISPLAY_EVENT_TYPE_FIRST_PIXEL_OUT_EXT'
-- specifies that the fence is signaled when the first pixel of the next
-- display refresh cycle leaves the display engine for the display.
pattern DISPLAY_EVENT_TYPE_FIRST_PIXEL_OUT_EXT :: (a ~ DisplayEventTypeEXT) => a
pattern DISPLAY_EVENT_TYPE_FIRST_PIXEL_OUT_EXT = VK_DISPLAY_EVENT_TYPE_FIRST_PIXEL_OUT_EXT


-- | VkDisplayPowerInfoEXT - Describe the power state of a display
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VkDisplayPowerStateEXT',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.vkDisplayPowerControlEXT'
data DisplayPowerInfoEXT = DisplayPowerInfoEXT
  { -- Univalued member elided
  -- No documentation found for Nested "DisplayPowerInfoEXT" "pNext"
  next :: Maybe SomeVkStruct
  , -- No documentation found for Nested "DisplayPowerInfoEXT" "powerState"
  powerState :: DisplayPowerStateEXT
  }
  deriving (Show, Eq)

-- | A function to temporarily allocate memory for a 'VkDisplayPowerInfoEXT' and
-- marshal a 'DisplayPowerInfoEXT' into it. The 'VkDisplayPowerInfoEXT' is only valid inside
-- the provided computation and must not be returned out of it.
withCStructDisplayPowerInfoEXT :: DisplayPowerInfoEXT -> (VkDisplayPowerInfoEXT -> IO a) -> IO a
withCStructDisplayPowerInfoEXT marshalled cont = maybeWith withSomeVkStruct (next (marshalled :: DisplayPowerInfoEXT)) (\pPNext -> cont (VkDisplayPowerInfoEXT VK_STRUCTURE_TYPE_DISPLAY_POWER_INFO_EXT pPNext (powerState (marshalled :: DisplayPowerInfoEXT))))

-- | A function to read a 'VkDisplayPowerInfoEXT' and all additional
-- structures in the pointer chain into a 'DisplayPowerInfoEXT'.
fromCStructDisplayPowerInfoEXT :: VkDisplayPowerInfoEXT -> IO DisplayPowerInfoEXT
fromCStructDisplayPowerInfoEXT c = DisplayPowerInfoEXT <$> -- Univalued Member elided
                                                       maybePeek peekVkStruct (castPtr (vkPNext (c :: VkDisplayPowerInfoEXT)))
                                                       <*> pure (vkPowerState (c :: VkDisplayPowerInfoEXT))

instance Zero DisplayPowerInfoEXT where
  zero = DisplayPowerInfoEXT Nothing
                             zero


-- | VkDisplayPowerStateEXT - Possible power states for a display
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VkDisplayPowerInfoEXT'
type DisplayPowerStateEXT = VkDisplayPowerStateEXT


{-# complete DISPLAY_POWER_STATE_OFF_EXT, DISPLAY_POWER_STATE_SUSPEND_EXT, DISPLAY_POWER_STATE_ON_EXT :: DisplayPowerStateEXT #-}


-- | 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VK_DISPLAY_POWER_STATE_OFF_EXT'
-- specifies that the display is powered down.
pattern DISPLAY_POWER_STATE_OFF_EXT :: (a ~ DisplayPowerStateEXT) => a
pattern DISPLAY_POWER_STATE_OFF_EXT = VK_DISPLAY_POWER_STATE_OFF_EXT


-- | 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VK_DISPLAY_POWER_STATE_SUSPEND_EXT'
-- specifies that the display is put into a low power mode, from which it
-- /may/ be able to transition back to
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VK_DISPLAY_POWER_STATE_ON_EXT'
-- more quickly than if it were in
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VK_DISPLAY_POWER_STATE_OFF_EXT'.
-- This state /may/ be the same as
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VK_DISPLAY_POWER_STATE_OFF_EXT'.
pattern DISPLAY_POWER_STATE_SUSPEND_EXT :: (a ~ DisplayPowerStateEXT) => a
pattern DISPLAY_POWER_STATE_SUSPEND_EXT = VK_DISPLAY_POWER_STATE_SUSPEND_EXT


-- | 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VK_DISPLAY_POWER_STATE_ON_EXT'
-- specifies that the display is powered on.
pattern DISPLAY_POWER_STATE_ON_EXT :: (a ~ DisplayPowerStateEXT) => a
pattern DISPLAY_POWER_STATE_ON_EXT = VK_DISPLAY_POWER_STATE_ON_EXT


-- | VkSwapchainCounterCreateInfoEXT - Specify the surface counters desired
--
-- == Valid Usage
--
-- -   The bits in @surfaceCounters@ /must/ be supported by
--     'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.VkSwapchainCreateInfoKHR'::@surface@,
--     as reported by
--     'Graphics.Vulkan.C.Extensions.VK_EXT_display_surface_counter.vkGetPhysicalDeviceSurfaceCapabilities2EXT'.
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VK_STRUCTURE_TYPE_SWAPCHAIN_COUNTER_CREATE_INFO_EXT'
--
-- -   @surfaceCounters@ /must/ be a valid combination of
--     'Graphics.Vulkan.C.Extensions.VK_EXT_display_surface_counter.VkSurfaceCounterFlagBitsEXT'
--     values
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_surface_counter.VkSurfaceCounterFlagsEXT'
data SwapchainCounterCreateInfoEXT = SwapchainCounterCreateInfoEXT
  { -- Univalued member elided
  -- No documentation found for Nested "SwapchainCounterCreateInfoEXT" "pNext"
  next :: Maybe SomeVkStruct
  , -- No documentation found for Nested "SwapchainCounterCreateInfoEXT" "surfaceCounters"
  surfaceCounters :: SurfaceCounterFlagsEXT
  }
  deriving (Show, Eq)

-- | A function to temporarily allocate memory for a 'VkSwapchainCounterCreateInfoEXT' and
-- marshal a 'SwapchainCounterCreateInfoEXT' into it. The 'VkSwapchainCounterCreateInfoEXT' is only valid inside
-- the provided computation and must not be returned out of it.
withCStructSwapchainCounterCreateInfoEXT :: SwapchainCounterCreateInfoEXT -> (VkSwapchainCounterCreateInfoEXT -> IO a) -> IO a
withCStructSwapchainCounterCreateInfoEXT marshalled cont = maybeWith withSomeVkStruct (next (marshalled :: SwapchainCounterCreateInfoEXT)) (\pPNext -> cont (VkSwapchainCounterCreateInfoEXT VK_STRUCTURE_TYPE_SWAPCHAIN_COUNTER_CREATE_INFO_EXT pPNext (surfaceCounters (marshalled :: SwapchainCounterCreateInfoEXT))))

-- | A function to read a 'VkSwapchainCounterCreateInfoEXT' and all additional
-- structures in the pointer chain into a 'SwapchainCounterCreateInfoEXT'.
fromCStructSwapchainCounterCreateInfoEXT :: VkSwapchainCounterCreateInfoEXT -> IO SwapchainCounterCreateInfoEXT
fromCStructSwapchainCounterCreateInfoEXT c = SwapchainCounterCreateInfoEXT <$> -- Univalued Member elided
                                                                           maybePeek peekVkStruct (castPtr (vkPNext (c :: VkSwapchainCounterCreateInfoEXT)))
                                                                           <*> pure (vkSurfaceCounters (c :: VkSwapchainCounterCreateInfoEXT))

instance Zero SwapchainCounterCreateInfoEXT where
  zero = SwapchainCounterCreateInfoEXT Nothing
                                       zero



-- | vkDisplayPowerControlEXT - Set the power state of a display
--
-- = Parameters
--
-- -   @device@ is a logical device associated with @display@.
--
-- -   @display@ is the display whose power state is modified.
--
-- -   @pDisplayPowerInfo@ is an instance of
--     'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VkDisplayPowerInfoEXT'
--     specifying the new power state of @display@.
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_SUCCESS'
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_display.VkDisplayKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VkDisplayPowerInfoEXT'
displayPowerControlEXT :: Device ->  DisplayKHR ->  DisplayPowerInfoEXT ->  IO ()
displayPowerControlEXT = \(Device device' commandTable) -> \display' -> \displayPowerInfo' -> (\marshalled -> withCStructDisplayPowerInfoEXT marshalled . flip with) displayPowerInfo' (\pDisplayPowerInfo' -> vkDisplayPowerControlEXT commandTable device' display' pDisplayPowerInfo' >>= (\ret -> when (ret < VK_SUCCESS) (throwIO (VulkanException ret)) *> (pure ())))


-- | vkGetSwapchainCounterEXT - Query the current value of a surface counter
--
-- = Parameters
--
-- -   @device@ is the
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' associated
--     with @swapchain@.
--
-- -   @swapchain@ is the swapchain from which to query the counter value.
--
-- -   @counter@ is the counter to query.
--
-- -   @pCounterValue@ will return the current value of the counter.
--
-- = Description
--
-- If a counter is not available because the swapchain is out of date, the
-- implementation /may/ return
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.VK_ERROR_OUT_OF_DATE_KHR'.
--
-- == Valid Usage
--
-- -   One or more present commands on @swapchain@ /must/ have been
--     processed by the presentation engine.
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' handle
--
-- -   @swapchain@ /must/ be a valid
--     'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.VkSwapchainKHR'
--     handle
--
-- -   @counter@ /must/ be a valid
--     'Graphics.Vulkan.C.Extensions.VK_EXT_display_surface_counter.VkSurfaceCounterFlagBitsEXT'
--     value
--
-- -   @pCounterValue@ /must/ be a valid pointer to a @uint64_t@ value
--
-- -   Both of @device@, and @swapchain@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance'
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_DEVICE_LOST'
--
--     -   'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.VK_ERROR_OUT_OF_DATE_KHR'
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_surface_counter.VkSurfaceCounterFlagBitsEXT',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.VkSwapchainKHR'
getSwapchainCounterEXT :: Device ->  SwapchainKHR ->  SurfaceCounterFlagBitsEXT ->  IO (Word64)
getSwapchainCounterEXT = \(Device device' commandTable) -> \swapchain' -> \counter' -> alloca (\pCounterValue' -> vkGetSwapchainCounterEXT commandTable device' swapchain' counter' pCounterValue' >>= (\ret -> when (ret < VK_SUCCESS) (throwIO (VulkanException ret)) *> (peek pCounterValue')))


-- | vkRegisterDeviceEventEXT - Signal a fence when a device event occurs
--
-- = Parameters
--
-- -   @device@ is a logical device on which the event /may/ occur.
--
-- -   @pDeviceEventInfo@ is a pointer to an instance of the
--     'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VkDeviceEventInfoEXT'
--     structure describing the event of interest to the application.
--
-- -   @pAllocator@ controls host memory allocation as described in the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#memory-allocation Memory Allocation>
--     chapter.
--
-- -   @pFence@ points to a handle in which the resulting fence object is
--     returned.
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' handle
--
-- -   @pDeviceEventInfo@ /must/ be a valid pointer to a valid
--     'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VkDeviceEventInfoEXT'
--     structure
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     structure
--
-- -   @pFence@ /must/ be a valid pointer to a
--     'Graphics.Vulkan.C.Core10.Queue.VkFence' handle
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_SUCCESS'
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VkDeviceEventInfoEXT',
-- 'Graphics.Vulkan.C.Core10.Queue.VkFence'
registerDeviceEventEXT :: Device ->  DeviceEventInfoEXT ->  Maybe AllocationCallbacks ->  IO (Fence)
registerDeviceEventEXT = \(Device device' commandTable) -> \deviceEventInfo' -> \allocator -> alloca (\pFence' -> maybeWith (\marshalled -> withCStructAllocationCallbacks marshalled . flip with) allocator (\pAllocator -> (\marshalled -> withCStructDeviceEventInfoEXT marshalled . flip with) deviceEventInfo' (\pDeviceEventInfo' -> vkRegisterDeviceEventEXT commandTable device' pDeviceEventInfo' pAllocator pFence' >>= (\ret -> when (ret < VK_SUCCESS) (throwIO (VulkanException ret)) *> (peek pFence')))))


-- | vkRegisterDisplayEventEXT - Signal a fence when a display event occurs
--
-- = Parameters
--
-- -   @device@ is a logical device associated with @display@
--
-- -   @display@ is the display on which the event /may/ occur.
--
-- -   @pDisplayEventInfo@ is a pointer to an instance of the
--     'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VkDisplayEventInfoEXT'
--     structure describing the event of interest to the application.
--
-- -   @pAllocator@ controls host memory allocation as described in the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#memory-allocation Memory Allocation>
--     chapter.
--
-- -   @pFence@ points to a handle in which the resulting fence object is
--     returned.
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice' handle
--
-- -   @display@ /must/ be a valid
--     'Graphics.Vulkan.C.Extensions.VK_KHR_display.VkDisplayKHR' handle
--
-- -   @pDisplayEventInfo@ /must/ be a valid pointer to a valid
--     'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VkDisplayEventInfoEXT'
--     structure
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     structure
--
-- -   @pFence@ /must/ be a valid pointer to a
--     'Graphics.Vulkan.C.Core10.Queue.VkFence' handle
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_SUCCESS'
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkDevice',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_display_control.VkDisplayEventInfoEXT',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_display.VkDisplayKHR',
-- 'Graphics.Vulkan.C.Core10.Queue.VkFence'
registerDisplayEventEXT :: Device ->  DisplayKHR ->  DisplayEventInfoEXT ->  Maybe AllocationCallbacks ->  IO (Fence)
registerDisplayEventEXT = \(Device device' commandTable) -> \display' -> \displayEventInfo' -> \allocator -> alloca (\pFence' -> maybeWith (\marshalled -> withCStructAllocationCallbacks marshalled . flip with) allocator (\pAllocator -> (\marshalled -> withCStructDisplayEventInfoEXT marshalled . flip with) displayEventInfo' (\pDisplayEventInfo' -> vkRegisterDisplayEventEXT commandTable device' display' pDisplayEventInfo' pAllocator pFence' >>= (\ret -> when (ret < VK_SUCCESS) (throwIO (VulkanException ret)) *> (peek pFence')))))

-- No documentation found for TopLevel "VK_EXT_DISPLAY_CONTROL_EXTENSION_NAME"
pattern EXT_DISPLAY_CONTROL_EXTENSION_NAME :: (Eq a, IsString a) => a
pattern EXT_DISPLAY_CONTROL_EXTENSION_NAME = VK_EXT_DISPLAY_CONTROL_EXTENSION_NAME

-- No documentation found for TopLevel "VK_EXT_DISPLAY_CONTROL_SPEC_VERSION"
pattern EXT_DISPLAY_CONTROL_SPEC_VERSION :: Integral a => a
pattern EXT_DISPLAY_CONTROL_SPEC_VERSION = VK_EXT_DISPLAY_CONTROL_SPEC_VERSION
