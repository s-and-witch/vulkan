{-# language Strict #-}
{-# language CPP #-}


module Graphics.Vulkan.Extensions.VK_AMD_shader_info
  ( ShaderInfoTypeAMD
  ) where




import {-# source #-} Graphics.Vulkan.C.Extensions.VK_AMD_shader_info
  ( VkShaderInfoTypeAMD
  )


-- | VkShaderInfoTypeAMD - Enum specifying which type of shader info to query
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Extensions.VK_AMD_shader_info.vkGetShaderInfoAMD'
type ShaderInfoTypeAMD = VkShaderInfoTypeAMD
