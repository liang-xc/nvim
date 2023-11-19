local theme = {
  fill = "lualine_c_normal",
  head = "lualine_b_normal",
  current_tab = "lualine_a_normal",
  tab = "lualine_b_normal",
  win = "lualine_b_normal",
  tail = "lualine_b_normal",
}

require("tabby.tabline").set(function(line)
  return {
    {
      { "  ", hl = theme.head },
      line.sep("", theme.head, theme.fill),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.tab
      return {
        line.sep("", hl, theme.fill),
        tab.is_current() and "" or "󰆣",
        tab.number(),
        tab.close_btn(""),
        line.sep("", hl, theme.fill),
        hl = hl,
        margin = " ",
      }
    end),
    line.spacer(),
    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      return {
        line.sep("", theme.win, theme.fill),
        win.is_current() and "" or "",
        win.buf_name(),
        line.sep("", theme.win, theme.fill),
        hl = theme.win,
        margin = " ",
      }
    end),
    {
      line.sep("", theme.tail, theme.fill),
      { "  ", hl = theme.tail },
    },
    hl = theme.fill,
  }
end)
