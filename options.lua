if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.o.guifont = "Monofur NF,Monofur Nerd Font,Hack NF:h12"
  vim.g.neovide_scroll_animation_length = 1.5
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_refresh_rate = 75
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_no_idle = false
  vim.g.neovide_fullscreen = false
  vim.g.neovide_remember_window_size = true

  vim.g.neovide_cursor_animation_length = 0.13
  vim.g.neovide_cursor_trail_size = 0.35
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_cursor_unfocused_outline_width = 0.125

  -- "railgun", "torpedo", "pixiedust", "sonicboom", "ripple", "wireframe"
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_vfx_opacity = 200.0         -- Sets the transparency of the generated particles.
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2 -- Sets the amount of time the generated particles should survive.
  vim.g.neovide_cursor_vfx_particle_density = 7.0  -- Sets the number of generated particles.
  vim.g.neovide_cursor_vfx_particle_speed = 10.0   -- Sets the speed of particle movement.
  vim.g.neovide_cursor_vfx_particle_phase = 1.5    -- Only for the railgun vfx mode.
  vim.g.neovide_cursor_vfx_particle_curl = 1.0     -- Only for the railgun vfx mode.
end

-- disable mouse
vim.opt.mouse = ""
return {
  opt = {
    mouse = ""
  }
}
