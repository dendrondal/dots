import os
import socket
import subprocess

from libqtile import widget
from libqtile.bar import Bar, Gap, STRETCH
from libqtile.config import Screen
from libqtile.lazy import lazy

from colors import colors

myTerm = 'kitty'

widget_defaults = {
	'font': 'Iosevka Custom',
	'fontsize': 12,
	'padding': 0,
	'background': colors[0],
	'foreground': colors[2]
}


def icon_settings():
	return {
		'padding': 0,
		'fontsize': 28
	}

def left_arrow(color1, color2):
	return widget.TextBox(
		text = '\uE0B2',
		background = color1,
		foreground = color2,
		**icon_settings()
	)

def right_arrow(color1, color2):
	return widget.TextBox(
		text = '\uE0B0',
		background = color1,
		foreground = color2,
		**icon_settings()
	)

powerline = lambda fg="light", bg="dark": widget.TextBox(
    text="", # Icon: nf-oct-triangle_left
    fontsize=37,
    padding=-2
) 

def init_widget_list():
    widgets_list = [
              widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[2],
                       background = colors[0]
                       ),
              widget.GroupBox(
                       font = "PowerlineSymbols",
                       fontsize = 9,
                       margin_y = 3,
                       margin_x = 0,
                       padding_y = 5,
                       padding_x = 3,
                       borderwidth = 3,
                       active = colors[2],
                       inactive = colors[2],
                       rounded = False,
                       highlight_color = colors[1],
                       highlight_method = "line",
                       this_current_screen_border = colors[3],
                       this_screen_border = colors [4],
                       other_current_screen_border = colors[0],
                       other_screen_border = colors[0],
                       foreground = colors[2],
                       background = colors[0]
                       ),
              widget.Spacer(length=STRETCH),
              widget.Mpd2(),
              widget.Spacer(length=STRETCH),
              widget.Net(
                       format = '↓{down} ↑{up}',
                       foreground = colors[2],
                       background = colors[4],
                       padding = 5
                       ),
              widget.TextBox(
                       text = '',
                       background = colors[4],
                       foreground = colors[5],
                       padding = 0,
                       fontsize = 37
                       ),
              widget.TextBox(
                       text = '',
                       background = colors[5],
                       foreground = colors[4],
                       padding = 0,
                       fontsize = 37
                       ),
              widget.CurrentLayoutIcon(
                       custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                       foreground = colors[0],
                       background = colors[4],
                       padding = 0,
                       scale = 0.7
                       ),
              widget.CurrentLayout(
                       foreground = colors[2],
                       background = colors[4],
                       padding = 5
                       ),
              widget.TextBox(
                       text = '',
                       background = colors[4],
                       foreground = colors[5],
                       padding = 0,
                       fontsize = 37
                       ),
              widget.Clock(
                       foreground = colors[2],
                       background = colors[5],
                       format = "%A, %B %d  [ %H:%M ]"
                       ),
              widget.Sep(
                       linewidth = 0,
                       padding = 10,
                       foreground = colors[0],
                       background = colors[5]
                       ),
              widget.Systray(
                       background = colors[0],
                       padding = 5
                       ),
              ]
    return widgets_list



def init_screen(main: bool = False):
	gap = Gap(10)
	return Screen(
		bottom = gap,
		left = gap,
		right = gap,
		top = Bar(
			init_widget_list(),
			26,
			background = colors[0][0],
			opacity = .75,
			margin = [0, 0, 10, 0]
		)
	)

screens = [
	init_screen(True),
	init_screen()
]
