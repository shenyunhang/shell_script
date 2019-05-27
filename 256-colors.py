#!/usr/bin/python
"""Print a swatch using all 256 colors of 256-color-capable terminals."""

__author__ = "Marius Gedminas <marius@gedmin.as>"
__url__ = "https://gist.github.com/mgedmin/2762225"
__version__ = '2.0'


def hrun(start, width, padding=0):
    return [None] * padding + list(range(start, start + width)) + [None
                                                                   ] * padding


def vrun(start, width, height, padding=0):
    return [
        hrun(s, width, padding)
        for s in range(start, start + width * height, width)
    ]


layout = [
    vrun(0, 8, 2),  # 16 standard xterm colors
    vrun(16, 6, 6 * 6, 1),  # 6x6x6 color cube
    vrun(16 + 6 * 6 * 6, 8, 3),  # 24 grey levels
]


def fg_seq(color):
    return '\033[38;5;%dm' % color


def bg_seq(color):
    return '\033[48;5;%dm' % color


reset_seq = '\033[0m'


def color_bar(seq, color, trail):
    if color is None:
        return '%s    %s' % (reset_seq, trail)
    else:
        return '%s %03d%s' % (seq(color), color, trail)


def main():
    for block in layout:
        print("")
        for row in block:
            fg_bar = ''.join(color_bar(fg_seq, color, '') for color in row)
            bg_bar = ''.join(color_bar(bg_seq, color, ' ') for color in row)
            print('%s%s    %s%s' % (fg_bar, reset_seq, bg_bar, reset_seq))


if __name__ == '__main__':
    main()

    print("\033[0;37;40m Normal text\n")
    print("\033[2;37;40m Underlined text\033[0;37;40m \n")
    print("\033[1;37;40m Bright Colour\033[0;37;40m \n")
    print("\033[3;37;40m Negative Colour\033[0;37;40m \n")
    print("\033[5;37;40m Negative Colour\033[0;37;40m\n")

    print(
        "\033[1;37;40m \033[2;37:40m TextColour BlackBackground          TextColour GreyBackground                WhiteText ColouredBackground\033[0;37;40m\n"
    )
    print(
        "\033[1;30;40m Dark Gray      \033[0m 1;30;40m            \033[0;30;47m Black      \033[0m 0;30;47m               \033[0;37;41m Black      \033[0m 0;37;41m"
    )
    print(
        "\033[1;31;40m Bright Red     \033[0m 1;31;40m            \033[0;31;47m Red        \033[0m 0;31;47m               \033[0;37;42m Black      \033[0m 0;37;42m"
    )
    print(
        "\033[1;32;40m Bright Green   \033[0m 1;32;40m            \033[0;32;47m Green      \033[0m 0;32;47m               \033[0;37;43m Black      \033[0m 0;37;43m"
    )
    print(
        "\033[1;33;40m Yellow         \033[0m 1;33;40m            \033[0;33;47m Brown      \033[0m 0;33;47m               \033[0;37;44m Black      \033[0m 0;37;44m"
    )
    print(
        "\033[1;34;40m Bright Blue    \033[0m 1;34;40m            \033[0;34;47m Blue       \033[0m 0;34;47m               \033[0;37;45m Black      \033[0m 0;37;45m"
    )
    print(
        "\033[1;35;40m Bright Magenta \033[0m 1;35;40m            \033[0;35;47m Magenta    \033[0m 0;35;47m               \033[0;37;46m Black      \033[0m 0;37;46m"
    )
    print(
        "\033[1;36;40m Bright Cyan    \033[0m 1;36;40m            \033[0;36;47m Cyan       \033[0m 0;36;47m               \033[0;37;47m Black      \033[0m 0;37;47m"
    )
    print(
        "\033[1;37;40m White          \033[0m 1;37;40m            \033[0;37;40m Light Grey \033[0m 0;37;40m               \033[0;37;48m Black      \033[0m 0;37;48m"
    )
